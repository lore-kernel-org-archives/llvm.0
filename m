Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3197F
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 06:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652770573; x=1684306573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SqREfGFQUZOSJTz1mSBEL9WlJilyh8m0Jf+Q+nKpd3Q=;
  b=Xw/VbN1oDLgS/vNnhlUxTIqRlVoCDAQqE+WdkRejO/4WRkE1SJL2Uc+0
   IXMCuFMTdZLmBvLncv6flLDTP3gPiR5zKrlKHuGapB1WLN+XSpk+wHigO
   tz0nOG9mgTxjm98uyDkNgKwrR59V9TbP1gQcS3+bUvDUQez3MB0+I4kcQ
   XykySIN2weB5B5pczGKF9QgwUezY0l6fZiDMjXhfwNgNo9reGaDOysIJc
   sbJTA7NAqf0YRdQvblwraSs+5258OyuEub6Fvmi+iLPpQ7gZQQ9vyXTU1
   AGQ9s/vVDgankgOUhFpmrTJstoQKQ45FYRyBEunOZ8/6u9QB5P0KTa1q5
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="271030015"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="271030015"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 23:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="605215597"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 May 2022 23:56:11 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqr7q-0000hf-Se;
	Tue, 17 May 2022 06:56:10 +0000
Date: Tue, 17 May 2022 14:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] pinctrl: intel: Drop unsued irqchip member in
 struct intel_pinctrl
Message-ID: <202205171446.KkMJMsjU-lkp@intel.com>
References: <20220516185618.32448-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516185618.32448-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on v5.18-rc7 next-20220516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-intel-make-irq_chip-immutable/20220517-025735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220517/202205171446.KkMJMsjU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/396b7abcd486a384c9b8fd7a0ecb13aff05e2163
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/pinctrl-intel-make-irq_chip-immutable/20220517-025735
        git checkout 396b7abcd486a384c9b8fd7a0ecb13aff05e2163
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/pinctrl/intel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/intel/pinctrl-cherryview.c:1614:9: error: no member named 'irqchip' in 'struct intel_pinctrl'
           pctrl->irqchip.name = "chv-gpio";
           ~~~~~  ^
   drivers/pinctrl/intel/pinctrl-cherryview.c:1615:9: error: no member named 'irqchip' in 'struct intel_pinctrl'
           pctrl->irqchip.irq_startup = chv_gpio_irq_startup;
           ~~~~~  ^
   drivers/pinctrl/intel/pinctrl-cherryview.c:1616:9: error: no member named 'irqchip' in 'struct intel_pinctrl'
           pctrl->irqchip.irq_ack = chv_gpio_irq_ack;
           ~~~~~  ^
   drivers/pinctrl/intel/pinctrl-cherryview.c:1617:9: error: no member named 'irqchip' in 'struct intel_pinctrl'
           pctrl->irqchip.irq_mask = chv_gpio_irq_mask;
           ~~~~~  ^
   drivers/pinctrl/intel/pinctrl-cherryview.c:1618:9: error: no member named 'irqchip' in 'struct intel_pinctrl'
           pctrl->irqchip.irq_unmask = chv_gpio_irq_unmask;
           ~~~~~  ^
   drivers/pinctrl/intel/pinctrl-cherryview.c:1619:9: error: no member named 'irqchip' in 'struct intel_pinctrl'
           pctrl->irqchip.irq_set_type = chv_gpio_irq_type;
           ~~~~~  ^
   drivers/pinctrl/intel/pinctrl-cherryview.c:1620:9: error: no member named 'irqchip' in 'struct intel_pinctrl'
           pctrl->irqchip.flags = IRQCHIP_SKIP_SET_WAKE;
           ~~~~~  ^
   drivers/pinctrl/intel/pinctrl-cherryview.c:1622:27: error: no member named 'irqchip' in 'struct intel_pinctrl'
           chip->irq.chip = &pctrl->irqchip;
                             ~~~~~  ^
   8 errors generated.


vim +1614 drivers/pinctrl/intel/pinctrl-cherryview.c

