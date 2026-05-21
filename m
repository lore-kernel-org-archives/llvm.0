Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3123E2D2483;
	Thu, 21 May 2026 01:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327215; cv=none; b=Smnjc7wBrbwq9PrMyD8FHXpzGhlPDox4tz2iMr6Rrne5TSwCY4NRBabG1n5sr+60lXFcTuo7JNbCp+ohhtSZQiFRkj9oHEyBbWSxFf4g6dSCygP76HSk2rsJ/XkTkdwQCnAx3g1/j5vxUjS4rxMTziQTT41egxElxrqzIKJ1nyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327215; c=relaxed/simple;
	bh=iR22/lcNha8OhLEdj89HrgHvw71zgkoHPpU46ByJ5go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKi93Ypjb3xLFYimfkaMhPSebAiIXiX7MzSXmcmzAoQWbBTgyvb8FjghKT61sRvwiwpLcQT9+kSwmuSXLS8Uz1Mz4LK6LkGJxnUQhUup4mH1ZhBT2hpVOpimfDIZN8n/f4NeBAVgJs3oyFFTchfLgqu0SP3MeERafh20AP6PlTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=nvYpSYDQ; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nvYpSYDQ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779327200; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=AlchVd8dHTLSV8ovNKnYUQSpcAaU/30YlCAq5wkMBBE=;
	b=nvYpSYDQ9B05JA3itjHZkN3tbomllMidcZNA9DQoCyG6RAzBr0P/trdMrjqrM1bhJpVK2aSpgLyUH/jlD6LLZjnjXiEoNfreyI1R8W/p9VDatzXbAmDP895tww48fuCXLZZ1XI7j36t0ZE+7tyPTDFWe64LirsaWPKINX4Hirlw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X3K-5Cw_1779327199;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X3K-5Cw_1779327199 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 21 May 2026 09:33:20 +0800
Date: Thu, 21 May 2026 09:33:19 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 5548/6445] kernel/dma/contiguous.c:139:13:
 warning: variable 'numa_cma_configured' set but not used
Message-ID: <ag5g30Jm-3gRS9QQ@U-2FWC9VHC-2323.local>
References: <202605200341.a1HLq7XC-lkp@intel.com>
 <ag0_qU5BS9KBBiWK@U-2FWC9VHC-2323.local>
 <20260520222742.GA1607511@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520222742.GA1607511@ax162>

On Wed, May 20, 2026 at 03:27:42PM -0700, Nathan Chancellor wrote:
[...]
> > ---
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index 42227c823893..f286d49bf068 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -136,7 +136,7 @@ static struct cma *dma_contiguous_numa_area[MAX_NUMNODES];
> >  static phys_addr_t numa_cma_size[MAX_NUMNODES] __initdata;
> >  static struct cma *dma_contiguous_pernuma_area[MAX_NUMNODES];
> >  static phys_addr_t pernuma_size_bytes __initdata;
> > -static bool numa_cma_configured;
> > +static bool __maybe_unused numa_cma_configured;
> >  
> >  static int __init early_numa_cma(char *p)
> >  {
> > 
> 
> I know Marek already updated this but I think a better solution would
> have been turning the '#ifdef' into IS_ENABLED(), as I don't see a
> reason for this code to be ifdef'd, none of these variables are
> undeclared or unusable when CONFIG_CMA_SIZE_PERNUMA is unset. This would
> allow the compiler to always see the variable as used, regardless of the
> value of CONFIG_CMA_SIZE_PERNUMA.

Looks good to me, thanks. I'm fine either way.

Thanks,
Feng

> 
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index 42227c823893..d6435c1eabe3 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -202,11 +202,10 @@ static void __init dma_numa_cma_reserve(void)
>  {
>  	int nid;
>  
> -#ifdef CONFIG_CMA_SIZE_PERNUMA
> -	if (!numa_cma_configured && dma_contiguous_default_area
> +	if (IS_ENABLED(CONFIG_CMA_SIZE_PERNUMA) &&
> +	    !numa_cma_configured && dma_contiguous_default_area
>  	    && nr_online_nodes > 1)
>  		pernuma_size_bytes = cma_get_size(dma_contiguous_default_area);
> -#endif
>  
>  	for_each_node(nid) {
>  		int ret;
> -- 
> Cheers,
> Nathan
