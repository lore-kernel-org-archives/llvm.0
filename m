Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8903769FB;
	Wed,  3 Jun 2026 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477823; cv=none; b=HELGc8bKIVg2RPxqFTWtLYdhsuaUaWH4JbgIzmgZ/3vPs22w2j0IyqwHBGo6DrMJqCCTHFftmlTpMOGIyQWDNs8QN2jTLSPW8OitzmT2gyWSqxINFuPjyuyHBZJX74t/6HxWJ3VsLr8GEmrhazdNRxEFJscWx3eJof3ciRgjCqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477823; c=relaxed/simple;
	bh=7uVMp+rkLAMMMvbDOLzVLJn2Yfe3+lZVUUkFvRefRU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q1ivtc9drN1p6MfV9Vl2tiUpmEWKWltarS8v24w8L4hj3DsjONh8DMSvma/ggB5FRFju3nH6ywXblLMG0FrFxCvuGh+uyqHg8TVOA3mSAWZ3GZ0va/E8w2I6MfbV5DN544gsQ+s8J3G5ggroxLs2tcZ9gT+ZixufaKxWPP02pvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7FQqMxV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7FQqMxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477822; x=1812013822;
  h=date:from:to:cc:subject:message-id;
  bh=7uVMp+rkLAMMMvbDOLzVLJn2Yfe3+lZVUUkFvRefRU0=;
  b=K7FQqMxVHG0emQEysiF2mTZsCvCBAAYwccSIRbBWRQQH9OWSqab37XCK
   STOjzd8KlNHmf0FTy9mDHSQLPhszv39OHa1eQK49mtaxq6hN5hCnk2Qqt
   /3UFVrdjetf7PnsAg4Yqz57Bc66M6J/UMDLzqlRFG8mhTXHBCbrLfQi5T
   ZvxQIK1CjDpjrW6FiV1FDt10yckQAp2GQ4kh3V5YMV6C2QG7So1+LVKbP
   qFH8ltvS4RYBm+vnudQhx86lhv+WpeMr5nOMoDPGWD0pzBZm+QMOISvws
   XO5Az4MaF90xhu7P6osXpJESa4tLuIrMIZGGYjxFVTLRGM6ZGmIjOF3P5
   Q==;
X-CSE-ConnectionGUID: h259/7koT9WJmHQ3F6/WlQ==
X-CSE-MsgGUID: f4AMvUklS3iheKSvHiOhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657348"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657348"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:10:19 -0700
X-CSE-ConnectionGUID: EK/WG+hxTYaRsTJD198OvA==
X-CSE-MsgGUID: mZW82J2iTAWlw22eoYGQ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281356"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jun 2026 02:10:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUhc5-00000000DCc-42iU;
	Wed, 03 Jun 2026 09:10:13 +0000
Date: Wed, 03 Jun 2026 17:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 26/46]
 arch/hexagon/kernel/devtree.c:130:12: error: call to undeclared function
 'of_get_flat_dt_root'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202606031740.r9GxTwC0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Richard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   d99deb935033fad4dc63395a63498a77613df72a
commit: 98906545ee66c4cb0c11b298cbcc1cbf77eec189 [26/46] hexagon: add memory management enhancements
config: hexagon-randconfig-001-20260603 (https://download.01.org/0day-ci/archive/20260603/202606031740.r9GxTwC0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031740.r9GxTwC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031740.r9GxTwC0-lkp@intel.com/

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
   arch/hexagon/kernel/devtree.c:104:36: error: redefinition of 'setup_machine_fdt'
     104 | const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
         |                                    ^
   arch/hexagon/include/asm/prom.h:14:42: note: previous definition is here
      14 | static inline const struct machine_desc *setup_machine_fdt(void *dt_phys)
         |                                          ^
   arch/hexagon/kernel/devtree.c:120:2: error: use of undeclared identifier 'initial_boot_params'
     120 |         initial_boot_params = dt_phys;
         |         ^
   arch/hexagon/kernel/devtree.c:126:23: error: use of undeclared identifier 'initial_boot_params'
     126 |         if (fdt_magic(initial_boot_params) != OF_DT_HEADER) {
         |                       ^
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


vim +/of_get_flat_dt_root +130 arch/hexagon/kernel/devtree.c

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
92ffe54f0f99ec Richard Kuo 2025-08-18 @126          if (fdt_magic(initial_boot_params) != OF_DT_HEADER) {
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

:::::: The code at line 130 was first introduced by commit
:::::: 92ffe54f0f99ec61fbcf52c66862fb29d279ac9a hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
