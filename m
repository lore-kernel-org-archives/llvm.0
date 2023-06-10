Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D30C8F6;
	Sat, 10 Jun 2023 19:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686427193; x=1717963193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QKOWCGEoa972HN3iA6PIqdQTKvbJztADf+gzH0/HCC0=;
  b=Ohg75RBaPRKdh9SJ1C/CHGoinSSR8j3BpQjppyed+lKzNVfVXaW6i7CW
   dsNU8TlZzA5ceBH3AoK309E+UgrYYhtfDY98VLgrJkCplkk4FsNYflj4u
   4+LSgYaVzKMfIXc1A1mqqQ9++FPBS43S/qFRKDoBkhtjgmsCLL5cQ7onF
   N1r21Dak/8dMDAs/IQp6IlfB68/ztk66oZ1cqAQ3SFbEAdUXMv4/rgFD0
   gKMZ5ZIM8Rg0qLA/w/gyCuObZAKVD26/ehBIXHXRrF+hSvMvZVUHNFSv6
   rngx71h5A7VgPznkxncWW3l8VSEq4jyjhn38sseIxijPghH3L3yxJZ3uX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="386180096"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="386180096"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 12:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="710726460"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="710726460"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Jun 2023 12:59:51 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q84kY-000AOi-1O;
	Sat, 10 Jun 2023 19:59:50 +0000
Date: Sun, 11 Jun 2023 03:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 18/20]
 drivers/pinctrl/pinctrl-at91.c:1305:3: error: implicit declaration of
 function 'of_match_device' is invalid in C99
Message-ID: <202306110304.OYntC6OK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
commit: e5f3e4857d32954dded294a3536c0d97dd345921 [18/20] Use of_device_get_match_data
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230611/202306110304.OYntC6OK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=e5f3e4857d32954dded294a3536c0d97dd345921
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout e5f3e4857d32954dded294a3536c0d97dd345921
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/ata/ drivers/clk/sunxi-ng/ drivers/crypto/stm32/ drivers/gpu/drm/bridge/ drivers/gpu/drm/sti/ drivers/interconnect/qcom/ drivers/memory/tegra/ drivers/mfd/ drivers/pinctrl/ drivers/power/reset/ drivers/remoteproc/ drivers/reset/sti/ drivers/soc/tegra/fuse/ drivers/spi/ drivers/watchdog/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110304.OYntC6OK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-at91.c:1305:3: error: implicit declaration of function 'of_match_device' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
                   ^
   drivers/pinctrl/pinctrl-at91.c:1305:3: note: did you mean 'of_match_node'?
   include/linux/of.h:371:35: note: 'of_match_node' declared here
   extern const struct of_device_id *of_match_node(
                                     ^
>> drivers/pinctrl/pinctrl-at91.c:1305:55: error: member reference type 'int' is not a pointer
                   of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   2 errors generated.
--
>> drivers/remoteproc/st_remoteproc.c:358:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!ddata->config)
               ^~~~~~~~~~~~~~
   drivers/remoteproc/st_remoteproc.c:443:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/remoteproc/st_remoteproc.c:358:2: note: remove the 'if' if its condition is always false
           if (!ddata->config)
           ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/st_remoteproc.c:349:9: note: initialize the variable 'ret' to silence this warning
           int ret, i;
                  ^
                   = 0
   1 warning generated.
