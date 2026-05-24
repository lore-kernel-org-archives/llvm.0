Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17C92AD37;
	Sun, 24 May 2026 01:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779587898; cv=none; b=sQVSQ1/xOcL1GLm49WImsH5u113En9uXTKU8RzbZB96P9s2RAD8J48DgyrpUdllnJh75E2NVTqjIqc++QIoSJag3k9SusPNpoWJCXHRJ3k12StCufSrkrSN9/be2XfcrodZ2U9oOsQb22On7qLvxMaIyXaFMA+DFvBvCN2kkLVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779587898; c=relaxed/simple;
	bh=s3E+P/nNsEa9/+HEjYl7vAEcLvD1V4X30jIWDniUaws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gxvEVyyPkCjHQEW4Mb3nchq61z2ldAIwdPRKfyEr+sBT91ZxJwau2ERJ+G0P90S7iQsIuXDOQEealH9GFl1al1G+5WcnGxXszSzkCqt3TmE1LSTTkrrzcPA8YudEY17+oRSnrqhlAYy8FOJH28TCkC8EHP7gObiIdtt//guhz08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2TkkRFe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2TkkRFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779587896; x=1811123896;
  h=date:from:to:cc:subject:message-id;
  bh=s3E+P/nNsEa9/+HEjYl7vAEcLvD1V4X30jIWDniUaws=;
  b=E2TkkRFe4V13UM/DZGbUFTR4+h2AEQanbW0n9ypL1T6H3zZtQ+IQlVjo
   YiJ92PBpMIzXiJA2yQjXpnCI/eN2pbAJ7E8JPUrEUkKrCXhVmTY+wK+/W
   vgckQ6AI7YQDlD7Poiad9xpt7tc7qbNsnf2xBls4haB6i70IgiK92yTPh
   sZwEJhpzyCiYtfe4LnkZ85vYCGnhlf2hH0s6wyCFQn4J80gbXe1Mb3lfu
   M02fcFNBLinY9e/GSvHxK6pKo5NOQA3a9KAbNmZ3ub0jaoRjJxenxzeq0
   7Cpw5XASh53Or2QmDjAxGrTg4Rf0fhPg+LmQWRu7l4UxZxGW/367xsXHt
   Q==;
X-CSE-ConnectionGUID: VTFo3WkiQoSLPwZ72TtCdA==
X-CSE-MsgGUID: Xgn7Ch+0SwKjyUkVo6Nenw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="97887874"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="97887874"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 18:58:16 -0700
X-CSE-ConnectionGUID: T7a/2H6nTRS1+az/jeeyMA==
X-CSE-MsgGUID: 4wX8/CYnTuuuduG9bW+O/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="238224585"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 May 2026 18:58:08 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQy6P-000000000ZV-277p;
	Sun, 24 May 2026 01:58:05 +0000
Date: Sun, 24 May 2026 09:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 26/40]
 arch/hexagon/kernel/devtree.c:17:13: warning: no previous prototype for
 function 'early_init_dt_add_memory_arch'
