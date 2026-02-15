Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079631D95A3;
	Sun, 15 Feb 2026 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771144665; cv=none; b=Nv0+6Y58qd6hDbX/igEBoFr7qteD7uj5L8dQBisIxzSyQYDhRFmJdUoIHlZAnbaK1xWqXswtYtPeQP+++IirpTq6Gk4wHQPcItaI49A1ejKMmMycvxbQJIOW5brzPdi6Nhqpbb/UuwI59aRPRk2H71rB0s9kcFyVpvO/Kz+yiKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771144665; c=relaxed/simple;
	bh=gevmfH0lzdDMq+QRIXOiajm2hkSQ0nkWKT/2tuWbMyE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bBwkXvfeWl3KpyqVGuFfFHRegvVa+4vxy+YrFbF4zJMqpSe1hMztO/IS6Ymoh2++2BLj5froQDsbs39OghQrC/jQXjkFWED9XApQNA/VyEZIfi2P1uXyVBbBqzSgpZWMicRmS6CuY1Y4GfPbfyPjFgfqXbg/xkj4f0Z4AGghLLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAruWouN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAruWouN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771144663; x=1802680663;
  h=date:from:to:cc:subject:message-id;
  bh=gevmfH0lzdDMq+QRIXOiajm2hkSQ0nkWKT/2tuWbMyE=;
  b=HAruWouNQ9Lyw1JskHPTcybymgxsOvI8NMwh3DLcP8lGNRab/TjW3Vqt
   QdytmL+p3CXmM/9kpO9QkKbBFbfZeXHeFC0Qb0Czu88zovyRiO++RFrGi
   jDoO7Ibq1KcEzZgpaO+lT1aOSG81CgsMoLWSqOJi4DCklnRC/8s6ZBT9X
   q2s4pI0WZ0njPqgbw/lSK9tEm9A0x8hM2HSIeIsb5GP2WX3lo6gDKMxSB
   dgD6TdAB5ntDvg0KyzANsug97cZiJosbYgOlxk4npA6hkFUKr9Q12JxXO
   JnFGR8EIRWVc7ehsL4hORIPfmqmKBRNPPgC7uaRB7zfzZ3W9wxkTUF8vU
   Q==;
X-CSE-ConnectionGUID: QTTtpRxHQ4efJx7JAYA1Ew==
X-CSE-MsgGUID: PaOjUx/OQQCIw+3gxMwU1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="83367110"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="83367110"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 00:37:42 -0800
X-CSE-ConnectionGUID: pw6oQYFbTES2EFpiFeI+eg==
X-CSE-MsgGUID: eIQ5HO6HQzCgW55KnIum1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="212142619"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Feb 2026 00:37:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrXdK-00000000y3w-0yjv;
	Sun, 15 Feb 2026 08:37:38 +0000
Date: Sun, 15 Feb 2026 16:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Richard Kuo <rkuo@quicinc.com>
Subject: [bcain:bcain/boot_qemu 17/38]
 arch/hexagon/kernel/setup.c:49:13: error: use of undeclared identifier
 'external_buffer'
Message-ID: <202602151646.8KHh2kUq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   ed0968ffeee877f8f95703933ab1aca99c643408
commit: f413b9dd0caed096d0b867b56d99c962bd9b2c20 [17/38] hexagon: add platform infrastructure
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260215/202602151646.8KHh2kUq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151646.8KHh2kUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151646.8KHh2kUq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/setup.c:22:
   arch/hexagon/include/asm/platform.h:29:13: error: conflicting types for 'early_memtest'
      29 | extern void early_memtest(unsigned long start, unsigned long end);
         |             ^
   include/linux/memblock.h:610:20: note: previous definition is here
     610 | static inline void early_memtest(phys_addr_t start, phys_addr_t end) { }
         |                    ^
>> arch/hexagon/kernel/setup.c:49:13: error: use of undeclared identifier 'external_buffer'
      49 |         char *p = &external_buffer;
         |                    ^~~~~~~~~~~~~~~
   arch/hexagon/kernel/setup.c:50:15: error: use of undeclared identifier '__dtb_start'; did you mean '__bss_start'?
      50 |         void *dtb = &__dtb_start;
         |                      ^~~~~~~~~~~
         |                      __bss_start
   include/asm-generic/sections.h:37:13: note: '__bss_start' declared here
      37 | extern char __bss_start[], __bss_stop[];
         |             ^
   3 errors generated.


vim +/external_buffer +49 arch/hexagon/kernel/setup.c

