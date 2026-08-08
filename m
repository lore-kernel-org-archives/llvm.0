Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA22877DA;
	Sat,  8 Aug 2026 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786183625; cv=none; b=J/jJ3fs01XzAC/YDcdc49fnfuRGhDJBoT8QJ+FLY62afqpumfGc5Eloiyg0PiJ9ztj4Qp1nfKkL1L7AUUuKFpRu6NgaHxEWmlwlzL/fU/c3Nvw6gM/nZjblLSgTTEgUCWD7fS30evWsXR4XWOMbFyaM4XRbPPumUmwje5CMpIzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786183625; c=relaxed/simple;
	bh=84rqdDy6SFji4DV2vdXJVEvQsxj7JBWN5nM644+4O5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kilzm68oi8wQsMolwBcnAdmzJyY1ZCWIgW4TbWBXGqYKCg5OKxQGlOJ5UovZszyjqwlcvolBIMwFHy3L8nceoMQINe2ZGk1bw338BWS3TYnTF8flv1etJUmbjOlg0AExlFne/TZNNGuSLOtSxS5IN7sogcH4HYC7AnSwR1lu+4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCqRygjh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCqRygjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786183624; x=1817719624;
  h=date:from:to:cc:subject:message-id;
  bh=84rqdDy6SFji4DV2vdXJVEvQsxj7JBWN5nM644+4O5k=;
  b=hCqRygjhYR3kcU7Lawq7IHrnSHL0n2btA1qXTpVutgu9RjAOdFo8BnF4
   72gjd8dxhwhIb+WOmJee36aN9eQ3czVQItcaKu4HEy3CY08KXq7NSQaJ2
   nepjMmUa11JdErHZK5v9NNFWZ2gAPxJvUcPpEM4BVwb6aXjAaHrnOzbFC
   d7+Xh6B4tcJnqF2Tm9tfEZceWGbcPHe7J57/mlIxnxNFu5LoB5vdscmvc
   EfrT01/0nAxeJg7fxW3sx1nlGEzsv58vrSZegRQhEw45ffW6C/kP9VqWV
   Bt81ybP+WaHlJx6w8VnVyFEReNOdyyKW949Zh30Ouzf3cpScpQkXoTUru
   A==;
X-CSE-ConnectionGUID: s0wydPbqRyiEBRp7dBy8Dg==
X-CSE-MsgGUID: 6yCRs69FRPuzoVZeak6xBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97931265"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="97931265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 03:07:03 -0700
X-CSE-ConnectionGUID: 9MHYDAr7TjCyIKZoqgGQfg==
X-CSE-MsgGUID: Pcj10VAJQiqIBgMMMym8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="259292620"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Aug 2026 03:07:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsdxC-00000000K53-0RH8;
	Sat, 08 Aug 2026 10:06:58 +0000
Date: Sat, 08 Aug 2026 18:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/hexagon-kcfi 26/93]
 arch/hexagon/kernel/devtree.c:17:13: warning: no previous prototype for
 function 'early_init_dt_add_memory_arch'
