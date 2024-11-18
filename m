Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2771547E8;
	Mon, 18 Nov 2024 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731920322; cv=none; b=acRdbaU8kMuM+GoWZ74bCQNVpWA1tLAEc5kUAwZJD/KMe5/7ilmo9USE8xsZeRoBB2RK1YPIE/01BedcjHDOiG2gumTlGmuMa1Ay0/UPISGY5E0JcL/KpAglG4Q2AcF704vbTeJKL4GW2DrXdwq/3kPz5J1Gc1n6feQ+X8WG2fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731920322; c=relaxed/simple;
	bh=p+8gOqiMuowCoUchcE+B9SvOC+DKTckesEZLieiQNmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J2OCYBYBtoPSlpzcMjcOKqVkqvxCLvhPn6FFR5eOcpXJwvsiMCKpguZNU4mrmVCFM8IH1rY2BuHVuOvlsVFKiCdKpOp61NtcUf1dDcTh9JeTjrqL1DqfiOH2g98Im5RJs5AB2AfG0VmP6YIjyEl6TVKM/zVQ1kY4qdxvccIBk3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VR6gMOdj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VR6gMOdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731920320; x=1763456320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+8gOqiMuowCoUchcE+B9SvOC+DKTckesEZLieiQNmk=;
  b=VR6gMOdjCTBGOI2cFdywaCLuKoEnLuDnv/RV/GwJvN6zts6XEGvnlB8K
   Cjymlz3gMO3r3HaRDPPt8fo+dENu2irtzYt6J4xOA0ZAOprUhwfVuEJhV
   LWOpmZy41lhlF/QLUxghue+Vw/AxwtCHTT3JKJLjFlahoDPlDlnD4v5vt
   UeKIvIO/83ou4i6w7d1crs2KReOTjSWrfYAOQSOi4b0lpIHn7O+fFLPa4
   bk8cRALPFTFw/7uMcYLRnnyNT3np+HzdoSpDUHS6OcdJ+VvQjU1Tf+YLk
   pIQTC2P2DZLGDDnPdaFcRyuArtwTU7UDKQVH93vOltaIVdX8ooFW4Y/Yh
   w==;
X-CSE-ConnectionGUID: GDHCF1OITHaEAjmhW5gtBQ==
X-CSE-MsgGUID: 0YHJcNp8T/axKInA/0tmNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35636861"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="35636861"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 00:58:40 -0800
X-CSE-ConnectionGUID: clftAcuvQiS+YdDX0zYATw==
X-CSE-MsgGUID: wDfGKkUkRqOZ4r/Z62D2/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89173046"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Nov 2024 00:58:38 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCxad-0002Kz-1H;
	Mon, 18 Nov 2024 08:58:35 +0000
Date: Mon, 18 Nov 2024 16:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/020-dart 16/21] drivers/iommu/apple-dart.c:783:16:
 warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka
 'unsigned int') changes value from 18446744073709551615 to 4294967295
