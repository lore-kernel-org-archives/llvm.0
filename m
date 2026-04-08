Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA773ACA43
	for <llvm@lists.linux.dev>; Wed,  8 Apr 2026 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649233; cv=none; b=teBzhAO7lyCKIEWQJrvxg/ij6cd8NqLeJCyzaXDQznuLbQE+yxkUIUGvJSYFPmypyQufvWRZjNmbKpTdcmGf8tRCQIb6a8Olt3/mVbhPNC2w1NFsmy4ZNKCah2VDDBZgpMPtUMaYl24RbdB4P3Ux/kkrfw3cDxawXbv4BNkgDBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649233; c=relaxed/simple;
	bh=l5pRn8VKgWrs9WZBeUglbsiiC+XjHh/0pSnjInVvhmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRNm0S6Hf80rXOXxZgQvuTtDicQIQ4D4Wpn9zvAQejDeR66waiJT8oyU7p6ZfBYACPUJ0tABfDQX8QjBVPk7KFYerK085MSjRD6t4ig+juS3jA3Rc0fKpDpZYNe+QjM0QnURJdmfN7FQUg3tFYNnTqQan3qqP9+p2qUHvIwuk3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8cwHdy3; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8cwHdy3"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35c2fe0d90fso3856042a91.1
        for <llvm@lists.linux.dev>; Wed, 08 Apr 2026 04:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775649230; x=1776254030; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eoc0I6ZFUNdwIm009oH3G2THpKBnhPvBaJWle5ck1ck=;
        b=V8cwHdy3soJ48S5q6kv2mJZTCwO67XmO9cgmZiFjww+z+Z6J/EB1V8KD+0d+7Trzkz
         uJkqU2UNt1waFV8zaLBpgY/xDmtz6tiefOwFb1EpqyXZzWR19+EbOnCKXobvz0ni/QIX
         hq3JaQ0ud8x1iD2sJIwuqb37hOCQB9cQ2lgBQR9POHZR8kNug5Mq0UOwWyJvxZPcvQIS
         mI0Xk4GoKMRY+FME81gB+Q50DFQ0DqqBc1f3DbJ7pcu67MrVTNGZrRJdZzliPc6omFkq
         nOp/xsIC/3UIWfGADJh7CiwZaICi/WYF3YnpaDsshDqQ44kCQtuN0O3Jm4oyNDEGOxjk
         kh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775649230; x=1776254030;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eoc0I6ZFUNdwIm009oH3G2THpKBnhPvBaJWle5ck1ck=;
        b=RDcok9yEp0D9IqfObhZln9oDW3Nr5CQ3voeduDnhgp14y4K48z7pySjOLLeoKlIWWh
         ZRA9K1BaRain1To18HlcnYAGXzrwARd5owep01s0z1A/rsNr+QCV0oQz0Hn5YF1IBwTI
         qjXIjLRWlnQQXX8XeipwaIAzhDllzcyz0m7C0lwVnzX6/Dx4FRwYHoCgtp4485N9S/C4
         WmugTtdvsm3dNtCn+caFqFasfk+WVRfl0UvLkNafal3l1iTjbJ6O56eftezwj8+rOXHi
         gdVX17YpE0GRsvsn0qdlx82zytHKn8POZxuS8grvTvh+A7LVRV4K+SAYQkg4I9M4sEno
         Chjg==
X-Forwarded-Encrypted: i=1; AJvYcCWpBR8SCsWStcfbjJesuIMSY+ks9XGFZdjF/G0RpI2QA2MuzOgLxaVjTjt84SJdMWaYkN7/@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3AHCFrHt0BwHOtozNh2qT5ttUf8kQFI3wdvrxY34sxaumUat7
	/5dDxrAqZ3BFS1OjxPLlKVzBizO7SV7dfIQnAA9koEh3HtZs5tdZVAbh
X-Gm-Gg: AeBDietEyvh72Lq1thuTKEl+NwlUFcjlB10LvBufEepnzukHKwXa2n7CQPkQ18oLPTn
	d7KvVOpgn0pY1SS/3M53N37n/FzNFt3VtHtNQSWH1FU7F6iA9AkTC/o84YD5HXKP1Ux4/r6dOde
	ZOC8QLItqQLc5dgoptDL/AIkIEK3o92r9n9s71sSn/uuaMU2kXMLMyj7Fj/7QVZpyqzJK9Ju1U/
	cvRNw9IsCd1mePrpihUsbjzDobzBLIfzT3HDnQ0lm7KG55g4McFBwr/y6d9CTU1trOuk7dmWgYb
	f/R3dqzOZj5XUTqaLtetEfkxZRTgR2CHhrQJeP5Zl6oiVfm1dzGlI4Na/L2JyOkVXeiv2UXRqoJ
	XXZvGHWzdvhZN6yT48GdxXi/FeC8IIBAIXvkwC760En0w0D7EbH1zHathO59DyffOF+aXI4QrSU
	bj17vdCyoGMvSRuMCOcdp4STtO7OaKxBn5a8bzoxikMX0jziJZAPZEIvbGUo1MbkdA8LU=