e03167b26b7fcff Richard Kuo  2011-10-31  41  
e03167b26b7fcff Richard Kuo  2011-10-31  42  /*
e03167b26b7fcff Richard Kuo  2011-10-31  43   * setup_arch -  high level architectural setup routine
e03167b26b7fcff Richard Kuo  2011-10-31  44   * @cmdline_p: pointer to pointer to command-line arguments
e03167b26b7fcff Richard Kuo  2011-10-31  45   */
e03167b26b7fcff Richard Kuo  2011-10-31  46  
e03167b26b7fcff Richard Kuo  2011-10-31  47  void __init setup_arch(char **cmdline_p)
e03167b26b7fcff Richard Kuo  2011-10-31  48  {
f79c17d9a3e6ecd Brian Cain   2026-01-24 @49  	char *p = &external_buffer;
f79c17d9a3e6ecd Brian Cain   2026-01-24  50  	void *dtb = &__dtb_start;
e03167b26b7fcff Richard Kuo  2011-10-31  51  
e03167b26b7fcff Richard Kuo  2011-10-31  52  	/*
e03167b26b7fcff Richard Kuo  2011-10-31  53  	 * Set up event bindings to handle exceptions and interrupts.
e03167b26b7fcff Richard Kuo  2011-10-31  54  	 */
e03167b26b7fcff Richard Kuo  2011-10-31  55  	__vmsetvec(_K_VM_event_vector);
e03167b26b7fcff Richard Kuo  2011-10-31  56  
2738f359b1dcae5 Randy Dunlap 2018-06-14  57  	printk(KERN_INFO "PHYS_OFFSET=0x%08lx\n", PHYS_OFFSET);
f79c17d9a3e6ecd Brian Cain   2026-01-24  58  	/*  initial machine setup from flattened device tree  */
f79c17d9a3e6ecd Brian Cain   2026-01-24  59  	mdesc = setup_machine_fdt(dtb);
f79c17d9a3e6ecd Brian Cain   2026-01-24  60  
f79c17d9a3e6ecd Brian Cain   2026-01-24  61  	if (!mdesc)
f79c17d9a3e6ecd Brian Cain   2026-01-24  62  		panic("setup_machine_fdt returned NULL\n");
8f5a0b9dffeb3cb Richard Kuo  2013-03-22  63  
f79c17d9a3e6ecd Brian Cain   2026-01-24  64  	if (mdesc->setup_arch_platform) {
f79c17d9a3e6ecd Brian Cain   2026-01-24  65  		mdesc->setup_arch_platform();
f79c17d9a3e6ecd Brian Cain   2026-01-24  66  	}
f79c17d9a3e6ecd Brian Cain   2026-01-24  67  
f79c17d9a3e6ecd Brian Cain   2026-01-24  68  	printk("vmversion=0x%08lx\n", vmversion);
f79c17d9a3e6ecd Brian Cain   2026-01-24  69  	printk("vm build id=0x%08lx\n", __vmgetinfo(vm_info_build_id));
f79c17d9a3e6ecd Brian Cain   2026-01-24  70  	printk("boot_info=%p\n", boot_info);
e03167b26b7fcff Richard Kuo  2011-10-31  71  	/*
f79c17d9a3e6ecd Brian Cain   2026-01-24  72  	 * Will need to work on boot specification.
e03167b26b7fcff Richard Kuo  2011-10-31  73  	 */
f79c17d9a3e6ecd Brian Cain   2026-01-24  74  	//  Todo:  seriously need to fix this for all platforms
f79c17d9a3e6ecd Brian Cain   2026-01-24  75  #ifdef CONFIG_HEXAGON_MSM8960_FLUID
f79c17d9a3e6ecd Brian Cain   2026-01-24  76  	{
f79c17d9a3e6ecd Brian Cain   2026-01-24  77  		unsigned int *magic;
f79c17d9a3e6ecd Brian Cain   2026-01-24  78  
f79c17d9a3e6ecd Brian Cain   2026-01-24  79  		p = NULL;
f79c17d9a3e6ecd Brian Cain   2026-01-24  80  		for (magic = (unsigned int *)&external_buffer;
f79c17d9a3e6ecd Brian Cain   2026-01-24  81  		     magic < ((unsigned int *)&external_buffer) + 32; magic++) {
f79c17d9a3e6ecd Brian Cain   2026-01-24  82  			if (*magic == 0x54410009) {
f79c17d9a3e6ecd Brian Cain   2026-01-24  83  				p = (char *)++magic;
f79c17d9a3e6ecd Brian Cain   2026-01-24  84  				break;
f79c17d9a3e6ecd Brian Cain   2026-01-24  85  			}
f79c17d9a3e6ecd Brian Cain   2026-01-24  86  		}
f79c17d9a3e6ecd Brian Cain   2026-01-24  87  	}
f79c17d9a3e6ecd Brian Cain   2026-01-24  88  #endif
e03167b26b7fcff Richard Kuo  2011-10-31  89  

:::::: The code at line 49 was first introduced by commit
:::::: f79c17d9a3e6ecd0eb96254b4c608b9305a410ce hexagon: update boot and setup code

:::::: TO: Brian Cain <brian.cain@oss.qualcomm.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
