Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154522CA9;
	Fri, 26 May 2023 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685136647; x=1716672647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EyID9H12m9qSndsNUGu8MV9gTN5rKHZFfzBNucQ9L8A=;
  b=AhPQ4q2WaNAnjyOLQ1NkBBrbnb35E+i4F3B40REFUm8Hp2g9/MET/SEf
   Wtm9VY9put0+cAUk/RA+SjZWIWA3Wr2sDAn92iODZmfqZ5PsgKBLEUH9S
   gqLBl8YSdFmLTF0Stuig/59XDZTxkzTniTb4ZQ4GtAlDC8VVuvjD6DWfK
   cDFLaZ0eBK4fmE8F6eBx/19xUrWrJUwgQswekW44DNjrJYEzw5GeWJwoi
   kLjZlPqVFM0L548AdfpIVC6ibb4znjMSSjNBe0g2z/BREy1FNtZjgATOo
   jOojiMErqaUVqY4mBFZrhSa4ewq4cE2DAV/ZW17awmdhlST+3z0S+MpQH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440666208"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="440666208"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 14:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="770448584"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="770448584"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 May 2023 14:30:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2f1I-000Jc6-2a;
	Fri, 26 May 2023 21:30:44 +0000
Date: Sat, 27 May 2023 05:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] HACK: i2c: aspeed: Enable build without
 COMPILE_TEST