X-Received: by 2002:a17:90b:54cc:b0:35d:a542:2dc0 with SMTP id 98e67ed59e1d1-35de67dde76mr20971504a91.8.1775649229978;
        Wed, 08 Apr 2026 04:53:49 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9379f3sm25672851a91.9.2026.04.08.04.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:53:49 -0700 (PDT)
Date: Wed, 8 Apr 2026 17:23:39 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V10 0/4] Rust support for powerpc [RESEND]
Message-ID: <adZBWoVVoJefiTcM@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260406200149.3727922-1-mkchauras@gmail.com>
 <adYlLLfRgSyxus3n@luna>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adYlLLfRgSyxus3n@luna>

On Wed, Apr 08, 2026 at 11:51:40AM +0200, Link Mauve wrote:
> Hi,
> 
> (This email is a resent, my IP address got flagged by spamhaus again
> because I’m on a residential range, hopefully this incident is
> resolved…)
> 
> On Tue, Apr 07, 2026 at 01:31:45AM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > Enable experimental rust support for ppc64le and ppc32be. The patch for
> > ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
> > merged over it. ppc32 needs some toolchain fixes mentioned in the patch
> > `rust: Add PowerPC support` and the discussion for that is done here[1].
> > 
> > This has been tested on
> > - powernv9 hardware
> > - pseries P11 hardware
> > - pseries(9, 10) qemu
> > - powernv(9, 10) qemu
> > - rustdoc on x86 and powerpc64le
> > - rusttest on x86 and powerpc64le
> 
> I just tested your series for the Wii, so targeting powerpc (32, be),
> and got this error:
> ```
> error[E0463]: can't find crate for `pin_init_internal`
>    --> ../rust/pin-init/src/lib.rs:365:11
>     |
> 365 | pub use ::pin_init_internal::pin_data;
>     |           ^^^^^^^^^^^^^^^^^ can't find crate
> 
> error: aborting due to 1 previous error
> 
> For more information about this error, try `rustc --explain E0463`.
> ```
> 
> I didn’t get this error in a previous version of your series, would you
> want me to bisect them?
> 
> Thanks for your continuous work on it anyway!
> 

Hey Link,

Thanks for testing this.

Can you give me the command generated via make with V=1
e.g. `make LLVM=1 V=1`

Regards,
Mukesh

> > 
> > We are actively working with our LLVM team to get the target for ppc,
> > ppc64 and ppc64le in the rust compiler.
> > 
> > 
> > [1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
> > [2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com
> > 
> > Changelog:
> > V9 -> V10:
> > - rust/Makefile updated with review comments from Miguel
> > - Patch 1/4 updated with commit message and subject
> > V9: https://lore.kernel.org/all/20260404121610.1956528-1-mkchauras@gmail.com/
> > 
> > V8 -> V9:
> > - rust/Makefile updated with a directory instead of abspath
> > V8: https://lore.kernel.org/all/20260403145308.1042622-1-mkchauras@gmail.com/
> > 
> > V7 -> V8:
> > - rust/Makefile updated to separate host libraries from target
> > V7: https://lore.kernel.org/all/20260329160254.2592207-1-mkchauras@gmail.com/
> > 
> > Changelog:
> > V6 -> V7:
> > - Documentation removed as powerpc is still under development
> > - Added a fix for race condition in rust/Makefile
> > V6: https://lore.kernel.org/all/20260210090023.2587534-1-mkchauras@gmail.com
> > 
> > V5 -> V6:
> > - Added a missing Tested by from Venkat which got missed since V3
> > - Support is marked as Maintained instead of experimental
> > V5: https://lore.kernel.org/all/20260210053756.2088302-1-mkchauras@gmail.com
> > 
> > V4 -> V5:
> > - Removed a nested ifdef from PPC64 for Little endian toolchain
> > V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com
> > 
> > V3 -> V4:
> > - Co-developed-by header added in patch 1
> > V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com
> > 
> > V2 -> V3:
> > - Splited HAVE_RUST in 2 lines
> > - BINDGEN_TARGET_powerpc initialized before assigning the same to
> >   BINDGEN_TARGET
> > V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com
> > 
> > V1 -> V2:
> > - jump label fix for rust has been moved to a separate patch
> > - PPC32 support has been taken
> > - rust support has been marked experimental
> > - target.json dependency has been removed
> > - HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64
> > 
> > Link Mauve (1):
> >   rust: Add PowerPC support
> > 
> > Mukesh Kumar Chaurasiya (IBM) (3):
> >   rust: Fix "multiple candidates for rmeta dependency core" error
> >   powerpc/jump_label: adjust inline asm to be consistent
> >   powerpc: Enable Rust for ppc64le
> > 
> >  arch/powerpc/Kconfig                  |  2 +
> >  arch/powerpc/Makefile                 |  7 +++
> >  arch/powerpc/include/asm/jump_label.h | 23 ++++++----
> >  rust/Makefile                         | 66 ++++++++++++++++-----------
> >  4 files changed, 61 insertions(+), 37 deletions(-)
> > 
> > -- 
> > 2.53.0
> > 
> > 
> 
> -- 
> Link Mauve
> 
