Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F743BE17F;
	Mon, 23 Mar 2026 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280334; cv=none; b=C1UzEK+Sgis7d6s0ZjEnAPniT+NiZBJAjVFtybF8hzA3Dlcrvmz/QWKeS5y3PaAVtD7n8yjA1TE9tZiZoIT3flFbVNyRM+LIkJV8G2eRgbfJ7TIJo6v+sd0Jyk9gBFZF+TMzm0BDZVG982y+RrUtmuzvBYDpPpJXrbEc/rg3mY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280334; c=relaxed/simple;
	bh=QGn0YNgmovEkd5wIwHGCPWLH1KN1h9XblBTCRjSDPVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JzbNJAO/0+6G8DionnRfE6hhxqilheBcTloZ9p8GGSfzVKCO56u/Qx+QSE9YKFsdUPWl2R/XywJgVWXTMAWXpGNUJISxBGvU0U2SxzyH44sdg8EpZz8ZLjJGLV7YvcYEo0E2dVuYKzr9CD0lLc2zuCHvlfGg+wLbdHKtg6L5lAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQlAu6Lc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQlAu6Lc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F133FC2BCB4;
	Mon, 23 Mar 2026 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774280333;
	bh=QGn0YNgmovEkd5wIwHGCPWLH1KN1h9XblBTCRjSDPVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=mQlAu6LcuhDh346qAw3zwoEW0eb4/RvgPVYgfvmvkt18h68KpZR1VP3+JUrVHbJgS
	 k9eZUNWJmWAUDGhzIP7TVQRGYku8xDOIHjq48O+wz9Cp5T2QV9q4pRT9tdght+Ksoq
	 821y+zy3SFIgSDmmfTH+5dMkIVoJyCjLkKoFSSRjMty2DR3ZfXdRzspHCgiE/EkaaS
	 rdph4PcW/mqQkDKKZWcFu3gh/2pS8DS7GRNe8UTqnvT9dYJOY/1ZpiAslPNbc5HCDA
	 skrd6GBW97UtAoTkiKUgE7qRnFGHORwTVdszywrM4C5uzC+AYsjIOr+/LXVHTdv49U
	 iwq5puNOE9PsQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 6/8] rust: io: add `read_val` and `write_val` function on I/O view
Date: Mon, 23 Mar 2026 15:37:58 +0000
Message-ID: <20260323153807.1360705-7-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260323153807.1360705-1-gary@kernel.org>
References: <20260323153807.1360705-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

When a view is narrowed to just a primitive, these functions provide a way
to access them using the `IoCapable` trait. This is used to provide
`io_read!` and `io_write!` macros, which are generalized version of current
`dma_read!` and `dma_write!` macro (that works on `Coherent` only, but not
subview of them, or other I/O backends).

For DMA coherent objects, `IoCapable` is only implemented for atomically
accessible primitives; this is because `read_volatile`/`write_volatile` can
behave undesirably for aggregates; LLVM may turn them to multiple
instructions to access parts and assemble, or could combine them to a
single instruction.

The ability to read/write aggregates (when atomicity is of no concern),
could be implemented with copying primitives (e.g. memcpy_{from,to}io) in
the future.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/dma.rs | 40 +++++++++++++++++++
 rust/kernel/io.rs  | 95 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index ae2939abc166..fcdf85f5ed50 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -877,6 +877,46 @@ fn as_ptr(&self) -> *mut Self::Type {
     }
 }
 