bd90633a5c5433b Hans de Goede     2019-11-14  1595  
3ea2e2cabd2dc74 Andy Shevchenko   2020-07-27  1596  static int chv_gpio_probe(struct intel_pinctrl *pctrl, int irq)
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1597  {
293428f93260d45 Andy Shevchenko   2020-06-09  1598  	const struct intel_community *community = &pctrl->communities[0];
36ad7b24486ae5e Andy Shevchenko   2020-04-01  1599  	const struct intel_padgroup *gpp;
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1600  	struct gpio_chip *chip = &pctrl->chip;
db1b2a8caf5b495 Andy Shevchenko   2021-11-26  1601  	struct device *dev = pctrl->dev;
7036502783729c2 Mika Westerberg   2017-04-10  1602  	bool need_valid_mask = !dmi_check_system(chv_no_valid_mask);
03c4749dd6c7ff9 Mika Westerberg   2017-11-27  1603  	int ret, i, irq_base;
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1604  
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1605  	*chip = chv_gpio_chip;
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1606  
293428f93260d45 Andy Shevchenko   2020-06-09  1607  	chip->ngpio = pctrl->soc->pins[pctrl->soc->npins - 1].number + 1;
db1b2a8caf5b495 Andy Shevchenko   2021-11-26  1608  	chip->label = dev_name(dev);
bd90633a5c5433b Hans de Goede     2019-11-14  1609  	chip->add_pin_ranges = chv_gpio_add_pin_ranges;
db1b2a8caf5b495 Andy Shevchenko   2021-11-26  1610  	chip->parent = dev;
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1611  	chip->base = -1;
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1612  
b9a19bdbc843abd Hans de Goede     2019-11-14  1613  	pctrl->irq = irq;
b9a19bdbc843abd Hans de Goede     2019-11-14 @1614  	pctrl->irqchip.name = "chv-gpio";
b9a19bdbc843abd Hans de Goede     2019-11-14  1615  	pctrl->irqchip.irq_startup = chv_gpio_irq_startup;
b9a19bdbc843abd Hans de Goede     2019-11-14  1616  	pctrl->irqchip.irq_ack = chv_gpio_irq_ack;
b9a19bdbc843abd Hans de Goede     2019-11-14  1617  	pctrl->irqchip.irq_mask = chv_gpio_irq_mask;
b9a19bdbc843abd Hans de Goede     2019-11-14  1618  	pctrl->irqchip.irq_unmask = chv_gpio_irq_unmask;
b9a19bdbc843abd Hans de Goede     2019-11-14  1619  	pctrl->irqchip.irq_set_type = chv_gpio_irq_type;
b9a19bdbc843abd Hans de Goede     2019-11-14  1620  	pctrl->irqchip.flags = IRQCHIP_SKIP_SET_WAKE;
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1621  
b9a19bdbc843abd Hans de Goede     2019-11-14  1622  	chip->irq.chip = &pctrl->irqchip;
b9a19bdbc843abd Hans de Goede     2019-11-14  1623  	chip->irq.init_hw = chv_gpio_irq_init_hw;
b9a19bdbc843abd Hans de Goede     2019-11-14  1624  	chip->irq.parent_handler = chv_gpio_irq_handler;
b9a19bdbc843abd Hans de Goede     2019-11-14  1625  	chip->irq.num_parents = 1;
b9a19bdbc843abd Hans de Goede     2019-11-14  1626  	chip->irq.parents = &pctrl->irq;
b9a19bdbc843abd Hans de Goede     2019-11-14  1627  	chip->irq.default_type = IRQ_TYPE_NONE;
b9a19bdbc843abd Hans de Goede     2019-11-14  1628  	chip->irq.handler = handle_bad_irq;
b9a19bdbc843abd Hans de Goede     2019-11-14  1629  	if (need_valid_mask) {
b9a19bdbc843abd Hans de Goede     2019-11-14  1630  		chip->irq.init_valid_mask = chv_init_irq_valid_mask;
b9a19bdbc843abd Hans de Goede     2019-11-14  1631  	} else {
db1b2a8caf5b495 Andy Shevchenko   2021-11-26  1632  		irq_base = devm_irq_alloc_descs(dev, -1, 0, pctrl->soc->npins, NUMA_NO_NODE);
845e405e5e6c9dc Grygorii Strashko 2017-10-03  1633  		if (irq_base < 0) {
db1b2a8caf5b495 Andy Shevchenko   2021-11-26  1634  			dev_err(dev, "Failed to allocate IRQ numbers\n");
845e405e5e6c9dc Grygorii Strashko 2017-10-03  1635  			return irq_base;
845e405e5e6c9dc Grygorii Strashko 2017-10-03  1636  		}
845e405e5e6c9dc Grygorii Strashko 2017-10-03  1637  	}
845e405e5e6c9dc Grygorii Strashko 2017-10-03  1638  
db1b2a8caf5b495 Andy Shevchenko   2021-11-26  1639  	ret = devm_gpiochip_add_data(dev, chip, pctrl);
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1640  	if (ret) {
db1b2a8caf5b495 Andy Shevchenko   2021-11-26  1641  		dev_err(dev, "Failed to register gpiochip\n");
d1073418d952f6a Mika Westerberg   2016-09-20  1642  		return ret;
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1643  	}
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1644  
83b9dc11312f48a Mika Westerberg   2018-04-25  1645  	if (!need_valid_mask) {
36ad7b24486ae5e Andy Shevchenko   2020-04-01  1646  		for (i = 0; i < community->ngpps; i++) {
36ad7b24486ae5e Andy Shevchenko   2020-04-01  1647  			gpp = &community->gpps[i];
83b9dc11312f48a Mika Westerberg   2018-04-25  1648  
83b9dc11312f48a Mika Westerberg   2018-04-25  1649  			irq_domain_associate_many(chip->irq.domain, irq_base,
36ad7b24486ae5e Andy Shevchenko   2020-04-01  1650  						  gpp->base, gpp->size);
36ad7b24486ae5e Andy Shevchenko   2020-04-01  1651  			irq_base += gpp->size;
83b9dc11312f48a Mika Westerberg   2018-04-25  1652  		}
83b9dc11312f48a Mika Westerberg   2018-04-25  1653  	}
83b9dc11312f48a Mika Westerberg   2018-04-25  1654  
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1655  	return 0;
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1656  }
6e08d6bbebebcf7 Mika Westerberg   2014-11-03  1657  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
