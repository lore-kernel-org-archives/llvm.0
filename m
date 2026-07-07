Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3107A3EB81E
	for <llvm@lists.linux.dev>; Tue,  7 Jul 2026 17:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444330; cv=none; b=ecwSUtBtWYEJXFVPftDB8hMIXLanKwFdtC5kn2vnubeW2p60LgMovUH/u9jiZvaodKGQfDLs4rmczwg183rjXy28B3BN6yqVPo0vVEQO2XLfZ1ItNC1bq6Fveg+ZyGsY72yGU1HaiXr1hgv1rypFt08KPWWa/iwhoun3I1n6CpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444330; c=relaxed/simple;
	bh=MZlwoLji55LDEIi/ba35T6ENHdW58XbSVzpHtLVVU/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuVeEVm9Oh+3GMHp9Vcer+8S0cGNhBDp1GzfcIDHlQI4pB2Pmr29vIaV/NMDkZh0Zt54vvbtbezxQTeB7CkelPzzm5HLaLXnJB46OR5cldpC+0tjDfX4mCyOCO7usyPJajbXhCPd76rsdtWzaH5X4AQlPe9CXanxyFWvLIBPxUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3SoRaHM; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3SoRaHM"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e2489e117so2575884a12.0
        for <llvm@lists.linux.dev>; Tue, 07 Jul 2026 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783444328; x=1784049128; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=maQBLqx55rvjjXzubLY4/j31Yf1uTR7Ozp3LJ/moHrI=;
        b=X3SoRaHMRjPqYQcIXiKROjfx6fayBdMtMbp0CcveFdE2fAMEfUX3m6tTYUJWKxhzqi
         KgnyjQrbQ9Ng2IaLhZGRi5mQ73gENBlIGDjiAffheP3NkLMrv6dB3HicEdJK3gVqB0HH
         Px7sU1dZlsuNNng/Sfi0J/hVIJgojBKJYkg8s5WlTs2+w7QOdvnDAQuC7dnfbS1/eGgB
         losg8sNw3bkLqtIokf2ZeDXTVF+6habd575R2Udklw9u7KGeg9L5URjFviIDMvuu7fwr
         qVmHkV467WDdNINTmpt9X/9rsmRRC3iJKAXDnmUUC53PlUX34bbJ8K49hKxj7v5Zvtoq
         kdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783444328; x=1784049128;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=maQBLqx55rvjjXzubLY4/j31Yf1uTR7Ozp3LJ/moHrI=;
        b=gSspKJAdAN+ay1QUKqIeBQ0CuxBF6rN2IoEcmSO3UgV350uXzMGzUbjL8ppd0VUblP
         3gC4SxbbdH7l4oppKkKKWXtWbCwblw6R5aQQgJQrNg08jAFlCYKixSpkpaWdhH/vVZkd
         OjRMeD7D6Oji7PYFK/jFo+wVENavTWsN+3KpYNlRXxxENY7/MZbXVj1tFHWw4jxOElur
         +kRNJPmJyyyqyS8jOcXMc6AIkttnE0SlLOTYAYf7175z97S09tsDsKgF4zNftNpZy9XD
         h6cOr/X2QMaah+BCYMgb52GoXsYoJjqwzP3sdv0Hgglg8Ss5uXxOgiO3WKAtnWJRDbLm
         HyxA==
X-Forwarded-Encrypted: i=1; AHgh+RoDkHDce8Yvc5MhU2BcR9+XPbt+dxqOu4tkbGcTVZJPU13xfcgbvYysKaci7YJSpYS1OrcE@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6UD5QXH1V3TE55OvQ6mqmbiRYK/WYjfBIcWv7jQVTlvrE3qW4
	gaaCVmPsgjW2eGmGca4SbbckB4Uf9tziz+y3pjvTbUJCAyfCr1IF8ph5
