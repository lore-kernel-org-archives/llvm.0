Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B9633CD;
	Thu, 22 Jun 2023 07:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687417597; x=1718953597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wq6+yTnYpMw02hwVnOW3jogD7Dj8TJmexZDFIKeaBo=;
  b=RBKASMlbC4xDjszXfXLHo7zIobgDio1sPsP5/JeM9D3Mk8JDU3Xb2zdu
   hf085UUVqi9D5zEWiBA5H8y7IissVLJ3Hv/8nHBxEqmM5c/PN9GGr0N84
   jXd6TmAZta6+n441rwGQ0KVBWQjG/nOw60OKFyASfPxVnja5fNtXA2X28
   saVjAXvTudPMsDBtktvaL1n0nPO9DI/Z7bsdEPQCwsZxTeP8aH070BIVy
   Cm2ACs/rUyc6iQH11DH3aiBwNncJ5B/ZhCgRkhedVfQ2C1ENf+m9RwAoj
   lfpUhWUVbv4xB57iT4au4E9UQkqV0kiiD/Q2fPXyS8NHbrjEi88OtR/yP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340746379"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="340746379"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 00:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="708979704"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="708979704"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Jun 2023 00:06:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCEOl-0007Ox-2L;
	Thu, 22 Jun 2023 07:06:31 +0000
Date: Thu, 22 Jun 2023 15:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/legacy/wl3501_cs.c:258:2: warning: performing
 pointer arithmetic on a null pointer has undefined behavior
Message-ID: <202306221526.elbjF1ot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalle,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dad9774deaf1cf8e8f7483310dfb2690310193d2
commit: 298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec wifi: move raycs, wl3501 and rndis_wlan to legacy directory
date:   3 months ago
config: riscv-randconfig-r021-20230621 (https://download.01.org/0day-ci/archive/20230622/202306221526.elbjF1ot-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221526.elbjF1ot-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306221526.elbjF1ot-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:743:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
   #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/legacy/wl3501_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/legacy/wl3501_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/legacy/wl3501_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/legacy/wl3501_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/legacy/wl3501_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/legacy/wl3501_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/net/wireless/legacy/wl3501_cs.c:258:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           wl3501_outsb(this->base_addr + WL3501_NIC_IODPA, src, size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/legacy/wl3501_cs.c:70:33: note: expanded from macro 'wl3501_outsb'
   #define wl3501_outsb(a, b, c) { outsb(a, b, c); slow_down_io(); }
                                   ^~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   drivers/net/wireless/legacy/wl3501_cs.c:281:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insb(this->base_addr + WL3501_NIC_IODPA, dest, size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
   #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   15 warnings generated.


vim +258 drivers/net/wireless/legacy/wl3501_cs.c

^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  237  
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  238  /**
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  239   * wl3501_set_to_wla - Move 'size' bytes from PC to card
2307d0bc9d8b60 drivers/net/wireless/wl3501_cs.c Lee Jones      2020-08-26  240   * @this: Card
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  241   * @dest: Card addressing space
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  242   * @src: PC addressing space
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  243   * @size: Bytes to move
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  244   *
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  245   * Move 'size' bytes from PC to card. (Shouldn't be interrupted)
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  246   */
ff1d2767d5a43c drivers/net/wireless/wl3501_cs.c Jouni Malinen  2005-05-12  247  static void wl3501_set_to_wla(struct wl3501_card *this, u16 dest, void *src,
ff1d2767d5a43c drivers/net/wireless/wl3501_cs.c Jouni Malinen  2005-05-12  248  			      int size)
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  249  {
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  250  	/* switch to SRAM Page 0 */
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  251  	wl3501_switch_page(this, (dest & 0x8000) ? WL3501_BSS_SPAGE1 :
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  252  						   WL3501_BSS_SPAGE0);
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  253  	/* set LMAL and LMAH */
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  254  	wl3501_outb(dest & 0xff, this->base_addr + WL3501_NIC_LMAL);
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  255  	wl3501_outb(((dest >> 8) & 0x7f), this->base_addr + WL3501_NIC_LMAH);
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  256  
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  257  	/* rep out to Port A */
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16 @258  	wl3501_outsb(this->base_addr + WL3501_NIC_IODPA, src, size);
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  259  }
^1da177e4c3f41 drivers/net/wireless/wl3501_cs.c Linus Torvalds 2005-04-16  260  

:::::: The code at line 258 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
