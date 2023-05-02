Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79B029B4;
	Tue,  2 May 2023 13:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683033628; x=1714569628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6gltgmo8qr8MXwhM7lcSECfkgreytH4zZNMp2Ju4WNw=;
  b=STRERi5BuvLzDPZgBd2D0+EMfdkNmVSwzZN7gS3jitvBjaQ2uMXMpwxJ
   027AoYPMqazv3B7KrCCn1/nOOKPahTWROBlvMs4cqcS5EZG/SMkmOkdo0
   GISKYsgHrShPA1nTxJSRlx4kExfzT6DD+F6xFoRm8iezOR9GeiLAC8QbT
   QHkR4WWJuSSc/R04V80BEB1Ze6e1UoJyYygyIXKjWQP+7T3Pbx35iY19x
   touICPzzP9jarJw7iTPsoD8+Di3x4jBf8nDoVhqq/6KL+s0agUi4P7gdq
   QzxLU9gGzradKz7OjIEIq0tHVE+YF010k5lgubO5Yshpq8gVr4t6rGCrO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="347211423"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="347211423"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 06:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="690280646"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="690280646"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 May 2023 06:20:25 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptpvc-00014G-26;
	Tue, 02 May 2023 13:20:24 +0000
Date: Tue, 2 May 2023 21:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [stable:linux-5.15.y 5080/9999]
 drivers/comedi/drivers/das16m1.c:413:2: warning: performing pointer
 arithmetic on a null pointer has undefined behavior
