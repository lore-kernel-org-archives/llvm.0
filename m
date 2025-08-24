Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EAE2D5424;
	Sun, 24 Aug 2025 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035638; cv=none; b=k1VqriB15RscD2Lk+Vk+ingSqURZDaGnNxmBkyBvFezAZHog6UX3yFM698dhl3Hh4tTO7QWaiFUK/adlZnQmtJDW6OgZ6dLPMQhKINgfCsNSWWjN/kAW0VztVH7VBCU+2yi9sBy4IOZs4dEtQzGUb8skN/y1Le11wrkpgYxJtPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035638; c=relaxed/simple;
	bh=wO7su0VX4hcDAmX+nNwN/oPjijuqP/Bm6uPzHnMj1Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IreTy8nW8XgaXcM+mzq7YkEyWLN6pcw2Yl9Ye6mXJhjHp4CEBq+6j3q7naQ6bhhuaViKMsRq3Ju/sw5SFOktTJ0MKbNMDE28e8YoUw2Vprmwt9A0NdcKfnPs3zGC2EyFOFF3tL/NuSrNVouxkmc9dOAnpbtR+496gwlICgettag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xgp4BEaK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xgp4BEaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756035638; x=1787571638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wO7su0VX4hcDAmX+nNwN/oPjijuqP/Bm6uPzHnMj1Cg=;
  b=Xgp4BEaKb71rrS2YPr3LD+HeQKZ1Xv9PXBcsXJ2HFkY1OazeiqHBti3s
   jlyVBHw70TxD/noqCqw9vU16FneRfv1LC+SijPbXliSuShnGulAzd2Ua2
   hduHWGx07Gdu8zUZ31ivwCeUdM9+5BK5IpOoBfFArJ5+BVEGHHgJvFOKe
   CoI+B+99k2x6I3SkBtGCZ4/DkO6Qhw2wGkvxTZ1ufg+DEkLIhBEE1KpfU
   Zfr/mYzQ95/oofUImmDmGWwsJteT1lSWVeLuvBqgVhhywqg1ffscfjvO3
   nFH6ilYligy+w3QDmDH8z44Gw3YxjaSlcDIwyeGcsyH+hOdJ18xQfaSj2
   A==;
X-CSE-ConnectionGUID: D/0ORYaZRsu2fe53SBsQgw==
X-CSE-MsgGUID: easPn/vaQlWN2jZVqWGD+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58216164"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58216164"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 04:40:36 -0700
X-CSE-ConnectionGUID: 1lFOjW0ITFuoMkZAoAH74A==
X-CSE-MsgGUID: uA1hgqxvRLq6GR0HMwHwxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169447634"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Aug 2025 04:40:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq95G-000My3-18;
	Sun, 24 Aug 2025 11:40:30 +0000
Date: Sun, 24 Aug 2025 19:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.17-rc2 77/89]
 drivers/resctrl/mpam_resctrl.c:1051:3: warning: variable 'dom' is
 uninitialized when used here
Message-ID: <202508241909.RzqGMepa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.17-rc2
head:   c0646bf01fb5098c7d6cbc44af567a8bb2ca82d6
commit: eab6c1ea362813e5921cd435519d6ee54c4b7aec [77/89] arm_mpam: resctrl: Call resctrl_exit() in the event of errors
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250824/202508241909.RzqGMepa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241909.RzqGMepa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241909.RzqGMepa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/resctrl/mpam_resctrl.c:400:27: warning: variable 'l3' set but not used [-Wunused-but-set-variable]
     400 |         struct mpam_resctrl_res *l3;
         |                                  ^
   drivers/resctrl/mpam_resctrl.c:469:27: warning: variable 'l3' set but not used [-Wunused-but-set-variable]
     469 |         struct mpam_resctrl_res *l3;
         |                                  ^
>> drivers/resctrl/mpam_resctrl.c:1051:3: warning: variable 'dom' is uninitialized when used here [-Wuninitialized]
    1051 |                 dom->mbm_local_evt_cfg = 0;
         |                 ^~~
   drivers/resctrl/mpam_resctrl.c:1045:30: note: initialize the variable 'dom' to silence this warning
    1045 |         struct mpam_resctrl_dom *dom;
         |                                     ^
         |                                      = NULL
   3 warnings generated.


vim +/dom +1051 drivers/resctrl/mpam_resctrl.c

  1042	
  1043	void resctrl_arch_mon_event_config_write(void *info)
  1044	{
  1045		struct mpam_resctrl_dom *dom;
  1046		struct resctrl_mon_config_info *mon_info = info;
  1047	
  1048		WARN_ON_ONCE(mon_info->mon_config & ~MPAM_RESTRL_EVT_CONFIG_VALID);
  1049	
  1050		if (!mpam_is_enabled()) {
> 1051			dom->mbm_local_evt_cfg = 0;
  1052			return;
  1053		}
  1054	
  1055		dom = container_of(mon_info->d, struct mpam_resctrl_dom, resctrl_mon_dom);
  1056		dom->mbm_local_evt_cfg = mon_info->mon_config & MPAM_RESTRL_EVT_CONFIG_VALID;
  1057	}
  1058	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
