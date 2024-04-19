Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF610E3;
	Fri, 19 Apr 2024 02:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713493705; cv=none; b=txU0ORad0QUxAuGpT1ICipItizNOZUxkYUKR18eotEnbvMRkmT7QzPP/fzivra+ioGxtQsCFPUNWYjz9tF4hrcGR9pWjPC/3W3oKZAE2RNcI7eXIEqbdRaszqcd88zhnP1wSDO8CdFGuYriWtajFoAi1qt+qZbiQfoAYMEleTJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713493705; c=relaxed/simple;
	bh=5Q9Jknz2XOgLB+zmrBb0f48hCafwrHfpbujfIvFiExo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NxyVaB3mW3xqzA0NfalFLKHaj3bxXUo7zzOMmIpJf2J85t0aHM9n3U6JQmrRmI01JZtoRylKZCNAvsJkO+GzMfqCBJ4ZuUzFgN3NISf4X1mciPUJtsn31YXv4wprsfYa/xkveSKzfYehpgC2mbpYftbwK9DxyFVMArTU4AEMvXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzauChKN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzauChKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713493702; x=1745029702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Q9Jknz2XOgLB+zmrBb0f48hCafwrHfpbujfIvFiExo=;
  b=MzauChKNk7kpPMSF500nqY3BokNF5wixpXdbuf5PWWPaM3k3GZqP1y7J
   NqIQkizAoB1trw8bnCxjSK0sf2R4maOxCQP7oTzgWSQcdKKOxuZubihZO
   s3DyunGNGz/7jGEbz5aPY9RECJ72Ga3QGtYPq80cCMFiXj6kGUv9KxSL/
   h9WLnugtYhs3ffRZxlelCLhftoiDxZMIx3ikVTCVWMakWPZFODaCRrs/b
   L2CZfm49oStSoyYtOpzBJebZU9+pVLhvIMp0aULi9nhRvA1cf0oNCYOLC
   Rna0uWCu2gee38Direyvu3vYJCOvWsUg8/kSmEqxLur58TlLk7y7Reeta
   g==;
X-CSE-ConnectionGUID: Qhk9EQmJSWC4ghr+GsDmWw==
X-CSE-MsgGUID: +NjXuWp0SkiG69OUP1hzKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9250945"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9250945"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 19:28:21 -0700
X-CSE-ConnectionGUID: adcWA6OMTfGkZcmLyrxsWA==
X-CSE-MsgGUID: hVzCIuvdQiiEr94TfTPvwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23260283"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Apr 2024 19:28:20 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxdyF-0009W4-0t;
	Fri, 19 Apr 2024 02:27:50 +0000
Date: Fri, 19 Apr 2024 10:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linuxppc:next-test 11/11] arch/powerpc/kernel/udbg_16550.c:167:9:
 error: call to undeclared function 'inb'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202404191016.zZs7aptf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux next-test