Message-ID: <202305022159.gYj7BzkI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   8a7f2a5c5aa1648edb4f2029c6ec33870afb7a95
commit: dc235db7b79a352d07d62e8757ad856dbf1564c1 [5080/9999] RISC-V: Make port I/O string accessors actually work
config: riscv-randconfig-r003-20230502 (https://download.01.org/0day-ci/archive/20230502/202305022159.gYj7BzkI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=dc235db7b79a352d07d62e8757ad856dbf1564c1
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout dc235db7b79a352d07d62e8757ad856dbf1564c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/comedi/drivers/ drivers/isdn/hardware/mISDN/ drivers/net/ethernet/8390/ drivers/net/wireless/intersil/hostap/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022159.gYj7BzkI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:660:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
   #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das16m1.c:44:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:668:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das16m1.c:44:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:676:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das16m1.c:44:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:685:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das16m1.c:44:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:694:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das16m1.c:44:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:703:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das16m1.c:44:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/comedi/drivers/das16m1.c:413:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(dev->iobase, devpriv->ai_buffer, num_samples);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   14 warnings generated.
--
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:660:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
   #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das1800.c:73:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:668:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das1800.c:73:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:676:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das1800.c:73:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:685:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das1800.c:73:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:694:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das1800.c:73:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:703:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/das1800.c:73:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/comedi/drivers/das1800.c:345:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(dev->iobase + DAS1800_FIFO, devpriv->fifo_buf, nsamples);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   14 warnings generated.
--
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:660:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
   #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/cb_pcidas.c:56:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:668:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/cb_pcidas.c:56:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:676:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/cb_pcidas.c:56:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:685:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/cb_pcidas.c:56:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:694:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/cb_pcidas.c:56:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:703:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/comedi/drivers/cb_pcidas.c:56:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/comedi/drivers/cb_pcidas.c:992:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(devpriv->pcibar4 + PCIDAS_AO_FIFO_REG,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   drivers/comedi/drivers/cb_pcidas.c:1154:3: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                   insw(devpriv->pcibar2 + PCIDAS_AI_DATA_REG,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   15 warnings generated.
..


vim +413 drivers/comedi/drivers/das16m1.c

9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  373  
71b5f4f11971de drivers/staging/comedi/drivers/das16m1.c Bill Pemberton      2009-03-16  374  static void das16m1_handler(struct comedi_device *dev, unsigned int status)
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  375  {
cd99cfbe84b2a0 drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  376  	struct das16m1_private *devpriv = dev->private;
b31cf3126474e7 drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  377  	struct comedi_subdevice *s = dev->read_subdev;
b31cf3126474e7 drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  378  	struct comedi_async *async = s->async;
b31cf3126474e7 drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  379  	struct comedi_cmd *cmd = &async->cmd;
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  380  	u16 num_samples;
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  381  	u16 hw_counter;
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  382  
2696fb57e6af65 drivers/staging/comedi/drivers/das16m1.c Bill Pemberton      2009-03-27  383  	/* figure out how many samples are in fifo */
eb9bb1f5a84a1f drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2015-02-23  384  	hw_counter = comedi_8254_read(devpriv->counter, 1);
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  385  	/*
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  386  	 * Make sure hardware counter reading is not bogus due to initial
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  387  	 * value not having been loaded yet.
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  388  	 */
58a06a2a64930a drivers/staging/comedi/drivers/das16m1.c Luis de Bethencourt 2015-06-22  389  	if (devpriv->adc_count == 0 &&
58a06a2a64930a drivers/staging/comedi/drivers/das16m1.c Luis de Bethencourt 2015-06-22  390  	    hw_counter == devpriv->initial_hw_count) {
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  391  		num_samples = 0;
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  392  	} else {
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  393  		/*
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  394  		 * The calculation of num_samples looks odd, but it uses the
58a06a2a64930a drivers/staging/comedi/drivers/das16m1.c Luis de Bethencourt 2015-06-22  395  		 * following facts. 16 bit hardware counter is initialized with
58a06a2a64930a drivers/staging/comedi/drivers/das16m1.c Luis de Bethencourt 2015-06-22  396  		 * value of zero (which really means 0x1000).  The counter
58a06a2a64930a drivers/staging/comedi/drivers/das16m1.c Luis de Bethencourt 2015-06-22  397  		 * decrements by one on each conversion (when the counter
58a06a2a64930a drivers/staging/comedi/drivers/das16m1.c Luis de Bethencourt 2015-06-22  398  		 * decrements from zero it goes to 0xffff).  num_samples is a
58a06a2a64930a drivers/staging/comedi/drivers/das16m1.c Luis de Bethencourt 2015-06-22  399  		 * 16 bit variable, so it will roll over in a similar fashion
58a06a2a64930a drivers/staging/comedi/drivers/das16m1.c Luis de Bethencourt 2015-06-22  400  		 * to the hardware counter.  Work it out, and this is what you
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  401  		 * get.
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  402  		 */
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  403  		num_samples = -hw_counter - devpriv->adc_count;
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  404  	}
2696fb57e6af65 drivers/staging/comedi/drivers/das16m1.c Bill Pemberton      2009-03-27  405  	/*  check if we only need some of the points */
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  406  	if (cmd->stop_src == TRIG_COUNT) {
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  407  		if (num_samples > cmd->stop_arg * cmd->chanlist_len)
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  408  			num_samples = cmd->stop_arg * cmd->chanlist_len;
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  409  	}
471c3615e5633a drivers/staging/comedi/drivers/das16m1.c Arushi Singhal      2018-03-05  410  	/*  make sure we don't try to get too many points if fifo has overrun */
4a026c2ebb8c8d drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  411  	if (num_samples > DAS16M1_AI_FIFO_SZ)
4a026c2ebb8c8d drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  412  		num_samples = DAS16M1_AI_FIFO_SZ;
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18 @413  	insw(dev->iobase, devpriv->ai_buffer, num_samples);
b45a7beb3bc3c4 drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2014-10-22  414  	comedi_buf_write_samples(s, devpriv->ai_buffer, num_samples);
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  415  	devpriv->adc_count += num_samples;
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  416  
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  417  	if (cmd->stop_src == TRIG_COUNT) {
6278c5d8929f9d drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2014-03-07  418  		if (devpriv->adc_count >= cmd->stop_arg * cmd->chanlist_len) {
6278c5d8929f9d drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2014-03-07  419  			/* end of acquisition */
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  420  			async->events |= COMEDI_CB_EOA;
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  421  		}
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  422  	}
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  423  
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  424  	/*
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  425  	 * This probably won't catch overruns since the card doesn't generate
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  426  	 * overrun interrupts, but we might as well try.
27eeef415d2b0a drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  427  	 */
cec60bf6ce8a33 drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2016-05-03  428  	if (status & DAS16M1_CS_OVRUN) {
3e6cb74f5632e1 drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2015-01-20  429  		async->events |= COMEDI_CB_ERROR;
b07262b0896b67 drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2014-07-17  430  		dev_err(dev->class_dev, "fifo overflow\n");
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  431  	}
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  432  
05664aa4d378f0 drivers/staging/comedi/drivers/das16m1.c H Hartley Sweeten   2014-09-18  433  	comedi_handle_events(dev, s);
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  434  }
9afbebe411a0f9 drivers/staging/comedi/drivers/das16m1.c Frank Mori Hess     2009-02-18  435  

:::::: The code at line 413 was first introduced by commit
:::::: 9afbebe411a0f96e069c994057d83422147f5c0d Staging: comedi: add das16m1 driver

:::::: TO: Frank Mori Hess <fmhess@users.sourceforge.net>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
