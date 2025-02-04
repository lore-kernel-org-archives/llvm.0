Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900FC223300;
	Tue,  4 Feb 2025 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738676770; cv=none; b=Zh0itmOl685Gl/DPdH/y/GF2E94n6I9/h4LFVNvWYor19E0M3Sr+6eQ7eijSsqWA1HoqsXpt9ixpk1vPbJW3O8lKJIsbX/2ZWfA95DqV6arBH0D12nEAqYY2x4ObCsntL+CerJ3DRNmoXGs0GqTVbswLfOHW4zFCX6dumuEo7ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738676770; c=relaxed/simple;
	bh=dlTAZAaG+6sdezvpQKTm/E692yu0ivrLgtZ6UQKH0kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Te43SAIBINa2HVQi8j2lOhXPK4V62wh5lD7c+b4B92wJ8ysZocd9vZeqmwn9AOsEyeRUgCCBdnmeRolxOSkpJIMfIx4fo1Zxf3OQrIyJrvN8Ru9vlkId4Mx0OwxE4U8SqaBlXA+cIOulAn8+UwTfEdEor8NGxZTILKFbSqvce0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ei0ea0NC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ei0ea0NC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738676768; x=1770212768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dlTAZAaG+6sdezvpQKTm/E692yu0ivrLgtZ6UQKH0kk=;
  b=Ei0ea0NCWUDkGYn+dt8UhE8g5NcsRYbYCcnQoeUxguTDuyDlBh5FDw1D
   xr9D8TgFSkla5HDAVtzujnHR7xG8urTL9ILsI5u2eCdkQd09aZfWd1Q/m
   mIilI0owv3E7QcDhApnVs1707ZlCqULtmwiR1r30Z38B9w/9H3JviUrzh
   Qerpx4xK8MrCnUbpGY5pjPwwkDXOMZoe5kg174Xl1U7N5o0uHdtUVOtbg
   P5BcS7yf2hievQzH9MURB9A5zgrVW3DsaZqRP0lcp8OmA7Vy+MJb57EVi
   Rgvq7eqR58pHzxc5m0STN1LNPPWGX1poDkaYxhLseUCiWwNMoo9e5puQe
   w==;
X-CSE-ConnectionGUID: PIE4c6ghT1W1RMGuGgcIfg==
X-CSE-MsgGUID: jYhhuv4UTCCyOvoWayZvfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="26803430"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="26803430"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 05:46:07 -0800
X-CSE-ConnectionGUID: WOkxPb/tTXSBCbLm46Dbsg==
X-CSE-MsgGUID: DH5ytsJxT2Sj5i7gtD4jBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="111144916"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2025 05:46:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfJFc-000sXH-0G;
	Tue, 04 Feb 2025 13:46:04 +0000
Date: Tue, 4 Feb 2025 21:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileaMnh6H 2/9]
 sound/pci/hda/tas2781_spi_fwlib.c:373:30: error: use of undeclared
 identifier 'PPC3_VERSION_TAS2781'
Message-ID: <202502042144.r94y4VGy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileaMnh6H
head:   500aea53057a952d584cbe1fa461c7adaaa9f655
commit: 66789ed82adcd9c42118004e0fc5ff2b3d72d959 [2/9] ASoC: tas2781: Support dsp firmware Alpha and Beta seaies
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250204/202502042144.r94y4VGy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502042144.r94y4VGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502042144.r94y4VGy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/pci/hda/tas2781_spi_fwlib.c:17:
   In file included from include/sound/pcm_params.h:10:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/pci/hda/tas2781_spi_fwlib.c:373:30: error: use of undeclared identifier 'PPC3_VERSION_TAS2781'
     373 |         if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
         |                                     ^
>> sound/pci/hda/tas2781_spi_fwlib.c:376:37: error: use of undeclared identifier 'PPC3_VERSION'
     376 |         } else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
         |                                            ^
   sound/pci/hda/tas2781_spi_fwlib.c:1608:17: error: use of undeclared identifier 'PPC3_VERSION'
    1608 |                 if (ppcver >= PPC3_VERSION) {
         |                               ^
   3 warnings and 3 errors generated.


vim +/PPC3_VERSION_TAS2781 +373 sound/pci/hda/tas2781_spi_fwlib.c

bb5f86ea50ffb2 Baojun Xu 2024-12-16  361  
bb5f86ea50ffb2 Baojun Xu 2024-12-16  362  /* fixed m68k compiling issue: mapping table can save code field */
bb5f86ea50ffb2 Baojun Xu 2024-12-16  363  static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
bb5f86ea50ffb2 Baojun Xu 2024-12-16  364  	struct tasdev_blk *block)
bb5f86ea50ffb2 Baojun Xu 2024-12-16  365  {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  366  	struct blktyp_devidx_map *p =
bb5f86ea50ffb2 Baojun Xu 2024-12-16  367  		(struct blktyp_devidx_map *)non_ppc3_mapping_table;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  368  	struct tasdevice_dspfw_hdr *fw_hdr = &tas_fmw->fw_hdr;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  369  	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr = &fw_hdr->fixed_hdr;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  370  	int i, n = ARRAY_SIZE(non_ppc3_mapping_table);
bb5f86ea50ffb2 Baojun Xu 2024-12-16  371  	unsigned char dev_idx = 0;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  372  
bb5f86ea50ffb2 Baojun Xu 2024-12-16 @373  	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  374  		p = (struct blktyp_devidx_map *)ppc3_tas2781_mapping_table;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  375  		n = ARRAY_SIZE(ppc3_tas2781_mapping_table);
bb5f86ea50ffb2 Baojun Xu 2024-12-16 @376  	} else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  377  		p = (struct blktyp_devidx_map *)ppc3_mapping_table;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  378  		n = ARRAY_SIZE(ppc3_mapping_table);
bb5f86ea50ffb2 Baojun Xu 2024-12-16  379  	}
bb5f86ea50ffb2 Baojun Xu 2024-12-16  380  
bb5f86ea50ffb2 Baojun Xu 2024-12-16  381  	for (i = 0; i < n; i++) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  382  		if (block->type == p[i].blktyp) {
bb5f86ea50ffb2 Baojun Xu 2024-12-16  383  			dev_idx = p[i].dev_idx;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  384  			break;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  385  		}
bb5f86ea50ffb2 Baojun Xu 2024-12-16  386  	}
bb5f86ea50ffb2 Baojun Xu 2024-12-16  387  
bb5f86ea50ffb2 Baojun Xu 2024-12-16  388  	return dev_idx;
bb5f86ea50ffb2 Baojun Xu 2024-12-16  389  }
bb5f86ea50ffb2 Baojun Xu 2024-12-16  390  

:::::: The code at line 373 was first introduced by commit
:::::: bb5f86ea50ffb292f42eb1ebdb99991d5c5ac3ba ALSA: hda/tas2781: Add tas2781 hda SPI driver

:::::: TO: Baojun Xu <baojun.xu@ti.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
