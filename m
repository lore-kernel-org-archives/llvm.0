Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F494B0498;
	Sat,  8 Aug 2026 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786198364; cv=none; b=JnvJcY5QMcPmgzJ9cBOKxx5nnBX+nqgfQo2uCNorrERLFXTgvObB2FQ7YypmODOpMveU9PV5v798ysQYgRdZCLEkriTUJOFnP+1HnGr24xfIFSg6EoEOEIl+odSgEsK49Tabo4P2LGZR7Tfdljw31ZDmnD+7nrDcgswpzCPHt+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786198364; c=relaxed/simple;
	bh=b21wmYbglZoRgwy6OGm4EnqAMoaZHpXvQKpf1YUiIoE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NU+eQUS/oId1GqwFsqMsCyaFFZNFuNg+QeyQqrlOOTHDlr+iNoeDw8C1X6SbMSQuSh+M9ODolbU6UjUZJhg+zqR+p0mjaMlP/QWlm/uyt5r8ioc9l1BmZErHmLz2Le5k/PEct+JTtWsdNG7fGrs0U3JszcV/o3wTjcsLkE0kxs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tj/iCaln; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tj/iCaln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786198362; x=1817734362;
  h=date:from:to:cc:subject:message-id;
  bh=b21wmYbglZoRgwy6OGm4EnqAMoaZHpXvQKpf1YUiIoE=;
  b=Tj/iCalnc8qiewqU5uhT6GKEYB4XUeR1+qYKV+PDbempX15+i9Nj/yEv
   Ljz5N+D4DcOovm/BmappyHbvjJUt0KTW23Z13DFV+QrohdkenmFKrxZHV
   Ql1Hv4XslnpblXmnbVsEAyyO/7HQttvv1X6OdpC80ZUwkRaAsykdKTs8V
   mEkeZwT9WjG5RKylwVl/lb9ZX8fqkVcjta61sBHL2I16qvvJ04OCCYCN8
   ThBQHpbTm6RPA5RFLJ1Pv8xSpuCoqFnS4iIdXtYuy8vPxdpWi8aF7owLv
   QLhSHz0DMFBgKbBcwpRtd2IAZJVYQHN1fu06sKifNGihIH/oNMbo+Z4FL
   A==;
X-CSE-ConnectionGUID: smJElxm+QRu69RoiYPLpBA==
X-CSE-MsgGUID: Kx3VVoy9TMyNlxQ8G13E0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="90597614"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="90597614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 07:12:41 -0700
X-CSE-ConnectionGUID: UJ6KYhUvQW6LAanmh7qD8A==
X-CSE-MsgGUID: 9TXEqPOXTGqDauVGbsHsuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="263255432"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Aug 2026 07:12:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wshmv-00000000KFB-2oAR;
	Sat, 08 Aug 2026 14:12:37 +0000
Date: Sat, 08 Aug 2026 22:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/hexagon-kcfi 26/93]
 arch/hexagon/kernel/devtree.c:104:36: error: redefinition of
 'setup_machine_fdt'