Message-ID: <202608081757.qSvJ9atl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/hexagon-kcfi
head:   ce0e62c277ea2fc51b37b0625eeacdc5631a488f
commit: c01c2aee2f3a158faf365c893a4578a5a0dee73f [26/93] hexagon: add memory management enhancements
config: hexagon-randconfig-001-20260808 (https://download.01.org/0day-ci/archive/20260808/202608081757.qSvJ9atl-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608081757.qSvJ9atl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608081757.qSvJ9atl-lkp@intel.com/

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
   include/linux/compiler_attributes.h:330:56: note: expanded from macro '__section'
     330 | #define __section(section)              __attribute__((__section__(section)))
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

288801685d7137 Richard Kuo 2025-08-18   15  
288801685d7137 Richard Kuo 2025-08-18   16  /*  called via early_init_dt_scan_memory?  */
288801685d7137 Richard Kuo 2025-08-18  @17  void __init early_init_dt_add_memory_arch(u64 base, u64 size)
288801685d7137 Richard Kuo 2025-08-18   18  {
288801685d7137 Richard Kuo 2025-08-18   19  	//  Cheesy solution is to just twiddle bootmem_lastpg
288801685d7137 Richard Kuo 2025-08-18   20  	BUG();  ///  XXX Todo fixme
288801685d7137 Richard Kuo 2025-08-18   21  }
288801685d7137 Richard Kuo 2025-08-18   22  
288801685d7137 Richard Kuo 2025-08-18   23  #ifdef CONFIG_BLK_DEV_INITRD
288801685d7137 Richard Kuo 2025-08-18   24  /*  Seems to be the implementation used by most archs  */
288801685d7137 Richard Kuo 2025-08-18   25  static void __init __maybe_unused early_init_dt_setup_initrd_arch(u64 start,
288801685d7137 Richard Kuo 2025-08-18   26  					    u64 end)
288801685d7137 Richard Kuo 2025-08-18   27  {
288801685d7137 Richard Kuo 2025-08-18   28  	initrd_start = (unsigned long)__va(start);
288801685d7137 Richard Kuo 2025-08-18   29  	initrd_end = (unsigned long)__va(end);
288801685d7137 Richard Kuo 2025-08-18   30  	initrd_below_start_ok = 1;
288801685d7137 Richard Kuo 2025-08-18   31  }
288801685d7137 Richard Kuo 2025-08-18   32  #endif
288801685d7137 Richard Kuo 2025-08-18   33  
288801685d7137 Richard Kuo 2025-08-18   34  //  basically a copy of dt_scan_chosen, but doesn't do the initrd scan.
288801685d7137 Richard Kuo 2025-08-18   35  static int __init early_init_dt_scan_chosen_noinitrd(unsigned long node, const char *uname,
288801685d7137 Richard Kuo 2025-08-18   36  				     int depth, void *data)
288801685d7137 Richard Kuo 2025-08-18   37  {
288801685d7137 Richard Kuo 2025-08-18   38  	unsigned long l;
288801685d7137 Richard Kuo 2025-08-18   39  	char *p;
288801685d7137 Richard Kuo 2025-08-18   40  
288801685d7137 Richard Kuo 2025-08-18   41  	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
288801685d7137 Richard Kuo 2025-08-18   42  
288801685d7137 Richard Kuo 2025-08-18   43  	if (depth != 1 || !data ||
288801685d7137 Richard Kuo 2025-08-18   44  	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
288801685d7137 Richard Kuo 2025-08-18   45  		return 0;
288801685d7137 Richard Kuo 2025-08-18   46  
288801685d7137 Richard Kuo 2025-08-18   47  	//early_init_dt_check_for_initrd(node);
288801685d7137 Richard Kuo 2025-08-18   48  
288801685d7137 Richard Kuo 2025-08-18   49  	/* Retrieve command line */
288801685d7137 Richard Kuo 2025-08-18   50  	p = of_get_flat_dt_prop(node, "bootargs", &l);
288801685d7137 Richard Kuo 2025-08-18   51  	if (p != NULL && l > 0)
288801685d7137 Richard Kuo 2025-08-18   52  		strscpy(data, p, min((int)l, COMMAND_LINE_SIZE));
288801685d7137 Richard Kuo 2025-08-18   53  
288801685d7137 Richard Kuo 2025-08-18   54  	/*
288801685d7137 Richard Kuo 2025-08-18   55  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
288801685d7137 Richard Kuo 2025-08-18   56  	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
288801685d7137 Richard Kuo 2025-08-18   57  	 * is set in which case we override whatever was found earlier.
288801685d7137 Richard Kuo 2025-08-18   58  	 */
288801685d7137 Richard Kuo 2025-08-18   59  #ifdef CONFIG_CMDLINE
288801685d7137 Richard Kuo 2025-08-18   60  #ifndef CONFIG_CMDLINE_FORCE
288801685d7137 Richard Kuo 2025-08-18   61  	if (!((char *)data)[0])
288801685d7137 Richard Kuo 2025-08-18   62  #endif
288801685d7137 Richard Kuo 2025-08-18   63  		strscpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
288801685d7137 Richard Kuo 2025-08-18   64  #endif /* CONFIG_CMDLINE */
288801685d7137 Richard Kuo 2025-08-18   65  
288801685d7137 Richard Kuo 2025-08-18   66  	pr_debug("Command line is: %s\n", (char*)data);
288801685d7137 Richard Kuo 2025-08-18   67  
288801685d7137 Richard Kuo 2025-08-18   68  	/* break now */
288801685d7137 Richard Kuo 2025-08-18   69  	return 1;
288801685d7137 Richard Kuo 2025-08-18   70  }
288801685d7137 Richard Kuo 2025-08-18   71  
288801685d7137 Richard Kuo 2025-08-18   72  
288801685d7137 Richard Kuo 2025-08-18   73  
5d4b53d10af44d Brian Cain  2026-01-24   74  /*
5d4b53d10af44d Brian Cain  2026-01-24   75   * Iterator for of_flat_dt_match_machine
5d4b53d10af44d Brian Cain  2026-01-24   76   */
5d4b53d10af44d Brian Cain  2026-01-24   77  static const void * __init arch_get_next_mach(const char *const **match)
5d4b53d10af44d Brian Cain  2026-01-24   78  {
5d4b53d10af44d Brian Cain  2026-01-24   79  	static const struct machine_desc *mdesc = __arch_info_begin;
5d4b53d10af44d Brian Cain  2026-01-24   80  	const struct machine_desc *m = mdesc;
5d4b53d10af44d Brian Cain  2026-01-24   81  
5d4b53d10af44d Brian Cain  2026-01-24   82  	if (m >= __arch_info_end)
5d4b53d10af44d Brian Cain  2026-01-24   83  		return NULL;
5d4b53d10af44d Brian Cain  2026-01-24   84  
5d4b53d10af44d Brian Cain  2026-01-24   85  	mdesc++;
5d4b53d10af44d Brian Cain  2026-01-24   86  	*match = m->dt_compat;
5d4b53d10af44d Brian Cain  2026-01-24   87  	return m;
5d4b53d10af44d Brian Cain  2026-01-24   88  }
5d4b53d10af44d Brian Cain  2026-01-24   89  
288801685d7137 Richard Kuo 2025-08-18   90  /*
288801685d7137 Richard Kuo 2025-08-18   91   * setup_machine_fdt - set up machine based on dtb passed to kernel
288801685d7137 Richard Kuo 2025-08-18   92   * @dt_phys: physical address of dtb
288801685d7137 Richard Kuo 2025-08-18   93   *
288801685d7137 Richard Kuo 2025-08-18   94   * Sets up some of the earliest stuff -- setting the machine type,
288801685d7137 Richard Kuo 2025-08-18   95   * pulling the command line options, and finding the memory.
288801685d7137 Richard Kuo 2025-08-18   96   *
288801685d7137 Richard Kuo 2025-08-18   97   * Since we're calling this from setup_arch, this is going to happen
288801685d7137 Richard Kuo 2025-08-18   98   * very, very early.  Prior to even the bootmem being set up in the
288801685d7137 Richard Kuo 2025-08-18   99   * old scheme I think.
288801685d7137 Richard Kuo 2025-08-18  100   *
288801685d7137 Richard Kuo 2025-08-18  101   * Also since we're always being fired up by the hypervisor, then
288801685d7137 Richard Kuo 2025-08-18  102   * we are already running with the MMU on with an init segtable.
288801685d7137 Richard Kuo 2025-08-18  103   */
5d4b53d10af44d Brian Cain  2026-01-24 @104  const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
288801685d7137 Richard Kuo 2025-08-18  105  {
5d4b53d10af44d Brian Cain  2026-01-24  106  	const struct machine_desc *mdesc_best = NULL;
288801685d7137 Richard Kuo 2025-08-18  107  	unsigned long dt_root;
288801685d7137 Richard Kuo 2025-08-18  108  

:::::: The code at line 17 was first introduced by commit
:::::: 288801685d71376da5644b5f11ea806fc06ccea1 hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
