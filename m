Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5071D5CD4;
	Sat, 23 Aug 2025 23:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755992325; cv=none; b=dpLM5ZzJK9s1/pWmWW2ImVv9KFLYhJhljDjXm+FDZpjYK16Obfpf+KzDmCWiBZ2arm3rWJQX8yztOSSe2hZB3GI4ZItouSbOKUGQFlv9rklYP4yN5jMGxI9oCGQlfP7FUFZLQsPYjWjW0QAfZUrWIrY3eI+1OhZm+C5Ax+xqFOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755992325; c=relaxed/simple;
	bh=i8P3xtpQlErUkSY9JwtuydOwI2lOMtHbx58R10LnaZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EzSSFSWT2cszZPbUsu5h7S2FCiU/nqYpDNREQm6luQ3TkxYdUsFudjTokzlD8767qd2v2CIb9kQc51lNgnbbM9ufaoQmtUi6jhGKF8oUo3ZyuGGwDDCr3DzHPYyDUWyeLqwZvdX9i/hMxNSKQvd7ll9K9K0EOPIb2jcquwG8K3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKZmiCMs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKZmiCMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755992323; x=1787528323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8P3xtpQlErUkSY9JwtuydOwI2lOMtHbx58R10LnaZs=;
  b=UKZmiCMsstHvtT0d/Em0A2UJ4mPwK/k5UgVZUCImOn1hnQJc9/+8u1Mo
   R8Kho+SKXOXJ3B0/GAl2hQJkY+vpqKoIr1UjfvmyNF/cSasA0qURvzOe5
   KOfQ4h4tNji10WrhtmlVNQiqR0FdK0ZuIxf2mhQrpE99/DZquE1w5afvb
   WJ1oDnt+eCIM/HAukFSJ6SXc74nF1IOuuDT91X2Q7uhgYThlbNgDwx2nL
   DIE8ZhTXPAqktqqcl3mCTXky5MbSRGbXnjMEd/kKafxhhW6DGtwMgjPU7
   0QFdhveURolN+MI4boou5JyDelhP3lIY+LIU/OAR5uNrXhNPS64IaHoJD
   g==;
X-CSE-ConnectionGUID: eEKgeKV0TNmXSCjStFaYhQ==
X-CSE-MsgGUID: ZvxHPeNaSD6wu27BNpTqSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="57454210"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57454210"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 16:38:42 -0700
X-CSE-ConnectionGUID: qtQC9l18STe0NUzjMUqITQ==
X-CSE-MsgGUID: gnfULNySTwuJJwc0uH0slg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="192654241"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Aug 2025 16:38:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upxoX-000Mev-1R;
	Sat, 23 Aug 2025 23:38:30 +0000
Date: Sun, 24 Aug 2025 07:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.17-rc2 71/89]
 drivers/resctrl/mpam_resctrl.c:388:27: warning: variable 'l3' set but not
 used
Message-ID: <202508240741.ggiwOVTb-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.17-rc2
head:   c0646bf01fb5098c7d6cbc44af567a8bb2ca82d6
commit: cc5c3a178290a55e8ebb9ea8c8df08bbd54951c3 [71/89] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250824/202508240741.ggiwOVTb-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240741.ggiwOVTb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240741.ggiwOVTb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/resctrl/mpam_resctrl.c:388:27: warning: variable 'l3' set but not used [-Wunused-but-set-variable]
     388 |         struct mpam_resctrl_res *l3;
         |                                  ^
   drivers/resctrl/mpam_resctrl.c:457:27: warning: variable 'l3' set but not used [-Wunused-but-set-variable]
     457 |         struct mpam_resctrl_res *l3;
         |                                  ^
   2 warnings generated.


vim +/l3 +388 drivers/resctrl/mpam_resctrl.c

