Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D1413B5AF;
	Fri, 14 Jun 2024 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718399368; cv=none; b=ISf+Ho/EF3zUgm11LYsZwiBipmuGCYYYUYdDS3mTuYbJXhOmq7jxZQCSgmNnv5aL9kPVbsBQ4hLcc2t6r+2A9NG35bwhO92K+KusJlYa1vBlNZkF5oz3kbsxT/nWaTdPOeDTTVFR5tBEZKP5rz7RQknJpXNdPcdbLUDXf7mFBSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718399368; c=relaxed/simple;
	bh=yShiDAVREQzR6HV3bIPVcGfKcVUfBhewjgvWYJaz3uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6K20Tbby0PM1Uym/Irv0hx6EuxMtgviJZMV7vzQjmoMTSeJYGABORhQsQwTabzWjPcg+XaSlGHRIQPz+W/cHowHYA5HyceO09zSXhOAsyPqIQYjbMWyqraHFPiVEQ5afzGipBbYRm/cc3gEstsztR2EI3orOdEFtquz9NpEFT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YP6JnrJQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YP6JnrJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718399366; x=1749935366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yShiDAVREQzR6HV3bIPVcGfKcVUfBhewjgvWYJaz3uM=;
  b=YP6JnrJQPTNtcJnUDnJ8/NGJjw8aaxD8To8ObLx6/v2s76Sb3zDyyhgY
   WLXp5l+/JfMQFesyUOBxIBQ1/W3xiAZPYK4qbYDb7ZTXbJj2xh173Aa4g
   Z8XwIvgT74h0pWysEtLSLMLhfHY+tqvBECRULjZDm/ZDmR0d516WRM8QM
   zX82nPsMmbHyKUa1Zp4dets4qBZOOMOas4KJEEtYJllLrHQAsbmAJUzuq
   sckMK5eyrFoFNmR7YmKzkz51gdtTbcP6rfH0ubzZrUq8tbPXRzXS+KLas
   eLZnbVN1LjopRtXvXigu1tb+Wto7qcHWkqp/19zZBRYGVqUHhlB9zSVXK
   Q==;
X-CSE-ConnectionGUID: 8PQPpuyhTDecm6XmQzjiDA==
X-CSE-MsgGUID: 82/kwXjmTtesVHkvLhp9Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15141714"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="15141714"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 14:09:25 -0700
X-CSE-ConnectionGUID: +T0vAT5GSAi/UMEAay/Nnw==
X-CSE-MsgGUID: GilgFP9CQdu6hwiWpqf3vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="78095556"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Jun 2024 14:09:23 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIEAi-0001nd-2W;
	Fri, 14 Jun 2024 21:09:20 +0000
Date: Sat, 15 Jun 2024 05:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 1/2] KVM: arm64: Allow BT field in ID_AA64PFR1_EL1
 writable
Message-ID: <202406150433.8J5jiWdc-lkp@intel.com>
References: <20240612023553.127813-2-shahuang@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612023553.127813-2-shahuang@redhat.com>