Message-ID: <202305270536.GXbPzREp-lkp@intel.com>
References: <20230525152203.32190-7-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525152203.32190-7-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/i2c-acpi-set-slave-mode-flag/20230525-233511
base:   f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
patch link:    https://lore.kernel.org/r/20230525152203.32190-7-Jonathan.Cameron%40huawei.com
patch subject: [RFC PATCH 6/6] HACK: i2c: aspeed: Enable build without COMPILE_TEST
config: i386-randconfig-i013-20230526 (https://download.01.org/0day-ci/archive/20230527/202305270536.GXbPzREp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c866c2b49e19eaa618df6661c42b24b7506beba3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Cameron/i2c-acpi-set-slave-mode-flag/20230525-233511
        git checkout c866c2b49e19eaa618df6661c42b24b7506beba3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270536.GXbPzREp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-aspeed.c:978:14: warning: unused variable 'parent_clk' [-Wunused-variable]
           struct clk *parent_clk;
                       ^
   1 warning generated.


vim +/parent_clk +978 drivers/i2c/busses/i2c-aspeed.c

87b59ff8d1d9d8 Brendan Higgins  2017-07-28   974  
f327c686d3ba44 Brendan Higgins  2017-06-20   975  static int aspeed_i2c_probe_bus(struct platform_device *pdev)
f327c686d3ba44 Brendan Higgins  2017-06-20   976  {
f327c686d3ba44 Brendan Higgins  2017-06-20   977  	struct aspeed_i2c_bus *bus;
f327c686d3ba44 Brendan Higgins  2017-06-20  @978  	struct clk *parent_clk;
f327c686d3ba44 Brendan Higgins  2017-06-20   979  	int irq, ret;
f327c686d3ba44 Brendan Higgins  2017-06-20   980  
f327c686d3ba44 Brendan Higgins  2017-06-20   981  	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
f327c686d3ba44 Brendan Higgins  2017-06-20   982  	if (!bus)
f327c686d3ba44 Brendan Higgins  2017-06-20   983  		return -ENOMEM;
f327c686d3ba44 Brendan Higgins  2017-06-20   984  
6b1e1925d82976 ye xingchen      2023-01-19   985  	bus->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
f327c686d3ba44 Brendan Higgins  2017-06-20   986  	if (IS_ERR(bus->base))
f327c686d3ba44 Brendan Higgins  2017-06-20   987  		return PTR_ERR(bus->base);
f327c686d3ba44 Brendan Higgins  2017-06-20   988  
d400cf85e735f5 Jonathan Cameron 2023-05-25   989  	//	parent_clk = devm_clk_get(&pdev->dev, NULL);
d400cf85e735f5 Jonathan Cameron 2023-05-25   990  	//	if (IS_ERR(parent_clk))//
d400cf85e735f5 Jonathan Cameron 2023-05-25   991  	//		return PTR_ERR(parent_clk);
d400cf85e735f5 Jonathan Cameron 2023-05-25   992  	bus->parent_clk_frequency = 1000000;//clk_get_rate(parent_clk);
f327c686d3ba44 Brendan Higgins  2017-06-20   993  	/* We just need the clock rate, we don't actually use the clk object. */
d400cf85e735f5 Jonathan Cameron 2023-05-25   994  	//devm_clk_put(&pdev->dev, parent_clk);
f327c686d3ba44 Brendan Higgins  2017-06-20   995  
edd20e95bca4a5 Joel Stanley     2017-11-01   996  	bus->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
edd20e95bca4a5 Joel Stanley     2017-11-01   997  	if (IS_ERR(bus->rst)) {
d400cf85e735f5 Jonathan Cameron 2023-05-25   998  		dev_warn(&pdev->dev,
6bc33c51976cd9 Jae Hyun Yoo     2018-07-02   999  			"missing or invalid reset controller device tree entry\n");
d400cf85e735f5 Jonathan Cameron 2023-05-25  1000  		bus->rst = 0;
d400cf85e735f5 Jonathan Cameron 2023-05-25  1001  	} else {
edd20e95bca4a5 Joel Stanley     2017-11-01  1002  		reset_control_deassert(bus->rst);
d400cf85e735f5 Jonathan Cameron 2023-05-25  1003  	}
edd20e95bca4a5 Joel Stanley     2017-11-01  1004  
248c1a4a98731d Jonathan Cameron 2023-05-25  1005  	ret = device_property_read_u32(&pdev->dev,
f327c686d3ba44 Brendan Higgins  2017-06-20  1006  				   "bus-frequency", &bus->bus_frequency);
f327c686d3ba44 Brendan Higgins  2017-06-20  1007  	if (ret < 0) {
f327c686d3ba44 Brendan Higgins  2017-06-20  1008  		dev_err(&pdev->dev,
f327c686d3ba44 Brendan Higgins  2017-06-20  1009  			"Could not read bus-frequency property\n");
90224e6468e15d Andy Shevchenko  2020-03-24  1010  		bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
f327c686d3ba44 Brendan Higgins  2017-06-20  1011  	}
f327c686d3ba44 Brendan Higgins  2017-06-20  1012  
17ccba67109cd0 Brendan Higgins  2018-09-21  1013  	bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
248c1a4a98731d Jonathan Cameron 2023-05-25  1014  		device_get_match_data(&pdev->dev);
248c1a4a98731d Jonathan Cameron 2023-05-25  1015  	if (!bus->get_clk_reg_val)
248c1a4a98731d Jonathan Cameron 2023-05-25  1016  		bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
87b59ff8d1d9d8 Brendan Higgins  2017-07-28  1017  
f327c686d3ba44 Brendan Higgins  2017-06-20  1018  	/* Initialize the I2C adapter */
f327c686d3ba44 Brendan Higgins  2017-06-20  1019  	spin_lock_init(&bus->lock);
f327c686d3ba44 Brendan Higgins  2017-06-20  1020  	init_completion(&bus->cmd_complete);
f327c686d3ba44 Brendan Higgins  2017-06-20  1021  	bus->adap.owner = THIS_MODULE;
f327c686d3ba44 Brendan Higgins  2017-06-20  1022  	bus->adap.retries = 0;
f327c686d3ba44 Brendan Higgins  2017-06-20  1023  	bus->adap.algo = &aspeed_i2c_algo;
f327c686d3ba44 Brendan Higgins  2017-06-20  1024  	bus->adap.dev.parent = &pdev->dev;
f327c686d3ba44 Brendan Higgins  2017-06-20  1025  	bus->adap.dev.of_node = pdev->dev.of_node;
ea1558ce149d28 Wolfram Sang     2022-08-11  1026  	strscpy(bus->adap.name, pdev->name, sizeof(bus->adap.name));
f327c686d3ba44 Brendan Higgins  2017-06-20  1027  	i2c_set_adapdata(&bus->adap, bus);
f327c686d3ba44 Brendan Higgins  2017-06-20  1028  
f327c686d3ba44 Brendan Higgins  2017-06-20  1029  	bus->dev = &pdev->dev;
f327c686d3ba44 Brendan Higgins  2017-06-20  1030  
f327c686d3ba44 Brendan Higgins  2017-06-20  1031  	/* Clean up any left over interrupt state. */
f327c686d3ba44 Brendan Higgins  2017-06-20  1032  	writel(0, bus->base + ASPEED_I2C_INTR_CTRL_REG);
f327c686d3ba44 Brendan Higgins  2017-06-20  1033  	writel(0xffffffff, bus->base + ASPEED_I2C_INTR_STS_REG);
f327c686d3ba44 Brendan Higgins  2017-06-20  1034  	/*
f327c686d3ba44 Brendan Higgins  2017-06-20  1035  	 * bus.lock does not need to be held because the interrupt handler has
f327c686d3ba44 Brendan Higgins  2017-06-20  1036  	 * not been enabled yet.
f327c686d3ba44 Brendan Higgins  2017-06-20  1037  	 */
f327c686d3ba44 Brendan Higgins  2017-06-20  1038  	ret = aspeed_i2c_init(bus, pdev);
f327c686d3ba44 Brendan Higgins  2017-06-20  1039  	if (ret < 0)
f327c686d3ba44 Brendan Higgins  2017-06-20  1040  		return ret;
f327c686d3ba44 Brendan Higgins  2017-06-20  1041  
f2016870518449 Jonathan Cameron 2023-05-25  1042  	irq = platform_get_irq(pdev, 0);
f327c686d3ba44 Brendan Higgins  2017-06-20  1043  	ret = devm_request_irq(&pdev->dev, irq, aspeed_i2c_bus_irq,
f327c686d3ba44 Brendan Higgins  2017-06-20  1044  			       0, dev_name(&pdev->dev), bus);
f327c686d3ba44 Brendan Higgins  2017-06-20  1045  	if (ret < 0)
f327c686d3ba44 Brendan Higgins  2017-06-20  1046  		return ret;
f327c686d3ba44 Brendan Higgins  2017-06-20  1047  
348e97f7dd4ae4 Jonathan Cameron 2023-05-25  1048  	device_set_node(&bus->adap.dev, dev_fwnode(&pdev->dev));
348e97f7dd4ae4 Jonathan Cameron 2023-05-25  1049  
f327c686d3ba44 Brendan Higgins  2017-06-20  1050  	ret = i2c_add_adapter(&bus->adap);
f327c686d3ba44 Brendan Higgins  2017-06-20  1051  	if (ret < 0)
f327c686d3ba44 Brendan Higgins  2017-06-20  1052  		return ret;
f327c686d3ba44 Brendan Higgins  2017-06-20  1053  
f327c686d3ba44 Brendan Higgins  2017-06-20  1054  	platform_set_drvdata(pdev, bus);
f327c686d3ba44 Brendan Higgins  2017-06-20  1055  
f327c686d3ba44 Brendan Higgins  2017-06-20  1056  	dev_info(bus->dev, "i2c bus %d registered, irq %d\n",
f327c686d3ba44 Brendan Higgins  2017-06-20  1057  		 bus->adap.nr, irq);
f327c686d3ba44 Brendan Higgins  2017-06-20  1058  
f327c686d3ba44 Brendan Higgins  2017-06-20  1059  	return 0;
f327c686d3ba44 Brendan Higgins  2017-06-20  1060  }
f327c686d3ba44 Brendan Higgins  2017-06-20  1061  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
