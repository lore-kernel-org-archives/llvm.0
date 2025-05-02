Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE6828E7;
	Fri,  2 May 2025 00:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746144798; cv=none; b=f5R2Gdc7ciWR/QECZ//RuQJCiy0B2CDvbfks+ls/h0KTBUGeCPycWwZhwbI88polnXf6rZi75uRL8bS2CGcnLWoPpKa9yPAC8oGbhm8TdrG1y4dOKPM0G5UcUn2x8OC9mHuXNcdEzdnsivkqyokBRXWXJefYMRBSaWIb5+O13Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746144798; c=relaxed/simple;
	bh=oILweB5MWjR4gCqurfHJnLwkzN4AFItWOqmt0+mfcgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CCN6OCMsBn3vAyjsGKIBMCjuIsgKh+6UueAYBCkoJcyiwpAnzkCV7t03PNZ9M74oAP70frQ48QCWH+woc7zD3iLgkz9BR2l9Dc5eaGnJECL427Xs0UF5vi5H1QPXOd4NjqjTNZPdF0xhzLylJzHwbs1LgqnSiuyRxcPGQTvr0KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ms/cpwT7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ms/cpwT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746144796; x=1777680796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oILweB5MWjR4gCqurfHJnLwkzN4AFItWOqmt0+mfcgk=;
  b=ms/cpwT7zDCW+/BtmFHGmzQrFloiLXv27nfMr965t6lXVP56OPtemqQC
   EXoku1gUtEwHy0Pmfoan7ugkO3iS4IHgdMqViY1BMv/Mz/ABGQ5MszWRT
   plIpjo6ORgH9U6MlIulwshkbZZdYfkO3mLr3eTaQEpD5091JpsQBVYcMd
   a+xXYyWSa0LOgRA2PoiC5cv8gvOjQJONuaaOFSDHpDJtOl9U0lGZeAfoa
   PLKRhlsdPlQa2MTYCqUjeYhzgxuTrVtcu0QUhEVzzDeS/LdLFSkayqG7j
   vlYUYogZQX2zLYE3D7O41yGYOKcQw0/ZGHcN/INOkdYuxLVbWWPutRwii
   w==;
X-CSE-ConnectionGUID: RGdKULikRZqRuyFHn5OIUA==
X-CSE-MsgGUID: RDR3I3o3TuqXZGbPlTrLGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58817679"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="58817679"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 17:13:13 -0700
X-CSE-ConnectionGUID: Hi7CC0WETIW+hCkQdKU8Jg==
X-CSE-MsgGUID: G1dF+kboTja9v5SBM+h+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="134829377"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 May 2025 17:13:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAe1e-0004SL-0t;
	Fri, 02 May 2025 00:13:10 +0000
Date: Fri, 2 May 2025 08:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.15-rc3 92/110]
 drivers/platform/arm64/mpam/mpam_resctrl.c:326:10: warning: enumeration
 value 'QOS_NUM_EVENTS' not handled in switch
Message-ID: <202505020820.skhaveyd-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.15-rc3
head:   2cc3eff27207d40f181a59f04660a1e8e9746ff8
commit: a72f3a3a6232e93a4ff7ac9036df24fc15157fee [92/110] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250502/202505020820.skhaveyd-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020820.skhaveyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020820.skhaveyd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/arm64/mpam/mpam_resctrl.c:326:10: warning: enumeration value 'QOS_NUM_EVENTS' not handled in switch [-Wswitch]
     326 |         switch (evtid) {
         |                 ^~~~~
   1 warning generated.


vim +/QOS_NUM_EVENTS +326 drivers/platform/arm64/mpam/mpam_resctrl.c

ab494c1ab56754 James Morse 2021-06-25  312  
ab494c1ab56754 James Morse 2021-06-25  313  void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
ab494c1ab56754 James Morse 2021-06-25  314  			       enum resctrl_event_id evtid, void *arch_mon_ctx)
ab494c1ab56754 James Morse 2021-06-25  315  {
ab494c1ab56754 James Morse 2021-06-25  316  	struct mpam_resctrl_res *res;
ab494c1ab56754 James Morse 2021-06-25  317  	u32 mon = *(u32 *)arch_mon_ctx;
ab494c1ab56754 James Morse 2021-06-25  318  
ab494c1ab56754 James Morse 2021-06-25  319  	if (mon == USE_RMID_IDX)
ab494c1ab56754 James Morse 2021-06-25  320  		return;
ab494c1ab56754 James Morse 2021-06-25  321  	kfree(arch_mon_ctx);
ab494c1ab56754 James Morse 2021-06-25  322  	arch_mon_ctx = NULL;
ab494c1ab56754 James Morse 2021-06-25  323  
ab494c1ab56754 James Morse 2021-06-25  324  	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
ab494c1ab56754 James Morse 2021-06-25  325  
ab494c1ab56754 James Morse 2021-06-25 @326  	switch (evtid) {
ab494c1ab56754 James Morse 2021-06-25  327  	case QOS_L3_OCCUP_EVENT_ID:
ab494c1ab56754 James Morse 2021-06-25  328  		mpam_free_csu_mon(res->class, mon);
ab494c1ab56754 James Morse 2021-06-25  329  		wake_up(&resctrl_mon_ctx_waiters);
ab494c1ab56754 James Morse 2021-06-25  330  		return;
ab494c1ab56754 James Morse 2021-06-25  331  	case QOS_L3_MBM_TOTAL_EVENT_ID:
ab494c1ab56754 James Morse 2021-06-25  332  	case QOS_L3_MBM_LOCAL_EVENT_ID:
ab494c1ab56754 James Morse 2021-06-25  333  		return;
ab494c1ab56754 James Morse 2021-06-25  334  	}
ab494c1ab56754 James Morse 2021-06-25  335  }
ab494c1ab56754 James Morse 2021-06-25  336  

:::::: The code at line 326 was first introduced by commit
:::::: ab494c1ab56754729b57617a5f5f40c64c954521 arm_mpam: resctrl: Allow resctrl to allocate monitors

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: James Morse <james.morse@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
