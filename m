Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BA55689;
	Fri, 21 Apr 2023 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682100023; x=1713636023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GlNFGHNjNG5NR5XjLfG7+NU7klkvpylfkRh5ZKRJgzI=;
  b=maVXr3b3QXCddoxMJWaOzuoW19AeWqf9F6Cab2PwrL9rUS8wUcbiT68B
   FjYx0uBJ0anTN10F6przLMPxwGMRS/35SgN9v0UnLhrzPACRy0493gb1x
   UwAsh8m8moWJbNyPa8ONwgFGzQPoY3wnHrorn42lz92aTZBGmCwFBj7UO
   l53BbgKDHzMB8ZvJiwrTV1t+pzY/X2+FeMR8X7/XRqgd0zVX+1sXFYNrb
   1EQgrqHvsU+tAwriXg7E32Q4cvBrctt3xMg9iApPTDzh9G8zc261XfKVV
   n2vwZf9RBek4Suw6XlwQMF8MqXb9ok0F76fXVJ6al3LK9FDl+ql3uzSCF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="344799783"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="344799783"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 11:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="722827338"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="722827338"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Apr 2023 11:00:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppv3S-000giS-39;
	Fri, 21 Apr 2023 18:00:18 +0000
Date: Sat, 22 Apr 2023 02:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yimin Gu <ustcymgu@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 6260/13289] drivers/net/arcnet/com20020.c:74:7:
 warning: performing pointer arithmetic on a null pointer has undefined
 behavior
Message-ID: <202304220118.NYuW8ip0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yimin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   44bf136283e567b2b62653be7630e7511da41da2
commit: b5e2c507b06c9d36411845149162a804ae7b04a9 [6260/13289] riscv: Kconfig: Allow RV32 to build with no MMU
config: riscv-randconfig-r024-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220118.NYuW8ip0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b5e2c507b06c9d36411845149162a804ae7b04a9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b5e2c507b06c9d36411845149162a804ae7b04a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/arcnet/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220118.NYuW8ip0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/net/arcnet/com20020.c:37:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/net/arcnet/com20020.c:37:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/net/arcnet/com20020.c:37:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/net/arcnet/com20020.c:37:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from drivers/net/arcnet/com20020.c:37:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/net/arcnet/com20020.c:74:7: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                arcnet_insb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count));
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/arcnet/arcdevice.h:389:2: note: expanded from macro 'arcnet_insb'
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
   drivers/net/arcnet/arcdevice.h:389:2: note: expanded from macro 'arcnet_insb'
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
   drivers/net/arcnet/arcdevice.h:391:2: note: expanded from macro 'arcnet_outsb'
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
   drivers/net/arcnet/arcdevice.h:391:2: note: expanded from macro 'arcnet_outsb'
           outsb((addr) + BUS_ALIGN * (offset), buffer, count)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   drivers/net/arcnet/arcdevice.h:110:3: note: expanded from macro 'TIME'
                   call;                                                   \
                   ^~~~
   17 warnings generated.


vim +74 drivers/net/arcnet/com20020.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  61  
^1da177e4c3f41 Linus Torvalds 2005-04-16  62  static void com20020_copy_from_card(struct net_device *dev, int bufnum,
^1da177e4c3f41 Linus Torvalds 2005-04-16  63  				    int offset, void *buf, int count)
^1da177e4c3f41 Linus Torvalds 2005-04-16  64  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  65  	int ioaddr = dev->base_addr, ofs = 512 * bufnum + offset;
^1da177e4c3f41 Linus Torvalds 2005-04-16  66  
^1da177e4c3f41 Linus Torvalds 2005-04-16  67  	/* set up the address register */
0fec65130b9f11 Joe Perches    2015-05-05  68  	arcnet_outb((ofs >> 8) | RDDATAflag | AUTOINCflag,
0fec65130b9f11 Joe Perches    2015-05-05  69  		    ioaddr, COM20020_REG_W_ADDR_HI);
0fec65130b9f11 Joe Perches    2015-05-05  70  	arcnet_outb(ofs & 0xff, ioaddr, COM20020_REG_W_ADDR_LO);
^1da177e4c3f41 Linus Torvalds 2005-04-16  71  
^1da177e4c3f41 Linus Torvalds 2005-04-16  72  	/* copy the data */
0fec65130b9f11 Joe Perches    2015-05-05  73  	TIME(dev, "insb", count,
0fec65130b9f11 Joe Perches    2015-05-05 @74  	     arcnet_insb(ioaddr, COM20020_REG_RW_MEMDATA, buf, count));
^1da177e4c3f41 Linus Torvalds 2005-04-16  75  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  76  

:::::: The code at line 74 was first introduced by commit
:::::: 0fec65130b9f11a73d74f47025491f97f82ba070 arcnet: com20020: Use arcnet_<I/O> routines

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Michael Grzeschik <m.grzeschik@pengutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
