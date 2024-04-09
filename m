Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505DC1591E9;
	Tue,  9 Apr 2024 23:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712707096; cv=none; b=ACo2gfQC7yjJQF9k/6DgvgqNkpBH6Uf198OOb54c+qjSH1BzPpyWPZk2JyWTUtZFU5TysHQhoMqTr3aLKgyQbIqhjCfebQyfuk0ert4cwktE3vX754eddrWdupNsr5m4ip4MBKY6aLBGRSjsxTbQ6hQlcYasgv5vEIh8QTp2uHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712707096; c=relaxed/simple;
	bh=9rzUEjvP2ma+rOu/W57f6dqeXYSoOmtQmnnCKjY5XZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P5x8Y3yWYuVTBtreJV71ONPd2DkUFiWpx9erIqCHWiURZxhIWPsTGadJDKhfZniAX/yYGCVyiahPFzfGS8HxXDZ9FYdS3G2A98jdtXVOfWI7wKl5LVuzE7NuOU+0EkKhx8NgDRUrjGr3AweW/cJxw3sgQ6zI3513/M+OblkKxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wnaj9zcb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wnaj9zcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712707095; x=1744243095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9rzUEjvP2ma+rOu/W57f6dqeXYSoOmtQmnnCKjY5XZA=;
  b=Wnaj9zcbZTgxlHkxfa8euw2sE3v93EM+nOscnTcsR6T+hANllpWg5YOU
   lAvJJavuswwYYNcYVzVTfjpVwqbnU3YkwpDl8pLzT7uPAcTbsm1TLYnp4
   ku3NtfnAI8AajXgl5Le/Z3LE9ZJ1lMDY/ruYHw4DPxtMqAQqUj7sSM5sl
   Jj/QXXPmGNYT6GILGAJJJOV39KkKsHALO46JhNCg4z0Vstu/sS0qfOfIq
   Zz0W9n0KhI4bt+2y0Niu0xtsQEtIYXVnuc8iGRJW0ftkv2hpcysq2RTnz
   cm9vM/GETP2AxoClBPN8P/w6gyBdLPeSwv+T9fnUgJ8V7Sjab+Bn2Dwoj
   Q==;
X-CSE-ConnectionGUID: kB3ox8DjQIGMAMwwvGnBMw==
X-CSE-MsgGUID: 23QRrKxDTcO0kEGsAAIb1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7909529"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7909529"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:58:12 -0700
X-CSE-ConnectionGUID: IC9TbAQGT6awCl+mLeyHiA==
X-CSE-MsgGUID: PdcHdcPfSWuyx2SUxyxRXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25060698"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2024 16:58:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruLLs-0006dQ-07;
	Tue, 09 Apr 2024 23:58:08 +0000
Date: Wed, 10 Apr 2024 07:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox 20/22] arch/um/kernel/um_arch.c:440:6:
 error: conflicting types for 'apply_seal_endbr'
Message-ID: <202404100757.ZC5IlOtE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   a14551111ff8bbf3c520771e89892d599463da71
commit: 7f45ca3e4336a3d09724b582e0d1776f7b8423eb [20/22] x86/module: perpare module loading for ROX allocations of text
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240410/202404100757.ZC5IlOtE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100757.ZC5IlOtE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100757.ZC5IlOtE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for function 'read_initrd' [-Wmissing-prototypes]
     408 | int __init __weak read_initrd(void)
         |                   ^
   arch/um/kernel/um_arch.c:408:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     408 | int __init __weak read_initrd(void)
         | ^
         | static 
>> arch/um/kernel/um_arch.c:440:6: error: conflicting types for 'apply_seal_endbr'
     440 | void apply_seal_endbr(s32 *start, s32 *end)
         |      ^
   arch/x86/include/asm/alternative.h:106:13: note: previous declaration is here
     106 | extern void apply_seal_endbr(s32 *start, s32 *end, struct module *mod);
         |             ^
>> arch/um/kernel/um_arch.c:444:6: error: conflicting types for 'apply_retpolines'
     444 | void apply_retpolines(s32 *start, s32 *end)
         |      ^
   arch/x86/include/asm/alternative.h:104:13: note: previous declaration is here
     104 | extern void apply_retpolines(s32 *start, s32 *end, struct module *mod);
         |             ^
>> arch/um/kernel/um_arch.c:448:6: error: conflicting types for 'apply_returns'
     448 | void apply_returns(s32 *start, s32 *end)
         |      ^
   arch/x86/include/asm/alternative.h:105:13: note: previous declaration is here
     105 | extern void apply_returns(s32 *start, s32 *end, struct module *mod);
         |             ^
