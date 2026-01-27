Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A53716DC28;
	Tue, 27 Jan 2026 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508506; cv=none; b=jygbO2G0gM7oXQoUcRZhm6wakR1vmARA6ELvczDPITtvbxmgsHfxf1Ff4GX8x5+3zJABd6L+9weAxDHDrB0woWAjUwdyg3KlwcSkB6Wds0jY6UK8H02RJtwQi8PW8CIQoheVMNjfhLX6DafhZMpTVb3TxPd/0NlJdhwyFAXNXAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508506; c=relaxed/simple;
	bh=1WQT8KOZ2OGkIybpU6URhQjvfVU0byun95Q19xtBO4E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ao26GIPlZZnH9vNdKs6Tw4sOSM4JUzkF67huh6bxzm8glBbcf9wjnnDGMbE1mVjSWuqKoPXF1ZT1kUQDdym3l8mh32/8edyMOI15fBZz67cV+ofRWsiDPY/NkBUGBt9DC05yD4Rl9Whp67jYDNGD7r0nrNJ4lxzu+SUIJZiIOfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZxgn6pf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZxgn6pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769508504; x=1801044504;
  h=date:from:to:cc:subject:message-id;
  bh=1WQT8KOZ2OGkIybpU6URhQjvfVU0byun95Q19xtBO4E=;
  b=HZxgn6pf0S4HKFicUf8R5ACOk7/SDEYu0XGmrXlZIRhOmUMUnKF9e6Rg
   agPAWRXh7Ddw70KN9EjD96QRwfWbbR5mX081EOVDyS83ALvRgzGeiA1NC
   G6lak/LbGI84sMeMe37T4WoobSjGrRzbuoUmEOnrLzk/BsbgJExe4k7ws
   1xxyXN2xAoO56d4eCHQNlP4cqjcSeBdM1H1XtFHXHJbq4h2Zby6YTsC4y
   hbWE5QeV/QI4pKmzuJDwWDzwEN8yx2ZRSbYqFTau/zeGTb1LiBedhzbNn
   mQHADrpyLMnrz3JBKqjcdPc+SXjT1taB1i2eVSIet3q+mjvUOcnsCXfFD
   Q==;
X-CSE-ConnectionGUID: w9cGac4aSpeCPOMvEu2Seg==
X-CSE-MsgGUID: G04f0nOrTdyUb7mFY8ZMbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="73286118"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="73286118"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:08:18 -0800
X-CSE-ConnectionGUID: CK6NpcXpT1ifyT50LhHahw==
X-CSE-MsgGUID: ynrCtvBxTAmNBnG7coj/7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212400370"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jan 2026 02:08:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkfza-00000000YHz-1NEr;
	Tue, 27 Jan 2026 10:08:14 +0000
Date: Tue, 27 Jan 2026 18:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Richard Kuo <rkuo@quicinc.com>
Subject: [bcain:bcain/boot_qemu 17/38]
 arch/hexagon/kernel/setup.c:50:15: error: use of undeclared identifier
 '__dtb_start'; did you mean '__bss_start'?
Message-ID: <202601271734.z9irEdXr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: 3b5a4aadbb772ade58b62c4db9f3d0b3c27e386e [17/38] hexagon: add platform infrastructure
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260127/202601271734.z9irEdXr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271734.z9irEdXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271734.z9irEdXr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/setup.c:22:
   arch/hexagon/include/asm/platform.h:29:13: error: conflicting types for 'early_memtest'
      29 | extern void early_memtest(unsigned long start, unsigned long end);
         |             ^
   include/linux/memblock.h:610:20: note: previous definition is here
     610 | static inline void early_memtest(phys_addr_t start, phys_addr_t end) { }
         |                    ^
   arch/hexagon/kernel/setup.c:49:13: error: use of undeclared identifier 'external_buffer'
      49 |         char *p = &external_buffer;
         |                    ^~~~~~~~~~~~~~~
>> arch/hexagon/kernel/setup.c:50:15: error: use of undeclared identifier '__dtb_start'; did you mean '__bss_start'?
      50 |         void *dtb = &__dtb_start;
         |                      ^~~~~~~~~~~
         |                      __bss_start
   include/asm-generic/sections.h:37:13: note: '__bss_start' declared here
      37 | extern char __bss_start[], __bss_stop[];
         |             ^
   3 errors generated.


vim +50 arch/hexagon/kernel/setup.c

