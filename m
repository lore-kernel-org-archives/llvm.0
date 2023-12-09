Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A05C7FB;
	Sat,  9 Dec 2023 01:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M04chDNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702084446; x=1733620446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NsLpFwcT8MwS64fgfplcbqNqxvFf0axNEmlI/lV6h+U=;
  b=M04chDNf3g0NQTseVeGvuUXe3VAPN5JKRu8+lcMeSsSjpJeSdPwqxViu
   erb6SWBpKnpQKK7PiEG5d59AWeIz3abge/+xjsSbIKJCMGLg32A/z5P1l
   wZvl3aZ8VuxuCGnp0aMGcFmUWxkUY4TcC17ublmr2QIKR/QICEz3lVpWM
   WSNZv4APbwEUaxVg63XoE0mE0Yjip0O1EKkcR7jgRDbhSVuuaZ7pau16O
   QKcuzCu1OJyiykmpkRjUVDH56PLzNr6N4i6NBxsxGGIEizFsadbUoExYC
   EsDFKO8S98qbSLaHJBUUHeiFl6pv6op9sVOCcuVLjpDrx/dmmVForz8ep
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="458802893"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="458802893"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 17:13:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="20289034"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 08 Dec 2023 17:13:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBluV-000Ed1-2U;
	Sat, 09 Dec 2023 01:13:39 +0000
Date: Sat, 9 Dec 2023 09:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [broonie-ci:20231208_linus_walleij_gpio_descriptor_cleanup_for_some_wolfson_codecs
 2/5] sound/soc/codecs/wm1250-ev1.c:168:9: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202312090953.DiUo3mue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20231208_linus_walleij_gpio_descriptor_cleanup_for_some_wolfson_codecs
head:   729f02ec02ae12e5d8a53171bd37e9de56f33677
commit: 10a366f36e2a2e240d9db6da90e501fa16655282 [2/5] ASoC: wm1250-ev1: Convert to GPIO descriptors
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231209/202312090953.DiUo3mue-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312090953.DiUo3mue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090953.DiUo3mue-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/wm1250-ev1.c:168:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     168 |         return ret;
         |                ^~~
   sound/soc/codecs/wm1250-ev1.c:132:9: note: initialize the variable 'ret' to silence this warning
     132 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +168 sound/soc/codecs/wm1250-ev1.c

4bb3f43c6e3f3f Mark Brown     2011-04-08  127  
7a79e94e973639 Bill Pemberton 2012-12-07  128  static int wm1250_ev1_pdata(struct i2c_client *i2c)
213eb0fb1e8e4d Mark Brown     2011-09-21  129  {
213eb0fb1e8e4d Mark Brown     2011-09-21  130  	struct wm1250_ev1_pdata *pdata = dev_get_platdata(&i2c->dev);
213eb0fb1e8e4d Mark Brown     2011-09-21  131  	struct wm1250_priv *wm1250;
10a366f36e2a2e Linus Walleij  2023-12-08  132  	int ret;
213eb0fb1e8e4d Mark Brown     2011-09-21  133  
213eb0fb1e8e4d Mark Brown     2011-09-21  134  	if (!pdata)
213eb0fb1e8e4d Mark Brown     2011-09-21  135  		return 0;
213eb0fb1e8e4d Mark Brown     2011-09-21  136  
5fe803f56ad41c Mark Brown     2011-11-27  137  	wm1250 = devm_kzalloc(&i2c->dev, sizeof(*wm1250), GFP_KERNEL);
10a366f36e2a2e Linus Walleij  2023-12-08  138  	if (!wm1250)
10a366f36e2a2e Linus Walleij  2023-12-08  139  		return -ENOMEM;
10a366f36e2a2e Linus Walleij  2023-12-08  140  
10a366f36e2a2e Linus Walleij  2023-12-08  141  	wm1250->clk_ena = devm_gpiod_get(&i2c->dev, "clk-ena", GPIOD_OUT_LOW);
10a366f36e2a2e Linus Walleij  2023-12-08  142  	if (IS_ERR(wm1250->clk_ena))
10a366f36e2a2e Linus Walleij  2023-12-08  143  		return dev_err_probe(&i2c->dev, PTR_ERR(wm1250->clk_ena),
10a366f36e2a2e Linus Walleij  2023-12-08  144  				     "failed to get clock enable GPIO\n");
10a366f36e2a2e Linus Walleij  2023-12-08  145  
10a366f36e2a2e Linus Walleij  2023-12-08  146  	wm1250->clk_sel0 = devm_gpiod_get(&i2c->dev, "clk-sel0", GPIOD_OUT_HIGH);
10a366f36e2a2e Linus Walleij  2023-12-08  147  	if (IS_ERR(wm1250->clk_sel0))
10a366f36e2a2e Linus Walleij  2023-12-08  148  		return dev_err_probe(&i2c->dev, PTR_ERR(wm1250->clk_sel0),
10a366f36e2a2e Linus Walleij  2023-12-08  149  				     "failed to get clock sel0 GPIO\n");
10a366f36e2a2e Linus Walleij  2023-12-08  150  
10a366f36e2a2e Linus Walleij  2023-12-08  151  	wm1250->clk_sel1 = devm_gpiod_get(&i2c->dev, "clk-sel1", GPIOD_OUT_HIGH);
10a366f36e2a2e Linus Walleij  2023-12-08  152  	if (IS_ERR(wm1250->clk_sel1))
10a366f36e2a2e Linus Walleij  2023-12-08  153  		return dev_err_probe(&i2c->dev, PTR_ERR(wm1250->clk_sel1),
10a366f36e2a2e Linus Walleij  2023-12-08  154  				     "failed to get clock sel1 GPIO\n");
10a366f36e2a2e Linus Walleij  2023-12-08  155  
10a366f36e2a2e Linus Walleij  2023-12-08  156  	wm1250->osr = devm_gpiod_get(&i2c->dev, "osr", GPIOD_OUT_LOW);
10a366f36e2a2e Linus Walleij  2023-12-08  157  	if (IS_ERR(wm1250->osr))
10a366f36e2a2e Linus Walleij  2023-12-08  158  		return dev_err_probe(&i2c->dev, PTR_ERR(wm1250->osr),
10a366f36e2a2e Linus Walleij  2023-12-08  159  				     "failed to get OSR GPIO\n");
10a366f36e2a2e Linus Walleij  2023-12-08  160  
10a366f36e2a2e Linus Walleij  2023-12-08  161  	wm1250->master = devm_gpiod_get(&i2c->dev, "master", GPIOD_OUT_LOW);
10a366f36e2a2e Linus Walleij  2023-12-08  162  	if (IS_ERR(wm1250->master))
10a366f36e2a2e Linus Walleij  2023-12-08  163  		return dev_err_probe(&i2c->dev, PTR_ERR(wm1250->master),
10a366f36e2a2e Linus Walleij  2023-12-08  164  				     "failed to get MASTER GPIO\n");
213eb0fb1e8e4d Mark Brown     2011-09-21  165  
213eb0fb1e8e4d Mark Brown     2011-09-21  166  	dev_set_drvdata(&i2c->dev, wm1250);
213eb0fb1e8e4d Mark Brown     2011-09-21  167  
213eb0fb1e8e4d Mark Brown     2011-09-21 @168  	return ret;
213eb0fb1e8e4d Mark Brown     2011-09-21  169  }
213eb0fb1e8e4d Mark Brown     2011-09-21  170  

:::::: The code at line 168 was first introduced by commit
:::::: 213eb0fb1e8e4ddfb8ffdb239c45ba2a1eef3dc2 ASoC: Add platform data for WM1250 EV1 GPIOs

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
