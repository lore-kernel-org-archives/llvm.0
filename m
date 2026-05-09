Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B4D39BFEC;
	Sat,  9 May 2026 21:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778363919; cv=none; b=rUF0YRLXEDaD13P3lmZ0G4eDxio2R/8XPCbLPw/DaT7n3CP0UHqlZ127AE0jF20MT1ZFbgqJBoe2j+y9HN4mxvBZUpYITECJ4Ukagb69RcUNolQz2t8w1CAkBN9GmVBNjCFgod9+w5qesqmC33wa8Cnd7qDGS2A46zchyUk8fBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778363919; c=relaxed/simple;
	bh=5yHJVUU4FYylfXmTh8WXQbM7pnf8hQSqViyOuNpOWzs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jpe08xNzel0QOQGuUYP5DhD9dggOJusK6oUTox3dRVSuIhYhNcykpaFBDCl+RPchTdpz34EGUzH7+3z3q0G/CZSDFWfr+zl1JN/rJw6d4bVsJT/BpD2nWrW5N5Jf0egamrCBL0OoGTHzhAf0qwGq3f1g/Fuq6IQ7QFnU2iVgc9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFGeo60W; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFGeo60W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778363914; x=1809899914;
  h=date:from:to:cc:subject:message-id;
  bh=5yHJVUU4FYylfXmTh8WXQbM7pnf8hQSqViyOuNpOWzs=;
  b=LFGeo60W7ua7rA722PHsWrbZ3yGOm0AmBDwqyCBAg+/MUFEiO1YxZidA
   PK6Z/hd/FHSSIMSas/bKw+e3bOtFndjtmD/O4WmCAzAAF5i7H6dnbhYoo
   mzFBi5nGc0DXDdXW2d4QCcI4OmITOibVpzlacpJKaAGYYEib68b3SAJh+
   oTAOi20PCwQfeY5NF/gdTy94SNhuqIRcW2fugo1gDoX7Vny8LInLpr4DY
   nrGTtolXlHrzK32ZwvliS6+BY3pIEgKz+wQP0kn5ppXVKSWxRoFgG+Wws
   M9CB5ioay0IzPo+q+a9S6fXtRhhP6+yiHkdjzmBAS3c9nCErcJIkKbAYT
   A==;
X-CSE-ConnectionGUID: YDupnGS0Tw2ZNzK4LrO1fg==
X-CSE-MsgGUID: cioaaeneSXO2afMD3rqNiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90684293"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="90684293"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 14:58:33 -0700
X-CSE-ConnectionGUID: qNb8L45dS4q3Z5I8YRwLEA==
X-CSE-MsgGUID: 18ew4GvuTQ25Uh79tbSByg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 09 May 2026 14:58:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLpgr-000000007YJ-3j3Z;
	Sat, 09 May 2026 21:58:29 +0000
Date: Sat, 09 May 2026 23:57:53 +0200
From: kernel test robot <lkp@intel.com>
To: Vernon Yang <yanglincheng@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/bpf/helpers.c:2893:71: error: variable has incomplete
 type 'enum psi_states'
Message-ID: <202605092340.hZ7VIqHR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/psi-add-psi_group_flush_stats-function/20260509-210713
head:   4a4580a71f5884e16d331476b601322cc2d41af7
commit: edf653aa3964af51ae2f2b180bcb0f6cfa26c8f7 bpf: add bpf_cgroup_{flush_stats,stall} function
date:   9 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260509/202605092340.hZ7VIqHR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605092340.hZ7VIqHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605092340.hZ7VIqHR-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/helpers.c:2893:60: warning: declaration of 'enum psi_states' will not be visible outside of this function [-Wvisibility]
    2893 | __bpf_kfunc u64 bpf_cgroup_stall(struct cgroup *cgrp, enum psi_states states)
         |                                                            ^
>> kernel/bpf/helpers.c:2893:71: error: variable has incomplete type 'enum psi_states'
    2893 | __bpf_kfunc u64 bpf_cgroup_stall(struct cgroup *cgrp, enum psi_states states)
         |                                                                       ^
   kernel/bpf/helpers.c:2893:60: note: forward declaration of 'enum psi_states'
    2893 | __bpf_kfunc u64 bpf_cgroup_stall(struct cgroup *cgrp, enum psi_states states)
         |                                                            ^
>> kernel/bpf/helpers.c:2897:40: error: use of undeclared identifier 'NR_PSI_STATES'; did you mean 'NR_NODE_STATES'?
    2897 |         if (unlikely(!group || (u32)states >= NR_PSI_STATES - 1))
         |                                               ^~~~~~~~~~~~~
         |                                               NR_NODE_STATES
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/nodemask.h:396:2: note: 'NR_NODE_STATES' declared here
     396 |         NR_NODE_STATES
         |         ^
>> kernel/bpf/helpers.c:2900:24: error: no member named 'total' in 'struct psi_group'
    2900 |         return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
         |                        ~~~~~  ^
>> kernel/bpf/helpers.c:2900:30: error: use of undeclared identifier 'PSI_AVGS'
    2900 |         return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
         |                                     ^
>> kernel/bpf/helpers.c:2914:2: error: call to undeclared function 'psi_group_flush_stats'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2914 |         psi_group_flush_stats(group);
         |         ^
   1 warning and 5 errors generated.


vim +2893 kernel/bpf/helpers.c

  2885	
  2886	/**
  2887	 * bpf_cgroup_stall - acquire the total stall time of cgroup
  2888	 * @cgrp: cgroup struct
  2889	 * @states: psi states
  2890	 *
  2891	 * Return the total stall time.
  2892	 */
> 2893	__bpf_kfunc u64 bpf_cgroup_stall(struct cgroup *cgrp, enum psi_states states)
  2894	{
  2895		struct psi_group *group = cgroup_psi(cgrp);
  2896	
> 2897		if (unlikely(!group || (u32)states >= NR_PSI_STATES - 1))
  2898			return (u64)-1;
  2899	
> 2900		return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
  2901	}
  2902	
  2903	/**
  2904	 * bpf_cgroup_flush_stats - Flush cgroup's statistics
  2905	 * @cgrp: cgroup struct
  2906	 */
  2907	__bpf_kfunc void bpf_cgroup_flush_stats(struct cgroup *cgrp)
  2908	{
  2909		struct psi_group *group = cgroup_psi(cgrp);
  2910	
  2911		if (unlikely(!group))
  2912			return;
  2913	
> 2914		psi_group_flush_stats(group);
  2915	}
  2916	#endif /* CONFIG_CGROUPS */
  2917	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
