Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0153F383A1;
	Mon,  8 Jul 2024 20:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720469790; cv=none; b=axJjXuO8RLK1R6RovPxQTsz8E1MVSW/p1AwYsZm34UparU2yenz7MsXLhw1ePLsuQIwxPXTiDD+xXlV0dyZe82v8R3fZrzKks3CV8LS/xrAk/oSRU9bs+x7LvCj/WyTkZqMYva7uqwZnVfxVRVAMZDqtmDTdnMf9/VmmRz9hUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720469790; c=relaxed/simple;
	bh=D7MSzBtksyzEzHld1Uj/aeTSTmrwtYg9MMVPgVBiHTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nENq2qxTU4YXjFOLFLFCiCf1Txehs1NLKLJxh0Y9neZ1K9qoHGhx0C7cK+JuqxSaHgdBs8fmKSXWEGX9rsu0IP/2Wzunrmne8meUgPzaGPDjwZcsMI0qR6/Rg0GJANT3jjTKCVu6VBPCxI8CzWMSozsZ+ockiWBheeppl2CkeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpUAQeAy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpUAQeAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720469790; x=1752005790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7MSzBtksyzEzHld1Uj/aeTSTmrwtYg9MMVPgVBiHTs=;
  b=OpUAQeAy/Ulu2zQHrZorCMAn9KXxJsGlJD/xNjs6elXqJKQYHRGgjK9Q
   vSzQ6TDsbcUDOsqgm3I7mgLJ8JL8JRkINJ1KveIbLZPVgrL6ZdcWLPmvE
   aW/K2WyMWFc4ff0YM6wqUGDfevRNaSDhIx78uCTNs5LsF4/JSwFVnzdhl
   cQ8kLdzGz8S0C+/CjbLIGGoLgL7PhVzZD8tE56XwLr48xJmax1IU1adwM
   rOkz1BJgnufZbklmMiSWFCBZmJqzi5qhUJVH6h1jQLnvHKWJGHOON+If4
   qAGd1Sb5/mf/mdQga7MSO2J5rpvgzUF22HM7833+c4NrN+XX2BHLtcoAP
   Q==;
X-CSE-ConnectionGUID: mej8f+rCTme8gD/lLoBRrA==
X-CSE-MsgGUID: 6aqh+UvmSTu2e3dz5k/CDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17797121"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="17797121"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 13:16:29 -0700
X-CSE-ConnectionGUID: Yv3M7AEoRxCJJp/0/J2LHA==
X-CSE-MsgGUID: 8PrfitQTTDqhYzEC6Xrsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="47701192"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2024 13:16:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQume-000W0U-0I;
	Mon, 08 Jul 2024 20:16:24 +0000
Date: Tue, 9 Jul 2024 04:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-fix-pkvm-sve-vl 5/5]
 arch/arm64/kvm/reset.c:55:29: error: call to undeclared function
 'sve_max_cpu_vl'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202407090403.VAerDWzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-fix-pkvm-sve-vl
head:   f56ea0fbdcb8321483246b871bea3dc6abdca327
commit: f56ea0fbdcb8321483246b871bea3dc6abdca327 [5/5] KVM: arm64: Avoid underallocating storage for host SVE state
config: arm64-randconfig-004-20240709 (https://download.01.org/0day-ci/archive/20240709/202407090403.VAerDWzY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090403.VAerDWzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090403.VAerDWzY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/reset.c:13:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2253:
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
>> arch/arm64/kvm/reset.c:55:29: error: call to undeclared function 'sve_max_cpu_vl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |                 kvm_host_sve_max_cpu_vl = sve_max_cpu_vl();
         |                                           ^
   arch/arm64/kvm/reset.c:55:29: note: did you mean 'sve_max_vl'?
   arch/arm64/include/asm/fpsimd.h:339:19: note: 'sve_max_vl' declared here
     339 | static inline int sve_max_vl(void)
         |                   ^
   5 warnings and 1 error generated.


vim +/sve_max_cpu_vl +55 arch/arm64/kvm/reset.c

    50	
    51	int __init kvm_arm_init_sve(void)
    52	{
    53		if (system_supports_sve()) {
    54			kvm_sve_max_vl = sve_max_virtualisable_vl();
  > 55			kvm_host_sve_max_cpu_vl = sve_max_cpu_vl();
    56			kvm_nvhe_sym(kvm_host_sve_max_cpu_vl) = kvm_host_sve_max_cpu_vl;
    57	
    58			/*
    59			 * The get_sve_reg()/set_sve_reg() ioctl interface will need
    60			 * to be extended with multiple register slice support in
    61			 * order to support vector lengths greater than
    62			 * VL_ARCH_MAX:
    63			 */
    64			if (WARN_ON(kvm_sve_max_vl > VL_ARCH_MAX))
    65				kvm_sve_max_vl = VL_ARCH_MAX;
    66	
    67			/*
    68			 * Don't even try to make use of vector lengths that
    69			 * aren't available on all CPUs, for now:
    70			 */
    71			if (kvm_sve_max_vl < sve_max_vl())
    72				pr_warn("KVM: SVE vector length for guests limited to %u bytes\n",
    73					kvm_sve_max_vl);
    74		}
    75	
    76		return 0;
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
