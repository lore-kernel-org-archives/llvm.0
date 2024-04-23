Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F389813DBA8;
	Tue, 23 Apr 2024 17:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713893444; cv=none; b=OUTMJf49gkAjEbOShl3wgQCaEXmekzmFwkGbCZhaCtJbltO/Td6BYeZXlpyJ9+JgvS1/uEPHC6uxvYcYwSlW8VbkS/DU2h8HMz/FMGXbqxTiAbHBUwr4i9x9WFdsquaajARwY9PBASel7Lt8GD/sdFgUuQNVyH5P1yS9tv+MRXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713893444; c=relaxed/simple;
	bh=RS+GGEtDBQg8LrwA6C1lcvm5Hw1kZHanyJ/exQ7nr0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U6ZN+D4r+msVNH+1Ls469rXEsHL9IasXj+eyvKcWtqZaf4Tkqrs7TlP5Fgy8iTWyet1Mi4VXwow5tIKIEC1XN6uDG5a6V8Jct7ivhcvcGU9lxC5opzQXjZTltppI0uAYebfw6EpDBJjO2ybMp0om7HQxdumzJ6jpaFSfCGYZ3Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar+Zmkd/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar+Zmkd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713893443; x=1745429443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RS+GGEtDBQg8LrwA6C1lcvm5Hw1kZHanyJ/exQ7nr0U=;
  b=ar+Zmkd/FLn4XNMvtDnFjW0GjFNaMVOE7z1ZaxsQqwKzwXkp80oQO7U1
   0fbn7110lwybqr0KP37KDr5lOcjilLPRkBmOLXOzkgd5hLAM6810NSyOe
   o7dR1sv+VdUtNnswMfvy404eq0aHVfM63wI5tmjgZwC19xpHNi1NhQN0C
   dvsM/d4cgKOUNa29DUlXIdl82/etQ68rG8TVyX4hWWQhbFqhvziyhTgKo
   ztIm0MVFjTlFdyGr8axOzOH4oko2DY5ZYn3B/zvZwqEptLBX9kEsnDZrv
   cDjoPU0AbqXR4amEepb2TO4Bo4RgLY2ke5B7lat9XJN512F4y/dj0fFbE
   w==;
X-CSE-ConnectionGUID: vkcajDl3SN60Guq5LNaSUQ==
X-CSE-MsgGUID: mXsxuaWsQ2+aK+x9T1PvXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="31986945"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="31986945"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 10:30:42 -0700
X-CSE-ConnectionGUID: 54G9DmbPSfWsDI2ySUlbCA==
X-CSE-MsgGUID: X2njQoydQBeul12oedQARw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24411498"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Apr 2024 10:30:39 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzJyX-0000Ol-1U;
	Tue, 23 Apr 2024 17:30:37 +0000
Date: Wed, 24 Apr 2024 01:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jonhunter:tegra/for-next 1/5]
 arch/arm64/kvm/emulate-nested.c:2186:33: error: call to undeclared function
 'kvm_auth_eretax'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202404240126.wbYVyRds-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonhunter/linux tegra/for-next
