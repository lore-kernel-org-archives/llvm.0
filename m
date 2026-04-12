Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8591D5160;
	Sun, 12 Apr 2026 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775962645; cv=none; b=fTFlcaWJpVYd8ZpyDcysOCkYYVAvb2hqL/N0qg47lhm6R64nEkSbsq3nvlOz7DOrTbMyUI8HtS3+Ry2LiPT1+kkhL5VkMOJGqlt6dHmoR+o6c86MPRJAsfI0tyz0wCVxWXblq8HI6TsU+RpeBp8WQVBiuI/M7Rg9U5Bd9VVkopQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775962645; c=relaxed/simple;
	bh=VX0AfygEssvaZoILGuht53uXG8197qocwlpatyhBehw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qX3RleHsR+oH6HFcSX0pV3j81HF6vxvf5b20aZCkTSA0f+gcAqL42z6/9vGM1oGZxB1t+y3a77hg1ZvVyZadjc4LVIU8uFIKZ7syNfSSbXsT/dtV3rzCR5gBe2U9xzyTtAqdfKVaVbPY3vQxMwLDujyeQfKWf6ThhZ45OWFQ2I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1Ko8C+T; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1Ko8C+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775962644; x=1807498644;
  h=date:from:to:cc:subject:message-id;
  bh=VX0AfygEssvaZoILGuht53uXG8197qocwlpatyhBehw=;
  b=D1Ko8C+TJKskn985yNm97lpWf7GRDREkBPphtblCCp4DhVC41wYwJ9qD
   huCitW5zhbALqPL+4w1GoD4SAXSumH4i0Zu3AL1pqbin4s09U1/+t/a1G
   aLaSTLp/c4Xcuv3KpV/qLLe9nV7JwMysrUxjqWidWCPg1ORt/cnFIMiNJ
   TOjuWZxjOffGZSvsE3hBUdfTwXbVUlWBzPO2ipF/zFvS5yt5RTHJdVbHc
   x+u6+rDl5HGJwwUUCqZGj3bcEbrwWeAMdp2xV2MmZVZcsKt2476dpNUo/
   xM+kD1bQsgWdpmb2AvTPrd6PjkNKgegixD7wRIoV8L6oqBoF13kRKiWZz
   g==;
X-CSE-ConnectionGUID: N3mWaGB3QFi7rCpz2SgQvw==
X-CSE-MsgGUID: pr0j3nAeQpOAXsDoVebj1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88013648"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="88013648"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 19:57:24 -0700
X-CSE-ConnectionGUID: yL7xPu3UTricZA51KzQDwQ==
X-CSE-MsgGUID: fC5qW0dDRKOkL+vFl6qpRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="225167377"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Apr 2026 19:57:21 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBl0h-000000001mf-0zdF;
	Sun, 12 Apr 2026 02:57:19 +0000
Date: Sun, 12 Apr 2026 10:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Adrien Ricciardi <aricciardi@baylibre.com>
Subject: [fustini:b4/ssqosid-cbqri-rqsc 8/12]
 arch/riscv/kernel/qos/qos_resctrl.c:805:6: warning: unused variable 'percent'
Message-ID: <202604121014.3pinJHl8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Drew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri-rqsc
head:   5a65bb9f52039e24c966b497e5aa07e3835d15c2
commit: d1f9b2522cd5adc72b02b602f1f57d9b4afccfcb [8/12] RISC-V: QoS: enable resctrl support for Ssqosid
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260412/202604121014.3pinJHl8-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121014.3pinJHl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604121014.3pinJHl8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/qos/qos_resctrl.c:805:6: warning: unused variable 'percent' [-Wunused-variable]
     805 |         u32 percent;
         |             ^~~~~~~
   1 warning generated.


vim +/percent +805 arch/riscv/kernel/qos/qos_resctrl.c

