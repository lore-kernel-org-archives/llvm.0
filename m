Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3742189BB5
	for <llvm@lists.linux.dev>; Mon, 24 Mar 2025 06:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742797163; cv=none; b=e/iN5yVjj47btwaNiDg+LZjcGNNM+lkZ+xjMjju1VzOA5q1onqyJjqoIlXBA5v6iK1W7H+pOc/ELLGxdx5p4mGfw4PF3J/ELErQDo4hnD241NmwrDqN5e/ePPt2+G/K/eIRuUPh50cXN6wY8sHdlJczvQ5iNgQ6su/DSKfwL7IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742797163; c=relaxed/simple;
	bh=EmIz2lLWZAsWPVRdqglI5WF3ic5iH2SgqlIBROEY68o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WKsQfvv+gh/jw6d7pICynDTdKuKUkX3e2Rn54aNREtf+I6n6A4Bv3xhsvgrVnYTZ5A0wDOuXNZEgx/mR8lFGQycSP84LlEwhRPzAnTCXZIYJiFpFJK2ftnl4/+ar6f7tlcw4m9J2uVoxzjaI4+22oGd3Ap5K1hBy/T6mnjEfJGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wdSu9NA2; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wdSu9NA2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742797158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TvhJEaWvDoaTAezZAcDpCCpB9iCGHWPgiSVGgqYu6Jw=;
	b=wdSu9NA2wq9kblJR8pfDVQKz92XQlXP6gCDG2m2E9Tp/aF6Mt81S11Rdsa3vEkaxu/E18b
	qSQBerdoesC6V1NVZ+A199MCDebZaqphngOYA6/uUtxKyPqy2VHgFbNYVb9ExakOonKMb/
	K//b+D2JBF2kziIGsisiO5RjgCyHZto=
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
Subject: [PATCH v2] rust: sync: optimize rust symbol generation for CondVar
Date: Mon, 24 Mar 2025 14:18:34 +0800
Message-ID: <20250324061835.1693125-1-kunwu.chan@linux.dev>
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

$nm vmlinux | grep ' _R'.*CondVar | rustfilt
... T <kernel::sync::condvar::CondVar>::notify_all
... T <kernel::sync::condvar::CondVar>::notify_one
... T <kernel::sync::condvar::CondVar>::notify_sync
... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
... T <kernel::sync::poll::PollCondVar as core::ops::drop::Drop>::drop

These notify_* symbols are trivial wrappers around the C functions
__wake_up and __wake_up_sync. It doesn't make sense to go through
a trivial wrapper for these functions, so mark them inline.

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

---
Changes in v2:
- Remove '#[inline]' for notify()
- Reword commit msg
- v1 link: https://lore.kernel.org/rust-for-linux/01c67d96-6477-4851-81ae-0cbee3b9e893@linux.dev
---
 rust/kernel/sync/condvar.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index caebf03f553b..c6ec64295c9f 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -216,6 +216,7 @@ fn notify(&self, count: c_int) {
     /// This method behaves like `notify_one`, except that it hints to the scheduler that the
     /// current thread is about to go to sleep, so it should schedule the target thread on the same
     /// CPU.
+    #[inline]
     pub fn notify_sync(&self) {
         // SAFETY: `wait_queue_head` points to valid memory.
         unsafe { bindings::__wake_up_sync(self.wait_queue_head.get(), TASK_NORMAL) };
@@ -225,6 +226,7 @@ pub fn notify_sync(&self) {
     ///
     /// This is not 'sticky' in the sense that if no thread is waiting, the notification is lost
     /// completely (as opposed to automatically waking up the next waiter).
+    #[inline]
     pub fn notify_one(&self) {
         self.notify(1);
     }
@@ -233,6 +235,7 @@ pub fn notify_one(&self) {
     ///
     /// This is not 'sticky' in the sense that if no thread is waiting, the notification is lost
     /// completely (as opposed to automatically waking up the next waiter).
+    #[inline]
     pub fn notify_all(&self) {
         self.notify(0);
     }
-- 
2.43.0

