Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A332D9EC9
	for <llvm@lists.linux.dev>; Wed, 10 Dec 2025 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765353235; cv=none; b=K/4Ql1KGu8cILao1ioByZoQWIfSsLLNtqi8lXYndy4sRcOgAw0kp1TIAgKF8AviHkzsl4zmCM5QsKiqowZfi5hGOoZ1oPx4zaXtTeoR9622cgIMZJsWtM4QzEah8MxaKxvZ206/ehqHRMkgi46oBIk7t8NRtX21n3Ho+D71nsRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765353235; c=relaxed/simple;
	bh=D/+seJG//nC/P4iPB6ZizEmDXJnST4bMlgf1OqxUW98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQRAy1Dy4nk28yAcJdgl2Mku7tpvSpDUUI2KeIb0F23JP4rMPfJHczWP3jdVDEBkjTLQF7rxPXQ/Ouecu/nKHex3oHFwMP1SvJIrGuMiZVSd1VebnKZ/+AzbhsUrYCOWJusFOgGSMN+39gL+cyMO9DdGln9f7hXuzD5ugyTfgI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r+KmwjZE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r+KmwjZE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477632d9326so43700925e9.1
        for <llvm@lists.linux.dev>; Tue, 09 Dec 2025 23:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765353231; x=1765958031; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FAfe5xpVHnGY2Zbu61+EcStytc/6fH+jNqtQ9R31Tiw=;
        b=r+KmwjZEnNPNl5W+TLqSOATvJioukPq2Mb83UMoh6YcmRKdmgsvTiNj6yqE80YHJqX
         7FJvKW/f8T7AcZRdcJlwQNOGwVGCoEy7I9DqBeBfrsN+nNoc2l28neL3G8d/8e6VHznt
         A4/DHSxSxhmfVVzuglb6DJ1lJ6scCXZEVEGpnqTacWL0uC3J/DhneXBKZ5bTILUEBj2D
         u1magg4HseKJTnF1Mkm5//tI4tCjc77EpBJmV0QfrUqPiX9FhW9Im3tSMs47rZnr7+KS
         i7PxfjeJDA5XKinXrEfbn14PB7I8Kd6CAUKP92nx34PcmxJNS7zvsYdUched+P8hhucw
         OO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765353231; x=1765958031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAfe5xpVHnGY2Zbu61+EcStytc/6fH+jNqtQ9R31Tiw=;
        b=PhjoJCyAqJ9LpM1T5uNdSTFE0U7nq3N56mYU/0Rq84QeX4+C9DGkhuf6IYcMjlNUJ4
         TfR4Di+cw1QTcumTbL9sD5HihMWuUixvoK1ZnSfWmh0uy1HGXTvSwzEd0kYqt7j5kUYe
         jfWun6M0lgQDancmDoJp7AKaw+nWmcM8ijqSdJ9/EGVvNqGxBH6GBOm7Z5V5Zyt959Vn
         ouKLJCH0Wyqh+CGYXv6ELp+XgJL323vqtKE9wDd8eJngPCHxvmxPfyG3uKr2Dhax3EKP
         Qg9um08EZNL+H+Vml3LvS+fy252vQxzsnVEn4AlSBVtGwYz6Ipqleb+m3ABhnBCBvcbh
         opMg==
X-Forwarded-Encrypted: i=1; AJvYcCUcEpxP6nnn4Hd3rdQnqGcaxb79sho8OW/acverBWjUevOplgD8u2X6EnRe5flGN4pHkMQN@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4lvYLv3Dh9vvmQg4MhUg5W3cqDs7YlFrGTISEjPyxatso8XTs
	665x8NZNs6O2Ox7/zYSX+zn44voQ7MFtG4xu04je+r2z8MclJqeZHFXJ73hXHoSRtHA=
