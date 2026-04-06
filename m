Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216132BD5A8;
	Mon,  6 Apr 2026 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775469550; cv=none; b=WGqZhHN24Lxgb7h8YkNhOM+EFluyPByot5qxoLQXka7oUCJaWn0ELOoPQ1eIMbQ0PBdpjSb7E0q5ApHOcJPhTGLgm/3VqsVQ5oLToY8lcWmHOWF51aaHCD6Ia19X2PIvzL0Z3BIMVZmcKG9qPmaQ5yMWhMmmm8PyU4hrlVlNpeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775469550; c=relaxed/simple;
	bh=BqiLEP09AKvG969whbIG1u+A5g/ONyHOggYO35dEaW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVFmgScbHjnGwhOlEFYDix9ZAHyb7wY4aWOhS17aAwVWa4a5n2rF7gwcTodnuzPA6wuf8rNWGWhNrOC031MasMchjNr7WOhg4/Klzdb1d7WXOvJeM2VdClHdHfKmEZC4Q38nKI0vgCh+pgMb6XTaArtK1UbNZGRH3ofYN1tDzRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4wykqp2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4wykqp2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E76AC19425;
	Mon,  6 Apr 2026 09:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775469549;
	bh=BqiLEP09AKvG969whbIG1u+A5g/ONyHOggYO35dEaW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K4wykqp2zRA2+y8Ffqksez2DNLFnVFvLoKcMhjmee4mp90RKAWwPSY9r+0KLgfGyS
	 yMZPeZIBV4hNZvPRg36KNM9NwhzQJUV8ALWlGi6PmXeOdNZz6SVR3EMP1zTZAulN0g
	 ndpzjucT4ncmjmWKVTapl2kKdJOmgNDiItedadmXXVlNINLe3WCITEymO/M2wugqDU
	 HJ509rkgpc0wAtYH42sVMTbDuuqejkBvWPweFg3xmUB3Ksx0DuEWq9nkM+f/b1u3kp
	 1sESJEuVMXDvlM788W9QBR98E9F827O3LwntlMWeeGOqOeDRXHcrSSxwPdNOplV1EY
	 p/oSLIonOO0gA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH v2 2/2] rust: std_vendor: add `likely()`, `unlikely()` and `cold_path()`
Date: Mon,  6 Apr 2026 11:58:20 +0200
Message-ID: <20260406095820.465994-2-ojeda@kernel.org>
In-Reply-To: <20260406095820.465994-1-ojeda@kernel.org>
References: <20260406095820.465994-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`feature(cold_path)` is becoming stable [1] in the upcoming Rust 1.95.0
(expected 2026-04-16).

`cold_path()` can be used directly, but it also allows us to provide
`likely()` and `unlikely()`, based on `cold_path()`, similar to the C
side ones.

For instance, given:

    fn f1(a: i32) -> i32 {
        if a < 0 {
            return 123;
        }

        42
    }

    fn f2(a: i32) -> i32 {
        if likely(a < 0) {
            return 124;
        }

        42
    }

    fn f3(a: i32) -> i32 {
        if unlikely(a < 0) {
            return 125;
        }

        42
    }

LLVM emits the same code it would for similar C functions:

    f1:
            test   %edi,%edi
            mov    $0x7b,%ecx
            mov    $0x2a,%eax
            cmovs  %ecx,%eax
            ret

    f2:
            mov    $0x7c,%eax
            test   %edi,%edi
        /-- jns    <f2+0xa>
        |   ret
        \-> mov    $0x2a,%eax
            ret

    f3:
            test   %edi,%edi
        /-- js     <f3+0xa>
        |   mov    $0x2a,%eax
        |   ret
        \-> mov    $0x7d,%eax
            ret

The feature itself, `feature(cold_path)`, was added in Rust 1.86.0 [2].

Previously, a PR in Rust 1.84.0 [3] fixed a number of issues with the
`likely()` and `unlikely()` intrinsics (by implementing them on top of
the new `cold_path()` intrinsic). So we could use that, in principle,
for Rust 1.85.0. However, it is just a single version, and it is simpler
to avoid intrinsics. Instead, approximate it with `#[cold]` [4].