Hi Shaoqin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvmarm/next]
[also build test ERROR on linus/master v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shaoqin-Huang/KVM-arm64-Allow-BT-field-in-ID_AA64PFR1_EL1-writable/20240612-103828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20240612023553.127813-2-shahuang%40redhat.com
patch subject: [RFC PATCH v1 1/2] KVM: arm64: Allow BT field in ID_AA64PFR1_EL1 writable
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240615/202406150433.8J5jiWdc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150433.8J5jiWdc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150433.8J5jiWdc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/sys_regs.c:16:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2208:
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
>> arch/arm64/kvm/sys_regs.c:2309:2: error: pasting formed 'SYS_(', an invalid preprocessing token
    2309 |         ID_WRITABLE(SYS_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_BT),
         |         ^
   arch/arm64/kvm/sys_regs.c:2121:2: note: expanded from macro 'ID_WRITABLE'
    2121 |         ID_DESC(name),                          \
         |         ^
   arch/arm64/kvm/sys_regs.c:2097:15: note: expanded from macro 'ID_DESC'
    2097 |         SYS_DESC(SYS_##name),                   \
         |                      ^
>> arch/arm64/kvm/sys_regs.c:2309:2: error: call to undeclared function 'SYS_'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/arm64/kvm/sys_regs.c:2121:2: note: expanded from macro 'ID_WRITABLE'
    2121 |         ID_DESC(name),                          \
         |         ^
   arch/arm64/kvm/sys_regs.c:2097:11: note: expanded from macro 'ID_DESC'
    2097 |         SYS_DESC(SYS_##name),                   \
         |                  ^
   arch/arm64/kvm/sys_regs.c:2097:11: note: expanded from macro 'SYS_'
   arch/arm64/kvm/sys_regs.c:2481:59: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2481 |         { PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
         |                                                                  ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2481:4: note: previous initialization is here
    2481 |         { PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
         |           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2498:39: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2498 |           .access = access_pmswinc, .reset = NULL },
         |                                              ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2496:4: note: previous initialization is here
    2496 |         { PMU_SYS_REG(PMSWINC_EL0),
         |           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2500:38: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2500 |           .access = access_pmselr, .reset = reset_pmselr, .reg = PMSELR_EL0 },
         |                                             ^~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2499:4: note: previous initialization is here
    2499 |         { PMU_SYS_REG(PMSELR_EL0),
         |           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2502:38: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2502 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2501:4: note: previous initialization is here
    2501 |         { PMU_SYS_REG(PMCEID0_EL0),
         |           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2504:38: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2504 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2503:4: note: previous initialization is here
    2503 |         { PMU_SYS_REG(PMCEID1_EL0),
         |           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2506:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2506 |           .access = access_pmu_evcntr, .reset = reset_unknown,
         |                                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2505:4: note: previous initialization is here
    2505 |         { PMU_SYS_REG(PMCCNTR_EL0),
         |           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2509:43: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2509 |           .access = access_pmu_evtyper, .reset = NULL },
         |                                                  ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2508:4: note: previous initialization is here
    2508 |         { PMU_SYS_REG(PMXEVTYPER_EL0),
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2511:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2511 |           .access = access_pmu_evcntr, .reset = NULL },
         |                                                 ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2510:4: note: previous initialization is here
    2510 |         { PMU_SYS_REG(PMXEVCNTR_EL0),
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2517:13: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2517 |           .reset = reset_val, .reg = PMUSERENR_EL0, .val = 0 },
         |                    ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2516:4: note: previous initialization is here
    2516 |         { PMU_SYS_REG(PMUSERENR_EL0), .access = access_pmuserenr,
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2665:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2665 |         PMU_PMEVTYPER_EL0(25),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1331:13: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1331 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2665:2: note: previous initialization is here
    2665 |         PMU_PMEVTYPER_EL0(25),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1330:4: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1330 |         { PMU_SYS_REG(PMEVTYPERn_EL0(n)),                               \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2666:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2666 |         PMU_PMEVTYPER_EL0(26),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1331:13: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1331 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2666:2: note: previous initialization is here
    2666 |         PMU_PMEVTYPER_EL0(26),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1330:4: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1330 |         { PMU_SYS_REG(PMEVTYPERn_EL0(n)),                               \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2667:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2667 |         PMU_PMEVTYPER_EL0(27),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1331:13: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1331 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2667:2: note: previous initialization is here
    2667 |         PMU_PMEVTYPER_EL0(27),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1330:4: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1330 |         { PMU_SYS_REG(PMEVTYPERn_EL0(n)),                               \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2668:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2668 |         PMU_PMEVTYPER_EL0(28),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1331:13: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1331 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2668:2: note: previous initialization is here
    2668 |         PMU_PMEVTYPER_EL0(28),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1330:4: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1330 |         { PMU_SYS_REG(PMEVTYPERn_EL0(n)),                               \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2669:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2669 |         PMU_PMEVTYPER_EL0(29),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1331:13: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1331 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2669:2: note: previous initialization is here
    2669 |         PMU_PMEVTYPER_EL0(29),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1330:4: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1330 |         { PMU_SYS_REG(PMEVTYPERn_EL0(n)),                               \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2670:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2670 |         PMU_PMEVTYPER_EL0(30),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1331:13: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1331 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2670:2: note: previous initialization is here
    2670 |         PMU_PMEVTYPER_EL0(30),
         |         ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1330:4: note: expanded from macro 'PMU_PMEVTYPER_EL0'
    1330 |         { PMU_SYS_REG(PMEVTYPERn_EL0(n)),                               \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2676:13: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2676 |           .reset = reset_val, .reg = PMCCFILTR_EL0, .val = 0 },
         |                    ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2675:4: note: previous initialization is here
    2675 |         { PMU_SYS_REG(PMCCFILTR_EL0), .access = access_pmu_evtyper,
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1319:33: note: expanded from macro 'PMU_SYS_REG'
    1319 |         SYS_DESC(SYS_##name), .reset = reset_pmu_reg,                   \
         |                                        ^~~~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:2309:2: error: initializer element is not a compile-time constant
    2309 |         ID_WRITABLE(SYS_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_BT),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2121:2: note: expanded from macro 'ID_WRITABLE'
    2121 |         ID_DESC(name),                          \
         |         ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2097:2: note: expanded from macro 'ID_DESC'
    2097 |         SYS_DESC(SYS_##name),                   \
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.h:247:6: note: expanded from macro 'SYS_DESC'
     247 |         Op0(sys_reg_Op0(reg)), Op1(sys_reg_Op1(reg)),   \
         |         ~~~~^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/sysreg.h:46:25: note: expanded from macro 'sys_reg_Op0'
      46 | #define sys_reg_Op0(id) (((id) >> Op0_shift) & Op0_mask)
         |                         ^
   arch/arm64/kvm/sys_regs.h:239:25: note: expanded from macro 'Op0'
     239 | #define Op0(_x)         .Op0 = _x
         |                                ^~
   77 warnings and 3 errors generated.


vim +2309 arch/arm64/kvm/sys_regs.c

  2201	
  2202	/*
  2203	 * Architected system registers.
  2204	 * Important: Must be sorted ascending by Op0, Op1, CRn, CRm, Op2
  2205	 *
  2206	 * Debug handling: We do trap most, if not all debug related system
  2207	 * registers. The implementation is good enough to ensure that a guest
  2208	 * can use these with minimal performance degradation. The drawback is
  2209	 * that we don't implement any of the external debug architecture.
  2210	 * This should be revisited if we ever encounter a more demanding
  2211	 * guest...
  2212	 */
  2213	static const struct sys_reg_desc sys_reg_descs[] = {
  2214		DBG_BCR_BVR_WCR_WVR_EL1(0),
  2215		DBG_BCR_BVR_WCR_WVR_EL1(1),
  2216		{ SYS_DESC(SYS_MDCCINT_EL1), trap_debug_regs, reset_val, MDCCINT_EL1, 0 },
  2217		{ SYS_DESC(SYS_MDSCR_EL1), trap_debug_regs, reset_val, MDSCR_EL1, 0 },
  2218		DBG_BCR_BVR_WCR_WVR_EL1(2),
  2219		DBG_BCR_BVR_WCR_WVR_EL1(3),
  2220		DBG_BCR_BVR_WCR_WVR_EL1(4),
  2221		DBG_BCR_BVR_WCR_WVR_EL1(5),
  2222		DBG_BCR_BVR_WCR_WVR_EL1(6),
  2223		DBG_BCR_BVR_WCR_WVR_EL1(7),
  2224		DBG_BCR_BVR_WCR_WVR_EL1(8),
  2225		DBG_BCR_BVR_WCR_WVR_EL1(9),
  2226		DBG_BCR_BVR_WCR_WVR_EL1(10),
  2227		DBG_BCR_BVR_WCR_WVR_EL1(11),
  2228		DBG_BCR_BVR_WCR_WVR_EL1(12),
  2229		DBG_BCR_BVR_WCR_WVR_EL1(13),
  2230		DBG_BCR_BVR_WCR_WVR_EL1(14),
  2231		DBG_BCR_BVR_WCR_WVR_EL1(15),
  2232	
  2233		{ SYS_DESC(SYS_MDRAR_EL1), trap_raz_wi },
  2234		{ SYS_DESC(SYS_OSLAR_EL1), trap_oslar_el1 },
  2235		{ SYS_DESC(SYS_OSLSR_EL1), trap_oslsr_el1, reset_val, OSLSR_EL1,
  2236			OSLSR_EL1_OSLM_IMPLEMENTED, .set_user = set_oslsr_el1, },
  2237		{ SYS_DESC(SYS_OSDLR_EL1), trap_raz_wi },
  2238		{ SYS_DESC(SYS_DBGPRCR_EL1), trap_raz_wi },
  2239		{ SYS_DESC(SYS_DBGCLAIMSET_EL1), trap_raz_wi },
  2240		{ SYS_DESC(SYS_DBGCLAIMCLR_EL1), trap_raz_wi },
  2241		{ SYS_DESC(SYS_DBGAUTHSTATUS_EL1), trap_dbgauthstatus_el1 },
  2242	
  2243		{ SYS_DESC(SYS_MDCCSR_EL0), trap_raz_wi },
  2244		{ SYS_DESC(SYS_DBGDTR_EL0), trap_raz_wi },
  2245		// DBGDTR[TR]X_EL0 share the same encoding
  2246		{ SYS_DESC(SYS_DBGDTRTX_EL0), trap_raz_wi },
  2247	
  2248		{ SYS_DESC(SYS_DBGVCR32_EL2), trap_undef, reset_val, DBGVCR32_EL2, 0 },
  2249	
  2250		{ SYS_DESC(SYS_MPIDR_EL1), NULL, reset_mpidr, MPIDR_EL1 },
  2251	
  2252		/*
  2253		 * ID regs: all ID_SANITISED() entries here must have corresponding
  2254		 * entries in arm64_ftr_regs[].
  2255		 */
  2256	
  2257		/* AArch64 mappings of the AArch32 ID registers */
  2258		/* CRm=1 */
  2259		AA32_ID_SANITISED(ID_PFR0_EL1),
  2260		AA32_ID_SANITISED(ID_PFR1_EL1),
  2261		{ SYS_DESC(SYS_ID_DFR0_EL1),
  2262		  .access = access_id_reg,
  2263		  .get_user = get_id_reg,
  2264		  .set_user = set_id_dfr0_el1,
  2265		  .visibility = aa32_id_visibility,
  2266		  .reset = read_sanitised_id_dfr0_el1,
  2267		  .val = ID_DFR0_EL1_PerfMon_MASK |
  2268			 ID_DFR0_EL1_CopDbg_MASK, },
  2269		ID_HIDDEN(ID_AFR0_EL1),
  2270		AA32_ID_SANITISED(ID_MMFR0_EL1),
  2271		AA32_ID_SANITISED(ID_MMFR1_EL1),
  2272		AA32_ID_SANITISED(ID_MMFR2_EL1),
  2273		AA32_ID_SANITISED(ID_MMFR3_EL1),
  2274	
  2275		/* CRm=2 */
  2276		AA32_ID_SANITISED(ID_ISAR0_EL1),
  2277		AA32_ID_SANITISED(ID_ISAR1_EL1),
  2278		AA32_ID_SANITISED(ID_ISAR2_EL1),
  2279		AA32_ID_SANITISED(ID_ISAR3_EL1),
  2280		AA32_ID_SANITISED(ID_ISAR4_EL1),
  2281		AA32_ID_SANITISED(ID_ISAR5_EL1),
  2282		AA32_ID_SANITISED(ID_MMFR4_EL1),
  2283		AA32_ID_SANITISED(ID_ISAR6_EL1),
  2284	
  2285		/* CRm=3 */
  2286		AA32_ID_SANITISED(MVFR0_EL1),
  2287		AA32_ID_SANITISED(MVFR1_EL1),
  2288		AA32_ID_SANITISED(MVFR2_EL1),
  2289		ID_UNALLOCATED(3,3),
  2290		AA32_ID_SANITISED(ID_PFR2_EL1),
  2291		ID_HIDDEN(ID_DFR1_EL1),
  2292		AA32_ID_SANITISED(ID_MMFR5_EL1),
  2293		ID_UNALLOCATED(3,7),
  2294	
  2295		/* AArch64 ID registers */
  2296		/* CRm=4 */
  2297		{ SYS_DESC(SYS_ID_AA64PFR0_EL1),
  2298		  .access = access_id_reg,
  2299		  .get_user = get_id_reg,
  2300		  .set_user = set_id_reg,
  2301		  .reset = read_sanitised_id_aa64pfr0_el1,
  2302		  .val = ~(ID_AA64PFR0_EL1_AMU |
  2303			   ID_AA64PFR0_EL1_MPAM |
  2304			   ID_AA64PFR0_EL1_SVE |
  2305			   ID_AA64PFR0_EL1_RAS |
  2306			   ID_AA64PFR0_EL1_GIC |
  2307			   ID_AA64PFR0_EL1_AdvSIMD |
  2308			   ID_AA64PFR0_EL1_FP), },
> 2309		ID_WRITABLE(SYS_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_BT),
  2310		ID_UNALLOCATED(4,2),
  2311		ID_UNALLOCATED(4,3),
  2312		ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),
  2313		ID_HIDDEN(ID_AA64SMFR0_EL1),
  2314		ID_UNALLOCATED(4,6),
  2315		ID_UNALLOCATED(4,7),
  2316	
  2317		/* CRm=5 */
  2318		{ SYS_DESC(SYS_ID_AA64DFR0_EL1),
  2319		  .access = access_id_reg,
  2320		  .get_user = get_id_reg,
  2321		  .set_user = set_id_aa64dfr0_el1,
  2322		  .reset = read_sanitised_id_aa64dfr0_el1,
  2323		  .val = ID_AA64DFR0_EL1_PMUVer_MASK |
  2324			 ID_AA64DFR0_EL1_DebugVer_MASK, },
  2325		ID_SANITISED(ID_AA64DFR1_EL1),
  2326		ID_UNALLOCATED(5,2),
  2327		ID_UNALLOCATED(5,3),
  2328		ID_HIDDEN(ID_AA64AFR0_EL1),
  2329		ID_HIDDEN(ID_AA64AFR1_EL1),
  2330		ID_UNALLOCATED(5,6),
  2331		ID_UNALLOCATED(5,7),
  2332	
  2333		/* CRm=6 */
  2334		ID_WRITABLE(ID_AA64ISAR0_EL1, ~ID_AA64ISAR0_EL1_RES0),
  2335		ID_WRITABLE(ID_AA64ISAR1_EL1, ~(ID_AA64ISAR1_EL1_GPI |
  2336						ID_AA64ISAR1_EL1_GPA |
  2337						ID_AA64ISAR1_EL1_API |
  2338						ID_AA64ISAR1_EL1_APA)),
  2339		ID_WRITABLE(ID_AA64ISAR2_EL1, ~(ID_AA64ISAR2_EL1_RES0 |
  2340						ID_AA64ISAR2_EL1_APA3 |
  2341						ID_AA64ISAR2_EL1_GPA3)),
  2342		ID_UNALLOCATED(6,3),
  2343		ID_UNALLOCATED(6,4),
  2344		ID_UNALLOCATED(6,5),
  2345		ID_UNALLOCATED(6,6),
  2346		ID_UNALLOCATED(6,7),
  2347	
  2348		/* CRm=7 */
  2349		ID_WRITABLE(ID_AA64MMFR0_EL1, ~(ID_AA64MMFR0_EL1_RES0 |
  2350						ID_AA64MMFR0_EL1_TGRAN4_2 |
  2351						ID_AA64MMFR0_EL1_TGRAN64_2 |
  2352						ID_AA64MMFR0_EL1_TGRAN16_2)),
  2353		ID_WRITABLE(ID_AA64MMFR1_EL1, ~(ID_AA64MMFR1_EL1_RES0 |
  2354						ID_AA64MMFR1_EL1_HCX |
  2355						ID_AA64MMFR1_EL1_TWED |
  2356						ID_AA64MMFR1_EL1_XNX |
  2357						ID_AA64MMFR1_EL1_VH |
  2358						ID_AA64MMFR1_EL1_VMIDBits)),
  2359		ID_WRITABLE(ID_AA64MMFR2_EL1, ~(ID_AA64MMFR2_EL1_RES0 |
  2360						ID_AA64MMFR2_EL1_EVT |
  2361						ID_AA64MMFR2_EL1_FWB |
  2362						ID_AA64MMFR2_EL1_IDS |
  2363						ID_AA64MMFR2_EL1_NV |
  2364						ID_AA64MMFR2_EL1_CCIDX)),
  2365		ID_SANITISED(ID_AA64MMFR3_EL1),
  2366		ID_SANITISED(ID_AA64MMFR4_EL1),
  2367		ID_UNALLOCATED(7,5),
  2368		ID_UNALLOCATED(7,6),
  2369		ID_UNALLOCATED(7,7),
  2370	
  2371		{ SYS_DESC(SYS_SCTLR_EL1), access_vm_reg, reset_val, SCTLR_EL1, 0x00C50078 },
  2372		{ SYS_DESC(SYS_ACTLR_EL1), access_actlr, reset_actlr, ACTLR_EL1 },
  2373		{ SYS_DESC(SYS_CPACR_EL1), NULL, reset_val, CPACR_EL1, 0 },
  2374	
  2375		MTE_REG(RGSR_EL1),
  2376		MTE_REG(GCR_EL1),
  2377	
  2378		{ SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility = sve_visibility },
  2379		{ SYS_DESC(SYS_TRFCR_EL1), undef_access },
  2380		{ SYS_DESC(SYS_SMPRI_EL1), undef_access },
  2381		{ SYS_DESC(SYS_SMCR_EL1), undef_access },
  2382		{ SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
  2383		{ SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
  2384		{ SYS_DESC(SYS_TCR_EL1), access_vm_reg, reset_val, TCR_EL1, 0 },
  2385		{ SYS_DESC(SYS_TCR2_EL1), access_vm_reg, reset_val, TCR2_EL1, 0 },
  2386	
  2387		PTRAUTH_KEY(APIA),
  2388		PTRAUTH_KEY(APIB),
  2389		PTRAUTH_KEY(APDA),
  2390		PTRAUTH_KEY(APDB),
  2391		PTRAUTH_KEY(APGA),
  2392	
  2393		{ SYS_DESC(SYS_SPSR_EL1), access_spsr},
  2394		{ SYS_DESC(SYS_ELR_EL1), access_elr},
  2395	
  2396		{ SYS_DESC(SYS_AFSR0_EL1), access_vm_reg, reset_unknown, AFSR0_EL1 },
  2397		{ SYS_DESC(SYS_AFSR1_EL1), access_vm_reg, reset_unknown, AFSR1_EL1 },
  2398		{ SYS_DESC(SYS_ESR_EL1), access_vm_reg, reset_unknown, ESR_EL1 },
  2399	
  2400		{ SYS_DESC(SYS_ERRIDR_EL1), trap_raz_wi },
  2401		{ SYS_DESC(SYS_ERRSELR_EL1), trap_raz_wi },
  2402		{ SYS_DESC(SYS_ERXFR_EL1), trap_raz_wi },
  2403		{ SYS_DESC(SYS_ERXCTLR_EL1), trap_raz_wi },
  2404		{ SYS_DESC(SYS_ERXSTATUS_EL1), trap_raz_wi },
  2405		{ SYS_DESC(SYS_ERXADDR_EL1), trap_raz_wi },
  2406		{ SYS_DESC(SYS_ERXMISC0_EL1), trap_raz_wi },
  2407		{ SYS_DESC(SYS_ERXMISC1_EL1), trap_raz_wi },
  2408	
  2409		MTE_REG(TFSR_EL1),
  2410		MTE_REG(TFSRE0_EL1),
  2411	
  2412		{ SYS_DESC(SYS_FAR_EL1), access_vm_reg, reset_unknown, FAR_EL1 },
  2413		{ SYS_DESC(SYS_PAR_EL1), NULL, reset_unknown, PAR_EL1 },
  2414	
  2415		{ SYS_DESC(SYS_PMSCR_EL1), undef_access },
  2416		{ SYS_DESC(SYS_PMSNEVFR_EL1), undef_access },
  2417		{ SYS_DESC(SYS_PMSICR_EL1), undef_access },
  2418		{ SYS_DESC(SYS_PMSIRR_EL1), undef_access },
  2419		{ SYS_DESC(SYS_PMSFCR_EL1), undef_access },
  2420		{ SYS_DESC(SYS_PMSEVFR_EL1), undef_access },
  2421		{ SYS_DESC(SYS_PMSLATFR_EL1), undef_access },
  2422		{ SYS_DESC(SYS_PMSIDR_EL1), undef_access },
  2423		{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
  2424		{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
  2425		{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
  2426		/* PMBIDR_EL1 is not trapped */
  2427	
  2428		{ PMU_SYS_REG(PMINTENSET_EL1),
  2429		  .access = access_pminten, .reg = PMINTENSET_EL1,
  2430		  .get_user = get_pmreg, .set_user = set_pmreg },
  2431		{ PMU_SYS_REG(PMINTENCLR_EL1),
  2432		  .access = access_pminten, .reg = PMINTENSET_EL1,
  2433		  .get_user = get_pmreg, .set_user = set_pmreg },
  2434		{ SYS_DESC(SYS_PMMIR_EL1), trap_raz_wi },
  2435	
  2436		{ SYS_DESC(SYS_MAIR_EL1), access_vm_reg, reset_unknown, MAIR_EL1 },
  2437		{ SYS_DESC(SYS_PIRE0_EL1), NULL, reset_unknown, PIRE0_EL1 },
  2438		{ SYS_DESC(SYS_PIR_EL1), NULL, reset_unknown, PIR_EL1 },
  2439		{ SYS_DESC(SYS_AMAIR_EL1), access_vm_reg, reset_amair_el1, AMAIR_EL1 },
  2440	
  2441		{ SYS_DESC(SYS_LORSA_EL1), trap_loregion },
  2442		{ SYS_DESC(SYS_LOREA_EL1), trap_loregion },
  2443		{ SYS_DESC(SYS_LORN_EL1), trap_loregion },
  2444		{ SYS_DESC(SYS_LORC_EL1), trap_loregion },
  2445		{ SYS_DESC(SYS_LORID_EL1), trap_loregion },
  2446	
  2447		{ SYS_DESC(SYS_VBAR_EL1), access_rw, reset_val, VBAR_EL1, 0 },
  2448		{ SYS_DESC(SYS_DISR_EL1), NULL, reset_val, DISR_EL1, 0 },
  2449	
  2450		{ SYS_DESC(SYS_ICC_IAR0_EL1), write_to_read_only },
  2451		{ SYS_DESC(SYS_ICC_EOIR0_EL1), read_from_write_only },
  2452		{ SYS_DESC(SYS_ICC_HPPIR0_EL1), write_to_read_only },
  2453		{ SYS_DESC(SYS_ICC_DIR_EL1), read_from_write_only },
  2454		{ SYS_DESC(SYS_ICC_RPR_EL1), write_to_read_only },
  2455		{ SYS_DESC(SYS_ICC_SGI1R_EL1), access_gic_sgi },
  2456		{ SYS_DESC(SYS_ICC_ASGI1R_EL1), access_gic_sgi },
  2457		{ SYS_DESC(SYS_ICC_SGI0R_EL1), access_gic_sgi },
  2458		{ SYS_DESC(SYS_ICC_IAR1_EL1), write_to_read_only },
  2459		{ SYS_DESC(SYS_ICC_EOIR1_EL1), read_from_write_only },
  2460		{ SYS_DESC(SYS_ICC_HPPIR1_EL1), write_to_read_only },
  2461		{ SYS_DESC(SYS_ICC_SRE_EL1), access_gic_sre },
  2462	
  2463		{ SYS_DESC(SYS_CONTEXTIDR_EL1), access_vm_reg, reset_val, CONTEXTIDR_EL1, 0 },
  2464		{ SYS_DESC(SYS_TPIDR_EL1), NULL, reset_unknown, TPIDR_EL1 },
  2465	
  2466		{ SYS_DESC(SYS_ACCDATA_EL1), undef_access },
  2467	
  2468		{ SYS_DESC(SYS_SCXTNUM_EL1), undef_access },
  2469	
  2470		{ SYS_DESC(SYS_CNTKCTL_EL1), NULL, reset_val, CNTKCTL_EL1, 0},
  2471	
  2472		{ SYS_DESC(SYS_CCSIDR_EL1), access_ccsidr },
  2473		{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
  2474		  .set_user = set_clidr },
  2475		{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
  2476		{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
  2477		{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
  2478		{ SYS_DESC(SYS_CTR_EL0), access_ctr },
  2479		{ SYS_DESC(SYS_SVCR), undef_access },
  2480	
  2481		{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
  2482		  .reg = PMCR_EL0, .get_user = get_pmcr, .set_user = set_pmcr },
  2483		{ PMU_SYS_REG(PMCNTENSET_EL0),
  2484		  .access = access_pmcnten, .reg = PMCNTENSET_EL0,
  2485		  .get_user = get_pmreg, .set_user = set_pmreg },
  2486		{ PMU_SYS_REG(PMCNTENCLR_EL0),
  2487		  .access = access_pmcnten, .reg = PMCNTENSET_EL0,
  2488		  .get_user = get_pmreg, .set_user = set_pmreg },
  2489		{ PMU_SYS_REG(PMOVSCLR_EL0),
  2490		  .access = access_pmovs, .reg = PMOVSSET_EL0,
  2491		  .get_user = get_pmreg, .set_user = set_pmreg },
  2492		/*
  2493		 * PM_SWINC_EL0 is exposed to userspace as RAZ/WI, as it was
  2494		 * previously (and pointlessly) advertised in the past...
  2495		 */
  2496		{ PMU_SYS_REG(PMSWINC_EL0),
  2497		  .get_user = get_raz_reg, .set_user = set_wi_reg,
  2498		  .access = access_pmswinc, .reset = NULL },
  2499		{ PMU_SYS_REG(PMSELR_EL0),
  2500		  .access = access_pmselr, .reset = reset_pmselr, .reg = PMSELR_EL0 },
  2501		{ PMU_SYS_REG(PMCEID0_EL0),
  2502		  .access = access_pmceid, .reset = NULL },
  2503		{ PMU_SYS_REG(PMCEID1_EL0),
  2504		  .access = access_pmceid, .reset = NULL },
  2505		{ PMU_SYS_REG(PMCCNTR_EL0),
  2506		  .access = access_pmu_evcntr, .reset = reset_unknown,
  2507		  .reg = PMCCNTR_EL0, .get_user = get_pmu_evcntr},
  2508		{ PMU_SYS_REG(PMXEVTYPER_EL0),
  2509		  .access = access_pmu_evtyper, .reset = NULL },
  2510		{ PMU_SYS_REG(PMXEVCNTR_EL0),
  2511		  .access = access_pmu_evcntr, .reset = NULL },
  2512		/*
  2513		 * PMUSERENR_EL0 resets as unknown in 64bit mode while it resets as zero
  2514		 * in 32bit mode. Here we choose to reset it as zero for consistency.
  2515		 */
  2516		{ PMU_SYS_REG(PMUSERENR_EL0), .access = access_pmuserenr,
  2517		  .reset = reset_val, .reg = PMUSERENR_EL0, .val = 0 },
  2518		{ PMU_SYS_REG(PMOVSSET_EL0),
  2519		  .access = access_pmovs, .reg = PMOVSSET_EL0,
  2520		  .get_user = get_pmreg, .set_user = set_pmreg },
  2521	
  2522		{ SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
  2523		{ SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
  2524		{ SYS_DESC(SYS_TPIDR2_EL0), undef_access },
  2525	
  2526		{ SYS_DESC(SYS_SCXTNUM_EL0), undef_access },
  2527	
  2528		{ SYS_DESC(SYS_AMCR_EL0), undef_access },
  2529		{ SYS_DESC(SYS_AMCFGR_EL0), undef_access },
  2530		{ SYS_DESC(SYS_AMCGCR_EL0), undef_access },
  2531		{ SYS_DESC(SYS_AMUSERENR_EL0), undef_access },
  2532		{ SYS_DESC(SYS_AMCNTENCLR0_EL0), undef_access },
  2533		{ SYS_DESC(SYS_AMCNTENSET0_EL0), undef_access },
  2534		{ SYS_DESC(SYS_AMCNTENCLR1_EL0), undef_access },
  2535		{ SYS_DESC(SYS_AMCNTENSET1_EL0), undef_access },
  2536		AMU_AMEVCNTR0_EL0(0),
  2537		AMU_AMEVCNTR0_EL0(1),
  2538		AMU_AMEVCNTR0_EL0(2),
  2539		AMU_AMEVCNTR0_EL0(3),
  2540		AMU_AMEVCNTR0_EL0(4),
  2541		AMU_AMEVCNTR0_EL0(5),
  2542		AMU_AMEVCNTR0_EL0(6),
  2543		AMU_AMEVCNTR0_EL0(7),
  2544		AMU_AMEVCNTR0_EL0(8),
  2545		AMU_AMEVCNTR0_EL0(9),
  2546		AMU_AMEVCNTR0_EL0(10),
  2547		AMU_AMEVCNTR0_EL0(11),
  2548		AMU_AMEVCNTR0_EL0(12),
  2549		AMU_AMEVCNTR0_EL0(13),
  2550		AMU_AMEVCNTR0_EL0(14),
  2551		AMU_AMEVCNTR0_EL0(15),
  2552		AMU_AMEVTYPER0_EL0(0),
  2553		AMU_AMEVTYPER0_EL0(1),
  2554		AMU_AMEVTYPER0_EL0(2),
  2555		AMU_AMEVTYPER0_EL0(3),
  2556		AMU_AMEVTYPER0_EL0(4),
  2557		AMU_AMEVTYPER0_EL0(5),
  2558		AMU_AMEVTYPER0_EL0(6),
  2559		AMU_AMEVTYPER0_EL0(7),
  2560		AMU_AMEVTYPER0_EL0(8),
  2561		AMU_AMEVTYPER0_EL0(9),
  2562		AMU_AMEVTYPER0_EL0(10),
  2563		AMU_AMEVTYPER0_EL0(11),
  2564		AMU_AMEVTYPER0_EL0(12),
  2565		AMU_AMEVTYPER0_EL0(13),
  2566		AMU_AMEVTYPER0_EL0(14),
  2567		AMU_AMEVTYPER0_EL0(15),
  2568		AMU_AMEVCNTR1_EL0(0),
  2569		AMU_AMEVCNTR1_EL0(1),
  2570		AMU_AMEVCNTR1_EL0(2),
  2571		AMU_AMEVCNTR1_EL0(3),
  2572		AMU_AMEVCNTR1_EL0(4),
  2573		AMU_AMEVCNTR1_EL0(5),
  2574		AMU_AMEVCNTR1_EL0(6),
  2575		AMU_AMEVCNTR1_EL0(7),
  2576		AMU_AMEVCNTR1_EL0(8),
  2577		AMU_AMEVCNTR1_EL0(9),
  2578		AMU_AMEVCNTR1_EL0(10),
  2579		AMU_AMEVCNTR1_EL0(11),
  2580		AMU_AMEVCNTR1_EL0(12),
  2581		AMU_AMEVCNTR1_EL0(13),
  2582		AMU_AMEVCNTR1_EL0(14),
  2583		AMU_AMEVCNTR1_EL0(15),
  2584		AMU_AMEVTYPER1_EL0(0),
  2585		AMU_AMEVTYPER1_EL0(1),
  2586		AMU_AMEVTYPER1_EL0(2),
  2587		AMU_AMEVTYPER1_EL0(3),
  2588		AMU_AMEVTYPER1_EL0(4),
  2589		AMU_AMEVTYPER1_EL0(5),
  2590		AMU_AMEVTYPER1_EL0(6),
  2591		AMU_AMEVTYPER1_EL0(7),
  2592		AMU_AMEVTYPER1_EL0(8),
  2593		AMU_AMEVTYPER1_EL0(9),
  2594		AMU_AMEVTYPER1_EL0(10),
  2595		AMU_AMEVTYPER1_EL0(11),
  2596		AMU_AMEVTYPER1_EL0(12),
  2597		AMU_AMEVTYPER1_EL0(13),
  2598		AMU_AMEVTYPER1_EL0(14),
  2599		AMU_AMEVTYPER1_EL0(15),
  2600	
  2601		{ SYS_DESC(SYS_CNTPCT_EL0), access_arch_timer },
  2602		{ SYS_DESC(SYS_CNTPCTSS_EL0), access_arch_timer },
  2603		{ SYS_DESC(SYS_CNTP_TVAL_EL0), access_arch_timer },
  2604		{ SYS_DESC(SYS_CNTP_CTL_EL0), access_arch_timer },
  2605		{ SYS_DESC(SYS_CNTP_CVAL_EL0), access_arch_timer },
  2606	
  2607		/* PMEVCNTRn_EL0 */
  2608		PMU_PMEVCNTR_EL0(0),
  2609		PMU_PMEVCNTR_EL0(1),
  2610		PMU_PMEVCNTR_EL0(2),
  2611		PMU_PMEVCNTR_EL0(3),
  2612		PMU_PMEVCNTR_EL0(4),
  2613		PMU_PMEVCNTR_EL0(5),
  2614		PMU_PMEVCNTR_EL0(6),
  2615		PMU_PMEVCNTR_EL0(7),
  2616		PMU_PMEVCNTR_EL0(8),
  2617		PMU_PMEVCNTR_EL0(9),
  2618		PMU_PMEVCNTR_EL0(10),
  2619		PMU_PMEVCNTR_EL0(11),
  2620		PMU_PMEVCNTR_EL0(12),
  2621		PMU_PMEVCNTR_EL0(13),
  2622		PMU_PMEVCNTR_EL0(14),
  2623		PMU_PMEVCNTR_EL0(15),
  2624		PMU_PMEVCNTR_EL0(16),
  2625		PMU_PMEVCNTR_EL0(17),
  2626		PMU_PMEVCNTR_EL0(18),
  2627		PMU_PMEVCNTR_EL0(19),
  2628		PMU_PMEVCNTR_EL0(20),
  2629		PMU_PMEVCNTR_EL0(21),
  2630		PMU_PMEVCNTR_EL0(22),
  2631		PMU_PMEVCNTR_EL0(23),
  2632		PMU_PMEVCNTR_EL0(24),
  2633		PMU_PMEVCNTR_EL0(25),
  2634		PMU_PMEVCNTR_EL0(26),
  2635		PMU_PMEVCNTR_EL0(27),
  2636		PMU_PMEVCNTR_EL0(28),
  2637		PMU_PMEVCNTR_EL0(29),
  2638		PMU_PMEVCNTR_EL0(30),
  2639		/* PMEVTYPERn_EL0 */
  2640		PMU_PMEVTYPER_EL0(0),
  2641		PMU_PMEVTYPER_EL0(1),
  2642		PMU_PMEVTYPER_EL0(2),
  2643		PMU_PMEVTYPER_EL0(3),
  2644		PMU_PMEVTYPER_EL0(4),
  2645		PMU_PMEVTYPER_EL0(5),
  2646		PMU_PMEVTYPER_EL0(6),
  2647		PMU_PMEVTYPER_EL0(7),
  2648		PMU_PMEVTYPER_EL0(8),
  2649		PMU_PMEVTYPER_EL0(9),
  2650		PMU_PMEVTYPER_EL0(10),
  2651		PMU_PMEVTYPER_EL0(11),
  2652		PMU_PMEVTYPER_EL0(12),
  2653		PMU_PMEVTYPER_EL0(13),
  2654		PMU_PMEVTYPER_EL0(14),
  2655		PMU_PMEVTYPER_EL0(15),
  2656		PMU_PMEVTYPER_EL0(16),
  2657		PMU_PMEVTYPER_EL0(17),
  2658		PMU_PMEVTYPER_EL0(18),
  2659		PMU_PMEVTYPER_EL0(19),
  2660		PMU_PMEVTYPER_EL0(20),
  2661		PMU_PMEVTYPER_EL0(21),
  2662		PMU_PMEVTYPER_EL0(22),
  2663		PMU_PMEVTYPER_EL0(23),
  2664		PMU_PMEVTYPER_EL0(24),
  2665		PMU_PMEVTYPER_EL0(25),
  2666		PMU_PMEVTYPER_EL0(26),
  2667		PMU_PMEVTYPER_EL0(27),
  2668		PMU_PMEVTYPER_EL0(28),
  2669		PMU_PMEVTYPER_EL0(29),
  2670		PMU_PMEVTYPER_EL0(30),
  2671		/*
  2672		 * PMCCFILTR_EL0 resets as unknown in 64bit mode while it resets as zero
  2673		 * in 32bit mode. Here we choose to reset it as zero for consistency.
  2674		 */
  2675		{ PMU_SYS_REG(PMCCFILTR_EL0), .access = access_pmu_evtyper,
  2676		  .reset = reset_val, .reg = PMCCFILTR_EL0, .val = 0 },
  2677	
  2678		EL2_REG_VNCR(VPIDR_EL2, reset_unknown, 0),
  2679		EL2_REG_VNCR(VMPIDR_EL2, reset_unknown, 0),
  2680		EL2_REG(SCTLR_EL2, access_rw, reset_val, SCTLR_EL2_RES1),
  2681		EL2_REG(ACTLR_EL2, access_rw, reset_val, 0),
  2682		EL2_REG_VNCR(HCR_EL2, reset_hcr, 0),
  2683		EL2_REG(MDCR_EL2, access_rw, reset_val, 0),
  2684		EL2_REG(CPTR_EL2, access_rw, reset_val, CPTR_NVHE_EL2_RES1),
  2685		EL2_REG_VNCR(HSTR_EL2, reset_val, 0),
  2686		EL2_REG_VNCR(HFGRTR_EL2, reset_val, 0),
  2687		EL2_REG_VNCR(HFGWTR_EL2, reset_val, 0),
  2688		EL2_REG_VNCR(HFGITR_EL2, reset_val, 0),
  2689		EL2_REG_VNCR(HACR_EL2, reset_val, 0),
  2690	
  2691		EL2_REG_VNCR(HCRX_EL2, reset_val, 0),
  2692	
  2693		EL2_REG(TTBR0_EL2, access_rw, reset_val, 0),
  2694		EL2_REG(TTBR1_EL2, access_rw, reset_val, 0),
  2695		EL2_REG(TCR_EL2, access_rw, reset_val, TCR_EL2_RES1),
  2696		EL2_REG_VNCR(VTTBR_EL2, reset_val, 0),
  2697		EL2_REG_VNCR(VTCR_EL2, reset_val, 0),
  2698	
  2699		{ SYS_DESC(SYS_DACR32_EL2), trap_undef, reset_unknown, DACR32_EL2 },
  2700		EL2_REG_VNCR(HDFGRTR_EL2, reset_val, 0),
  2701		EL2_REG_VNCR(HDFGWTR_EL2, reset_val, 0),
  2702		EL2_REG_VNCR(HAFGRTR_EL2, reset_val, 0),
  2703		EL2_REG_REDIR(SPSR_EL2, reset_val, 0),
  2704		EL2_REG_REDIR(ELR_EL2, reset_val, 0),
  2705		{ SYS_DESC(SYS_SP_EL1), access_sp_el1},
  2706	
  2707		/* AArch32 SPSR_* are RES0 if trapped from a NV guest */
  2708		{ SYS_DESC(SYS_SPSR_irq), .access = trap_raz_wi,
  2709		  .visibility = hidden_user_visibility },
  2710		{ SYS_DESC(SYS_SPSR_abt), .access = trap_raz_wi,
  2711		  .visibility = hidden_user_visibility },
  2712		{ SYS_DESC(SYS_SPSR_und), .access = trap_raz_wi,
  2713		  .visibility = hidden_user_visibility },
  2714		{ SYS_DESC(SYS_SPSR_fiq), .access = trap_raz_wi,
  2715		  .visibility = hidden_user_visibility },
  2716	
  2717		{ SYS_DESC(SYS_IFSR32_EL2), trap_undef, reset_unknown, IFSR32_EL2 },
  2718		EL2_REG(AFSR0_EL2, access_rw, reset_val, 0),
  2719		EL2_REG(AFSR1_EL2, access_rw, reset_val, 0),
  2720		EL2_REG_REDIR(ESR_EL2, reset_val, 0),
  2721		{ SYS_DESC(SYS_FPEXC32_EL2), trap_undef, reset_val, FPEXC32_EL2, 0x700 },
  2722	
  2723		EL2_REG_REDIR(FAR_EL2, reset_val, 0),
  2724		EL2_REG(HPFAR_EL2, access_rw, reset_val, 0),
  2725	
  2726		EL2_REG(MAIR_EL2, access_rw, reset_val, 0),
  2727		EL2_REG(AMAIR_EL2, access_rw, reset_val, 0),
  2728	
  2729		EL2_REG(VBAR_EL2, access_rw, reset_val, 0),
  2730		EL2_REG(RVBAR_EL2, access_rw, reset_val, 0),
  2731		{ SYS_DESC(SYS_RMR_EL2), trap_undef },
  2732	
  2733		EL2_REG(CONTEXTIDR_EL2, access_rw, reset_val, 0),
  2734		EL2_REG(TPIDR_EL2, access_rw, reset_val, 0),
  2735	
  2736		EL2_REG_VNCR(CNTVOFF_EL2, reset_val, 0),
  2737		EL2_REG(CNTHCTL_EL2, access_rw, reset_val, 0),
  2738	
  2739		EL12_REG(CNTKCTL, access_rw, reset_val, 0),
  2740	
  2741		EL2_REG(SP_EL2, NULL, reset_unknown, 0),
  2742	};
  2743	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
