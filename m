Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CA31C35;
	Fri, 14 Jul 2023 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689317021; x=1720853021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ztVIDxpPn2Icx53tZ0Ye8T+HujuHfb/aUQoa22QzwPQ=;
  b=dcgaX0LEttbBvt1vtbnT7lKFs2nDa4kVHtOvJt0yhQlZ3opwxG+DyUHA
   0YPFA1lwcEgcrBK/Mc3X84cAcLFYHB2PxgeE0Ck2CV3Zim5U6Me/dGlgA
   VHW6u5XlllZBDG2lA4MQVQlHGaEYIZrnyi4uI/7kkm8iRBHQKOFKO0gFM
   NxmyWKnhJJecm6hZj3NN80xD9D9LMtlXT/Put60N2CMR+4XdKr774ETWk
   5/fAGSK5Bz7/2ihskCh7l7lACXX7MePYktQatJNnuX0JVAO81uCdMIVYg
   M/zoc/EwKC+Mm+jc+fnxPtvRp5v9+yKWb7DdxAEf1VX3Iu2Uf57oEn2rY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="365443943"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="365443943"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 23:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792335381"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="792335381"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 23:43:25 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKCWT-0007GF-01;
	Fri, 14 Jul 2023 06:43:25 +0000
Date: Fri, 14 Jul 2023 14:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 52/106] drivers/mfd/mt6397-irq.c:20:31: error:
 call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202307141417.iyQPQIVp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   6d526c484caa62c36428fc20236387f34d8f5c75
commit: 0ca6cbf5634cd93732f504c66a8f8802d87de80e [52/106] mfd: Explicitly include correct DT includes
config: i386-randconfig-i011-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141417.iyQPQIVp-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141417.iyQPQIVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141417.iyQPQIVp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/mt6397-irq.c:20:31: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
                                        ^
>> drivers/mfd/mt6397-irq.c:20:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
           struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
                               ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:27:31: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
                                        ^
   drivers/mfd/mt6397-irq.c:27:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
           struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
                               ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:39:31: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
                                        ^
   drivers/mfd/mt6397-irq.c:39:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
           struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
                               ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/mt6397-irq.c:40:18: error: incomplete definition of type 'struct irq_data'
           int shift = data->hwirq & 0xf;
                       ~~~~^
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct irq_data'
   struct irq_data;
          ^
   drivers/mfd/mt6397-irq.c:41:16: error: incomplete definition of type 'struct irq_data'
           int reg = data->hwirq >> 4;
                     ~~~~^
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct irq_data'
   struct irq_data;
          ^
   drivers/mfd/mt6397-irq.c:48:31: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
                                        ^
   drivers/mfd/mt6397-irq.c:48:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
           struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
                               ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:49:18: error: incomplete definition of type 'struct irq_data'
           int shift = data->hwirq & 0xf;
                       ~~~~^
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct irq_data'
   struct irq_data;
          ^
   drivers/mfd/mt6397-irq.c:50:16: error: incomplete definition of type 'struct irq_data'
           int reg = data->hwirq >> 4;
                     ~~~~^
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct irq_data'
   struct irq_data;
          ^
   drivers/mfd/mt6397-irq.c:57:31: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(irq_data);
                                        ^
   drivers/mfd/mt6397-irq.c:57:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
           struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(irq_data);
                               ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6397-irq.c:58:22: error: incomplete definition of type 'struct irq_data'
           int shift = irq_data->hwirq & 0xf;
                       ~~~~~~~~^
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct irq_data'
   struct irq_data;
          ^
   drivers/mfd/mt6397-irq.c:59:20: error: incomplete definition of type 'struct irq_data'
           int reg = irq_data->hwirq >> 4;
                     ~~~~~~~~^
   include/linux/irqhandler.h:11:8: note: forward declaration of 'struct irq_data'
   struct irq_data;
          ^
