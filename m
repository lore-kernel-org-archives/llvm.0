Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460AE2367D3;
	Sat,  9 May 2026 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778358995; cv=none; b=aLr5eJDv0xFMnr+bLKZhuOyit0ccWZBpvw/Df0DsfLF4PjmW6UrXmk24qqpvYwQbie9dLMwZvoFCdu/lzF060rJgI6i10UmcpLNOlqoKfeuZqUoVvONG0h0UlllD1KCSIqphv2zk1UWxeyJZJDyRCndT6Mj5diwoK5K1VK9tXUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778358995; c=relaxed/simple;
	bh=k0keR1Ubk2J+JXLTfOaMUHdGdczEwUUbL+F2gApUoJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rnIlHFPBIcz7bfeAs4gpj+KP8VWZ+1lMf5Tkfu7qRssX/i+Ysddt/j+3Im3yNkcufZSPki6q8/uIJ6se5xPU4biSI/pwKJeVQifeKf6JkF0o2kp7xkidsoN13otNg0w4Wn42qODBnA7RWejxTmYnOD3YepQkdwmXdXA9AV9tn0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+622OuV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+622OuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778358993; x=1809894993;
  h=date:from:to:cc:subject:message-id;
  bh=k0keR1Ubk2J+JXLTfOaMUHdGdczEwUUbL+F2gApUoJk=;
  b=f+622OuVed0lOIHKa1gFwwkISNsp7DmbXJPtLpFznfxT9/nZkdIsoiPp
   4uBwmKgwNrRp1ZE9Fw/73Qrbgc7MaJb4U2qNwKvsgjfVIHr2h9IViIY6/
   2FhmFrNkiCMMkABYvNuMYHq/HHZ4teEgPuSN+7kDXhmNharyia6bfYRpT
   iLLn9lQp5lz+wG0/AgdQjx0nF+6A5LL/751ONshNMzStqVjYXQ1vmAz7E
   1h9cOOkd1VMhSfxthZ0vxMBHcDTVfHF7sh3fWIeVZ7DN3l3xiRu2ckwoR
   yDX/c+8WuTKl+BVFp7gMw9i6SHkkORfmywHxUx3PrR3MjrYos2GcqOwar
   g==;
X-CSE-ConnectionGUID: 06zLJpdOS/mYkIJSM2keEw==
X-CSE-MsgGUID: QPRKSYwGT/exWEtp72Wp6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79486989"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79486989"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 13:36:33 -0700
X-CSE-ConnectionGUID: quNu2yc8RsmQ6c6HIT+Mpg==
X-CSE-MsgGUID: yAMWgKB1RS+zyM1BWc/WTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="267443161"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 May 2026 13:36:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLoPV-000000007Xr-233T;
	Sat, 09 May 2026 20:36:29 +0000
Date: Sat, 09 May 2026 22:36:13 +0200
From: kernel test robot <lkp@intel.com>
To: Vernon Yang <yanglincheng@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/bpf/helpers.c:2893:60: warning: declaration of 'enum
 psi_states' will not be visible outside of this function
Message-ID: <202605092231.VD6i30e4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/psi-add-psi_group_flush_stats-function/20260509-210713
head:   4a4580a71f5884e16d331476b601322cc2d41af7
commit: edf653aa3964af51ae2f2b180bcb0f6cfa26c8f7 bpf: add bpf_cgroup_{flush_stats,stall} function
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260509/202605092231.VD6i30e4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605092231.VD6i30e4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605092231.VD6i30e4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:2893:60: warning: declaration of 'enum psi_states' will not be visible outside of this function [-Wvisibility]
    2893 | __bpf_kfunc u64 bpf_cgroup_stall(struct cgroup *cgrp, enum psi_states states)
         |                                                            ^
   kernel/bpf/helpers.c:2893:71: error: variable has incomplete type 'enum psi_states'
    2893 | __bpf_kfunc u64 bpf_cgroup_stall(struct cgroup *cgrp, enum psi_states states)
         |                                                                       ^
   kernel/bpf/helpers.c:2893:60: note: forward declaration of 'enum psi_states'
    2893 | __bpf_kfunc u64 bpf_cgroup_stall(struct cgroup *cgrp, enum psi_states states)
         |                                                            ^
   kernel/bpf/helpers.c:2897:40: error: use of undeclared identifier 'NR_PSI_STATES'; did you mean 'NR_NODE_STATES'?
    2897 |         if (unlikely(!group || (u32)states >= NR_PSI_STATES - 1))
         |                                               ^~~~~~~~~~~~~
         |                                               NR_NODE_STATES
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/nodemask.h:396:2: note: 'NR_NODE_STATES' declared here
     396 |         NR_NODE_STATES
         |         ^
   kernel/bpf/helpers.c:2900:24: error: no member named 'total' in 'struct psi_group'
    2900 |         return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
         |                        ~~~~~  ^
   kernel/bpf/helpers.c:2900:30: error: use of undeclared identifier 'PSI_AVGS'
    2900 |         return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
         |                                     ^
   kernel/bpf/helpers.c:2914:2: error: call to undeclared function 'psi_group_flush_stats'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
  2897		if (unlikely(!group || (u32)states >= NR_PSI_STATES - 1))
  2898			return (u64)-1;
  2899	
  2900		return div_u64(group->total[PSI_AVGS][states], NSEC_PER_MSEC);
  2901	}
  2902	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
