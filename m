Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CFF19902;
	Sat, 27 May 2023 23:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685230712; x=1716766712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agBI6GmZWjSS8VbTsbdQ65xvBco0PZrRd+r5Nx3xwcA=;
  b=m8o9AikD8hoqxbUZOgxSzpjHDXPMn/RDYhu29atB93oMGaFt7P/73H9v
   AJtfc38h59aIWehXllCfeFzm1sIU5IdjQr8uuKaPa9PhGY4tCNulve46h
   uQvRvqbISmhnLFubU/+fQnXonGKJU7WwsL25mkeIK8zh6YNstg0Tv8M75
   U2M4GJZVehdI5U9v+mx4VXz724c13KmkI9FiESDbPpq7FMJEp9ThX4AWV
   9pHn5wwfcHy5IqIZH73KyGM2oB7bJjNOOhPTroYy59X/u3i3fuHbCU/8R
   mVa4I5hBSewIpoCCESpGbqqSMkVlYvQkZpx4RcHbrKVsEzcw3GTwMs7pV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="382709700"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="382709700"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 16:38:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="795472733"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="795472733"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 May 2023 16:38:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q33US-000KFy-0n;
	Sat, 27 May 2023 23:38:28 +0000
Date: Sun, 28 May 2023 07:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yimin Gu <ustcymgu@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: drivers/comedi/drivers/das1800.c:343:2: warning: performing pointer
 arithmetic on a null pointer has undefined behavior
Message-ID: <202305280723.RB6YR0Ot-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4e893b5aa4ac2c8a56a40d18fe87e9d2295e5dcf
commit: b5e2c507b06c9d36411845149162a804ae7b04a9 riscv: Kconfig: Allow RV32 to build with no MMU
date:   9 weeks ago
config: riscv-randconfig-r042-20230528 (https://download.01.org/0day-ci/archive/20230528/202305280723.RB6YR0Ot-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b5e2c507b06c9d36411845149162a804ae7b04a9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b5e2c507b06c9d36411845149162a804ae7b04a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/comedi/drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280723.RB6YR0Ot-lkp@intel.com/

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
   In file included from drivers/comedi/drivers/das1800.c:73:
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
   In file included from drivers/comedi/drivers/das1800.c:73:
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
   In file included from drivers/comedi/drivers/das1800.c:73:
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
   In file included from drivers/comedi/drivers/das1800.c:73:
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
   In file included from drivers/comedi/drivers/das1800.c:73:
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
   In file included from drivers/comedi/drivers/das1800.c:73:
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
>> drivers/comedi/drivers/das1800.c:343:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(dev->iobase + DAS1800_FIFO, devpriv->fifo_buf, nsamples);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   14 warnings generated.


vim +343 drivers/comedi/drivers/das1800.c

a69cc3a9fae82f drivers/staging/comedi/drivers/das1800.c Frank Mori Hess   2009-02-19  336  
73e183c347242c drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2012-05-23  337  static void das1800_handle_fifo_half_full(struct comedi_device *dev,
73e183c347242c drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2012-05-23  338  					  struct comedi_subdevice *s)
73e183c347242c drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2012-05-23  339  {
9a1a6cf8ae5ca5 drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2012-10-15  340  	struct das1800_private *devpriv = dev->private;
605d76f6eb007a drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2014-11-05  341  	unsigned int nsamples = comedi_nsamples_left(s, FIFO_SIZE / 2);
a69cc3a9fae82f drivers/staging/comedi/drivers/das1800.c Frank Mori Hess   2009-02-19  342  
1f190a73590ce0 drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2015-01-12 @343  	insw(dev->iobase + DAS1800_FIFO, devpriv->fifo_buf, nsamples);
1f190a73590ce0 drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2015-01-12  344  	comedi_buf_write_samples(s, devpriv->fifo_buf, nsamples);
a69cc3a9fae82f drivers/staging/comedi/drivers/das1800.c Frank Mori Hess   2009-02-19  345  }
a69cc3a9fae82f drivers/staging/comedi/drivers/das1800.c Frank Mori Hess   2009-02-19  346  

:::::: The code at line 343 was first introduced by commit
:::::: 1f190a73590ce0070d6a5b6ee0d50e076aafebd6 staging: comedi: das1800: separate AI FIFO bounce buffer from DMA buffer

:::::: TO: H Hartley Sweeten <hsweeten@visionengravers.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
