Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AADA38838A;
	Fri, 17 Jul 2026 20:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318934; cv=none; b=GKw3OccUhbZrPYo+CLdJJGm0ULpi8dqMKo9IQbwF7afqm1bjRscXdWXUA4kOTcTisx3BnzAifLR62FlxaDcA38RbRNreQzEhcnGcj4F25Cv2wJ5C9cC8lqVBsLLrXqSds+BK4z/addrqJEQTFJWHHFPBU0rx1ma4sShaxG+YUVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318934; c=relaxed/simple;
	bh=9dXVOrX8R1ffdObtOxze7LiEf7WZXk0RQQT7Pw78Sng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mLEPlehPh2MRapI7sYQKNGnIoJpfNf3clBWL+3zBwoRtacMhYKv8pF29LUxjHYO+ys/Pr279t7AviZagL+YTuCEdQ1Xlk1ow/Hd2UDDCD2iqpquGn+dvcaEKjQnERjL2hmkfmtHfVCyeuBjosA3cvvB5LkNujav8a2qP5cY07RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mt/J9JJo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mt/J9JJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784318933; x=1815854933;
  h=date:from:to:cc:subject:message-id;
  bh=9dXVOrX8R1ffdObtOxze7LiEf7WZXk0RQQT7Pw78Sng=;
  b=mt/J9JJob6Kp/40m9/W6KLmRLJC8AXgSvboeWtxTu8cM2DONLJoFV88K
   2yn3kSHd8ty/eZ9vHNgqOZPqJDSmARpROhEvWfbaeVcqxeYLCViK5fJf1
   khf/BsDCttUgUaohf/1Zi6QQORZgoUCrod2x20L+qhWDibOZia9FxDZvY
   yDep+vtExF57YYJBx7ygx/81Wy2Lz18gwPbNKWvBDYCEAojCQhxwEcauj
   j/l1vulWXI++BErynk41ueT6oMtLWFtVWBEgDxyH3FicPs1IzVmTXSi6q
   l7UiU8S6PL0ab1FQ6QqgPqoDNnWL0j2bbDbr1oJ5at8uy7H6MqY7Iq/Zs
   g==;
X-CSE-ConnectionGUID: Fb4cTMItREm+lxVowjgFmw==
X-CSE-MsgGUID: bg2W8TsaR+WEUsINKDitoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85088078"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="85088078"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 13:08:52 -0700
X-CSE-ConnectionGUID: 8anbQDFqQUqhyueDSVRw8w==
X-CSE-MsgGUID: CammylDLSWWU0/auJtaFww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="261844675"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jul 2026 13:08:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkorX-00000000T7n-15kN;
	Fri, 17 Jul 2026 20:08:47 +0000
Date: Sat, 18 Jul 2026 04:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 17/70]
 arch/hexagon/kernel/setup.c:50:15: error: use of undeclared identifier
 '__dtb_start'; did you mean '__bss_start'?
