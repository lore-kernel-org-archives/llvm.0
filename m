Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C582741CE
	for <llvm@lists.linux.dev>; Thu, 10 Jul 2025 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752159226; cv=none; b=kW8O8HjbjoxfcDkTZ0j4r0JkYvZHsimA0t1acXiylXEsr8+CPUTxdkk+te9jj+xR5oGbQdFXGdvqajKa0XmG7KngFfhecYOjfgzSrcJ8P3FEinuoGKWt5yeze4LLnSWwfD+zHs93yWttB7waPI6162EoQuHPodxc34JuYzonJMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752159226; c=relaxed/simple;
	bh=0wSR+ShttbtczHAy5H0Sl3UOKI7A4jLRX6PugrLKwKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LP9B64GbJSsKKuZCjtQOc89Bx0SqXsNyUbwSn/DFrLL2wcDUG720qFfejkAETDy+8M65asWKEGfX2cFZeyf4GZX5PJOcIEZAXO2k3oRxCh8QVbBNQdfRyw/JguBt1/6aMPqeExTd1fOBZ5fg0g8aaFowBZDqp9180547ejTOoww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HI2lGDHo; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HI2lGDHo"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so9302616d6.0
        for <llvm@lists.linux.dev>; Thu, 10 Jul 2025 07:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752159223; x=1752764023; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAN8zb60ZxRXD0+KvDN0I2W4zoHQYT5AMmD/2Mo3ya0=;
        b=HI2lGDHovdOAjI5ISB7CoMRpMIGcHzePJORpXuedmN+gMflpGzjKsX3ua//SIE8e4E
         hV37waGaKd6dSf83jjKPm6o1WHOhjZE5TWZtYnyAZCgCygb9XCfBf6m3WCLIRPzsrFze
         Obu2Xj+ZyR1Yhg2/wr/OrdoCaa31WDe060/c+2uN846EXEmAkQQnmDdFQLY3ow6/4IO4
         5m24d9oYR253TX+1qm3uYPX7YLzYQkHsylc5pHB1Vr/E2YBUcRXDP6fDGaZhXcZBjXwJ
         V5dsq4t9F6hPGwBTjNKtuuUjwYJEd2YYljs4YSZPVXrXmTrLuk8jhlR0nUtVbrrzYt49
         rL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752159223; x=1752764023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAN8zb60ZxRXD0+KvDN0I2W4zoHQYT5AMmD/2Mo3ya0=;
        b=PZ1ZaUask302wc0HdXDYod4tABBBRGzFvm57MM68sSiqH+0yx+HVRHUxhXwhJ9Rq6o
         8t77RUci6wPYMxsLNqKU0S+OkTwR2JAFr9syOONJgNKuGbK2ElT9pdVJAvtIzJLJTNn8
         DUKipmUxhUlT3GMchCY4XZsgxzeebzcJ8qcQnO0kVSln5AFSEXXcWGODr869IYEhqTXd
         dek4gYl0xwT8ADHkUFTpSBq2BRqCzJHuuNx9CGRw8ugJRvtDWlQyJ/PhTMJoBJXVDRGr
         k7w0oxNvjpsafnjoETsTne4Uq+7mMIhUhnUdTAHyCa/+XZ1Ui5EcrWJXUyfv+crpDrLa
         yoaw==
X-Forwarded-Encrypted: i=1; AJvYcCW2TknqZRp5N3+C021ZfCswDHOxsoACcT56slb0L7CFqn4eCyyEmaY5sp2JTQ6mwe+QRPTF@lists.linux.dev
X-Gm-Message-State: AOJu0YwO4NH7LQJAJMsQq0UZB7voQreZ9s6xXJKqpGfZ7hK1MpbVpj2g
	PJ11vL021fWy3wFdmzb/XK5LvXw8vKY+Unv4qdVnbuElZtY3ZCBpk+R2ZXA3jmIV1QjM5Q==
