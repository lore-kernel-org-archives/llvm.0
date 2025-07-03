Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B830F288AD
	for <llvm@lists.linux.dev>; Thu,  3 Jul 2025 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550993; cv=none; b=a6wiNz1NnlBP18wW2oc7xAleG4WWuw72PUEmyT6q5S1Hv4up3l/ZSllA84tR9nLBn5+F1rUGej3xoDOckciL5SNi20DebXP/+dDblllpxnJcirD1pX7A7JC81kBxWx7nqJBbYdLcUfoF3RhzMfgDcj4vbcN61iuff1tJeM/C7Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550993; c=relaxed/simple;
	bh=Eu9yAhGMxFnFCRgXqutb86wxfbf2J7wghtSIo5kDSOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oj+IJAiCoywqFABrRNjJ6o7SCsbRYHbP0LZGeUkBQBFi2RVTeqd3sxecyniNapEysNtrUMdq0JCGDHAUZHi+IM+QI/N4PSCN2f6F9ijrPiNIttQmF/NAPqSATRI/5aKMsnpX4hNovOO941bOnoHtDK2GiwX5/bY5oAlEwNQtvqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzPZSp33; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzPZSp33"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b49ac6431so69452411fa.1
        for <llvm@lists.linux.dev>; Thu, 03 Jul 2025 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751550989; x=1752155789; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XroVTgiipbMk92z/0akuSiUYeZttfe/ce+IMaIERceI=;
        b=XzPZSp33sU0jr7AT2ZdVawP5EOXzlFtOJbuzwZtk6MTluRpjjc3errZN756b+MO1Hd
         q696/7VmcAkJkyHHOJfr2HquKA6UjkcEKbqX8Umr/pbjhGX2Ap0svgr72l++RvjO7MNf
         ZNYNH9wn2zOm8KgagaKV6LDcO1KbMolvc9vXj8/sdySp4M1QmumQwsgcY3LaSCHUZv0Q
         atiB3NuKOXUgKjbIMe3ibpn3TbReel4c8wNQ5xEAsjOTsyy23gtTcQDMw7VS1w3EPumu
         n6Fxgo9kr+Jo5yfkKXH3yqu3V4lpZ/TSHC7Ftygsu/UfrfMZ8YvIYGsHGy7EpH6Ko1wz
         MwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751550989; x=1752155789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XroVTgiipbMk92z/0akuSiUYeZttfe/ce+IMaIERceI=;
        b=KMSgWoJGzf1SL4PTR5PAhdEwLVJr7dM5A/3BMCDqY5E9zAQNVek0R0JgDEpVXTKXtJ
         xbL8Xzp2EVed94+WYR7i5Y58pdvQCRRY9nlCKX5tVCttLVGuvJ/Wz/If81sv8qBZHlwO
         RJ7I4WA0CXvhH088N84d1T1edt2h4/c0suULdybjLtkSdNlcQtokH6u04FHNCilkWZfL
         lIbn6V9hSL7C2vS8xeFdRjEOys0ND8qb+mH4JvCffscgm3dUEPUKeRbYPTawb3dXPxRf
         olNzF+7EaT69Ntp3TV4JsCMF/DR2id4CWTWsbUVqCa/p6LJfkPIA39zR0lthY/h7WbHF
         9maA==
X-Forwarded-Encrypted: i=1; AJvYcCXjfKm+1q0j/ap9y/NW5QsxSLncp3ZUUD7fhdZI3QdoX9nqFIEBTAMCRf6Bd2g0r5Co9HS4@lists.linux.dev
X-Gm-Message-State: AOJu0YyV2wLF0jsUZT4TSbs3QNdTzhBUT0gIzGraS1iLEpWz4VbjKfyJ
	PKEF9MEnCL3cpExKlOB9gLiM1f+EdgQ0SkNTwxI/Lf5jxk9KHKzIvnJ0Q6UKiKPUhXCnylaBflx
	LXliJVnWJpJTCQjuf5+u62tbPsb2BNOU=
