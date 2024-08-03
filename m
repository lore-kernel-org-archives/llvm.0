Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B649E84E1C;
	Sat,  3 Aug 2024 11:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722683405; cv=none; b=bVVK8f0dXOgjY1iQAEtxhiXN4S5eB2jgW2g/dZszClbNMNSem5n6QeDoKD6t7dmeGrRfDzyGcBtCl2A3C9e1oba8qaTvEF5R4DrD/dlAc+GwJjU0k2oDdWJHLOlLMk0bklT85XHV8wciCcr2ZWPiNwHRqPnlqm99C3jiSYPUH2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722683405; c=relaxed/simple;
	bh=8lyIZtJ2MY+ILXH/uKyEkqiJE4bkBSi6tQXnItZNG3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHfbjg4efbdsnyq7ZlatiJWJuN7lr21Bl2gscsConn6Bs/LNjeFY7Yy7wE7hMjr4z5/mHlA0I6t6nGD9Q/6xkBXwbCTBfNGHUWIjdn28JyW+8aOhIySeNKVuoCfRFR/4IiA2N6viX2HwpO4is1kwmppDmmmrSNzSE6UbgpIbJO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fw4JFzIf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fw4JFzIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722683402; x=1754219402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8lyIZtJ2MY+ILXH/uKyEkqiJE4bkBSi6tQXnItZNG3Y=;
  b=fw4JFzIfkPkgHK2Cofl7H5CJA7EVGh5nkx/Dw7AYtUxNxgWJhnOD5daV
   uih1YmQ7TW/NQSQ7fMqeGS3n7s3qDjD6OwXtXblD6fXlXvuqes/VX6fjR
   C/KI/pMzuytzz1AkfwbLePenyx26KypResoT0+DpYfXPWsZd19X7ZKrmH
   yUX8Q7+xhCtky1Vw4oRCmSCR/b6Og+9DDSEihHhsQvuQKcMJnLU3z5Bd7
   p7YLJOtSfqdbYeTqrPf4aMPTxyObtL5SETi1aMFRRefsS+iXAuIkQUVei
   qZNffCMS4aHg4oLnqXKLz7mnq2uSjNw/XCnnyEjaVgpPpldpxLkhpj1Dx
   w==;
X-CSE-ConnectionGUID: COgIQ5CuTYKfGZ+arusKfA==
X-CSE-MsgGUID: 8QOVm+glQsSAPBR5v7YS4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20816031"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20816031"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 04:10:01 -0700
X-CSE-ConnectionGUID: d+gctCiMTOSNMBifOSsDIQ==
X-CSE-MsgGUID: IKKVm2x+TZuGL10ebXWFHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60323237"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Aug 2024 04:10:00 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saCe5-0000Oe-17;
	Sat, 03 Aug 2024 11:09:57 +0000
Date: Sat, 3 Aug 2024 19:03:56 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.11-rc1 114/128]
 drivers/platform/arm64/mpam/mpam_resctrl.c:384:6: warning: variable 'err' is
 used uninitialized whenever 'if' condition is true
