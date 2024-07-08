Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47861AACC;
	Mon,  8 Jul 2024 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720445872; cv=none; b=T/2cPvfoBsyHQ5Xuvf71C0yFz5rWv7g8KfbWRq1/ZpWO54GeEjp3uxMryU5oz3sb8Z1MrdzkY6NTz+hOtm64tUSJdl1tSI4rl39EI+hTyEFUcAars7cVZNLksmQ4qqwAq/txqhlM1WRiCdW41jldA/X8rkMkMks7ntamSNRPPR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720445872; c=relaxed/simple;
	bh=cbvwfZUwkX84LTkEjnJDsDR9xDx4OQCdfydbXNTR+Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K47u2DPALvc0xLwViI88i1Cw+u5h1JDa8AYMLkDlgQw3oSz0meh30uBLhqi6tTGP+UMoedWylsyWr/I7vZRw8TNCq/cqD6hOWjVcXSQNizDjgUlAAY+snLap7HZWsgTpIe8AimdqydXeK9gVke6FpohKBPCmm/sOtUYfYd3NtaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaG8PAiT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaG8PAiT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4266ed6c691so1546915e9.3;
        Mon, 08 Jul 2024 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720445869; x=1721050669; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fKb3q0Y7TytSgi4aTS4oA0BDYeL9S2seeAThCNboSVY=;
        b=HaG8PAiTV5L8Lhmf2535XGc42CMqvPkbZbcyeB9uDL5vBwjKh5R/J4RCS6O56YQn9p
         5164F/KZL+GNth9j6PlxXfkDqUFXg1bC2ob+Ar72gmcGazwlyqVQbi8q+hVE7f+MAH0Z
         FxZkuehDlSL2XaKLuddu8bIqgPUJEXDIMih9IxI2h+HmopHKzM20vZDoJhksQy1DFxbU
         vQUBoeWA/LwbidJz97fsuGx3lVXhb61hOLtnkviC3ChPFCL6hc3yre7Kq5+AIlvMo4os
         CyU0v9Nkhp+kQGapmGfsNN4yFwnk8WTDsNM0VkLw88/jFaQ7e9yW4lhLqiYrZ/E91GWl
         s71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720445869; x=1721050669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKb3q0Y7TytSgi4aTS4oA0BDYeL9S2seeAThCNboSVY=;
        b=NPUaxME97aB2UbUqO74tdgKnmlzJ++ppInYS+XMC6qy6TAEJBQRWMOe/f0VJfm6u3T
         7Wo6X/lLgkzUXfrEhbyhqtHQ2OiEq9j3UZC/qRYCE9HJqomQ40Bm97I6ElWni+odzQpH
         4Tl98ob48XLRtOVh8lXJhwx/V7u8now07ZFXlfoQjRz7q+4YCEmS9hZfzTxFSjhvIO9d
         DzGTNcuPmee6iWYOgIUONMceizwMJWX1yp19Bo9T8WoA8QjhPIOvWIqTbwr+51AxBKAx
         UT2Lwisk96vqEVS8o1Xtp9WCG3RH8bNLrVCMINS5SYYdHluptWzvDi1VsUWBVKLT7Jnn
         4jEA==
X-Forwarded-Encrypted: i=1; AJvYcCUvy6QEHxn4GiE+VJ8SPBKD6HjLNhRZAeRskeiKBj8ceBww/FGlcM+/0h6S+icsYEIN9b6e+EIgdmzGyh6tYaaflPIUQWDJ5fMlW0WRlsdePP10ZyheUaWlnn0lKGRKexubfhk=
X-Gm-Message-State: AOJu0YzcgVmP0hyg8jx3wV2/e8hnWakr0n7HViUESmGyqx4GSkFlJWxu
	w8M0l5C4MZL8t9ctEnq1jkvaisno2EOAvxgTTlW7fWI7eb0mP532
X-Google-Smtp-Source: AGHT+IFf2CtPfnw+MM5W8B/XjYd7ZO0yJR0wUNYpiS0Y2kF7RSShvAnNhhqjkbjraPsAS3o4pFs36Q==
X-Received: by 2002:a05:600c:ad0:b0:426:61af:e1d3 with SMTP id 5b1f17b1804b1-42661afe258mr37880785e9.31.1720445869053;
        Mon, 08 Jul 2024 06:37:49 -0700 (PDT)
Received: from skbuf ([188.25.110.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426615876bbsm85539585e9.6.2024.07.08.06.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:37:48 -0700 (PDT)
Date: Mon, 8 Jul 2024 16:37:46 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kuba@kernel.org, horms@kernel.org, Roy.Pledge@nxp.com,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <20240708133746.ea62kkeq2inzcos5@skbuf>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
 <20240626140623.7ebsspddqwc24ne4@skbuf>
 <Zn2yGBuwiW/BYvQ7@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zn2yGBuwiW/BYvQ7@gmail.com>

On Thu, Jun 27, 2024 at 11:40:24AM -0700, Breno Leitao wrote:
> Hello Vladimir,
> 
> On Wed, Jun 26, 2024 at 05:06:23PM +0300, Vladimir Oltean wrote:
> > On Wed, Jun 26, 2024 at 08:09:53PM +0800, kernel test robot wrote:
> 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:3280:12: warning: stack frame size (16664) exceeds limit (2048) in 'dpaa_eth_probe' [-Wframe-larger-than]
> > >     3280 | static int dpaa_eth_probe(struct platform_device *pdev)
> > >          |            ^
> > >    1 warning generated.
> > > --
> > > >> drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c:454:12: warning: stack frame size (8264) exceeds limit (2048) in 'dpaa_set_coalesce' [-Wframe-larger-than]
> > >      454 | static int dpaa_set_coalesce(struct net_device *dev,
> > >          |            ^
> > >    1 warning generated.
> > 
> > Arrays of NR_CPUS elements are what it probably doesn't like?
> 
> Can it use the number of online CPUs instead of NR_CPUS?

I don't see how, given that variable length arrays are something which
should be avoided in the kernel?
