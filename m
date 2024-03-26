Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98581292FD;
	Tue, 26 Mar 2024 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711441735; cv=none; b=PPwLCzgHiSt+53sZnOo07uctRLTmq3wmtjg307TvKAY+feb+SKB+OvcGAvdrBpA16jzmjJ1MQnLnQIdLCZ53lO+/xL20ZTPFh2if9K2ASqaJLL6oFDRo+i1G8zzsYzABHh+zDWyWAVgpPP+2k7KJcM9WZuO+xtUbDwqFRZtPmGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711441735; c=relaxed/simple;
	bh=3MqfAJIaReLHkb92Ga4SmyIRtvI/vwxCb6zYOjqUiSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkRUUycauFoKyjoDYdDsQBWAAoo9kbKDaBcUjRY0JK4mlYc2XJURAO5m5iq+xrTh9plT0vcj1VmyAe417pLeyYNVcqTVbBb6TOmsMDC8gtwMMqq6mTegkZcV/Dtc/tKymywGCHM7boYw37KDaI0bZDB443wDRxpyyCqwKUIhYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIfL9lFh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIfL9lFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711441734; x=1742977734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3MqfAJIaReLHkb92Ga4SmyIRtvI/vwxCb6zYOjqUiSo=;
  b=VIfL9lFhVIhAdJCRcVZPV1Vtf+TqamhtYsAW7CSlqCL4u9WXb17Z7xzK
   P/GzJsZDy3tFHBvjvFR1ea/cmZOw8fU2kxVUkEm6nkqlWRE87qQo0UAAA
   vs43t3Uw5DgQ6Ahxmx44p05Rq1aQPBo2Qe7IEWaZPWNb/L3EGzShaTHkP
   LGz0nHYG4UmwxzHllrufcr591vuxdfaaEsKIOOESuelbV/9RQLzMuLWS6
   NSj+SnhmxgqON/+dr5rRiwausQRbcDDx/b1gxTQ7JNDWwDnQOA7Hf5U3k
   6NFJdKysAasyZylCj2Wu3c7XChxhShq5K9SoPsKG6e2YEAFII4idonB0W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17026536"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="17026536"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 01:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="39008975"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Mar 2024 01:28:52 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp2Ar-000NEY-2Z;
	Tue, 26 Mar 2024 08:28:49 +0000
Date: Tue, 26 Mar 2024 16:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/7] mm/mm_init.c: remove the useless dma_reserve
Message-ID: <202403261658.HmbcBKca-lkp@intel.com>
References: <20240325150459.1045407-2-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325150459.1045407-2-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.9-rc1]
[cannot apply to akpm-mm/mm-everything next-20240325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-mm_init-c-remove-the-useless-dma_reserve/20240325-230756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240325150459.1045407-2-bhe%40redhat.com
patch subject: [PATCH 1/7] mm/mm_init.c: remove the useless dma_reserve
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240326/202403261658.HmbcBKca-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261658.HmbcBKca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261658.HmbcBKca-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/init.c:1036:2: error: call to undeclared function 'set_dma_reserve'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1036 |         set_dma_reserve(nr_pages - nr_free_pages);
         |         ^
   arch/x86/mm/init.c:1036:2: note: did you mean 'get_dma_residue'?
   arch/x86/include/asm/dma.h:288:19: note: 'get_dma_residue' declared here
     288 | static inline int get_dma_residue(unsigned int dmanr)
         |                   ^
   1 error generated.


vim +/set_dma_reserve +1036 arch/x86/mm/init.c

176239153049a0 Pekka Enberg 2011-11-01   992  
4270fd8b4c27f0 Ingo Molnar  2017-01-28   993  /*
4270fd8b4c27f0 Ingo Molnar  2017-01-28   994   * Calculate the precise size of the DMA zone (first 16 MB of RAM),
4270fd8b4c27f0 Ingo Molnar  2017-01-28   995   * and pass it to the MM layer - to help it set zone watermarks more
4270fd8b4c27f0 Ingo Molnar  2017-01-28   996   * accurately.
4270fd8b4c27f0 Ingo Molnar  2017-01-28   997   *
4270fd8b4c27f0 Ingo Molnar  2017-01-28   998   * Done on 64-bit systems only for the time being, although 32-bit systems
4270fd8b4c27f0 Ingo Molnar  2017-01-28   999   * might benefit from this as well.
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1000   */
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1001  void __init memblock_find_dma_reserve(void)
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1002  {
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1003  #ifdef CONFIG_X86_64
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1004  	u64 nr_pages = 0, nr_free_pages = 0;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1005  	unsigned long start_pfn, end_pfn;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1006  	phys_addr_t start_addr, end_addr;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1007  	int i;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1008  	u64 u;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1009  
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1010  	/*
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1011  	 * Iterate over all memory ranges (free and reserved ones alike),
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1012  	 * to calculate the total number of pages in the first 16 MB of RAM:
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1013  	 */
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1014  	nr_pages = 0;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1015  	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, NULL) {
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1016  		start_pfn = min(start_pfn, MAX_DMA_PFN);
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1017  		end_pfn   = min(end_pfn,   MAX_DMA_PFN);
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1018  
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1019  		nr_pages += end_pfn - start_pfn;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1020  	}
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1021  
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1022  	/*
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1023  	 * Iterate over free memory ranges to calculate the number of free
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1024  	 * pages in the DMA zone, while not counting potential partial
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1025  	 * pages at the beginning or the end of the range:
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1026  	 */
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1027  	nr_free_pages = 0;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1028  	for_each_free_mem_range(u, NUMA_NO_NODE, MEMBLOCK_NONE, &start_addr, &end_addr, NULL) {
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1029  		start_pfn = min_t(unsigned long, PFN_UP(start_addr), MAX_DMA_PFN);
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1030  		end_pfn   = min_t(unsigned long, PFN_DOWN(end_addr), MAX_DMA_PFN);
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1031  
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1032  		if (start_pfn < end_pfn)
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1033  			nr_free_pages += end_pfn - start_pfn;
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1034  	}
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1035  
4270fd8b4c27f0 Ingo Molnar  2017-01-28 @1036  	set_dma_reserve(nr_pages - nr_free_pages);
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1037  #endif
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1038  }
4270fd8b4c27f0 Ingo Molnar  2017-01-28  1039  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