X-Gm-Gg: ASbGncsOJV6cOfvcQU2UYyfKFADQ3bV8Kg8BxpEYU0LxaGW/az1XqG3bIW8aX6TjAmP
	SYD7yX5W+xK4m/os7souzHETDhmixhzYZGd2PrzxtZQmLxCwnxp9BOxJX9ZSVWORnMZzE86rXMR
	fL9HUnqOn9MaC1SmpNgkUdo3fzXzY3KCvmfB3w1qU4QvEu
X-Google-Smtp-Source: AGHT+IHecHJqinQ0GtjAARewm2enIQAyyQD5rKLXQHe+ItluA3s82XioLx3xqz+ougAgIvj7CA1kgvJIs3FoZ5ExGxI=
X-Received: by 2002:a2e:a369:0:b0:32c:bc69:e921 with SMTP id
 38308e7fff4ca-32e0cfaac22mr12120091fa.9.1751550988404; Thu, 03 Jul 2025
 06:56:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com> <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
In-Reply-To: <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 3 Jul 2025 09:55:52 -0400
X-Gm-Features: Ac12FXwkwRINIecE-FwYN90tPuGpGFKpT2Ln86Mwgefjv5UkGbvTZ6CcK0fiY_k
Message-ID: <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
	linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
	linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 5:32=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Tue Jul 1, 2025 at 6:49 PM CEST, Tamir Duberstein wrote:
> > Introduce a `fmt!` macro which wraps all arguments in
> > `kernel::fmt::Adapter` and a `kernel::fmt::Display` trait. This enables
> > formatting of foreign types (like `core::ffi::CStr`) that do not
> > implement `core::fmt::Display` due to concerns around lossy conversions=
 which
> > do not apply in the kernel.
> >
> > Replace all direct calls to `format_args!` with `fmt!`.
> >
> > Replace all implementations of `core::fmt::Display` with implementation=
s
> > of `kernel::fmt::Display`.
> >
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/Custom.20formatting/with/516476467
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  drivers/block/rnull.rs       |  2 +-
> >  drivers/gpu/nova-core/gpu.rs |  4 +-
> >  rust/kernel/block/mq.rs      |  2 +-
> >  rust/kernel/device.rs        |  2 +-
> >  rust/kernel/fmt.rs           | 89 ++++++++++++++++++++++++++++++++++++=
+++
> >  rust/kernel/kunit.rs         |  6 +--
> >  rust/kernel/lib.rs           |  1 +
> >  rust/kernel/prelude.rs       |  3 +-
> >  rust/kernel/print.rs         |  4 +-
> >  rust/kernel/seq_file.rs      |  2 +-
> >  rust/kernel/str.rs           | 22 ++++------
> >  rust/macros/fmt.rs           | 99 ++++++++++++++++++++++++++++++++++++=
++++++++
> >  rust/macros/lib.rs           | 19 +++++++++
> >  rust/macros/quote.rs         |  7 ++++
> >  scripts/rustdoc_test_gen.rs  |  2 +-
> >  15 files changed, 236 insertions(+), 28 deletions(-)
>
> This would be a lot easier to review if he proc-macro and the call
> replacement were different patches.
>
> Also the `kernel/fmt.rs` file should be a different commit.

Can you help me understand why? The changes you ask to be separated
would all be in different files, so why would separate commits make it
easier to review?

I prefer to keep things in one commit because the changes are highly
interdependent. The proc macro doesn't make sense without
kernel/fmt.rs and kernel/fmt.rs is useless without the proc macro.

>
> > diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> > new file mode 100644
> > index 000000000000..348d16987de6
> > --- /dev/null
> > +++ b/rust/kernel/fmt.rs
> > @@ -0,0 +1,89 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Formatting utilities.
> > +
> > +use core::fmt;
>
> I think we should pub export all types that we are still using from
> `core::fmt`. For example `Result`, `Formatter`, `Debug` etc.
>
> That way I can still use the same pattern of importing `fmt` and then
> writing
>
>     impl fmt::Display for MyType {
>         fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {}
>     }

Great idea, done for the next spin. It would be nice to be able to
lint against references to `core::fmt` outside of kernel/fmt.rs.

> > +
> > +/// Internal adapter used to route allow implementations of formatting=
 traits for foreign types.
