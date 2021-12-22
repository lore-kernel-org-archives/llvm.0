Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4252C9C
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 22:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640213766; x=1671749766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LkBw4QbNXDCUaGnmg55jVevR6CQbPsx82fk9PuFtxGA=;
  b=A64hUy/5yYrA3C+VJ0+dzu7JKfW0Sn9h7JszTQRoH3WeJLHB6qVmxIzQ
   1/BAhTGrJvcPwMqTxmJNI3szuiVL/N6l4fSSGrHJrpUCBZRVH9l9nzj7L
   zo3LrRhHGRMtsqzHaJX+heIANv8oDaDbhPxtQOjOr8a7t2GTA/vYFnH91
   mL/RLKLp9Le02yqgbiLCpNZ153zE5B22j9OL3IKx7EXf4CfLS4rxpU2tS
   0fQspWLsB+yddfT/+d5EotCaOUExwC0Nz3ZcpjcjTxIJ3ywH0a8Kn8llT
   kO9XFVTdF7z0XTe9gP6SyW8uW02gy7E3cFnr28J92K4AZsW0zi0BLAAOY
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240525050"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="240525050"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 14:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="617291931"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Dec 2021 14:56:04 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n0AWh-00012I-IT; Wed, 22 Dec 2021 22:56:03 +0000
Date: Thu, 23 Dec 2021 06:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: drivers/pinctrl/bcm/pinctrl-ns.c:286:10: error: passing 'const char
 *const *const' to parameter of type 'const char **' discards qualifiers
Message-ID: <202112230616.y4Aa2Lyi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20211222-144502/Rafa-Mi-ecki/pinctrl-bcm-ns-use-generic-groups-functions-helpers/20211117-064419
head:   da7c70cdea1466b4234a30658ee2b5383545a629
commit: da7c70cdea1466b4234a30658ee2b5383545a629 pinctrl: bcm: ns: use generic groups & functions helpers
date:   16 hours ago
config: riscv-randconfig-r042-20211222 (https://download.01.org/0day-ci/archive/20211223/202112230616.y4Aa2Lyi-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project de4e0195ae1c39f1c3b07834b8e32c113f4f20eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/da7c70cdea1466b4234a30658ee2b5383545a629
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review UPDATE-20211222-144502/Rafa-Mi-ecki/pinctrl-bcm-ns-use-generic-groups-functions-helpers/20211117-064419
        git checkout da7c70cdea1466b4234a30658ee2b5383545a629
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/bcm/pinctrl-ns.c:286:10: error: passing 'const char *const *const' to parameter of type 'const char **' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                                               function->groups,
                                               ^~~~~~~~~~~~~~~~
   drivers/pinctrl/bcm/../pinmux.h:153:18: note: passing argument to parameter 'groups' here
                                   const char **groups,
                                                ^
   1 error generated.


vim +286 drivers/pinctrl/bcm/pinctrl-ns.c

   207	
   208	static int ns_pinctrl_probe(struct platform_device *pdev)
   209	{
   210		struct device *dev = &pdev->dev;
   211		const struct of_device_id *of_id;
   212		struct ns_pinctrl *ns_pinctrl;
   213		struct pinctrl_desc *pctldesc;
   214		struct pinctrl_pin_desc *pin;
   215		struct resource *res;
   216		int i;
   217	
   218		ns_pinctrl = devm_kzalloc(dev, sizeof(*ns_pinctrl), GFP_KERNEL);
   219		if (!ns_pinctrl)
   220			return -ENOMEM;
   221		pctldesc = &ns_pinctrl->pctldesc;
   222		platform_set_drvdata(pdev, ns_pinctrl);
   223	
   224		/* Set basic properties */
   225	
   226		ns_pinctrl->dev = dev;
   227	
   228		of_id = of_match_device(ns_pinctrl_of_match_table, dev);
   229		if (!of_id)
   230			return -EINVAL;
   231		ns_pinctrl->chipset_flag = (uintptr_t)of_id->data;
   232	
   233		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
   234						   "cru_gpio_control");
   235		ns_pinctrl->base = devm_ioremap_resource(dev, res);
   236		if (IS_ERR(ns_pinctrl->base)) {
   237			dev_err(dev, "Failed to map pinctrl regs\n");
   238			return PTR_ERR(ns_pinctrl->base);
   239		}
   240	
   241		memcpy(pctldesc, &ns_pinctrl_desc, sizeof(*pctldesc));
   242	
   243		/* Set pinctrl properties */
   244	
   245		pctldesc->pins = devm_kcalloc(dev, ARRAY_SIZE(ns_pinctrl_pins),
   246					      sizeof(struct pinctrl_pin_desc),
   247					      GFP_KERNEL);
   248		if (!pctldesc->pins)
   249			return -ENOMEM;
   250		for (i = 0, pin = (struct pinctrl_pin_desc *)&pctldesc->pins[0];
   251		     i < ARRAY_SIZE(ns_pinctrl_pins); i++) {
   252			const struct pinctrl_pin_desc *src = &ns_pinctrl_pins[i];
   253			unsigned int chipsets = (uintptr_t)src->drv_data;
   254	
   255			if (chipsets & ns_pinctrl->chipset_flag) {
   256				memcpy(pin++, src, sizeof(*src));
   257				pctldesc->npins++;
   258			}
   259		}
   260	
   261		/* Register */
   262	
   263		ns_pinctrl->pctldev = devm_pinctrl_register(dev, pctldesc, ns_pinctrl);
   264		if (IS_ERR(ns_pinctrl->pctldev)) {
   265			dev_err(dev, "Failed to register pinctrl\n");
   266			return PTR_ERR(ns_pinctrl->pctldev);
   267		}
   268	
   269		for (i = 0; i < ARRAY_SIZE(ns_pinctrl_groups); i++) {
   270			const struct ns_pinctrl_group *group = &ns_pinctrl_groups[i];
   271	
   272			if (!(group->chipsets & ns_pinctrl->chipset_flag))
   273				continue;
   274	
   275			pinctrl_generic_add_group(ns_pinctrl->pctldev, group->name,
   276						  group->pins, group->num_pins, NULL);
   277		}
   278	
   279		for (i = 0; i < ARRAY_SIZE(ns_pinctrl_functions); i++) {
   280			const struct ns_pinctrl_function *function = &ns_pinctrl_functions[i];
   281	
   282			if (!(function->chipsets & ns_pinctrl->chipset_flag))
   283				continue;
   284	
   285			pinmux_generic_add_function(ns_pinctrl->pctldev, function->name,
 > 286						    function->groups,
   287						    function->num_groups, NULL);
   288		}
   289	
   290		return 0;
   291	}
   292	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