6be827778200b3 Drew Fustini 2026-04-09  797  
6be827778200b3 Drew Fustini 2026-04-09  798  u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
6be827778200b3 Drew Fustini 2026-04-09  799  			    u32 closid, enum resctrl_conf_type type)
6be827778200b3 Drew Fustini 2026-04-09  800  {
6be827778200b3 Drew Fustini 2026-04-09  801  	struct cbqri_resctrl_dom *hw_dom;
6be827778200b3 Drew Fustini 2026-04-09  802  	struct cbqri_controller *ctrl;
6be827778200b3 Drew Fustini 2026-04-09  803  	u32 val;
6be827778200b3 Drew Fustini 2026-04-09  804  	int reg_offset;
6be827778200b3 Drew Fustini 2026-04-09 @805  	u32 percent;
6be827778200b3 Drew Fustini 2026-04-09  806  	u32 rbwb;
6be827778200b3 Drew Fustini 2026-04-09  807  	u64 reg;
6be827778200b3 Drew Fustini 2026-04-09  808  	int err;
6be827778200b3 Drew Fustini 2026-04-09  809  
6be827778200b3 Drew Fustini 2026-04-09  810  	hw_dom = container_of(d, struct cbqri_resctrl_dom, resctrl_ctrl_dom);
6be827778200b3 Drew Fustini 2026-04-09  811  
6be827778200b3 Drew Fustini 2026-04-09  812  	ctrl = hw_dom->hw_ctrl;
6be827778200b3 Drew Fustini 2026-04-09  813  
6be827778200b3 Drew Fustini 2026-04-09  814  	if (!r->alloc_capable)
6be827778200b3 Drew Fustini 2026-04-09  815  		return resctrl_get_default_ctrl(r);
6be827778200b3 Drew Fustini 2026-04-09  816  
6be827778200b3 Drew Fustini 2026-04-09  817  	val = resctrl_get_default_ctrl(r);
6be827778200b3 Drew Fustini 2026-04-09  818  
6be827778200b3 Drew Fustini 2026-04-09  819  	spin_lock(&ctrl->lock);
6be827778200b3 Drew Fustini 2026-04-09  820  
6be827778200b3 Drew Fustini 2026-04-09  821  	switch (r->rid) {
6be827778200b3 Drew Fustini 2026-04-09  822  	case RDT_RESOURCE_L2:
6be827778200b3 Drew Fustini 2026-04-09  823  	case RDT_RESOURCE_L3:
6be827778200b3 Drew Fustini 2026-04-09  824  		/* Clear cc_block_mask before read limit operation */
6be827778200b3 Drew Fustini 2026-04-09  825  		cbqri_set_cbm(ctrl, 0);
6be827778200b3 Drew Fustini 2026-04-09  826  
6be827778200b3 Drew Fustini 2026-04-09  827  		/* Capacity read limit operation for RCID (closid) */
6be827778200b3 Drew Fustini 2026-04-09  828  		err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT, closid, type);
6be827778200b3 Drew Fustini 2026-04-09  829  		if (err < 0) {
6be827778200b3 Drew Fustini 2026-04-09  830  			pr_err("%s(): operation failed: err = %d", __func__, err);
6be827778200b3 Drew Fustini 2026-04-09  831  			break;
6be827778200b3 Drew Fustini 2026-04-09  832  		}
6be827778200b3 Drew Fustini 2026-04-09  833  
6be827778200b3 Drew Fustini 2026-04-09  834  		/* Read capacity block mask for RCID (closid) */
6be827778200b3 Drew Fustini 2026-04-09  835  		reg_offset = CBQRI_CC_BLOCK_MASK_OFF;
6be827778200b3 Drew Fustini 2026-04-09  836  		reg = ioread64(ctrl->base + reg_offset);
6be827778200b3 Drew Fustini 2026-04-09  837  		val = reg;
6be827778200b3 Drew Fustini 2026-04-09  838  		break;
6be827778200b3 Drew Fustini 2026-04-09  839  
6be827778200b3 Drew Fustini 2026-04-09  840  	case RDT_RESOURCE_MBA:
6be827778200b3 Drew Fustini 2026-04-09  841  		/* Bandwidth read limit operation for RCID (closid) */
6be827778200b3 Drew Fustini 2026-04-09  842  		err = cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT, closid);
6be827778200b3 Drew Fustini 2026-04-09  843  		if (err < 0) {
6be827778200b3 Drew Fustini 2026-04-09  844  			pr_err("%s(): operation failed: err = %d", __func__, err);
6be827778200b3 Drew Fustini 2026-04-09  845  			break;
6be827778200b3 Drew Fustini 2026-04-09  846  		}
6be827778200b3 Drew Fustini 2026-04-09  847  
6be827778200b3 Drew Fustini 2026-04-09  848  		rbwb = cbqri_get_rbwb(ctrl);
6be827778200b3 Drew Fustini 2026-04-09  849  		val = DIV_ROUND_UP(rbwb * 100, ctrl->bc.nbwblks);
6be827778200b3 Drew Fustini 2026-04-09  850  		break;
6be827778200b3 Drew Fustini 2026-04-09  851  
6be827778200b3 Drew Fustini 2026-04-09  852  	default:
6be827778200b3 Drew Fustini 2026-04-09  853  		break;
6be827778200b3 Drew Fustini 2026-04-09  854  	}
6be827778200b3 Drew Fustini 2026-04-09  855  
6be827778200b3 Drew Fustini 2026-04-09  856  	spin_unlock(&ctrl->lock);
6be827778200b3 Drew Fustini 2026-04-09  857  	return val;
6be827778200b3 Drew Fustini 2026-04-09  858  }
1732744cb2b2e1 Drew Fustini 2026-04-09  859  

:::::: The code at line 805 was first introduced by commit
:::::: 6be827778200b3c0225b9143cbe96cadcb90a4f2 RISC-V: QoS: add resctrl arch callbacks for CBQRI controllers

:::::: TO: Drew Fustini <fustini@kernel.org>
:::::: CC: Drew Fustini <fustini@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