head:   f8e094daab02151fe59eb3563ae57558ca50a47f
commit: 12000af23affc31be8359cd8c5af850058b2a173 [1/5] Revert "KVM: arm64: nv: Add emulation for ERETAx instructions"
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240424/202404240126.wbYVyRds-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240126.wbYVyRds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240126.wbYVyRds-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/emulate-nested.c:8:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2254:
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
>> arch/arm64/kvm/emulate-nested.c:2186:33: error: call to undeclared function 'kvm_auth_eretax'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2186 |         if (esr_iss_is_eretax(esr) && !kvm_auth_eretax(vcpu, &elr)) {
         |                                        ^
   5 warnings and 1 error generated.
--
   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
   In file included from arch/arm64/kvm/hyp/include/hyp/switch.h:10:
   In file included from arch/arm64/kvm/hyp/include/hyp/adjust_pc.h:13:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2254:
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
>> arch/arm64/kvm/hyp/vhe/switch.c:247:35: error: call to undeclared function 'kvm_auth_eretax'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     247 |                 if (!(vcpu_has_ptrauth(vcpu) && kvm_auth_eretax(vcpu, &elr)))
         |                                                 ^
   arch/arm64/kvm/hyp/vhe/switch.c:263:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     263 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:262:28: note: previous initialization is here
     262 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:264:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     264 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:262:28: note: previous initialization is here
     262 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:265:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     265 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:262:28: note: previous initialization is here
     262 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:266:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     266 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:262:28: note: previous initialization is here
     262 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:267:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     267 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:262:28: note: previous initialization is here
     262 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:268:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     268 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:262:28: note: previous initialization is here
     262 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:269:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     269 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:262:28: note: previous initialization is here
     262 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:270:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     270 |         [ESR_ELx_EC_ERET]               = kvm_hyp_handle_eret,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:262:28: note: previous initialization is here
     262 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:271:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     271 |         [ESR_ELx_EC_MOPS]               = kvm_hyp_handle_mops,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:262:28: note: previous initialization is here
     262 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   14 warnings and 1 error generated.


vim +/kvm_auth_eretax +2186 arch/arm64/kvm/emulate-nested.c

47f3a2fc765ae2 Jintack Lim  2023-02-09  2172  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2173  void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
47f3a2fc765ae2 Jintack Lim  2023-02-09  2174  {
213b3d1ea1612c Marc Zyngier 2024-04-19  2175  	u64 spsr, elr, esr;
47f3a2fc765ae2 Jintack Lim  2023-02-09  2176  
95537f06b9e826 Marc Zyngier 2024-04-19  2177  	/*
95537f06b9e826 Marc Zyngier 2024-04-19  2178  	 * Forward this trap to the virtual EL2 if the virtual
95537f06b9e826 Marc Zyngier 2024-04-19  2179  	 * HCR_EL2.NV bit is set and this is coming from !EL2.
95537f06b9e826 Marc Zyngier 2024-04-19  2180  	 */
95537f06b9e826 Marc Zyngier 2024-04-19  2181  	if (forward_traps(vcpu, HCR_NV))
95537f06b9e826 Marc Zyngier 2024-04-19  2182  		return;
95537f06b9e826 Marc Zyngier 2024-04-19  2183  
213b3d1ea1612c Marc Zyngier 2024-04-19  2184  	/* Check for an ERETAx */
213b3d1ea1612c Marc Zyngier 2024-04-19  2185  	esr = kvm_vcpu_get_esr(vcpu);
213b3d1ea1612c Marc Zyngier 2024-04-19 @2186  	if (esr_iss_is_eretax(esr) && !kvm_auth_eretax(vcpu, &elr)) {
213b3d1ea1612c Marc Zyngier 2024-04-19  2187  		/*
213b3d1ea1612c Marc Zyngier 2024-04-19  2188  		 * Oh no, ERETAx failed to authenticate.  If we have
213b3d1ea1612c Marc Zyngier 2024-04-19  2189  		 * FPACCOMBINE, deliver an exception right away.  If we
213b3d1ea1612c Marc Zyngier 2024-04-19  2190  		 * don't, then let the mangled ELR value trickle down the
213b3d1ea1612c Marc Zyngier 2024-04-19  2191  		 * ERET handling, and the guest will have a little surprise.
213b3d1ea1612c Marc Zyngier 2024-04-19  2192  		 */
213b3d1ea1612c Marc Zyngier 2024-04-19  2193  		if (kvm_has_pauth(vcpu->kvm, FPACCOMBINE)) {
213b3d1ea1612c Marc Zyngier 2024-04-19  2194  			esr &= ESR_ELx_ERET_ISS_ERETA;
213b3d1ea1612c Marc Zyngier 2024-04-19  2195  			esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_FPAC);
213b3d1ea1612c Marc Zyngier 2024-04-19  2196  			kvm_inject_nested_sync(vcpu, esr);
213b3d1ea1612c Marc Zyngier 2024-04-19  2197  			return;
213b3d1ea1612c Marc Zyngier 2024-04-19  2198  		}
213b3d1ea1612c Marc Zyngier 2024-04-19  2199  	}
213b3d1ea1612c Marc Zyngier 2024-04-19  2200  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2201  	preempt_disable();
47f3a2fc765ae2 Jintack Lim  2023-02-09  2202  	kvm_arch_vcpu_put(vcpu);
47f3a2fc765ae2 Jintack Lim  2023-02-09  2203  
dd0717a998f77f Marc Zyngier 2024-04-19  2204  	spsr = __vcpu_sys_reg(vcpu, SPSR_EL2);
dd0717a998f77f Marc Zyngier 2024-04-19  2205  	spsr = kvm_check_illegal_exception_return(vcpu, spsr);
213b3d1ea1612c Marc Zyngier 2024-04-19  2206  	if (!esr_iss_is_eretax(esr))
47f3a2fc765ae2 Jintack Lim  2023-02-09  2207  		elr = __vcpu_sys_reg(vcpu, ELR_EL2);
47f3a2fc765ae2 Jintack Lim  2023-02-09  2208  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2209  	trace_kvm_nested_eret(vcpu, elr, spsr);
47f3a2fc765ae2 Jintack Lim  2023-02-09  2210  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2211  	/*
47f3a2fc765ae2 Jintack Lim  2023-02-09  2212  	 * Note that the current exception level is always the virtual EL2,
47f3a2fc765ae2 Jintack Lim  2023-02-09  2213  	 * since we set HCR_EL2.NV bit only when entering the virtual EL2.
47f3a2fc765ae2 Jintack Lim  2023-02-09  2214  	 */
47f3a2fc765ae2 Jintack Lim  2023-02-09  2215  	*vcpu_pc(vcpu) = elr;
47f3a2fc765ae2 Jintack Lim  2023-02-09  2216  	*vcpu_cpsr(vcpu) = spsr;
47f3a2fc765ae2 Jintack Lim  2023-02-09  2217  
47f3a2fc765ae2 Jintack Lim  2023-02-09  2218  	kvm_arch_vcpu_load(vcpu, smp_processor_id());
47f3a2fc765ae2 Jintack Lim  2023-02-09  2219  	preempt_enable();
47f3a2fc765ae2 Jintack Lim  2023-02-09  2220  }
47f3a2fc765ae2 Jintack Lim  2023-02-09  2221  

:::::: The code at line 2186 was first introduced by commit
:::::: 213b3d1ea1612c6d26153be446923831c4534689 KVM: arm64: nv: Handle ERETA[AB] instructions

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
