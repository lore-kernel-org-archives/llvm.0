Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14902CCB9;
	Sun, 24 May 2026 00:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779583388; cv=none; b=CTAEcqvUdVglYWxzGv6mw0ySUEVFLR/aeVRt0d+zVdBx9m6ufFvmS3VrCD3zfMvG45o9ysQH39D+sla8thK1LowRdPsPrCITaEql3hP01c0bSwsXYCSP49uTv3MGD4OVCChR5c9IrlK6eREQ13QtPFe39Czs5FDbbDCfsMKqjpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779583388; c=relaxed/simple;
	bh=sjjHbte3eiz4moBHWiBbxv1YP40LKcIdx3yYpzZN3g4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Km8HoOEygYcPEk5mh+GW4Bcqm/HIkL+47aFa3yoGBKkRemxP8f2IeKQThrgAHkBMrch304n84hZH34e/d7rSPoWVk0cVeArKSkSZ/YqhX4C2lfSYGNnNGXK/JHWnIurFKsB6xNaBBwOpw2FezaIu59344/PInteAh/5KQfqhFsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KW3uFkhn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KW3uFkhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779583386; x=1811119386;
  h=date:from:to:cc:subject:message-id;
  bh=sjjHbte3eiz4moBHWiBbxv1YP40LKcIdx3yYpzZN3g4=;
  b=KW3uFkhnKc2jadn6L4LbpqjxhvpvtkiraaGIxBU+lcUkEMKh2Nna3aoT
   R82u0XPcM4F718WDc04IckXe2M96YnA5Jm17M1E367TgHx4bBT45EPTL0
   X4VZ1Q9yzgPajUXpH1kqMu2CaDF0/JNc1NVR6W+oONok8nIlwjQgcQ0M2
   rLnUXak5uWJnmIq4ui/g7gjA0tdvt6O/aSQZIpusRzWyxT6XLogXC17Br
   tFvTch4NfmM+GiR2myIiqSjb0/lRUCAAQcHeFRm3oAch3xrhYRenj8txH
   H+k0zdYaLEfR2mBAdzv17rNb8jNVmtEsFkHcubDj/iAfE12wsLVRfW0+G
   A==;
X-CSE-ConnectionGUID: BIad1p0PTtu9ffDpQ6eWRg==
X-CSE-MsgGUID: DCwM3Q/PTDiQj/GJOoSoTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="98034350"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="98034350"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 17:43:05 -0700
X-CSE-ConnectionGUID: MwzvTACHQZS4nxYkgZvKyA==
X-CSE-MsgGUID: ZqQGWk/yRZqmKI70tscwkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="245533735"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2026 17:43:04 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQwvl-000000000V5-0idu;
	Sun, 24 May 2026 00:43:01 +0000
Date: Sun, 24 May 2026 08:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 17/40]
 arch/hexagon/kernel/setup.c:50:15: error: use of undeclared identifier
 '__dtb_start'; did you mean '__bss_start'?
Message-ID: <202605240825.mlcuRxza-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   35eb04372bf7b3ef31afcde7c3336a0ff690d16c
commit: 069f8d84bd3fe3a24e07fbf9de23de4537d60c29 [17/40] hexagon: add platform infrastructure
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260524/202605240825.mlcuRxza-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240825.mlcuRxza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240825.mlcuRxza-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/setup.c:22:
   arch/hexagon/include/asm/platform.h:29:13: error: conflicting types for 'early_memtest'
      29 | extern void early_memtest(unsigned long start, unsigned long end);
         |             ^
   include/linux/memblock.h:609:20: note: previous definition is here
     609 | static inline void early_memtest(phys_addr_t start, phys_addr_t end) { }
         |                    ^
   arch/hexagon/kernel/setup.c:49:13: error: use of undeclared identifier 'external_buffer'
      49 |         char *p = &external_buffer;
         |                    ^~~~~~~~~~~~~~~
>> arch/hexagon/kernel/setup.c:50:15: error: use of undeclared identifier '__dtb_start'; did you mean '__bss_start'?
      50 |         void *dtb = &__dtb_start;
         |                      ^~~~~~~~~~~
         |                      __bss_start
   include/asm-generic/sections.h:37:13: note: '__bss_start' declared here
      37 | extern char __bss_start[], __bss_stop[];
         |             ^
   3 errors generated.


vim +50 arch/hexagon/kernel/setup.c

