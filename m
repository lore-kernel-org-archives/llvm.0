Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579EA29B8E8;
	Tue, 17 Feb 2026 18:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354563; cv=none; b=olcGmgs8NMBtPvtM7ly71KiasqNvKLtXNmBACYmRkYzgymK1yuCWmY6vRPJpalDYI7TuSUjuj3cGdHxoQEwIexcfFjhcMIpTQnc+tivvrKEBFyyOkVsA4MFRShdtQyZivx7i2ux5ignxsl/d8SDtG2QcJBlKXXRozrgruVgJ/vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354563; c=relaxed/simple;
	bh=NNq/BmnOC81ED50QVReeEkDd9ylXm6RoKpdyuC8h+7s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j9ideeEBR1phfWSTyRrsTJk8tV5Yh6hkz5x9A9rB4Vt58KdEhkkZyzJxaHXeu4dfbRoOprlII/sS+AT0AfzBVwCCS3HbQMwGfxsexcwvAvb2Dca3AOsLdkqOrOJNNJFtB//VrtbqaCa733rSQ10UMppNGV6FQS6Qw1Ysh1SP82k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4vHc8BU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4vHc8BU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771354561; x=1802890561;
  h=date:from:to:cc:subject:message-id;
  bh=NNq/BmnOC81ED50QVReeEkDd9ylXm6RoKpdyuC8h+7s=;
  b=G4vHc8BU0YAI54oKRUaIdTp2wEho0ctrtPVbTpEjopBNvv1sZ7WKu3PN
   zuiu6Yk/RTyNUTplagkNghIpaTg9tG8lr+YcnymytfNY75U/KM04G5Ixq
   mwr7xXff+RgC3dHZgVT0l7gNjetKBY9UAqApaSt4vRXIu3uz9SjgwNFDH
   oFxWz6cKjybXw+1jrzoA+br1YftJ2BIFSaNr4o30enwqr5r2Q6korFFpk
   1jK7nGZlrunnjENN/GA0uRdlAtIDpIfXhm24YH2ofaz2gGwddHoEYyLc3
   TRMY4+93Yog9KifM1ADH2Lr1BEEMz+KErEHPtpLJ5xvtxmfrv+4CZG3/W
   Q==;
X-CSE-ConnectionGUID: H6nC8koJQ4+z9IldN537YA==
X-CSE-MsgGUID: loUSWRyERgOWilLnHGDkEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="89843772"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="89843772"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 10:56:01 -0800
X-CSE-ConnectionGUID: xQSbWPpdRhKKxFgB9r8KdA==
X-CSE-MsgGUID: BXswLy44SDSg20JWIl7GyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="212830350"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Feb 2026 10:55:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsQEm-000000011J6-3FsN;
	Tue, 17 Feb 2026 18:55:56 +0000
Date: Wed, 18 Feb 2026 02:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 26/41]
 arch/hexagon/kernel/devtree.c:50:6: error: call to undeclared function
 'of_get_flat_dt_prop'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602180205.V67dYhv6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   62702f080dc2ac995b8515a4e564fac852471147