e03167b26b7fcf Richard Kuo  2011-10-31  41  
e03167b26b7fcf Richard Kuo  2011-10-31  42  /*
e03167b26b7fcf Richard Kuo  2011-10-31  43   * setup_arch -  high level architectural setup routine
e03167b26b7fcf Richard Kuo  2011-10-31  44   * @cmdline_p: pointer to pointer to command-line arguments
e03167b26b7fcf Richard Kuo  2011-10-31  45   */
e03167b26b7fcf Richard Kuo  2011-10-31  46  
e03167b26b7fcf Richard Kuo  2011-10-31  47  void __init setup_arch(char **cmdline_p)
e03167b26b7fcf Richard Kuo  2011-10-31  48  {
d0ca0a1efebd32 Brian Cain   2026-01-24  49  	char *p = &external_buffer;
d0ca0a1efebd32 Brian Cain   2026-01-24 @50  	void *dtb = &__dtb_start;
e03167b26b7fcf Richard Kuo  2011-10-31  51  
e03167b26b7fcf Richard Kuo  2011-10-31  52  	/*
e03167b26b7fcf Richard Kuo  2011-10-31  53  	 * Set up event bindings to handle exceptions and interrupts.
e03167b26b7fcf Richard Kuo  2011-10-31  54  	 */
e03167b26b7fcf Richard Kuo  2011-10-31  55  	__vmsetvec(_K_VM_event_vector);
e03167b26b7fcf Richard Kuo  2011-10-31  56  
2738f359b1dcae Randy Dunlap 2018-06-14  57  	printk(KERN_INFO "PHYS_OFFSET=0x%08lx\n", PHYS_OFFSET);
d0ca0a1efebd32 Brian Cain   2026-01-24  58  	/*  initial machine setup from flattened device tree  */
d0ca0a1efebd32 Brian Cain   2026-01-24  59  	mdesc = setup_machine_fdt(dtb);
d0ca0a1efebd32 Brian Cain   2026-01-24  60  
d0ca0a1efebd32 Brian Cain   2026-01-24  61  	if (!mdesc)
d0ca0a1efebd32 Brian Cain   2026-01-24  62  		panic("setup_machine_fdt returned NULL\n");
8f5a0b9dffeb3c Richard Kuo  2013-03-22  63  
d0ca0a1efebd32 Brian Cain   2026-01-24  64  	if (mdesc->setup_arch_platform) {
d0ca0a1efebd32 Brian Cain   2026-01-24  65  		mdesc->setup_arch_platform();
d0ca0a1efebd32 Brian Cain   2026-01-24  66  	}
d0ca0a1efebd32 Brian Cain   2026-01-24  67  
d0ca0a1efebd32 Brian Cain   2026-01-24  68  	printk("vmversion=0x%08lx\n", vmversion);
d0ca0a1efebd32 Brian Cain   2026-01-24  69  	printk("vm build id=0x%08lx\n", __vmgetinfo(vm_info_build_id));
d0ca0a1efebd32 Brian Cain   2026-01-24  70  	printk("boot_info=%p\n", boot_info);
e03167b26b7fcf Richard Kuo  2011-10-31  71  	/*
d0ca0a1efebd32 Brian Cain   2026-01-24  72  	 * Will need to work on boot specification.
e03167b26b7fcf Richard Kuo  2011-10-31  73  	 */
d0ca0a1efebd32 Brian Cain   2026-01-24  74  	//  Todo:  seriously need to fix this for all platforms
d0ca0a1efebd32 Brian Cain   2026-01-24  75  #ifdef CONFIG_HEXAGON_MSM8960_FLUID
d0ca0a1efebd32 Brian Cain   2026-01-24  76  	{
d0ca0a1efebd32 Brian Cain   2026-01-24  77  		unsigned int *magic;
d0ca0a1efebd32 Brian Cain   2026-01-24  78  
d0ca0a1efebd32 Brian Cain   2026-01-24  79  		p = NULL;
d0ca0a1efebd32 Brian Cain   2026-01-24  80  		for (magic = (unsigned int *)&external_buffer;
d0ca0a1efebd32 Brian Cain   2026-01-24  81  		     magic < ((unsigned int *)&external_buffer) + 32; magic++) {
d0ca0a1efebd32 Brian Cain   2026-01-24  82  			if (*magic == 0x54410009) {
d0ca0a1efebd32 Brian Cain   2026-01-24  83  				p = (char *)++magic;
d0ca0a1efebd32 Brian Cain   2026-01-24  84  				break;
d0ca0a1efebd32 Brian Cain   2026-01-24  85  			}
d0ca0a1efebd32 Brian Cain   2026-01-24  86  		}
d0ca0a1efebd32 Brian Cain   2026-01-24  87  	}
d0ca0a1efebd32 Brian Cain   2026-01-24  88  #endif
e03167b26b7fcf Richard Kuo  2011-10-31  89  

:::::: The code at line 50 was first introduced by commit
:::::: d0ca0a1efebd3204a0a0c8b7df0db18e9bfd0a1e hexagon: update boot and setup code

:::::: TO: Brian Cain <brian.cain@oss.qualcomm.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
