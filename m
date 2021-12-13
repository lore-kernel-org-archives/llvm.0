Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151AF29CA
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 19:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639424278; x=1670960278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PPI/rq7kgLCi69o26RMAWzU8xv1HpdXEH8RJJKCbm2g=;
  b=QU1HhYLAJOTCyPCZWvUEPdM8PP3ykzRKnBmcdusiZ5pZP7aBK9aPTEUZ
   n28K7lfkfenokYEM7+w8vja0wculjCT5+jwp3yRTxtu8jGW6O1lwen8fy
   bHywUYAjoaUhA2vJZ12Zm4hogi/1EtAvNSaqH0bDpB31N8swuIvnFfzIY
   dRYzvlbf4QMOQjuZ3YLMqgzuO/7gj12o1yMq57l5+wY9ZZoF8XRoPfwDg
   jBKWDNzcOXnLXX7XksWhbNK85/8W3ewGPJ6YiXHppVqIHc16wWhgu4ltm
   J13U8LbCPCjCa4rxC68kejvWPc+HYptrW0SpDLglJnvtP2JTGb4jSBAMJ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238625527"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="238625527"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 11:37:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="681754884"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Dec 2021 11:37:54 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwr8z-0006zS-Lb; Mon, 13 Dec 2021 19:37:53 +0000
Date: Tue, 14 Dec 2021 03:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marc Zyngier <maz@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
	Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
	Colin Foster <colin.foster@in-advantage.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] pinctrl: Propagate firmware node from a parent
 device
Message-ID: <202112140342.nuGxXwso-lkp@intel.com>
References: <20211213163929.7509-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213163929.7509-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on linusw-pinctrl/devel]
[cannot apply to geert-renesas-drivers/renesas-pinctrl v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/pinctrl-Get-rid-of-duplicate-of_node-assignment-in-the-drivers/20211214-004129
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: hexagon-randconfig-r045-20211213 (https://download.01.org/0day-ci/archive/20211214/202112140342.nuGxXwso-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/09301bc05d31cbebbea459be85ce973a065379d1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/pinctrl-Get-rid-of-duplicate-of_node-assignment-in-the-drivers/20211214-004129
        git checkout 09301bc05d31cbebbea459be85ce973a065379d1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/pinctrl/cirrus/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/pinctrl/cirrus/pinctrl-madera-core.c:1007:30: error: implicit declaration of function 'dev_fwnode' [-Werror,-Wimplicit-function-declaration]
           device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
                                       ^
   drivers/pinctrl/cirrus/pinctrl-madera-core.c:1007:30: note: did you mean 'dev_of_node'?
   include/linux/device.h:783:35: note: 'dev_of_node' declared here
   static inline struct device_node *dev_of_node(struct device *dev)
                                     ^
>> drivers/pinctrl/cirrus/pinctrl-madera-core.c:1007:30: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct fwnode_handle *' [-Wint-conversion]
           device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:854:64: note: passing argument to parameter 'fwnode' here
   void device_set_node(struct device *dev, struct fwnode_handle *fwnode);
                                                                  ^
   1 warning and 1 error generated.


vim +/dev_fwnode +1007 drivers/pinctrl/cirrus/pinctrl-madera-core.c

   994	
   995	static int madera_pin_probe(struct platform_device *pdev)
   996	{
   997		struct madera *madera = dev_get_drvdata(pdev->dev.parent);
   998		const struct madera_pdata *pdata = &madera->pdata;
   999		struct madera_pin_private *priv;
  1000		int ret;
  1001	
  1002		BUILD_BUG_ON(ARRAY_SIZE(madera_pin_single_group_names) !=
  1003			     ARRAY_SIZE(madera_pin_single_group_pins));
  1004	
  1005		dev_dbg(&pdev->dev, "%s\n", __func__);
  1006	
> 1007		device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
  1008	
  1009		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
  1010		if (!priv)
  1011			return -ENOMEM;
  1012	
  1013		priv->dev = &pdev->dev;
  1014		priv->madera = madera;
  1015	
  1016		switch (madera->type) {
  1017		case CS47L15:
  1018			if (IS_ENABLED(CONFIG_PINCTRL_CS47L15))
  1019				priv->chip = &cs47l15_pin_chip;
  1020			break;
  1021		case CS47L35:
  1022			if (IS_ENABLED(CONFIG_PINCTRL_CS47L35))
  1023				priv->chip = &cs47l35_pin_chip;
  1024			break;
  1025		case CS47L85:
  1026		case WM1840:
  1027			if (IS_ENABLED(CONFIG_PINCTRL_CS47L85))
  1028				priv->chip = &cs47l85_pin_chip;
  1029			break;
  1030		case CS47L90:
  1031		case CS47L91:
  1032			if (IS_ENABLED(CONFIG_PINCTRL_CS47L90))
  1033				priv->chip = &cs47l90_pin_chip;
  1034			break;
  1035		case CS42L92:
  1036		case CS47L92:
  1037		case CS47L93:
  1038			if (IS_ENABLED(CONFIG_PINCTRL_CS47L92))
  1039				priv->chip = &cs47l92_pin_chip;
  1040			break;
  1041		default:
  1042			break;
  1043		}
  1044	
  1045		if (!priv->chip)
  1046			return -ENODEV;
  1047	
  1048		madera_pin_desc.npins = priv->chip->n_pins;
  1049	
  1050		ret = devm_pinctrl_register_and_init(&pdev->dev,
  1051						     &madera_pin_desc,
  1052						     priv,
  1053						     &priv->pctl);
  1054		if (ret) {
  1055			dev_err(priv->dev, "Failed pinctrl register (%d)\n", ret);
  1056			return ret;
  1057		}
  1058	
  1059		/* if the configuration is provided through pdata, apply it */
  1060		if (pdata->gpio_configs) {
  1061			ret = pinctrl_register_mappings(pdata->gpio_configs,
  1062							pdata->n_gpio_configs);
  1063			if (ret) {
  1064				dev_err(priv->dev,
  1065					"Failed to register pdata mappings (%d)\n",
  1066					ret);
  1067				return ret;
  1068			}
  1069		}
  1070	
  1071		ret = pinctrl_enable(priv->pctl);
  1072		if (ret) {
  1073			dev_err(priv->dev, "Failed to enable pinctrl (%d)\n", ret);
  1074			return ret;
  1075		}
  1076	
  1077		platform_set_drvdata(pdev, priv);
  1078	
  1079		dev_dbg(priv->dev, "pinctrl probed ok\n");
  1080	
  1081		return 0;
  1082	}
  1083	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
