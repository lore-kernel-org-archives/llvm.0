Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F714C5AF
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 02:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742179940; cv=none; b=S4T4DfvbC0fbukvCZpdx79RR9Tm4P2wdzEhvDTO4EbpHgmuuEeO8zQEZ6C6a1ykFY1ra28UD+5JCmOSr1Prcs1LGKNdeRnUmw46sFhyA/fw+DTlupNSk3lRADyrynLjt/bGfOspSI0OXYq+fzn1kNeAySl0Am5II3PRNTV/XlEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742179940; c=relaxed/simple;
	bh=4pNYgUd572qVLUQmKAyBjPckL2jfLJd2VnoIlYSwXh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JE7gNyQGvoPHWQdxNTERUXc1TcHVnsnSHQqdXgWITOuYruxI/vw8vbvQ/Gyia2TAKmXXQZ8zDyvdEGabNuqruNsFv6uZHc4U5hG5j1bb4SzNPI7krlJwGzYpztBYElieK4HEfFPly/7Wo9q0znrFYYU+ZxYi/UpjsMjBxx8zkZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cQ4PkSG0; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cQ4PkSG0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742179933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E4ivVxzbgHS/z19TDHgdNYB0TyoBcztNZN1mrOul37U=;
	b=cQ4PkSG0gL+dL0s6pqllMEikAA10584dZYitxzh+hpiZWWEuMmygHt7hgLIMxaEOzBJxBX
	aUchyi2Lu7Ys2ZD9Th3EamholPnLYcZfiAfT9273oIPLHGUv9R9NWeZ7Z+OO/7SoWurb9u
	GB+HntB5VcEcKfvARkhAtJ/n/L4cBOA=
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
Subject: [PATCH v2] rust: sync: optimize Rust symbol generation for PollCondVar
Date: Mon, 17 Mar 2025 10:52:05 +0800
Message-ID: <20250317025205.2366518-1-kunwu.chan@linux.dev>
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

$nm vmlinux | grep ' _R'.*PollCondVar  | rustfilt
... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
... T <kernel::sync::poll::PollCondVar as kernel::init::PinnedDrop>::drop
... T <kernel::sync::poll::PollCondVar as core::ops::drop::Drop>::drop

This Rust symbol
(<kernel::sync::poll::PollCondVar as kernel::init::PinnedDrop>::drop)
is trivial wrappers around the C functions __wake_up_pollfree
and synchronize_rcu. It doesn't make sense to go through a trivial
wrapper for its functions,so mark it inline.

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
 rust/kernel/sync/poll.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index d5f17153b424..a4f92c545fec 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -107,6 +107,7 @@ fn deref(&self) -> &CondVar {
 
 #[pinned_drop]
 impl PinnedDrop for PollCondVar {
+    #[inline]
     fn drop(self: Pin<&mut Self>) {
         // Clear anything registered using `register_wait`.
         //
-- 
2.43.0