X-Gm-Gg: ASbGncu9Dk7V1ovaq+VBtwFrFpGpNFAWaTQU73fLcTil6DvaZxPzbLQ/j6tbbEFkeWf
	fVsr//KDfiuPdBGkCj7lLwHyOVQpeThOtpmjxiJVR+3Rbeo52lp/AD06WzhhrT4TC4LK4AEyyQG
	B4bwa1mEqohZraybOCVHCn3CmMBMbk5vasKDU8m2lt5cpFia2iAhF5LS6P/z3Jd1DZxHajhAOja
	ciHQcgVc2kl/LvVI58Pr9AOscG7wVNjT9h3vCY6+P4GC7JDZICyDRByZLCxETVlA+Wq/wk1hmsU
	nBHmAyImSorusrIjTPCPF0iG8IyDhxSG3Javu/5RPNg0J3wtBeOneYKpO3PYT/VP6eVMizjRG3d
	YwYd0bX5kF5BZ1uKBM87ChD0yGsiS3B9/AtB0oM0uFVOfKABKkBN+iaETBX7MB+g=
X-Google-Smtp-Source: AGHT+IE7hMhI+MTblX5H8f4iRMMlk/Pc6Mc7fPn7fgU+t69i2WLafJcQzrz9FSbV4rCvreCl2EZzZg==
X-Received: by 2002:a05:6214:23cd:b0:6fd:5cf4:cbb0 with SMTP id 6a1803df08f44-7048b992b7fmr120657796d6.25.1752159223090;
        Thu, 10 Jul 2025 07:53:43 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([148.76.185.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-704979f49b0sm9138996d6.54.2025.07.10.07.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:53:42 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 10:53:30 -0400
Subject: [PATCH v14 2/3] rust: support formatting of foreign types
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-cstr-core-v14-2-ca7e0ca82c82@gmail.com>
References: <20250710-cstr-core-v14-0-ca7e0ca82c82@gmail.com>
In-Reply-To: <20250710-cstr-core-v14-0-ca7e0ca82c82@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752159218; l=11033;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=0wSR+ShttbtczHAy5H0Sl3UOKI7A4jLRX6PugrLKwKk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMda5hBskhE4Q3DHX1XP+tCgPsUQ/0foFWthQrb6dnCRnovULze6KdKxGgLj2jDDsbvvWCBVug9
 BTpn0TE5WdQQ=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Introduce a `fmt!` macro which wraps all arguments in
`kernel::fmt::Adapter` and a `kernel::fmt::Display` trait. This enables
formatting of foreign types (like `core::ffi::CStr`) that do not
implement `core::fmt::Display` due to concerns around lossy conversions
which do not apply in the kernel.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Custom.20formatting/with/516476467
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/fmt.rs     | 87 +++++++++++++++++++++++++++++++++++++++++++++-
 rust/kernel/prelude.rs |  3 +-
 rust/macros/fmt.rs     | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     | 19 ++++++++++
 rust/macros/quote.rs   |  7 ++++
 5 files changed, 207 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 0306e8388968..84d634201d90 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -4,4 +4,89 @@
 //!
 //! This module is intended to be used in place of `core::fmt` in kernel code.
 
-pub use core::fmt::{Arguments, Debug, Display, Error, Formatter, Result, Write};
+pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
+
+/// Internal adapter used to route allow implementations of formatting traits for foreign types.
+///
+/// It is inserted automatically by the [`fmt!`] macro and is not meant to be used directly.
+///
+/// [`fmt!`]: crate::prelude::fmt!
+#[doc(hidden)]
+pub struct Adapter<T>(pub T);
+
+macro_rules! impl_fmt_adapter_forward {
+    ($($trait:ident),* $(,)?) => {
+        $(
+            impl<T: $trait> $trait for Adapter<T> {
+                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+                    let Self(t) = self;
+                    $trait::fmt(t, f)
+                }
+            }
+        )*
+    };
+}
+
+use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+
+/// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
+///
+/// Types should implement this trait rather than [`core::fmt::Display`]. Together with the
+/// [`Adapter`] type and [`fmt!`] macro, it allows for formatting foreign types (e.g. types from
+/// core) which do not implement [`core::fmt::Display`] directly.
+///
+/// [`fmt!`]: crate::prelude::fmt!
+pub trait Display {
+    /// Same as [`core::fmt::Display::fmt`].
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
+}
+
+impl<T: ?Sized + Display> Display for &T {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Display::fmt(*self, f)
+    }
+}
+
+impl<T: ?Sized + Display> core::fmt::Display for Adapter<&T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(t) = self;
+        Display::fmt(t, f)
+    }
+}
+
+macro_rules! impl_display_forward {
+    ($(
+        $( { $($generics:tt)* } )? $ty:ty $( { where $($where:tt)* } )?
+    ),* $(,)?) => {
+        $(
+            impl$($($generics)*)? Display for $ty $(where $($where)*)? {
+                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+                    core::fmt::Display::fmt(self, f)
+                }
+            }
+        )*
+    };
+}
+
+impl_display_forward!(
+    bool,
+    char,
+    core::panic::PanicInfo<'_>,
+    Arguments<'_>,
+    i128,
+    i16,
+    i32,
+    i64,
+    i8,
+    isize,
+    str,
+    u128,
+    u16,
+    u32,
+    u64,
+    u8,
+    usize,
+    {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
+    {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
+);
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 3ca934885797..41cebd906c4c 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -22,7 +22,7 @@
 pub use crate::alloc::{flags::*, Box, KBox, KVBox, KVVec, KVec, VBox, VVec, Vec};
 
 #[doc(no_inline)]
-pub use macros::{export, kunit_tests, module, vtable};
+pub use macros::{export, fmt, kunit_tests, module, vtable};
 
 pub use pin_init::{init, pin_data, pin_init, pinned_drop, InPlaceWrite, Init, PinInit, Zeroable};
 
@@ -33,7 +33,6 @@
 pub use super::dbg;
 pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, dev_info, dev_notice, dev_warn};
 pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
-pub use core::format_args as fmt;
 
 pub use super::{try_init, try_pin_init};
 
diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
new file mode 100644
index 000000000000..2f4b9f6e2211
--- /dev/null
+++ b/rust/macros/fmt.rs
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use proc_macro::{Ident, TokenStream, TokenTree};
+use std::collections::BTreeSet;
+
+/// Please see [`crate::fmt`] for documentation.
+pub(crate) fn fmt(input: TokenStream) -> TokenStream {
+    let mut input = input.into_iter();
+
+    let first_opt = input.next();
+    let first_owned_str;
+    let mut names = BTreeSet::new();
+    let first_span = {
+        let Some((mut first_str, first_span)) = (match first_opt.as_ref() {
+            Some(TokenTree::Literal(first_lit)) => {
+                first_owned_str = first_lit.to_string();
+                Some(first_owned_str.as_str()).and_then(|first| {
+                    let first = first.strip_prefix('"')?;
+                    let first = first.strip_suffix('"')?;
+                    Some((first, first_lit.span()))
+                })
+            }
+            _ => None,
+        }) else {
+            return first_opt.into_iter().chain(input).collect();
+        };
+
+        // Parse `identifier`s from the format string.
+        //
+        // See https://doc.rust-lang.org/std/fmt/index.html#syntax.
+        while let Some((_, rest)) = first_str.split_once('{') {
+            first_str = rest;
+            if let Some(rest) = first_str.strip_prefix('{') {
+                first_str = rest;
+                continue;
+            }
+            if let Some((name, rest)) = first_str.split_once('}') {
+                first_str = rest;
+                let name = name.split_once(':').map_or(name, |(name, _)| name);
+                if !name.is_empty() && !name.chars().all(|c| c.is_ascii_digit()) {
+                    names.insert(name);
+                }
+            }
+        }
+        first_span
+    };
+
+    let adapter = quote_spanned!(first_span => ::kernel::fmt::Adapter);
+
+    let mut args = TokenStream::from_iter(first_opt);
+    {
+        let mut flush = |args: &mut TokenStream, current: &mut TokenStream| {
+            let current = std::mem::take(current);
+            if !current.is_empty() {
+                let (lhs, rhs) = (|| {
+                    let mut current = current.into_iter();
+                    let mut acc = TokenStream::new();
+                    while let Some(tt) = current.next() {
+                        // Split on `=` only once to handle cases like `a = b = c`.
+                        if matches!(&tt, TokenTree::Punct(p) if p.as_char() == '=') {
+                            names.remove(acc.to_string().as_str());
+                            // Include the `=` itself to keep the handling below uniform.
+                            acc.extend([tt]);
+                            return (Some(acc), current.collect::<TokenStream>());
+                        }
+                        acc.extend([tt]);
+                    }
+                    (None, acc)
+                })();
+                args.extend(quote_spanned!(first_span => #lhs #adapter(&#rhs)));
+            }
+        };
+
+        let mut current = TokenStream::new();
+        for tt in input {
+            match &tt {
+                TokenTree::Punct(p) if p.as_char() == ',' => {
+                    flush(&mut args, &mut current);
+                    &mut args
+                }
+                _ => &mut current,
+            }
+            .extend([tt]);
+        }
+        flush(&mut args, &mut current);
+    }
+
+    for name in names {
+        let name = Ident::new(name, first_span);
+        args.extend(quote_spanned!(first_span => , #name = #adapter(&#name)));
+    }
+
+    quote_spanned!(first_span => ::core::format_args!(#args))
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index fa847cf3a9b5..793f712dbf7c 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -15,6 +15,7 @@
 mod quote;
 mod concat_idents;
 mod export;
+mod fmt;
 mod helpers;
 mod kunit;
 mod module;
@@ -201,6 +202,24 @@ pub fn export(attr: TokenStream, ts: TokenStream) -> TokenStream {
     export::export(attr, ts)
 }
 
+/// Like [`core::format_args!`], but automatically wraps arguments in [`kernel::fmt::Adapter`].
+///
+/// This macro allows generating `fmt::Arguments` while ensuring that each argument is wrapped with
+/// `::kernel::fmt::Adapter`, which customizes formatting behavior for kernel logging.
+///
+/// Named arguments used in the format string (e.g. `{foo}`) are detected and resolved from local
+/// bindings. All positional and named arguments are automatically wrapped.
+///
+/// This macro is an implementation detail of other kernel logging macros like [`pr_info!`] and
+/// should not typically be used directly.
+///
+/// [`kernel::fmt::Adapter`]: ../kernel/fmt/struct.Adapter.html
+/// [`pr_info!`]: ../kernel/macro.pr_info.html
+#[proc_macro]
+pub fn fmt(input: TokenStream) -> TokenStream {
+    fmt::fmt(input)
+}
+
 /// Concatenate two identifiers.
 ///
 /// This is useful in macros that need to declare or reference items with names
diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index acc140c18653..ddfc21577539 100644
--- a/rust/macros/quote.rs
+++ b/rust/macros/quote.rs
@@ -48,6 +48,7 @@ macro_rules! quote_spanned {
     ($span:expr => $($tt:tt)*) => {{
         let mut tokens = ::proc_macro::TokenStream::new();
         {
+            #[allow(unused_variables)]
             let span = $span;
             quote_spanned!(@proc tokens span $($tt)*);
         }
@@ -146,6 +147,12 @@ macro_rules! quote_spanned {
         )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
+    (@proc $v:ident $span:ident & $($tt:tt)*) => {
+        $v.extend([::proc_macro::TokenTree::Punct(
+            ::proc_macro::Punct::new('&', ::proc_macro::Spacing::Alone),
+        )]);
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
     (@proc $v:ident $span:ident _ $($tt:tt)*) => {
         $v.extend([::proc_macro::TokenTree::Ident(
             ::proc_macro::Ident::new("_", $span),

-- 
2.50.0

