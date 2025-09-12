Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F931EA7DD;
	Fri, 12 Sep 2025 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757674679; cv=none; b=gtTo9ywb6MaDWz49Lm1XzFRUGEroOuHp+QbGYHvY05bbuCvp2DJzWOrz8BZUM4vwuXkyHni4dzXENbsUZMlDxh4dzBi6uPBXJw20OZcwcurAl1qWRLTKTAH6WPcRbR81W/zo4P/lwchAYCS65jzHe3rBu5Pcw51nT/1qp+/4alQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757674679; c=relaxed/simple;
	bh=ZxNqMJsmk6/wcW3b5rg08Gmg73xzyfYqmgUVvwakoTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MOL14/yutNKA1CvPiRBucBk6Qf9S8tq9pICekvXxD38T4fFKBm4zfbL2QFjvwHBu9NlvxGYEX7Dp7dVq8HnzpAXKHv1SjO27UKxNf/Q12mUs4imPlSLrl/VjjqhkxC3eRhplwLLVblVDsfuvCvBYOCz0L3BDVQCo3+PQS24dRvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXp6QrK+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXp6QrK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757674678; x=1789210678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZxNqMJsmk6/wcW3b5rg08Gmg73xzyfYqmgUVvwakoTw=;
  b=XXp6QrK+jRhhyielinM+YT3xEQ+80P0GxisG9drQWkT8T03f1kyNhHpR
   aIM6n3lrG/Bdq8EX/Fi1DliEp8NNIFvtvTt0eQxvQb7evtf60Lkp3gtfT
   pegtFI+JxQHHsaLQgr8AzyNu2ojC5fdNzerYfbmuUY+nMa71KgJCLN9N6
   cUP7hb8+ynlitGMHJ4uhfdSNsZ1txAoJLFqVLMK5eSHc1ryFovds7ZrRK
   pm7BTM7Mxk47vTGFXj2JqkGDV0Ncy3reRobLql0awlYUKpyiQ2Lye0ov0
   TMnQIJlX9NQ2vMuoBHYANVScyC1sWL8pBAV9qIEdh/mqhBVZk5R7/d6H2
   w==;
X-CSE-ConnectionGUID: S2QCRJdXQU2o4uy8HjvkWg==
X-CSE-MsgGUID: FO4ThXpxS+iaMCznstXMww==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="71119575"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="71119575"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 03:57:57 -0700
X-CSE-ConnectionGUID: NIJG8MIYRSeYJkkJ4CW8FA==
X-CSE-MsgGUID: 33Wx/Z2pSYy0w7jeBxbeTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="174719308"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 12 Sep 2025 03:57:55 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux1TV-0000yG-0l;
	Fri, 12 Sep 2025 10:57:53 +0000
Date: Fri, 12 Sep 2025 18:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.17-rc4 68/88]
 drivers/resctrl/mpam_resctrl.c:416:14: warning: result of comparison of
 constant 65536 with expression of type 'u16' (aka 'unsigned short') is
 always false
