Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D2D25634
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 03:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180707; cv=none; b=hMJu71lh62hOsSgnFk4G/Y8shyEBtlTtjkiojcnGJmKKTdUhGiCwmBjbQ4sXIiHDtINxNAjd/q0gkCLajiMFsCbgZ7PGyL8EFkAvz4a9CBeytw86vTyULGHH4JPEVjzj9iwa0zuMH4bmc6i22LsNn/iqtQR5jTYPMEaAE0CRPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180707; c=relaxed/simple;
	bh=tBWBQE8HpIVxEM5ccFjyfDv7HEXOnZryVAg4L2+2jpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bpihFloa13rOOunqEKCX6yVGFK5S9eiO4SHXRXAIb/uepIFkmoIlBgpEupJNK+jOEXBlGpUwhljeaQCD6yyDGgiLye1XhkqWrfzFrvKFfL2t3iVnScFbeOu1KTC+m90KI+YHUvuZriD0At/bEfk6RFdwedZOe0CjKEgTQP/wctA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pdn2Eod9; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pdn2Eod9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742180701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Gbw6EKbf2YDxk0S0ZIvcC7DhAFGYFGm30Q2QhYZ0bQ=;
	b=Pdn2Eod9REoIp2XQsoSuEg+GQZcCmherQGIQ029OAGNm0onEZZ+2hIVvF/w+/Ijvfmj5f3
	VfD8FcNWrplk+I/ZU8XRTElqFLadAmytmqu49hOS1gYv+SgiE2CfgPxJzED6Zrx0rGvoQ/
	QnEbjcSkQZMHVrrW+u13QTx/s9tPRRQ=
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
Subject: [PATCH v2] rust: optimize rust symbol generation for SeqFile
Date: Mon, 17 Mar 2025 11:04:18 +0800
Message-ID: <20250317030418.2371265-1-kunwu.chan@linux.dev>
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

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

---
Changes in v2:
 - Add link and Suggested-by
 - Reword commit msg
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