Message-ID: <202408031840.zel29JoK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.11-rc1
head:   063bc546005302904092c158fe3228dc8af798a9
commit: f6cf53b477a878020ffbcbfcfc4bc520d6b5332a [114/128] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240803/202408031840.zel29JoK-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031840.zel29JoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031840.zel29JoK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:6:
   In file included from include/linux/arm_mpam.h:7:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/arm64/mpam/mpam_resctrl.c:384:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     384 |         if (irqs_disabled()) {
         |             ^~~~~~~~~~~~~~~
   include/linux/irqflags.h:248:2: note: expanded from macro 'irqs_disabled'
     248 |         ({                                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     249 |                 unsigned long _flags;                   \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     250 |                 raw_local_save_flags(_flags);           \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     251 |                 raw_irqs_disabled_flags(_flags);        \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     252 |         })
         |         ~~
   drivers/platform/arm64/mpam/mpam_resctrl.c:403:9: note: uninitialized use occurs here
     403 |         return err;
         |                ^~~
   drivers/platform/arm64/mpam/mpam_resctrl.c:384:2: note: remove the 'if' if its condition is always false
     384 |         if (irqs_disabled()) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
     385 |                 /* Check if we can access this domain without an IPI */
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     386 |         } else {
         |         ~~~~~~
   drivers/platform/arm64/mpam/mpam_resctrl.c:353:9: note: initialize the variable 'err' to silence this warning
     353 |         int err;
         |                ^
         |                 = 0
   6 warnings generated.


vim +384 drivers/platform/arm64/mpam/mpam_resctrl.c

0225f5d17c991f James Morse 2023-03-09  348  
511a450ae3ea92 James Morse 2021-06-25  349  int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
511a450ae3ea92 James Morse 2021-06-25  350  			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
511a450ae3ea92 James Morse 2021-06-25  351  			   u64 *val, void *arch_mon_ctx)
511a450ae3ea92 James Morse 2021-06-25  352  {
511a450ae3ea92 James Morse 2021-06-25  353  	int err;
511a450ae3ea92 James Morse 2021-06-25  354  	u64 cdp_val;
511a450ae3ea92 James Morse 2021-06-25  355  	struct mon_cfg cfg;
511a450ae3ea92 James Morse 2021-06-25  356  	struct mpam_resctrl_dom *dom;
511a450ae3ea92 James Morse 2021-06-25  357  	u32 mon = *(u32 *)arch_mon_ctx;
511a450ae3ea92 James Morse 2021-06-25  358  	enum mpam_device_features type;
511a450ae3ea92 James Morse 2021-06-25  359  
511a450ae3ea92 James Morse 2021-06-25  360  	resctrl_arch_rmid_read_context_check();
511a450ae3ea92 James Morse 2021-06-25  361  
511a450ae3ea92 James Morse 2021-06-25  362  	dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
511a450ae3ea92 James Morse 2021-06-25  363  
511a450ae3ea92 James Morse 2021-06-25  364  	switch (eventid) {
511a450ae3ea92 James Morse 2021-06-25  365  	case QOS_L3_OCCUP_EVENT_ID:
511a450ae3ea92 James Morse 2021-06-25  366  		type = mpam_feat_msmon_csu;
511a450ae3ea92 James Morse 2021-06-25  367  		break;
511a450ae3ea92 James Morse 2021-06-25  368  	case QOS_L3_MBM_LOCAL_EVENT_ID:
511a450ae3ea92 James Morse 2021-06-25  369  	case QOS_L3_MBM_TOTAL_EVENT_ID:
511a450ae3ea92 James Morse 2021-06-25  370  		type = mpam_feat_msmon_mbwu;
511a450ae3ea92 James Morse 2021-06-25  371  		break;
511a450ae3ea92 James Morse 2021-06-25  372  	default:
511a450ae3ea92 James Morse 2021-06-25  373  		return -EINVAL;
511a450ae3ea92 James Morse 2021-06-25  374  	}
511a450ae3ea92 James Morse 2021-06-25  375  
511a450ae3ea92 James Morse 2021-06-25  376  	cfg.mon = mon;
511a450ae3ea92 James Morse 2021-06-25  377  	if (cfg.mon == USE_RMID_IDX)
511a450ae3ea92 James Morse 2021-06-25  378  		cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
511a450ae3ea92 James Morse 2021-06-25  379  
511a450ae3ea92 James Morse 2021-06-25  380  	cfg.match_pmg = true;
511a450ae3ea92 James Morse 2021-06-25  381  	cfg.pmg = rmid;
0225f5d17c991f James Morse 2023-03-09  382  	cfg.opts = resctrl_evt_config_to_mpam(dom->mbm_local_evt_cfg);
511a450ae3ea92 James Morse 2021-06-25  383  
511a450ae3ea92 James Morse 2021-06-25 @384  	if (irqs_disabled()) {
511a450ae3ea92 James Morse 2021-06-25  385  		/* Check if we can access this domain without an IPI */
511a450ae3ea92 James Morse 2021-06-25  386  	} else {
511a450ae3ea92 James Morse 2021-06-25  387  		if (cdp_enabled) {
511a450ae3ea92 James Morse 2021-06-25  388  			cfg.partid = closid << 1;
511a450ae3ea92 James Morse 2021-06-25  389  			err = mpam_msmon_read(dom->comp, &cfg, type, val);
511a450ae3ea92 James Morse 2021-06-25  390  			if (err)
511a450ae3ea92 James Morse 2021-06-25  391  				return err;
511a450ae3ea92 James Morse 2021-06-25  392  
511a450ae3ea92 James Morse 2021-06-25  393  			cfg.partid += 1;
511a450ae3ea92 James Morse 2021-06-25  394  			err = mpam_msmon_read(dom->comp, &cfg, type, &cdp_val);
511a450ae3ea92 James Morse 2021-06-25  395  			if (!err)
511a450ae3ea92 James Morse 2021-06-25  396  				*val += cdp_val;
511a450ae3ea92 James Morse 2021-06-25  397  		} else {
511a450ae3ea92 James Morse 2021-06-25  398  			cfg.partid = closid;
511a450ae3ea92 James Morse 2021-06-25  399  			err = mpam_msmon_read(dom->comp, &cfg, type, val);
511a450ae3ea92 James Morse 2021-06-25  400  		}
511a450ae3ea92 James Morse 2021-06-25  401  	}
511a450ae3ea92 James Morse 2021-06-25  402  
511a450ae3ea92 James Morse 2021-06-25  403  	return err;
511a450ae3ea92 James Morse 2021-06-25  404  }
511a450ae3ea92 James Morse 2021-06-25  405  

:::::: The code at line 384 was first introduced by commit
:::::: 511a450ae3ea928b6095521b4e44a6c874eeae86 arm_mpam: resctrl: Add resctrl_arch_rmid_read() and resctrl_arch_reset_rmid()

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: James Morse <james.morse@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
