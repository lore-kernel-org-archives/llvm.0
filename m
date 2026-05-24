Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FF7378D9F;
	Sun, 24 May 2026 05:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779600693; cv=none; b=hvZnmQQBVqGP3ezGThFW5hmB/0NQkMYfucjLlsYguRxliuHqvDBz9HM7LRd0DpIfYMEbR6jFqTP04QfswLJAjMbs9j6oaEBeWRJIz9IVc5xwPMzsMZO2+eY9vnVLaFls9ZvU//KMpPHdgGPeMa1i4J3MNkLiizxrelKe7XgF0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779600693; c=relaxed/simple;
	bh=ZYB5vES0F37kouURX291LPwZaeOwix7eGcKTKiNCo6o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JI6AJc0wv+oa8Axzo+g6mGJI1NWkJZWNNVFMSkZfrAeNCpc8wtFdlegJ8A1uHtIyIcPwI0FDHRT5pODXEVWwBFUX183LYegKptVfR+ze2Q57kt5dp2CR8cRDKOmn1oGe7pv3zRs516gslNqWrUmFVcaIBxALSMFZDLhx8zMxRos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9jRGBWN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9jRGBWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779600690; x=1811136690;
  h=date:from:to:cc:subject:message-id;
  bh=ZYB5vES0F37kouURX291LPwZaeOwix7eGcKTKiNCo6o=;
  b=L9jRGBWNmy2ZjhSJOG1JyBbKL92rysx2cSKnRr9uifiyONCJroNEu+TO
   jtWv3U+puVFfdVSSDkx26/qDn4qol49+XnSv/Q9jebdBfkPTNX78phBpE
   FbIW1Hq9I434tlwkBlU+GpLLd8PdTLWzL1uNuD49ceVEouzrSd/Z1eVHL
   QeIVpbLSLTydMC0nxT4GbmpsxBUjyThot8yJSYYNHlisc1lhiUSgD8NvT
   fk0W9MPVM1lTN8Y6qzBgD9BCy9p4IWQSImBwlzTzyzOiQtvNbLb2Ip5ib
   4VDvlzD7PoeOwqeSoGU06lK2vzeoFwvrDL4k04DYjnJ6t1DUvFFEwILny
   g==;
X-CSE-ConnectionGUID: IL3U4RdLTZGG7iNLNOagGw==
X-CSE-MsgGUID: TDoTR1D1TiyPnTiy6QhuwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="103143091"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="103143091"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 22:31:29 -0700
X-CSE-ConnectionGUID: h1sy8anPT+CU0Q3HP2S0XA==
X-CSE-MsgGUID: S0eXwCHTRwqZeO9ZSQBiCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="245328392"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 May 2026 22:31:27 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR1Qq-000000000k1-21zN;
	Sun, 24 May 2026 05:31:24 +0000
Date: Sun, 24 May 2026 13:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 26/40]
 arch/hexagon/kernel/devtree.c:104:36: error: redefinition of
 'setup_machine_fdt'
