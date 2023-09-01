Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F87AD37;
	Fri,  1 Sep 2023 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693569939; x=1725105939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=caNakZH9YjCnGo0l+D2FWgRJLy+hkGbPW4FWIljcbcw=;
  b=QR088QqWkyWQ81Rt9Bl1El5aHPMNt2sXBFBTRxwsHAekBha+KHEqqQ6D
   istoHENNJizJQf3SFPQifX5DAilnHh2bIcJCYnRNrnWKLk42vCEwx//ng
   o6K9K1cOkt+vQBLjWKRK9vzTqe5ssxRAowyNDypTiSwurBbKwRu3RRkH5
   Wb6CXaxBpYILEqzbcG90uSphJwdcURQvjRuXJehyp5RSHMHSsRVssKBDU
   YAVSVNeiNVGlGMDjiUko4GUqhmQXnYkBjPnfZRBzNz/crZ/Jxak0HYF0d
   zvqiy/Z9FGL7etAUocv+vH08PpL1Dpz1/fMPMVgwn9yvocya8j0UVqycb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407197706"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="407197706"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 05:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854688044"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="854688044"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2023 05:05:37 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc2u7-0001G5-13;
	Fri, 01 Sep 2023 12:05:35 +0000
Date: Fri, 1 Sep 2023 20:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 5/8]
 drivers/regulator/da9121-regulator.c:1133:24: warning: cast to smaller
 integer type 'enum da9121_subvariant' from 'const void *'
Message-ID: <202309011945.r85ZYDiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   a143793949161ccf952d0b50ee37e442cf8c02e9
commit: 0be56945298277377b33c8b380b610d449ec9db7 [5/8] Use of_device_get_match_data
config: x86_64-buildonly-randconfig-001-20230901 (https://download.01.org/0day-ci/archive/20230901/202309011945.r85ZYDiY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011945.r85ZYDiY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011945.r85ZYDiY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/da9121-regulator.c:1133:24: warning: cast to smaller integer type 'enum da9121_subvariant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           chip->subvariant_id = (enum da9121_subvariant)i2c_get_match_data(i2c);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +1133 drivers/regulator/da9121-regulator.c

  1119	
  1120	static int da9121_i2c_probe(struct i2c_client *i2c)
  1121	{
  1122		struct da9121 *chip;
  1123		const int mask_all[4] = { 0xFF, 0xFF, 0xFF, 0xFF };
  1124		int ret = 0;
  1125	
  1126		chip = devm_kzalloc(&i2c->dev, sizeof(struct da9121), GFP_KERNEL);
  1127		if (!chip) {
  1128			ret = -ENOMEM;
  1129			goto error;
  1130		}
  1131	
  1132		chip->pdata = i2c->dev.platform_data;
> 1133		chip->subvariant_id = (enum da9121_subvariant)i2c_get_match_data(i2c);
  1134	
  1135		ret = da9121_assign_chip_model(i2c, chip);
  1136		if (ret < 0)
  1137			goto error;
  1138	
  1139		ret = regmap_bulk_write(chip->regmap, DA9121_REG_SYS_MASK_0, mask_all, 4);
  1140		if (ret != 0) {
  1141			dev_err(chip->dev, "Failed to set IRQ masks: %d\n", ret);
  1142			goto error;
  1143		}
  1144	
  1145		ret = da9121_set_regulator_config(chip);
  1146		if (ret < 0)
  1147			goto error;
  1148	
  1149		ret = da9121_config_irq(i2c, chip);
  1150	
  1151	error:
  1152		return ret;
  1153	}
  1154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
