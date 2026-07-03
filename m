Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1FB31F99B;
	Fri,  3 Jul 2026 19:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106959; cv=none; b=d3vz7Ob6SqEhZ7EaOJlGggLL45rWz2k0g28AcTsbten0Xi94MpC6ZVmTW+FMTbRmxizXLtdqu5IsbBx42BHMczQIjbWsdyhtk0uftScgUzReYe6Oc0MdGXqUDJbG+cMLn3s6N5WypovPX0cM5Tae4ULRBwTkxtx+bYX/1+Py5/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106959; c=relaxed/simple;
	bh=vTaR1g6T54cJDkpvbKKj9PFUPzFjn1HFzLQ8f7+7YBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t+P6qTPNU9z6UCk8rWFoWrBoscJOtofHBZ1ZAmmXwZVIK1LTOUanQQKwGTzR+UgC7lnQ4KhjZmQ0Q9DthqLSmSzsv39wVBUjrDcIN2O+k9/hF1VDveto/uF7XFyIvO1vFb/SSDFM7GLjIfhkGNCFQ4QwpEAe++PXAGZx7N76oTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXWXTXrc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXWXTXrc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783106956; x=1814642956;
  h=date:from:to:cc:subject:message-id;
  bh=vTaR1g6T54cJDkpvbKKj9PFUPzFjn1HFzLQ8f7+7YBU=;
  b=jXWXTXrc8GhMZbVQNAdCxiLefiTfiRjhX7veOoXJYuFXOiOGNILOr8FT
   YdXhFgmjYpM3ASodVUqhTRbTdrCMOBuHbJEkpDweQJycBPMntoYYvU/RM
   6toH31H5bpDmumy0d/2VtOE83Zwccv1MwIXnZ8+DpUnkRaogRijqHByhZ
   TJubt7JbWUrlT+kvtWp8C7xxZs42BuzuZfOYm2dFnOnzJ2Vzpxoe9nav/
   M2xvjLlU9KiSf48hWuvhpYYUbrW2fW5aAC7rKSuHgynomv5rxoBxg+HZw
   5lFh0WFvuCV8Viqzz4kbdr+Wv0JDfmVXEi2CUzVJl7VbKAchfRu5JW1hc
   w==;
X-CSE-ConnectionGUID: 0Y1DW+jXSAiLSvQqs3MJuQ==
X-CSE-MsgGUID: ic+x51mRQfWJJe2cdKZZGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83728447"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83728447"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 12:29:16 -0700
X-CSE-ConnectionGUID: kDl1u6wHRp6xq8y/u5km4A==
X-CSE-MsgGUID: s9jKBi+JQEKI6B0nUQyp8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="249199102"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jul 2026 12:29:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfjZY-00000000CSn-35CN;
	Fri, 03 Jul 2026 19:29:12 +0000
Date: Sat, 04 Jul 2026 03:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 26/62]
 arch/hexagon/kernel/devtree.c:104:36: error: redefinition of
 'setup_machine_fdt'
