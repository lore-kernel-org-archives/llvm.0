Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BF5EEA8;
	Fri, 14 Jul 2023 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689346720; x=1720882720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2D8jLD2XnCW0l6EHpyBK3UM9XfQpIgqGMsFmllhRyaY=;
  b=GlIb4mjNYbn+quW3Jz9sowag97rMj9vOS/C0FvD3eGmM32N+6pAdm+WV
   /PGrQuwuCQ7nCPRMpYRWD/Es+Fygn2Ww5Imr0Qde4O6Ak2vuf6/QMaErd
   qUoDph325ukof2hptZs8Ft7y1xad2HV4GXMUejk2IhPaNYpNHTMGyvALG
   NOQB04dy3G5ddtqSQx7v8nf2aZ3O8RBZpX9tFE/3Lb+3s7soKlvEsdf0k
   ECf/KAk5csyhtkeZBcWHxxd3n4erEsddf4FDEMYjq/yIJu4Wm9n/tVFQE
   K27Mjj4PI1DdT8Ecan3mnA9epL+gSI6jiqC5ZgvdryW5eMXbZC2yhEewQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="451857024"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="451857024"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 07:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="969045216"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="969045216"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Jul 2023 07:58:37 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKKFh-0007W9-0l;
	Fri, 14 Jul 2023 14:58:37 +0000
Date: Fri, 14 Jul 2023 22:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 52/106] drivers/mfd/mt6358-irq.c:76:23: error:
 call to undeclared function 'irqd_to_hwirq'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202307142231.EKSuH9mI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   75186f928a91b0ae83e5861463a9d7fb73c3b381
