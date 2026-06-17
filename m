Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60611A6803;
	Wed, 17 Jun 2026 23:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781740455; cv=none; b=SklAbiPssYEE0+T3g17JzLNaaK1Ut/sc8fsWsRPa+sSfYBz+rwuAb0ZhO17mjQJIRtPYzSz3G2CLn9VmUFw6fSRa45/Y+H+loNMiTrN3pVPpzJT1tKUhtyZC3u++C9bLpgFFSqV6EVHG9iupe4f0YNHB22oEnRrRkOHf5p/xXe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781740455; c=relaxed/simple;
	bh=ssdTUmGDuNFtWQKnhMR6My2aGMbLPHPkSgmhYLzqwTA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CNCHMQkqZdHG2QeT5zwvzMFfuYPX6fZH0ATPwtngOvFe8TcY2o29yt6Uv2kvnPuPrpBCn3gjdUa5tJwiv6tFHRBcidM+q4AMYKrH+PTOg9kuW3Cf8b1FY7i21Pmu9LQp2MV5y1DrKGuV4mmrvB3XBIFIf5j0/FP/2giceI3fR08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8BCGSJd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8BCGSJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781740453; x=1813276453;
  h=date:from:to:cc:subject:message-id;
  bh=ssdTUmGDuNFtWQKnhMR6My2aGMbLPHPkSgmhYLzqwTA=;
  b=E8BCGSJdZFqslbD47rdKKSbNXbjhUr1uRKUzlVq2/1wC3NwFOUzWl/ro
   TVt1uaFpOS7H8+nCFYEW2d2zLUwoY6wuzWbkXEvM23zZoZK1s7nS2vG4w
   +MS+fSTfNYdPyKJGm/5UvpWI9TYF5MAy/NQ/NbM3rZB7mskbXBTNgrjHu
   q2/Sr1SMHXc5xNlNkTFbVDz9LYkiw4bBk1vKKk2Bxf62U+P6MfJ3bd5RJ
   pI6iauBprAc5z5d53a+I0DBm0UDiQLIM63bf0A7zGyIx0oidxKH5JIioJ
   RjFWnEdpBYIb2BJ3jm+mdEIC6Ub7c8wO4eTrvVtHSHejVAFoMtMFaLTwx
   g==;
X-CSE-ConnectionGUID: 6RlgM3BmTIOfUMjo/zrKlg==
X-CSE-MsgGUID: CKIP8MkNS3O9QU/C1Cu62A==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81675121"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="81675121"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 16:54:12 -0700
X-CSE-ConnectionGUID: tI6pyKXFQJGvF39cO7ru3Q==
X-CSE-MsgGUID: PklomwYJQoK2EihFk7LhPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="253311647"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jun 2026 16:54:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa05A-00000000V2O-1awV;
	Wed, 17 Jun 2026 23:54:08 +0000
Date: Thu, 18 Jun 2026 07:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 sound/soc/intel/boards/bytcht_da7213.c:269:12: error: call to undeclared
 function 'snd_soc_fixup_dai_links_platform_name'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202606180734.IcRR79nF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: 347e73ad9dec0dbc10c4c7b5678981c7bf4cb422 [326/326] ASoC: soc.h: remove compatible definition
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260618/202606180734.IcRR79nF-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180734.IcRR79nF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180734.IcRR79nF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/boards/bytcht_da7213.c:269:12: error: call to undeclared function 'snd_soc_fixup_dai_links_platform_name'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     269 |         ret_val = snd_soc_fixup_dai_links_platform_name(card, platform_name);
         |                   ^
   sound/soc/intel/boards/bytcht_da7213.c:269:12: note: did you mean 'snd_soc_card_fixup_dai_links_platform_name'?
   include/sound/soc-card.h:285:5: note: 'snd_soc_card_fixup_dai_links_platform_name' declared here
     285 | int snd_soc_card_fixup_dai_links_platform_name(struct snd_soc_card *card, const char *platform_name);
         |     ^
   1 error generated.


vim +/snd_soc_fixup_dai_links_platform_name +269 sound/soc/intel/boards/bytcht_da7213.c

