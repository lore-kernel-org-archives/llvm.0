Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716FB13B7B3
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 02:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742179073; cv=none; b=ZS7R0AHy/W/oJwNZJbf7iQu/Y/Yyx1i8Mk2FUxvdfGD6B5fCE4XGT0MqwUN8TFJMyWnXlSeRZKLYzJOghwfen8nzmKs0BzqM6JG4p6n5BjCmqa5nyl21i6kZI3XScop+NkV5iPYs8RaM5/K/l3XIEH62bY/2E4pHcSGE7lF5O9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742179073; c=relaxed/simple;
	bh=jr0Lv8Y0CURZU0fYeM2JurMzFEjQ0Bf3nLyiFUIIcCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+D/WmDCPXnXNQdLIJ6GBuYTwn1U8aX9C7nBLEt6kCoOtxap/iKHmS4G90ctx6dgGnXrJAA4FFI7NUEbDxiEcNQWKXT+6FZ4Ul8fdEwwGK6VGKaj6usjBxN/FOSwS/vQvd462eB33gPwlwCpV/UrBxi8owVXZQW7nKznQOYDzHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gy/vxbLD; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gy/vxbLD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742179068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KgV8WKeIqrFYbTho8XnqGie8n4brTr0w7Y+jx2xAmy8=;
	b=gy/vxbLDSKqJOi0srWT0l3xpyhDp8rW/EugXGU30Q3+27Dz48dG4a3YXsli2HGmCXdVxvq
	qzda9ueG7Dva08dgq5aOIsivrK8eVnin5m2ILk3TaH0GPs77ofjWSwU+4G31d7YD1EL27W
	NJPfquzlw7bMZCi5GqggmH/TqjGdlcs=
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
Subject: [PATCH v2] rust: file: optimize rust symbol generation for FileDescriptorReservation
Date: Mon, 17 Mar 2025 10:37:02 +0800
Message-ID: <20250317023702.2360726-1-kunwu.chan@linux.dev>
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

$ nm vmlinux | grep ' _R'.*FileDescriptorReservation | rustfilt
... T <kernel::fs::file::FileDescriptorReservation>::fd_install
... T <kernel::fs::file::FileDescriptorReservation>::get_unused_fd_flags
... T <kernel::fs::file::FileDescriptorReservation as core::ops::drop::Drop>::drop

These Rust symbols are trivial wrappers around the C functions
fd_install, put_unused_fd and put_task_struct. It
doesn't make sense to go through a trivial wrapper for these
functions, so mark them inline.

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

---
Changes in v2:
 - Add link and Suggested-by
 - Mark 'reserved_fd' as inline
 - Reword commit msg
---
 rust/kernel/fs/file.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index e03dbe14d62a..736209a1b983 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -392,6 +392,7 @@ pub struct FileDescriptorReservation {
 
 impl FileDescriptorReservation {
     /// Creates a new file descriptor reservation.
+    #[inline]
     pub fn get_unused_fd_flags(flags: u32) -> Result<Self> {
         // SAFETY: FFI call, there are no safety requirements on `flags`.
         let fd: i32 = unsafe { bindings::get_unused_fd_flags(flags) };
@@ -405,6 +406,7 @@ pub fn get_unused_fd_flags(flags: u32) -> Result<Self> {
     }
 
     /// Returns the file descriptor number that was reserved.
+    #[inline]
     pub fn reserved_fd(&self) -> u32 {
         self.fd
     }
@@ -413,6 +415,7 @@ pub fn reserved_fd(&self) -> u32 {
     ///
     /// The previously reserved file descriptor is bound to `file`. This method consumes the
     /// [`FileDescriptorReservation`], so it will not be usable after this call.
+    #[inline]
     pub fn fd_install(self, file: ARef<File>) {
         // SAFETY: `self.fd` was previously returned by `get_unused_fd_flags`. We have not yet used
         // the fd, so it is still valid, and `current` still refers to the same task, as this type
@@ -433,6 +436,7 @@ pub fn fd_install(self, file: ARef<File>) {
 }
 
 impl Drop for FileDescriptorReservation {
+    #[inline]
     fn drop(&mut self) {
         // SAFETY: By the type invariants of this type, `self.fd` was previously returned by
         // `get_unused_fd_flags`. We have not yet used the fd, so it is still valid, and `current`
-- 
2.43.0

