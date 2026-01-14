Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78F12D94BB
	for <llvm@lists.linux.dev>; Wed, 14 Jan 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388890; cv=none; b=BC8kTp3Y8kvuygHTmpxGTSNbFDkPqA64As0tXCsEznjyC6uslzfxQ8utXv6fQczvrTn+AO+S6c5yLbRjgE38+1Gvqq0811tJ9Mlf1+IntPX3LiJ5C1owT2GrE4hN7a99NVwgcPUztcsSIjvhQiF7KJDZOf95+tbEzJtoPZ6zMAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388890; c=relaxed/simple;
	bh=MWI1qVU13aYugfnLCugfev/zg0Nbw+E/adx+rYcbLY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a01+RNBbMNb4nMNXh03aDwRz6Rewj/Ghv911duguqr37BANFcjPPu9SL9DIlBox//HsvD15Zm57MaTiVhG8mY4xyKaYG78oCaE6ddXxMUKI8N610BWd99HHB9KQhAA/OYuPv7CbXivG8AV5syEV8DyZaaQiS+CcToUBPaC07W2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K4RnD6up; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K4RnD6up"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-432d256c2a9so4754696f8f.3
        for <llvm@lists.linux.dev>; Wed, 14 Jan 2026 03:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768388884; x=1768993684; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zsZRaUIv311mQjR1/d/UwzmBCVEkDM2qHnJQZ9QsbMg=;
        b=K4RnD6upu5BQulQYnaDbaD4LJICv5B0JIa1iqJ9W/+ZADaZGefYDAVMSZb5Z0k8roc
         Mn4gPnjNGoqDCZJrJJs9DbIzLj0430KGd6GQo6z8K/BeyXobMi7NpIfBWxdH9COncU7M
         uP5I1ikmHb9forIY7fNiyxHqg8z2RP0YWr8sT+awHNpEL0etrufNN/2fLEnfwreLqrVp
         O8PhicxOxfMiGDTURKcr52u5OIav9on01dxWpnbP3Ern0ycO3kgcC5peIRLIin7ngPXB
         zuQOVp7flNgn4B1EFgoiUbhLvWBTcj8B0n13L3+hLGB6g2ItJgzJ9B/RRtWQxcrTfDPq
         byWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768388884; x=1768993684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsZRaUIv311mQjR1/d/UwzmBCVEkDM2qHnJQZ9QsbMg=;
        b=EFmUAyzsMOlwLVZbdaCphaVwpGq6WIDfXZ56y8OFOwxu2peozehEQPihbaPdQYtrf5
         nhOM6nDl2cG3qNxjF/bNZvVGUVRKqtI0GrYTrGsUyLZc5nKt0U+UdFlRMnEtRwPRBx/w
         lFlY/AAP61GqYjDZed3RAeHBzYcWsLntABMAd/N15i2KjbZwY1n72V0fm1TpQ8zSUIIK
         SNNuDxiF40GDBKfg2APFrSuJQo3vbB+IbyH99tv+ZM86uslP7N+zd6m3blKTsmWbr5wh
         Aycl68d+PoHREqv1+hHpTOHZugTCh8+2pjiuqxn34t2M/Fxwh/m+OvcRvA6PCDtufdJs
         pVDg==
X-Forwarded-Encrypted: i=1; AJvYcCUdB9LzQriw+y+VW079dn/b30UXJZJqCfPk7xOWrV8mq0b7Jj2o468xQvPK4QlrjtgXppab@lists.linux.dev
X-Gm-Message-State: AOJu0YzwHC3KsPpePKvpDZmXF4PRBXmYlUOvnZw+d7HIX0A/hIZvYSmW
	VHYYEZCzlduPjMybj8U9SdZyNBSG/EaJc06ZzfrVt7dXqns79vee/sx2MLdAVmx77yo=