X-Gm-Gg: AfdE7cmEehm+QedXOC3m+tCbR+CdyXWoAyQd6etXv3qXLXuPofOFWEsU510DybvNJE0
	5z4xIVdn/VB+uQF0ALf0wpJ19K42y9NQGKoVTJn3U7t+FpZJJ47XE/EjDKS22K+GRuqAwR3qThJ
	umFWJHJCwa4E+bv/Ed1iH2SrENf7gzUy9t8LR8S65cqNWAnK7uQwuKU9wdnklmNWE4oePqTXQsT
	Jz3Etzx5pf+RaraLArCaRDtZo1b3TCQaqHEuFs5ZmypLBlgmHtIeJg++Lkwlyw6QnKI9sbj35Hk
	YlBaPpKKD/PK8HGUcoZxC6d0RDp0ZY+p5CN7C92Mt2muxwl7gkfix5CvUAuV5eJifdLqHOFna6H
	bcEue75V6C5VFllXVt0x2D4B+5U7ytcy7qnZWN13CT4gkpVjnCuzYXCRw/kjZ/VWL9aO6oDqTir
	mhYT+tyeocZM/nVzC+uElV9utBIcx84vdixrdKOkKEXQtWxHGBVjKQ5VTu8Kik
X-Received: by 2002:a05:6a21:e098:b0:3bf:e94e:e38d with SMTP id adf61e73a8af0-3c08ef09cdbmr7227999637.43.1783444328420;
        Tue, 07 Jul 2026 10:12:08 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm15539333c88.14.2026.07.07.10.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:12:08 -0700 (PDT)
Date: Tue, 7 Jul 2026 22:41:53 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, 
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, daniel.almeida@collabora.com, 
	acourbot@nvidia.com, fujita.tomonori@gmail.com, gregkh@linuxfoundation.org, 
	prafulrai522@gmail.com, tamird@kernel.org, kees@kernel.org, lyude@redhat.com, 
	airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <ak0yWkEQtCzBt9qe@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
 <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mj1P9QykK6vbPK37hZkMLwd7RcgVWEcxxuE=9OL+4bAg@mail.gmail.com>
 <akNXvfSfue7_3tyd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <akyiZBPCaZOOyTw6@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <akzTCxnSgxba7Yen@luna>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akzTCxnSgxba7Yen@luna>

On Tue, Jul 07, 2026 at 12:20:59PM +0200, Link Mauve wrote:
> On Tue, Jul 07, 2026 at 12:41:37PM +0530, Mukesh Kumar Chaurasiya wrote:
> > On Tue, Jun 30, 2026 at 11:15:03AM +0530, Mukesh Kumar Chaurasiya wrote:
> > > On Mon, Jun 29, 2026 at 11:11:44AM +0200, Miguel Ojeda wrote:
> > > > On Mon, Jun 29, 2026 at 6:57 AM Mukesh Kumar Chaurasiya
> > > > <mkchauras@gmail.com> wrote:
> > > > >
> > > > > Sure i'll bisect. Meanwhile i would still like to get this upstream.
> > > > 
> > > > It is very early on the cycle -- I would suggest bisecting first.
> > > > 
> > > > But it is up to ppc, of course.
> > > > 
> > > > Cheers,
> > > > Miguel
> > Hey Miguel,
> > 
> > I was able to bisect this. This got fixed in 1.87 with
> > #![feature(asm_experimental_arch)].
> 
> On 1.85.0 though, with this feature allowed, the kernel gets built
> perfectly without any need for 1.87.0.  You might want to require 1.87.0
> only with altivec enabled, whereas on 32-bit we can build on 1.85.0 just
> fine.
> 
Even without altivec and vsx disabled, It's not building for ppc64le.

Regards,
Mukesh

> > 
> > 1st commit that contributed towards this is
> > e4f539ea17a3 ("Bump to version 1.87.0")
> > 
> > This caused another issue to come up while building
> > 
> > ```
> > error: extern blocks must be unsafe
> >   --> /home/mkchauras/.local/rustc-src/lib/rustlib/src/rust/library/core/src/../../stdarch/crates/core_arch/src/powerpc/vsx.rs:38:1
> >    |
> > 38 | / extern "C" {
> > 39 | |     #[link_name = "llvm.ppc.altivec.vperm"]
> > 40 | |     fn vperm(
> > 41 | |         a: vector_signed_int,
> > ...  |
> > 44 | |     ) -> vector_signed_int;
> > 45 | | }
> >    | |_^
> > ```
> > 
> > Which is fixed by 
> > a78d1b092c9c ("Update stdarch")
> > 
> > Both these commits went in 1.87.0 and fixed the build.
> > 
> > Regards,
> > Mukesh
> > 
> > > Sure, I'll bisect it first.
> > > 
> > > Regards,
> > > Mukesh
> > 
> 
> -- 
> Link Mauve