commit: 1abfb3c0a4a348500f68fe969c7b36fe0d67cd70 [52/106] mfd: Explicitly include correct DT includes
config: s390-randconfig-r012-20230714 (https://download.01.org/0day-ci/archive/20230714/202307142231.EKSuH9mI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142231.EKSuH9mI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142231.EKSuH9mI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mfd/mt6358-irq.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/mfd/mt6358-irq.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/mfd/mt6358-irq.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/mfd/mt6358-irq.c:76:23: error: call to undeclared function 'irqd_to_hwirq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      76 |         unsigned int hwirq = irqd_to_hwirq(data);
         |                              ^
>> drivers/mfd/mt6358-irq.c:77:29: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      77 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                                    ^
   drivers/mfd/mt6358-irq.c:77:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
      77 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                             ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:85:23: error: call to undeclared function 'irqd_to_hwirq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      85 |         unsigned int hwirq = irqd_to_hwirq(data);
         |                              ^
   drivers/mfd/mt6358-irq.c:86:29: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      86 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                                    ^
   drivers/mfd/mt6358-irq.c:86:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
      86 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                             ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:94:29: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                                    ^
   drivers/mfd/mt6358-irq.c:94:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
      94 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                             ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:102:29: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     102 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                                    ^
   drivers/mfd/mt6358-irq.c:102:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
     102 |         struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
         |                             ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:132:11: error: use of undeclared identifier 'IRQCHIP_SKIP_SET_WAKE'
     132 |         .flags = IRQCHIP_SKIP_SET_WAKE,
         |                  ^
   drivers/mfd/mt6358-irq.c:130:24: error: variable has incomplete type 'struct irq_chip'
     130 | static struct irq_chip mt6358_irq_chip = {
         |                        ^
   include/linux/irqdomain.h:43:8: note: forward declaration of 'struct irq_chip'
      43 | struct irq_chip;
         |        ^
>> drivers/mfd/mt6358-irq.c:170:5: error: call to undeclared function 'handle_nested_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     170 |                                 handle_nested_irq(virq);
         |                                 ^
>> drivers/mfd/mt6358-irq.c:213:2: error: call to undeclared function 'irq_set_chip_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     213 |         irq_set_chip_data(irq, mt6397);
         |         ^
>> drivers/mfd/mt6358-irq.c:214:2: error: call to undeclared function 'irq_set_chip_and_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     214 |         irq_set_chip_and_handler(irq, &mt6358_irq_chip, handle_level_irq);
         |         ^
   drivers/mfd/mt6358-irq.c:214:50: error: use of undeclared identifier 'handle_level_irq'
     214 |         irq_set_chip_and_handler(irq, &mt6358_irq_chip, handle_level_irq);
         |                                                         ^
>> drivers/mfd/mt6358-irq.c:215:2: error: call to undeclared function 'irq_set_nested_thread'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     215 |         irq_set_nested_thread(irq, 1);
         |         ^
>> drivers/mfd/mt6358-irq.c:216:2: error: call to undeclared function 'irq_set_noprobe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     216 |         irq_set_noprobe(irq);
         |         ^
   12 warnings and 18 errors generated.


vim +/irqd_to_hwirq +76 drivers/mfd/mt6358-irq.c

e545b8f380a961 Hsin-Hsiung Wang 2021-05-26   73  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   74  static void pmic_irq_enable(struct irq_data *data)
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   75  {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  @76  	unsigned int hwirq = irqd_to_hwirq(data);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  @77  	struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   78  	struct pmic_irq_data *irqd = chip->irq_data;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   79  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   80  	irqd->enable_hwirq[hwirq] = true;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   81  }
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   82  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   83  static void pmic_irq_disable(struct irq_data *data)
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   84  {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   85  	unsigned int hwirq = irqd_to_hwirq(data);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   86  	struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   87  	struct pmic_irq_data *irqd = chip->irq_data;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   88  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   89  	irqd->enable_hwirq[hwirq] = false;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   90  }
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   91  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   92  static void pmic_irq_lock(struct irq_data *data)
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   93  {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   94  	struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   95  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   96  	mutex_lock(&chip->irqlock);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   97  }
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   98  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21   99  static void pmic_irq_sync_unlock(struct irq_data *data)
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  100  {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  101  	unsigned int i, top_gp, gp_offset, en_reg, int_regs, shift;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  102  	struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  103  	struct pmic_irq_data *irqd = chip->irq_data;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  104  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  105  	for (i = 0; i < irqd->num_pmic_irqs; i++) {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  106  		if (irqd->enable_hwirq[i] == irqd->cache_hwirq[i])
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  107  			continue;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  108  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  109  		/* Find out the IRQ group */
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  110  		top_gp = 0;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  111  		while ((top_gp + 1) < irqd->num_top &&
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  112  		       i >= irqd->pmic_ints[top_gp + 1].hwirq_base)
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  113  			top_gp++;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  114  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  115  		/* Find the IRQ registers */
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  116  		gp_offset = i - irqd->pmic_ints[top_gp].hwirq_base;
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  117  		int_regs = gp_offset / MTK_PMIC_REG_WIDTH;
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  118  		shift = gp_offset % MTK_PMIC_REG_WIDTH;
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  119  		en_reg = irqd->pmic_ints[top_gp].en_reg +
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  120  			 (irqd->pmic_ints[top_gp].en_reg_shift * int_regs);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  121  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  122  		regmap_update_bits(chip->regmap, en_reg, BIT(shift),
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  123  				   irqd->enable_hwirq[i] << shift);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  124  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  125  		irqd->cache_hwirq[i] = irqd->enable_hwirq[i];
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  126  	}
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  127  	mutex_unlock(&chip->irqlock);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  128  }
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  129  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21 @130  static struct irq_chip mt6358_irq_chip = {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  131  	.name = "mt6358-irq",
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21 @132  	.flags = IRQCHIP_SKIP_SET_WAKE,
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  133  	.irq_enable = pmic_irq_enable,
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  134  	.irq_disable = pmic_irq_disable,
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  135  	.irq_bus_lock = pmic_irq_lock,
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  136  	.irq_bus_sync_unlock = pmic_irq_sync_unlock,
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  137  };
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  138  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  139  static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  140  				  unsigned int top_gp)
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  141  {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  142  	unsigned int irq_status, sta_reg, status;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  143  	unsigned int hwirq, virq;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  144  	int i, j, ret;
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  145  	struct pmic_irq_data *irqd = chip->irq_data;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  146  
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  147  	for (i = 0; i < irqd->pmic_ints[top_gp].num_int_regs; i++) {
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  148  		sta_reg = irqd->pmic_ints[top_gp].sta_reg +
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  149  			irqd->pmic_ints[top_gp].sta_reg_shift * i;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  150  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  151  		ret = regmap_read(chip->regmap, sta_reg, &irq_status);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  152  		if (ret) {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  153  			dev_err(chip->dev,
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  154  				"Failed to read IRQ status, ret=%d\n", ret);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  155  			return;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  156  		}
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  157  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  158  		if (!irq_status)
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  159  			continue;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  160  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  161  		status = irq_status;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  162  		do {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  163  			j = __ffs(status);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  164  
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  165  			hwirq = irqd->pmic_ints[top_gp].hwirq_base +
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  166  				MTK_PMIC_REG_WIDTH * i + j;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  167  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  168  			virq = irq_find_mapping(chip->irq_domain, hwirq);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  169  			if (virq)
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21 @170  				handle_nested_irq(virq);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  171  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  172  			status &= ~BIT(j);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  173  		} while (status);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  174  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  175  		regmap_write(chip->regmap, sta_reg, irq_status);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  176  	}
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  177  }
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  178  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  179  static irqreturn_t mt6358_irq_handler(int irq, void *data)
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  180  {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  181  	struct mt6397_chip *chip = data;
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  182  	struct pmic_irq_data *irqd = chip->irq_data;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  183  	unsigned int bit, i, top_irq_status = 0;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  184  	int ret;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  185  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  186  	ret = regmap_read(chip->regmap,
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  187  			  irqd->top_int_status_reg,
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  188  			  &top_irq_status);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  189  	if (ret) {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  190  		dev_err(chip->dev,
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  191  			"Failed to read status from the device, ret=%d\n", ret);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  192  		return IRQ_NONE;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  193  	}
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  194  
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  195  	for (i = 0; i < irqd->num_top; i++) {
d8570c182f56ca Hsin-Hsiung Wang 2021-05-26  196  		bit = BIT(irqd->pmic_ints[i].top_offset);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  197  		if (top_irq_status & bit) {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  198  			mt6358_irq_sp_handler(chip, i);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  199  			top_irq_status &= ~bit;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  200  			if (!top_irq_status)
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  201  				break;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  202  		}
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  203  	}
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  204  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  205  	return IRQ_HANDLED;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  206  }
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  207  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  208  static int pmic_irq_domain_map(struct irq_domain *d, unsigned int irq,
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  209  			       irq_hw_number_t hw)
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  210  {
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  211  	struct mt6397_chip *mt6397 = d->host_data;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  212  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21 @213  	irq_set_chip_data(irq, mt6397);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21 @214  	irq_set_chip_and_handler(irq, &mt6358_irq_chip, handle_level_irq);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21 @215  	irq_set_nested_thread(irq, 1);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21 @216  	irq_set_noprobe(irq);
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  217  
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  218  	return 0;
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  219  }
2b91c28f2abd94 Hsin-Hsiung Wang 2020-04-21  220  

:::::: The code at line 76 was first introduced by commit
:::::: 2b91c28f2abd9471aac4aa6cd8de7896ef469153 mfd: Add support for the MediaTek MT6358 PMIC

:::::: TO: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
:::::: CC: Lee Jones <lee.jones@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