>> drivers/mfd/mt6397-irq.c:69:24: error: variable has incomplete type 'struct irq_chip'
   static struct irq_chip mt6397_irq_chip = {
                          ^
   include/linux/irqdomain.h:43:8: note: forward declaration of 'struct irq_chip'
   struct irq_chip;
          ^
>> drivers/mfd/mt6397-irq.c:94:5: error: call to undeclared function 'handle_nested_irq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                                   handle_nested_irq(irq);
                                   ^
>> drivers/mfd/mt6397-irq.c:116:2: error: call to undeclared function 'irq_set_chip_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           irq_set_chip_data(irq, mt6397);
           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/mfd/mt6358-irq.c:76:23: error: call to undeclared function 'irqd_to_hwirq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           unsigned int hwirq = irqd_to_hwirq(data);
                                ^
>> drivers/mfd/mt6358-irq.c:77:29: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
                                      ^
>> drivers/mfd/mt6358-irq.c:77:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
           struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
                               ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:85:23: error: call to undeclared function 'irqd_to_hwirq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           unsigned int hwirq = irqd_to_hwirq(data);
                                ^
   drivers/mfd/mt6358-irq.c:86:29: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
                                      ^
   drivers/mfd/mt6358-irq.c:86:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
           struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
                               ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:94:29: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
                                      ^
   drivers/mfd/mt6358-irq.c:94:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
           struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
                               ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/mt6358-irq.c:102:29: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
                                      ^
   drivers/mfd/mt6358-irq.c:102:22: error: incompatible integer to pointer conversion initializing 'struct mt6397_chip *' with an expression of type 'int' [-Wint-conversion]
           struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
                               ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/mt6358-irq.c:132:11: error: use of undeclared identifier 'IRQCHIP_SKIP_SET_WAKE'
           .flags = IRQCHIP_SKIP_SET_WAKE,
                    ^
>> drivers/mfd/mt6358-irq.c:130:24: error: variable has incomplete type 'struct irq_chip'
   static struct irq_chip mt6358_irq_chip = {
                          ^
   include/linux/irqdomain.h:43:8: note: forward declaration of 'struct irq_chip'
   struct irq_chip;
          ^
>> drivers/mfd/mt6358-irq.c:170:5: error: call to undeclared function 'handle_nested_irq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                                   handle_nested_irq(virq);
                                   ^
>> drivers/mfd/mt6358-irq.c:213:2: error: call to undeclared function 'irq_set_chip_data'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           irq_set_chip_data(irq, mt6397);
           ^
>> drivers/mfd/mt6358-irq.c:214:2: error: call to undeclared function 'irq_set_chip_and_handler'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           irq_set_chip_and_handler(irq, &mt6358_irq_chip, handle_level_irq);
           ^
>> drivers/mfd/mt6358-irq.c:214:50: error: use of undeclared identifier 'handle_level_irq'
           irq_set_chip_and_handler(irq, &mt6358_irq_chip, handle_level_irq);
                                                           ^
>> drivers/mfd/mt6358-irq.c:215:2: error: call to undeclared function 'irq_set_nested_thread'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           irq_set_nested_thread(irq, 1);
           ^
>> drivers/mfd/mt6358-irq.c:216:2: error: call to undeclared function 'irq_set_noprobe'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           irq_set_noprobe(irq);
           ^
   18 errors generated.


vim +/irq_data_get_irq_chip_data +20 drivers/mfd/mt6397-irq.c

a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   17  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   18  static void mt6397_irq_lock(struct irq_data *data)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   19  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @20  	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   21  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   22  	mutex_lock(&mt6397->irqlock);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   23  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   24  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   25  static void mt6397_irq_sync_unlock(struct irq_data *data)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   26  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   27  	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   28  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   29  	regmap_write(mt6397->regmap, mt6397->int_con[0],
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   30  		     mt6397->irq_masks_cur[0]);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   31  	regmap_write(mt6397->regmap, mt6397->int_con[1],
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   32  		     mt6397->irq_masks_cur[1]);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   33  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   34  	mutex_unlock(&mt6397->irqlock);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   35  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   36  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   37  static void mt6397_irq_disable(struct irq_data *data)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   38  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   39  	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @40  	int shift = data->hwirq & 0xf;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   41  	int reg = data->hwirq >> 4;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   42  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   43  	mt6397->irq_masks_cur[reg] &= ~BIT(shift);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   44  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   45  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   46  static void mt6397_irq_enable(struct irq_data *data)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   47  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   48  	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   49  	int shift = data->hwirq & 0xf;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   50  	int reg = data->hwirq >> 4;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   51  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   52  	mt6397->irq_masks_cur[reg] |= BIT(shift);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   53  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   54  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   55  static int mt6397_irq_set_wake(struct irq_data *irq_data, unsigned int on)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   56  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   57  	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(irq_data);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   58  	int shift = irq_data->hwirq & 0xf;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   59  	int reg = irq_data->hwirq >> 4;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   60  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   61  	if (on)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   62  		mt6397->wake_mask[reg] |= BIT(shift);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   63  	else
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   64  		mt6397->wake_mask[reg] &= ~BIT(shift);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   65  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   66  	return 0;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   67  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   68  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @69  static struct irq_chip mt6397_irq_chip = {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   70  	.name = "mt6397-irq",
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   71  	.irq_bus_lock = mt6397_irq_lock,
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   72  	.irq_bus_sync_unlock = mt6397_irq_sync_unlock,
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   73  	.irq_enable = mt6397_irq_enable,
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   74  	.irq_disable = mt6397_irq_disable,
e1243e0d72185c Paul Cercueil    2022-10-23   75  	.irq_set_wake = pm_sleep_ptr(mt6397_irq_set_wake),
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   76  };
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   77  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   78  static void mt6397_irq_handle_reg(struct mt6397_chip *mt6397, int reg,
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   79  				  int irqbase)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   80  {
4e2e7cfec13afa Hsin-Hsiung Wang 2020-04-21   81  	unsigned int status = 0;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   82  	int i, irq, ret;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   83  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   84  	ret = regmap_read(mt6397->regmap, reg, &status);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   85  	if (ret) {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   86  		dev_err(mt6397->dev, "Failed to read irq status: %d\n", ret);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   87  		return;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   88  	}
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   89  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   90  	for (i = 0; i < 16; i++) {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   91  		if (status & BIT(i)) {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   92  			irq = irq_find_mapping(mt6397->irq_domain, irqbase + i);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   93  			if (irq)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  @94  				handle_nested_irq(irq);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   95  		}
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   96  	}
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   97  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   98  	regmap_write(mt6397->regmap, reg, status);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05   99  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  100  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  101  static irqreturn_t mt6397_irq_thread(int irq, void *data)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  102  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  103  	struct mt6397_chip *mt6397 = data;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  104  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  105  	mt6397_irq_handle_reg(mt6397, mt6397->int_status[0], 0);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  106  	mt6397_irq_handle_reg(mt6397, mt6397->int_status[1], 16);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  107  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  108  	return IRQ_HANDLED;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  109  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  110  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  111  static int mt6397_irq_domain_map(struct irq_domain *d, unsigned int irq,
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  112  				 irq_hw_number_t hw)
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  113  {
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  114  	struct mt6397_chip *mt6397 = d->host_data;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  115  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05 @116  	irq_set_chip_data(irq, mt6397);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  117  	irq_set_chip_and_handler(irq, &mt6397_irq_chip, handle_level_irq);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  118  	irq_set_nested_thread(irq, 1);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  119  	irq_set_noprobe(irq);
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  120  
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  121  	return 0;
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  122  }
a4872e80ce7d2a Hsin-Hsiung Wang 2019-08-05  123  

:::::: The code at line 20 was first introduced by commit
:::::: a4872e80ce7d2a1844328176dbf279d0a2b89bdb mfd: mt6397: Extract IRQ related code from core driver

:::::: TO: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
:::::: CC: Lee Jones <lee.jones@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
