Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB5413FEA;
	Sun, 19 Nov 2023 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjzyiIUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700410475; x=1731946475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vOWSJJLttvNSlQq1NM1W57poEmhFiXEfXLcrmWvNL4k=;
  b=VjzyiIUCTDdhg6Y9wZDfE1o40/uhID5YNU6fMttsY7tEBvLCxKrJ/GY0
   ePmU/BewvIG2qtlz0FlPs5c8E72Z/Wqn7SJiKRKL5Rj1l8AjFsB8le3WS
   FF2YC/7nfqdWwhI5YG7NODKDOrjZ8uhbUgxzhE34OtyoJfm/On256EQtU
   TaOjwDPxRD8ymCCVrY+3LilfRqSvcgiWPoAd/MZJF7dTiVlggkf9Irr6m
   rknD+G8FSJ1Rsw4T8BFo26zEpVnpds63P6VDTkxn9aNAASjgMgvuN/Tqw
   KmWKO4fQ/mQofr8xgJmvnWTn6aQkM8bJ4YOJ/B2rLoxMpkW+e2el670cQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4616285"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="4616285"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 08:14:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="856783533"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="856783533"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2023 08:14:32 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4kRK-0005Gu-2A;
	Sun, 19 Nov 2023 16:14:30 +0000
Date: Mon, 20 Nov 2023 00:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/020-dart 35/40] drivers/iommu/apple-dart.c:779:16:
 warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka
 'unsigned int') changes value from 18446744073709551615 to 4294967295
Message-ID: <202311200000.oP0nHoZN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   29d9d098a7ff41f82efd8eb40f24f29e5dd6b2fe
commit: e53d630a41ea20440f6af6417371b2de7d91bdc9 [35/40] iommu: apple-dart: Support specifying the DMA aperture in the DT
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311200000.oP0nHoZN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200000.oP0nHoZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200000.oP0nHoZN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/apple-dart.c:779:16: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
                                           dma_max = DMA_BIT_MASK(pgtbl_cfg.ias);
                                                   ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   drivers/iommu/apple-dart.c:1345:18: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           dart->dma_max = DMA_BIT_MASK(dart->ias);
                         ~ ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   2 warnings generated.


vim +779 drivers/iommu/apple-dart.c

   721	
   722	static int apple_dart_finalize_domain(struct iommu_domain *domain,
   723					      struct device *dev,
   724					      struct apple_dart_master_cfg *cfg)
   725	{
   726		struct apple_dart_domain *dart_domain = to_dart_domain(domain);
   727		struct apple_dart *dart = cfg->stream_maps[0].dart;
   728		struct io_pgtable_cfg pgtbl_cfg;
   729		dma_addr_t dma_max = dart->dma_max;
   730		u32 ias = min_t(u32, dart->ias, fls64(dma_max));
   731		int ret = 0;
   732		int i, j;
   733	
   734		mutex_lock(&dart_domain->init_lock);
   735	
   736		if (dart_domain->finalized)
   737			goto done;
   738	
   739		for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
   740			dart_domain->stream_maps[i].dart = cfg->stream_maps[i].dart;
   741			for (j = 0; j < BITS_TO_LONGS(dart->num_streams); j++)
   742				atomic_long_set(&dart_domain->stream_maps[i].sidmap[j],
   743						cfg->stream_maps[i].sidmap[j]);
   744		}
   745	
   746		pgtbl_cfg = (struct io_pgtable_cfg){
   747			.pgsize_bitmap = dart->pgsize,
   748			.ias = ias,
   749			.oas = dart->oas,
   750			.coherent_walk = 1,
   751			.iommu_dev = dart->dev,
   752		};
   753	
   754		if (dart->locked) {
   755			unsigned long *sidmap;
   756			int sid;
   757			u32 ttbr;
   758	
   759			/* Locked DARTs can only have a single stream bound */
   760			sidmap = cfg->stream_maps[0].sidmap;
   761			sid = find_first_bit(sidmap, dart->num_streams);
   762	
   763			WARN_ON((sid < 0) || bitmap_weight(sidmap, dart->num_streams) > 1);
   764			ttbr = readl(dart->regs + DART_TTBR(dart, sid, 0));
   765	
   766			WARN_ON(!(ttbr & dart->hw->ttbr_valid));
   767	
   768			/* If the DART is locked, we need to keep the translation level count. */
   769			if (dart->hw->tcr_4level && dart->ias > 36) {
   770				if (readl(dart->regs + DART_TCR(dart, sid)) & dart->hw->tcr_4level) {
   771					if (ias < 37) {
   772						dev_info(dart->dev, "Expanded to ias=37 due to lock\n");
   773						pgtbl_cfg.ias = 37;
   774					}
   775				} else if (ias > 36) {
   776					dev_info(dart->dev, "Limited to ias=36 due to lock\n");
   777					pgtbl_cfg.ias = 36;
   778					if (dart->dma_min == 0 && dma_max == DMA_BIT_MASK(dart->ias)) {
 > 779						dma_max = DMA_BIT_MASK(pgtbl_cfg.ias);
   780					} else if ((dart->dma_min ^ dma_max) & ~DMA_BIT_MASK(36)) {
   781						dev_err(dart->dev,
   782							"Invalid DMA range for locked 3-level PT\n");
   783						ret = -ENOMEM;
   784						goto done;
   785					}
   786				}
   787			}
   788		}
   789	
   790		dart_domain->pgtbl_ops =
   791			alloc_io_pgtable_ops(dart->hw->fmt, &pgtbl_cfg, domain);
   792		if (!dart_domain->pgtbl_ops) {
   793			ret = -ENOMEM;
   794			goto done;
   795		}
   796	
   797		if (pgtbl_cfg.pgsize_bitmap == SZ_4K)
   798			dart_domain->mask = DMA_BIT_MASK(min_t(u32, dart->ias, 32));
   799		else if (pgtbl_cfg.apple_dart_cfg.n_levels == 3)
   800			dart_domain->mask = DMA_BIT_MASK(min_t(u32, dart->ias, 36));
   801		else if (pgtbl_cfg.apple_dart_cfg.n_levels == 4)
   802			dart_domain->mask = DMA_BIT_MASK(min_t(u32, dart->ias, 47));
   803	
   804		domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
   805		domain->geometry.aperture_start = dart->dma_min;
   806		domain->geometry.aperture_end = dma_max;
   807		domain->geometry.force_aperture = true;
   808	
   809		dart_domain->finalized = true;
   810	
   811		ret = apple_dart_setup_resv_locked(domain, dev, dart->pgsize);
   812	done:
   813		mutex_unlock(&dart_domain->init_lock);
   814		return ret;
   815	}
   816	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