Message-ID: <202411181653.NzV6rKaz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   7b4afedff097b1b09da32f01db73cbc0788bafd9
commit: 3cf6b6955a32259ac85ffe4ce2d4c858d69faf8e [16/21] iommu: apple-dart: Support specifying the DMA aperture in the DT
config: i386-buildonly-randconfig-004-20241118 (https://download.01.org/0day-ci/archive/20241118/202411181653.NzV6rKaz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181653.NzV6rKaz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181653.NzV6rKaz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/apple-dart.c:18:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iommu/apple-dart.c:783:16: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     783 |                                         dma_max = DMA_BIT_MASK(pgtbl_cfg.ias);
         |                                                 ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   drivers/iommu/apple-dart.c:1387:18: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1387 |         dart->dma_max = DMA_BIT_MASK(dart->ias);
         |                       ~ ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   3 warnings generated.


vim +783 drivers/iommu/apple-dart.c

   723	
   724	static int apple_dart_finalize_domain(struct apple_dart_domain *dart_domain,
   725					      struct device *dev,
   726					      struct apple_dart_master_cfg *cfg)
   727	{
   728		struct apple_dart *dart = cfg->stream_maps[0].dart;
   729		struct io_pgtable_cfg pgtbl_cfg;
   730		dma_addr_t dma_max = dart->dma_max;
   731		u32 ias = min_t(u32, dart->ias, fls64(dma_max));
   732		int ret = 0;
   733		int i, j;
   734	
   735		if (dart->pgsize > PAGE_SIZE)
   736			return -EINVAL;
   737	
   738		mutex_lock(&dart_domain->init_lock);
   739	
   740		if (dart_domain->finalized)
   741			goto done;
   742	
   743		for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
   744			dart_domain->stream_maps[i].dart = cfg->stream_maps[i].dart;
   745			for (j = 0; j < BITS_TO_LONGS(dart->num_streams); j++)
   746				atomic_long_set(&dart_domain->stream_maps[i].sidmap[j],
   747						cfg->stream_maps[i].sidmap[j]);
   748		}
   749	
   750		pgtbl_cfg = (struct io_pgtable_cfg){
   751			.pgsize_bitmap = dart->pgsize,
   752			.ias = ias,
   753			.oas = dart->oas,
   754			.coherent_walk = 1,
   755			.iommu_dev = dart->dev,
   756		};
   757	
   758		if (dart->locked) {
   759			unsigned long *sidmap;
   760			int sid;
   761			u32 ttbr;
   762	
   763			/* Locked DARTs can only have a single stream bound */
   764			sidmap = cfg->stream_maps[0].sidmap;
   765			sid = find_first_bit(sidmap, dart->num_streams);
   766	
   767			WARN_ON((sid < 0) || bitmap_weight(sidmap, dart->num_streams) > 1);
   768			ttbr = readl(dart->regs + DART_TTBR(dart, sid, 0));
   769	
   770			WARN_ON(!(ttbr & dart->hw->ttbr_valid));
   771	
   772			/* If the DART is locked, we need to keep the translation level count. */
   773			if (dart->hw->tcr_4level && dart->ias > 36) {
   774				if (readl(dart->regs + DART_TCR(dart, sid)) & dart->hw->tcr_4level) {
   775					if (ias < 37) {
   776						dev_info(dart->dev, "Expanded to ias=37 due to lock\n");
   777						pgtbl_cfg.ias = 37;
   778					}
   779				} else if (ias > 36) {
   780					dev_info(dart->dev, "Limited to ias=36 due to lock\n");
   781					pgtbl_cfg.ias = 36;
   782					if (dart->dma_min == 0 && dma_max == DMA_BIT_MASK(dart->ias)) {
 > 783						dma_max = DMA_BIT_MASK(pgtbl_cfg.ias);
   784					} else if ((dart->dma_min ^ dma_max) & ~DMA_BIT_MASK(36)) {
   785						dev_err(dart->dev,
   786							"Invalid DMA range for locked 3-level PT\n");
   787						ret = -ENOMEM;
   788						goto done;
   789					}
   790				}
   791			}
   792		}
   793	
   794		dart_domain->pgtbl_ops = alloc_io_pgtable_ops(dart->hw->fmt, &pgtbl_cfg,
   795							      &dart_domain->domain);
   796		if (!dart_domain->pgtbl_ops) {
   797			ret = -ENOMEM;
   798			goto done;
   799		}
   800	
   801		if (pgtbl_cfg.pgsize_bitmap == SZ_4K)
   802			dart_domain->mask = DMA_BIT_MASK(min_t(u32, dart->ias, 32));
   803		else if (pgtbl_cfg.apple_dart_cfg.n_levels == 3)
   804			dart_domain->mask = DMA_BIT_MASK(min_t(u32, dart->ias, 36));
   805		else if (pgtbl_cfg.apple_dart_cfg.n_levels == 4)
   806			dart_domain->mask = DMA_BIT_MASK(min_t(u32, dart->ias, 47));
   807	
   808		dart_domain->domain.pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
   809		dart_domain->domain.geometry.aperture_start = dart->dma_min;
   810		dart_domain->domain.geometry.aperture_end = dma_max;
   811		dart_domain->domain.geometry.force_aperture = true;
   812	
   813		dart_domain->finalized = true;
   814	
   815		ret = apple_dart_setup_resv_locked(&dart_domain->domain, dev, dart->pgsize);
   816	done:
   817		mutex_unlock(&dart_domain->init_lock);
   818		return ret;
   819	}
   820	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
