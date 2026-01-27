Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E6E34C9AC;
	Tue, 27 Jan 2026 13:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769519671; cv=none; b=rssEbZOP50g5A/tpfM+Uidbom+OKr3gnpptQwU7OeHlOQ0zIxMXdYK9RzNovtsZbsCOeP7zCSxAdLRlLRTvpKJ1DsqdHLUR86hNZbUQ2vXV2wGSenBcp9CgRjWTY9GVr/BqyIpZ5g5Mog55P9lHzQKiJdi/IZHx1H4rtfVX3LRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769519671; c=relaxed/simple;
	bh=KTqHTplNUe7OnkDWCvoPN4NSN5ru25jM85WGbpCf3dw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fIX2pLZXocMDso3/wCyTPB1PrRkvTIGmUpTtm//wIFItb8BENozSbi9GlegO5dWuJQ1gHwK6gnVsm9AgC5quQsm9h2yPL4HPtbA36JGEeWqAbljtDFFi9lLX2m5zz5UBolNFPEDFeHcVncNxbS8/N4D/EdyayWoW1efKMNe29Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmSz3789; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmSz3789"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769519670; x=1801055670;
  h=date:from:to:cc:subject:message-id;
  bh=KTqHTplNUe7OnkDWCvoPN4NSN5ru25jM85WGbpCf3dw=;
  b=fmSz3789ffe5mgPjRlYdE02Sbwe0j5s3VLdJmKHyRMKktemCxuP88CMr
   /z9jYjYGjxIuIvSrn/Y5KWxLDS2f2N9scwVkBz/h1sIRwnAc4FgDwemh/
   nsseCyJuPumz8DwkBa3az6VuyNYj6v0mJFv4han00DLfIXUE6TOPo7E3o
   pZyV6UBYmZgQ+vGUvRyMjUCKkMg5e1SshGFX4Bq+omtivqRFRcg5aCYOO
   nrXb7kJAAzNJl0PgWGB+uJHGb/GyJYqH7fY8S3/LLQZ9r0SNLajLq35dw
   16uw4cS5ViJywotefC0VfN2l9FanszimhgndD9YCH+5d+CfQCGqSE1D7E
   w==;
X-CSE-ConnectionGUID: CJGdl7Y6T6KqzoxDe0OPvA==
X-CSE-MsgGUID: a7vdIcN0SaqjSs3WCwO4nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81017858"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81017858"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 05:14:29 -0800
X-CSE-ConnectionGUID: FwsBbSTeSv+HQ4AoGDOF3w==
X-CSE-MsgGUID: 1orGw4GaQIq4yKEpN4OFFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208215905"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2026 05:14:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkitk-00000000YVM-2BBM;
	Tue, 27 Jan 2026 13:14:24 +0000
Date: Tue, 27 Jan 2026 21:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 26/38]
 arch/hexagon/kernel/devtree.c:50:6: error: call to undeclared function
 'of_get_flat_dt_prop'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202601272107.nfitPBz1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: c03d45c08b8a1046b1502fc07d0a7145fc2fb5b8 [26/38] hexagon: add memory management enhancements