Message-ID: <202605240918.oN2siKkl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   35eb04372bf7b3ef31afcde7c3336a0ff690d16c
commit: 98906545ee66c4cb0c11b298cbcc1cbf77eec189 [26/40] hexagon: add memory management enhancements
config: hexagon-randconfig-001-20260524 (https://download.01.org/0day-ci/archive/20260524/202605240918.oN2siKkl-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240918.oN2siKkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240918.oN2siKkl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/hexagon/kernel/devtree.c:17:13: warning: no previous prototype for function 'early_init_dt_add_memory_arch' [-Wmissing-prototypes]
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


vim +/early_init_dt_add_memory_arch +17 arch/hexagon/kernel/devtree.c

92ffe54f0f99ec Richard Kuo 2025-08-18   15  
92ffe54f0f99ec Richard Kuo 2025-08-18   16  /*  called via early_init_dt_scan_memory?  */
92ffe54f0f99ec Richard Kuo 2025-08-18  @17  void __init early_init_dt_add_memory_arch(u64 base, u64 size)
92ffe54f0f99ec Richard Kuo 2025-08-18   18  {
92ffe54f0f99ec Richard Kuo 2025-08-18   19  	//  Cheesy solution is to just twiddle bootmem_lastpg
92ffe54f0f99ec Richard Kuo 2025-08-18   20  	BUG();  ///  XXX Todo fixme
92ffe54f0f99ec Richard Kuo 2025-08-18   21  }
92ffe54f0f99ec Richard Kuo 2025-08-18   22  
92ffe54f0f99ec Richard Kuo 2025-08-18   23  #ifdef CONFIG_BLK_DEV_INITRD
92ffe54f0f99ec Richard Kuo 2025-08-18   24  /*  Seems to be the implementation used by most archs  */
92ffe54f0f99ec Richard Kuo 2025-08-18   25  static void __init __maybe_unused early_init_dt_setup_initrd_arch(u64 start,
92ffe54f0f99ec Richard Kuo 2025-08-18   26  					    u64 end)
92ffe54f0f99ec Richard Kuo 2025-08-18   27  {
92ffe54f0f99ec Richard Kuo 2025-08-18   28  	initrd_start = (unsigned long)__va(start);
92ffe54f0f99ec Richard Kuo 2025-08-18   29  	initrd_end = (unsigned long)__va(end);
92ffe54f0f99ec Richard Kuo 2025-08-18   30  	initrd_below_start_ok = 1;
92ffe54f0f99ec Richard Kuo 2025-08-18   31  }
92ffe54f0f99ec Richard Kuo 2025-08-18   32  #endif
92ffe54f0f99ec Richard Kuo 2025-08-18   33  
92ffe54f0f99ec Richard Kuo 2025-08-18   34  //  basically a copy of dt_scan_chosen, but doesn't do the initrd scan.
92ffe54f0f99ec Richard Kuo 2025-08-18   35  static int __init early_init_dt_scan_chosen_noinitrd(unsigned long node, const char *uname,
92ffe54f0f99ec Richard Kuo 2025-08-18   36  				     int depth, void *data)
92ffe54f0f99ec Richard Kuo 2025-08-18   37  {
92ffe54f0f99ec Richard Kuo 2025-08-18   38  	unsigned long l;
92ffe54f0f99ec Richard Kuo 2025-08-18   39  	char *p;
92ffe54f0f99ec Richard Kuo 2025-08-18   40  
92ffe54f0f99ec Richard Kuo 2025-08-18   41  	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
92ffe54f0f99ec Richard Kuo 2025-08-18   42  
92ffe54f0f99ec Richard Kuo 2025-08-18   43  	if (depth != 1 || !data ||
92ffe54f0f99ec Richard Kuo 2025-08-18   44  	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
92ffe54f0f99ec Richard Kuo 2025-08-18   45  		return 0;
92ffe54f0f99ec Richard Kuo 2025-08-18   46  
92ffe54f0f99ec Richard Kuo 2025-08-18   47  	//early_init_dt_check_for_initrd(node);
92ffe54f0f99ec Richard Kuo 2025-08-18   48  
92ffe54f0f99ec Richard Kuo 2025-08-18   49  	/* Retrieve command line */
92ffe54f0f99ec Richard Kuo 2025-08-18  @50  	p = of_get_flat_dt_prop(node, "bootargs", &l);
92ffe54f0f99ec Richard Kuo 2025-08-18   51  	if (p != NULL && l > 0)
92ffe54f0f99ec Richard Kuo 2025-08-18   52  		strscpy(data, p, min((int)l, COMMAND_LINE_SIZE));
92ffe54f0f99ec Richard Kuo 2025-08-18   53  
92ffe54f0f99ec Richard Kuo 2025-08-18   54  	/*
92ffe54f0f99ec Richard Kuo 2025-08-18   55  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
92ffe54f0f99ec Richard Kuo 2025-08-18   56  	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
92ffe54f0f99ec Richard Kuo 2025-08-18   57  	 * is set in which case we override whatever was found earlier.
92ffe54f0f99ec Richard Kuo 2025-08-18   58  	 */
92ffe54f0f99ec Richard Kuo 2025-08-18   59  #ifdef CONFIG_CMDLINE
92ffe54f0f99ec Richard Kuo 2025-08-18   60  #ifndef CONFIG_CMDLINE_FORCE
92ffe54f0f99ec Richard Kuo 2025-08-18   61  	if (!((char *)data)[0])
92ffe54f0f99ec Richard Kuo 2025-08-18   62  #endif
92ffe54f0f99ec Richard Kuo 2025-08-18   63  		strscpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
92ffe54f0f99ec Richard Kuo 2025-08-18   64  #endif /* CONFIG_CMDLINE */
92ffe54f0f99ec Richard Kuo 2025-08-18   65  
92ffe54f0f99ec Richard Kuo 2025-08-18   66  	pr_debug("Command line is: %s\n", (char*)data);
92ffe54f0f99ec Richard Kuo 2025-08-18   67  
92ffe54f0f99ec Richard Kuo 2025-08-18   68  	/* break now */
92ffe54f0f99ec Richard Kuo 2025-08-18   69  	return 1;
92ffe54f0f99ec Richard Kuo 2025-08-18   70  }
92ffe54f0f99ec Richard Kuo 2025-08-18   71  
92ffe54f0f99ec Richard Kuo 2025-08-18   72  
92ffe54f0f99ec Richard Kuo 2025-08-18   73  
ecd4f0c0ace008 Brian Cain  2026-01-24   74  /*
ecd4f0c0ace008 Brian Cain  2026-01-24   75   * Iterator for of_flat_dt_match_machine
ecd4f0c0ace008 Brian Cain  2026-01-24   76   */
ecd4f0c0ace008 Brian Cain  2026-01-24   77  static const void * __init arch_get_next_mach(const char *const **match)
ecd4f0c0ace008 Brian Cain  2026-01-24   78  {
ecd4f0c0ace008 Brian Cain  2026-01-24   79  	static const struct machine_desc *mdesc = __arch_info_begin;
ecd4f0c0ace008 Brian Cain  2026-01-24   80  	const struct machine_desc *m = mdesc;
ecd4f0c0ace008 Brian Cain  2026-01-24   81  
ecd4f0c0ace008 Brian Cain  2026-01-24   82  	if (m >= __arch_info_end)
ecd4f0c0ace008 Brian Cain  2026-01-24   83  		return NULL;
ecd4f0c0ace008 Brian Cain  2026-01-24   84  
ecd4f0c0ace008 Brian Cain  2026-01-24   85  	mdesc++;
ecd4f0c0ace008 Brian Cain  2026-01-24   86  	*match = m->dt_compat;
ecd4f0c0ace008 Brian Cain  2026-01-24   87  	return m;
ecd4f0c0ace008 Brian Cain  2026-01-24   88  }
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

:::::: The code at line 17 was first introduced by commit
:::::: 92ffe54f0f99ec61fbcf52c66862fb29d279ac9a hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
