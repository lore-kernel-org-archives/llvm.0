Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC3FC8DC;
	Mon, 29 May 2023 22:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685400708; x=1716936708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E/YUwGh6QjdHb1tKBcFxLBX53uMnE8n6TNvJYJORbmY=;
  b=j2MXlbwuqGloNlK8NdnmGB5uKnH/QXAJYjtdowqUnRyf74fM35isWhlZ
   DofdeM1gDJ88OL7G1hqw5sXZvVIl1Jd/CeULTDOJpliwSOdK/bCnPX0j3
   rnt5NGrq6y0iYiBpjWsksbJVvuYIQpGn701omPfcX37pNEiMUCQO9hEGS
   Up50JYIkmF0Hdr7v8LCc8GENeuOvwzXzaxDdg1toJJM6EqmbZloi244i2
   SEUW2UntySv+St36lrC8z+VO09FFNuVSKrjq6zC4Kahx/2yFCQ34tOizf
   lJG1O+WjW3nWYQwlihrtFSn8w0YXEaLhc7JadoVbTAaJD38jAoJ4m81GT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335129236"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="335129236"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 15:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706193666"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="706193666"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 May 2023 15:51:44 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3liJ-000LAG-2L;
	Mon, 29 May 2023 22:51:43 +0000
Date: Tue, 30 May 2023 06:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_timer_imp_v1 41/45]
 drivers/irqchip/irq-riscv-aplic.c:331:33: warning: shift count >= width of
 type
Message-ID: <202305300611.oM1vfXbw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anup,

First bad commit (maybe != root cause):

tree:   https://github.com/avpatel/linux.git riscv_timer_imp_v1
head:   e4b53ebc211c359452cf0197ae0efb9b36c26589
commit: 3e63cb1bd92da3161809e39d854d8f4e978579f0 [41/45] RISC-V: Select APLIC and IMSIC drivers
config: riscv-randconfig-r001-20230529 (https://download.01.org/0day-ci/archive/20230530/202305300611.oM1vfXbw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/avpatel/linux/commit/3e63cb1bd92da3161809e39d854d8f4e978579f0
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_timer_imp_v1
        git checkout 3e63cb1bd92da3161809e39d854d8f4e978579f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300611.oM1vfXbw-lkp@intel.com/

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
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
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
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
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
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
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
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
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
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
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
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
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
>> drivers/irqchip/irq-riscv-aplic.c:331:33: warning: shift count >= width of type [-Wshift-count-overflow]
                   valH = (priv->msicfg.base_ppn >> 32) &
                                                 ^  ~~
   14 warnings generated.


vim +331 drivers/irqchip/irq-riscv-aplic.c

dfefa35d9d9c31e Anup Patel 2022-01-18  322  
dfefa35d9d9c31e Anup Patel 2022-01-18  323  static void aplic_init_hw_global(struct aplic_priv *priv)
dfefa35d9d9c31e Anup Patel 2022-01-18  324  {
dfefa35d9d9c31e Anup Patel 2022-01-18  325  	u32 val;
dfefa35d9d9c31e Anup Patel 2022-01-18  326  #ifdef CONFIG_RISCV_M_MODE
dfefa35d9d9c31e Anup Patel 2022-01-18  327  	u32 valH;
dfefa35d9d9c31e Anup Patel 2022-01-18  328  
dfefa35d9d9c31e Anup Patel 2022-01-18  329  	if (!priv->nr_idcs) {
dfefa35d9d9c31e Anup Patel 2022-01-18  330  		val = priv->msicfg.base_ppn;
dfefa35d9d9c31e Anup Patel 2022-01-18 @331  		valH = (priv->msicfg.base_ppn >> 32) &
dfefa35d9d9c31e Anup Patel 2022-01-18  332  			APLIC_xMSICFGADDRH_BAPPN_MASK;
dfefa35d9d9c31e Anup Patel 2022-01-18  333  		valH |= (priv->msicfg.lhxw & APLIC_xMSICFGADDRH_LHXW_MASK)
dfefa35d9d9c31e Anup Patel 2022-01-18  334  			<< APLIC_xMSICFGADDRH_LHXW_SHIFT;
dfefa35d9d9c31e Anup Patel 2022-01-18  335  		valH |= (priv->msicfg.hhxw & APLIC_xMSICFGADDRH_HHXW_MASK)
dfefa35d9d9c31e Anup Patel 2022-01-18  336  			<< APLIC_xMSICFGADDRH_HHXW_SHIFT;
dfefa35d9d9c31e Anup Patel 2022-01-18  337  		valH |= (priv->msicfg.lhxs & APLIC_xMSICFGADDRH_LHXS_MASK)
dfefa35d9d9c31e Anup Patel 2022-01-18  338  			<< APLIC_xMSICFGADDRH_LHXS_SHIFT;
dfefa35d9d9c31e Anup Patel 2022-01-18  339  		valH |= (priv->msicfg.hhxs & APLIC_xMSICFGADDRH_HHXS_MASK)
dfefa35d9d9c31e Anup Patel 2022-01-18  340  			<< APLIC_xMSICFGADDRH_HHXS_SHIFT;
dfefa35d9d9c31e Anup Patel 2022-01-18  341  		writel(val, priv->regs + APLIC_xMSICFGADDR);
dfefa35d9d9c31e Anup Patel 2022-01-18  342  		writel(valH, priv->regs + APLIC_xMSICFGADDRH);
dfefa35d9d9c31e Anup Patel 2022-01-18  343  	}
dfefa35d9d9c31e Anup Patel 2022-01-18  344  #endif
dfefa35d9d9c31e Anup Patel 2022-01-18  345  
dfefa35d9d9c31e Anup Patel 2022-01-18  346  	/* Setup APLIC domaincfg register */
dfefa35d9d9c31e Anup Patel 2022-01-18  347  	val = readl(priv->regs + APLIC_DOMAINCFG);
dfefa35d9d9c31e Anup Patel 2022-01-18  348  	val |= APLIC_DOMAINCFG_IE;
dfefa35d9d9c31e Anup Patel 2022-01-18  349  	if (!priv->nr_idcs)
dfefa35d9d9c31e Anup Patel 2022-01-18  350  		val |= APLIC_DOMAINCFG_DM;
dfefa35d9d9c31e Anup Patel 2022-01-18  351  	writel(val, priv->regs + APLIC_DOMAINCFG);
dfefa35d9d9c31e Anup Patel 2022-01-18  352  	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
dfefa35d9d9c31e Anup Patel 2022-01-18  353  		pr_warn("%pfwP: unable to write 0x%x in domaincfg\n",
dfefa35d9d9c31e Anup Patel 2022-01-18  354  			priv->fwnode, val);
dfefa35d9d9c31e Anup Patel 2022-01-18  355  }
dfefa35d9d9c31e Anup Patel 2022-01-18  356  

:::::: The code at line 331 was first introduced by commit
:::::: dfefa35d9d9c31eb256197a9e93c5d69288e3afc irqchip: Add RISC-V advanced PLIC driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
