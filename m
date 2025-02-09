Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FEF1E284C;
	Sun,  9 Feb 2025 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739136225; cv=none; b=Yhw5lsEjYlE6+eFDkdEbcJuXjb7fvKrY+ulwIjMihEVudKvTveYopCypiytmNqaNqBej1SoIcdkNh1d94FjxMYcLZyQNhxB0Z/Z0vE/ejeZhMfGjTBhKmLhpgLTJqmWu9mXfRQI6u1ulqNaE45JJSFhxC2jCbwYwnD2wsjvEqAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739136225; c=relaxed/simple;
	bh=uV/WgMn8m089k8GMcTNX08suqey0hWPffoduC6ozYqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MwazXtxAbLIKlzzoP4qOP6U4c6X1KqPY1vOmXmZa0GNf3JXv4Tjk3qjch0tYzpR25cc+4GtA2wV42gUTSSzXAKLUoGRoqYAJkR1/cZirO/NPVo4vaVzuNUgFtpR+OSCwVXubxiBix9C27mkwJg2XACRIZ4J0PuqmFiKFClR7jqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXsW2M6F; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXsW2M6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739136223; x=1770672223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uV/WgMn8m089k8GMcTNX08suqey0hWPffoduC6ozYqU=;
  b=FXsW2M6FbjCAmz9+ab2uXEyo/BNMXsyvyav6Qvew4a8mVT4IEEHh4Rtp
   gDuQrBWxzgQvlLejwPxrhvjoGgnopHdsjrqXTuTjY44C+Zc9RuQEHN8z8
   Hv7kr5vXbpqfSEfvkQz97qqzQTgpWwJtRQLx2TrtEAs5EW6hejd5zkrT5
   67Y2xF0ov/DDvV+QXS33PDN8BQgRPp18aKhToeUbf72jR+6bUHLTmxJuy
   nKzNfB2+u9tHQKaVs7tAT6vnnziAERhMcbK/R/750yEGBL6YNpEL7VGP7
   94v06PP4t9tg8/TO+0fl1kHQPwVphsyY63xgujrknIdLI9qBq7k0xLbsa
   Q==;
X-CSE-ConnectionGUID: qQrMcR0ZRHujBpdCGTsrjw==
X-CSE-MsgGUID: hub6UIE1Q/6qspPkaDsSZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="42553687"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="42553687"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 13:23:42 -0800
X-CSE-ConnectionGUID: mxn63RIaTZm1u84IuuZVUw==
X-CSE-MsgGUID: aPV5KyghSO+/ZSN89QG50A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116088146"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Feb 2025 13:23:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thEmA-0011v9-2i;
	Sun, 09 Feb 2025 21:23:38 +0000
Date: Mon, 10 Feb 2025 05:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/020-dart 17/22] drivers/iommu/apple-dart.c:783:16:
 warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka
 'unsigned int') changes value from 18446744073709551615 to 4294967295
Message-ID: <202502100542.4C09aYEy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   20a369d106d69cb8fb5e42c09f6a1881dbbdfd2c
commit: 5dfbd033f4a67bb174d466b1c52fa28e14bf6653 [17/22] iommu: apple-dart: Support specifying the DMA aperture in the DT
config: i386-buildonly-randconfig-003-20250210 (https://download.01.org/0day-ci/archive/20250210/202502100542.4C09aYEy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100542.4C09aYEy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100542.4C09aYEy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/apple-dart.c:783:16: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     783 |                                         dma_max = DMA_BIT_MASK(pgtbl_cfg.ias);
         |                                                 ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:40: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   drivers/iommu/apple-dart.c:1387:18: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1387 |         dart->dma_max = DMA_BIT_MASK(dart->ias);
         |                       ~ ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:40: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_IOMMU
   Depends on [n]: IOMMU_SUPPORT [=y] && OF [=n] && IOMMU_API [=y]
   Selected by [y]:
   - APPLE_DART [=y] && IOMMU_SUPPORT [=y] && (ARCH_APPLE || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]


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
