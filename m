Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE201DF271
	for <llvm@lists.linux.dev>; Fri, 12 Dec 2025 01:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765501479; cv=none; b=C3H5aSFQftcSpSaXnZ5Ho0DS/g+7CZGBli3+3icTAqgXXWt+4lc2zCZ2Gqp5GngffBG7zi+pOCookKV5O+WD3BaKwpwUzFlJbRTKjDDPjLAM+MuPmAu+EIdOpLe8L/FV8lUQtdqZJ71EI08MvrJJpAmnIqV5dJgI2BiyJkyKk/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765501479; c=relaxed/simple;
	bh=RKdh6SX2Y9GypC+Fu27yMoW70ksgsbT1xmg4oX49lqg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iWsipgZ+QZheixIbFNPtUwyKzeNQGiJclKBi49XAEWdqtSYhSlYgYWL2kwXiSJOFTYnaZQfnJf2w1aIDzBaOo6FBaYPmYz8m4yCsPtOUoT/evGRtHKeQ5fet6M9QmoASBhmxnBDfbUvwA+LgwCZr3MVEvabfSZEMbYKrMpK0YNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aXLS+8So; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aXLS+8So"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47797caba11so4458945e9.3
        for <llvm@lists.linux.dev>; Thu, 11 Dec 2025 17:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765501476; x=1766106276; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDeDYOigfVSDOdWYWJ232JALzsx3lssVRbTX+k57EuM=;
        b=aXLS+8So2xNxE7WeRs1CIt44UWiHRqQxdVqnJbnVhdklo4rmVyIbDVD2rzBmkkT5Ri
         RELl1/BLXfE8VXt94A8giuGUlc0wuWdlf43RKkfd5oHG/OKqt98igXy8knX6UP++ndUg
         Mu761rpn5VUrKpWdGxdczYd7YcWSalG8Gh5FrsSRxSmoOy/pGzSxGulK50SLNydye76o
         ajxGz+z9nxm663g9zaUAVuRsoH4gwp2uDyxb+iMuQGv24HFCMlHCO/WM+nnK4LI8F/9W
         ymGSZRIVGlaMNDxbZR26T+erh0RzrmTT0+RpzsvSDb67Ox492CIxiYBHttESmAPbWAUP
         1YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765501476; x=1766106276;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vDeDYOigfVSDOdWYWJ232JALzsx3lssVRbTX+k57EuM=;
        b=Kdj/tFKta7pRsLrG8D92pALfg4m28K6LfpA4x5tsZ9PE6v+9fhLyvBS3V8bdwhAueB
         NJanEFZQUqlSWMxSNyuHvpHDa/S7A7MDwYIjds3WDjNcfuQBF1a+86ck6927mtxvBuul
         0hzzukZbnnQOwgdkk4zILROJo7Syim0MYBajWPmJEw9LOubWTL/J9uIF4GaHlDpGZwb7
         2zdOE/2QcguR2csOBwlKkCG6lZvNxSeTMHI5nd23hy1LGhdYj7/djxVNPuCMj8u2wPWd
         XXWVvLfHooKiyyyShk16AVN1fyZeTIUCyqh9zjHxw3WzhIXx4Te+WZ3Go1DzH5q6iEAR
         pDRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJm0J0qlQ8jpOMdj3eQS0D0BzlWaj82vN6KBhaXD81aW9dYpSOQn50SiCj34OFNtwKSv6m@lists.linux.dev
X-Gm-Message-State: AOJu0YzXfB9ghoLIsurdgXuGDmmeDwiI+Q3uhuMrurlwA8LsPxvl3Q/E
	50IlSFb4OwJzn+PxntN/v7R+SLpzEdLUvbedFoQxsZ4HzxkbZo+Kp4f/NrocVkkJYgp1d9U6Rvx
	amz5gmc3Lhk+2F8lI7w==
X-Google-Smtp-Source: AGHT+IG62AMtufuC/R9NxUzH7W20Tj2XnsntNv57fg9tu7loXWLhS5+jBXLboYknGLl4vGu1cT0E2Je870UeMSI=
X-Received: from wmcq4.prod.google.com ([2002:a05:600c:c104:b0:477:774d:3832])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cf:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-47a8f9155bamr1776175e9.32.1765501476541;
 Thu, 11 Dec 2025 17:04:36 -0800 (PST)
