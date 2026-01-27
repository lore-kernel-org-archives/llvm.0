Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1129AB00;
	Tue, 27 Jan 2026 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523397; cv=none; b=si3yPUO+1QtAkopkjeRPLsAGA3pGnLqdifVC9C+FfmwVxNLDk5rWtMf2tWCyIwLZi9b/jbJS+dAkDxxvT0xPQ9gWFDkEbIVQe3k7m5VbASHPB9vIwWOTPLL4OnnFBoDpc16mKB0odVuB7Jvri65i6tfrwsY7mBmf5NMclsYq2XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523397; c=relaxed/simple;
	bh=xPoy1FXQhODL0NPkPKaZgFLKZVbq5JtYflzn+aSP0gM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HcCRSgtxu/hd0Kdtzkft8S4Z4LjPC3OQSMPDpJcZK3hwuxaccbABBTAWyYxMuYmcQH/wuR7dmqfZIp0wz5htxdn3UowUg0ETo5vFT5Qm7DuA8Pubg+MyTzKXW7qAXh/Z2BajH1pf3s9ARNQ2r1HlSfxCXmKbXhJORy85EfMqGdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ga7sVeXD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ga7sVeXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769523395; x=1801059395;
  h=date:from:to:cc:subject:message-id;
  bh=xPoy1FXQhODL0NPkPKaZgFLKZVbq5JtYflzn+aSP0gM=;
  b=ga7sVeXD2uapeNhdZqjMdbkoYPbWmMPsdSD1+8PoyykDJJryeQf2BrUQ
   x4nj17nDZrTTI8FITe/0hksL2BjI0s84Ec8HWQFZ7As9a3nFlCnfYnDn2
   lhlt8iONqBPMY+TEiQG2RXQ5uWaeo3fQ15kKaF5cniC0L9LUpYnUIXeal
   dak2CxG6Nsg3jEm5wDMdQl/go/r0XCDvbJ67fp7zBLItDncvC5q5RX9bp
   6zGc8gOGuvY7Z9CVdcxmBunIZ4RBCLY0eelLiGB070Q4laLh/Q1uPXlUU
   9jiDT4QEVM2hC5vN7gQaieJ43XZjL0rPdz5AxFJi66+yuK8/1fBk3/pzc
   Q==;
X-CSE-ConnectionGUID: 2CB5DgZkQkSgxBmGSFRNSw==
X-CSE-MsgGUID: ftEFtqMmSuqSKRmp9Qt/hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70620815"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70620815"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 06:16:32 -0800
X-CSE-ConnectionGUID: tH8F3Ot4QaWpfJwHZsBCPQ==
X-CSE-MsgGUID: F1E23dMZTyKDeIrhshKolQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2026 06:16:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkjro-00000000YXi-3mYd;
	Tue, 27 Jan 2026 14:16:28 +0000
Date: Tue, 27 Jan 2026 22:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 27/38]
 arch/hexagon/kernel/devtree.c:50:4: error: incompatible integer to pointer
 conversion assigning to 'const char *' from 'int'
Message-ID: <202601272221.YKSl5yqg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: c353b293a7e6804bc8910facd062430db3d47fc3 [27/38] hexagon: add SM8150 platform support
config: hexagon-randconfig-002-20260127 (https://download.01.org/0day-ci/archive/20260127/202601272221.YKSl5yqg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272221.YKSl5yqg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272221.YKSl5yqg-lkp@intel.com/

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

57d9a292755c80 Richard Kuo 2025-08-18  33  
57d9a292755c80 Richard Kuo 2025-08-18  34  //  basically a copy of dt_scan_chosen, but doesn't do the initrd scan.
57d9a292755c80 Richard Kuo 2025-08-18  35  static int __init early_init_dt_scan_chosen_noinitrd(unsigned long node, const char *uname,
57d9a292755c80 Richard Kuo 2025-08-18  36  				     int depth, void *data)
57d9a292755c80 Richard Kuo 2025-08-18  37  {
c353b293a7e680 Richard Kuo 2025-08-26  38  	int l;
c353b293a7e680 Richard Kuo 2025-08-26  39  	const char *p;
57d9a292755c80 Richard Kuo 2025-08-18  40  
57d9a292755c80 Richard Kuo 2025-08-18  41  	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
57d9a292755c80 Richard Kuo 2025-08-18  42  
57d9a292755c80 Richard Kuo 2025-08-18  43  	if (depth != 1 || !data ||
57d9a292755c80 Richard Kuo 2025-08-18  44  	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
57d9a292755c80 Richard Kuo 2025-08-18  45  		return 0;
57d9a292755c80 Richard Kuo 2025-08-18  46  
57d9a292755c80 Richard Kuo 2025-08-18  47  	//early_init_dt_check_for_initrd(node);
57d9a292755c80 Richard Kuo 2025-08-18  48  
57d9a292755c80 Richard Kuo 2025-08-18  49  	/* Retrieve command line */
57d9a292755c80 Richard Kuo 2025-08-18 @50  	p = of_get_flat_dt_prop(node, "bootargs", &l);
57d9a292755c80 Richard Kuo 2025-08-18  51  	if (p != NULL && l > 0)
57d9a292755c80 Richard Kuo 2025-08-18  52  		strscpy(data, p, min((int)l, COMMAND_LINE_SIZE));
57d9a292755c80 Richard Kuo 2025-08-18  53  
57d9a292755c80 Richard Kuo 2025-08-18  54  	/*
57d9a292755c80 Richard Kuo 2025-08-18  55  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
57d9a292755c80 Richard Kuo 2025-08-18  56  	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
57d9a292755c80 Richard Kuo 2025-08-18  57  	 * is set in which case we override whatever was found earlier.
57d9a292755c80 Richard Kuo 2025-08-18  58  	 */
57d9a292755c80 Richard Kuo 2025-08-18  59  #ifdef CONFIG_CMDLINE
57d9a292755c80 Richard Kuo 2025-08-18  60  #ifndef CONFIG_CMDLINE_FORCE
57d9a292755c80 Richard Kuo 2025-08-18  61  	if (!((char *)data)[0])
57d9a292755c80 Richard Kuo 2025-08-18  62  #endif
57d9a292755c80 Richard Kuo 2025-08-18  63  		strscpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
57d9a292755c80 Richard Kuo 2025-08-18  64  #endif /* CONFIG_CMDLINE */
57d9a292755c80 Richard Kuo 2025-08-18  65  
57d9a292755c80 Richard Kuo 2025-08-18  66  	pr_debug("Command line is: %s\n", (char*)data);
57d9a292755c80 Richard Kuo 2025-08-18  67  
57d9a292755c80 Richard Kuo 2025-08-18  68  	/* break now */
57d9a292755c80 Richard Kuo 2025-08-18  69  	return 1;
57d9a292755c80 Richard Kuo 2025-08-18  70  }
57d9a292755c80 Richard Kuo 2025-08-18  71  

:::::: The code at line 50 was first introduced by commit
:::::: 57d9a292755c8023e31bdefe25e21f0c9837db51 hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
