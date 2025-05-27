Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE2915746F
	for <llvm@lists.linux.dev>; Tue, 27 May 2025 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357871; cv=none; b=tpKMxoeRcVP+1Qh4oUNcqxOWkHJI/mJiYnW1+8jsz0fXr7hgoXCR/rVZL56Yimu4YZyXMmjGqjb+XTttkRdVNLM1AVfbg6KggGyPU6tNhoofnxTZuF6FjEPOzUtXdWO/J2vpMZRTTcqgHTjE9AVf5ry0vJ4CMkjQLiG2imXG8c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357871; c=relaxed/simple;
	bh=si/3D/lqAp5z97oyh3H7Ttrei9OF36F1phtFBwnKSQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpRpsKGhmhqQjAaLxArtw/0F+POVcK/beT4BmGqyiIr+8bAY2n/+c0GZQJM6qjzbaknppD63WQlApVxV8AWY4CicwYzlNJZcNL6GHSyM5Q9KD+gRyldKkg1GZKrDtXfdbK4FaXJPYMHMhrXESQ3a8kSyTzA7kXvJvE/n0O3w06w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOG0WOuV; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOG0WOuV"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32923999549so32515161fa.2
        for <llvm@lists.linux.dev>; Tue, 27 May 2025 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748357868; x=1748962668; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNE3eNQigcgAPplki00LvwTSib7PfNi6+3iBJNr9+88=;
        b=LOG0WOuVkkjKLmftubY1CvV8DHr/GNL1vzPPBHG7Uu5kYl/1aVaCzCSf5/jxQ6c3s9
         m65VqXjTrWG0gnRxUZiSkZmdMDoXzNSg0S4pxG+VyE5iBEV5y4zhTR3Wi16oVZWPxu1a
         Si6dSiPY1D+xT0RD9LA/bprkL8vVl455tStSKo9B3VsxiFYM9L7uL49/1U/lhpo6aNS/
         ITBZHADWukikjcO9tbrQvgC+tLLl+yE7H6ZGmX4P9xOHTLeeOhOJ+x19ICxCz7Kh5H/9
         sYe14G8Y+s25PJI/cryaq76JkEyl8R/hznb4m7/BhijXxIIHMowkEPo0KkAaoYgYbZig
         dejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748357868; x=1748962668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNE3eNQigcgAPplki00LvwTSib7PfNi6+3iBJNr9+88=;
        b=LnPayCesGC0ZHPPBxu62h2DhVvOjrIF/B+UXV1mW2SC1MAw8mgCMzDLCzt/2LJ/iDl
         +3xXZZEyPnAIpY9fePrkjKjC5/otoqvZmU4O0VrhGAyQwAHgESjnmvckMRsLyN7IdGPl
         TauJa9RlgHBilcKHEofRiY8i6DiTNOQ6BdLhldtXWPhI0pYh71eF9Ud1u+ASuoj5eYHs
         n40ClWiAseTjUnlkoEmgabZ4biJtpyEbhtRPb5GiMzeUwPzyGxsxO1CJMnYSvzM/tRKz
         taPKTSaA0+RXDgPrAQDleH5QTsbzF88TLdrPIZKAhCo2KlGgZVB/cUPiq+xtbYe3m6cN
         O6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCW+IMqk0DR8Chp0nFlGMk9OciyGA+nwijPLiD8DXsciIHweY6RCYTKz7P2iSCAPHLaaG/kT@lists.linux.dev
X-Gm-Message-State: AOJu0YyTRZ3g6tQaWSF9SIjC7ssGm/pYKPyysO8ei5jloz70rSWqjBY7
	9fpU/xl8hdlC1GZgTHX19BzFXDK3mdHi7zwKNwERQIhv/+hwQWLoe+iJNdjRHUw/ZtcA44SPItr
	YPBjQeQ8D27keu+KtM3YnVp0WFWZYoL04pa5i6sFM1Q==
X-Gm-Gg: ASbGnctdleva+ars850KyROIHCmBl/hapkx/u8rorgsk23WoI6ZLcWM4RLI9bvrjUsR
	GtpArcpk0H0fYsNY9Z4SGAUM5LkKuILQTW/JVq1CFbQmks5TJ3zKTrh40nLHGO8N+ImpNOjalgk
	epskoh+e4WhwnW+unvZRHiw3fkIsYZQX81lgldVHH+nudzUVgV
X-Google-Smtp-Source: AGHT+IGMpsgNs0H0v36WCubbxlinvgNLfiVk9IX6EmewrCYJWnUCTsflWg1QTkNc19iE0AzQz3ot/ZAJjdnwjF/SkXc=
X-Received: by 2002:a2e:8a93:0:b0:32a:604c:504e with SMTP id
 38308e7fff4ca-32a604c5122mr6252591fa.38.1748357867433; Tue, 27 May 2025
 07:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-2-6412a94d9d75@gmail.com> <DA66BBX1PDGI.10NHLG3D4CIT7@kernel.org>
 <CAJ-ks9m48gmar0WWP9WknV2JLqkKNU0X4nwXaQ+JdG+b-EcVxA@mail.gmail.com> <CAH5fLgiUhvp9P7oSf4Rtv5jK1SNebW9-r5YFHVzCZjEwaR=Mjg@mail.gmail.com>
