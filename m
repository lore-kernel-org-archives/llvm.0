Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FFA1F95A;
	Wed, 12 Jul 2023 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689155521; x=1720691521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vDJReieAQizikNWD/SMhAKges3UNGRwm8jNxuIQrIwI=;
  b=cQ8c1CkEjQ0Vdz5nsWGdIpa92CizrRcO7zwCXG20RwMHsXMxwwAnAEnO
   pdXeR+F3RrlHacF0LVbUSCiMx/pDkqVqfbuy38d6RNO/70LuARgf7FBPz
   GY0UAZcda6gOfLUKMSOtHb1Zh4yFGfhxKn97h5w9My+zZmmEB2kHQRIK0
   JWW1026ipGwqt2yryghKlDvbHARV7gRRaWFWtEo4IpLiAh3fj5VqMXrJ6
   2YucUWj56Ar97Lg0JoekUGd8F+F91/e3u3aQdB+OCsyopopX6ApIWvDPS
   QsGq69AiYqlfkiV8zfcgspNgLo3vPysjpNGOQkApeJbKeaKgG4hRR27VP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="364883981"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="364883981"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 02:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="1052116434"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="1052116434"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2023 02:51:50 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJWVh-0005at-0k;
	Wed, 12 Jul 2023 09:51:49 +0000
Date: Wed, 12 Jul 2023 17:51:08 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 22/94]
 drivers/clk/davinci/da8xx-cfgchip.c:750:10: error: call to undeclared
 function 'of_match_device'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202307121749.UJsG9yIn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3fabe2c33fe8811c575713da027ca6bea22d7d5b