--
>> drivers/watchdog/orion_wdt.c:570:13: error: incompatible pointer types assigning to 'const struct orion_watchdog_data *' from 'const struct of_device_id *' [-Werror,-Wincompatible-pointer-types]
                   dev->data = &orion_wdt_of_match_table[0];
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/clk/sunxi-ng/ccu-sun6i-rtc.c:327:34: warning: unused variable 'sun6i_rtc_ccu_match' [-Wunused-const-variable]
   static const struct of_device_id sun6i_rtc_ccu_match[] = {
                                    ^
   1 warning generated.
--
>> drivers/reset/sti/reset-syscfg.c:205:47: error: use of undeclared identifier 'match'
           return syscfg_reset_controller_register(dev, match->data);
                                                        ^
   1 error generated.
--
>> drivers/pinctrl/mvebu/pinctrl-armada-xp.c:572:7: error: use of undeclared identifier 'match'
           if (!match)
                ^
   1 error generated.
--
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1029:14: error: implicit declaration of function 'of_find_device_by_node' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           gpio_pdev = of_find_device_by_node(np);
                       ^
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1029:12: warning: incompatible integer to pointer conversion assigning to 'struct platform_device *' from 'int' [-Wint-conversion]
           gpio_pdev = of_find_device_by_node(np);
                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/of_match_device +1305 drivers/pinctrl/pinctrl-at91.c

  1289	
  1290	static int at91_pinctrl_probe_dt(struct platform_device *pdev,
  1291					 struct at91_pinctrl *info)
  1292	{
  1293		struct device *dev = &pdev->dev;
  1294		int ret = 0;
  1295		int i, j, ngpio_chips_enabled = 0;
  1296		uint32_t *tmp;
  1297		struct device_node *np = dev->of_node;
  1298		struct device_node *child;
  1299	
  1300		if (!np)
  1301			return -ENODEV;
  1302	
  1303		info->dev = &pdev->dev;
  1304		info->ops = (const struct at91_pinctrl_mux_ops *)
> 1305			of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
  1306		at91_pinctrl_child_count(info, np);
  1307	
  1308		/*
  1309		 * We need all the GPIO drivers to probe FIRST, or we will not be able
  1310		 * to obtain references to the struct gpio_chip * for them, and we
  1311		 * need this to proceed.
  1312		 */
  1313		for (i = 0; i < MAX_GPIO_BANKS; i++)
  1314			if (gpio_chips[i])
  1315				ngpio_chips_enabled++;
  1316	
  1317		if (ngpio_chips_enabled < info->nactive_banks)
  1318			return -EPROBE_DEFER;
  1319	
  1320		ret = at91_pinctrl_mux_mask(info, np);
  1321		if (ret)
  1322			return ret;
  1323	
  1324		dev_dbg(dev, "nmux = %d\n", info->nmux);
  1325	
  1326		dev_dbg(dev, "mux-mask\n");
  1327		tmp = info->mux_mask;
  1328		for (i = 0; i < gpio_banks; i++) {
  1329			for (j = 0; j < info->nmux; j++, tmp++) {
  1330				dev_dbg(dev, "%d:%d\t0x%x\n", i, j, tmp[0]);
  1331			}
  1332		}
  1333	
  1334		dev_dbg(dev, "nfunctions = %d\n", info->nfunctions);
  1335		dev_dbg(dev, "ngroups = %d\n", info->ngroups);
  1336		info->functions = devm_kcalloc(dev, info->nfunctions, sizeof(*info->functions),
  1337					       GFP_KERNEL);
  1338		if (!info->functions)
  1339			return -ENOMEM;
  1340	
  1341		info->groups = devm_kcalloc(dev, info->ngroups, sizeof(*info->groups),
  1342					    GFP_KERNEL);
  1343		if (!info->groups)
  1344			return -ENOMEM;
  1345	
  1346		dev_dbg(dev, "nbanks = %d\n", gpio_banks);
  1347		dev_dbg(dev, "nfunctions = %d\n", info->nfunctions);
  1348		dev_dbg(dev, "ngroups = %d\n", info->ngroups);
  1349	
  1350		i = 0;
  1351	
  1352		for_each_child_of_node(np, child) {
  1353			if (of_device_is_compatible(child, gpio_compat))
  1354				continue;
  1355			ret = at91_pinctrl_parse_functions(child, info, i++);
  1356			if (ret) {
  1357				of_node_put(child);
  1358				return dev_err_probe(dev, ret, "failed to parse function\n");
  1359			}
  1360		}
  1361	
  1362		return 0;
  1363	}
  1364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