>> arch/um/kernel/um_arch.c:452:6: error: conflicting types for 'apply_fineibt'
     452 | void apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
         |      ^
   arch/x86/include/asm/alternative.h:107:13: note: previous declaration is here
     107 | extern void apply_fineibt(s32 *start_retpoline, s32 *end_retpoine,
         |             ^
>> arch/um/kernel/um_arch.c:457:6: error: conflicting types for 'apply_alternatives'
     457 | void apply_alternatives(struct alt_instr *start, struct alt_instr *end)
         |      ^
   arch/x86/include/asm/alternative.h:102:13: note: previous declaration is here
     102 | extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end,
         |             ^
   arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for function 'text_poke' [-Wmissing-prototypes]
     461 | void *text_poke(void *addr, const void *opcode, size_t len)
         |       ^
   arch/um/kernel/um_arch.c:461:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     461 | void *text_poke(void *addr, const void *opcode, size_t len)
         | ^
         | static 
   arch/um/kernel/um_arch.c:473:6: warning: no previous prototype for function 'text_poke_sync' [-Wmissing-prototypes]
     473 | void text_poke_sync(void)
         |      ^
   arch/um/kernel/um_arch.c:473:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     473 | void text_poke_sync(void)
         | ^
         | static 
   15 warnings and 5 errors generated.


vim +/apply_seal_endbr +440 arch/um/kernel/um_arch.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  407  
5b4236e17cc1bd Masami Hiramatsu   2017-04-27 @408  int __init __weak read_initrd(void)
5b4236e17cc1bd Masami Hiramatsu   2017-04-27  409  {
5b4236e17cc1bd Masami Hiramatsu   2017-04-27  410  	return 0;
5b4236e17cc1bd Masami Hiramatsu   2017-04-27  411  }
5b4236e17cc1bd Masami Hiramatsu   2017-04-27  412  
^1da177e4c3f41 Linus Torvalds     2005-04-16  413  void __init setup_arch(char **cmdline_p)
^1da177e4c3f41 Linus Torvalds     2005-04-16  414  {
0b9ba6135d7f18 Jason A. Donenfeld 2022-07-13  415  	u8 rng_seed[32];
0b9ba6135d7f18 Jason A. Donenfeld 2022-07-13  416  
b63236972e1344 Richard Weinberger 2016-06-12  417  	stack_protections((unsigned long) &init_thread_info);
b63236972e1344 Richard Weinberger 2016-06-12  418  	setup_physmem(uml_physmem, uml_reserved, physmem_size, highmem);
b63236972e1344 Richard Weinberger 2016-06-12  419  	mem_total_pages(physmem_size, iomem_size, highmem);
b31297f04e86e4 Vincent Whitchurch 2021-12-08  420  	uml_dtb_init();
5b4236e17cc1bd Masami Hiramatsu   2017-04-27  421  	read_initrd();
b63236972e1344 Richard Weinberger 2016-06-12  422  
^1da177e4c3f41 Linus Torvalds     2005-04-16  423  	paging_init();
e6e4d33f380fbf Wolfram Sang       2022-08-18  424  	strscpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
^1da177e4c3f41 Linus Torvalds     2005-04-16  425  	*cmdline_p = command_line;
b4ffb6ad8d8477 Jeff Dike          2007-05-06  426  	setup_hostinfo(host_info, sizeof host_info);
0b9ba6135d7f18 Jason A. Donenfeld 2022-07-13  427  
0b9ba6135d7f18 Jason A. Donenfeld 2022-07-13  428  	if (os_getrandom(rng_seed, sizeof(rng_seed), 0) == sizeof(rng_seed)) {
0b9ba6135d7f18 Jason A. Donenfeld 2022-07-13  429  		add_bootloader_randomness(rng_seed, sizeof(rng_seed));
0b9ba6135d7f18 Jason A. Donenfeld 2022-07-13  430  		memzero_explicit(rng_seed, sizeof(rng_seed));
0b9ba6135d7f18 Jason A. Donenfeld 2022-07-13  431  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  432  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  433  
9349b5cd0908f8 Thomas Gleixner    2023-06-14  434  void __init arch_cpu_finalize_init(void)
^1da177e4c3f41 Linus Torvalds     2005-04-16  435  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  436  	arch_check_bugs();
8e367065eea04a Jeff Dike          2006-03-27  437  	os_check_bugs();
^1da177e4c3f41 Linus Torvalds     2005-04-16  438  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  439  
be0fffa5ca894a Peter Zijlstra     2023-06-22 @440  void apply_seal_endbr(s32 *start, s32 *end)
ed53a0d971926e Peter Zijlstra     2022-03-08  441  {
ed53a0d971926e Peter Zijlstra     2022-03-08  442  }
ed53a0d971926e Peter Zijlstra     2022-03-08  443  
7508500900814d Peter Zijlstra     2021-10-26 @444  void apply_retpolines(s32 *start, s32 *end)
7508500900814d Peter Zijlstra     2021-10-26  445  {
7508500900814d Peter Zijlstra     2021-10-26  446  }
7508500900814d Peter Zijlstra     2021-10-26  447  
564d9981063973 Peter Zijlstra     2022-07-14 @448  void apply_returns(s32 *start, s32 *end)
564d9981063973 Peter Zijlstra     2022-07-14  449  {
564d9981063973 Peter Zijlstra     2022-07-14  450  }
564d9981063973 Peter Zijlstra     2022-07-14  451  
931ab63664f02b Peter Zijlstra     2022-10-27 @452  void apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
931ab63664f02b Peter Zijlstra     2022-10-27  453  		   s32 *start_cfi, s32 *end_cfi)
931ab63664f02b Peter Zijlstra     2022-10-27  454  {
931ab63664f02b Peter Zijlstra     2022-10-27  455  }
931ab63664f02b Peter Zijlstra     2022-10-27  456  
9a0b5817ad97bb Gerd Hoffmann      2006-03-23 @457  void apply_alternatives(struct alt_instr *start, struct alt_instr *end)
9a0b5817ad97bb Gerd Hoffmann      2006-03-23  458  {
9a0b5817ad97bb Gerd Hoffmann      2006-03-23  459  }
88fc078a7a8f67 Peter Zijlstra     2020-04-29  460  

:::::: The code at line 440 was first introduced by commit
:::::: be0fffa5ca894a971a31c5e28aa77b633a97d1dc x86/alternative: Rename apply_ibt_endbr()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
