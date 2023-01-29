Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0A933DF;
	Sun, 29 Jan 2023 21:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675027534; x=1706563534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=guLL85v1lH/uQs0KAfGWDW+t8ydPJk7FVKOrIuGZyTQ=;
  b=hPoawV/rm0QOhujJb8FYduJ8uHvDQ2flz4RMKL/CqFYV2I7UPCk0Ced8
   TzitqippPK8FE94xKEMFYkLLSBXx1loYZk+5x12cv2XO6E2g22A36x1SO
   RNUvE4R3kprYhN2zR3q0MwV2ISfSGI743ICH/To7yorT3MbwV+Wdq9Kou
   hPeGX6XBr8V5ascl0YgA18TwvsEXjIq7i9/fiBzCSvf5u2GsbZ4V7eOdz
   PgtHSZfTo57QKDSQG1Hdzpoh7A5I/6+Xi3elGIo0B+xf9BISxxYR72J7a
   HKzIwb9oGDYu55jQIekkjPKsg46Aq/gMJRB9zyTXrCCyYn0Z6015Xjf1X
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307781912"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="307781912"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 13:25:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="694354033"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="694354033"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Jan 2023 13:25:31 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMFB4-00037y-01;
	Sun, 29 Jan 2023 21:25:30 +0000
Date: Mon, 30 Jan 2023 05:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [stable:linux-5.15.y 7114/9999] drivers/usb/host/isp1362.h:660:3:
 warning: performing pointer arithmetic on a null pointer has undefined
 behavior
Message-ID: <202301300506.6Hcjp6s5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   aabd5ba7e9b03e9a211a4842ab4a93d46f684d2c
commit: dc235db7b79a352d07d62e8757ad856dbf1564c1 [7114/9999] RISC-V: Make port I/O string accessors actually work
config: riscv-randconfig-r026-20230129 (https://download.01.org/0day-ci/archive/20230130/202301300506.6Hcjp6s5-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

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
   In file included from drivers/usb/host/isp1362-hcd.c:72:
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
   In file included from drivers/usb/host/isp1362-hcd.c:72:
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
   In file included from drivers/usb/host/isp1362-hcd.c:72:
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
   In file included from drivers/usb/host/isp1362-hcd.c:72:
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
   In file included from drivers/usb/host/isp1362-hcd.c:72:
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
   In file included from drivers/usb/host/isp1362-hcd.c:72:
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
   In file included from drivers/usb/host/isp1362-hcd.c:96:
>> drivers/usb/host/isp1362.h:660:3: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                   insw((unsigned long)isp1362_hcd->data_reg, dp, len >> 1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/usb/host/isp1362-hcd.c:96:
   drivers/usb/host/isp1362.h:705:3: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                   outsw((unsigned long)isp1362_hcd->data_reg, dp, len >> 1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   15 warnings generated.


vim +660 drivers/usb/host/isp1362.h

a9d43091c5be1e Lothar Wassmann 2009-07-16  638  
a9d43091c5be1e Lothar Wassmann 2009-07-16  639  /* use readsw/writesw to access the fifo whenever possible */
a9d43091c5be1e Lothar Wassmann 2009-07-16  640  /* assume HCDIRDATA or XFERCTR & addr_reg have been set up */
a9d43091c5be1e Lothar Wassmann 2009-07-16  641  static void isp1362_read_fifo(struct isp1362_hcd *isp1362_hcd, void *buf, u16 len)
a9d43091c5be1e Lothar Wassmann 2009-07-16  642  {
a9d43091c5be1e Lothar Wassmann 2009-07-16  643  	u8 *dp = buf;
a9d43091c5be1e Lothar Wassmann 2009-07-16  644  	u16 data;
a9d43091c5be1e Lothar Wassmann 2009-07-16  645  
a9d43091c5be1e Lothar Wassmann 2009-07-16  646  	if (!len)
a9d43091c5be1e Lothar Wassmann 2009-07-16  647  		return;
a9d43091c5be1e Lothar Wassmann 2009-07-16  648  
a9d43091c5be1e Lothar Wassmann 2009-07-16  649  	RDBG("%s: Reading %d byte from fifo to mem @ %p\n", __func__, len, buf);
a9d43091c5be1e Lothar Wassmann 2009-07-16  650  #if USE_32BIT
a9d43091c5be1e Lothar Wassmann 2009-07-16  651  	if (len >= 4) {
a9d43091c5be1e Lothar Wassmann 2009-07-16  652  		RDBG("%s: Using readsl for %d dwords\n", __func__, len >> 2);
a9d43091c5be1e Lothar Wassmann 2009-07-16  653  		readsl(isp1362_hcd->data_reg, dp, len >> 2);
a9d43091c5be1e Lothar Wassmann 2009-07-16  654  		dp += len & ~3;
a9d43091c5be1e Lothar Wassmann 2009-07-16  655  		len &= 3;
a9d43091c5be1e Lothar Wassmann 2009-07-16  656  	}
a9d43091c5be1e Lothar Wassmann 2009-07-16  657  #endif
a9d43091c5be1e Lothar Wassmann 2009-07-16  658  	if (len >= 2) {
a9d43091c5be1e Lothar Wassmann 2009-07-16  659  		RDBG("%s: Using readsw for %d words\n", __func__, len >> 1);
a9d43091c5be1e Lothar Wassmann 2009-07-16 @660  		insw((unsigned long)isp1362_hcd->data_reg, dp, len >> 1);
a9d43091c5be1e Lothar Wassmann 2009-07-16  661  		dp += len & ~1;
a9d43091c5be1e Lothar Wassmann 2009-07-16  662  		len &= 1;
a9d43091c5be1e Lothar Wassmann 2009-07-16  663  	}
a9d43091c5be1e Lothar Wassmann 2009-07-16  664  
a9d43091c5be1e Lothar Wassmann 2009-07-16  665  	BUG_ON(len & ~1);
a9d43091c5be1e Lothar Wassmann 2009-07-16  666  	if (len > 0) {
a9d43091c5be1e Lothar Wassmann 2009-07-16  667  		data = isp1362_read_data16(isp1362_hcd);
a9d43091c5be1e Lothar Wassmann 2009-07-16  668  		RDBG("%s: Reading trailing byte %02x to mem @ %08x\n", __func__,
a9d43091c5be1e Lothar Wassmann 2009-07-16  669  		     (u8)data, (u32)dp);
a9d43091c5be1e Lothar Wassmann 2009-07-16  670  		*dp = (u8)data;
a9d43091c5be1e Lothar Wassmann 2009-07-16  671  	}
a9d43091c5be1e Lothar Wassmann 2009-07-16  672  }
a9d43091c5be1e Lothar Wassmann 2009-07-16  673  

:::::: The code at line 660 was first introduced by commit
:::::: a9d43091c5be1e7a60d5abe84be4f3050236b26a USB: NXP ISP1362 USB host driver

:::::: TO: Lothar Wassmann <LW@KARO-electronics.de>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