config: hexagon-randconfig-002-20260127 (https://download.01.org/0day-ci/archive/20260127/202601272107.nfitPBz1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272107.nfitPBz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272107.nfitPBz1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/hexagon/kernel/devtree.c:17:13: warning: no previous prototype for function 'early_init_dt_add_memory_arch' [-Wmissing-prototypes]
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

57d9a292755c80 Richard Kuo 2025-08-18   15  
57d9a292755c80 Richard Kuo 2025-08-18   16  /*  called via early_init_dt_scan_memory?  */
57d9a292755c80 Richard Kuo 2025-08-18  @17  void __init early_init_dt_add_memory_arch(u64 base, u64 size)
57d9a292755c80 Richard Kuo 2025-08-18   18  {
57d9a292755c80 Richard Kuo 2025-08-18   19  	//  Cheesy solution is to just twiddle bootmem_lastpg
57d9a292755c80 Richard Kuo 2025-08-18   20  	BUG();  ///  XXX Todo fixme
57d9a292755c80 Richard Kuo 2025-08-18   21  }
57d9a292755c80 Richard Kuo 2025-08-18   22  
57d9a292755c80 Richard Kuo 2025-08-18   23  #ifdef CONFIG_BLK_DEV_INITRD
57d9a292755c80 Richard Kuo 2025-08-18   24  /*  Seems to be the implementation used by most archs  */
57d9a292755c80 Richard Kuo 2025-08-18   25  static void __init __maybe_unused early_init_dt_setup_initrd_arch(u64 start,
57d9a292755c80 Richard Kuo 2025-08-18   26  					    u64 end)
57d9a292755c80 Richard Kuo 2025-08-18   27  {
57d9a292755c80 Richard Kuo 2025-08-18   28  	initrd_start = (unsigned long)__va(start);
57d9a292755c80 Richard Kuo 2025-08-18   29  	initrd_end = (unsigned long)__va(end);
57d9a292755c80 Richard Kuo 2025-08-18   30  	initrd_below_start_ok = 1;
57d9a292755c80 Richard Kuo 2025-08-18   31  }
57d9a292755c80 Richard Kuo 2025-08-18   32  #endif
57d9a292755c80 Richard Kuo 2025-08-18   33  
57d9a292755c80 Richard Kuo 2025-08-18   34  //  basically a copy of dt_scan_chosen, but doesn't do the initrd scan.
57d9a292755c80 Richard Kuo 2025-08-18   35  static int __init early_init_dt_scan_chosen_noinitrd(unsigned long node, const char *uname,
57d9a292755c80 Richard Kuo 2025-08-18   36  				     int depth, void *data)
57d9a292755c80 Richard Kuo 2025-08-18   37  {
57d9a292755c80 Richard Kuo 2025-08-18   38  	unsigned long l;
57d9a292755c80 Richard Kuo 2025-08-18   39  	char *p;
57d9a292755c80 Richard Kuo 2025-08-18   40  
57d9a292755c80 Richard Kuo 2025-08-18   41  	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
57d9a292755c80 Richard Kuo 2025-08-18   42  
57d9a292755c80 Richard Kuo 2025-08-18   43  	if (depth != 1 || !data ||
57d9a292755c80 Richard Kuo 2025-08-18   44  	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
57d9a292755c80 Richard Kuo 2025-08-18   45  		return 0;
57d9a292755c80 Richard Kuo 2025-08-18   46  
57d9a292755c80 Richard Kuo 2025-08-18   47  	//early_init_dt_check_for_initrd(node);
57d9a292755c80 Richard Kuo 2025-08-18   48  
57d9a292755c80 Richard Kuo 2025-08-18   49  	/* Retrieve command line */
57d9a292755c80 Richard Kuo 2025-08-18  @50  	p = of_get_flat_dt_prop(node, "bootargs", &l);
57d9a292755c80 Richard Kuo 2025-08-18   51  	if (p != NULL && l > 0)
57d9a292755c80 Richard Kuo 2025-08-18   52  		strscpy(data, p, min((int)l, COMMAND_LINE_SIZE));
57d9a292755c80 Richard Kuo 2025-08-18   53  
57d9a292755c80 Richard Kuo 2025-08-18   54  	/*
57d9a292755c80 Richard Kuo 2025-08-18   55  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
57d9a292755c80 Richard Kuo 2025-08-18   56  	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
57d9a292755c80 Richard Kuo 2025-08-18   57  	 * is set in which case we override whatever was found earlier.
57d9a292755c80 Richard Kuo 2025-08-18   58  	 */
57d9a292755c80 Richard Kuo 2025-08-18   59  #ifdef CONFIG_CMDLINE
57d9a292755c80 Richard Kuo 2025-08-18   60  #ifndef CONFIG_CMDLINE_FORCE
57d9a292755c80 Richard Kuo 2025-08-18   61  	if (!((char *)data)[0])
57d9a292755c80 Richard Kuo 2025-08-18   62  #endif
57d9a292755c80 Richard Kuo 2025-08-18   63  		strscpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
57d9a292755c80 Richard Kuo 2025-08-18   64  #endif /* CONFIG_CMDLINE */
57d9a292755c80 Richard Kuo 2025-08-18   65  
57d9a292755c80 Richard Kuo 2025-08-18   66  	pr_debug("Command line is: %s\n", (char*)data);
57d9a292755c80 Richard Kuo 2025-08-18   67  
57d9a292755c80 Richard Kuo 2025-08-18   68  	/* break now */
57d9a292755c80 Richard Kuo 2025-08-18   69  	return 1;
57d9a292755c80 Richard Kuo 2025-08-18   70  }
57d9a292755c80 Richard Kuo 2025-08-18   71  
57d9a292755c80 Richard Kuo 2025-08-18   72  
57d9a292755c80 Richard Kuo 2025-08-18   73  
1732d55bf9016e Brian Cain  2026-01-24   74  /*
1732d55bf9016e Brian Cain  2026-01-24   75   * Iterator for of_flat_dt_match_machine
1732d55bf9016e Brian Cain  2026-01-24   76   */
1732d55bf9016e Brian Cain  2026-01-24   77  static const void * __init arch_get_next_mach(const char *const **match)
1732d55bf9016e Brian Cain  2026-01-24   78  {
1732d55bf9016e Brian Cain  2026-01-24   79  	static const struct machine_desc *mdesc = __arch_info_begin;
1732d55bf9016e Brian Cain  2026-01-24   80  	const struct machine_desc *m = mdesc;
1732d55bf9016e Brian Cain  2026-01-24   81  
1732d55bf9016e Brian Cain  2026-01-24   82  	if (m >= __arch_info_end)
1732d55bf9016e Brian Cain  2026-01-24   83  		return NULL;
1732d55bf9016e Brian Cain  2026-01-24   84  
1732d55bf9016e Brian Cain  2026-01-24   85  	mdesc++;
1732d55bf9016e Brian Cain  2026-01-24   86  	*match = m->dt_compat;
1732d55bf9016e Brian Cain  2026-01-24   87  	return m;
1732d55bf9016e Brian Cain  2026-01-24   88  }
1732d55bf9016e Brian Cain  2026-01-24   89  
57d9a292755c80 Richard Kuo 2025-08-18   90  /*
57d9a292755c80 Richard Kuo 2025-08-18   91   * setup_machine_fdt - set up machine based on dtb passed to kernel
57d9a292755c80 Richard Kuo 2025-08-18   92   * @dt_phys: physical address of dtb
57d9a292755c80 Richard Kuo 2025-08-18   93   *
57d9a292755c80 Richard Kuo 2025-08-18   94   * Sets up some of the earliest stuff -- setting the machine type,
57d9a292755c80 Richard Kuo 2025-08-18   95   * pulling the command line options, and finding the memory.
57d9a292755c80 Richard Kuo 2025-08-18   96   *
57d9a292755c80 Richard Kuo 2025-08-18   97   * Since we're calling this from setup_arch, this is going to happen
57d9a292755c80 Richard Kuo 2025-08-18   98   * very, very early.  Prior to even the bootmem being set up in the
57d9a292755c80 Richard Kuo 2025-08-18   99   * old scheme I think.
57d9a292755c80 Richard Kuo 2025-08-18  100   *
57d9a292755c80 Richard Kuo 2025-08-18  101   * Also since we're always being fired up by the hypervisor, then
57d9a292755c80 Richard Kuo 2025-08-18  102   * we are already running with the MMU on with an init segtable.
57d9a292755c80 Richard Kuo 2025-08-18  103   */
1732d55bf9016e Brian Cain  2026-01-24 @104  const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
57d9a292755c80 Richard Kuo 2025-08-18  105  {
1732d55bf9016e Brian Cain  2026-01-24  106  	const struct machine_desc *mdesc_best = NULL;
57d9a292755c80 Richard Kuo 2025-08-18  107  	unsigned long dt_root;
57d9a292755c80 Richard Kuo 2025-08-18  108  
57d9a292755c80 Richard Kuo 2025-08-18  109  #ifdef CONFIG_HEXAGON_MSM8974_FLUID
57d9a292755c80 Richard Kuo 2025-08-18  110  	//  Fixme:  use this for...  everybody if possible
57d9a292755c80 Richard Kuo 2025-08-18  111  	//  The "tags" struct or whatever provided by LK; currently stuffing it in the "external buffer" space.
57d9a292755c80 Richard Kuo 2025-08-18  112  	initial_boot_params = (void *) &external_buffer;
57d9a292755c80 Richard Kuo 2025-08-18  113  	dt_root = of_get_flat_dt_root();
57d9a292755c80 Richard Kuo 2025-08-18  114  	of_scan_flat_dt(early_init_dt_scan_chosen_noinitrd, boot_command_line);
57d9a292755c80 Richard Kuo 2025-08-18  115  #endif
57d9a292755c80 Richard Kuo 2025-08-18  116  
57d9a292755c80 Richard Kuo 2025-08-18  117  	/*  reset global pointer that devtree uses to the proper blob  */
57d9a292755c80 Richard Kuo 2025-08-18  118  #ifdef CONFIG_DTB_BUILTIN
57d9a292755c80 Richard Kuo 2025-08-18  119  	/*  This is the label placed on the assembly blob; will already be in virtual space  */
57d9a292755c80 Richard Kuo 2025-08-18 @120  	initial_boot_params = dt_phys;
57d9a292755c80 Richard Kuo 2025-08-18  121  #else
57d9a292755c80 Richard Kuo 2025-08-18  122          initial_boot_params = phys_to_virt(dt_phys);
57d9a292755c80 Richard Kuo 2025-08-18  123  #endif
57d9a292755c80 Richard Kuo 2025-08-18  124  
57d9a292755c80 Richard Kuo 2025-08-18  125          /* check device tree validity */
57d9a292755c80 Richard Kuo 2025-08-18  126          if (fdt_magic(initial_boot_params) != OF_DT_HEADER) {
57d9a292755c80 Richard Kuo 2025-08-18  127                  return NULL;
57d9a292755c80 Richard Kuo 2025-08-18  128  	}
57d9a292755c80 Richard Kuo 2025-08-18  129  
57d9a292755c80 Richard Kuo 2025-08-18 @130  	dt_root = of_get_flat_dt_root();
57d9a292755c80 Richard Kuo 2025-08-18  131  
1732d55bf9016e Brian Cain  2026-01-24 @132  	mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
57d9a292755c80 Richard Kuo 2025-08-18  133  
57d9a292755c80 Richard Kuo 2025-08-18  134  	if (!mdesc_best) {
57d9a292755c80 Richard Kuo 2025-08-18  135  		panic("Unrecognized device tree\n");
57d9a292755c80 Richard Kuo 2025-08-18  136  	}
57d9a292755c80 Richard Kuo 2025-08-18  137  
57d9a292755c80 Richard Kuo 2025-08-18  138          /*
57d9a292755c80 Richard Kuo 2025-08-18  139  	 * Sets the top level address and size cells which are stored
57d9a292755c80 Richard Kuo 2025-08-18  140  	 * in globals by the devtree infrastructure.
57d9a292755c80 Richard Kuo 2025-08-18  141  	 */
57d9a292755c80 Richard Kuo 2025-08-18 @142          early_init_dt_scan_root();
57d9a292755c80 Richard Kuo 2025-08-18  143  
57d9a292755c80 Richard Kuo 2025-08-18  144          /*  Retrieve various information from the /chosen node  */
57d9a292755c80 Richard Kuo 2025-08-18  145  #ifndef CONFIG_HEXAGON_MSM8974_FLUID
57d9a292755c80 Richard Kuo 2025-08-18  146  	//  Fixme:  do this consistently for platforms
57d9a292755c80 Richard Kuo 2025-08-18 @147  	early_init_dt_scan_chosen(boot_command_line);
57d9a292755c80 Richard Kuo 2025-08-18  148  #endif
57d9a292755c80 Richard Kuo 2025-08-18  149          /*  Setup memory  */
57d9a292755c80 Richard Kuo 2025-08-18  150  	//of_scan_flat_dt(early_init_dt_scan_memory, NULL);
57d9a292755c80 Richard Kuo 2025-08-18  151  
57d9a292755c80 Richard Kuo 2025-08-18  152  	return mdesc_best;
57d9a292755c80 Richard Kuo 2025-08-18  153  }
57d9a292755c80 Richard Kuo 2025-08-18  154  

:::::: The code at line 50 was first introduced by commit
:::::: 57d9a292755c8023e31bdefe25e21f0c9837db51 hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