Thus add support for `cold_path()` by applying several approaches:

  - For Rust >= 1.86.0, `use` directly `core`'s `cold_path()`.

  - For Rust 1.85, provide a `#[cold]` no-op, and vendor `core`s
    documentation.

And, for all versions, simply provide `likely()` and `unlikely()` based
on `cold_path()`, by vendoring `core`'s unstable ones (the one from
`intrinsics`, not the `hint` wrapper, to save a layer).

In the future, if `likely()` and `unlikely()` become stable [5], we may
want to use them directly as well.

Now, in the C side, the `likely()` and `unlikely()` macros come
from `compiler.h`, which means it is pretty much available everywhere
directly. Thus just add these to the prelude (instead of e.g. re-exporting
them in the root or in a new `hint` module).

This will also mean less churn when we can remove the `cold_path()`
version from `std_vendor` (and potentially the other two too).

I tested that Rust 1.93.0 generate the code above and, in a previous
version of the patch, that Rust 1.83.0 and 1.78.0 do not, as expected.

Link: https://github.com/rust-lang/rust/pull/151576 [1]
Link: https://github.com/rust-lang/rust/pull/133695 [2]
Link: https://github.com/rust-lang/rust/pull/120370 [3]
Link: https://lore.kernel.org/rust-for-linux/DGA6GUR58QJ7.1XZZ0P4VZNW86@garyguo.net/ [4]
Link: https://github.com/rust-lang/rust/issues/151619 [5]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
v1: https://lore.kernel.org/rust-for-linux/20260208224659.18406-3-ojeda@kernel.org/
v2:
  - Drop the intrinsics and use `#[cold]` for Rust 1.85.0.

  - Sorted after `feature(file_with_nul)` since now we know which was
    the stable version when it happened (Rust 1.92.0).

  - Rebased and reworded accordingly.

 init/Kconfig              |   3 +
 rust/kernel/lib.rs        |   4 ++
 rust/kernel/prelude.rs    |   5 ++
 rust/kernel/std_vendor.rs | 142 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 154 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index d9b795f70a38..f4c3368bf585 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -178,6 +178,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000

+config RUSTC_HAS_COLD_PATH
+	def_bool RUSTC_VERSION >= 108600
+
 config RUSTC_HAS_SPAN_FILE
 	def_bool RUSTC_VERSION >= 108800

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 0fa9d820fe7c..0615f741fcd4 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -26,6 +26,10 @@
 // `feature(file_with_nul)` is stable since Rust 1.92.0. Before Rust 1.89.0, it did not exist, so
 // enable it conditionally.
 #![cfg_attr(CONFIG_RUSTC_HAS_FILE_WITH_NUL, feature(file_with_nul))]
+//
+// `feature(cold_path)` is stable since Rust 1.95.0. Before Rust 1.86.0, it did not exist, so
+// enable it conditionally.
+#![cfg_attr(CONFIG_RUSTC_HAS_COLD_PATH, feature(cold_path))]

 // Ensure conditional compilation based on the kernel configuration works;
 // otherwise we may silently break things like initcall handling.
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 44edf72a4a24..f5d6d9d9b629 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -97,6 +97,11 @@
     pr_notice,
     pr_warn,
     static_assert,
+    std_vendor::{
+        cold_path,
+        likely,
+        unlikely, //
+    },
     str::CStrExt as _,
     try_init,
     try_pin_init,
diff --git a/rust/kernel/std_vendor.rs b/rust/kernel/std_vendor.rs
index abbab5050cc5..58d2db5b46a4 100644
--- a/rust/kernel/std_vendor.rs
+++ b/rust/kernel/std_vendor.rs
@@ -162,3 +162,145 @@ macro_rules! dbg {
         ($($crate::dbg!($val)),+,)
     };
 }
