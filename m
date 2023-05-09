Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA48839;
	Tue,  9 May 2023 09:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683624353; x=1715160353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vp7F6suoEnCAro+YT4h1w9bpYeXW8FkSrq3e6M45gMw=;
  b=IvuDyxizamXwWZIvHg99A3GKNtIjAr5kg7DnUmECDAuTLWlKMReLRC00
   Y0l+yNuWtfE92RYnpqUg1IyI6imA7+ume6J5nR19QDefDU1yiO+57d0xY
   X/f/z4UCgTxE09TzWZ87h6VypofsciPEzQzzJ4qv7PSls11ABqvgXUUm4
   s4x3IwSFOJc8ZNie1zJAUFR/v5d/991yPPPV5eFlrNLRx3d7GqxDTGQ8m
   op4xG34Clr4/yP7dKZ6YiKkM/tZ5jfe9MtSJoEpdf49R+4vWbzEvWXOy3
   JokmVu89PPgree5P0BVn86KweVQzbpXZ2UdZdpVATfa3mGI9Qvs97tYNL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347326802"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="347326802"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP; 09 May 2023 02:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="788449352"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="788449352"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 May 2023 02:25:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwJbS-00020q-1P;
	Tue, 09 May 2023 09:25:50 +0000
Date: Tue, 9 May 2023 17:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_timer_imp_v1 10/14]
 drivers/irqchip/irq-riscv-aplic.c:331:33: warning: shift count >= width of
 type
Message-ID: <202305091731.mW8KEjj7-lkp@intel.com>
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
head:   f1bb550b4ea97cede175e141b831d4b9134a6338
commit: a81f5ab22e765fe40a903c46531ada8da1eb0b8c [10/14] RISC-V: Select APLIC and IMSIC drivers
config: riscv-randconfig-r021-20230507 (https://download.01.org/0day-ci/archive/20230509/202305091731.mW8KEjj7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/avpatel/linux/commit/a81f5ab22e765fe40a903c46531ada8da1eb0b8c
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_timer_imp_v1
        git checkout a81f5ab22e765fe40a903c46531ada8da1eb0b8c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091731.mW8KEjj7-lkp@intel.com/

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

f5e62553412fff Anup Patel 2022-01-18  322  
f5e62553412fff Anup Patel 2022-01-18  323  static void aplic_init_hw_global(struct aplic_priv *priv)
f5e62553412fff Anup Patel 2022-01-18  324  {
f5e62553412fff Anup Patel 2022-01-18  325  	u32 val;
f5e62553412fff Anup Patel 2022-01-18  326  #ifdef CONFIG_RISCV_M_MODE
f5e62553412fff Anup Patel 2022-01-18  327  	u32 valH;
f5e62553412fff Anup Patel 2022-01-18  328  
f5e62553412fff Anup Patel 2022-01-18  329  	if (!priv->nr_idcs) {
f5e62553412fff Anup Patel 2022-01-18  330  		val = priv->msicfg.base_ppn;
f5e62553412fff Anup Patel 2022-01-18 @331  		valH = (priv->msicfg.base_ppn >> 32) &
f5e62553412fff Anup Patel 2022-01-18  332  			APLIC_xMSICFGADDRH_BAPPN_MASK;
f5e62553412fff Anup Patel 2022-01-18  333  		valH |= (priv->msicfg.lhxw & APLIC_xMSICFGADDRH_LHXW_MASK)
f5e62553412fff Anup Patel 2022-01-18  334  			<< APLIC_xMSICFGADDRH_LHXW_SHIFT;
f5e62553412fff Anup Patel 2022-01-18  335  		valH |= (priv->msicfg.hhxw & APLIC_xMSICFGADDRH_HHXW_MASK)
f5e62553412fff Anup Patel 2022-01-18  336  			<< APLIC_xMSICFGADDRH_HHXW_SHIFT;
f5e62553412fff Anup Patel 2022-01-18  337  		valH |= (priv->msicfg.lhxs & APLIC_xMSICFGADDRH_LHXS_MASK)
f5e62553412fff Anup Patel 2022-01-18  338  			<< APLIC_xMSICFGADDRH_LHXS_SHIFT;
f5e62553412fff Anup Patel 2022-01-18  339  		valH |= (priv->msicfg.hhxs & APLIC_xMSICFGADDRH_HHXS_MASK)
f5e62553412fff Anup Patel 2022-01-18  340  			<< APLIC_xMSICFGADDRH_HHXS_SHIFT;
f5e62553412fff Anup Patel 2022-01-18  341  		writel(val, priv->regs + APLIC_xMSICFGADDR);
f5e62553412fff Anup Patel 2022-01-18  342  		writel(valH, priv->regs + APLIC_xMSICFGADDRH);
f5e62553412fff Anup Patel 2022-01-18  343  	}
f5e62553412fff Anup Patel 2022-01-18  344  #endif
f5e62553412fff Anup Patel 2022-01-18  345  
f5e62553412fff Anup Patel 2022-01-18  346  	/* Setup APLIC domaincfg register */
f5e62553412fff Anup Patel 2022-01-18  347  	val = readl(priv->regs + APLIC_DOMAINCFG);
f5e62553412fff Anup Patel 2022-01-18  348  	val |= APLIC_DOMAINCFG_IE;
f5e62553412fff Anup Patel 2022-01-18  349  	if (!priv->nr_idcs)
f5e62553412fff Anup Patel 2022-01-18  350  		val |= APLIC_DOMAINCFG_DM;
f5e62553412fff Anup Patel 2022-01-18  351  	writel(val, priv->regs + APLIC_DOMAINCFG);
f5e62553412fff Anup Patel 2022-01-18  352  	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
f5e62553412fff Anup Patel 2022-01-18  353  		pr_warn("%pfwP: unable to write 0x%x in domaincfg\n",
f5e62553412fff Anup Patel 2022-01-18  354  			priv->fwnode, val);
f5e62553412fff Anup Patel 2022-01-18  355  }
f5e62553412fff Anup Patel 2022-01-18  356  

:::::: The code at line 331 was first introduced by commit
:::::: f5e62553412fff47a0babd7b77b4a4285ac3fa5c irqchip: Add RISC-V advanced PLIC driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