commit: f048df4b58626a11855e74453a9d4015ce4b3fa3 [22/94] clk: Explicitly include correct DT includes
config: arm-davinci_all_defconfig (https://download.01.org/0day-ci/archive/20230712/202307121749.UJsG9yIn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121749.UJsG9yIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121749.UJsG9yIn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/davinci/da8xx-cfgchip.c:750:10: error: call to undeclared function 'of_match_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     750 |         of_id = of_match_device(da8xx_cfgchip_of_match, dev);
         |                 ^
   drivers/clk/davinci/da8xx-cfgchip.c:750:10: note: did you mean 'of_match_node'?
   include/linux/of.h:371:35: note: 'of_match_node' declared here
     371 | extern const struct of_device_id *of_match_node(
         |                                   ^
>> drivers/clk/davinci/da8xx-cfgchip.c:750:8: error: incompatible integer to pointer conversion assigning to 'const struct of_device_id *' from 'int' [-Wint-conversion]
     750 |         of_id = of_match_device(da8xx_cfgchip_of_match, dev);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/clk/davinci/pll.c:897:10: error: call to undeclared function 'of_match_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     897 |         of_id = of_match_device(davinci_pll_of_match, dev);
         |                 ^
   drivers/clk/davinci/pll.c:897:10: note: did you mean 'of_match_node'?
   include/linux/of.h:371:35: note: 'of_match_node' declared here
     371 | extern const struct of_device_id *of_match_node(
         |                                   ^
>> drivers/clk/davinci/pll.c:897:8: error: incompatible integer to pointer conversion assigning to 'const struct of_device_id *' from 'int' [-Wint-conversion]
     897 |         of_id = of_match_device(davinci_pll_of_match, dev);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/davinci/pll.c:939:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/clk/davinci/pll.c:939:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/clk/davinci/pll.c:939:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/clk/davinci/pll.c:939:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/clk/davinci/pll.c:939:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/clk/davinci/pll.c:939:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/clk/davinci/pll.c:939:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
     137 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/clk/davinci/pll.c:939:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:24: note: expanded from macro '_SIG_SET_BINOP'
     137 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
--
>> drivers/clk/davinci/psc.c:523:10: error: call to undeclared function 'of_match_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     523 |         of_id = of_match_device(davinci_psc_of_match, dev);
         |                 ^
   drivers/clk/davinci/psc.c:523:10: note: did you mean 'of_match_node'?
   include/linux/of.h:371:35: note: 'of_match_node' declared here
     371 | extern const struct of_device_id *of_match_node(
         |                                   ^
>> drivers/clk/davinci/psc.c:523:8: error: incompatible integer to pointer conversion assigning to 'const struct of_device_id *' from 'int' [-Wint-conversion]
     523 |         of_id = of_match_device(davinci_psc_of_match, dev);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PINCTRL_SINGLE
   Depends on [n]: PINCTRL [=n] && OF [=y] && HAS_IOMEM [=y]
   Selected by [y]:
   - ARCH_DAVINCI [=y] && ARCH_MULTI_V5 [=y] && CPU_LITTLE_ENDIAN [=y]


vim +/of_match_device +750 drivers/clk/davinci/da8xx-cfgchip.c

1e88a8d64f2212 David Lechner 2018-03-15  741  
1e88a8d64f2212 David Lechner 2018-03-15  742  static int da8xx_cfgchip_probe(struct platform_device *pdev)
1e88a8d64f2212 David Lechner 2018-03-15  743  {
1e88a8d64f2212 David Lechner 2018-03-15  744  	struct device *dev = &pdev->dev;
1e88a8d64f2212 David Lechner 2018-03-15  745  	struct da8xx_cfgchip_clk_platform_data *pdata = dev->platform_data;
1e88a8d64f2212 David Lechner 2018-03-15  746  	const struct of_device_id *of_id;
1e88a8d64f2212 David Lechner 2018-03-15  747  	da8xx_cfgchip_init clk_init = NULL;
1e88a8d64f2212 David Lechner 2018-03-15  748  	struct regmap *regmap = NULL;
1e88a8d64f2212 David Lechner 2018-03-15  749  
1e88a8d64f2212 David Lechner 2018-03-15 @750  	of_id = of_match_device(da8xx_cfgchip_of_match, dev);
1e88a8d64f2212 David Lechner 2018-03-15  751  	if (of_id) {
1e88a8d64f2212 David Lechner 2018-03-15  752  		struct device_node *parent;
1e88a8d64f2212 David Lechner 2018-03-15  753  
1e88a8d64f2212 David Lechner 2018-03-15  754  		clk_init = of_id->data;
1e88a8d64f2212 David Lechner 2018-03-15  755  		parent = of_get_parent(dev->of_node);
1e88a8d64f2212 David Lechner 2018-03-15  756  		regmap = syscon_node_to_regmap(parent);
1e88a8d64f2212 David Lechner 2018-03-15  757  		of_node_put(parent);
1e88a8d64f2212 David Lechner 2018-03-15  758  	} else if (pdev->id_entry && pdata) {
1e88a8d64f2212 David Lechner 2018-03-15  759  		clk_init = (void *)pdev->id_entry->driver_data;
1e88a8d64f2212 David Lechner 2018-03-15  760  		regmap = pdata->cfgchip;
1e88a8d64f2212 David Lechner 2018-03-15  761  	}
1e88a8d64f2212 David Lechner 2018-03-15  762  
1e88a8d64f2212 David Lechner 2018-03-15  763  	if (!clk_init) {
1e88a8d64f2212 David Lechner 2018-03-15  764  		dev_err(dev, "unable to find driver data\n");
1e88a8d64f2212 David Lechner 2018-03-15  765  		return -EINVAL;
1e88a8d64f2212 David Lechner 2018-03-15  766  	}
1e88a8d64f2212 David Lechner 2018-03-15  767  
1e88a8d64f2212 David Lechner 2018-03-15  768  	if (IS_ERR_OR_NULL(regmap)) {
1e88a8d64f2212 David Lechner 2018-03-15  769  		dev_err(dev, "no regmap for CFGCHIP syscon\n");
1e88a8d64f2212 David Lechner 2018-03-15  770  		return regmap ? PTR_ERR(regmap) : -ENOENT;
1e88a8d64f2212 David Lechner 2018-03-15  771  	}
1e88a8d64f2212 David Lechner 2018-03-15  772  
1e88a8d64f2212 David Lechner 2018-03-15  773  	return clk_init(dev, regmap);
1e88a8d64f2212 David Lechner 2018-03-15  774  }
1e88a8d64f2212 David Lechner 2018-03-15  775  

:::::: The code at line 750 was first introduced by commit
:::::: 1e88a8d64f221208801bb279ee7452df0b6d609f clk: davinci: New driver for TI DA8XX CFGCHIP clocks

:::::: TO: David Lechner <david@lechnology.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
