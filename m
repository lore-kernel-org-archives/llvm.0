Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373A9256C81
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197098; cv=none; b=Ij+d29v4aiGlouDd67T5ClqByZWs2OxclKZYgJPtn3802iwHxhfOQmId/wHWeEc0a+JxAdX7mVUSjeJQpclrJm2VDu/IgUKMVnBMA2h5rYvcJYl+ldKurSwcAkbGByiHYVXwFNy6UorRUJG2lZnYZPWSQThezrIaAhClDWWadlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197098; c=relaxed/simple;
	bh=K2v+V9BeNPO6z1mSHU2f46T3osTrV14m8I6JlOMOUTc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruK34Dmi6Q7sH6Vrx4TI2FWucfIlRsxZcz3ZdzJfyl/GIT9IF6CkLZyCMeQHhJjYWgmSwFEmxsMvqNZkrWchKUkGXk5pni+JtFPny1XTQHnqrT1pC05a32VH4GnYoes3E8jkHfx8/4hHj6MaNxhTM7SjY9oqUu4cojOAMww5Hfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPjT/MkK; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPjT/MkK"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c7913bab2cso228062385a.0
        for <llvm@lists.linux.dev>; Fri, 02 May 2025 07:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746197096; x=1746801896; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1D5cABUWl03Gb3dEb9Zn/xPv0rDHSpYAcBsKyT8bso=;
        b=fPjT/MkKbdfe9cUHP7gNSfqbsbtvW1mbZ/T6JfXyvoT6rJkZbL2T+LmAh3BZSE38kF
         hOc6QQ0d8jUJsDiDo3NYSM1P+LPPbcsDV243mwFNSCjU/RHC/4zgU/ghy5wuTbmmVA3N
         lr6wbBf68yAS9ETbGJbR2aLiGpGFqbrvhEb4+Y9n5syyxv1QStlX2DAlGxiQ6Vy6VnYl
         aJiIFB2hsMFPHzZsNPhA9kIbmCchXgu+J98vUShAmn5XMgUyVacvau75oTghTdf0Ub5b
         L22aVT/+BpG7bIyQ2WAKIPbgb8X/t+SvluXDmNYC1WxC7THPRbgLOdzUKqyQwbxWi0eN
         fFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197096; x=1746801896;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1D5cABUWl03Gb3dEb9Zn/xPv0rDHSpYAcBsKyT8bso=;
        b=sBmpLI1cDdW3W8lqaZ6kIEyLRCFGq1Tr+JP2RZ9W6YR9++wC+OWafr152DLGMx/hN7
         741VnnLVMi1tWCQ7b/MEYFWFt8YTUL8AULj8SzO2t8TQnVrPpeZa/47EFaMaz3YygXw2
         ZGHbk/pLveZU8dPjsO+erQ2LMl4+gND0ONc9A5NIn7wKK8FPsvqHFPV5dak0iJFWJ0Tr
         nF21wqd3mWJ5+Iq5TLH0Pr7yKA21CWSU7EgyEMw1PcBOcPlBgzGL3oyFQjWDZX8jlcJ4
         hvlv6l20Ev1TGcTlgm1SStmrfw6SXouK3Bhq+/GbwY0DSav8EUD9T0FO0Wgz0LqMr95S
         z46A==
X-Forwarded-Encrypted: i=1; AJvYcCVoe1t2qHuWUj1RcQmaZVgnTCnNdoEhM6MM899Qa4I070DuycAMXPWnDGFipCHKQA2y3nn3@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe2GYiO1VUhjtWLPuc5SmYtJr6a9Ytrv9JEphEW/lMzwpp+jt1
	gHgPpuiNwWKF+rNvlkVRtiSFsN3KZyip6lyOnEHkXMygFJobqhCF
X-Gm-Gg: ASbGnctcKZKz8rl4VRkPYM+a4mNM3NByolNX8rLIIUq/iP31q/kKB++tQEsdzgE1dFM
	R9gey/R91A3BLXkTls1tOI6/xwjKVN+/OYJ5PGS53phNuB5mazVPAB45caMOVPUycXyqcf1MxGc
	JdfU3B8vvu0NqJVzX9/Hm8LiyAWEZYDTui/QhfAuNtutOQF0PmtninF1WgFDLEnM7/2JeyO6H6k
	0u/wffnhAR8fyB4sjpCuT//P4YvCtssuvMAJjJWQv2G1MkGNJVLLIwMcwx4xJeltFy5itYdqc6h
	yqHXZ8ZqgWXBMMICDUmIqdtJG8WuFyG1NxLY5PAPc6hAGeNkWmhLSVf8V+JJJTyYNvsPOFoqUfs
	3+uJCxxUblll5fT7H8vzVtBZVgu8Kjak=