head:   3cfdbc2274139bbcc09a44f8aa18d08c0abfd51e
commit: 3cfdbc2274139bbcc09a44f8aa18d08c0abfd51e [11/11] powerpc: drop port I/O helpers for CONFIG_HAS_IOPORT=n
config: powerpc-sequoia_defconfig (https://download.01.org/0day-ci/archive/20240419/202404191016.zZs7aptf-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404191016.zZs7aptf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404191016.zZs7aptf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/udbg_16550.c:9:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/powerpc/kernel/udbg_16550.c:167:9: error: call to undeclared function 'inb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     167 |         return inb(udbg_uart.pio_base + (reg * udbg_uart_stride));
         |                ^
   arch/powerpc/include/asm/io.h:695:13: note: expanded from macro 'inb'
     695 | #define inb inb
         |             ^
>> arch/powerpc/kernel/udbg_16550.c:172:2: error: call to undeclared function 'outb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     172 |         outb(data, udbg_uart.pio_base + (reg * udbg_uart_stride));
         |         ^
   arch/powerpc/include/asm/io.h:698:14: note: expanded from macro 'outb'
     698 | #define outb outb
         |              ^
   1 warning and 2 errors generated.
--
   In file included from drivers/tty/serial/8250/8250_port.c:18:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/tty/serial/8250/8250_port.c:344:2: error: call to undeclared function 'outb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     344 |         outb(p->hub6 - 1 + offset, p->iobase);
         |         ^
   arch/powerpc/include/asm/io.h:698:14: note: expanded from macro 'outb'
     698 | #define outb outb
         |              ^
>> drivers/tty/serial/8250/8250_port.c:345:9: error: call to undeclared function 'inb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     345 |         return inb(p->iobase + 1);
         |                ^
   arch/powerpc/include/asm/io.h:695:13: note: expanded from macro 'inb'
     695 | #define inb inb
         |             ^
   drivers/tty/serial/8250/8250_port.c:351:2: error: call to undeclared function 'outb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     351 |         outb(p->hub6 - 1 + offset, p->iobase);
         |         ^
   arch/powerpc/include/asm/io.h:698:14: note: expanded from macro 'outb'
     698 | #define outb outb
         |              ^
   drivers/tty/serial/8250/8250_port.c:406:9: error: call to undeclared function 'inb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     406 |         return inb(p->iobase + offset);
         |                ^
   arch/powerpc/include/asm/io.h:695:13: note: expanded from macro 'inb'
     695 | #define inb inb
         |             ^
   drivers/tty/serial/8250/8250_port.c:412:2: error: call to undeclared function 'outb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     412 |         outb(value, p->iobase + offset);
         |         ^
   arch/powerpc/include/asm/io.h:698:14: note: expanded from macro 'outb'
     698 | #define outb outb
         |              ^
   drivers/tty/serial/8250/8250_port.c:1323:14: error: call to undeclared function 'inb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1323 |                 save_ICP = inb_p(ICP);
         |                            ^
   arch/powerpc/include/asm/io.h:847:33: note: expanded from macro 'inb_p'
     847 | #define inb_p(port)             inb(port)
         |                                 ^
   arch/powerpc/include/asm/io.h:695:13: note: expanded from macro 'inb'
     695 | #define inb inb
         |             ^
   drivers/tty/serial/8250/8250_port.c:1324:3: error: call to undeclared function 'outb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1324 |                 outb_p(0x80, ICP);
         |                 ^
   arch/powerpc/include/asm/io.h:848:45: note: expanded from macro 'outb_p'
     848 | #define outb_p(val, port)       (udelay(1), outb((val), (port)))
         |                                             ^
   arch/powerpc/include/asm/io.h:698:14: note: expanded from macro 'outb'
     698 | #define outb outb
         |              ^
   drivers/tty/serial/8250/8250_port.c:1365:3: error: call to undeclared function 'outb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1365 |                 outb_p(save_ICP, ICP);
         |                 ^
   arch/powerpc/include/asm/io.h:848:45: note: expanded from macro 'outb_p'
     848 | #define outb_p(val, port)       (udelay(1), outb((val), (port)))
         |                                             ^
   arch/powerpc/include/asm/io.h:698:14: note: expanded from macro 'outb'
     698 | #define outb outb
         |              ^
   drivers/tty/serial/8250/8250_port.c:2447:3: error: call to undeclared function 'outb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2447 |                 outb_p(0x80, icp);
         |                 ^
   arch/powerpc/include/asm/io.h:848:45: note: expanded from macro 'outb_p'
     848 | #define outb_p(val, port)       (udelay(1), outb((val), (port)))
         |                                             ^
   arch/powerpc/include/asm/io.h:698:14: note: expanded from macro 'outb'
     698 | #define outb outb
         |              ^
   drivers/tty/serial/8250/8250_port.c:2448:3: error: call to undeclared function 'inb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2448 |                 inb_p(icp);
         |                 ^
   arch/powerpc/include/asm/io.h:847:33: note: expanded from macro 'inb_p'
     847 | #define inb_p(port)             inb(port)
         |                                 ^
   arch/powerpc/include/asm/io.h:695:13: note: expanded from macro 'inb'
     695 | #define inb inb
         |             ^
   drivers/tty/serial/8250/8250_port.c:2488:3: error: call to undeclared function 'inb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2488 |                 inb((port->iobase & 0xfe0) | 0x1f);
         |                 ^
   arch/powerpc/include/asm/io.h:695:13: note: expanded from macro 'inb'
     695 | #define inb inb
         |             ^
   1 warning and 11 errors generated.
--
   In file included from drivers/tty/serial/8250/8250_early.c:26:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/tty/serial/8250/8250_early.c:50:10: error: call to undeclared function 'inb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      50 |                 return inb(port->iobase + offset);
         |                        ^
   arch/powerpc/include/asm/io.h:695:13: note: expanded from macro 'inb'
     695 | #define inb inb
         |             ^
>> drivers/tty/serial/8250/8250_early.c:74:3: error: call to undeclared function 'outb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      74 |                 outb(value, port->iobase + offset);
         |                 ^
   arch/powerpc/include/asm/io.h:698:14: note: expanded from macro 'outb'
     698 | #define outb outb
         |              ^
   1 warning and 2 errors generated.


vim +/inb +167 arch/powerpc/kernel/udbg_16550.c

309257484cc1a5 arch/powerpc/kernel/udbg_16550.c Benjamin Herrenschmidt 2013-07-15  164  
309257484cc1a5 arch/powerpc/kernel/udbg_16550.c Benjamin Herrenschmidt 2013-07-15  165  static u8 udbg_uart_in_pio(unsigned int reg)
7f853352e79bf5 arch/ppc64/kernel/udbg_16550.c   Milton Miller          2005-09-06  166  {
309257484cc1a5 arch/powerpc/kernel/udbg_16550.c Benjamin Herrenschmidt 2013-07-15 @167  	return inb(udbg_uart.pio_base + (reg * udbg_uart_stride));
af9c7249071bf8 arch/powerpc/kernel/udbg_16550.c Andrew Klossner        2009-03-09  168  }
af9c7249071bf8 arch/powerpc/kernel/udbg_16550.c Andrew Klossner        2009-03-09  169  
309257484cc1a5 arch/powerpc/kernel/udbg_16550.c Benjamin Herrenschmidt 2013-07-15  170  static void udbg_uart_out_pio(unsigned int reg, u8 data)
af9c7249071bf8 arch/powerpc/kernel/udbg_16550.c Andrew Klossner        2009-03-09  171  {
309257484cc1a5 arch/powerpc/kernel/udbg_16550.c Benjamin Herrenschmidt 2013-07-15 @172  	outb(data, udbg_uart.pio_base + (reg * udbg_uart_stride));
7f853352e79bf5 arch/ppc64/kernel/udbg_16550.c   Milton Miller          2005-09-06  173  }
7f853352e79bf5 arch/ppc64/kernel/udbg_16550.c   Milton Miller          2005-09-06  174  

:::::: The code at line 167 was first introduced by commit
:::::: 309257484cc1a592e8ac5fbdd8cd661be2b80bf8 powerpc: Cleanup udbg_16550 and add support for LPC PIO-only UARTs

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
