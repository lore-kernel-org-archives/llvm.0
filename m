Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906777C;
	Mon, 20 Mar 2023 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679332793; x=1710868793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hKfMYL7zlAfR3QAK+/fMitgaqsrw3DhCbILf+NhPbrM=;
  b=YMhYKqzDvRvQbatJ9+hP5hkO7mb8Iu6QeEYevCAFdJng5b6X1pMJBJaI
   YVjPRCCS3/28XSzuTWNNivEc/YynV18Jm8qdMHbVrfpzz+Sq9iYaySnE0
   76yPfBRYTJ+XPTabY/9Ym4HDDLgztmS46VxtNDSt0iYLgOK2fGLlQPHlW
   LitsbkwnWQ7k2Jmt/QWQO6mrSOSpGVZWQHItuecnCXP7XAra+aIfcMy0q
   UrLQpsX5stycGBy2VzkLlHfgiq4ldEFoBmuV4xKN7zxxxbDIH6vayuhbK
   6uOQ3UD5RTy0eJ9MWXySFXSqncboYtzR8GA+cY6wqXi1SNaR2ODNIOiTn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="338750863"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="338750863"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 10:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="745463981"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="745463981"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Mar 2023 10:19:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peJAj-000BBK-2F;
	Mon, 20 Mar 2023 17:19:49 +0000
Date: Tue, 21 Mar 2023 01:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [stable:linux-5.15.y 5703/9999]
 drivers/comedi/drivers/adl_pci9111.c:415:2: warning: performing pointer
 arithmetic on a null pointer has undefined behavior
Message-ID: <202303210115.OJAqrjY1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   8020ae3c051d1c9ec7b7a872e226f9720547649b
commit: dc235db7b79a352d07d62e8757ad856dbf1564c1 [5703/9999] RISC-V: Make port I/O string accessors actually work
config: riscv-buildonly-randconfig-r004-20230319 (https://download.01.org/0day-ci/archive/20230321/202303210115.OJAqrjY1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/comedi/drivers/ drivers/net/arcnet/ drivers/net/ethernet/fujitsu/ drivers/net/ethernet/smsc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210115.OJAqrjY1-lkp@intel.com/

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
   In file included from drivers/comedi/drivers/adl_pci9111.c:44:
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
   In file included from drivers/comedi/drivers/adl_pci9111.c:44:
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
   In file included from drivers/comedi/drivers/adl_pci9111.c:44:
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
   In file included from drivers/comedi/drivers/adl_pci9111.c:44:
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
   In file included from drivers/comedi/drivers/adl_pci9111.c:44:
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
   In file included from drivers/comedi/drivers/adl_pci9111.c:44:
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
>> drivers/comedi/drivers/adl_pci9111.c:415:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(dev->iobase + PCI9111_AI_FIFO_REG, buf, samples);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
--
   In file included from include/linux/highmem.h:10:
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
   In file included from drivers/net/arcnet/com20020.c:37:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
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
   In file included from drivers/net/arcnet/com20020.c:37:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
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
   In file included from drivers/net/arcnet/com20020.c:37:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
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
   In file included from drivers/net/arcnet/com20020.c:37:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
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
   In file included from drivers/net/arcnet/com20020.c:37:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/net/arcnet/com20020.c:74:7: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                arcnet_insb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count));
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/arcnet/arcdevice.h:384:2: note: expanded from macro 'arcnet_insb'
           insb((addr) + BUS_ALIGN * (offset), buffer, count)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
   #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   drivers/net/arcnet/arcdevice.h:103:3: note: expanded from macro 'TIME'
                   call;                                                   \
                   ^~~~
>> drivers/net/arcnet/com20020.c:74:7: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                arcnet_insb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count));
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/arcnet/arcdevice.h:384:2: note: expanded from macro 'arcnet_insb'
           insb((addr) + BUS_ALIGN * (offset), buffer, count)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
   #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   drivers/net/arcnet/arcdevice.h:110:3: note: expanded from macro 'TIME'
                   call;                                                   \
                   ^~~~
   drivers/net/arcnet/com20020.c:88:7: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                arcnet_outsb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count));
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/arcnet/arcdevice.h:386:2: note: expanded from macro 'arcnet_outsb'
           outsb((addr) + BUS_ALIGN * (offset), buffer, count)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   drivers/net/arcnet/arcdevice.h:103:3: note: expanded from macro 'TIME'
                   call;                                                   \
                   ^~~~
   drivers/net/arcnet/com20020.c:88:7: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                arcnet_outsb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count));
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/arcnet/arcdevice.h:386:2: note: expanded from macro 'arcnet_outsb'
           outsb((addr) + BUS_ALIGN * (offset), buffer, count)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   drivers/net/arcnet/arcdevice.h:110:3: note: expanded from macro 'TIME'
                   call;                                                   \
                   ^~~~
   17 warnings generated.
..


vim +415 drivers/comedi/drivers/adl_pci9111.c

8cb9b9fb975476 drivers/staging/comedi/drivers/adl_pci9111.c Emmanuel Pacaud   2009-02-12  405  
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  406  static void pci9111_handle_fifo_half_full(struct comedi_device *dev,
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  407  					  struct comedi_subdevice *s)
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  408  {
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  409  	struct pci9111_private_data *devpriv = dev->private;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  410  	struct comedi_cmd *cmd = &s->async->cmd;
64a4e72eabd419 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2015-10-12  411  	unsigned short *buf = devpriv->ai_bounce_buffer;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  412  	unsigned int samples;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  413  
b6bc224f33b2d2 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-11-10  414  	samples = comedi_nsamples_left(s, PCI9111_FIFO_HALF_SIZE);
64a4e72eabd419 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2015-10-12 @415  	insw(dev->iobase + PCI9111_AI_FIFO_REG, buf, samples);
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  416  
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  417  	if (devpriv->scan_delay < 1) {
64a4e72eabd419 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2015-10-12  418  		comedi_buf_write_samples(s, buf, samples);
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  419  	} else {
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  420  		unsigned int pos = 0;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  421  		unsigned int to_read;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  422  
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  423  		while (pos < samples) {
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  424  			if (devpriv->chunk_counter < cmd->chanlist_len) {
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  425  				to_read = cmd->chanlist_len -
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  426  					  devpriv->chunk_counter;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  427  
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  428  				if (to_read > samples - pos)
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  429  					to_read = samples - pos;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  430  
64a4e72eabd419 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2015-10-12  431  				comedi_buf_write_samples(s, buf + pos, to_read);
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  432  			} else {
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  433  				to_read = devpriv->chunk_num_samples -
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  434  					  devpriv->chunk_counter;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  435  
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  436  				if (to_read > samples - pos)
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  437  					to_read = samples - pos;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  438  			}
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  439  
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  440  			pos += to_read;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  441  			devpriv->chunk_counter += to_read;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  442  
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  443  			if (devpriv->chunk_counter >=
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  444  			    devpriv->chunk_num_samples)
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  445  				devpriv->chunk_counter = 0;
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  446  		}
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  447  	}
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  448  }
9a8805bb80cff9 drivers/staging/comedi/drivers/adl_pci9111.c H Hartley Sweeten 2014-05-27  449  

:::::: The code at line 415 was first introduced by commit
:::::: 64a4e72eabd4199d6897f8b1366479b1b8152228 staging: comedi: adl_pci9111: fix alignment issue

:::::: TO: H Hartley Sweeten <hsweeten@visionengravers.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