commit: 3e4b5e29a70b792abb4f0fd0916a4053d3e6ee72 [26/41] hexagon: add memory management enhancements
config: hexagon-randconfig-001-20260217 (https://download.01.org/0day-ci/archive/20260218/202602180205.V67dYhv6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180205.V67dYhv6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180205.V67dYhv6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/hexagon/kernel/devtree.c:17:13: warning: no previous prototype for function 'early_init_dt_add_memory_arch' [-Wmissing-prototypes]
      17 | void __init early_init_dt_add_memory_arch(u64 base, u64 size)
         |             ^
   arch/hexagon/kernel/devtree.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      17 | void __init early_init_dt_add_memory_arch(u64 base, u64 size)
         | ^
         | static 
>> arch/hexagon/kernel/devtree.c:50:6: error: call to undeclared function 'of_get_flat_dt_prop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
   include/linux/compiler_types.h:126:34: note: expanded from macro '__cold'
     126 | #define __cold                          __attribute__((__cold__))
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


vim +/of_get_flat_dt_prop +50 arch/hexagon/kernel/devtree.c

af91d653d17fcf Richard Kuo 2025-08-18   33  
af91d653d17fcf Richard Kuo 2025-08-18   34  //  basically a copy of dt_scan_chosen, but doesn't do the initrd scan.
af91d653d17fcf Richard Kuo 2025-08-18   35  static int __init early_init_dt_scan_chosen_noinitrd(unsigned long node, const char *uname,
af91d653d17fcf Richard Kuo 2025-08-18   36  				     int depth, void *data)
af91d653d17fcf Richard Kuo 2025-08-18   37  {
af91d653d17fcf Richard Kuo 2025-08-18   38  	unsigned long l;
af91d653d17fcf Richard Kuo 2025-08-18   39  	char *p;
af91d653d17fcf Richard Kuo 2025-08-18   40  
af91d653d17fcf Richard Kuo 2025-08-18   41  	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
af91d653d17fcf Richard Kuo 2025-08-18   42  
af91d653d17fcf Richard Kuo 2025-08-18   43  	if (depth != 1 || !data ||
af91d653d17fcf Richard Kuo 2025-08-18   44  	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
af91d653d17fcf Richard Kuo 2025-08-18   45  		return 0;
af91d653d17fcf Richard Kuo 2025-08-18   46  
af91d653d17fcf Richard Kuo 2025-08-18   47  	//early_init_dt_check_for_initrd(node);
af91d653d17fcf Richard Kuo 2025-08-18   48  
af91d653d17fcf Richard Kuo 2025-08-18   49  	/* Retrieve command line */
af91d653d17fcf Richard Kuo 2025-08-18  @50  	p = of_get_flat_dt_prop(node, "bootargs", &l);
af91d653d17fcf Richard Kuo 2025-08-18   51  	if (p != NULL && l > 0)
af91d653d17fcf Richard Kuo 2025-08-18   52  		strscpy(data, p, min((int)l, COMMAND_LINE_SIZE));
af91d653d17fcf Richard Kuo 2025-08-18   53  
af91d653d17fcf Richard Kuo 2025-08-18   54  	/*
af91d653d17fcf Richard Kuo 2025-08-18   55  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
af91d653d17fcf Richard Kuo 2025-08-18   56  	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
af91d653d17fcf Richard Kuo 2025-08-18   57  	 * is set in which case we override whatever was found earlier.
af91d653d17fcf Richard Kuo 2025-08-18   58  	 */
af91d653d17fcf Richard Kuo 2025-08-18   59  #ifdef CONFIG_CMDLINE
af91d653d17fcf Richard Kuo 2025-08-18   60  #ifndef CONFIG_CMDLINE_FORCE
af91d653d17fcf Richard Kuo 2025-08-18   61  	if (!((char *)data)[0])
af91d653d17fcf Richard Kuo 2025-08-18   62  #endif
af91d653d17fcf Richard Kuo 2025-08-18   63  		strscpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
af91d653d17fcf Richard Kuo 2025-08-18   64  #endif /* CONFIG_CMDLINE */
af91d653d17fcf Richard Kuo 2025-08-18   65  
af91d653d17fcf Richard Kuo 2025-08-18   66  	pr_debug("Command line is: %s\n", (char*)data);
af91d653d17fcf Richard Kuo 2025-08-18   67  
af91d653d17fcf Richard Kuo 2025-08-18   68  	/* break now */
af91d653d17fcf Richard Kuo 2025-08-18   69  	return 1;
af91d653d17fcf Richard Kuo 2025-08-18   70  }
af91d653d17fcf Richard Kuo 2025-08-18   71  
af91d653d17fcf Richard Kuo 2025-08-18   72  
af91d653d17fcf Richard Kuo 2025-08-18   73  
1545ec1071e077 Brian Cain  2026-01-24   74  /*
1545ec1071e077 Brian Cain  2026-01-24   75   * Iterator for of_flat_dt_match_machine
1545ec1071e077 Brian Cain  2026-01-24   76   */
1545ec1071e077 Brian Cain  2026-01-24   77  static const void * __init arch_get_next_mach(const char *const **match)
1545ec1071e077 Brian Cain  2026-01-24   78  {
1545ec1071e077 Brian Cain  2026-01-24   79  	static const struct machine_desc *mdesc = __arch_info_begin;
1545ec1071e077 Brian Cain  2026-01-24   80  	const struct machine_desc *m = mdesc;
1545ec1071e077 Brian Cain  2026-01-24   81  
1545ec1071e077 Brian Cain  2026-01-24   82  	if (m >= __arch_info_end)
1545ec1071e077 Brian Cain  2026-01-24   83  		return NULL;
1545ec1071e077 Brian Cain  2026-01-24   84  
1545ec1071e077 Brian Cain  2026-01-24   85  	mdesc++;
1545ec1071e077 Brian Cain  2026-01-24   86  	*match = m->dt_compat;
1545ec1071e077 Brian Cain  2026-01-24   87  	return m;
1545ec1071e077 Brian Cain  2026-01-24   88  }
1545ec1071e077 Brian Cain  2026-01-24   89  
af91d653d17fcf Richard Kuo 2025-08-18   90  /*
af91d653d17fcf Richard Kuo 2025-08-18   91   * setup_machine_fdt - set up machine based on dtb passed to kernel
af91d653d17fcf Richard Kuo 2025-08-18   92   * @dt_phys: physical address of dtb
af91d653d17fcf Richard Kuo 2025-08-18   93   *
af91d653d17fcf Richard Kuo 2025-08-18   94   * Sets up some of the earliest stuff -- setting the machine type,
af91d653d17fcf Richard Kuo 2025-08-18   95   * pulling the command line options, and finding the memory.
af91d653d17fcf Richard Kuo 2025-08-18   96   *
af91d653d17fcf Richard Kuo 2025-08-18   97   * Since we're calling this from setup_arch, this is going to happen
af91d653d17fcf Richard Kuo 2025-08-18   98   * very, very early.  Prior to even the bootmem being set up in the
af91d653d17fcf Richard Kuo 2025-08-18   99   * old scheme I think.
af91d653d17fcf Richard Kuo 2025-08-18  100   *
af91d653d17fcf Richard Kuo 2025-08-18  101   * Also since we're always being fired up by the hypervisor, then
af91d653d17fcf Richard Kuo 2025-08-18  102   * we are already running with the MMU on with an init segtable.
af91d653d17fcf Richard Kuo 2025-08-18  103   */
1545ec1071e077 Brian Cain  2026-01-24 @104  const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
af91d653d17fcf Richard Kuo 2025-08-18  105  {
1545ec1071e077 Brian Cain  2026-01-24  106  	const struct machine_desc *mdesc_best = NULL;
af91d653d17fcf Richard Kuo 2025-08-18  107  	unsigned long dt_root;
af91d653d17fcf Richard Kuo 2025-08-18  108  
af91d653d17fcf Richard Kuo 2025-08-18  109  #ifdef CONFIG_HEXAGON_MSM8974_FLUID
af91d653d17fcf Richard Kuo 2025-08-18  110  	//  Fixme:  use this for...  everybody if possible
af91d653d17fcf Richard Kuo 2025-08-18  111  	//  The "tags" struct or whatever provided by LK; currently stuffing it in the "external buffer" space.
af91d653d17fcf Richard Kuo 2025-08-18  112  	initial_boot_params = (void *) &external_buffer;
af91d653d17fcf Richard Kuo 2025-08-18  113  	dt_root = of_get_flat_dt_root();
af91d653d17fcf Richard Kuo 2025-08-18  114  	of_scan_flat_dt(early_init_dt_scan_chosen_noinitrd, boot_command_line);
af91d653d17fcf Richard Kuo 2025-08-18  115  #endif
af91d653d17fcf Richard Kuo 2025-08-18  116  
af91d653d17fcf Richard Kuo 2025-08-18  117  	/*  reset global pointer that devtree uses to the proper blob  */
af91d653d17fcf Richard Kuo 2025-08-18  118  #ifdef CONFIG_DTB_BUILTIN
af91d653d17fcf Richard Kuo 2025-08-18  119  	/*  This is the label placed on the assembly blob; will already be in virtual space  */
af91d653d17fcf Richard Kuo 2025-08-18 @120  	initial_boot_params = dt_phys;
af91d653d17fcf Richard Kuo 2025-08-18  121  #else
af91d653d17fcf Richard Kuo 2025-08-18  122          initial_boot_params = phys_to_virt(dt_phys);
af91d653d17fcf Richard Kuo 2025-08-18  123  #endif
af91d653d17fcf Richard Kuo 2025-08-18  124  
af91d653d17fcf Richard Kuo 2025-08-18  125          /* check device tree validity */
af91d653d17fcf Richard Kuo 2025-08-18  126          if (fdt_magic(initial_boot_params) != OF_DT_HEADER) {
af91d653d17fcf Richard Kuo 2025-08-18  127                  return NULL;
af91d653d17fcf Richard Kuo 2025-08-18  128  	}
af91d653d17fcf Richard Kuo 2025-08-18  129  
af91d653d17fcf Richard Kuo 2025-08-18 @130  	dt_root = of_get_flat_dt_root();
af91d653d17fcf Richard Kuo 2025-08-18  131  
1545ec1071e077 Brian Cain  2026-01-24 @132  	mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
af91d653d17fcf Richard Kuo 2025-08-18  133  
af91d653d17fcf Richard Kuo 2025-08-18  134  	if (!mdesc_best) {
af91d653d17fcf Richard Kuo 2025-08-18  135  		panic("Unrecognized device tree\n");
af91d653d17fcf Richard Kuo 2025-08-18  136  	}
af91d653d17fcf Richard Kuo 2025-08-18  137  
af91d653d17fcf Richard Kuo 2025-08-18  138          /*
af91d653d17fcf Richard Kuo 2025-08-18  139  	 * Sets the top level address and size cells which are stored
af91d653d17fcf Richard Kuo 2025-08-18  140  	 * in globals by the devtree infrastructure.
af91d653d17fcf Richard Kuo 2025-08-18  141  	 */
af91d653d17fcf Richard Kuo 2025-08-18 @142          early_init_dt_scan_root();
af91d653d17fcf Richard Kuo 2025-08-18  143  
af91d653d17fcf Richard Kuo 2025-08-18  144          /*  Retrieve various information from the /chosen node  */
af91d653d17fcf Richard Kuo 2025-08-18  145  #ifndef CONFIG_HEXAGON_MSM8974_FLUID
af91d653d17fcf Richard Kuo 2025-08-18  146  	//  Fixme:  do this consistently for platforms
af91d653d17fcf Richard Kuo 2025-08-18 @147  	early_init_dt_scan_chosen(boot_command_line);
af91d653d17fcf Richard Kuo 2025-08-18  148  #endif
af91d653d17fcf Richard Kuo 2025-08-18  149          /*  Setup memory  */
af91d653d17fcf Richard Kuo 2025-08-18  150  	//of_scan_flat_dt(early_init_dt_scan_memory, NULL);
af91d653d17fcf Richard Kuo 2025-08-18  151  
af91d653d17fcf Richard Kuo 2025-08-18  152  	return mdesc_best;
af91d653d17fcf Richard Kuo 2025-08-18  153  }
af91d653d17fcf Richard Kuo 2025-08-18  154  

:::::: The code at line 50 was first introduced by commit
:::::: af91d653d17fcfa3a9cf14192d21c02f8a9295d3 hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
