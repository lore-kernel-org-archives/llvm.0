Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4057B2CA1
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 19:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643655886; x=1675191886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9SaaUBwuBba+0L8iHgj8m6f8tkKwojxFebruG/GQETA=;
  b=UZ8cWeqTzV1RVNQduSV5JFFWwiKyrNMLOFGtGG35oUjDJkcrXFI4I83w
   4yuRiBARV0jqJWKzAvGZSktFB/MxxfSujAwL9ebHTrWSh3H4QDNakWDSo
   zIYcPpQlC881r8j4nyJBQo/GRf2HDjClbAYKUVBTrlZf13CxOZajcMT8/
   iinSNjvWuV2P4HpRFy+tl8iHLLb4Mq4TQLsB7K4ORlShmC2SZ42ENa0oy
   kb2sT1dTQpJ+lDXO+3/E2aiEIacDxVHDgz94SOGdk/AuKnUcnBhRF58bR
   lsn9tZ8y6pbqdtyjGaX73gwA2GYsHO5tq0076hngPWpVbNrWn06y+WAGA
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="272004343"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="272004343"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 11:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="619482826"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Jan 2022 11:04:44 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEbyl-000SG6-DQ; Mon, 31 Jan 2022 19:04:43 +0000
Date: Tue, 1 Feb 2022 03:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/irq_chip_ro 10/20]
 drivers/gpio/gpio-mt7621.c:194:52: error: passing 'struct irq_data' to
 parameter of incompatible type 'struct irq_data *'; take the address with &