e03167b26b7fcf Richard Kuo  2011-10-31  41  
e03167b26b7fcf Richard Kuo  2011-10-31  42  /*
e03167b26b7fcf Richard Kuo  2011-10-31  43   * setup_arch -  high level architectural setup routine
e03167b26b7fcf Richard Kuo  2011-10-31  44   * @cmdline_p: pointer to pointer to command-line arguments
e03167b26b7fcf Richard Kuo  2011-10-31  45   */
e03167b26b7fcf Richard Kuo  2011-10-31  46  
e03167b26b7fcf Richard Kuo  2011-10-31  47  void __init setup_arch(char **cmdline_p)
e03167b26b7fcf Richard Kuo  2011-10-31  48  {
af437bfe6b48c6 Brian Cain   2026-01-24 @49  	char *p = &external_buffer;
af437bfe6b48c6 Brian Cain   2026-01-24 @50  	void *dtb = &__dtb_start;
e03167b26b7fcf Richard Kuo  2011-10-31  51  
e03167b26b7fcf Richard Kuo  2011-10-31  52  	/*
e03167b26b7fcf Richard Kuo  2011-10-31  53  	 * Set up event bindings to handle exceptions and interrupts.
e03167b26b7fcf Richard Kuo  2011-10-31  54  	 */
e03167b26b7fcf Richard Kuo  2011-10-31  55  	__vmsetvec(_K_VM_event_vector);
e03167b26b7fcf Richard Kuo  2011-10-31  56  
2738f359b1dcae Randy Dunlap 2018-06-14  57  	printk(KERN_INFO "PHYS_OFFSET=0x%08lx\n", PHYS_OFFSET);
af437bfe6b48c6 Brian Cain   2026-01-24  58  	/*  initial machine setup from flattened device tree  */
af437bfe6b48c6 Brian Cain   2026-01-24  59  	mdesc = setup_machine_fdt(dtb);
af437bfe6b48c6 Brian Cain   2026-01-24  60  
af437bfe6b48c6 Brian Cain   2026-01-24  61  	if (!mdesc)
af437bfe6b48c6 Brian Cain   2026-01-24  62  		panic("setup_machine_fdt returned NULL\n");
8f5a0b9dffeb3c Richard Kuo  2013-03-22  63  
af437bfe6b48c6 Brian Cain   2026-01-24  64  	if (mdesc->setup_arch_platform) {
af437bfe6b48c6 Brian Cain   2026-01-24  65  		mdesc->setup_arch_platform();
af437bfe6b48c6 Brian Cain   2026-01-24  66  	}
af437bfe6b48c6 Brian Cain   2026-01-24  67  
af437bfe6b48c6 Brian Cain   2026-01-24  68  	printk("vmversion=0x%08lx\n", vmversion);
af437bfe6b48c6 Brian Cain   2026-01-24  69  	printk("vm build id=0x%08lx\n", __vmgetinfo(vm_info_build_id));
af437bfe6b48c6 Brian Cain   2026-01-24  70  	printk("boot_info=%p\n", boot_info);
e03167b26b7fcf Richard Kuo  2011-10-31  71  	/*
af437bfe6b48c6 Brian Cain   2026-01-24  72  	 * Will need to work on boot specification.
e03167b26b7fcf Richard Kuo  2011-10-31  73  	 */
af437bfe6b48c6 Brian Cain   2026-01-24  74  	//  Todo:  seriously need to fix this for all platforms
af437bfe6b48c6 Brian Cain   2026-01-24  75  #ifdef CONFIG_HEXAGON_MSM8960_FLUID
af437bfe6b48c6 Brian Cain   2026-01-24  76  	{
af437bfe6b48c6 Brian Cain   2026-01-24  77  		unsigned int *magic;
af437bfe6b48c6 Brian Cain   2026-01-24  78  
af437bfe6b48c6 Brian Cain   2026-01-24  79  		p = NULL;
af437bfe6b48c6 Brian Cain   2026-01-24  80  		for (magic = (unsigned int *)&external_buffer;
af437bfe6b48c6 Brian Cain   2026-01-24  81  		     magic < ((unsigned int *)&external_buffer) + 32; magic++) {
af437bfe6b48c6 Brian Cain   2026-01-24  82  			if (*magic == 0x54410009) {
af437bfe6b48c6 Brian Cain   2026-01-24  83  				p = (char *)++magic;
af437bfe6b48c6 Brian Cain   2026-01-24  84  				break;
af437bfe6b48c6 Brian Cain   2026-01-24  85  			}
af437bfe6b48c6 Brian Cain   2026-01-24  86  		}
af437bfe6b48c6 Brian Cain   2026-01-24  87  	}
af437bfe6b48c6 Brian Cain   2026-01-24  88  #endif
e03167b26b7fcf Richard Kuo  2011-10-31  89  

:::::: The code at line 50 was first introduced by commit
:::::: af437bfe6b48c6b7436b42f989f7eeb4afc5cfbc hexagon: update boot and setup code

:::::: TO: Brian Cain <brian.cain@oss.qualcomm.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