693be57547c83b James Morse 2023-03-09  380  
02ced84e49c79a James Morse 2021-06-25  381  int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
02ced84e49c79a James Morse 2021-06-25  382  			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
02ced84e49c79a James Morse 2021-06-25  383  			   u64 *val, void *arch_mon_ctx)
02ced84e49c79a James Morse 2021-06-25  384  {
02ced84e49c79a James Morse 2021-06-25  385  	int err;
02ced84e49c79a James Morse 2021-06-25  386  	u64 cdp_val;
02ced84e49c79a James Morse 2021-06-25  387  	struct mon_cfg cfg;
02ced84e49c79a James Morse 2021-06-25 @388  	struct mpam_resctrl_res *l3;
02ced84e49c79a James Morse 2021-06-25  389  	enum mpam_device_features type;
02ced84e49c79a James Morse 2021-06-25  390  	struct mpam_resctrl_dom *l3_dom;
02ced84e49c79a James Morse 2021-06-25  391  	struct mpam_component *mon_comp;
02ced84e49c79a James Morse 2021-06-25  392  	u32 mon_idx = *(u32 *)arch_mon_ctx;
02ced84e49c79a James Morse 2021-06-25  393  	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
02ced84e49c79a James Morse 2021-06-25  394  
02ced84e49c79a James Morse 2021-06-25  395  	resctrl_arch_rmid_read_context_check();
02ced84e49c79a James Morse 2021-06-25  396  
02ced84e49c79a James Morse 2021-06-25  397  	if (!mon->class)
02ced84e49c79a James Morse 2021-06-25  398  		return -EINVAL;
02ced84e49c79a James Morse 2021-06-25  399  
02ced84e49c79a James Morse 2021-06-25  400  	l3 = container_of(r, struct mpam_resctrl_res, resctrl_res);
02ced84e49c79a James Morse 2021-06-25  401  	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
02ced84e49c79a James Morse 2021-06-25  402  	mon_comp = l3_dom->mon_comp[eventid];
02ced84e49c79a James Morse 2021-06-25  403  
02ced84e49c79a James Morse 2021-06-25  404  	switch (eventid) {
02ced84e49c79a James Morse 2021-06-25  405  	case QOS_L3_OCCUP_EVENT_ID:
02ced84e49c79a James Morse 2021-06-25  406  		type = mpam_feat_msmon_csu;
02ced84e49c79a James Morse 2021-06-25  407  		break;
02ced84e49c79a James Morse 2021-06-25  408  	case QOS_L3_MBM_LOCAL_EVENT_ID:
02ced84e49c79a James Morse 2021-06-25  409  	case QOS_L3_MBM_TOTAL_EVENT_ID:
02ced84e49c79a James Morse 2021-06-25  410  		type = mpam_feat_msmon_mbwu;
02ced84e49c79a James Morse 2021-06-25  411  		break;
02ced84e49c79a James Morse 2021-06-25  412  	default:
02ced84e49c79a James Morse 2021-06-25  413  	case QOS_NUM_EVENTS:
02ced84e49c79a James Morse 2021-06-25  414  		return -EINVAL;
02ced84e49c79a James Morse 2021-06-25  415  	}
02ced84e49c79a James Morse 2021-06-25  416  
02ced84e49c79a James Morse 2021-06-25  417  	cfg.mon = mon_idx;
02ced84e49c79a James Morse 2021-06-25  418  	if (cfg.mon == USE_RMID_IDX) {
02ced84e49c79a James Morse 2021-06-25  419  		cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
02ced84e49c79a James Morse 2021-06-25  420  		cfg.mon = mon->mbwu_idx_to_mon[cfg.mon];
02ced84e49c79a James Morse 2021-06-25  421  		if (cfg.mon == -1)
02ced84e49c79a James Morse 2021-06-25  422  			return -EINVAL;
02ced84e49c79a James Morse 2021-06-25  423  	}
02ced84e49c79a James Morse 2021-06-25  424  
02ced84e49c79a James Morse 2021-06-25  425  	cfg.match_pmg = true;
02ced84e49c79a James Morse 2021-06-25  426  	cfg.pmg = rmid;
693be57547c83b James Morse 2023-03-09  427  	cfg.opts = resctrl_evt_config_to_mpam(l3_dom->mbm_local_evt_cfg);
02ced84e49c79a James Morse 2021-06-25  428  
02ced84e49c79a James Morse 2021-06-25  429  	if (irqs_disabled()) {
02ced84e49c79a James Morse 2021-06-25  430  		/* Check if we can access this domain without an IPI */
02ced84e49c79a James Morse 2021-06-25  431  		err = -EIO;
02ced84e49c79a James Morse 2021-06-25  432  	} else {
02ced84e49c79a James Morse 2021-06-25  433  		if (cdp_enabled) {
02ced84e49c79a James Morse 2021-06-25  434  			cfg.partid = closid << 1;
02ced84e49c79a James Morse 2021-06-25  435  			err = mpam_msmon_read(mon_comp, &cfg, type, val);
02ced84e49c79a James Morse 2021-06-25  436  			if (err)
02ced84e49c79a James Morse 2021-06-25  437  				return err;
02ced84e49c79a James Morse 2021-06-25  438  
02ced84e49c79a James Morse 2021-06-25  439  			cfg.partid += 1;
02ced84e49c79a James Morse 2021-06-25  440  			err = mpam_msmon_read(mon_comp, &cfg, type, &cdp_val);
02ced84e49c79a James Morse 2021-06-25  441  			if (!err)
02ced84e49c79a James Morse 2021-06-25  442  				*val += cdp_val;
02ced84e49c79a James Morse 2021-06-25  443  		} else {
02ced84e49c79a James Morse 2021-06-25  444  			cfg.partid = closid;
02ced84e49c79a James Morse 2021-06-25  445  			err = mpam_msmon_read(mon_comp, &cfg, type, val);
02ced84e49c79a James Morse 2021-06-25  446  		}
02ced84e49c79a James Morse 2021-06-25  447  	}
02ced84e49c79a James Morse 2021-06-25  448  
02ced84e49c79a James Morse 2021-06-25  449  	return err;
02ced84e49c79a James Morse 2021-06-25  450  }
02ced84e49c79a James Morse 2021-06-25  451  

:::::: The code at line 388 was first introduced by commit
:::::: 02ced84e49c79a20e94e574cd230d9e744d6dc1c arm_mpam: resctrl: Add resctrl_arch_rmid_read() and resctrl_arch_reset_rmid()

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: James Morse <james.morse@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
