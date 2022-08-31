Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8D74C61
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 19:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661975548; x=1693511548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pQ0OM6rmXJcDuQd380foHooOVQnS8iM7hunFay3p6tY=;
  b=Da8Y6S1vNjocA6LPko0EXAEMsKo37Vc13p3s/Jg1FVVvUocl7ooXfDkq
   LJSzrBh8fmKVB7J7z+aLmPBtQcI5KZURu0nNysnlgHWhuPJkiKeu64Sj1
   Tk2M9dB4Tw7LQyTGDELhyT5rRuAP+3GWdqCNCN2/gdQBUFrXeoB5ZdY/A
   0/zp3qPLf6Hy3aLgeTgPrbabcLkocRVZf9XHNhSOVxzc6w/uoX5uJ/6cU
   k7eM/TpA5g3mpj4LdLL/7PYMxmE+px0yFxkUtccLbykACKjCaubg02TER
   ntoqIrkAw1rlXao6XB9R6Qk5e9/sxXRaDetc71IiyKnTcakyFTAfmRo7N
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="278549099"
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; 
   d="scan'208";a="278549099"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 12:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; 
   d="scan'208";a="754533781"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 31 Aug 2022 12:52:25 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTTlA-0000e2-29;
	Wed, 31 Aug 2022 19:52:24 +0000
Date: Thu, 1 Sep 2022 03:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jianqun Xu <jay.xu@rock-chips.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] gpio: rockchip: Switch to use fwnode instead of
 of_node