Message-ID: <202607040345.sN9KRMiW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   a74f943885b7a0e655c7c47d4d02f852c12c1ce1
commit: 5ff1ea15270dcaa04752f16f8a9b055a6b013c6f [26/62] hexagon: add memory management enhancements
config: hexagon-randconfig-001-20260703 (https://download.01.org/0day-ci/archive/20260704/202607040345.sN9KRMiW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040345.sN9KRMiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040345.sN9KRMiW-lkp@intel.com/

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
   arch/hexagon/kernel/devtree.c:130:12: error: call to undeclared function 'of_get_flat_dt_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |         dt_root = of_get_flat_dt_root();
         |                   ^
   arch/hexagon/kernel/devtree.c:132:15: error: call to undeclared function 'of_flat_dt_match_machine'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     132 |         mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
         |                      ^
   arch/hexagon/kernel/devtree.c:132:13: error: incompatible integer to pointer conversion assigning to 'const struct machine_desc *' from 'int' [-Wint-conversion]
     132 |         mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/kernel/devtree.c:142:9: error: call to undeclared function 'early_init_dt_scan_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     142 |         early_init_dt_scan_root();
         |         ^
   arch/hexagon/kernel/devtree.c:147:2: error: call to undeclared function 'early_init_dt_scan_chosen'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     147 |         early_init_dt_scan_chosen(boot_command_line);
         |         ^
   3 warnings and 10 errors generated.


vim +/setup_machine_fdt +104 arch/hexagon/kernel/devtree.c

91952c2b39cac1 Brian Cain  2026-01-24   89  
9f79ac50516cbd Richard Kuo 2025-08-18   90  /*
9f79ac50516cbd Richard Kuo 2025-08-18   91   * setup_machine_fdt - set up machine based on dtb passed to kernel
9f79ac50516cbd Richard Kuo 2025-08-18   92   * @dt_phys: physical address of dtb
9f79ac50516cbd Richard Kuo 2025-08-18   93   *
9f79ac50516cbd Richard Kuo 2025-08-18   94   * Sets up some of the earliest stuff -- setting the machine type,
9f79ac50516cbd Richard Kuo 2025-08-18   95   * pulling the command line options, and finding the memory.
9f79ac50516cbd Richard Kuo 2025-08-18   96   *
9f79ac50516cbd Richard Kuo 2025-08-18   97   * Since we're calling this from setup_arch, this is going to happen
9f79ac50516cbd Richard Kuo 2025-08-18   98   * very, very early.  Prior to even the bootmem being set up in the
9f79ac50516cbd Richard Kuo 2025-08-18   99   * old scheme I think.
9f79ac50516cbd Richard Kuo 2025-08-18  100   *
9f79ac50516cbd Richard Kuo 2025-08-18  101   * Also since we're always being fired up by the hypervisor, then
9f79ac50516cbd Richard Kuo 2025-08-18  102   * we are already running with the MMU on with an init segtable.
9f79ac50516cbd Richard Kuo 2025-08-18  103   */
91952c2b39cac1 Brian Cain  2026-01-24 @104  const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
9f79ac50516cbd Richard Kuo 2025-08-18  105  {
91952c2b39cac1 Brian Cain  2026-01-24  106  	const struct machine_desc *mdesc_best = NULL;
9f79ac50516cbd Richard Kuo 2025-08-18  107  	unsigned long dt_root;
9f79ac50516cbd Richard Kuo 2025-08-18  108  
9f79ac50516cbd Richard Kuo 2025-08-18  109  #ifdef CONFIG_HEXAGON_MSM8974_FLUID
9f79ac50516cbd Richard Kuo 2025-08-18  110  	//  Fixme:  use this for...  everybody if possible
9f79ac50516cbd Richard Kuo 2025-08-18  111  	//  The "tags" struct or whatever provided by LK; currently stuffing it in the "external buffer" space.
9f79ac50516cbd Richard Kuo 2025-08-18  112  	initial_boot_params = (void *) &external_buffer;
9f79ac50516cbd Richard Kuo 2025-08-18  113  	dt_root = of_get_flat_dt_root();
9f79ac50516cbd Richard Kuo 2025-08-18  114  	of_scan_flat_dt(early_init_dt_scan_chosen_noinitrd, boot_command_line);
9f79ac50516cbd Richard Kuo 2025-08-18  115  #endif
9f79ac50516cbd Richard Kuo 2025-08-18  116  
9f79ac50516cbd Richard Kuo 2025-08-18  117  	/*  reset global pointer that devtree uses to the proper blob  */
9f79ac50516cbd Richard Kuo 2025-08-18  118  #ifdef CONFIG_DTB_BUILTIN
9f79ac50516cbd Richard Kuo 2025-08-18  119  	/*  This is the label placed on the assembly blob; will already be in virtual space  */
9f79ac50516cbd Richard Kuo 2025-08-18 @120  	initial_boot_params = dt_phys;
9f79ac50516cbd Richard Kuo 2025-08-18  121  #else
9f79ac50516cbd Richard Kuo 2025-08-18  122          initial_boot_params = phys_to_virt(dt_phys);
9f79ac50516cbd Richard Kuo 2025-08-18  123  #endif
9f79ac50516cbd Richard Kuo 2025-08-18  124  
9f79ac50516cbd Richard Kuo 2025-08-18  125          /* check device tree validity */
9f79ac50516cbd Richard Kuo 2025-08-18  126          if (fdt_magic(initial_boot_params) != OF_DT_HEADER) {
9f79ac50516cbd Richard Kuo 2025-08-18  127                  return NULL;
9f79ac50516cbd Richard Kuo 2025-08-18  128  	}
9f79ac50516cbd Richard Kuo 2025-08-18  129  
9f79ac50516cbd Richard Kuo 2025-08-18  130  	dt_root = of_get_flat_dt_root();
9f79ac50516cbd Richard Kuo 2025-08-18  131  
91952c2b39cac1 Brian Cain  2026-01-24  132  	mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
9f79ac50516cbd Richard Kuo 2025-08-18  133  
9f79ac50516cbd Richard Kuo 2025-08-18  134  	if (!mdesc_best) {
9f79ac50516cbd Richard Kuo 2025-08-18  135  		panic("Unrecognized device tree\n");
9f79ac50516cbd Richard Kuo 2025-08-18  136  	}
9f79ac50516cbd Richard Kuo 2025-08-18  137  
9f79ac50516cbd Richard Kuo 2025-08-18  138          /*
9f79ac50516cbd Richard Kuo 2025-08-18  139  	 * Sets the top level address and size cells which are stored
9f79ac50516cbd Richard Kuo 2025-08-18  140  	 * in globals by the devtree infrastructure.
9f79ac50516cbd Richard Kuo 2025-08-18  141  	 */
9f79ac50516cbd Richard Kuo 2025-08-18  142          early_init_dt_scan_root();
9f79ac50516cbd Richard Kuo 2025-08-18  143  
9f79ac50516cbd Richard Kuo 2025-08-18  144          /*  Retrieve various information from the /chosen node  */
9f79ac50516cbd Richard Kuo 2025-08-18  145  #ifndef CONFIG_HEXAGON_MSM8974_FLUID
9f79ac50516cbd Richard Kuo 2025-08-18  146  	//  Fixme:  do this consistently for platforms
9f79ac50516cbd Richard Kuo 2025-08-18  147  	early_init_dt_scan_chosen(boot_command_line);
9f79ac50516cbd Richard Kuo 2025-08-18  148  #endif
9f79ac50516cbd Richard Kuo 2025-08-18  149          /*  Setup memory  */
9f79ac50516cbd Richard Kuo 2025-08-18  150  	//of_scan_flat_dt(early_init_dt_scan_memory, NULL);
9f79ac50516cbd Richard Kuo 2025-08-18  151  
9f79ac50516cbd Richard Kuo 2025-08-18  152  	return mdesc_best;
9f79ac50516cbd Richard Kuo 2025-08-18  153  }
9f79ac50516cbd Richard Kuo 2025-08-18  154  

:::::: The code at line 104 was first introduced by commit
:::::: 91952c2b39cac1067deaf43350d08ee44d08b2a9 arch/hexagon: fix kernel crash on unimplemented syscalls

:::::: TO: Brian Cain <brian.cain@oss.qualcomm.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
