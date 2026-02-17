Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1529AB02;
	Tue, 17 Feb 2026 20:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771360749; cv=none; b=Q48Rnh4TzFAVECqPEQtxLBwjMsbzoA2Lz0oNGSQ0HY3C0KSqdpgoHNxRUmkl6bw1kUuE9Oe19fZkY+vucLDUbvwrz94DtTjgv5uXp3d/K7yBH0WhZm7VtPGavjB3nNi8CdXjhZatYHbILQAKPpyZ4MTfrkPjwDAoynsTYlXZZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771360749; c=relaxed/simple;
	bh=5O+CrVpw/OJxasjNeiivYlHQmAH0l3hc7P8LOAiBQ68=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S90M6w1IlKFNznKSseWaWwy91OCwimD3LpUXE1gEbRk/hGAnYJF6YQJj29suMgoFg7UVJxjY9s/5RBWVh13rIW9fxCyNiML8cTKA43BGVLMpcVDm620Wy3Ig0LZqW+Axqtt34OGd648FBb6atkIggUSCjPrX+I7T0DVyFhgN+wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWOltdMo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWOltdMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771360747; x=1802896747;
  h=date:from:to:cc:subject:message-id;
  bh=5O+CrVpw/OJxasjNeiivYlHQmAH0l3hc7P8LOAiBQ68=;
  b=kWOltdMo7h8+qQDwDwBfKQoPbOvS3AhvxPTn/s4pcbsvTpOqhwuAOimE
   nOtdZlGg6/4QXFUN9JLeQl9CZlBjPxlDdvqDFBGsXyNZfF+OzFX2ldUI2
   WHqaPdPXd+SDlQscgwBmTMYSo8tUuAkDKyYNlk009swFOPITwMi8Xh7rV
   +ccH0QIvObJOmR5uxEmMNDjE987KLBPnLgZEWkQFjjk84S71MHdGfEWKh
   blP8O3qQaSFuMj0uNIwkhT3Lt43w5dMy6TRdrNpFP7f3GAZFyFcPfLvnD
   /N2Vzvh49LZmEqLj9QNMb+5T1kiOjE53AGGgvy0bZVg8LtSoOVSawSOuB
   w==;
X-CSE-ConnectionGUID: S9MGNv4yRUqNCt3UzqU/JA==
X-CSE-MsgGUID: Wsh0hu3ZQIaoTIIfXQHdUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83802866"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="83802866"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 12:39:06 -0800
X-CSE-ConnectionGUID: quisTjEIRH6hemtwEgWo1g==
X-CSE-MsgGUID: Es1+uHPITFmjvY1/cCFe5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213229905"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Feb 2026 12:39:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsRqY-000000011O4-2xgS;
	Tue, 17 Feb 2026 20:39:02 +0000
Date: Wed, 18 Feb 2026 04:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 27/41]
 arch/hexagon/kernel/devtree.c:50:4: error: incompatible integer to pointer
 conversion assigning to 'const char *' from 'int'
Message-ID: <202602180422.VWKS69zM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   62702f080dc2ac995b8515a4e564fac852471147
commit: dd59a24d47331a5c7830b9e105e7986be52b9b07 [27/41] hexagon: add SM8150 platform support
config: hexagon-randconfig-001-20260217 (https://download.01.org/0day-ci/archive/20260218/202602180422.VWKS69zM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180422.VWKS69zM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180422.VWKS69zM-lkp@intel.com/

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
>> arch/hexagon/kernel/devtree.c:50:4: error: incompatible integer to pointer conversion assigning to 'const char *' from 'int' [-Wint-conversion]
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
   include/linux/compiler_types.h:126:34: note: expanded from macro '__cold'
     126 | #define __cold                          __attribute__((__cold__))
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


vim +50 arch/hexagon/kernel/devtree.c

af91d653d17fcf Richard Kuo 2025-08-18  33  
af91d653d17fcf Richard Kuo 2025-08-18  34  //  basically a copy of dt_scan_chosen, but doesn't do the initrd scan.
af91d653d17fcf Richard Kuo 2025-08-18  35  static int __init early_init_dt_scan_chosen_noinitrd(unsigned long node, const char *uname,
af91d653d17fcf Richard Kuo 2025-08-18  36  				     int depth, void *data)
af91d653d17fcf Richard Kuo 2025-08-18  37  {
dd59a24d47331a Richard Kuo 2025-08-26  38  	int l;
dd59a24d47331a Richard Kuo 2025-08-26  39  	const char *p;
af91d653d17fcf Richard Kuo 2025-08-18  40  
af91d653d17fcf Richard Kuo 2025-08-18  41  	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
af91d653d17fcf Richard Kuo 2025-08-18  42  
af91d653d17fcf Richard Kuo 2025-08-18  43  	if (depth != 1 || !data ||
af91d653d17fcf Richard Kuo 2025-08-18  44  	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
af91d653d17fcf Richard Kuo 2025-08-18  45  		return 0;
af91d653d17fcf Richard Kuo 2025-08-18  46  
af91d653d17fcf Richard Kuo 2025-08-18  47  	//early_init_dt_check_for_initrd(node);
af91d653d17fcf Richard Kuo 2025-08-18  48  
af91d653d17fcf Richard Kuo 2025-08-18  49  	/* Retrieve command line */
af91d653d17fcf Richard Kuo 2025-08-18 @50  	p = of_get_flat_dt_prop(node, "bootargs", &l);
af91d653d17fcf Richard Kuo 2025-08-18  51  	if (p != NULL && l > 0)
af91d653d17fcf Richard Kuo 2025-08-18  52  		strscpy(data, p, min((int)l, COMMAND_LINE_SIZE));
af91d653d17fcf Richard Kuo 2025-08-18  53  
af91d653d17fcf Richard Kuo 2025-08-18  54  	/*
af91d653d17fcf Richard Kuo 2025-08-18  55  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
af91d653d17fcf Richard Kuo 2025-08-18  56  	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
af91d653d17fcf Richard Kuo 2025-08-18  57  	 * is set in which case we override whatever was found earlier.
af91d653d17fcf Richard Kuo 2025-08-18  58  	 */
af91d653d17fcf Richard Kuo 2025-08-18  59  #ifdef CONFIG_CMDLINE
af91d653d17fcf Richard Kuo 2025-08-18  60  #ifndef CONFIG_CMDLINE_FORCE
af91d653d17fcf Richard Kuo 2025-08-18  61  	if (!((char *)data)[0])
af91d653d17fcf Richard Kuo 2025-08-18  62  #endif
af91d653d17fcf Richard Kuo 2025-08-18  63  		strscpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
af91d653d17fcf Richard Kuo 2025-08-18  64  #endif /* CONFIG_CMDLINE */
af91d653d17fcf Richard Kuo 2025-08-18  65  
af91d653d17fcf Richard Kuo 2025-08-18  66  	pr_debug("Command line is: %s\n", (char*)data);
af91d653d17fcf Richard Kuo 2025-08-18  67  
af91d653d17fcf Richard Kuo 2025-08-18  68  	/* break now */
af91d653d17fcf Richard Kuo 2025-08-18  69  	return 1;
af91d653d17fcf Richard Kuo 2025-08-18  70  }
af91d653d17fcf Richard Kuo 2025-08-18  71  

:::::: The code at line 50 was first introduced by commit
:::::: af91d653d17fcfa3a9cf14192d21c02f8a9295d3 hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
