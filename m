Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5334EAF9;
	Sat, 26 Jul 2025 01:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753494000; cv=none; b=lz3dXJ9eje7a7wKVtofZzbxi7huM88eDBBeWUhzXZ22HUoUtvnUUCJYG00cGlOimhrq4ui4AQHaQM85w4fnMO6Sytr9pzUQ/li9cwavZlGzarRxx6io5rUDyEU0JXKWAME8iE/pBfJO++//Sg3VKU9rtTp9DztST80fzjB8dJ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753494000; c=relaxed/simple;
	bh=Pg/bwK4zrTPqqa3qHUJR8CVYUnv5SunIF65yT5efa3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d9ZGPD3XDpsaZz+MMuMmEkPIekMOI09xuQ2+6wJppycChSNs8a6G0vNVBDsdkzDHeBZ4dPYt0urGJnF4yEh9ltWFEWQVKZA/WeXS2EGHubTjjOjGzkNt84t+EDA3hfjOKmvH67zv5oitnytJ9ya0xSEUX8qJa5D3Ovd3pCjEVnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epPDAdX+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epPDAdX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753493999; x=1785029999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pg/bwK4zrTPqqa3qHUJR8CVYUnv5SunIF65yT5efa3c=;
  b=epPDAdX+IAqlde20UeBCrLZSBXKjPmAom18tFlj2zaSMSWcOt4JPyvff
   vihPuhn7ughcPpOYCEySWTmS6FHBQ7Om2QiS/gpc5IjVVb+BPEJo81Nl3
   phRjdwqQz8ASD3pzzXr3LypcabDnrxprpVHRlBOSxGb/RZtyR7EfWkWvD
   OZMw7ch9sj4jfnQ5pcEjAZ2Y9qnGDjBPX8IdIpDQAmRTdUUee11c0TyeQ
   ZJq5HbLa4iHd1ttgwUI79ALEV+wQD7tlbS7C6//+/Mi8hxaFTpqNu+qrD
   kcygBAazejY2FnR6CqkVjOnqXkcPCWC6z5yN4JTSMSVJ2JVMiIvvlW2GJ
   A==;
X-CSE-ConnectionGUID: yY+BmibYSO62IRLHAjwWLw==
X-CSE-MsgGUID: AZo1fJ17Qti0w+kNq7DsPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55712089"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55712089"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 18:39:59 -0700
X-CSE-ConnectionGUID: GcswZvP2TBi8MHn9Hm7lmw==
X-CSE-MsgGUID: 8l/HpTtyQHae5LsUAbetGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192220868"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 25 Jul 2025 18:39:56 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufTtC-0000DD-0q;
	Sat, 26 Jul 2025 01:39:54 +0000
Date: Sat, 26 Jul 2025 03:39:38 +0200
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/020-dart 17/24] drivers/iommu/apple-dart.c:749:16:
 warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka
 'unsigned int') changes value from 18446744073709551615 to 4294967295
