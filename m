Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876F78635C;
	Wed, 17 Sep 2025 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758089949; cv=none; b=QVcawTBWyznbsrhuAFvx2ByrnCkf4Zbx/PTBFswgntQOhPd2fq7xYk9wLwvJxH0cByh/oHP9oQ1lkpHYqzsTyAcomDBBwKggsUokaOeB238vQ03REXOzc6kBPXlO6q4wNfSnxoQxcbTiJKXtNQE9L31unlm2BOuklms8vEhqzqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758089949; c=relaxed/simple;
	bh=7VqOBciWglOBydRE6ty5PMtlKIa7G190D9CzhLRsejU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcCksPSp7wHa9/vdc//flHLHIm8t95PyZpGOcMl9yN8RuuHKuasEpSAn1/WUm3czDK0i4DdcjDXAdTwuhSs0lYajZOu2bYrgRMBLVZ+VYhP/U9WJIgfp/bqztDaqf7gy5PPgruzCOXO6bt3KUgKZ/bqqp81zllU0BbwVJi1MukE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tgVmbCS+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgVmbCS+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A616FC4CEF0;
	Wed, 17 Sep 2025 06:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758089949;
	bh=7VqOBciWglOBydRE6ty5PMtlKIa7G190D9CzhLRsejU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgVmbCS+Wz8kqUz1nWfijqbc9Ky/hlAZqJ35zW1lIuUpV4tLeuf2NA1vzBBS67gk8
	 JZUpNde8CDxzCuGaKC6BJJZENS+BSH/DHZwnpwmYucEwz8VnI0ilB8oNFvHsDrnKQZ
	 6O/B8ltyXWbF6ifTaxQhvZVfwaeiXUh5BoQXsoLpHW0HBRQAt9OqsDl4MS2O3wjojJ
	 CJn7hoom8tPUXVnvaj6gbZ0P40ger+ycs3yDO7rxy47pDwNY+8lHFoiklwNz0WigIs
	 EPFJ9p4wxT+vsg7xLG/3XNWknZjDX0FExjqfDmERTYAUCdzBk/njrGji2vt+vE+PvU
	 jjT3DJql4xqeA==
Date: Wed, 17 Sep 2025 09:19:05 +0300
From: Leon Romanovsky <leon@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [linux-next:master 7677/9696] mm/kmsan/hooks.c:372:6: error: too
 many arguments to function call, expected 3, have 4
Message-ID: <20250917061905.GA6464@unreal>
References: <202509170638.AMGNCMEE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509170638.AMGNCMEE-lkp@intel.com>

On Wed, Sep 17, 2025 at 06:15:12AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   05af764719214d6568adb55c8749dec295228da8
> commit: 6eb1e769b2c13a33cb2ca694454a7561d3d72c0a [7677/9696] kmsan: convert kmsan_handle_dma to use physical addresses

I think that it is old report.
The commit in the DMA tree has different SHA and correct kmsan_handle_dma() callers:
b420b31f009f ("kmsan: convert kmsan_handle_dma to use physical addresses")

Thanks

> config: x86_64-buildonly-randconfig-002-20250917 (https://download.01.org/0day-ci/archive/20250917/202509170638.AMGNCMEE-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170638.AMGNCMEE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509170638.AMGNCMEE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/kmsan/hooks.c:372:6: error: too many arguments to function call, expected 3, have 4
>      371 |                 kmsan_handle_dma(sg_page(item), item->offset, item->length,
>          |                 ~~~~~~~~~~~~~~~~
>      372 |                                  dir);
>          |                                  ^~~
>    mm/kmsan/hooks.c:362:19: note: 'kmsan_handle_dma' declared here
>      362 | EXPORT_SYMBOL_GPL(kmsan_handle_dma);
>          |                   ^~~~~~~~~~~~~~~~
>    include/linux/export.h:90:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
>       90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
>          |                                                        ^~~
>    include/linux/export.h:86:54: note: expanded from macro '_EXPORT_SYMBOL'
>       86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
>          |                                                         ^~~
>    include/linux/export.h:76:21: note: expanded from macro '__EXPORT_SYMBOL'
>       76 |         extern typeof(sym) sym;                                 \
>          |                            ^~~
>    1 error generated.
> 
> 
> vim +372 mm/kmsan/hooks.c
> 
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15  363  
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15  364  void kmsan_handle_dma_sg(struct scatterlist *sg, int nents,
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15  365  			 enum dma_data_direction dir)
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15  366  {
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15  367  	struct scatterlist *item;
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15  368  	int i;
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15  369  
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15  370  	for_each_sg(sg, item, nents, i)
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15  371  		kmsan_handle_dma(sg_page(item), item->offset, item->length,
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15 @372  				 dir);
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15  373  }
> 7ade4f10779cb4 Alexander Potapenko 2022-09-15  374  
> 
> :::::: The code at line 372 was first introduced by commit
> :::::: 7ade4f10779cb46f5c29ced9b7a41f68501cf0ed dma: kmsan: unpoison DMA mappings
> 
> :::::: TO: Alexander Potapenko <glider@google.com>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