+/// Implements [`IoCapable`] on `Coherent` for `$ty` using `read_volatile` and `write_volatile`.
+macro_rules! impl_coherent_io_capable {
+    ($(#[$attr:meta])* $ty:ty) => {
+        $(#[$attr])*
+        impl<T: ?Sized + KnownSize> IoCapable<$ty> for Coherent<T> {
+            #[inline]
+            unsafe fn io_read(&self, address: *mut $ty) -> $ty {
+                // SAFETY:
+                // - By the safety precondition, the address is within bounds of the allocation and
+                //   aligned.
+                // - Using read_volatile() here so that race with hardware is well-defined.
+                // - Using read_volatile() here is not sound if it races with other CPU per Rust
+                //   rules, but this is allowed per LKMM.
+                unsafe { address.read_volatile() }
+            }
+
+            #[inline]
+            unsafe fn io_write(&self, value: $ty, address: *mut $ty) {
+                // SAFETY:
+                // - By the safety precondition, the address is within bounds of the allocation and
+                //   aligned.
+                // - Using write_volatile() here so that race with hardware is well-defined.
+                // - Using write_volatile() here is not sound if it races with other CPU per Rust
+                //   rules, but this is allowed per LKMM.
+                unsafe { address.write_volatile(value) }
+            }
+        }
+    };
+}
+
+// DMA regions support atomic 8, 16, and 32-bit accesses.
+impl_coherent_io_capable!(u8);
+impl_coherent_io_capable!(u16);
+impl_coherent_io_capable!(u32);
+// DMA regions on 64-bit systems also support atomic 64-bit accesses.
+impl_coherent_io_capable!(
+    #[cfg(CONFIG_64BIT)]
+    u64
+);
+
 impl<'a, B: ?Sized + KnownSize, T: ?Sized> crate::io::View<'a, Coherent<B>, T> {
     /// Returns a DMA handle which may be given to the device as the DMA address base of
     /// the region.
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 8166e47f1381..cf2074d066d2 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -992,6 +992,26 @@ pub fn try_cast<U>(self) -> Result<View<'a, IO, U>>
     }
 }
 
+impl<T, IO: ?Sized + Io + IoCapable<T>> View<'_, IO, T> {
+    /// Read from I/O memory.
+    ///
+    /// This is only supported on types that is directly supported by `IO` with [`IoCapable`].
+    #[inline]
+    pub fn read_val(&self) -> T {
+        // SAFETY: Per type invariant.
+        unsafe { self.io.io_read(self.ptr) }
+    }
+
+    /// Write to I/O memory.
+    ///
+    /// This is only supported on types that is directly supported by `IO` with [`IoCapable`].
+    #[inline]
+    pub fn write_val(&self, value: T) {
+        // SAFETY: Per type invariant.
+        unsafe { self.io.io_write(value, self.ptr) }
+    }
+}
+
 /// Project an I/O type to a subview of it.
 ///
 /// The syntax is of form `io_project!(io, proj)` where `io` is an expression to a type that
@@ -1040,3 +1060,78 @@ macro_rules! io_project {
 
 #[doc(inline)]
 pub use crate::io_project;
+
+/// Read from I/O memory.
+///
+/// The syntax is of form `io_read!(io, proj)` where `io` is an expression to a type that
+/// implements [`Io`] and `proj` is a [projection specification](kernel::ptr::project!).
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::io::View;
+/// struct MyStruct { field: u32, }
+///
+/// // SAFETY: All bit patterns are acceptable values for `MyStruct`.
+/// unsafe impl kernel::transmute::FromBytes for MyStruct{};
+/// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
+/// unsafe impl kernel::transmute::AsBytes for MyStruct{};
+///
+/// # fn test(mmio: &kernel::io::Mmio<[MyStruct]>) -> Result {
+/// // let mmio: Mmio<[MyStruct]>;
+/// let field: u32 = kernel::io::io_read!(mmio, [2]?.field);
+/// # Ok::<(), Error>(()) }
+#[macro_export]
+#[doc(hidden)]
+macro_rules! io_read {
+    ($io:expr, $($proj:tt)*) => {
+        $crate::io_project!($io, $($proj)*).read_val()
+    };
+}
+
+#[doc(inline)]
+pub use crate::io_read;
+
+/// Writes to I/O memory.
+///
+/// The syntax is of form `io_write!(io, proj, val)` where `io` is an expression to a type that
+/// implements [`Io`] and `proj` is a [projection specification](kernel::ptr::project!),
+/// and `val` is the value to be written to the projected location.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::io::View;
+/// struct MyStruct { field: u32, }
+///
+/// // SAFETY: All bit patterns are acceptable values for `MyStruct`.
+/// unsafe impl kernel::transmute::FromBytes for MyStruct{};
+/// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
+/// unsafe impl kernel::transmute::AsBytes for MyStruct{};
+///
+/// # fn test(mmio: &kernel::io::Mmio<[MyStruct]>) -> Result {
+/// // let mmio: Mmio<[MyStruct]>;
+/// kernel::io::io_write!(mmio, [2]?.field, 10);
+/// # Ok::<(), Error>(()) }
+#[macro_export]
+#[doc(hidden)]
+macro_rules! io_write {
+    (@parse [$io:expr] [$($proj:tt)*] [, $val:expr]) => {
+        $crate::io_project!($io, $($proj)*).write_val($val)
+    };
+    (@parse [$io:expr] [$($proj:tt)*] [.$field:tt $($rest:tt)*]) => {
+        $crate::io_write!(@parse [$io] [$($proj)* .$field] [$($rest)*])
+    };
+    (@parse [$io:expr] [$($proj:tt)*] [[$index:expr]? $($rest:tt)*]) => {
+        $crate::io_write!(@parse [$io] [$($proj)* [$index]?] [$($rest)*])
+    };
+    (@parse [$io:expr] [$($proj:tt)*] [[$index:expr] $($rest:tt)*]) => {
+        $crate::io_write!(@parse [$io] [$($proj)* [$index]] [$($rest)*])
+    };
+    ($io:expr, $($rest:tt)*) => {
+        $crate::io_write!(@parse [$io] [] [$($rest)*])
+    };
+}
+
+#[doc(inline)]
+pub use crate::io_write;
-- 
2.51.2

