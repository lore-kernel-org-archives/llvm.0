Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019591FD2;
	Mon, 27 Nov 2023 03:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkfTOp/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701054813; x=1732590813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FSddWG7ipoD6ZnLhFi4L7CqLWKepVOAVVFtBLcCGzLI=;
  b=DkfTOp/h2ahlFiUQ1LYLcKaZDHBNMZWdqcvK2vYCZaxnbj4XpMFp9DcD
   cIEviobF5vLbbpMJWmZfmDfqx5Wd+3G50VaW3UNcSBXXu777KpUWmU5JM
   VZ72paIETPW0vlySdpcjmYQFIHhTK41N4xc5483h08mTj02kOf1noueuv
   YkkG910es8Dz/pn1esQz2QjBMAywlFT7bmbXn3RCNQMobk7Wd7M1IRoRH
   dFb63YV7HyXvnwHQgX+2x0YzOXGNOCHaZZ8JEl3o48JNJZspkMEKdDprL
   4QoN5aOexoteWWUIGXwNkLEAhc+HCU3q95L0yJOkgTkQK3V4QXpaT+zRM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391501046"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="391501046"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 19:13:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="858900703"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="858900703"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Nov 2023 19:13:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7S3j-0005ml-1p;
	Mon, 27 Nov 2023 03:13:19 +0000
Date: Mon, 27 Nov 2023 11:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: still create swiotlb buffer for kmalloc()
 bouncing if required
Message-ID: <202311270934.fETTDQTa-lkp@intel.com>
References: <20231126162528.2411-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126162528.2411-1-jszhang@kernel.org>

Hi Jisheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/riscv-mm-still-create-swiotlb-buffer-for-kmalloc-bouncing-if-required/20231127-014531
base:   linus/master
patch link:    https://lore.kernel.org/r/20231126162528.2411-1-jszhang%40kernel.org
patch subject: [PATCH] riscv: mm: still create swiotlb buffer for kmalloc() bouncing if required
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20231127/202311270934.fETTDQTa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311270934.fETTDQTa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270934.fETTDQTa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/mm/init.c:171:6: error: use of undeclared identifier 'dma_cache_alignment'; did you mean 'dma_get_cache_alignment'?
     171 |             dma_cache_alignment != 1) {
         |             ^~~~~~~~~~~~~~~~~~~
         |             dma_get_cache_alignment
   include/linux/dma-mapping.h:541:19: note: 'dma_get_cache_alignment' declared here
     541 | static inline int dma_get_cache_alignment(void)
         |                   ^
   1 error generated.


vim +171 arch/riscv/mm/init.c

   169	
   170		if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
 > 171		    dma_cache_alignment != 1) {
   172			/*
   173			 * If no bouncing needed for ZONE_DMA, allocate 1MB swiotlb
   174			 * buffer per 1GB of RAM for kmalloc() bouncing on
   175			 * non-coherent platforms.
   176			 */
   177			unsigned long size =
   178				DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
   179			swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
   180			swiotlb = true;
   181		}
   182	
   183		swiotlb_init(swiotlb, SWIOTLB_VERBOSE);
   184		memblock_free_all();
   185	
   186		print_vm_layout();
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