X-Gm-Gg: ASbGncsexzUVIvicw+O/jehxSc09rLdaKWtO9eHUfo0gWORItXClMkjiIar/Sr+W7HR
	WIxgeYmMI6bYN2D3Gr30rKv9X/p3Vn+2+LS7VIc+4fLTpud6RT0uYFqCQnNw0XsK711A0iDgc9x
	r//2Ta1FtBHXQM8yBtwJphf7OJ0tJdsTcut+1Y5a74OeJVLf4QIms1s2g1MXfImulYmVzmqX5Zh
	z8umHKQtaRD5jrRzwuYuCy2Wmu0ULJWdUVd4qzhzTuBmjVJgmYNPoiTNvOII0OUBd9rDJPZgIPI
	DJtWi+hTaZQ3ttnOuqJ51mlrYoPRVO00seR3AEDSA8BTiQnPcr1yPHDT9YJgajnT8zIEfkCbJDT
	OorfRvzGRZouuSGYQH3LEbi6f2iijreTQez0VOBu4QwPYYEUE0LZalhHppgtlEUaxWMnP5bvOkB
	8Wc7K4HLI673UV8+5w
X-Google-Smtp-Source: AGHT+IFAxc9+MiZJUAUnbNcL1F+kG7TAkmzsOeTPbtUzhYDn8Z09MPKEdiLthnyruYWc8ighlEwehQ==
X-Received: by 2002:a05:600c:1c8e:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-47a83814448mr11849975e9.9.1765353231153;
        Tue, 09 Dec 2025 23:53:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a82d5239asm30321475e9.15.2025.12.09.23.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 23:53:49 -0800 (PST)
Date: Wed, 10 Dec 2025 10:53:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-hardening@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	llvm@lists.linux.dev
Subject: Re: [bug report] clk: visconti: Add support common clock driver and
 reset driver
Message-ID: <aTknCZRscyltxAri@stanley.mountain>
References: <aTgetqy8BGerPGTl@stanley.mountain>
 <20251210073611.GC1147766@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210073611.GC1147766@ax162>

On Wed, Dec 10, 2025 at 04:36:11PM +0900, Nathan Chancellor wrote:
> Hey Dan,
> 
> On Tue, Dec 09, 2025 at 04:05:58PM +0300, Dan Carpenter wrote:
> > Hello Kernel Hardenning developers,
> > 
> > Commit b4cbe606dc36 ("clk: visconti: Add support common clock driver
> > and reset driver") from Oct 25, 2021 (linux-next), leads to the
> > question:
> > 
> > drivers/clk/visconti/clkc.c
> >     187 struct visconti_clk_provider *visconti_init_clk(struct device *dev,
> >     188                                                 struct regmap *regmap,
> >     189                                                 unsigned long nr_clks)
> >     190 {
> >     191         struct visconti_clk_provider *ctx;
> >     192         int i;
> >     193 
> >     194         ctx = devm_kzalloc(dev, struct_size(ctx, clk_data.hws, nr_clks), GFP_KERNEL);
> >     195         if (!ctx)
> >     196                 return ERR_PTR(-ENOMEM);
> >     197 
> >     198         for (i = 0; i < nr_clks; ++i)
> > --> 199                 ctx->clk_data.hws[i] = ERR_PTR(-ENOENT);
> >     200         ctx->clk_data.num = nr_clks;
> > 
> > ctx->clk_data.hws[] is __counted_by() ctx->clk_data.num.  Don't we have to
> > set the .num before we fill initialize the array?  Or does the checker
> 
> Yes, it looks like line 200 needs to be moved above line 198.
> 
> > code allow us to access the array when the counted by variable is zero?
> 
> Nope, I just had to fix an instance where num is one and hws[0] is being
> accessed:
> 
>   https://lore.kernel.org/20251124-exynos-clkout-fix-ubsan-bounds-error-v1-1-224a5282514b@kernel.org/
> 
> I suspect there will eventually be a report on real hardware when
> CONFIG_UBSAN_BOUNDS is enabled and GCC 15 is used to build the running
> kernel, which is the first version that supports __counted_by(). How did
> you find this? A new smatch check?

Yeah, but it was a bug in my check.  I need to add __counted_by()
support to Sparse.  If I had that, it would easy enough to add a
warning for places which access the array before setting the counted
by variable.

regards,
carpenter