82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  230  
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  231  static int bytcht_da7213_probe(struct platform_device *pdev)
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  232  {
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  233  	struct snd_soc_card *card;
7feb2f786a46d3 Pierre-Louis Bossart  2017-10-12  234  	struct snd_soc_acpi_mach *mach;
686338c12a2bd2 Pierre-Louis Bossart  2019-01-25  235  	const char *platform_name;
1b55f1c6fd64ef Andy Shevchenko       2019-03-28  236  	struct acpi_device *adev;
41656c3dc2acfe Pierre-Louis Bossart  2020-11-12  237  	bool sof_parent;
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  238  	int dai_index = 0;
22a317a0505d11 Pierre-Louis Bossart  2017-10-12  239  	int ret_val = 0;
22a317a0505d11 Pierre-Louis Bossart  2017-10-12  240  	int i;
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  241  
42432196cfb015 Guennadi Liakhovetski 2020-03-12  242  	mach = pdev->dev.platform_data;
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  243  
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  244  	/* fix index of codec dai */
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  245  	for (i = 0; i < ARRAY_SIZE(dailink); i++) {
0cc65482f5b03a Hans de Goede         2024-08-23  246  		if (dailink[i].num_codecs &&
7d99a70b659511 Hans de Goede         2024-02-10  247  		    !strcmp(dailink[i].codecs->name, "i2c-DLGS7213:00")) {
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  248  			dai_index = i;
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  249  			break;
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  250  		}
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  251  	}
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  252  
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  253  	/* fixup codec name based on HID */
1b55f1c6fd64ef Andy Shevchenko       2019-03-28  254  	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
1b55f1c6fd64ef Andy Shevchenko       2019-03-28  255  	if (adev) {
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  256  		snprintf(codec_name, sizeof(codec_name),
1b55f1c6fd64ef Andy Shevchenko       2019-03-28  257  			 "i2c-%s", acpi_dev_name(adev));
fb1d4861f28e75 Kuninori Morimoto     2019-06-06  258  		dailink[dai_index].codecs->name = codec_name;
14e91ddd5c02d8 Pierre-Louis Bossart  2024-08-27  259  	} else {
14e91ddd5c02d8 Pierre-Louis Bossart  2024-08-27  260  		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
14e91ddd5c02d8 Pierre-Louis Bossart  2024-08-27  261  		return -ENOENT;
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  262  	}
14e91ddd5c02d8 Pierre-Louis Bossart  2024-08-27  263  
4afda6de022857 Andy Shevchenko       2023-01-02  264  	acpi_dev_put(adev);
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  265  
f1eebb3bf707b2 Pierre-Louis Bossart  2022-03-01  266  	/* override platform name, if required */
686338c12a2bd2 Pierre-Louis Bossart  2019-01-25  267  	platform_name = mach->mach_params.platform;
686338c12a2bd2 Pierre-Louis Bossart  2019-01-25  268  
686338c12a2bd2 Pierre-Louis Bossart  2019-01-25 @269  	ret_val = snd_soc_fixup_dai_links_platform_name(card, platform_name);
686338c12a2bd2 Pierre-Louis Bossart  2019-01-25  270  	if (ret_val)
686338c12a2bd2 Pierre-Louis Bossart  2019-01-25  271  		return ret_val;
686338c12a2bd2 Pierre-Louis Bossart  2019-01-25  272  
41656c3dc2acfe Pierre-Louis Bossart  2020-11-12  273  	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
41656c3dc2acfe Pierre-Louis Bossart  2020-11-12  274  
41656c3dc2acfe Pierre-Louis Bossart  2020-11-12  275  	/* set card and driver name */
41656c3dc2acfe Pierre-Louis Bossart  2020-11-12  276  	if (sof_parent) {
ba5d4e9678ecc3 Kuninori Morimoto     2026-04-21  277  		bytcht_da7213_card_driver.name = SOF_CARD_NAME;
ba5d4e9678ecc3 Kuninori Morimoto     2026-04-21  278  		bytcht_da7213_card_driver.driver_name = SOF_DRIVER_NAME;
41656c3dc2acfe Pierre-Louis Bossart  2020-11-12  279  	} else {
ba5d4e9678ecc3 Kuninori Morimoto     2026-04-21  280  		bytcht_da7213_card_driver.name = CARD_NAME;
ba5d4e9678ecc3 Kuninori Morimoto     2026-04-21  281  		bytcht_da7213_card_driver.driver_name = DRIVER_NAME;
41656c3dc2acfe Pierre-Louis Bossart  2020-11-12  282  	}
41656c3dc2acfe Pierre-Louis Bossart  2020-11-12  283  
05ff312badb607 Pierre-Louis Bossart  2020-11-12  284  	/* set pm ops */
05ff312badb607 Pierre-Louis Bossart  2020-11-12  285  	if (sof_parent)
05ff312badb607 Pierre-Louis Bossart  2020-11-12  286  		pdev->dev.driver->pm = &snd_soc_pm_ops;
05ff312badb607 Pierre-Louis Bossart  2020-11-12  287  
ba5d4e9678ecc3 Kuninori Morimoto     2026-04-21  288  	card = devm_snd_soc_card_register(&pdev->dev, &bytcht_da7213_card_driver);
ba5d4e9678ecc3 Kuninori Morimoto     2026-04-21  289  	if (!card) {
ba5d4e9678ecc3 Kuninori Morimoto     2026-04-21  290  		ret_val = -ENOMEM;
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  291  		dev_err(&pdev->dev,
ba5d4e9678ecc3 Kuninori Morimoto     2026-04-21  292  			"snd_soc_card_register() failed %d\n", ret_val);
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  293  		return ret_val;
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  294  	}
ba5d4e9678ecc3 Kuninori Morimoto     2026-04-21  295  
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  296  	return ret_val;
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  297  }
82cf89de2c9c2e Pierre-Louis Bossart  2017-03-09  298  

:::::: The code at line 269 was first introduced by commit
:::::: 686338c12a2bd2d27f8444901fb9ce1a4c0c0b58 ASoC: Intel: bytcht_da7213: platform name fixup support

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