> > +///
> > +/// It is inserted automatically by the [`fmt!`] macro and is not mean=
t to be used directly.
> > +///
> > +/// [`fmt!`]: crate::prelude::fmt!
> > +#[doc(hidden)]
> > +pub struct Adapter<T>(pub T);
> > +
> > +macro_rules! impl_fmt_adapter_forward {
> > +    ($($trait:ident),* $(,)?) =3D> {
> > +        $(
> > +            impl<T: fmt::$trait> fmt::$trait for Adapter<T> {
> > +                fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Resu=
lt {
> > +                    let Self(t) =3D self;
> > +                    fmt::$trait::fmt(t, f)
> > +                }
> > +            }
> > +        )*
> > +    };
> > +}
> > +
> > +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Po=
inter, LowerExp, UpperExp);
> > +
> > +/// A copy of [`fmt::Display`] that allows us to implement it for fore=
ign types.
> > +///
> > +/// Types should implement this trait rather than [`fmt::Display`]. To=
gether with the [`Adapter`]
> > +/// type and [`fmt!`] macro, it allows for formatting foreign types (e=
.g. types from core) which do
> > +/// not implement [`fmt::Display`] directly.
> > +///
> > +/// [`fmt!`]: crate::prelude::fmt!
> > +pub trait Display {
> > +    /// Same as [`fmt::Display::fmt`].
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result;
> > +}
> > +
> > +impl<T: ?Sized + Display> Display for &T {
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +        Display::fmt(*self, f)
> > +    }
> > +}
> > +
> > +impl<T: ?Sized + Display> fmt::Display for Adapter<&T> {
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +        let Self(t) =3D self;
> > +        Display::fmt(t, f)
>
> Why not `Display::fmt(&self.0, f)`?

I like destructuring because it shows me that there's only one field.
With `self.0` I don't see that.

> > +    }
> > +}
> > +
> > +macro_rules! impl_display_forward {
> > +    ($(
> > +        $( { $($generics:tt)* } )? $ty:ty $( { where $($where:tt)* } )=
?
> > +    ),* $(,)?) =3D> {
> > +        $(
> > +            impl$($($generics)*)? Display for $ty $(where $($where)*)?=
 {
> > +                fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Resu=
lt {
> > +                    fmt::Display::fmt(self, f)
> > +                }
> > +            }
> > +        )*
> > +    };
> > +}
> > +
> > +impl_display_forward!(
> > +    bool,
> > +    char,
> > +    core::panic::PanicInfo<'_>,
> > +    fmt::Arguments<'_>,
> > +    i128,
> > +    i16,
> > +    i32,
> > +    i64,
> > +    i8,
> > +    isize,
> > +    str,
> > +    u128,
> > +    u16,
> > +    u32,
> > +    u64,
> > +    u8,
> > +    usize,
> > +    {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: fmt:=
:Display},
> > +    {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::Unique=
Arc<T>: fmt::Display},
> > +);
>
> > diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
> > new file mode 100644
> > index 000000000000..edc37c220a89
> > --- /dev/null
> > +++ b/rust/macros/fmt.rs
> > @@ -0,0 +1,99 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +use proc_macro::{Ident, TokenStream, TokenTree};
> > +use std::collections::BTreeSet;
> > +
> > +/// Please see [`crate::fmt`] for documentation.
> > +pub(crate) fn fmt(input: TokenStream) -> TokenStream {
> > +    let mut input =3D input.into_iter();
> > +
> > +    let first_opt =3D input.next();
> > +    let first_owned_str;
> > +    let mut names =3D BTreeSet::new();
> > +    let first_lit =3D {
> > +        let Some((mut first_str, first_lit)) =3D (match first_opt.as_r=
ef() {
> > +            Some(TokenTree::Literal(first_lit)) =3D> {
> > +                first_owned_str =3D first_lit.to_string();
> > +                Some(first_owned_str.as_str()).and_then(|first| {
> > +                    let first =3D first.strip_prefix('"')?;
> > +                    let first =3D first.strip_suffix('"')?;
> > +                    Some((first, first_lit))
>
> You're only using first_lit to get the span later, so why not just get
> the span directly here?

Good point. I was probably using it for more stuff in an earlier iteration.

>
> > +                })
> > +            }
> > +            _ =3D> None,
> > +        }) else {
> > +            return first_opt.into_iter().chain(input).collect();
> > +        };
> > +        while let Some((_, rest)) =3D first_str.split_once('{') {
>
> Let's put a comment above this loop mentioning [1] and saying that it
> parses the identifiers from the format arguments.
>
> [1]: https://doc.rust-lang.org/std/fmt/index.html#syntax

=F0=9F=91=8D

>
> > +            first_str =3D rest;
> > +            if let Some(rest) =3D first_str.strip_prefix('{') {
> > +                first_str =3D rest;
> > +                continue;
> > +            }
> > +            if let Some((name, rest)) =3D first_str.split_once('}') {
> > +                first_str =3D rest;
> > +                let name =3D name.split_once(':').map_or(name, |(name,=
 _)| name);
> > +                if !name.is_empty() && !name.chars().all(|c| c.is_asci=
i_digit()) {
> > +                    names.insert(name);
> > +                }
> > +            }
> > +        }
> > +        first_lit
> > +    };
> > +
> > +    let first_span =3D first_lit.span();
> > +    let adapter =3D quote_spanned! {
> > +        first_span =3D> ::kernel::fmt::Adapter
> > +    };
>
> I think we should follow the formatting convention from the quote crate:
>
>     let adapter =3D quote_spanned!(first_span=3D> ::kernel::fmt::Adapter)=
;

Sure.

>
> > +
> > +    let mut args =3D TokenStream::from_iter(first_opt);
> > +    {
> > +        let mut flush =3D |args: &mut TokenStream, current: &mut Token=
Stream| {
>
> You don't need to pass `args` as a closure argument, since you always
> call it with `&mut args`.

This doesn't work because of the borrow checker. If I wrote what you
suggest, then `args` is mutably borrowed by the closure, which
prohibits the mutable borrow needed for the .extend() call here:

        for tt in input {
            match &tt {
                TokenTree::Punct(p) if p.as_char() =3D=3D ',' =3D> {
                    flush(&mut args, &mut current);
                    &mut args
                }
                _ =3D> &mut current,
            }
            .extend([tt]);
        }

>
> > +            let current =3D std::mem::take(current);
> > +            if !current.is_empty() {
> > +                let (lhs, rhs) =3D (|| {
> > +                    let mut current =3D current.into_iter();
> > +                    let mut acc =3D TokenStream::new();
> > +                    while let Some(tt) =3D current.next() {
> > +                        // Split on `=3D` only once to handle cases li=
ke `a =3D b =3D c`.
> > +                        if matches!(&tt, TokenTree::Punct(p) if p.as_c=
har() =3D=3D '=3D') {
> > +                            names.remove(acc.to_string().as_str());
> > +                            // Include the `=3D` itself to keep the ha=
ndling below uniform.
> > +                            acc.extend([tt]);
> > +                            return (Some(acc), current.collect::<Token=
Stream>());
> > +                        }
> > +                        acc.extend([tt]);
> > +                    }
> > +                    (None, acc)
> > +                })();
> > +                args.extend(quote_spanned! {
> > +                    first_span =3D> #lhs #adapter(&#rhs)
> > +                });
> > +            }
> > +        };
> > +
> > +        let mut current =3D TokenStream::new();
>
> Define this before the closure, then you don't need to pass it as an
> argument.

Same reason as above. Borrow checker says no.

>
> ---
> Cheers,
> Benno
>
> > +        for tt in input {
> > +            match &tt {
> > +                TokenTree::Punct(p) if p.as_char() =3D=3D ',' =3D> {
> > +                    flush(&mut args, &mut current);
> > +                    &mut args
> > +                }
> > +                _ =3D> &mut current,
> > +            }
> > +            .extend([tt]);
> > +        }
> > +        flush(&mut args, &mut current);
> > +    }
> > +
> > +    for name in names {
> > +        let name =3D Ident::new(name, first_span);
> > +        args.extend(quote_spanned! {
> > +            first_span =3D> , #name =3D #adapter(&#name)
> > +        });
> > +    }
> > +
> > +    quote_spanned! {
> > +        first_span =3D> ::core::format_args!(#args)
> > +    }
> > +}
