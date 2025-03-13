Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19461C1F0C
	for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741859539; cv=none; b=JK624fMI3SL1P/hdPRu4ydfvmae/5zzE5QW+tKpJqggwzppTOHyE78DOes6IfYW6u6rFiLZJJkRcbH3YSE/BaQm/td7TQGlSDfeJUuJ8xaIofi2VS0aRzO12WbStJJ6wwLywiY24MovYQLntSpzaMLfoYrlb/TrHC2joHDckx8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741859539; c=relaxed/simple;
	bh=RImN1egxLchm1OT4LIp3YQNEJIdkxcWAKbh1WlvMwro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NZWtgP3DSMc2eIE2hfkmYN0bgxZm7fUH5tFAiIYuyr6QqDHNtke/yE+OxUN4MSz+wEC4r1E3GqcB5IYqW3M6351i6QRKgRFizjBbwOJlTh7LClgYL6pgatX8unXfZekfQG7l+ik0d/8qRfoWznXtpQJwTdFTJzswvSAQElhilVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=USXOlYhG; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="USXOlYhG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741859525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TM8qKG71XU2PpI8GcJlKeLnN9Dz9qQxF9PPdUnLxAQ4=;
	b=USXOlYhG8LNwCtDKk+I7M2S0G3tn39sxx2ppKNtg3HxS5AfvC49bqJNgf/iDT/zluxuTTx
	/eZnn2FotMOW13djKC7p5kBVr6ww1kO3zWsbo7T1psBnxZPUMjUTlKigrlUIPKSNhnpj72
	W+K04HUgkMnwRJtXvrgJGozCnk2o+UQ=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Kunwu Chan <kunwu.chan@hotmail.com>,
	Grace Deng <Grace.Deng006@Gmail.com>
Subject: [PATCH] rust: optimize rust symbol generation for SeqFile
Date: Thu, 13 Mar 2025 17:51:19 +0800
Message-ID: <20250313095120.820334-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Kunwu Chan <kunwu.chan@hotmail.com>

When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
with ARCH=arm64, the following symbols are generated:

$nm vmlinux | grep ' _R'.*SeqFile | rustfilt
ffff8000805b78ac T <kernel::seq_file::SeqFile>::call_printf

This Rust symbol is trivial wrappers around the C functions seq_printf.
It doesn't make sense to go through a trivial wrapper for its functions,
so mark it inline.

After doing so, the above symbol will not in output.

Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
---
 rust/kernel/seq_file.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 04947c672979..efc4dd09850a 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -30,6 +30,7 @@ pub unsafe fn from_raw<'a>(ptr: *mut bindings::seq_file) -> &'a SeqFile {
     }
 
     /// Used by the [`seq_print`] macro.
+    #[inline]
     pub fn call_printf(&self, args: core::fmt::Arguments<'_>) {
         // SAFETY: Passing a void pointer to `Arguments` is valid for `%pA`.
         unsafe {
-- 
2.43.0

