Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4807A
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 17:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644602343; x=1676138343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wr8z59AhvPe17hWufak7cRobpeH4CDz2xo/qr0CwikI=;
  b=hAb8ebtxaU/Vcz/y1s6HWHieultHptWxdqKZRkFAqoKM1ibm5uuc0vJo
   qydgWtqGAMmTXki55zLN/9AONWkJjGY2v1pa9OAT2gM9t+b2O8ggWbj5z
   oMIAhqp85EXzmqvopanNdiJZ5Ogh+9EcdhFDgi3ellyzPt4r26pKmvWDl
   7mLVuGsF9E1RPOOgBnNZcROjqRxlvRG6I2rccoyHE0usjKlkj+0/Kmpj2
   wXUb6NOX/jac7WWulY4wcKbWXpV9jINdCff2kv4/Q+wWgl/iT7GmMzeIv
   cenvOUejBTg7OSR2NUJmd8ls5+GjTHSt4TGl3A/TOj1vA1a8ka2OPONdc
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="233330857"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="233330857"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 09:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="537709759"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Feb 2022 09:59:01 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIaCD-0004uM-24; Fri, 11 Feb 2022 17:59:01 +0000
Date: Sat, 12 Feb 2022 01:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/gpio-immutable 21/29]
 drivers/gpio/gpio-mt7621.c:255:32: error: use of undeclared identifier
 'mediatek_gpio_irq_print_chip'; did you mean 'mediatek_irq_print_chip'?
Message-ID: <202202112125.cRFqhKb1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/gpio-immutable
head:   5bcef0d59c643b8a70398229d4e3b264d3079c48
commit: a464bf5adf64dc347b1c786351be4a8df88dcf8d [21/29] gpio: mt7621: Switch to dynamic chip name output
config: riscv-randconfig-c006-20220211 (https://download.01.org/0day-ci/archive/20220211/202202112125.cRFqhKb1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=a464bf5adf64dc347b1c786351be4a8df88dcf8d
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/gpio-immutable
        git checkout a464bf5adf64dc347b1c786351be4a8df88dcf8d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-mt7621.c:255:32: error: use of undeclared identifier 'mediatek_gpio_irq_print_chip'; did you mean 'mediatek_irq_print_chip'?
           rg->irq_chip.irq_print_chip = mediatek_gpio_irq_print_chip;
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                         mediatek_irq_print_chip
   drivers/gpio/gpio-mt7621.c:192:13: note: 'mediatek_irq_print_chip' declared here
   static void mediatek_irq_print_chip(struct irq_data *d, struct seq_file *p)
               ^
   1 error generated.


vim +255 drivers/gpio/gpio-mt7621.c

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
   251		rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
   252		rg->irq_chip.irq_mask = mediatek_gpio_irq_mask;
   253		rg->irq_chip.irq_mask_ack = mediatek_gpio_irq_mask;
   254		rg->irq_chip.irq_set_type = mediatek_gpio_irq_type;
 > 255		rg->irq_chip.irq_print_chip = mediatek_gpio_irq_print_chip;
   256	
   257		if (mtk->gpio_irq) {
   258			struct gpio_irq_chip *girq;
   259	
   260			/*
   261			 * Directly request the irq here instead of passing
   262			 * a flow-handler because the irq is shared.
   263			 */
   264			ret = devm_request_irq(dev, mtk->gpio_irq,
   265					       mediatek_gpio_irq_handler, IRQF_SHARED,
   266					       rg->chip.label, &rg->chip);
   267	
   268			if (ret) {
   269				dev_err(dev, "Error requesting IRQ %d: %d\n",
   270					mtk->gpio_irq, ret);
   271				return ret;
   272			}
   273	
   274			girq = &rg->chip.irq;
   275			girq->chip = &rg->irq_chip;
   276			/* This will let us handle the parent IRQ in the driver */
   277			girq->parent_handler = NULL;
   278			girq->num_parents = 0;
   279			girq->parents = NULL;
   280			girq->default_type = IRQ_TYPE_NONE;
   281			girq->handler = handle_simple_irq;
   282		}
   283	
   284		ret = devm_gpiochip_add_data(dev, &rg->chip, mtk);
   285		if (ret < 0) {
   286			dev_err(dev, "Could not register gpio %d, ret=%d\n",
   287				rg->chip.ngpio, ret);
   288			return ret;
   289		}
   290	
   291		/* set polarity to low for all gpios */
   292		mtk_gpio_w32(rg, GPIO_REG_POL, 0);
   293	
   294		dev_info(dev, "registering %d gpios\n", rg->chip.ngpio);
   295	
   296		return 0;
   297	}
   298	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
