Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9CC1850
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 11:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656675644; x=1688211644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JFpolPhGQq5I4L9Y0C0pRXeNioxYIoHcbYFJ0nyb110=;
  b=jvga1AYpheXwOVza6ak3HhULr31U+Yux7hS/ORmzLLuqOTrjGQ2+wllN
   MCKHnRQvThPoAQVDz9obfI0BI1QJSEdHcFo7CpiCeGM4n7FYWfkoN3NZW
   tfaZ/qSgc0khXP+SdsOSMVeOJEqp4oRuOLC1l1qQR30Pig50PlD5ajQR8
   CcdYnEbzzJGLRE41ulCW+Qx3i41LhnI+OF3us/7bAMt5FXtnxL2zJ4hEz
   3HaaOHomNuyz/HhbhfL/BAm1FyfgFrhI7N61tNPrR5Jcp1YRVkFNGEUIM
   IEdEQDH7RLQHiyb9A1f88G++ld9YaxYgfF51wgq7jn0kn7sHJ8937jV2/
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="265663189"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="265663189"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 04:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="659405979"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Jul 2022 04:40:42 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o7F0r-000Dte-Iu;
	Fri, 01 Jul 2022 11:40:41 +0000
Date: Fri, 1 Jul 2022 19:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5093/7282]
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:391:24: error: cannot assign to
 variable 'data' with const-qualified type 'const struct
 lpi_pinctrl_variant_data *'
Message-ID: <202207011904.5vaoNPBb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c4185b16aba73929aa76f0d030efbe79ae867808
commit: 61a2cc093bdcb96cd3e3ed2082c3c30e3795d87e [5093/7282] pinctrl: qcom: sc7280: Fix compile bug
config: arm64-randconfig-r001-20220629 (https://download.01.org/0day-ci/archive/20220701/202207011904.5vaoNPBb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a9119143a2d1f4d0d0bc1fe0d819e5351b4e0deb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=61a2cc093bdcb96cd3e3ed2082c3c30e3795d87e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 61a2cc093bdcb96cd3e3ed2082c3c30e3795d87e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD c4185b16aba73929aa76f0d030efbe79ae867808 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:391:24: error: cannot assign to variable 'data' with const-qualified type 'const struct lpi_pinctrl_variant_data *'
           data->is_clk_optional = of_property_read_bool(dev->of_node,
           ~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:373:41: note: variable 'data' declared const here
           const struct lpi_pinctrl_variant_data *data;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   1 error generated.


vim +391 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c

   370	
   371	int lpi_pinctrl_probe(struct platform_device *pdev)
   372	{
   373		const struct lpi_pinctrl_variant_data *data;
   374		struct device *dev = &pdev->dev;
   375		struct lpi_pinctrl *pctrl;
   376		int ret;
   377	
   378		pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
   379		if (!pctrl)
   380			return -ENOMEM;
   381	
   382		platform_set_drvdata(pdev, pctrl);
   383	
   384		data = of_device_get_match_data(dev);
   385		if (!data)
   386			return -EINVAL;
   387	
   388		pctrl->data = data;
   389		pctrl->dev = &pdev->dev;
   390	
 > 391		data->is_clk_optional = of_property_read_bool(dev->of_node,
   392							      "qcom,adsp-bypass-mode");
   393	
   394		pctrl->clks[0].id = "core";
   395		pctrl->clks[1].id = "audio";
   396	
   397		pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
   398		if (IS_ERR(pctrl->tlmm_base))
   399			return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
   400					     "TLMM resource not provided\n");
   401	
   402		pctrl->slew_base = devm_platform_ioremap_resource(pdev, 1);
   403		if (IS_ERR(pctrl->slew_base))
   404			return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
   405					     "Slew resource not provided\n");
   406	
   407		if (data->is_clk_optional)
   408			ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
   409		else
   410			ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
   411	
   412		if (ret)
   413			return ret;
   414	
   415		ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
   416		if (ret)
   417			return dev_err_probe(dev, ret, "Can't enable clocks\n");
   418	
   419		pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
   420		pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
   421		pctrl->desc.confops = &lpi_gpio_pinconf_ops;
   422		pctrl->desc.owner = THIS_MODULE;
   423		pctrl->desc.name = dev_name(dev);
   424		pctrl->desc.pins = data->pins;
   425		pctrl->desc.npins = data->npins;
   426		pctrl->chip = lpi_gpio_template;
   427		pctrl->chip.parent = dev;
   428		pctrl->chip.base = -1;
   429		pctrl->chip.ngpio = data->npins;
   430		pctrl->chip.label = dev_name(dev);
   431		pctrl->chip.of_gpio_n_cells = 2;
   432		pctrl->chip.can_sleep = false;
   433	
   434		mutex_init(&pctrl->slew_access_lock);
   435	
   436		pctrl->ctrl = devm_pinctrl_register(dev, &pctrl->desc, pctrl);
   437		if (IS_ERR(pctrl->ctrl)) {
   438			ret = PTR_ERR(pctrl->ctrl);
   439			dev_err(dev, "failed to add pin controller\n");
   440			goto err_pinctrl;
   441		}
   442	
   443		ret = lpi_build_pin_desc_groups(pctrl);
   444		if (ret)
   445			goto err_pinctrl;
   446	
   447		ret = devm_gpiochip_add_data(dev, &pctrl->chip, pctrl);
   448		if (ret) {
   449			dev_err(pctrl->dev, "can't add gpio chip\n");
   450			goto err_pinctrl;
   451		}
   452	
   453		return 0;
   454	
   455	err_pinctrl:
   456		mutex_destroy(&pctrl->slew_access_lock);
   457		clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
   458	
   459		return ret;
   460	}
   461	EXPORT_SYMBOL_GPL(lpi_pinctrl_probe);
   462	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
