Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF02C2E8B9D
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734241; cv=none; b=Br4Gj37/WQJWw9tpdUtTLXq1C//0nOiYvOn2w7p5qSdjuG/i8hPIh9wperxF9hI+SvYzL6yuDvA5wG4sJ9Pl09b59lhoW2L9D74yKbh2Sl/TDNMwleUH2q+jOtk1CAA4C/2LgJwiNHEJmq8BBv6yCoQOrq1+SSwfQYT7TDDA1wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734241; c=relaxed/simple;
	bh=rXOw+c8UTUZEjbuo8mLuqnRZrzETuRIQOR3eztUrTlE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yb2qtemn1/gLKEmaQEEb8qoPW+4Pdi2YU4xFEfyegC5bNNSJqbPVvB40VS5lrp/3Fj4mSg0DJLKRE4ci0XfMGJyr6YPmyhAcrCLCJWNTXvXZaGCFFserfSQkRYxT/6K1cRfaDZj02l/+07JiQkzxtFECZcKCyeakFuEeZWuvBgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zrJ/WmuB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zrJ/WmuB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4776079ada3so17816535e9.1
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 06:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763734238; x=1764339038; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bBOaWzj421YsoP6L9S3tWnW5T/nwInlX1XYaAFMoacs=;
        b=zrJ/WmuBZ2YAxfctLCbPrpyAkeBhsw08cVetyibQ1UoFOk2Rg5hn7l2G1nitNB3Q0M
         WPUhxQCxnHSYizS79pD8TG2s33aWCgahTjUjyBgwcuF8Cj+aaKXypRUAReqO00Bj0RvT
         fUXI7WRkcwHdFHW1S1tzA0nYckxLxxJqAa64nKsJ/t4bCwHBQvI38FOYKrMQvkJJrDUM
         o4fYl+uivVNJ5wJf6yLTFufH2OdVlKPio3Wk310JC+C3ituoWyqWIrsoB7mdZxRVrO3A
         WeKDfN9xtAd6+zZda5vCqT8ZWeXWT0K/YMNJeiobLWXprTaRPrNmTc1jt3hFZvmlKdhj
         Jadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734238; x=1764339038;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBOaWzj421YsoP6L9S3tWnW5T/nwInlX1XYaAFMoacs=;
        b=mAXLwDWr3nOc5Uux2zGYKTRVDEwhakgHVaLolLPWd9FlMiZoWXLVsEnPQB/7CrkJJB
         DvmaFpyXlDSLWs83QcvPDUsx/NYA0qeNnTi0dcynxRr1PIeQ15lan/dxoDRtbaUzfWfk
         jwE2jzlkGfM9d4sQXbeFd4qHZ2AmB2tuWSGwb11DBVVGDUpILQDYnG029XyeuwR7lk1Y
         HczDmakvtClrk/OxeFqF5cHAHNSgQtp+Rznu1ZZteyl1TbTSoQ81LrwT3cN9uc2OV9C+
         Mdg6vYS7+QH4hmUu5CRBYbE/HioXtMjrtNCn2g2Q+k2CYRtGLhPzE3bls+zAaJjonXIf
         CBLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt0To4s6n8BkXjSQddextldb6rMkc0dPXocjMg/QfFZ2ld5KkAkRgFY9gSmUdDIrQKOiTa@lists.linux.dev
X-Gm-Message-State: AOJu0YyEMDOcU2dHOIlbdrNh0AJTVynudC0ANYydXDTzS47ocA8rpenE
	q302XH0wd6iC78T/qE8XLxIwmBj9hcvp5LS/r9nZqBY6bCMSpmRUjxvh9dlZiJb8fpNed81Te0+
	b2CCYcBp9QeiGB32/7g==
