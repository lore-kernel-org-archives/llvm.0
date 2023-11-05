Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE03FBE9;
	Sun,  5 Nov 2023 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oq6TSOXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699213243; x=1730749243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h/8YLp6rRqnMhu8CRet7KADB1QUGmWdc4qXUJ6HPPxo=;
  b=Oq6TSOXoemiAnHvDiBf0yzXOCQ6k2AIfpy064G7794pmcOr64P147w4E
   5xHseqWMp/yRnszI0i9p7jlZ1UrMm5fhu678EL//kI6GZUfLBWOjI2ww5
   XYSBAAPTFLRjcGAd7OuGgwcqw6uiAKdFj2Sxt2/m0DzknlUvY76KnyMnE
   5zxW5dZOwB74d9gAlqUPuwmxz2PvcVol4M8VejKeWj8umbDjp4z5DH3o/
   NvENJkwthsjt8Z51qlVXrA/DPydgyCH7R5KmWlYKgWd8DwEpAenkXxXn+
   IUk7JlnxysFXhFSeTtChDq6INYbmwz1pEyahuhy8JI5NB6oyh5oT4XKzo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455655749"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="455655749"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 11:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="905858774"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="905858774"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2023 11:40:32 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qziz0-0005k8-00;
	Sun, 05 Nov 2023 19:40:30 +0000
Date: Mon, 6 Nov 2023 03:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v2_20231004_robh_asoc_dt_matching_and_header_cleanups
 90/90] sound/soc/tegra/tegra210_amx.c:553:10: warning: variable 'soc_data'
 is uninitialized when used here
Message-ID: <202311060343.4TQWWtdK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20231004_robh_asoc_dt_matching_and_header_cleanups
head:   2e52f94da275deea7cf5f16b3d8fe9c43529a41d
commit: 2e52f94da275deea7cf5f16b3d8fe9c43529a41d [90/90] ASoC: Use device_get_match_data()
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311060343.4TQWWtdK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060343.4TQWWtdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060343.4TQWWtdK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/tegra/tegra210_amx.c:553:10: warning: variable 'soc_data' is uninitialized when used here [-Wuninitialized]
     553 |                                             soc_data->regmap_conf);
         |                                             ^~~~~~~~
   include/linux/regmap.h:1104:45: note: expanded from macro 'devm_regmap_init_mmio'
    1104 |         devm_regmap_init_mmio_clk(dev, NULL, regs, config)
         |                                                    ^~~~~~
   include/linux/regmap.h:1090:24: note: expanded from macro 'devm_regmap_init_mmio_clk'
    1090 |                                 dev, clk_id, regs, config)
         |                                                    ^~~~~~
   include/linux/regmap.h:735:6: note: expanded from macro '__regmap_lockdep_wrapper'
     735 |                 fn(__VA_ARGS__, &_key,                                  \
         |                    ^~~~~~~~~~~
   sound/soc/tegra/tegra210_amx.c:538:40: note: initialize the variable 'soc_data' to silence this warning
     538 |         struct tegra210_amx_soc_data *soc_data;
         |                                               ^
         |                                                = NULL
   1 warning generated.


vim +/soc_data +553 sound/soc/tegra/tegra210_amx.c

77f7df346c4533 Sameer Pujar 2021-09-13  531  
77f7df346c4533 Sameer Pujar 2021-09-13  532  static int tegra210_amx_platform_probe(struct platform_device *pdev)
77f7df346c4533 Sameer Pujar 2021-09-13  533  {
77f7df346c4533 Sameer Pujar 2021-09-13  534  	struct device *dev = &pdev->dev;
77f7df346c4533 Sameer Pujar 2021-09-13  535  	struct tegra210_amx *amx;
77f7df346c4533 Sameer Pujar 2021-09-13  536  	void __iomem *regs;
77f7df346c4533 Sameer Pujar 2021-09-13  537  	int err;
77f7df346c4533 Sameer Pujar 2021-09-13  538  	struct tegra210_amx_soc_data *soc_data;
77f7df346c4533 Sameer Pujar 2021-09-13  539  
77f7df346c4533 Sameer Pujar 2021-09-13  540  	amx = devm_kzalloc(dev, sizeof(*amx), GFP_KERNEL);
77f7df346c4533 Sameer Pujar 2021-09-13  541  	if (!amx)
77f7df346c4533 Sameer Pujar 2021-09-13  542  		return -ENOMEM;
77f7df346c4533 Sameer Pujar 2021-09-13  543  
2e52f94da275de Rob Herring  2023-10-04  544  	amx->soc_data = device_get_match_data(dev);
77f7df346c4533 Sameer Pujar 2021-09-13  545  
77f7df346c4533 Sameer Pujar 2021-09-13  546  	dev_set_drvdata(dev, amx);
77f7df346c4533 Sameer Pujar 2021-09-13  547  
77f7df346c4533 Sameer Pujar 2021-09-13  548  	regs = devm_platform_ioremap_resource(pdev, 0);
77f7df346c4533 Sameer Pujar 2021-09-13  549  	if (IS_ERR(regs))
77f7df346c4533 Sameer Pujar 2021-09-13  550  		return PTR_ERR(regs);
77f7df346c4533 Sameer Pujar 2021-09-13  551  
77f7df346c4533 Sameer Pujar 2021-09-13  552  	amx->regmap = devm_regmap_init_mmio(dev, regs,
77f7df346c4533 Sameer Pujar 2021-09-13 @553  					    soc_data->regmap_conf);
77f7df346c4533 Sameer Pujar 2021-09-13  554  	if (IS_ERR(amx->regmap)) {
77f7df346c4533 Sameer Pujar 2021-09-13  555  		dev_err(dev, "regmap init failed\n");
77f7df346c4533 Sameer Pujar 2021-09-13  556  		return PTR_ERR(amx->regmap);
77f7df346c4533 Sameer Pujar 2021-09-13  557  	}
77f7df346c4533 Sameer Pujar 2021-09-13  558  
77f7df346c4533 Sameer Pujar 2021-09-13  559  	regcache_cache_only(amx->regmap, true);
77f7df346c4533 Sameer Pujar 2021-09-13  560  
77f7df346c4533 Sameer Pujar 2021-09-13  561  	err = devm_snd_soc_register_component(dev, &tegra210_amx_cmpnt,
77f7df346c4533 Sameer Pujar 2021-09-13  562  					      tegra210_amx_dais,
77f7df346c4533 Sameer Pujar 2021-09-13  563  					      ARRAY_SIZE(tegra210_amx_dais));
77f7df346c4533 Sameer Pujar 2021-09-13  564  	if (err) {
77f7df346c4533 Sameer Pujar 2021-09-13  565  		dev_err(dev, "can't register AMX component, err: %d\n", err);
77f7df346c4533 Sameer Pujar 2021-09-13  566  		return err;
77f7df346c4533 Sameer Pujar 2021-09-13  567  	}
77f7df346c4533 Sameer Pujar 2021-09-13  568  
77f7df346c4533 Sameer Pujar 2021-09-13  569  	pm_runtime_enable(dev);
77f7df346c4533 Sameer Pujar 2021-09-13  570  
77f7df346c4533 Sameer Pujar 2021-09-13  571  	return 0;
77f7df346c4533 Sameer Pujar 2021-09-13  572  }
77f7df346c4533 Sameer Pujar 2021-09-13  573  

:::::: The code at line 553 was first introduced by commit
:::::: 77f7df346c4533b91d0dcc2b549eb7c98abd198b ASoC: tegra: Add Tegra210 based AMX driver

:::::: TO: Sameer Pujar <spujar@nvidia.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
