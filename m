Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC7B2C2369;
	Fri,  7 Nov 2025 16:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762533419; cv=none; b=tCXxMnY0MRjZBZsDpMdntWeYHkPRSvC17Wx4Y6XQxchvNW+eY2a0CU9K2tU/Nfyzhnm83qwrwmFtjLOlD9SYmAVZOv6TL6zz/4ZFerrTf4bboup3ALxJn/J4FDRPAR+RYsjNdM9bM8Ul7eRPpDbGmC6SVrxXIZYKhdofrTi5X+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762533419; c=relaxed/simple;
	bh=prfo4qZFaa3dJxqjPdoYibze4nW+F2cYRv299qD88uM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVftD3dKmJmHnOVfa/I6V59eAtxAojke5aFTWffpUodyHLjWVQmHwlCF8YGjFznRVAYM8aZ5AYw2D3X4FT9fdvtmc74vZuK9qL+ghi6bkEU5+z1/zdQrrh3rkaJnxs/gs68cxsa5RUOYvRJQQYFyFdovoEV7tCXJu/3RNShc4bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=br0FFhCV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="br0FFhCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762533417; x=1794069417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=prfo4qZFaa3dJxqjPdoYibze4nW+F2cYRv299qD88uM=;
  b=br0FFhCVNN30sPU27RcwBtA2d8kAdc0a1aGK5KLnbyL7Jzvn3yXxfiiw
   z0XeL/6uHUEWCuoDSX4w7YCWzmTlTygMAZmtLK41mJ8uztVBUM4YQwLf6
   M5fwx9Rv25/BLLdAdBI3DnNA7xlhz8qiSGyFCFi2n/aWcB2+5fzPccmhh
   EOd7XIkPPAZPYT5WxOwBcDqGyUebcjslwgGYeG/tG7oRaUMwwHITVy7ka
   wIi+Cb3QtIjHulWW72yRyUmy5stFGna5xF0W/kCn48aXMOVlq/tnFroAf
   9ZvaQRjN7hFPPkAUHhJRt90sszxtkKTAK870/1MalZ512CuWWfX7/WbQC
   Q==;
X-CSE-ConnectionGUID: OjqPTBxMT5Gs5fJVOVTSBg==
X-CSE-MsgGUID: MCXOgMTqTSWqdz43wF/VXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64779798"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="64779798"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 08:36:57 -0800
X-CSE-ConnectionGUID: PAYCbPbHSK+89+pj8AuGuA==
X-CSE-MsgGUID: i9WTPpIZTC2SRPTqxVJnxA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2025 08:36:55 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHPSG-00007P-38;
	Fri, 07 Nov 2025 16:36:52 +0000
Date: Sat, 8 Nov 2025 00:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Xi Pardee <xi.pardee@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-fixes 24/24]
 drivers/platform/x86/intel/pmc/wcl.c:461:3: error: field designator
 'lpm_req_guid' does not refer to any field in type 'const struct
 pmc_reg_map'
Message-ID: <202511080018.NOb0mcJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-fixes
head:   9c8249cfdf5aa2b843b0cbef81eb0898493694fe
commit: 9c8249cfdf5aa2b843b0cbef81eb0898493694fe [24/24] platform/x86:intel/pmc: Enable SSRAM support for Wildcat Lake
config: i386-buildonly-randconfig-005-20251107 (https://download.01.org/0day-ci/archive/20251108/202511080018.NOb0mcJW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080018.NOb0mcJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080018.NOb0mcJW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/intel/pmc/wcl.c:461:3: error: field designator 'lpm_req_guid' does not refer to any field in type 'const struct pmc_reg_map'
     461 |         .lpm_req_guid = PCDN_LPM_REQ_GUID,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +461 drivers/platform/x86/intel/pmc/wcl.c

   433	
   434	static const struct pmc_reg_map wcl_pcdn_reg_map = {
   435		.pfear_sts = ext_wcl_pcdn_pfear_map,
   436		.slp_s0_offset = CNP_PMC_SLP_S0_RES_COUNTER_OFFSET,
   437		.slp_s0_res_counter_step = TGL_PMC_SLP_S0_RES_COUNTER_STEP,
   438		.ltr_show_sts = wcl_pcdn_ltr_show_map,
   439		.msr_sts = msr_map,
   440		.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
   441		.regmap_length = WCL_PCD_PMC_MMIO_REG_LEN,
   442		.ppfear0_offset = CNP_PMC_HOST_PPFEAR0A,
   443		.ppfear_buckets = LNL_PPFEAR_NUM_ENTRIES,
   444		.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
   445		.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
   446		.lpm_num_maps = PTL_LPM_NUM_MAPS,
   447		.ltr_ignore_max = LNL_NUM_IP_IGN_ALLOWED,
   448		.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
   449		.etr3_offset = ETR3_OFFSET,
   450		.lpm_sts_latch_en_offset = MTL_LPM_STATUS_LATCH_EN_OFFSET,
   451		.lpm_priority_offset = MTL_LPM_PRI_OFFSET,
   452		.lpm_en_offset = MTL_LPM_EN_OFFSET,
   453		.lpm_residency_offset = MTL_LPM_RESIDENCY_OFFSET,
   454		.lpm_sts = wcl_pcdn_lpm_maps,
   455		.lpm_status_offset = MTL_LPM_STATUS_OFFSET,
   456		.lpm_live_status_offset = MTL_LPM_LIVE_STATUS_OFFSET,
   457		.s0ix_blocker_maps = wcl_pcdn_blk_maps,
   458		.s0ix_blocker_offset = LNL_S0IX_BLOCKER_OFFSET,
   459		.num_s0ix_blocker = WCL_NUM_S0IX_BLOCKER,
   460		.blocker_req_offset = WCL_BLK_REQ_OFFSET,
 > 461		.lpm_req_guid = PCDN_LPM_REQ_GUID,
   462	};
   463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