Message-ID: <202607180422.RJGiCzNf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Brian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   a8a4b998ba937d19200cfad69da3029fd54a8f5a
commit: 4420ba219f5fcabfce7ba0ecf521f56024aab6d4 [17/70] hexagon: add platform infrastructure
config: hexagon-randconfig-001-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180422.RJGiCzNf-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180422.RJGiCzNf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180422.RJGiCzNf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/setup.c:22:
   arch/hexagon/include/asm/platform.h:29:13: error: conflicting types for 'early_memtest'
      29 | extern void early_memtest(unsigned long start, unsigned long end);
         |             ^
   include/linux/memblock.h:609:20: note: previous definition is here
     609 | static inline void early_memtest(phys_addr_t start, phys_addr_t end) { }
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
729d02cfab12be Brian Cain   2026-01-24  49  	char *p = &external_buffer;
729d02cfab12be Brian Cain   2026-01-24 @50  	void *dtb = &__dtb_start;
e03167b26b7fcf Richard Kuo  2011-10-31  51  
e03167b26b7fcf Richard Kuo  2011-10-31  52  	/*
e03167b26b7fcf Richard Kuo  2011-10-31  53  	 * Set up event bindings to handle exceptions and interrupts.
e03167b26b7fcf Richard Kuo  2011-10-31  54  	 */
e03167b26b7fcf Richard Kuo  2011-10-31  55  	__vmsetvec(_K_VM_event_vector);
e03167b26b7fcf Richard Kuo  2011-10-31  56  
2738f359b1dcae Randy Dunlap 2018-06-14  57  	printk(KERN_INFO "PHYS_OFFSET=0x%08lx\n", PHYS_OFFSET);
729d02cfab12be Brian Cain   2026-01-24  58  	/*  initial machine setup from flattened device tree  */
729d02cfab12be Brian Cain   2026-01-24  59  	mdesc = setup_machine_fdt(dtb);
729d02cfab12be Brian Cain   2026-01-24  60  
729d02cfab12be Brian Cain   2026-01-24  61  	if (!mdesc)
729d02cfab12be Brian Cain   2026-01-24  62  		panic("setup_machine_fdt returned NULL\n");
8f5a0b9dffeb3c Richard Kuo  2013-03-22  63  
729d02cfab12be Brian Cain   2026-01-24  64  	if (mdesc->setup_arch_platform) {
729d02cfab12be Brian Cain   2026-01-24  65  		mdesc->setup_arch_platform();
729d02cfab12be Brian Cain   2026-01-24  66  	}
729d02cfab12be Brian Cain   2026-01-24  67  
729d02cfab12be Brian Cain   2026-01-24  68  	printk("vmversion=0x%08lx\n", vmversion);
729d02cfab12be Brian Cain   2026-01-24  69  	printk("vm build id=0x%08lx\n", __vmgetinfo(vm_info_build_id));
729d02cfab12be Brian Cain   2026-01-24  70  	printk("boot_info=%p\n", boot_info);
e03167b26b7fcf Richard Kuo  2011-10-31  71  	/*
729d02cfab12be Brian Cain   2026-01-24  72  	 * Will need to work on boot specification.
e03167b26b7fcf Richard Kuo  2011-10-31  73  	 */
729d02cfab12be Brian Cain   2026-01-24  74  	//  Todo:  seriously need to fix this for all platforms
729d02cfab12be Brian Cain   2026-01-24  75  #ifdef CONFIG_HEXAGON_MSM8960_FLUID
729d02cfab12be Brian Cain   2026-01-24  76  	{
729d02cfab12be Brian Cain   2026-01-24  77  		unsigned int *magic;
729d02cfab12be Brian Cain   2026-01-24  78  
729d02cfab12be Brian Cain   2026-01-24  79  		p = NULL;
729d02cfab12be Brian Cain   2026-01-24  80  		for (magic = (unsigned int *)&external_buffer;
729d02cfab12be Brian Cain   2026-01-24  81  		     magic < ((unsigned int *)&external_buffer) + 32; magic++) {
729d02cfab12be Brian Cain   2026-01-24  82  			if (*magic == 0x54410009) {
729d02cfab12be Brian Cain   2026-01-24  83  				p = (char *)++magic;
729d02cfab12be Brian Cain   2026-01-24  84  				break;
729d02cfab12be Brian Cain   2026-01-24  85  			}
729d02cfab12be Brian Cain   2026-01-24  86  		}
729d02cfab12be Brian Cain   2026-01-24  87  	}
729d02cfab12be Brian Cain   2026-01-24  88  #endif
e03167b26b7fcf Richard Kuo  2011-10-31  89  

:::::: The code at line 50 was first introduced by commit
:::::: 729d02cfab12bec2f3938c0eb76aa24a7c213866 hexagon: update boot and setup code

:::::: TO: Brian Cain <brian.cain@oss.qualcomm.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