X-Google-Smtp-Source: AGHT+IHiDz9TgYsNAoHhZq0D92Mp48pVcUKJIgrn4QbzYH5pIa8WFeVjC4TFWqkndvp4qmNx9YBKpGrorFWApAU=
X-Received: from wmbjd14.prod.google.com ([2002:a05:600c:68ce:b0:474:979d:a20d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35ce:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-477c016c071mr33656395e9.7.1763734238173;
 Fri, 21 Nov 2025 06:10:38 -0800 (PST)
Date: Fri, 21 Nov 2025 14:10:36 +0000
In-Reply-To: <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202511210055.RUsFNku1-lkp@intel.com> <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
 <aSAr-aA2U26lr3iI@google.com> <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
Message-ID: <aSBy3HQ9Z-h2LbB8@google.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 21, 2025 at 10:41:46PM +0900, Alexandre Courbot wrote:
> On Fri Nov 21, 2025 at 6:08 PM JST, Alice Ryhl wrote:
> > On Fri, Nov 21, 2025 at 03:13:16PM +0900, Alexandre Courbot wrote:
> >> On Fri Nov 21, 2025 at 1:41 AM JST, kernel test robot wrote:
> >> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> >> > head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> >> > commit: 01e345e82ec3a5a7edeb9fa0dcb7fd4b0e5c534e [9676/10599] rust: num: add Bounded integer wrapping type
> >> > config: loongarch-randconfig-6002-20251120 (https://download.01.org/0day-ci/archive/20251121/202511210055.RUsFNku1-lkp@intel.com/config)
> >> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> >> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> >> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210055.RUsFNku1-lkp@intel.com/reproduce)
> >> >
> >> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> > the same patch/commit), kindly add following tags
> >> > | Reported-by: kernel test robot <lkp@intel.com>
> >> > | Closes: https://lore.kernel.org/oe-kbuild-all/202511210055.RUsFNku1-lkp@intel.com/
> >> >
> >> > All errors (new ones prefixed by >>):
> >> >
> >> >>> ld.lld: error: undefined symbol: rust_build_error
> >> >    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
> >> >    >>>               rust/doctests_kernel_generated.o:(<kernel::num::bounded::Bounded<u8, 1>>::from_expr) in archive vmlinux.a
> >> >    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
> >> >    >>>               rust/doctests_kernel_generated.o:(<kernel::num::bounded::Bounded<u32, 4>>::from_expr) in archive vmlinux.a
> >> >    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
> >> >    >>>               rust/doctests_kernel_generated.o:(<kernel::num::bounded::Bounded<u16, 8>>::from_expr) in archive vmlinux.a
> >> 
> >> Mmm, I don't like this. The expressions that are failing are extremely
> >> simple, for instance:
> >> 
> >>     Bounded::<u8, 1>::from_expr(1)
> >> 
> >> So if the compiler is unable to assess that this won't fail, this might
> >> be a deal-breaker for `from_expr` and we might need to remove it. :(
> >> 
> >> This would also mean a lot more runtime checks when working with
> >> bitfields and registers. Or can we assume that this is a compiler
> >> problem on this particular architecture?
> >
> > Yeah, it sounds like from_expr() isn't going to work.
> 
> It would be a pity but we can replace `from_expr` with an unsafe
> `new_unchecked` for these cases where the caller is absolutely sure of
> their input. I have tried on bitfield/Nova and the result is not too
> bad.
> 
> Still, this is a bummer - it is much better to have the compiler
> validate safety properties than relying on a SAFETY comment.

This kind of thing is why I keep saying build_error() is too fragile to
be used at all.

> I notice that loongarch is a Tier 2 Rust platform, but I suppose that's
> not an excuse to let it not build? ^_^;

What Tier upstream Rust uses for the target is irrelevant for us IMO.

Or at least, it may be relevant in the "add this target to Linux?"
discussion. But once we added it, it's not relevant anymore.

> If I had to bet I'd wager that in this case the "shift left then back
> right" technique to check the bounds is not working well. I will try to
> find an alternative, but meanwhile we should probably remove
> `from_expr`. I will send a patch to that effect unless told otherwise.

Alice
