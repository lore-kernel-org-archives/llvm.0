Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC31E1F473E;
	Fri, 27 Dec 2024 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735311107; cv=none; b=eJAsd4NkthTeFRI5VnBEHT2MfcqnDv4bQIhR9ryXkF9WC/8ZoxibOR77apjklpVCJ5yiXcBLPnRt5IAN9crWWaW/xOxDzkCbSTwAhavKF1+N53O58qo+e79kMKowmJQ/q3No67lru/4jNttWh6UF9AZZ//bAV2VaNabjorcnYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735311107; c=relaxed/simple;
	bh=nzAYWgCttZsMJRH+UzII+3uRElAMr+ehNWtq2uLxGHg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHQn7tQSgtpt89T7L8HhIN7nehHRnfBGCTsvbKf7VV1matVIh1MXK0kXz93KbwwvuGE779ljuQTZHnf2WEUYee4W5NPy3ihXn2b788U5k149pMF1lvt/MWpixuPramTZ02/JtzVuAs3mqnY/lgR2V9+RRBCJndiVg1yVzwjyIio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGj30XGb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGj30XGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735311106; x=1766847106;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nzAYWgCttZsMJRH+UzII+3uRElAMr+ehNWtq2uLxGHg=;
  b=BGj30XGbwMDHVXPdgIg8z4M0AhbrCbX4oIUFUl86R89c4y/iv1o9ADpN
   VJo6rCqQrNZWNoCZowYmT1o3sg2l0K4ToR0RUNkod1pPmGd9NHtYfwPQN
   Awp70cvkf3IceAe2Vjww6FNz9G9iZ86A8offICmRlJA+/COyvnh76RBM2
   pDr0uVuIcfUxhYGg3ZitQv/S+4T7FYyjFdWqTErkBVC+LnqFSt8UzlVp1
   jTefofYBkf3ldHW/lLyGVS73SiU2kKSdN4mdzO4ogjz810KB6G666c0V/
   CGXlupfOxcMCOBzUtXmObxD54xkiOAlbnazi+XNa3oDSeITYmQd3R7j+r
   A==;
X-CSE-ConnectionGUID: odBkM/G7SD6SozSkyV38UA==
X-CSE-MsgGUID: LRwv2rzeTGGRBysPtAAm6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35422382"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35422382"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 06:51:43 -0800
X-CSE-ConnectionGUID: Ia1NOhgjSZOqQd9PwOJTag==
X-CSE-MsgGUID: lLa0xhsBR0a5bLyVVP6kyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="105027649"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Dec 2024 06:51:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRBgi-0003FV-0M;
	Fri, 27 Dec 2024 14:51:40 +0000
Date: Fri, 27 Dec 2024 22:51:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/helpers.c:685:39: warning: bitwise operation between
 different enumeration types ('enum bpf_return_type' and 'enum
 bpf_type_flag')
Message-ID: <202412272229.Xwpn6pyY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Hao Luo <haoluo@google.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d6ef8b40d075c425f548002d2f35ae3f06e9cf96
commit: 3c4807322660d4290ac9062c034aed6b87243861 bpf: Replace RET_XXX_OR_NULL with RET_XXX | PTR_MAYBE_NULL
date:   3 years ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241227/202412272229.Xwpn6pyY-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412272229.Xwpn6pyY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412272229.Xwpn6pyY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/helpers.c:4:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:685:39: warning: bitwise operation between different enumeration types ('enum bpf_return_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     685 |         .ret_type       = RET_PTR_TO_MEM_OR_BTF_ID | PTR_MAYBE_NULL,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   6 warnings generated.


vim +685 kernel/bpf/helpers.c

   681	
   682	const struct bpf_func_proto bpf_per_cpu_ptr_proto = {
   683		.func		= bpf_per_cpu_ptr,
   684		.gpl_only	= false,
 > 685		.ret_type	= RET_PTR_TO_MEM_OR_BTF_ID | PTR_MAYBE_NULL,
   686		.arg1_type	= ARG_PTR_TO_PERCPU_BTF_ID,
   687		.arg2_type	= ARG_ANYTHING,
   688	};
   689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
