Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE15531AE5;
	Fri, 16 Oct 2026 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167902; cv=none; b=sD6ubcoKVvaMHYW35sK5SsqZWiFBMk/sv46ivFu5oSkh2q3+vShCADlc8biLm5HkkCXL1Z4LikhLNYeHJ91TM02GMYSuqhwoDOzBcO3Pypgui23ap+IjUhS7e17Z8e9CbkkkLK08DrYT6th9IYRT6mmDg5KmJ398Qv/f1WnPnAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167902; c=relaxed/simple;
	bh=mZpW+60wwlUtmET5MzQNCtl0ej+kiRbnUimDHtPmbhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=afMKx87azKhjvMBcd7D2mF+uixYyFhBmIOebYM+BT17K8tjOdMr5qQmcGu+AmdUaaIWHy05F0OufSt8GWuIiXIgEACBCp7h3JEU33m5d2lBs2Rn/1WiMfUqrkaOICZNiONYAEN/iWD7rqzLEv3gTmUJRrwuGsNBdUVLaRYGi/ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4bYZ7bK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4bYZ7bK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4197A1F000C4;
	Fri, 16 Oct 2026 16:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792167898;
	bh=Rm4u+qRGGIqZlcsNn/N/M2BE0iir8BZS4bhQe6SA5eo=;
	h=From:To:Cc:Subject:Date;
	b=O4bYZ7bKis2JJ39409LuneJNdGzAT9/Acm/2lKs6/anoZ7fydIZfR26X2Mp2Uwubp
	 hzOIcMYwruxBmUVoGs8tMZqVMtP1gfpwkyAtr+hXy5IX+prIXZEbFiKIK1ZhrHE1DT
	 i38xA9pd7u9NdqCJq+WR66NPHhkxCuWwsVY4sdAOdcKOcWSNnI6k2bViby+ep6BUUH
	 ZAge7LnOh+P5ZB5bPTNVtcaXVAknQ2vJoLmy2GeoZRZVzuUO+mdYVQRIeZ5PqwpU3X
	 vHouarUa7e3n7/8FqqwLy9kflUwZ2eNVdh37Bxj5yuT9c/JLTFQt2/49SXPRXo/OOR
	 mP/qsF3NHpoNQ==
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH v3 1/2] rust: std_vendor: add `likely()`, `unlikely()` and `cold_path()`
Date: Fri, 16 Oct 2026 18:24:45 +0200
Message-ID: <20261016162446.121509-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`{un,}likely()` are commonly used macros on the C side -- there are
more than 25k occurrences in the tree. Rust is likely going to provide
functions (not macros) for the same purpose: `core::hint::{un,}likely()`.
Currently they are unstable under `feature(likely_unlikely)` [1].

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

LLVM emits code equivalent to the one it would for similar C functions:

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
            mov    $0x2a,%eax
            test   %edi,%edi
        /-- js     <f3+0xa>
        |   ret
        \-> mov    $0x7d,%eax
            ret

Thus vendor (essentially) the `core` library code to provide the same
API (so that we may use `core`'s directly in the future).

We do so by implementing `{un,}likely()` like `core`'s `intrinsics` do
(to save a layer) and based on calling our own `cold_path()` instead of
using `core`'s (which is stable since 1.95.0 [2][3]).

It turns out that simply using `#[cold]` to emulate `cold_path()`,
suggested by Gary [4], works in the cases I tested across all supported
versions so far, so we can avoid the complexity of having one more Kconfig
and conditionally enabling the feature in callers (since `cold_path()`
was added in Rust 1.86.0 [5]).

We could optionally call `cold_path()` for Rust >= 1.86.0 within our own
`cold_path()`, but it seems that it is not needed, and anyway since Rust
1.98.0 `cold_path()` is itself `#[cold]` so that it works even if the
MIR inliner can't inline it [6].

Even if we find that it is not optimal in some cases, it can be improved,
and meanwhile we will have the means to annotate these cases already.

Apart from that, the only differences with `core`'s version are the
usual changes (`pr_*!` calls and their `\n`, imports, attributes, lint
cleanup), plus a fix for a polarity typo (I sent a fix upstream [7])
and removal of unneeded code documentation.

In addition, add them to the prelude (inlined, so that the documentation
is rendered at least there, until we can use `core`'s).

Link: https://github.com/rust-lang/rust/issues/151619 [1]
Link: https://github.com/rust-lang/rust/issues/136873 [2]
Link: https://github.com/rust-lang/rust/pull/151576 [3]
Link: https://lore.kernel.org/rust-for-linux/DGA6GUR58QJ7.1XZZ0P4VZNW86@garyguo.net/ [4]
Link: https://github.com/rust-lang/rust/pull/133695 [5]
Link: https://github.com/rust-lang/rust/pull/156863 [6]
Link: https://github.com/rust-lang/rust/pull/164374 [7]
Assisted-by: LLM
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
v3: I used Gary's `#[cold]` suggestion, and thus removed the Kconfig.
I rebased and made sure the code is up to date with `core`, tested a
bunch of things, compared again with C and the assembly generated, found
a strange behavior on Clang I will report separately, a polarity typo in
`core` (fixed here) and inlined the docs in the prelude to get it
rendered somewhere until we bump the MSRV. I think the potential issue
I found in v2's discussion may have been with `-Os`, but it happens the
same way with `core`'s, so it does not matter.

Alice, Gary: I removed your Reviewed-by's just in case. It is pretty
similar to last time, but the commit message is reworded, and the commit
is simpler.

 rust/kernel/prelude.rs    |   7 ++
 rust/kernel/std_vendor.rs | 136 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index edaf1e4c174b..de5a5aad16a1 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -133,3 +133,10 @@
 // `super::std_vendor` is hidden, which makes the macro inline for some reason.
 #[doc(no_inline)]
 pub use super::dbg;
+
+#[doc(inline)]
+pub use super::std_vendor::{
+    cold_path,
+    likely,
+    unlikely, //
+};
diff --git a/rust/kernel/std_vendor.rs b/rust/kernel/std_vendor.rs
index abbab5050cc5..8738c387fb4a 100644
--- a/rust/kernel/std_vendor.rs
+++ b/rust/kernel/std_vendor.rs
@@ -162,3 +162,139 @@ macro_rules! dbg {
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
+///         pr_info!("this branch is unlikely to be taken\n");
+///     }
+/// }
+/// ```
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
+#[inline(always)]
+#[cold]
+pub const fn cold_path() {}

base-commit: 7c306f00835a237a70024a8f968dbc3bc8db8fcf
--
2.56.0