X-Google-Smtp-Source: AGHT+IHRPivqnggcPnth+cCtUlU5ktQEZ68fxYNwiRGEvvMI6JWX9VzuD4MXwQqFgO70AGZX+P3yaQ==
X-Received: by 2002:a05:620a:1a9e:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7cad5b2383emr418969385a.5.1746197095964;
        Fri, 02 May 2025 07:44:55 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23d0d0fsm189599885a.50.2025.05.02.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:44:55 -0700 (PDT)
Message-ID: <6814da67.050a0220.2f3283.cdc1@mx.google.com>
X-Google-Original-Message-ID: <aBTaZbjRBhRl7mDS@winterfell.>
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0EDF21200043;
	Fri,  2 May 2025 10:44:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 02 May 2025 10:44:55 -0400
X-ME-Sender: <xms:ZtoUaHvANPzb0oMXyUaUUbvZer1Qt2-dLwySerQz7pmaYVQKqdy9pQ>
    <xme:ZtoUaIeSvirOVsOwHJBs7DuaKe5rsRVY3U4oZC_m5ad1Ng--Wv30Fd1hZdzbz_3qV
    oJDIY7uHahqT7ayTg>
X-ME-Received: <xmr:ZtoUaKwFnohi7sgoHTCIucE4KPLorIxgmI8iH_LCfO_zQ4eK-On72pDn5iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedvjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedv
    teehuddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphht
    thhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhngh
    hosehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepnh
    grthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtkhdruggvshgruhhl
    nhhivghrshdolhhkmhhlsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ZtoUaGNe1Mu8wfVu8CTHH9LCHKLyYxsXz9SOJ--aWi_9AyGtYZE_jw>
    <xmx:ZtoUaH_mwK8azKp1HllcyJC66m8qPsryEX2dja-9RL-71VRnMwU3dQ>
    <xmx:ZtoUaGXaMkRsonYzmvw8dMOu5aksFuwaqDvT_yRsy7fjff1-yE0x-g>
    <xmx:ZtoUaIdMlxeymlj3_FZFsirwcAxVKnXIqvP1dFwzi8h4SuivDFozuw>
    <xmx:Z9oUaFesUaE_dn_vLVrg6F7MIorzBO9-4lWvzZ3QYq1oCOoJmM4hR6XI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 May 2025 10:44:54 -0400 (EDT)
Date: Fri, 2 May 2025 07:44:53 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] lockdep: Move hlock_equal() to the respective
 ifdeffery
References: <20250415085857.495543-1-andriy.shevchenko@linux.intel.com>
 <aBTP9AaJ0uyzAjxG@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBTP9AaJ0uyzAjxG@smile.fi.intel.com>

Hi Andy,

On Fri, May 02, 2025 at 05:00:20PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 15, 2025 at 11:58:56AM +0300, Andy Shevchenko wrote:
> > When hlock_equal() is unused, it prevents kernel builds with clang,
> > `make W=1` and CONFIG_WERROR=y, CONFIG_LOCKDEP=y and
> > CONFIG_LOCKDEP_SMALL=n:
> > 
> >   lockdep.c:2005:20: error: unused function 'hlock_equal' [-Werror,-Wunused-function]
> > 
> > Fix this by moving the function to the respective existing ifdeffery
> > for its the only user.
> > 
> > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > inline functions for W=1 build").
> 
> Any news here, please? The problem still exists in v6.15-rc4.
> 

This is in my radar, so it will be in a PR to tip soon. I didn't reply
earlier because I meant to find a whole cleanup for ifdefferies in
lockdep:

	https://lore.kernel.org/lkml/Z46BJ8FhWCIXbM7p@boqun-archlinux/

to avoid whack-a-mole fixes. I never found time so I have to postpone
that. Thanks!

Regards,
Boqun

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
