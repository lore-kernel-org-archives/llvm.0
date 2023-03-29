Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F42C6FA8;
	Wed, 29 Mar 2023 18:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680116295; x=1711652295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n+9GNXGkNd6gLjrZsaN0OkjBmTgSohGwMtlnqzuCbD8=;
  b=Wpoc6ctn6UdWumzZKfIpMoIAUzT9ON2MdUQNX80I39sKQ9jlg06B59gS
   X93pzF3dp4XfxlVZUYiaVTLVuIXoHDsM9wqtQRvmQaKx0ytcKw8Z4Ixiu
   slMZWZR60Pz6bIKWS8LzvX0quzupEsQ+uQwMNkZjhXJ2Kd8BD8lCf4dY3
   uoeDQbfgZMtEPFtbEzxoZNBM/TvKeB/Jeq3prekp/DtGP8zPpjt0X4Eud
   dxqYI5PtChGqZSG8LyZzOrxBNU+4EAISkyjjEz0T1WK569ExqGYNDKh8u
   Q5uiLL1N+4nmvjYiEXFna8DOewO3Lw6HDJ20gE3Y89uGJIoMTRfeVHBzh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427248315"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="427248315"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 11:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014149377"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="1014149377"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Mar 2023 11:58:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phazn-000JqW-1i;
	Wed, 29 Mar 2023 18:58:07 +0000
Date: Thu, 30 Mar 2023 02:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2244/7607]
 drivers/net/wireless/legacy/wl3501_cs.c:258:2: warning: performing pointer
 arithmetic on a null pointer has undefined behavior
Message-ID: <202303300253.mdmTTwec-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   198925fae644b0099b66fac1d972721e6e563b17
commit: 298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec [2244/7607] wifi: move raycs, wl3501 and rndis_wlan to legacy directory
config: riscv-buildonly-randconfig-r004-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300253.mdmTTwec-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 298e50ad8eb8fa12ea68bb2da45bb8ef4edcd0ec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/wireless/legacy/ init/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300253.mdmTTwec-lkp@intel.com/

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
https://github.com/intel/lkp-tests
