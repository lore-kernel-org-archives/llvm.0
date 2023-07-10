Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6E713AC3;
	Mon, 10 Jul 2023 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689008246; x=1720544246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=giA88fFrQ4QBe4n2SP8miTlk+2eEIPRK9+6SeYoiDfc=;
  b=LVHnx8cICLemlzdCAGNbxuEvcTmT+oM5iWhnXmU3OI8ZEm6i4U1F8eoW
   7WYxrvY8ULy5k+vB5NjpxSVICuzOVXWk7mhZf+9gLcGKm5JfmR4jEMHzH
   SeSTq604Fp8x3m4n7dCx+REe6n6eW1vUVZ0pVcUmOQpkocY9TYBDrATyB
   7DNm2Gk1bVyY/GJ9Kn2HHzhEivC6fPhXEc+2oFR8Qku+JIZeE3K4WbrlP
   PXA0WhHjdpKCzgczb3C59BzJwpGS3w5gdpugHGj70nhmaystfyTMABwqn
   9nvKpGko11OmZM9G5cy5k4Vii1XT928tSQRQTAkNQGNv/twYbxEWrQt0E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="354257594"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="354257594"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 09:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="671027409"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="671027409"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jul 2023 09:57:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIuCP-0003ps-03;
	Mon, 10 Jul 2023 16:57:21 +0000
Date: Tue, 11 Jul 2023 00:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [avpatel:riscv_aia_v5 8/9] drivers/irqchip/irq-riscv-aplic.c:331:33:
 warning: shift count >= width of type
Message-ID: <202307110012.8gYgzLQE-lkp@intel.com>
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

tree:   https://github.com/avpatel/linux.git riscv_aia_v5
head:   004cfc621e239f8158c60a4fe22f93b849baf6fc
commit: 214fd2a70f2aee97ae042bdd2d8c0006ec2b7123 [8/9] RISC-V: Select APLIC and IMSIC drivers
config: riscv-randconfig-r042-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110012.8gYgzLQE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110012.8gYgzLQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110012.8gYgzLQE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:743:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     743 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     751 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     759 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     768 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     777 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     786 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1134 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/irqchip/irq-riscv-aplic.c:331:33: warning: shift count >= width of type [-Wshift-count-overflow]
     331 |                 valH = (priv->msicfg.base_ppn >> 32) &
         |                                               ^  ~~
   14 warnings generated.


vim +331 drivers/irqchip/irq-riscv-aplic.c

42e40bf36802c7 Anup Patel 2022-01-18  322  
42e40bf36802c7 Anup Patel 2022-01-18  323  static void aplic_init_hw_global(struct aplic_priv *priv)
42e40bf36802c7 Anup Patel 2022-01-18  324  {
42e40bf36802c7 Anup Patel 2022-01-18  325  	u32 val;
42e40bf36802c7 Anup Patel 2022-01-18  326  #ifdef CONFIG_RISCV_M_MODE
42e40bf36802c7 Anup Patel 2022-01-18  327  	u32 valH;
42e40bf36802c7 Anup Patel 2022-01-18  328  
42e40bf36802c7 Anup Patel 2022-01-18  329  	if (!priv->nr_idcs) {
42e40bf36802c7 Anup Patel 2022-01-18  330  		val = priv->msicfg.base_ppn;
42e40bf36802c7 Anup Patel 2022-01-18 @331  		valH = (priv->msicfg.base_ppn >> 32) &
42e40bf36802c7 Anup Patel 2022-01-18  332  			APLIC_xMSICFGADDRH_BAPPN_MASK;
42e40bf36802c7 Anup Patel 2022-01-18  333  		valH |= (priv->msicfg.lhxw & APLIC_xMSICFGADDRH_LHXW_MASK)
42e40bf36802c7 Anup Patel 2022-01-18  334  			<< APLIC_xMSICFGADDRH_LHXW_SHIFT;
42e40bf36802c7 Anup Patel 2022-01-18  335  		valH |= (priv->msicfg.hhxw & APLIC_xMSICFGADDRH_HHXW_MASK)
42e40bf36802c7 Anup Patel 2022-01-18  336  			<< APLIC_xMSICFGADDRH_HHXW_SHIFT;
42e40bf36802c7 Anup Patel 2022-01-18  337  		valH |= (priv->msicfg.lhxs & APLIC_xMSICFGADDRH_LHXS_MASK)
42e40bf36802c7 Anup Patel 2022-01-18  338  			<< APLIC_xMSICFGADDRH_LHXS_SHIFT;
42e40bf36802c7 Anup Patel 2022-01-18  339  		valH |= (priv->msicfg.hhxs & APLIC_xMSICFGADDRH_HHXS_MASK)
42e40bf36802c7 Anup Patel 2022-01-18  340  			<< APLIC_xMSICFGADDRH_HHXS_SHIFT;
42e40bf36802c7 Anup Patel 2022-01-18  341  		writel(val, priv->regs + APLIC_xMSICFGADDR);
42e40bf36802c7 Anup Patel 2022-01-18  342  		writel(valH, priv->regs + APLIC_xMSICFGADDRH);
42e40bf36802c7 Anup Patel 2022-01-18  343  	}
42e40bf36802c7 Anup Patel 2022-01-18  344  #endif
42e40bf36802c7 Anup Patel 2022-01-18  345  
42e40bf36802c7 Anup Patel 2022-01-18  346  	/* Setup APLIC domaincfg register */
42e40bf36802c7 Anup Patel 2022-01-18  347  	val = readl(priv->regs + APLIC_DOMAINCFG);
42e40bf36802c7 Anup Patel 2022-01-18  348  	val |= APLIC_DOMAINCFG_IE;
42e40bf36802c7 Anup Patel 2022-01-18  349  	if (!priv->nr_idcs)
42e40bf36802c7 Anup Patel 2022-01-18  350  		val |= APLIC_DOMAINCFG_DM;
42e40bf36802c7 Anup Patel 2022-01-18  351  	writel(val, priv->regs + APLIC_DOMAINCFG);
42e40bf36802c7 Anup Patel 2022-01-18  352  	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
42e40bf36802c7 Anup Patel 2022-01-18  353  		pr_warn("%pfwP: unable to write 0x%x in domaincfg\n",
42e40bf36802c7 Anup Patel 2022-01-18  354  			priv->fwnode, val);
42e40bf36802c7 Anup Patel 2022-01-18  355  }
42e40bf36802c7 Anup Patel 2022-01-18  356  

:::::: The code at line 331 was first introduced by commit
:::::: 42e40bf36802c73c359dc37c729d26209aa3cea8 irqchip: Add RISC-V advanced PLIC driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