Message-ID: <202202010258.N2ESwcCK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/irq_chip_ro
head:   3feae85f6c2365d60a02d167b72a3e7410f82160
commit: a2c5a576e1b1c539e3676c024c67a3c2acfe8852 [10/20] gpio: mt7621: Switch to dynamic chip name output
config: riscv-randconfig-r036-20220130 (https://download.01.org/0day-ci/archive/20220201/202202010258.N2ESwcCK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=a2c5a576e1b1c539e3676c024c67a3c2acfe8852
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/irq_chip_ro
        git checkout a2c5a576e1b1c539e3676c024c67a3c2acfe8852
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-mt7621.c:194:52: error: passing 'struct irq_data' to parameter of incompatible type 'struct irq_data *'; take the address with &
           struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
                                                             ^
                                                             &
   include/linux/irq.h:834:65: note: passing argument to parameter 'd' here
   static inline void *irq_data_get_irq_chip_data(struct irq_data *d)
                                                                   ^
>> drivers/gpio/gpio-mt7621.c:198:22: error: implicit declaration of function 'devname' [-Werror,-Wimplicit-function-declaration]
           seq_printf(p, "%s", devname(mtk->dev));
                               ^
   drivers/gpio/gpio-mt7621.c:198:22: note: did you mean 'dev_name'?
   include/linux/device.h:633:27: note: 'dev_name' declared here
   static inline const char *dev_name(const struct device *dev)
                             ^
>> drivers/gpio/gpio-mt7621.c:198:22: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
           seq_printf(p, "%s", devname(mtk->dev));
                          ~~   ^~~~~~~~~~~~~~~~~
                          %d
>> drivers/gpio/gpio-mt7621.c:256:32: error: use of undeclared identifier 'mediatek_gpio_irq_print_chip'; did you mean 'mediatek_irq_print_chip'?
           rg->irq_chip.irq_print_chip = mediatek_gpio_irq_print_chip;
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                         mediatek_irq_print_chip
   drivers/gpio/gpio-mt7621.c:192:13: note: 'mediatek_irq_print_chip' declared here
   static void mediatek_irq_print_chip(struct irq_data d, struct seq_file *p)
               ^
   1 warning and 3 errors generated.


vim +194 drivers/gpio/gpio-mt7621.c

   191	
   192	static void mediatek_irq_print_chip(struct irq_data d, struct seq_file *p)
   193	{
 > 194		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
   195		struct mtk_gc *rg = to_mediatek_gpio(gc);
   196		struct mtk *mtk = container_of(rg - rg->bank, struct mtk, gc_map[0]);
   197	
 > 198		seq_printf(p, "%s", devname(mtk->dev));
   199	}
   200	
   201	static int
   202	mediatek_gpio_xlate(struct gpio_chip *chip,
   203			    const struct of_phandle_args *spec, u32 *flags)
   204	{
   205		int gpio = spec->args[0];
   206		struct mtk_gc *rg = to_mediatek_gpio(chip);
   207	
   208		if (rg->bank != gpio / MTK_BANK_WIDTH)
   209			return -EINVAL;
   210	
   211		if (flags)
   212			*flags = spec->args[1];
   213	
   214		return gpio % MTK_BANK_WIDTH;
   215	}
   216	
   217	static int
   218	mediatek_gpio_bank_probe(struct device *dev, int bank)
   219	{
   220		struct mtk *mtk = dev_get_drvdata(dev);
   221		struct mtk_gc *rg;
   222		void __iomem *dat, *set, *ctrl, *diro;
   223		int ret;
   224	
   225		rg = &mtk->gc_map[bank];
   226		memset(rg, 0, sizeof(*rg));
   227	
   228		spin_lock_init(&rg->lock);
   229		rg->bank = bank;
   230	
   231		dat = mtk->base + GPIO_REG_DATA + (rg->bank * GPIO_BANK_STRIDE);
   232		set = mtk->base + GPIO_REG_DSET + (rg->bank * GPIO_BANK_STRIDE);
   233		ctrl = mtk->base + GPIO_REG_DCLR + (rg->bank * GPIO_BANK_STRIDE);
   234		diro = mtk->base + GPIO_REG_CTRL + (rg->bank * GPIO_BANK_STRIDE);
   235	
   236		ret = bgpio_init(&rg->chip, dev, 4, dat, set, ctrl, diro, NULL,
   237				 BGPIOF_NO_SET_ON_INPUT);
   238		if (ret) {
   239			dev_err(dev, "bgpio_init() failed\n");
   240			return ret;
   241		}
   242	
   243		rg->chip.of_gpio_n_cells = 2;
   244		rg->chip.of_xlate = mediatek_gpio_xlate;
   245		rg->chip.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
   246						dev_name(dev), bank);
   247		if (!rg->chip.label)
   248			return -ENOMEM;
   249	
   250		rg->chip.offset = bank * MTK_BANK_WIDTH;
   251		rg->irq_chip.parent_device = dev;
   252		rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
   253		rg->irq_chip.irq_mask = mediatek_gpio_irq_mask;
   254		rg->irq_chip.irq_mask_ack = mediatek_gpio_irq_mask;
   255		rg->irq_chip.irq_set_type = mediatek_gpio_irq_type;
 > 256		rg->irq_chip.irq_print_chip = mediatek_gpio_irq_print_chip;
   257	
   258		if (mtk->gpio_irq) {
   259			struct gpio_irq_chip *girq;
   260	
   261			/*
   262			 * Directly request the irq here instead of passing
   263			 * a flow-handler because the irq is shared.
   264			 */
   265			ret = devm_request_irq(dev, mtk->gpio_irq,
   266					       mediatek_gpio_irq_handler, IRQF_SHARED,
   267					       rg->chip.label, &rg->chip);
   268	
   269			if (ret) {
   270				dev_err(dev, "Error requesting IRQ %d: %d\n",
   271					mtk->gpio_irq, ret);
   272				return ret;
   273			}
   274	
   275			girq = &rg->chip.irq;
   276			girq->chip = &rg->irq_chip;
   277			/* This will let us handle the parent IRQ in the driver */
   278			girq->parent_handler = NULL;
   279			girq->num_parents = 0;
   280			girq->parents = NULL;
   281			girq->default_type = IRQ_TYPE_NONE;
   282			girq->handler = handle_simple_irq;
   283		}
   284	
   285		ret = devm_gpiochip_add_data(dev, &rg->chip, mtk);
   286		if (ret < 0) {
   287			dev_err(dev, "Could not register gpio %d, ret=%d\n",
   288				rg->chip.ngpio, ret);
   289			return ret;
   290		}
   291	
   292		/* set polarity to low for all gpios */
   293		mtk_gpio_w32(rg, GPIO_REG_POL, 0);
   294	
   295		dev_info(dev, "registering %d gpios\n", rg->chip.ngpio);
   296	
   297		return 0;
   298	}
   299	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
