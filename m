Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67479156CA;
	Mon,  6 Nov 2023 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJ19kdNm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699264045; x=1730800045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T6rFshZG1CW8KfWnm5omhJa4XbvWrABFG0f01qNAl9s=;
  b=aJ19kdNmvrh3Va6Ug3MlzAFaywVzaMx5BQ5DEGgUrGcyWRLUBhtH1Tps
   3RsDO9Jug0zqwG2Jye8Em8iEq9hWzNRHpZT8+dgIyagesxiFvxfgDS9mk
   5cPGv+B/jhGXHWYvN/PkPv62+kQoiUQnxwE9834q8D0HCtZAWKm6ZJVfS
   +0cxw++DwwaeNiXbVKeG5bLhooe+5MRFzM6W28n4EjLnlBCN4ZwE1stwU
   tz9Bw3ZCPSu5DyMKT71Qxd6fWE4d2rfH1cWp+u1V2h5iPmHbEp2tpV+wP
   /jhZ8p41kzQfoXj7dkqDs5c8nprqw981akIdLBf/XeULcNg7FCiZ5W4II
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420355795"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="420355795"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 01:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="738756979"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="738756979"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Nov 2023 01:47:19 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzwCT-0006JE-1D;
	Mon, 06 Nov 2023 09:47:17 +0000
Date: Mon, 6 Nov 2023 17:46:18 +0800
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
Subject: Re: [PATCH 4/6] mfd: bcm590xx: Add compatible for BCM59054
Message-ID: <202311061654.4074XhbV-lkp@intel.com>
References: <20231030-bcm59054-v1-4-3517f980c1e3@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030-bcm59054-v1-4-3517f980c1e3@gmail.com>

Hi Artur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1]

url:    https://github.com/intel-lab-lkp/linux/commits/Artur-Weber/dt-bindings-mfd-brcm-bcm59056-Convert-to-YAML/20231031-040046
base:   05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
patch link:    https://lore.kernel.org/r/20231030-bcm59054-v1-4-3517f980c1e3%40gmail.com
patch subject: [PATCH 4/6] mfd: bcm590xx: Add compatible for BCM59054
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311061654.4074XhbV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061654.4074XhbV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061654.4074XhbV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/bcm590xx.c:53:26: warning: cast to smaller integer type 'unsigned int' from 'const void *' [-Wvoid-pointer-to-int-cast]
      53 |         bcm590xx->device_type = (unsigned int)of_device_get_match_data(bcm590xx->dev);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +53 drivers/mfd/bcm590xx.c

    39	
    40	static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
    41	{
    42		struct bcm590xx *bcm590xx;
    43		int ret;
    44	
    45		bcm590xx = devm_kzalloc(&i2c_pri->dev, sizeof(*bcm590xx), GFP_KERNEL);
    46		if (!bcm590xx)
    47			return -ENOMEM;
    48	
    49		i2c_set_clientdata(i2c_pri, bcm590xx);
    50		bcm590xx->dev = &i2c_pri->dev;
    51		bcm590xx->i2c_pri = i2c_pri;
    52	
  > 53		bcm590xx->device_type = (unsigned int)of_device_get_match_data(bcm590xx->dev);
    54	
    55		bcm590xx->regmap_pri = devm_regmap_init_i2c(i2c_pri,
    56							 &bcm590xx_regmap_config_pri);
    57		if (IS_ERR(bcm590xx->regmap_pri)) {
    58			ret = PTR_ERR(bcm590xx->regmap_pri);
    59			dev_err(&i2c_pri->dev, "primary regmap init failed: %d\n", ret);
    60			return ret;
    61		}
    62	
    63		/* Secondary I2C slave address is the base address with A(2) asserted */
    64		bcm590xx->i2c_sec = i2c_new_dummy_device(i2c_pri->adapter,
    65						  i2c_pri->addr | BIT(2));
    66		if (IS_ERR(bcm590xx->i2c_sec)) {
    67			dev_err(&i2c_pri->dev, "failed to add secondary I2C device\n");
    68			return PTR_ERR(bcm590xx->i2c_sec);
    69		}
    70		i2c_set_clientdata(bcm590xx->i2c_sec, bcm590xx);
    71	
    72		bcm590xx->regmap_sec = devm_regmap_init_i2c(bcm590xx->i2c_sec,
    73							&bcm590xx_regmap_config_sec);
    74		if (IS_ERR(bcm590xx->regmap_sec)) {
    75			ret = PTR_ERR(bcm590xx->regmap_sec);
    76			dev_err(&bcm590xx->i2c_sec->dev,
    77				"secondary regmap init failed: %d\n", ret);
    78			goto err;
    79		}
    80	
    81		ret = devm_mfd_add_devices(&i2c_pri->dev, -1, bcm590xx_devs,
    82					   ARRAY_SIZE(bcm590xx_devs), NULL, 0, NULL);
    83		if (ret < 0) {
    84			dev_err(&i2c_pri->dev, "failed to add sub-devices: %d\n", ret);
    85			goto err;
    86		}
    87	
    88		return 0;
    89	
    90	err:
    91		i2c_unregister_device(bcm590xx->i2c_sec);
    92		return ret;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