+
+/// Hints to the compiler that a branch condition is likely to be true.
+/// Returns the value passed to it.
+///
+/// It can be used with `if` or boolean `match` expressions.
+///
+/// When used outside of a branch condition, it may still influence a nearby branch, but
+/// probably will not have any effect.
+///
+/// It can also be applied to parts of expressions, such as `likely(a) && unlikely(b)`, or to
+/// compound expressions, such as `likely(a && b)`. When applied to compound expressions, it has
+/// the following effect:
+/// ```text
+///     likely(!a) => !unlikely(a)
+///     likely(a && b) => likely(a) && likely(b)
+///     likely(a || b) => a || likely(b)
+/// ```
+///
+/// See also the function [`cold_path()`] which may be more appropriate for idiomatic Rust code.
+///
+/// # Examples
+///
+/// ```
+/// fn foo(x: i32) {
+///     if likely(x > 0) {
+///         pr_info!("this branch is likely to be taken\n");
+///     } else {
+///         pr_info!("this branch is unlikely to be taken\n");
+///     }
+///
+///     match likely(x > 0) {
+///         true => pr_info!("this branch is likely to be taken\n"),
+///         false => pr_info!("this branch is unlikely to be taken\n"),
+///     }
+///
+///     // Use outside of a branch condition may still influence a nearby branch
+///     let cond = likely(x != 0);
+///     if cond {
+///         pr_info!("this branch is likely to be taken\n");
+///     }
+/// }
+/// ```
+// This implementation is taken from `core::intrinsics::likely()`, not the `hint` wrapper.
+#[inline(always)]
+pub const fn likely(b: bool) -> bool {
+    if b {
+        true
+    } else {
+        cold_path();
+        false
+    }
+}
+
+/// Hints to the compiler that a branch condition is unlikely to be true.
+/// Returns the value passed to it.
+///
+/// It can be used with `if` or boolean `match` expressions.
+///
+/// When used outside of a branch condition, it may still influence a nearby branch, but
+/// probably will not have any effect.
+///
+/// It can also be applied to parts of expressions, such as `likely(a) && unlikely(b)`, or to
+/// compound expressions, such as `unlikely(a && b)`. When applied to compound expressions, it has
+/// the following effect:
+/// ```text
+///     unlikely(!a) => !likely(a)
+///     unlikely(a && b) => a && unlikely(b)
+///     unlikely(a || b) => unlikely(a) || unlikely(b)
+/// ```
+///
+/// See also the function [`cold_path()`] which may be more appropriate for idiomatic Rust code.
+///
+/// # Examples
+///
+/// ```
+/// fn foo(x: i32) {
+///     if unlikely(x > 0) {
+///         pr_info!("this branch is unlikely to be taken\n");
+///     } else {
+///         pr_info!("this branch is likely to be taken\n");
+///     }
+///
+///     match unlikely(x > 0) {
+///         true => pr_info!("this branch is unlikely to be taken\n"),
+///         false => pr_info!("this branch is likely to be taken\n"),
+///     }
+///
+///     // Use outside of a branch condition may still influence a nearby branch
+///     let cond = unlikely(x != 0);
+///     if cond {
+///         pr_info!("this branch is likely to be taken\n");
+///     }
+/// }
+/// ```
+// This implementation is taken from `core::intrinsics::unlikely()`, not the `hint` wrapper.
+#[inline(always)]
+pub const fn unlikely(b: bool) -> bool {
+    if b {
+        cold_path();
+        true
+    } else {
+        false
+    }
+}
+
+/// Hints to the compiler that given path is cold, i.e., unlikely to be taken. The compiler may
+/// choose to optimize paths that are not cold at the expense of paths that are cold.
+///
+/// Note that like all hints, the exact effect to codegen is not guaranteed. Using `cold_path`
+/// can actually *decrease* performance if the branch is called more than expected. It is advisable
+/// to perform benchmarks to tell if this function is useful.
+///
+/// # Examples
+///
+/// ```
+/// fn foo(x: &[i32]) {
+///     if let Some(first) = x.first() {
+///         // this is the fast path
+///     } else {
+///         // this path is unlikely
+///         cold_path();
+///     }
+/// }
+///
+/// fn bar(x: i32) -> i32 {
+///     match x {
+///         1 => 10,
+///         2 => 100,
+///         3 => { cold_path(); 1000 }, // this branch is unlikely
+///         _ => { cold_path(); 10000 }, // this is also unlikely
+///     }
+/// }
+/// ```
+///
+/// See also the [`likely()`] and [`unlikely()`] functions, which are similar to the C side macros.
+#[cfg(not(CONFIG_RUSTC_HAS_COLD_PATH))]
+#[inline(always)]
+#[cold]
+pub const fn cold_path() {}
+
+#[cfg(CONFIG_RUSTC_HAS_COLD_PATH)]
+pub use core::hint::cold_path;
--
2.53.0