Message-ID: <202209010355.qwMuqR06-lkp@intel.com>
References: <20220831134516.78108-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831134516.78108-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on linus/master v6.0-rc3 next-20220831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpio-rockchip-Switch-to-use-fwnode-instead-of-of_node/20220831-214721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: arm-randconfig-r036-20220830 (https://download.01.org/0day-ci/archive/20220901/202209010355.qwMuqR06-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1c66bacd6cde1f37d6ac96c45b389666a1334ec0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/1adf1d7efa2837b148a47d10749922358e6f1b8f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/gpio-rockchip-Switch-to-use-fwnode-instead-of-of_node/20220831-214721
        git checkout 1adf1d7efa2837b148a47d10749922358e6f1b8f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-rockchip.c:611:11: error: incompatible pointer types assigning to 'struct pinctrl_dev *' from 'struct pinctrl *' [-Werror,-Wincompatible-pointer-types]
                   pctldev = pinctrl_get(bank->dev->parent);
                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-rockchip.c:639:33: error: call to undeclared function 'to_platform_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct platform_device *pdev = to_platform_device(bank->dev);
                                          ^
>> drivers/gpio/gpio-rockchip.c:639:26: error: incompatible integer to pointer conversion initializing 'struct platform_device *' with an expression of type 'int' [-Wint-conversion]
           struct platform_device *pdev = to_platform_device(bank->dev);
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-rockchip.c:644:19: error: call to undeclared function 'devm_platform_ioremap_resource'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
                            ^
   drivers/gpio/gpio-rockchip.c:644:19: note: did you mean 'devm_ioremap_resource'?
   include/linux/device.h:235:15: note: 'devm_ioremap_resource' declared here
   void __iomem *devm_ioremap_resource(struct device *dev,
                 ^
>> drivers/gpio/gpio-rockchip.c:644:17: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
           bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-rockchip.c:648:14: error: call to undeclared function 'platform_get_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           bank->irq = platform_get_irq(pdev, 0);
                       ^
   drivers/gpio/gpio-rockchip.c:641:18: warning: unused variable 'res' [-Wunused-variable]
           struct resource res;
                           ^
>> drivers/gpio/gpio-rockchip.c:696:39: warning: declaration of 'struct platform_device' will not be visible outside of this function [-Wvisibility]
   static int rockchip_gpio_probe(struct platform_device *pdev)
                                         ^
>> drivers/gpio/gpio-rockchip.c:698:28: error: incomplete definition of type 'struct platform_device'
           struct device *dev = &pdev->dev;
                                 ~~~~^
   drivers/gpio/gpio-rockchip.c:696:39: note: forward declaration of 'struct platform_device'
   static int rockchip_gpio_probe(struct platform_device *pdev)
                                         ^
   drivers/gpio/gpio-rockchip.c:709:10: error: incompatible pointer types assigning to 'struct pinctrl_dev *' from 'struct pinctrl *' [-Werror,-Wincompatible-pointer-types]
           pctldev = pinctrl_get(dev->parent);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-rockchip.c:768:2: error: call to undeclared function 'platform_set_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           platform_set_drvdata(pdev, bank);
           ^
   drivers/gpio/gpio-rockchip.c:774:40: warning: declaration of 'struct platform_device' will not be visible outside of this function [-Wvisibility]
   static int rockchip_gpio_remove(struct platform_device *pdev)
                                          ^
>> drivers/gpio/gpio-rockchip.c:776:35: error: call to undeclared function 'platform_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
                                            ^
>> drivers/gpio/gpio-rockchip.c:776:28: error: incompatible integer to pointer conversion initializing 'struct rockchip_pin_bank *' with an expression of type 'int' [-Wint-conversion]
           struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
                                     ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-rockchip.c:790:31: error: variable has incomplete type 'struct platform_driver'
   static struct platform_driver rockchip_gpio_driver = {
                                 ^
   drivers/gpio/gpio-rockchip.c:790:15: note: forward declaration of 'struct platform_driver'
   static struct platform_driver rockchip_gpio_driver = {
                 ^
>> drivers/gpio/gpio-rockchip.c:801:9: error: call to undeclared function 'platform_driver_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return platform_driver_register(&rockchip_gpio_driver);
                  ^
>> drivers/gpio/gpio-rockchip.c:807:2: error: call to undeclared function 'platform_driver_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           platform_driver_unregister(&rockchip_gpio_driver);
           ^
   3 warnings and 14 errors generated.


vim +611 drivers/gpio/gpio-rockchip.c

   577	
   578	static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
   579	{
   580		struct gpio_chip *gc;
   581		int ret;
   582	
   583		bank->gpio_chip = rockchip_gpiolib_chip;
   584	
   585		gc = &bank->gpio_chip;
   586		gc->base = bank->pin_base;
   587		gc->ngpio = bank->nr_pins;
   588		gc->label = bank->name;
   589		gc->parent = bank->dev;
   590	
   591		ret = gpiochip_add_data(gc, bank);
   592		if (ret) {
   593			dev_err(bank->dev, "failed to add gpiochip %s, %d\n",
   594				gc->label, ret);
   595			return ret;
   596		}
   597	
   598		/*
   599		 * For DeviceTree-supported systems, the gpio core checks the
   600		 * pinctrl's device node for the "gpio-ranges" property.
   601		 * If it is present, it takes care of adding the pin ranges
   602		 * for the driver. In this case the driver can skip ahead.
   603		 *
   604		 * In order to remain compatible with older, existing DeviceTree
   605		 * files which don't set the "gpio-ranges" property or systems that
   606		 * utilize ACPI the driver has to call gpiochip_add_pin_range().
   607		 */
   608		if (!device_property_read_bool(bank->dev, "gpio-ranges")) {
   609			struct pinctrl_dev *pctldev = NULL;
   610	
 > 611			pctldev = pinctrl_get(bank->dev->parent);
   612			if (!pctldev)
   613				return -ENODEV;
   614	
   615			ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
   616						     gc->base, gc->ngpio);
   617			if (ret) {
   618				dev_err(bank->dev, "Failed to add pin range\n");
   619				goto fail;
   620			}
   621		}
   622	
   623		ret = rockchip_interrupts_register(bank);
   624		if (ret) {
   625			dev_err(bank->dev, "failed to register interrupt, %d\n", ret);
   626			goto fail;
   627		}
   628	
   629		return 0;
   630	
   631	fail:
   632		gpiochip_remove(&bank->gpio_chip);
   633	
   634		return ret;
   635	}
   636	
   637	static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
   638	{
 > 639		struct platform_device *pdev = to_platform_device(bank->dev);
   640		struct device_node *np = bank->dev->of_node;
   641		struct resource res;
   642		int id = 0;
   643	
 > 644		bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
   645		if (IS_ERR(bank->reg_base))
   646			return PTR_ERR(bank->reg_base);
   647	
 > 648		bank->irq = platform_get_irq(pdev, 0);
   649		if (!bank->irq)
   650			return -EINVAL;
   651	
   652		bank->clk = of_clk_get(np, 0);
   653		if (IS_ERR(bank->clk))
   654			return PTR_ERR(bank->clk);
   655	
   656		clk_prepare_enable(bank->clk);
   657		id = readl(bank->reg_base + gpio_regs_v2.version_id);
   658	
   659		/* If not gpio v2, that is default to v1. */
   660		if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
   661			bank->gpio_regs = &gpio_regs_v2;
   662			bank->gpio_type = GPIO_TYPE_V2;
   663			bank->db_clk = of_clk_get(np, 1);
   664			if (IS_ERR(bank->db_clk)) {
   665				dev_err(bank->dev, "cannot find debounce clk\n");
   666				clk_disable_unprepare(bank->clk);
   667				return -EINVAL;
   668			}
   669		} else {
   670			bank->gpio_regs = &gpio_regs_v1;
   671			bank->gpio_type = GPIO_TYPE_V1;
   672		}
   673	
   674		return 0;
   675	}
   676	
   677	static struct rockchip_pin_bank *
   678	rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
   679	{
   680		struct rockchip_pinctrl *info;
   681		struct rockchip_pin_bank *bank;
   682		int i, found = 0;
   683	
   684		info = pinctrl_dev_get_drvdata(pctldev);
   685		bank = info->ctrl->pin_banks;
   686		for (i = 0; i < info->ctrl->nr_banks; i++, bank++) {
   687			if (bank->bank_num == id) {
   688				found = 1;
   689				break;
   690			}
   691		}
   692	
   693		return found ? bank : NULL;
   694	}
   695	
 > 696	static int rockchip_gpio_probe(struct platform_device *pdev)
   697	{
 > 698		struct device *dev = &pdev->dev;
   699		struct device_node *np = dev->of_node;
   700		struct pinctrl_dev *pctldev = NULL;
   701		struct rockchip_pin_bank *bank = NULL;
   702		struct rockchip_pin_deferred *cfg;
   703		static int gpio;
   704		int id, ret;
   705	
   706		if (!dev->parent)
   707			return -ENODEV;
   708	
   709		pctldev = pinctrl_get(dev->parent);
   710		if (!pctldev)
   711			return -EPROBE_DEFER;
   712	
   713		id = of_alias_get_id(np, "gpio");
   714		if (id < 0)
   715			id = gpio++;
   716	
   717		bank = rockchip_gpio_find_bank(pctldev, id);
   718		if (!bank)
   719			return -EINVAL;
   720	
   721		bank->dev = dev;
   722	
   723		raw_spin_lock_init(&bank->slock);
   724	
   725		ret = rockchip_get_bank_data(bank);
   726		if (ret)
   727			return ret;
   728	
   729		/*
   730		 * Prevent clashes with a deferred output setting
   731		 * being added right at this moment.
   732		 */
   733		mutex_lock(&bank->deferred_lock);
   734	
   735		ret = rockchip_gpiolib_register(bank);
   736		if (ret) {
   737			clk_disable_unprepare(bank->clk);
   738			mutex_unlock(&bank->deferred_lock);
   739			return ret;
   740		}
   741	
   742		while (!list_empty(&bank->deferred_pins)) {
   743			cfg = list_first_entry(&bank->deferred_pins,
   744					       struct rockchip_pin_deferred, head);
   745			list_del(&cfg->head);
   746	
   747			switch (cfg->param) {
   748			case PIN_CONFIG_OUTPUT:
   749				ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
   750				if (ret)
   751					dev_warn(dev, "setting output pin %u to %u failed\n", cfg->pin,
   752						 cfg->arg);
   753				break;
   754			case PIN_CONFIG_INPUT_ENABLE:
   755				ret = rockchip_gpio_direction_input(&bank->gpio_chip, cfg->pin);
   756				if (ret)
   757					dev_warn(dev, "setting input pin %u failed\n", cfg->pin);
   758				break;
   759			default:
   760				dev_warn(dev, "unknown deferred config param %d\n", cfg->param);
   761				break;
   762			}
   763			kfree(cfg);
   764		}
   765	
   766		mutex_unlock(&bank->deferred_lock);
   767	
 > 768		platform_set_drvdata(pdev, bank);
   769		dev_info(dev, "probed %pfw\n", dev_fwnode(dev));
   770	
   771		return 0;
   772	}
   773	
   774	static int rockchip_gpio_remove(struct platform_device *pdev)
   775	{
 > 776		struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
   777	
   778		clk_disable_unprepare(bank->clk);
   779		gpiochip_remove(&bank->gpio_chip);
   780	
   781		return 0;
   782	}
   783	
   784	static const struct of_device_id rockchip_gpio_match[] = {
   785		{ .compatible = "rockchip,gpio-bank", },
   786		{ .compatible = "rockchip,rk3188-gpio-bank0" },
   787		{ },
   788	};
   789	
 > 790	static struct platform_driver rockchip_gpio_driver = {
   791		.probe		= rockchip_gpio_probe,
   792		.remove		= rockchip_gpio_remove,
   793		.driver		= {
   794			.name	= "rockchip-gpio",
   795			.of_match_table = rockchip_gpio_match,
   796		},
   797	};
   798	
   799	static int __init rockchip_gpio_init(void)
   800	{
 > 801		return platform_driver_register(&rockchip_gpio_driver);
   802	}
   803	postcore_initcall(rockchip_gpio_init);
   804	
   805	static void __exit rockchip_gpio_exit(void)
   806	{
 > 807		platform_driver_unregister(&rockchip_gpio_driver);
   808	}
   809	module_exit(rockchip_gpio_exit);
   810	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