Message-ID: <202608082128.yZZBqpdG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/hexagon-kcfi
head:   ce0e62c277ea2fc51b37b0625eeacdc5631a488f
commit: c01c2aee2f3a158faf365c893a4578a5a0dee73f [26/93] hexagon: add memory management enhancements
config: hexagon-randconfig-001-20260808 (https://download.01.org/0day-ci/archive/20260808/202608082128.yZZBqpdG-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608082128.yZZBqpdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608082128.yZZBqpdG-lkp@intel.com/

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
   include/linux/compiler_attributes.h:330:56: note: expanded from macro '__section'
     330 | #define __section(section)              __attribute__((__section__(section)))
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
288801685d7137 Richard Kuo 2025-08-18  109  #ifdef CONFIG_HEXAGON_MSM8974_FLUID
288801685d7137 Richard Kuo 2025-08-18  110  	//  Fixme:  use this for...  everybody if possible
288801685d7137 Richard Kuo 2025-08-18  111  	//  The "tags" struct or whatever provided by LK; currently stuffing it in the "external buffer" space.
288801685d7137 Richard Kuo 2025-08-18  112  	initial_boot_params = (void *) &external_buffer;
288801685d7137 Richard Kuo 2025-08-18  113  	dt_root = of_get_flat_dt_root();
288801685d7137 Richard Kuo 2025-08-18  114  	of_scan_flat_dt(early_init_dt_scan_chosen_noinitrd, boot_command_line);
288801685d7137 Richard Kuo 2025-08-18  115  #endif
288801685d7137 Richard Kuo 2025-08-18  116  
288801685d7137 Richard Kuo 2025-08-18  117  	/*  reset global pointer that devtree uses to the proper blob  */
288801685d7137 Richard Kuo 2025-08-18  118  #ifdef CONFIG_DTB_BUILTIN
288801685d7137 Richard Kuo 2025-08-18  119  	/*  This is the label placed on the assembly blob; will already be in virtual space  */
288801685d7137 Richard Kuo 2025-08-18 @120  	initial_boot_params = dt_phys;
288801685d7137 Richard Kuo 2025-08-18  121  #else
288801685d7137 Richard Kuo 2025-08-18  122          initial_boot_params = phys_to_virt(dt_phys);
288801685d7137 Richard Kuo 2025-08-18  123  #endif
288801685d7137 Richard Kuo 2025-08-18  124  
288801685d7137 Richard Kuo 2025-08-18  125          /* check device tree validity */
288801685d7137 Richard Kuo 2025-08-18  126          if (fdt_magic(initial_boot_params) != OF_DT_HEADER) {
288801685d7137 Richard Kuo 2025-08-18  127                  return NULL;
288801685d7137 Richard Kuo 2025-08-18  128  	}
288801685d7137 Richard Kuo 2025-08-18  129  
288801685d7137 Richard Kuo 2025-08-18  130  	dt_root = of_get_flat_dt_root();
288801685d7137 Richard Kuo 2025-08-18  131  
5d4b53d10af44d Brian Cain  2026-01-24  132  	mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
288801685d7137 Richard Kuo 2025-08-18  133  
288801685d7137 Richard Kuo 2025-08-18  134  	if (!mdesc_best) {
288801685d7137 Richard Kuo 2025-08-18  135  		panic("Unrecognized device tree\n");
288801685d7137 Richard Kuo 2025-08-18  136  	}
288801685d7137 Richard Kuo 2025-08-18  137  
288801685d7137 Richard Kuo 2025-08-18  138          /*
288801685d7137 Richard Kuo 2025-08-18  139  	 * Sets the top level address and size cells which are stored
288801685d7137 Richard Kuo 2025-08-18  140  	 * in globals by the devtree infrastructure.
288801685d7137 Richard Kuo 2025-08-18  141  	 */
288801685d7137 Richard Kuo 2025-08-18  142          early_init_dt_scan_root();
288801685d7137 Richard Kuo 2025-08-18  143  
288801685d7137 Richard Kuo 2025-08-18  144          /*  Retrieve various information from the /chosen node  */
288801685d7137 Richard Kuo 2025-08-18  145  #ifndef CONFIG_HEXAGON_MSM8974_FLUID
288801685d7137 Richard Kuo 2025-08-18  146  	//  Fixme:  do this consistently for platforms
288801685d7137 Richard Kuo 2025-08-18  147  	early_init_dt_scan_chosen(boot_command_line);
288801685d7137 Richard Kuo 2025-08-18  148  #endif
288801685d7137 Richard Kuo 2025-08-18  149          /*  Setup memory  */
288801685d7137 Richard Kuo 2025-08-18  150  	//of_scan_flat_dt(early_init_dt_scan_memory, NULL);
288801685d7137 Richard Kuo 2025-08-18  151  
288801685d7137 Richard Kuo 2025-08-18  152  	return mdesc_best;
288801685d7137 Richard Kuo 2025-08-18  153  }
288801685d7137 Richard Kuo 2025-08-18  154  

:::::: The code at line 104 was first introduced by commit
:::::: 5d4b53d10af44d2d15e3f551692f1703ac6dbe53 arch/hexagon: fix kernel crash on unimplemented syscalls

:::::: TO: Brian Cain <brian.cain@oss.qualcomm.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