Date: Fri, 12 Dec 2025 01:04:35 +0000
In-Reply-To: <20251124144810.2fb0e99e.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com> <aSAr-aA2U26lr3iI@google.com>
 <DEEEZRYSYSS0.28PPK371D100F@nvidia.com> <aSBy3HQ9Z-h2LbB8@google.com>
 <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net> <aSB623GKVDR2TBc3@google.com>
 <CANiq72kUk_R0HGbX4eW9iucCXergJqBBeutnh7cb8SNAzGjG+g@mail.gmail.com>
 <aSQ1VNuGHhFXYE2e@google.com> <20251124144810.2fb0e99e.gary@garyguo.net>
Message-ID: <aTtqI7Mu7LYu0fpx@google.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 02:48:10PM +0000, Gary Guo wrote:
> On Mon, 24 Nov 2025 10:37:08 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> > On Fri, Nov 21, 2025 at 04:53:26PM +0100, Miguel Ojeda wrote:
> > > On Fri, Nov 21, 2025 at 3:44=E2=80=AFPM Alice Ryhl <aliceryhl@google.=
com> wrote: =20
> > > >
> > > > You say that this kind of thing would be a compiler bug, but I don'=
t
> > > > think the compiler devs folks would agree with us on that at all. I
> > > > mean, sure, it's a bug in the sense that it's a missed optimization=
, but
> > > > it's not a correctness bug. =20
> > >  =20
> > > > I'm not advocating for adding unsafe blocks to skip bounds checks.
> > > >
> > > > And, fine, there are probably a few cases where it works reliably a=
nd
> > > > has no real replacement. Such as the VTABLE_DEFAULT_ERROR check. Bu=
t I
> > > > do not think bounds checks are a place where it's a good idea. =20
> > >=20
> > > There may be no guarantees, but it is a similar situation as for C
> > > compilers in the kernel. =20
> >=20
> > I don't think it is like that at all. We rely on non-guaranteed behavio=
r
> > for data races because we have no choice and we had extensive discussio=
n
> > about it with the compiler folks who are comfortable with us using that
> > particular exception.
>=20
> This is not about LKMM but that BUILD_BUG_ON also relies on compiler
> optimizations and reference undefined symbols if compiler cannot
> optimize them out.
>=20
> `build_assert` is just a nicer Rust way of the same trick.

But we're no longer using it in the same way as BUILD_BUG_ON.

> > > Compilers can of course change behavior and have bugs and so on, and
> > > thus avoiding to rely on it as much as possible is a good idea, but I
> > > think it is a good idea to get build asserts reliably working as much
> > > as possible for certain use cases. In particular, I don't see why
> > > simple (local-enough) bounds checks cannot be one of those (it may no=
t
> > > be today, but it could).
> > >=20
> > > Of course, the best would be to get the language to a point where it
> > > supports this sort of thing natively. But that is a longer road.
> > >=20
> > > And, in some situations, there may be no good alternative (i.e. const
> > > eval / generics / macros may be too painful to apply), and thus peopl=
e
> > > may end up adding `unsafe` instead, which isn't great. =20
> >=20
> > The difference is that someone adding unsafe to avoid a bounds check
> > screams to the reviewers that something sketchy is going on. In
> > comparison, drivers calling `Bounded::from_expr(_)` with a non-trivial
> > expression looks like entirely normal code even though it might be
> > relying on the precise and definitely subject-to-change details of when
> > LLVM is choosing to inline various functions.
> >=20
> > If const eval / generics / macros are too painful, then perform a
> > runtime bounds check just like everyone who uses Rust outside of the
> > kernel is doing.
>=20
> There're 200+ uses of BUILD_BUG_ON in include/. I see this case being
> similar to those usages.

I looked through a lot of the cases where BUILD_BUG_ON is used. All of
them seem to be checking that some constants are equal to something,
different from something, less than something, etc. It compares #defined
constants, and stuff like sizeof(struct) and such. But I could not find
even a single example where BUILD_BUG_ON used for bounds-checking a
runtime value, which is the use-case I think is problematic.

> > > In addition, I think upstream probably wants to know about this sort
> > > of this, i.e. sometimes the changes may be unintended (i.e. if we see
> > > it changing in a new nightly) and they probably like to hear about
> > > "obvious" optimizations not being applied, since they are potential
> > > easy wins for them (or, rather, avoiding regressions), as Gary
> > > mentions. That is also part of the value of building the kernel in
> > > compiler CIs etc. =20
> >=20
> > I do not at all think it's obvious that upstream would be happy about
> > this, considering it comes with the serious trade-off of us relying on
> > these optimizations happening.
>=20
> If the exact use case does not involve a reference, it's exactly same
> as BUILD_BUG_ON, so would be a LLVM bug that equally affect
> clang-built-linux.

If there's no reference, function boundary, or non-constant value, then
I don't think it's problematic. The problem IMO is using build_error for
bounds checking runtime values.

Alice
