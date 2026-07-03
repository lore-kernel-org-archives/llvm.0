Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B89F2F25F0;
	Fri,  3 Jul 2026 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097911; cv=none; b=IBV81Pq8w5qTYXgug1TBc5vVAy2F7BWUWP1O9OMkYU6+om3BjcPfUnBV48Oh3oPUE01HcSkJ684qLIm1GEe4TAR50nvzYAqUAjk6R98j33bPR2FknyJPOmZtc0Vre+xJJUcrnQZjDGTxsr547IljXE3UhHYF8gsJs1pICTT1NO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097911; c=relaxed/simple;
	bh=OFnLHOwIDZ+lhMdNjtv801RIdlBUJunx0NX6Yv7fOKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uegZL7xsOAWgr+nOqdwyHloREd5k6Tn/G1iaQ3zgYCDGB9QsBET0xGFTUbBtIbPxhw66Z1ED3Ui4Z6iAmLA+XtipvTkVH8VMEoGIBJDDJDbI4xPYjMS5aXXKtqb2MYNu/bBirxu4QB7ksj4WqD42i5b9MmMy19MFCgGvlY09JKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYcrbr4W; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYcrbr4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783097910; x=1814633910;
  h=date:from:to:cc:subject:message-id;
  bh=OFnLHOwIDZ+lhMdNjtv801RIdlBUJunx0NX6Yv7fOKI=;
  b=XYcrbr4WQwgD0aS9n0XD8jq0vtTRqHfQfcQUaMgLDCDac+mqclhJdAij
   SCpOzERPSo8eKPeKXmCi1R16odZGzhkUzSFal7jMVnU4120U9JrbSBck/
   AzLofaAhc27isFU9cK18nLa/ssVrJN0rYSkixNd6xbKuOnLKzRpK3vVjT
   N+AbTO84z4GcBPSib1ytOk8zgXp+5sEJ6OKBi6Zz9A2mK1pyZZwsjowMG
   A3HeeEs3ydHGZivNlKevO54A7pDWVSM6a3UYB3hDrruW03W3A8CSm6eWl
   e3r/SJnsxiYJ6HIxzvCYsZsexhDElL/nZ+c0BD5bW6WhYIYVnn69jya9H
   g==;
X-CSE-ConnectionGUID: sDt7Fq1+TveBLhUKOcySbw==
X-CSE-MsgGUID: Zy69QEjQRbS7LzslwxjJ6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="84042038"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="84042038"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 09:58:29 -0700
X-CSE-ConnectionGUID: LiZXUCSTTPS37mIoQE9x/Q==
X-CSE-MsgGUID: ni2Qx/6VSh23y5Pnv+kkig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="256726726"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Jul 2026 09:58:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfhDM-00000000CNn-3jNm;
	Fri, 03 Jul 2026 16:58:18 +0000
Date: Sat, 04 Jul 2026 00:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 26/62]
 arch/hexagon/kernel/devtree.c:104:29: warning: attribute declaration must
 precede definition
Message-ID: <202607040039.JdSxlFQS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   a74f943885b7a0e655c7c47d4d02f852c12c1ce1
commit: 5ff1ea15270dcaa04752f16f8a9b055a6b013c6f [26/62] hexagon: add memory management enhancements
config: hexagon-randconfig-001-20260703 (https://download.01.org/0day-ci/archive/20260704/202607040039.JdSxlFQS-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040039.JdSxlFQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040039.JdSxlFQS-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> arch/hexagon/kernel/devtree.c:104:29: warning: attribute declaration must precede definition [-Wignored-attributes]
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
>> arch/hexagon/kernel/devtree.c:104:29: warning: attribute declaration must precede definition [-Wignored-attributes]
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


vim +104 arch/hexagon/kernel/devtree.c

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

:::::: The code at line 104 was first introduced by commit
:::::: 91952c2b39cac1067deaf43350d08ee44d08b2a9 arch/hexagon: fix kernel crash on unimplemented syscalls

:::::: TO: Brian Cain <brian.cain@oss.qualcomm.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
