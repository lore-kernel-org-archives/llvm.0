Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E41F77631;
	Thu, 21 Dec 2023 21:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJzB+a0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703195287; x=1734731287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LViVbF2weuDlaNs7Ggwp/yrp4mTGS9CfFhn1lUtAbig=;
  b=SJzB+a0cS37Sv2Zt+XtRQ+SYF71qvkD9EF8FE95GJbhWGAzEj3N/Rt4v
   +UTiMbpnwDuefW7khMnnDN4LN1FPipEpQSK+gMpOXnmWAm1Ar86BF1r/i
   7z+o2NA+6YNyvOAI9Lyo/rj0Uxt3HCx/JssISMtEbBCIhXxZHqJB8OO9h
   b57zmMuju/mIFONcrj3cmrDNJefvm0kJANu13svmGEg4DriTwNgqL/GOH
   Z5rLg0zhElu42ER24WDa+ZSWNfNo37H6ZkwTmK+8OS0jsZMvrTzil/+99
   vqCL1M8DxT+EX9qNW7qUiNkEGK2a7dh0PKa76pUwpp+osM0wopy3OWCVt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="381027998"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="381027998"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 13:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="811118252"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="811118252"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Dec 2023 13:48:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGQs3-0008lN-2r;
	Thu, 21 Dec 2023 21:46:34 +0000
Date: Fri, 22 Dec 2023 05:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.7-rc2 100/110]
 drivers/platform/mpam/mpam_resctrl.c:335:14: warning: result of comparison
 of constant 65536 with expression of type 'u16' (aka 'unsigned short') is
 always false
Message-ID: <202312220531.xZSwzCe4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.7-rc2
head:   b530deed244d9b45f3bce3cccde91f6ed0ebf7ea
commit: f77ded5f6670639c76c0941dc6943d9e1b261b95 [100/110] arm_mpam: resctrl: Add resctrl_arch_rmid_read() and resctrl_arch_reset_rmid()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231222/202312220531.xZSwzCe4-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7022a24771c8404f847abb226735a3ae21794426)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312220531.xZSwzCe4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220531.xZSwzCe4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/mpam/mpam_resctrl.c:335:14: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     335 |         if (cfg.mon == USE_RMID_IDX)
         |             ~~~~~~~ ^  ~~~~~~~~~~~~
   1 warning generated.


vim +335 drivers/platform/mpam/mpam_resctrl.c

   306	
   307	int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_domain *d,
   308				   u32 closid, u32 rmid, enum resctrl_event_id eventid,
   309				   u64 *val, void *arch_mon_ctx)
   310	{
   311		int err;
   312		u64 cdp_val;
   313		struct mon_cfg cfg;
   314		struct mpam_resctrl_dom *dom;
   315		u32 mon = *(u32 *)arch_mon_ctx;
   316		enum mpam_device_features type;
   317	
   318		resctrl_arch_rmid_read_context_check();
   319	
   320		dom = container_of(d, struct mpam_resctrl_dom, resctrl_dom);
   321	
   322		switch (eventid) {
   323		case QOS_L3_OCCUP_EVENT_ID:
   324			type = mpam_feat_msmon_csu;
   325			break;
   326		case QOS_L3_MBM_LOCAL_EVENT_ID:
   327		case QOS_L3_MBM_TOTAL_EVENT_ID:
   328			type = mpam_feat_msmon_mbwu;
   329			break;
   330		default:
   331			return -EINVAL;
   332		}
   333	
   334		cfg.mon = mon;
 > 335		if (cfg.mon == USE_RMID_IDX)
   336			cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
   337	
   338		cfg.match_pmg = true;
   339		cfg.pmg = rmid;
   340	
   341		if (cdp_enabled) {
   342			cfg.partid = closid << 1;
   343			err = mpam_msmon_read(dom->comp, &cfg, type, val);
   344			if (err)
   345				return err;
   346	
   347			cfg.partid += 1;
   348			err = mpam_msmon_read(dom->comp, &cfg, type, &cdp_val);
   349			if (!err)
   350				*val += cdp_val;
   351		} else {
   352			cfg.partid = closid;
   353			err = mpam_msmon_read(dom->comp, &cfg, type, val);
   354		}
   355	
   356		return err;
   357	}
   358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