Message-ID: <202509121830.gMaSfEnY-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.17-rc4
head:   1e5b9e907a3fa515c3745ed2969a1f285dcc03d2
commit: ee1ef14f8f760bcf104788390161f092691a366a [68/88] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250912/202509121830.gMaSfEnY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509121830.gMaSfEnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509121830.gMaSfEnY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/resctrl/mpam_resctrl.c:416:14: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     416 |         if (cfg.mon == USE_RMID_IDX) {
         |             ~~~~~~~ ^  ~~~~~~~~~~~~
   drivers/resctrl/mpam_resctrl.c:419:15: warning: result of comparison of constant -1 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     419 |                 if (cfg.mon == -1)
         |                     ~~~~~~~ ^  ~~
   drivers/resctrl/mpam_resctrl.c:467:14: warning: result of comparison of constant -1 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     467 |         if (cfg.mon == -1)
         |             ~~~~~~~ ^  ~~
   3 warnings generated.


vim +416 drivers/resctrl/mpam_resctrl.c

08ea0634012302 James Morse 2023-03-09  380  
6a2be13d0ae78b James Morse 2021-06-25  381  int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
6a2be13d0ae78b James Morse 2021-06-25  382  			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
6a2be13d0ae78b James Morse 2021-06-25  383  			   u64 *val, void *arch_mon_ctx)
6a2be13d0ae78b James Morse 2021-06-25  384  {
6a2be13d0ae78b James Morse 2021-06-25  385  	int err;
6a2be13d0ae78b James Morse 2021-06-25  386  	u64 cdp_val;
6a2be13d0ae78b James Morse 2021-06-25  387  	struct mon_cfg cfg;
6a2be13d0ae78b James Morse 2021-06-25  388  	enum mpam_device_features type;
6a2be13d0ae78b James Morse 2021-06-25  389  	struct mpam_resctrl_dom *l3_dom;
6a2be13d0ae78b James Morse 2021-06-25  390  	struct mpam_component *mon_comp;
6a2be13d0ae78b James Morse 2021-06-25  391  	u32 mon_idx = *(u32 *)arch_mon_ctx;
6a2be13d0ae78b James Morse 2021-06-25  392  	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
6a2be13d0ae78b James Morse 2021-06-25  393  
6a2be13d0ae78b James Morse 2021-06-25  394  	resctrl_arch_rmid_read_context_check();
6a2be13d0ae78b James Morse 2021-06-25  395  
6a2be13d0ae78b James Morse 2021-06-25  396  	if (!mon->class)
6a2be13d0ae78b James Morse 2021-06-25  397  		return -EINVAL;
6a2be13d0ae78b James Morse 2021-06-25  398  
6a2be13d0ae78b James Morse 2021-06-25  399  	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
6a2be13d0ae78b James Morse 2021-06-25  400  	mon_comp = l3_dom->mon_comp[eventid];
6a2be13d0ae78b James Morse 2021-06-25  401  
6a2be13d0ae78b James Morse 2021-06-25  402  	switch (eventid) {
6a2be13d0ae78b James Morse 2021-06-25  403  	case QOS_L3_OCCUP_EVENT_ID:
6a2be13d0ae78b James Morse 2021-06-25  404  		type = mpam_feat_msmon_csu;
6a2be13d0ae78b James Morse 2021-06-25  405  		break;
6a2be13d0ae78b James Morse 2021-06-25  406  	case QOS_L3_MBM_LOCAL_EVENT_ID:
6a2be13d0ae78b James Morse 2021-06-25  407  	case QOS_L3_MBM_TOTAL_EVENT_ID:
6a2be13d0ae78b James Morse 2021-06-25  408  		type = mpam_feat_msmon_mbwu;
6a2be13d0ae78b James Morse 2021-06-25  409  		break;
6a2be13d0ae78b James Morse 2021-06-25  410  	default:
6a2be13d0ae78b James Morse 2021-06-25  411  	case QOS_NUM_EVENTS:
6a2be13d0ae78b James Morse 2021-06-25  412  		return -EINVAL;
6a2be13d0ae78b James Morse 2021-06-25  413  	}
6a2be13d0ae78b James Morse 2021-06-25  414  
6a2be13d0ae78b James Morse 2021-06-25  415  	cfg.mon = mon_idx;
6a2be13d0ae78b James Morse 2021-06-25 @416  	if (cfg.mon == USE_RMID_IDX) {
6a2be13d0ae78b James Morse 2021-06-25  417  		cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
6a2be13d0ae78b James Morse 2021-06-25  418  		cfg.mon = mon->mbwu_idx_to_mon[cfg.mon];
6a2be13d0ae78b James Morse 2021-06-25  419  		if (cfg.mon == -1)
6a2be13d0ae78b James Morse 2021-06-25  420  			return -EINVAL;
6a2be13d0ae78b James Morse 2021-06-25  421  	}
6a2be13d0ae78b James Morse 2021-06-25  422  
6a2be13d0ae78b James Morse 2021-06-25  423  	cfg.match_pmg = true;
6a2be13d0ae78b James Morse 2021-06-25  424  	cfg.pmg = rmid;
08ea0634012302 James Morse 2023-03-09  425  	cfg.opts = resctrl_evt_config_to_mpam(l3_dom->mbm_local_evt_cfg);
6a2be13d0ae78b James Morse 2021-06-25  426  
6a2be13d0ae78b James Morse 2021-06-25  427  	if (irqs_disabled()) {
6a2be13d0ae78b James Morse 2021-06-25  428  		/* Check if we can access this domain without an IPI */
6a2be13d0ae78b James Morse 2021-06-25  429  		err = -EIO;
6a2be13d0ae78b James Morse 2021-06-25  430  	} else {
6a2be13d0ae78b James Morse 2021-06-25  431  		if (cdp_enabled) {
6a2be13d0ae78b James Morse 2021-06-25  432  			cfg.partid = closid << 1;
6a2be13d0ae78b James Morse 2021-06-25  433  			err = mpam_msmon_read(mon_comp, &cfg, type, val);
6a2be13d0ae78b James Morse 2021-06-25  434  			if (err)
6a2be13d0ae78b James Morse 2021-06-25  435  				return err;
6a2be13d0ae78b James Morse 2021-06-25  436  
6a2be13d0ae78b James Morse 2021-06-25  437  			cfg.partid += 1;
6a2be13d0ae78b James Morse 2021-06-25  438  			err = mpam_msmon_read(mon_comp, &cfg, type, &cdp_val);
6a2be13d0ae78b James Morse 2021-06-25  439  			if (!err)
6a2be13d0ae78b James Morse 2021-06-25  440  				*val += cdp_val;
6a2be13d0ae78b James Morse 2021-06-25  441  		} else {
6a2be13d0ae78b James Morse 2021-06-25  442  			cfg.partid = closid;
6a2be13d0ae78b James Morse 2021-06-25  443  			err = mpam_msmon_read(mon_comp, &cfg, type, val);
6a2be13d0ae78b James Morse 2021-06-25  444  		}
6a2be13d0ae78b James Morse 2021-06-25  445  	}
6a2be13d0ae78b James Morse 2021-06-25  446  
6a2be13d0ae78b James Morse 2021-06-25  447  	return err;
6a2be13d0ae78b James Morse 2021-06-25  448  }
6a2be13d0ae78b James Morse 2021-06-25  449  

:::::: The code at line 416 was first introduced by commit
:::::: 6a2be13d0ae78b4cc1506f94ea595b043bfab548 arm_mpam: resctrl: Add resctrl_arch_rmid_read() and resctrl_arch_reset_rmid()

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: James Morse <james.morse@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