In-Reply-To: <CAH5fLgiUhvp9P7oSf4Rtv5jK1SNebW9-r5YFHVzCZjEwaR=Mjg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 May 2025 10:57:11 -0400
X-Gm-Features: AX0GCFv2oY8lzrXQtwfj6_dQyq0RFoGjtHhR6-NzX_hnZZ_7RGNdHOXxleigo1M
Message-ID: <CAJ-ks9=prR2TNFhqip8MsjtTWKkoUhoMG75v2mSLF1UaRNwJLg@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] rust: support formatting of foreign types
To: Alice Ryhl <aliceryhl@google.com>
Cc: Benno Lossin <lossin@kernel.org>, Michal Rostecki <vadorovsky@protonmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 8:44=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, May 27, 2025 at 12:18=E2=80=AFAM Tamir Duberstein <tamird@gmail.c=
om> wrote:
> > > > +}
> > > > +
> > > > +fn make_ident<'a, T: IntoIterator<Item =3D &'a str>>(
> > > > +    span: Span,
> > > > +    names: T,
> > > > +) -> impl Iterator<Item =3D TokenTree> + use<'a, T> {
> > > > +    names.into_iter().flat_map(move |name| {
> > > > +        [
> > > > +            TokenTree::Punct(Punct::new(':', Spacing::Joint)),
> > > > +            TokenTree::Punct(Punct::new(':', Spacing::Alone)),
> > > > +            TokenTree::Ident(Ident::new(name, span)),
> > > > +        ]
> > > > +    })
> > > > +}
> > > > diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> > > > index d31e50c446b0..fa956eaa3ba7 100644
> > > > --- a/rust/macros/lib.rs
> > > > +++ b/rust/macros/lib.rs
> > > > @@ -10,6 +10,7 @@
> > > >  mod quote;
> > > >  mod concat_idents;
> > > >  mod export;
> > > > +mod fmt;
> > > >  mod helpers;
> > > >  mod kunit;
> > > >  mod module;
> > > > @@ -196,6 +197,24 @@ pub fn export(attr: TokenStream, ts: TokenStre=
am) -> TokenStream {
> > > >      export::export(attr, ts)
> > > >  }
> > > >
> > > > +/// Like [`core::format_args!`], but automatically wraps arguments=
 in [`kernel::fmt::Adapter`].
> > > > +///
> > > > +/// This macro allows generating `core::fmt::Arguments` while ensu=
ring that each argument is wrapped
> > > > +/// with `::kernel::fmt::Adapter`, which customizes formatting beh=
avior for kernel logging.
> > > > +///
> > > > +/// Named arguments used in the format string (e.g. `{foo}`) are d=
etected and resolved from local
> > > > +/// bindings. All positional and named arguments are automatically=
 wrapped.
> > > > +///
> > > > +/// This macro is an implementation detail of other kernel logging=
 macros like [`pr_info!`] and
> > > > +/// should not typically be used directly.
> > > > +///
> > > > +/// [`kernel::fmt::Adapter`]: ../kernel/fmt/struct.Adapter.html
> > > > +/// [`pr_info!`]: ../kernel/macro.pr_info.html
> > > > +#[proc_macro]
> > > > +pub fn fmt(input: TokenStream) -> TokenStream {
> > >
> > > I'm wondering if we should name this `format_args` instead in order t=
o
> > > better communicate that it's a replacement for `core::format_args!`.
> >
> > Unfortunately that introduces ambiguity in cases where
> > kernel::prelude::* is imported because core::format_args is in core's
> > prelude.
>
> I'm pretty sure that glob imports are higher priority than the core
> prelude? Or is this because there are macros that now incorrectly use
> kernel::prelude::format_args when they should use the one from core?

compiler says no, e.g.:

error[E0659]: `format_args` is ambiguous
    --> rust/doctests_kernel_generated.rs:8783:25
     |
8783 |     kernel::kunit::info(format_args!("    #
rust_doctest_kernel_workqueue_rs_3.location:
rust/kernel/workqueue.rs:77\n"));
     |                         ^^^^^^^^^^^ ambiguous name
     |
     =3D note: ambiguous because of a conflict between a name from a
glob import and an outer scope during import or macro resolution
     =3D note: `format_args` could refer to a macro from prelude
note: `format_args` could also refer to the macro imported here
    --> rust/doctests_kernel_generated.rs:8772:9
     |
8772 |     use kernel::prelude::*;
     |         ^^^^^^^^^^^^^^^^^^
     =3D help: consider adding an explicit import of `format_args` to disam=
biguate