Message-ID: <202605241307.NwynCYH0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   35eb04372bf7b3ef31afcde7c3336a0ff690d16c
commit: 98906545ee66c4cb0c11b298cbcc1cbf77eec189 [26/40] hexagon: add memory management enhancements
config: hexagon-randconfig-001-20260524 (https://download.01.org/0day-ci/archive/20260524/202605241307.NwynCYH0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241307.NwynCYH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605241307.NwynCYH0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/hexagon/kernel/devtree.c:17:13: warning: no previous prototype for function 'early_init_dt_add_memory_arch' [-Wmissing-prototypes]
      17 | void __init early_init_dt_add_memory_arch(u64 base, u64 size)
         |             ^
   arch/hexagon/kernel/devtree.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      17 | void __init early_init_dt_add_memory_arch(u64 base, u64 size)
         | ^
         | static 
   arch/hexagon/kernel/devtree.c:50:6: error: call to undeclared function 'of_get_flat_dt_prop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      50 |         p = of_get_flat_dt_prop(node, "bootargs", &l);
         |             ^
   arch/hexagon/kernel/devtree.c:50:4: error: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
      50 |         p = of_get_flat_dt_prop(node, "bootargs", &l);
         |           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/kernel/devtree.c:104:29: warning: attribute declaration must precede definition [-Wignored-attributes]
     104 | const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
         |                             ^
   include/linux/init.h:45:17: note: expanded from macro '__init'
      45 | #define __init          __section(".init.text") __cold __latent_entropy \
         |                         ^
   include/linux/compiler_attributes.h:321:56: note: expanded from macro '__section'
     321 | #define __section(section)              __attribute__((__section__(section)))
         |                                                        ^
   arch/hexagon/include/asm/prom.h:14:42: note: previous definition is here
      14 | static inline const struct machine_desc *setup_machine_fdt(void *dt_phys)
         |                                          ^
   arch/hexagon/kernel/devtree.c:104:29: warning: attribute declaration must precede definition [-Wignored-attributes]
     104 | const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
         |                             ^
   include/linux/init.h:45:41: note: expanded from macro '__init'
      45 | #define __init          __section(".init.text") __cold __latent_entropy \
         |                                                 ^
   include/linux/compiler_types.h:112:34: note: expanded from macro '__cold'
     112 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   arch/hexagon/include/asm/prom.h:14:42: note: previous definition is here
      14 | static inline const struct machine_desc *setup_machine_fdt(void *dt_phys)
         |                                          ^
>> arch/hexagon/kernel/devtree.c:104:36: error: redefinition of 'setup_machine_fdt'
     104 | const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
         |                                    ^
   arch/hexagon/include/asm/prom.h:14:42: note: previous definition is here
      14 | static inline const struct machine_desc *setup_machine_fdt(void *dt_phys)
         |                                          ^
>> arch/hexagon/kernel/devtree.c:120:2: error: use of undeclared identifier 'initial_boot_params'
     120 |         initial_boot_params = dt_phys;
         |         ^~~~~~~~~~~~~~~~~~~
   arch/hexagon/kernel/devtree.c:126:23: error: use of undeclared identifier 'initial_boot_params'
     126 |         if (fdt_magic(initial_boot_params) != OF_DT_HEADER) {
         |                       ^~~~~~~~~~~~~~~~~~~
>> arch/hexagon/kernel/devtree.c:130:12: error: call to undeclared function 'of_get_flat_dt_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |         dt_root = of_get_flat_dt_root();
         |                   ^
>> arch/hexagon/kernel/devtree.c:132:15: error: call to undeclared function 'of_flat_dt_match_machine'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     132 |         mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
         |                      ^
>> arch/hexagon/kernel/devtree.c:132:13: error: incompatible integer to pointer conversion assigning to 'const struct machine_desc *' from 'int' [-Wint-conversion]
     132 |         mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/hexagon/kernel/devtree.c:142:9: error: call to undeclared function 'early_init_dt_scan_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     142 |         early_init_dt_scan_root();
         |         ^
>> arch/hexagon/kernel/devtree.c:147:2: error: call to undeclared function 'early_init_dt_scan_chosen'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     147 |         early_init_dt_scan_chosen(boot_command_line);
         |         ^
   3 warnings and 10 errors generated.


vim +/setup_machine_fdt +104 arch/hexagon/kernel/devtree.c

ecd4f0c0ace008 Brian Cain  2026-01-24   89  
92ffe54f0f99ec Richard Kuo 2025-08-18   90  /*
92ffe54f0f99ec Richard Kuo 2025-08-18   91   * setup_machine_fdt - set up machine based on dtb passed to kernel
92ffe54f0f99ec Richard Kuo 2025-08-18   92   * @dt_phys: physical address of dtb
92ffe54f0f99ec Richard Kuo 2025-08-18   93   *
92ffe54f0f99ec Richard Kuo 2025-08-18   94   * Sets up some of the earliest stuff -- setting the machine type,
92ffe54f0f99ec Richard Kuo 2025-08-18   95   * pulling the command line options, and finding the memory.
92ffe54f0f99ec Richard Kuo 2025-08-18   96   *
92ffe54f0f99ec Richard Kuo 2025-08-18   97   * Since we're calling this from setup_arch, this is going to happen
92ffe54f0f99ec Richard Kuo 2025-08-18   98   * very, very early.  Prior to even the bootmem being set up in the
92ffe54f0f99ec Richard Kuo 2025-08-18   99   * old scheme I think.
92ffe54f0f99ec Richard Kuo 2025-08-18  100   *
92ffe54f0f99ec Richard Kuo 2025-08-18  101   * Also since we're always being fired up by the hypervisor, then
92ffe54f0f99ec Richard Kuo 2025-08-18  102   * we are already running with the MMU on with an init segtable.
92ffe54f0f99ec Richard Kuo 2025-08-18  103   */
ecd4f0c0ace008 Brian Cain  2026-01-24 @104  const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
92ffe54f0f99ec Richard Kuo 2025-08-18  105  {
ecd4f0c0ace008 Brian Cain  2026-01-24  106  	const struct machine_desc *mdesc_best = NULL;
92ffe54f0f99ec Richard Kuo 2025-08-18  107  	unsigned long dt_root;
92ffe54f0f99ec Richard Kuo 2025-08-18  108  
92ffe54f0f99ec Richard Kuo 2025-08-18  109  #ifdef CONFIG_HEXAGON_MSM8974_FLUID
92ffe54f0f99ec Richard Kuo 2025-08-18  110  	//  Fixme:  use this for...  everybody if possible
92ffe54f0f99ec Richard Kuo 2025-08-18  111  	//  The "tags" struct or whatever provided by LK; currently stuffing it in the "external buffer" space.
92ffe54f0f99ec Richard Kuo 2025-08-18  112  	initial_boot_params = (void *) &external_buffer;
92ffe54f0f99ec Richard Kuo 2025-08-18  113  	dt_root = of_get_flat_dt_root();
92ffe54f0f99ec Richard Kuo 2025-08-18  114  	of_scan_flat_dt(early_init_dt_scan_chosen_noinitrd, boot_command_line);
92ffe54f0f99ec Richard Kuo 2025-08-18  115  #endif
92ffe54f0f99ec Richard Kuo 2025-08-18  116  
92ffe54f0f99ec Richard Kuo 2025-08-18  117  	/*  reset global pointer that devtree uses to the proper blob  */
92ffe54f0f99ec Richard Kuo 2025-08-18  118  #ifdef CONFIG_DTB_BUILTIN
92ffe54f0f99ec Richard Kuo 2025-08-18  119  	/*  This is the label placed on the assembly blob; will already be in virtual space  */
92ffe54f0f99ec Richard Kuo 2025-08-18 @120  	initial_boot_params = dt_phys;
92ffe54f0f99ec Richard Kuo 2025-08-18  121  #else
92ffe54f0f99ec Richard Kuo 2025-08-18  122          initial_boot_params = phys_to_virt(dt_phys);
92ffe54f0f99ec Richard Kuo 2025-08-18  123  #endif
92ffe54f0f99ec Richard Kuo 2025-08-18  124  
92ffe54f0f99ec Richard Kuo 2025-08-18  125          /* check device tree validity */
92ffe54f0f99ec Richard Kuo 2025-08-18  126          if (fdt_magic(initial_boot_params) != OF_DT_HEADER) {
92ffe54f0f99ec Richard Kuo 2025-08-18  127                  return NULL;
92ffe54f0f99ec Richard Kuo 2025-08-18  128  	}
92ffe54f0f99ec Richard Kuo 2025-08-18  129  
92ffe54f0f99ec Richard Kuo 2025-08-18 @130  	dt_root = of_get_flat_dt_root();
92ffe54f0f99ec Richard Kuo 2025-08-18  131  
ecd4f0c0ace008 Brian Cain  2026-01-24 @132  	mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
92ffe54f0f99ec Richard Kuo 2025-08-18  133  
92ffe54f0f99ec Richard Kuo 2025-08-18  134  	if (!mdesc_best) {
92ffe54f0f99ec Richard Kuo 2025-08-18  135  		panic("Unrecognized device tree\n");
92ffe54f0f99ec Richard Kuo 2025-08-18  136  	}
92ffe54f0f99ec Richard Kuo 2025-08-18  137  
92ffe54f0f99ec Richard Kuo 2025-08-18  138          /*
92ffe54f0f99ec Richard Kuo 2025-08-18  139  	 * Sets the top level address and size cells which are stored
92ffe54f0f99ec Richard Kuo 2025-08-18  140  	 * in globals by the devtree infrastructure.
92ffe54f0f99ec Richard Kuo 2025-08-18  141  	 */
92ffe54f0f99ec Richard Kuo 2025-08-18 @142          early_init_dt_scan_root();
92ffe54f0f99ec Richard Kuo 2025-08-18  143  
92ffe54f0f99ec Richard Kuo 2025-08-18  144          /*  Retrieve various information from the /chosen node  */
92ffe54f0f99ec Richard Kuo 2025-08-18  145  #ifndef CONFIG_HEXAGON_MSM8974_FLUID
92ffe54f0f99ec Richard Kuo 2025-08-18  146  	//  Fixme:  do this consistently for platforms
92ffe54f0f99ec Richard Kuo 2025-08-18 @147  	early_init_dt_scan_chosen(boot_command_line);
92ffe54f0f99ec Richard Kuo 2025-08-18  148  #endif
92ffe54f0f99ec Richard Kuo 2025-08-18  149          /*  Setup memory  */
92ffe54f0f99ec Richard Kuo 2025-08-18  150  	//of_scan_flat_dt(early_init_dt_scan_memory, NULL);
92ffe54f0f99ec Richard Kuo 2025-08-18  151  
92ffe54f0f99ec Richard Kuo 2025-08-18  152  	return mdesc_best;
92ffe54f0f99ec Richard Kuo 2025-08-18  153  }
92ffe54f0f99ec Richard Kuo 2025-08-18  154  

:::::: The code at line 104 was first introduced by commit
:::::: ecd4f0c0ace00832a1e9ba51a7511117d37f5cb3 arch/hexagon: fix kernel crash on unimplemented syscalls

:::::: TO: Brian Cain <brian.cain@oss.qualcomm.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
