Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D928DBB;
	Mon,  6 Nov 2023 15:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nH91AmmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699283265; x=1730819265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HBna61a+8rIfPlKVfjaxNnwqpA7hlHdDJ4XgsD9bOdI=;
  b=nH91AmmSQhmXDX6xx7m4SlzMG1klF2VsDvqkBKgPF/iyytknP9+JgaYP
   3dCqw6URd0sfwsMnAHesNU6MOVViodXhR3CJ6NzyTLvnCaBTyYOWLogbS
   8AD3SDKmKNv+SeEivZgw33pcUMWT9Cy9Z6hA3HEtGKOaDReHdHzA/1dBT
   C0CqVOw9Jnm2b56G0GBGPjNt9PAmIC3/KNpUwG8bktHvWW7iXN7CMDzXt
   DzjhBId0jxR5rEe2e4cVEiCjE3xfhEkd8J+m9+o1jJoMB59TNqrWwAuJl
   OTQH+QUoiP6qPD1vxyVnXfOmb3f8CKmTk6kLuloUiQ5qPo7sJ3PA8dltl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="388172682"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="388172682"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 07:06:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="1093805687"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="1093805687"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Nov 2023 07:06:40 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r01BV-0006Um-2K;
	Mon, 06 Nov 2023 15:06:37 +0000
Date: Mon, 6 Nov 2023 23:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Artur Weber <aweber.kernel@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 5/6] regulator: bcm590xx: Add support for BCM59054
Message-ID: <202311062220.2gWiPqvR-lkp@intel.com>
References: <20231030-bcm59054-v1-5-3517f980c1e3@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030-bcm59054-v1-5-3517f980c1e3@gmail.com>

Hi Artur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1]

url:    https://github.com/intel-lab-lkp/linux/commits/Artur-Weber/dt-bindings-mfd-brcm-bcm59056-Convert-to-YAML/20231031-040046
base:   05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
patch link:    https://lore.kernel.org/r/20231030-bcm59054-v1-5-3517f980c1e3%40gmail.com
patch subject: [PATCH 5/6] regulator: bcm590xx: Add support for BCM59054
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311062220.2gWiPqvR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311062220.2gWiPqvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311062220.2gWiPqvR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/bcm590xx-regulator.c:591:13: warning: variable 'n_regulators' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     591 |         } else if (pmu->mfd->device_type == BCM59056_TYPE) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/bcm590xx-regulator.c:597:6: note: uninitialized use occurs here
     597 |                                  n_regulators,
         |                                  ^~~~~~~~~~~~
   drivers/regulator/bcm590xx-regulator.c:591:9: note: remove the 'if' if its condition is always true
     591 |         } else if (pmu->mfd->device_type == BCM59056_TYPE) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/bcm590xx-regulator.c:577:18: note: initialize the variable 'n_regulators' to silence this warning
     577 |         int n_regulators;
         |                         ^
         |                          = 0
   1 warning generated.


vim +591 drivers/regulator/bcm590xx-regulator.c

   569	
   570	static int bcm590xx_probe(struct platform_device *pdev)
   571	{
   572		struct bcm590xx *bcm590xx = dev_get_drvdata(pdev->dev.parent);
   573		struct bcm590xx_reg *pmu;
   574		struct regulator_config config = { };
   575		struct bcm590xx_info *info;
   576		struct regulator_dev *rdev;
   577		int n_regulators;
   578		int i;
   579	
   580		pmu = devm_kzalloc(&pdev->dev, sizeof(*pmu), GFP_KERNEL);
   581		if (!pmu)
   582			return -ENOMEM;
   583	
   584		pmu->mfd = bcm590xx;
   585	
   586		platform_set_drvdata(pdev, pmu);
   587	
   588		if (pmu->mfd->device_type == BCM59054_TYPE) {
   589			info = bcm59054_regs;
   590			n_regulators = BCM59054_NUM_REGS;
 > 591		} else if (pmu->mfd->device_type == BCM59056_TYPE) {
   592			info = bcm59056_regs;
   593			n_regulators = BCM59056_NUM_REGS;
   594		}
   595	
   596		pmu->desc = devm_kcalloc(&pdev->dev,
   597					 n_regulators,
   598					 sizeof(struct regulator_desc),
   599					 GFP_KERNEL);
   600		if (!pmu->desc)
   601			return -ENOMEM;
   602	
   603		/* Register the regulators */
   604		for (i = 0; i < n_regulators; i++, info++) {
   605			pmu->desc[i].name = info->name;
   606			pmu->desc[i].of_match = of_match_ptr(info->name);
   607			pmu->desc[i].regulators_node = of_match_ptr("regulators");
   608			pmu->desc[i].supply_name = info->vin_name;
   609			pmu->desc[i].id = i;
   610			pmu->desc[i].volt_table = info->volt_table;
   611			pmu->desc[i].n_voltages = info->n_voltages;
   612			pmu->desc[i].linear_ranges = info->linear_ranges;
   613			pmu->desc[i].n_linear_ranges = info->n_linear_ranges;
   614	
   615			if (bcm590xx_reg_is_ldo(pmu, i) || \
   616					bcm590xx_reg_is_gpldo(pmu, i)) {
   617				pmu->desc[i].ops = &bcm590xx_ops_ldo;
   618				pmu->desc[i].vsel_mask = BCM590XX_LDO_VSEL_MASK;
   619			} else if (bcm590xx_reg_is_static(pmu, i)) {
   620				pmu->desc[i].ops = &bcm590xx_ops_static;
   621			} else {
   622				pmu->desc[i].ops = &bcm590xx_ops_dcdc;
   623				pmu->desc[i].vsel_mask = BCM590XX_SR_VSEL_MASK;
   624			}
   625	
   626			if (bcm590xx_reg_is_vbus(pmu, i)) {
   627				pmu->desc[i].enable_mask = BCM590XX_VBUS_ENABLE;
   628			} else {
   629				pmu->desc[i].vsel_reg = \
   630					bcm590xx_get_vsel_register(pmu, i);
   631				pmu->desc[i].enable_mask = \
   632					bcm590xx_get_enable_mask(pmu, i);
   633				pmu->desc[i].enable_is_inverted = true;
   634			}
   635			pmu->desc[i].enable_reg = \
   636				bcm590xx_get_enable_register(pmu, i);
   637			pmu->desc[i].type = REGULATOR_VOLTAGE;
   638			pmu->desc[i].owner = THIS_MODULE;
   639	
   640			config.dev = pmu->mfd->dev;
   641			config.driver_data = pmu;
   642			if (bcm590xx_reg_is_secondary(pmu, i))
   643				config.regmap = pmu->mfd->regmap_sec;
   644			else
   645				config.regmap = pmu->mfd->regmap_pri;
   646	
   647			rdev = devm_regulator_register(&pdev->dev, &pmu->desc[i],
   648						       &config);
   649			if (IS_ERR(rdev)) {
   650				dev_err(bcm590xx->dev,
   651					"failed to register %s regulator\n",
   652					pdev->name);
   653				return PTR_ERR(rdev);
   654			}
   655		}
   656	
   657		return 0;
   658	}
   659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