X-Gm-Gg: AY/fxX7Ev+YKsprOm1fKk4gD4x0y7GxU1ZFiHTEHJ7vz7VXRCPMf2jRLZFVdC327C1Y
	5en7SxS9Wgi1+SZqoN+rTRS3CfOjDSmznB37ls7jFStV534Ly5+xGHwFE4tHCf6u5VqLaZ/jfxh
	cfHHxYWzIA3uyDyrxQGywflkZ3qlJmEN0TlUfMvqJ0e9G5XaXq6cmsZ+gVkrrQOWypPlOgZVvLC
	6SpCkFpNmXzCEBieHUtwW0kOf2RStOC/MfCONIxEsgcBO82lSNip1iedoqy026Smuaz0WEjBq+8
	VEEKZvDWjnIpWE2RDN8qfytM9MtYyVNY/j67I86uY6f0ffLMpJui4miVeuA19w+Tm30BvRSGr2G
	DvwPwbCVVIeZX3CT8cZYaEgX9CopdYvG167SkHufLjtjPka1VfnwwoYtWKqci0PSU1370Bycy1U
	ncvqlNf7TkgdblMA==
X-Received: by 2002:a05:6000:402b:b0:430:f41f:bd5a with SMTP id ffacd0b85a97d-4342c5727bamr2462178f8f.57.1768388884316;
        Wed, 14 Jan 2026 03:08:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d286cdecsm35938006f8f.7.2026.01.14.03.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 03:08:04 -0800 (PST)
Date: Wed, 14 Jan 2026 12:08:02 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 77/129]
 arch/loongarch/net/bpf_jit.c:1322:7: error: call to undeclared function
 '__bpf_address_lookup'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <aWd5EoT9dGUwEbE4@pathway.suse.cz>
References: <202601140159.I4b0kwpE-lkp@intel.com>
 <20260113094801.d3c7b9d327959c6bcb8f4db6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113094801.d3c7b9d327959c6bcb8f4db6@linux-foundation.org>

On Tue 2026-01-13 09:48:01, Andrew Morton wrote:
> On Wed, 14 Jan 2026 01:37:38 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> > head:   01c8de771f4a779caac5d841b1cb2207ac23330a
> > commit: 0f1766dc93f077061bf42cc6222bb2ade96422a4 [77/129] kallsyms/bpf: rename __bpf_address_lookup() to bpf_address_lookup()
> > config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260114/202601140159.I4b0kwpE-lkp@intel.com/config)
> > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140159.I4b0kwpE-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601140159.I4b0kwpE-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> arch/loongarch/net/bpf_jit.c:1322:7: error: call to undeclared function '__bpf_address_lookup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >     1322 |         if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
> >          |              ^
> >    arch/loongarch/net/bpf_jit.c:1322:7: note: did you mean 'bpf_address_lookup'?
> >    include/linux/filter.h:1378:5: note: 'bpf_address_lookup' declared here
> >     1378 | int bpf_address_lookup(unsigned long addr, unsigned long *size,
> >          |     ^
> >    1 error generated.
> 
> Thanks.  Presumably this:
> 
> --- a/arch/loongarch/net/bpf_jit.c~kallsyms-bpf-rename-__bpf_address_lookup-to-bpf_address_lookup-fix
> +++ a/arch/loongarch/net/bpf_jit.c
> @@ -1319,7 +1319,7 @@ int bpf_arch_text_poke(void *ip, enum bp
>  	/* Only poking bpf text is supported. Since kernel function entry
>  	 * is set up by ftrace, we rely on ftrace to poke kernel functions.
>  	 */
> -	if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
> +	if (!bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
>  		return -ENOTSUPP;
>  
>  	image = ip - offset;
> _

Yes, this is correct.

JFYI, the "problematic" code has been added into arch/loongarch/net/bpf_jit.c
just a two weeks ago by the commit 73721d8676771c6c ("LoongArch: BPF: Enhance
the bpf_arch_text_poke() function").

The good thing is that it is already in the mainline. It has been
added in 6.19-rc4, see
https://lore.kernel.org/all/CAHk-=wjO7Jq1dR7rdDA2wY=jwg4TTq-C6PjJz0=N=1dSO=3NTg@mail.gmail.com/

I see that you have already pushed a fix into -mm tree.
Thanks a lot for fixing it.

Best Regards,
Petr
