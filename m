Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435491D555
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980633; cv=none; b=kMbsQDJZA5VduXhEx+Oz7kcpIgwfNBl5AGfaWm4TKIBcp+/CSwGv0bn9s7Bb2x+yKWpIvCpWb3uKkIKepJbgLEGLog/dvHAvDog1A2m1llzWz/E/pcKagtLyWP0OEbN0iG8CmeBHyP03mPTlAqXc2Y36y48PCpl60KnftKSJBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980633; c=relaxed/simple;
	bh=01BmKKKJ8kuw55IuF7dgwaG/VYDxOrM6v2MxQRAZNk4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p8wrfV9Kuw40nPlGetol9EyW+afM3FC5vIxq5BAhvkKZltXAKnuVzWqguW3sRHj8HNpezHuAchxa0r4IxHa0saxAgczuMmKrXhsx++XKPh0AsxavQ2+2jVVFAfAbTAAV42+GSYnjc/Saqguuzah5rtWtHkKa+jrmLNVhAUx8FkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GKEVViqh; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GKEVViqh"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-429c5c8ae3bso3753548f8f.0
        for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 02:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763980629; x=1764585429; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01BmKKKJ8kuw55IuF7dgwaG/VYDxOrM6v2MxQRAZNk4=;
        b=GKEVViqhH/NkrF6nFb7SOMq3QHA8e4DkUHp4gu1vkPGwmbEW1K79NQMP09P5iP/zgC
         64Fjidw7eO0oOVyqcCTKMknYe2litz4EdkBchbzomAvb7MFAcXuLHjarF57guPzIl+zM
         mS2t5c6H2jZnuMN9jY0Yc01liXglLDS9KK6PPdM/WLrqaYYdPjO8YYBXJxwS2D1o9ozT
         18vyhBJl3zg9ciI4EorcS1S2tmyMOLYLMQ5kOwGdpExUz57kugHmsXMWt5F75DnfVEJm
         Uv25Zg3Me7GASJNM8cJyo9GnjZr5cmwOws16ml+kwNh/BLVaQU0ZyQUy8rhf5X3tEgcj
         MHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980629; x=1764585429;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=01BmKKKJ8kuw55IuF7dgwaG/VYDxOrM6v2MxQRAZNk4=;
        b=FeUM0fLx9Dhsv3O0Zoh+Um5st4qlJffyo+ZYOaPceSkS8zMhaN02njBT/ZjW9LiHSi
         lAjjHXmbRHS4cYmLMt7t5K9Q/ameNj6ZBZ46h78IYHF5OEYEsL0/mGZphslpKyhH14m5
         PNGZQV1lkHxdRbi7vg/YL0oDXXNOLL+79WWL7vlqAqcMxOwJPBPefrosiajdy+jfAptS
         OT54UK18b5I/6G1rRvgQ5m91vksyX4/7UrRIChF8rg8oYkP8VXU2p5yOgzhtC+9PltRo
         PEgC1AORnCVnc/ARQtsh40IQ+6JZI+YcJPxWIjvScf7i4SRyAFJq4oWprAm6DXgAUmFw
         +GPw==
X-Forwarded-Encrypted: i=1; AJvYcCVeBbeT6ORT+gghR9pBVFijkoaNbzs5PSmK9R4O959OZpKq2LoTFPX0AOsHe5qUKxNtI8d9@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv2ANSwdwvnqSkYnA1av450t/p16X12QWzFAcG+hFQ9oLbSGbQ
	Mc3QJr2WoZvfM13SLxC9cSg4udT/ibP0zYX6Ve0Oj6NzMLT837AIe+Rs4DCxLci1G2aBzyA9AsF
	F5WDYImyo8GVHVzRD/w==
X-Google-Smtp-Source: AGHT+IE2yokmewMf29r7t0Tp3HawkoriayU3mB+EfJnackxr+OT2gdsbbfeMVJhXKYwaqU6lVz6HFHSUl8RSBQ8=
X-Received: from wrwb6.prod.google.com ([2002:a5d:6346:0:b0:42b:5d42:f6b6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:186b:b0:42b:3366:632a with SMTP id ffacd0b85a97d-42cc1d194camr11979436f8f.39.1763980629720;
 Mon, 24 Nov 2025 02:37:09 -0800 (PST)
Date: Mon, 24 Nov 2025 10:37:08 +0000
In-Reply-To: <CANiq72kUk_R0HGbX4eW9iucCXergJqBBeutnh7cb8SNAzGjG+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202511210055.RUsFNku1-lkp@intel.com> <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
 <aSAr-aA2U26lr3iI@google.com> <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
 <aSBy3HQ9Z-h2LbB8@google.com> <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net> <aSB623GKVDR2TBc3@google.com> <CANiq72kUk_R0HGbX4eW9iucCXergJqBBeutnh7cb8SNAzGjG+g@mail.gmail.com>
Message-ID: <aSQ1VNuGHhFXYE2e@google.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 04:53:26PM +0100, Miguel Ojeda wrote:
> On Fri, Nov 21, 2025 at 3:44=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > You say that this kind of thing would be a compiler bug, but I don't
> > think the compiler devs folks would agree with us on that at all. I
> > mean, sure, it's a bug in the sense that it's a missed optimization, bu=
t
> > it's not a correctness bug.
>=20
> > I'm not advocating for adding unsafe blocks to skip bounds checks.
> >
> > And, fine, there are probably a few cases where it works reliably and
> > has no real replacement. Such as the VTABLE_DEFAULT_ERROR check. But I
> > do not think bounds checks are a place where it's a good idea.
>=20
> There may be no guarantees, but it is a similar situation as for C
> compilers in the kernel.

I don't think it is like that at all. We rely on non-guaranteed behavior
for data races because we have no choice and we had extensive discussion
about it with the compiler folks who are comfortable with us using that
particular exception.

> Compilers can of course change behavior and have bugs and so on, and
> thus avoiding to rely on it as much as possible is a good idea, but I
> think it is a good idea to get build asserts reliably working as much
> as possible for certain use cases. In particular, I don't see why
> simple (local-enough) bounds checks cannot be one of those (it may not
> be today, but it could).
>=20
> Of course, the best would be to get the language to a point where it
> supports this sort of thing natively. But that is a longer road.
>=20
> And, in some situations, there may be no good alternative (i.e. const
> eval / generics / macros may be too painful to apply), and thus people
> may end up adding `unsafe` instead, which isn't great.

The difference is that someone adding unsafe to avoid a bounds check
screams to the reviewers that something sketchy is going on. In
comparison, drivers calling `Bounded::from_expr(_)` with a non-trivial
expression looks like entirely normal code even though it might be
relying on the precise and definitely subject-to-change details of when
LLVM is choosing to inline various functions.

If const eval / generics / macros are too painful, then perform a
runtime bounds check just like everyone who uses Rust outside of the
kernel is doing.

> In addition, I think upstream probably wants to know about this sort
> of this, i.e. sometimes the changes may be unintended (i.e. if we see
> it changing in a new nightly) and they probably like to hear about
> "obvious" optimizations not being applied, since they are potential
> easy wins for them (or, rather, avoiding regressions), as Gary
> mentions. That is also part of the value of building the kernel in
> compiler CIs etc.

I do not at all think it's obvious that upstream would be happy about
this, considering it comes with the serious trade-off of us relying on
these optimizations happening.

Alice
