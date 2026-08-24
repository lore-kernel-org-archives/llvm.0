Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB679429003;
	Mon, 24 Aug 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579394; cv=none; b=axZrEgMIAnjB9TRsE0FQJZn0bTiMZReddV5ftJpddaYEgMX2wZo42Fpj7uybwHu7ktvYH7ulLF0ZeERAAnNPcLvPuJZauK0d3Wr4fo71ZGmi05XFLxZrVH70hgxr0NZPfjkaegjenxxjAddybUalcrB750tdrBQh43YLkECVBsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579394; c=relaxed/simple;
	bh=GUG4621iiC5IMhZV0tFnZ6/5S6xQg8p2lZxDokPA5hY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JAcW1csAv3Q0mlkGjYi06wJV/NmieY9eaCrufUKrGHSBIs+WMVmM5bnbqIj64HDIfwPzzIu1hzsXytLNg30kT0pXJOFxZXDKMHDaqcBtnbK8xHFvnBbq9CNOEMZrX174/bplTyjQ7zkG4d2IgVUBHwyyCvxhdFDjbANRQ1Dx1RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l051HiFF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l051HiFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787579392; x=1819115392;
  h=date:from:to:cc:subject:message-id;
  bh=GUG4621iiC5IMhZV0tFnZ6/5S6xQg8p2lZxDokPA5hY=;
  b=l051HiFFdg5yelk0NVBVEnoQ5pz8mtVniKNd1gXbmzcRBP5nAzK8o5zP
   OMqAPVDKWox5ja7WZQnEjTw1hju366kEjRRlymVrQeWLiF7eD2/wCZKih
   louUwoeLHwLfPcHD6HTmDQYM8GJfCOJSsblGsH6RJL8FpfGj7oT1ZDxNC
   oIIW5ll3LqZVe7FIer7g4KlLZDlPq/znfwbFhEuZhWl2CDobTf+XWDCvS
   zt95vstoc5OHhYGDXjzJth4ssts/aLA9AT7Hu9Qf2FbCvbEYcsfIbI4J/
   GqeCD97upwhYh1ZK0o21WDcko0I1RYzEShWhIvHpT7ovyBjVK/OCDqHLS
   Q==;
X-CSE-ConnectionGUID: lyXdFBnoSUGjldVj9raj6A==
X-CSE-MsgGUID: SIn4camyT+uZp9XVVlQ/7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88232573"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88232573"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 06:49:52 -0700
X-CSE-ConnectionGUID: +W0CNAq7S5KzcMplUIMDMg==
X-CSE-MsgGUID: V2UAmF9yQAqi1v50w/Za3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="272228252"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Aug 2026 06:49:49 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyV3X-00000000399-08gd;
	Mon, 24 Aug 2026 13:49:44 +0000
Date: Mon, 24 Aug 2026 21:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 26/87]
 arch/hexagon/kernel/devtree.c:130:12: error: call to undeclared function
 'of_get_flat_dt_root'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608242142.XFuz1Lzp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Richard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   844bcfb5bee7bf0e713f61307dc2a4e16963c2f9
commit: c01c2aee2f3a158faf365c893a4578a5a0dee73f [26/87] hexagon: add memory management enhancements
config: hexagon-randconfig-002-20260824 (https://download.01.org/0day-ci/archive/20260824/202608242142.XFuz1Lzp-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608242142.XFuz1Lzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608242142.XFuz1Lzp-lkp@intel.com/

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
   arch/hexagon/kernel/devtree.c:107:16: warning: variable 'dt_root' set but not used [-Wunused-but-set-variable]
     107 |         unsigned long dt_root;
         |                       ^
   2 warnings and 7 errors generated.


vim +/of_get_flat_dt_root +130 arch/hexagon/kernel/devtree.c

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
288801685d7137 Richard Kuo 2025-08-18  @50  	p = of_get_flat_dt_prop(node, "bootargs", &l);
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
5d4b53d10af44d Brian Cain  2026-01-24  104  const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
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
288801685d7137 Richard Kuo 2025-08-18  120  	initial_boot_params = dt_phys;
288801685d7137 Richard Kuo 2025-08-18  121  #else
288801685d7137 Richard Kuo 2025-08-18  122          initial_boot_params = phys_to_virt(dt_phys);
288801685d7137 Richard Kuo 2025-08-18  123  #endif
288801685d7137 Richard Kuo 2025-08-18  124  
288801685d7137 Richard Kuo 2025-08-18  125          /* check device tree validity */
288801685d7137 Richard Kuo 2025-08-18  126          if (fdt_magic(initial_boot_params) != OF_DT_HEADER) {
288801685d7137 Richard Kuo 2025-08-18  127                  return NULL;
288801685d7137 Richard Kuo 2025-08-18  128  	}
288801685d7137 Richard Kuo 2025-08-18  129  
288801685d7137 Richard Kuo 2025-08-18 @130  	dt_root = of_get_flat_dt_root();
288801685d7137 Richard Kuo 2025-08-18  131  
5d4b53d10af44d Brian Cain  2026-01-24 @132  	mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
288801685d7137 Richard Kuo 2025-08-18  133  
288801685d7137 Richard Kuo 2025-08-18  134  	if (!mdesc_best) {
288801685d7137 Richard Kuo 2025-08-18  135  		panic("Unrecognized device tree\n");
288801685d7137 Richard Kuo 2025-08-18  136  	}
288801685d7137 Richard Kuo 2025-08-18  137  
288801685d7137 Richard Kuo 2025-08-18  138          /*
288801685d7137 Richard Kuo 2025-08-18  139  	 * Sets the top level address and size cells which are stored
288801685d7137 Richard Kuo 2025-08-18  140  	 * in globals by the devtree infrastructure.
288801685d7137 Richard Kuo 2025-08-18  141  	 */
288801685d7137 Richard Kuo 2025-08-18 @142          early_init_dt_scan_root();
288801685d7137 Richard Kuo 2025-08-18  143  
288801685d7137 Richard Kuo 2025-08-18  144          /*  Retrieve various information from the /chosen node  */
288801685d7137 Richard Kuo 2025-08-18  145  #ifndef CONFIG_HEXAGON_MSM8974_FLUID
288801685d7137 Richard Kuo 2025-08-18  146  	//  Fixme:  do this consistently for platforms
288801685d7137 Richard Kuo 2025-08-18 @147  	early_init_dt_scan_chosen(boot_command_line);
288801685d7137 Richard Kuo 2025-08-18  148  #endif
288801685d7137 Richard Kuo 2025-08-18  149          /*  Setup memory  */
288801685d7137 Richard Kuo 2025-08-18  150  	//of_scan_flat_dt(early_init_dt_scan_memory, NULL);
288801685d7137 Richard Kuo 2025-08-18  151  
288801685d7137 Richard Kuo 2025-08-18  152  	return mdesc_best;
288801685d7137 Richard Kuo 2025-08-18  153  }
288801685d7137 Richard Kuo 2025-08-18  154  

:::::: The code at line 130 was first introduced by commit
:::::: 288801685d71376da5644b5f11ea806fc06ccea1 hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