Message-ID: <202507260323.iSvkCkNs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   f5bb87e56b1abc21a7670d8bab309bae691f831e
commit: f4b95669250447d37fee23fb9a58179be99cd47e [17/24] iommu: apple-dart: Support specifying the DMA aperture in the DT
config: i386-buildonly-randconfig-2002-20250720 (https://download.01.org/0day-ci/archive/20250726/202507260323.iSvkCkNs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507260323.iSvkCkNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507260323.iSvkCkNs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/apple-dart.c:749:16: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     749 |                                         dma_max = DMA_BIT_MASK(pgtbl_cfg.ias);
         |                                                 ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:40: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   drivers/iommu/apple-dart.c:1388:18: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1388 |         dart->dma_max = DMA_BIT_MASK(dart->ias);
         |                       ~ ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:40: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   2 warnings generated.


vim +749 drivers/iommu/apple-dart.c

   690	
   691	static int apple_dart_finalize_domain(struct apple_dart_domain *dart_domain,
   692					      struct apple_dart_master_cfg *cfg)
   693	{
   694		struct apple_dart *dart = cfg->stream_maps[0].dart;
   695		struct io_pgtable_cfg pgtbl_cfg;
   696		dma_addr_t dma_max = dart->dma_max;
   697		u32 ias = min_t(u32, dart->ias, fls64(dma_max));
   698		int ret = 0;
   699		int i, j;
   700	
   701		if (dart->pgsize > PAGE_SIZE)
   702			return -EINVAL;
   703	
   704		mutex_lock(&dart_domain->init_lock);
   705	
   706		if (dart_domain->finalized)
   707			goto done;
   708	
   709		for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
   710			dart_domain->stream_maps[i].dart = cfg->stream_maps[i].dart;
   711			for (j = 0; j < BITS_TO_LONGS(dart->num_streams); j++)
   712				atomic_long_set(&dart_domain->stream_maps[i].sidmap[j],
   713						cfg->stream_maps[i].sidmap[j]);
   714		}
   715	
   716		pgtbl_cfg = (struct io_pgtable_cfg){
   717			.pgsize_bitmap = dart->pgsize,
   718			.ias = ias,
   719			.oas = dart->oas,
   720			.coherent_walk = 1,
   721			.iommu_dev = dart->dev,
   722		};
   723	
   724		if (dart->locked) {
   725			unsigned long *sidmap;
   726			int sid;
   727			u32 ttbr;
   728	
   729			/* Locked DARTs can only have a single stream bound */
   730			sidmap = cfg->stream_maps[0].sidmap;
   731			sid = find_first_bit(sidmap, dart->num_streams);
   732	
   733			WARN_ON((sid < 0) || bitmap_weight(sidmap, dart->num_streams) > 1);
   734			ttbr = readl(dart->regs + DART_TTBR(dart, sid, 0));
   735	
   736			WARN_ON(!(ttbr & dart->hw->ttbr_valid));
   737	
   738			/* If the DART is locked, we need to keep the translation level count. */
   739			if (dart->hw->tcr_4level && dart->ias > 36) {
   740				if (readl(dart->regs + DART_TCR(dart, sid)) & dart->hw->tcr_4level) {
   741					if (ias < 37) {
   742						dev_info(dart->dev, "Expanded to ias=37 due to lock\n");
   743						pgtbl_cfg.ias = 37;
   744					}
   745				} else if (ias > 36) {
   746					dev_info(dart->dev, "Limited to ias=36 due to lock\n");
   747					pgtbl_cfg.ias = 36;
   748					if (dart->dma_min == 0 && dma_max == DMA_BIT_MASK(dart->ias)) {
 > 749						dma_max = DMA_BIT_MASK(pgtbl_cfg.ias);
   750					} else if ((dart->dma_min ^ dma_max) & ~DMA_BIT_MASK(36)) {
   751						dev_err(dart->dev,
   752							"Invalid DMA range for locked 3-level PT\n");
   753						ret = -ENOMEM;
   754						goto done;
   755					}
   756				}
   757			}
   758		}
   759	
   760		dart_domain->pgtbl_ops = alloc_io_pgtable_ops(dart->hw->fmt, &pgtbl_cfg,
   761							      &dart_domain->domain);
   762		if (!dart_domain->pgtbl_ops) {
   763			ret = -ENOMEM;
   764			goto done;
   765		}
   766	
   767		if (pgtbl_cfg.pgsize_bitmap == SZ_4K)
   768			dart_domain->mask = DMA_BIT_MASK(min_t(u32, dart->ias, 32));
   769		else if (pgtbl_cfg.apple_dart_cfg.n_levels == 3)
   770			dart_domain->mask = DMA_BIT_MASK(min_t(u32, dart->ias, 36));
   771		else if (pgtbl_cfg.apple_dart_cfg.n_levels == 4)
   772			dart_domain->mask = DMA_BIT_MASK(min_t(u32, dart->ias, 47));
   773	
   774		dart_domain->domain.pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
   775		dart_domain->domain.geometry.aperture_start = dart->dma_min;
   776		dart_domain->domain.geometry.aperture_end = dma_max;
   777		dart_domain->domain.geometry.force_aperture = true;
   778	
   779		dart_domain->finalized = true;
   780	
   781	done:
   782		mutex_unlock(&dart_domain->init_lock);
   783		return ret;
   784	}
   785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
