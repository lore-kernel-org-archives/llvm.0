Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F671AAE1D;
	Thu,  5 Dec 2024 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733382351; cv=none; b=BZ27E4QV5b+TsJUbyjTM0BnbDZ8qjoQMuF+IRAtunqZ88ZIIG+UhNrRB3ybXWRsaMK2CtAJRwAaU+7+6eA6TMjcM9h6ABek+u9qxwIT5e5q3Zpychq5/qBiUVVWKjtGuFhCjiflsaf0LyZ+ztXqK4x9fQ8soaG7PMHrexK00KXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733382351; c=relaxed/simple;
	bh=VdTz0POCam0A6OuMHqY4M2zLhrdZWhBseRnZVjcC4nM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mOoJnIpRzZ2LU9MKz7NEg4JjNlZyHIdrzknBOsUWD9jKfWIEtgk6lPec168OzC4w6Z+wFHt645C2tP6PegSA0jaCwJvpf9ocbxRpjbfTyc01is92sgPrQ1XeI8Ex3DTX6+kAAPGHkYfHl/cTtDLfCjX+ZWt4Qj5kOA2Zvj3GlQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdCIeyMA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdCIeyMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733382350; x=1764918350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VdTz0POCam0A6OuMHqY4M2zLhrdZWhBseRnZVjcC4nM=;
  b=fdCIeyMAGvushqbc+5se1zNJHYXW3AhzwAk9rmL34CbnZVbO0Ut5vUZt
   m+bRUSpzUKm8iEx6PWqO6G9gONdEmuIMNZxqkgw0hMbBUOFCbNrEGFNs3
   hM0T/3/dKeDjkODop6V87kclO/FbmBXNojSzyYH+ExdPHARrwQ3Oy+pE3
   02ZfF6MmFgFKdr4BDpdVTdjRHdom1AFZOyDKzqd6Ij3hxTnVekPC6UaKC
   urWpE37C6p8t32tLjMe48YKo/jmvnnfa/bo0b6Mtld6elSdz43Bzzbv82
   2dg2HtlDinpKBCdwmNOGy5OOjBiKDBzE290Idtw0eu/MZX60mC2rPovQ7
   g==;
X-CSE-ConnectionGUID: B/a5Uaq6T3asLWfOZSzvhQ==
X-CSE-MsgGUID: zVZTZ0FESMyKNJKJ6Hz6oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45054709"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="45054709"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:05:49 -0800
X-CSE-ConnectionGUID: xbUI12VSQYq9FGrOuO87fQ==
X-CSE-MsgGUID: 49mJq3teQ1eu2Q++IUneZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="93690750"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Dec 2024 23:05:46 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ5vk-0003vX-1c;
	Thu, 05 Dec 2024 07:05:44 +0000
Date: Thu, 5 Dec 2024 15:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/extended-linear 2/4]
 drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of
 type
Message-ID: <202412051418.zWk0tqCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   cc3b7ba41f14d666907c81d2b5079170659e37b1
commit: 6576e541fcc39fd4f68ddaf2e4851d7eb30c9791 [2/4] acpi/hmat / cxl: Add extended linear cache support for CXL
config: i386-buildonly-randconfig-002-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051418.zWk0tqCt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051418.zWk0tqCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051418.zWk0tqCt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/aic94xx/aic94xx_sds.c:10:
   In file included from include/linux/pci.h:1644:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/scsi/aic94xx/aic94xx_sds.c:14:
   In file included from drivers/scsi/aic94xx/aic94xx.h:16:
   In file included from include/scsi/libsas.h:16:
   In file included from include/linux/libata.h:22:
   include/linux/acpi.h:1105:19: error: redefinition of 'hmat_get_extended_linear_cache_size'
    1105 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^
   include/linux/acpi.h:448:19: note: previous definition is here
     448 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^
   In file included from drivers/scsi/aic94xx/aic94xx_sds.c:15:
>> drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of type [-Wshift-count-overflow]
     252 |         asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/aic94xx/aic94xx_hwi.h:210:61: note: expanded from macro 'ASD_BUSADDR_HI'
     210 |                                     ? ((u32)((__dma_handle) >> 32)) \
         |                                                             ^  ~~
   2 warnings and 1 error generated.
--
   In file included from drivers/scsi/aic94xx/aic94xx_init.c:12:
   In file included from include/linux/pci.h:1644:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/scsi/aic94xx/aic94xx_init.c:17:
   In file included from include/scsi/sas_ata.h:13:
   In file included from include/linux/libata.h:22:
   include/linux/acpi.h:1105:19: error: redefinition of 'hmat_get_extended_linear_cache_size'
    1105 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^
   include/linux/acpi.h:448:19: note: previous definition is here
     448 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^
   In file included from drivers/scsi/aic94xx/aic94xx_init.c:21:
>> drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of type [-Wshift-count-overflow]
     252 |         asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/aic94xx/aic94xx_hwi.h:210:61: note: expanded from macro 'ASD_BUSADDR_HI'
     210 |                                     ? ((u32)((__dma_handle) >> 32)) \
         |                                                             ^  ~~
   drivers/scsi/aic94xx/aic94xx_init.c:741:45: warning: shift count >= width of type [-Wshift-count-overflow]
     741 |         err = dma_set_mask_and_coherent(&dev->dev, DMA_BIT_MASK(64));
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   3 warnings and 1 error generated.


vim +252 drivers/scsi/aic94xx/aic94xx_reg.h

2908d778ab3e244 James Bottomley 2006-08-29  247  
2908d778ab3e244 James Bottomley 2006-08-29  248  static inline void asd_write_reg_addr(struct asd_ha_struct *asd_ha, u32 reg,
2908d778ab3e244 James Bottomley 2006-08-29  249  				      dma_addr_t dma_handle)
2908d778ab3e244 James Bottomley 2006-08-29  250  {
2908d778ab3e244 James Bottomley 2006-08-29  251  	asd_write_reg_dword(asd_ha, reg,   ASD_BUSADDR_LO(dma_handle));
2908d778ab3e244 James Bottomley 2006-08-29 @252  	asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
2908d778ab3e244 James Bottomley 2006-08-29  253  }
2908d778ab3e244 James Bottomley 2006-08-29  254  

:::::: The code at line 252 was first introduced by commit
:::::: 2908d778ab3e244900c310974e1fc1c69066e450 [SCSI] aic94xx: new driver

:::::: TO: James Bottomley <James.Bottomley@SteelEye.com>
:::::: CC: James Bottomley <jejb@mulgrave.il.steeleye.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
