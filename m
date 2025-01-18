Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46792E64A;
	Sat, 18 Jan 2025 03:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737171679; cv=none; b=pR0G7GXPpSLSv5KdhXOmRM66GI7ECU2zFlupg6wguoAiXL8xcqxUCQjOtRLVon/qzR3NJNMmmT/1OvL4d7iyYGXy1dQAA1W6wWOiJnYWg6u3EvNzUID5yBxYYQUiQFPup9aUfho79YEy9XQ5dxK+8BNv2fNs6Jvg8cTwotSPwco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737171679; c=relaxed/simple;
	bh=Xt8J2DgTzrF+pulzx7Iqufn4gxEibGOzwtVrBq3pguk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaeXdHcJs0VGlsSbStEtUItNMDF/vAcdJVt3kbaHSZ1OD5KzFDpLsCWxgJp85O66PHSy0Fmp1SLZt7JteBKgVGX2h4Kw/dw/36w0KQEsm6vBFCXMxIvLPsFMfhr0D4lGboQlux+aZwTA2DWEXNTto6btA0UZsah51EoyRQmmytM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPfQnyPW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPfQnyPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737171677; x=1768707677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xt8J2DgTzrF+pulzx7Iqufn4gxEibGOzwtVrBq3pguk=;
  b=UPfQnyPWi+BQA2uOSXXBmuXycQmH9M0FDUyb/+ayZEuFQk8mGSF9LGkx
   4si+jlY87AIf8VKt/zuNXxUL52rVHKoiYdpMkGviNO4H49ijjga/WpPwJ
   VpYtFV1MHvZItrjjxZqXSn8YkNkJtlhFfduQOIkB7xek1Wq/zr9SFUUlR
   wTrh5vQ3e+XaAAR7hgqhrPtVJdzn3/0B/HIeIVukd8+qnPKWpeSQmyAPM
   W4njqrf/n2aHxHf+IBkfgzGbk600jvlWZouJuBhvD2HRltwy+eRFFwwB+
   HoEO/xK8EF8yHKBgMyeFEO6axZC2AMh7ZRZLTWOEjGb/yP67ouz9ryfMh
   Q==;
X-CSE-ConnectionGUID: wCuZVdZiQUG3dg6os4IkEg==
X-CSE-MsgGUID: mWF1dMRUTKqW4rfRdj4HxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36894952"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="36894952"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 19:41:17 -0800
X-CSE-ConnectionGUID: WCwymjT1QaOkOCQPG4Fh4A==
X-CSE-MsgGUID: FHpuALH/SWCdDhyEpOc8mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110040689"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jan 2025 19:41:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYzhx-000U3X-0g;
	Sat, 18 Jan 2025 03:41:13 +0000
Date: Sat, 18 Jan 2025 11:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jonas Andreasson <jonas.andreasson@axis.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel@axis.com,
	Jonas Andreasson <jonas.andreasson@axis.com>
Subject: Re: [PATCH] regulator: TPS6287X: Use min/max uV to get VRANGE
Message-ID: <202501181129.ygE03Iho-lkp@intel.com>
References: <20250115-tps-fix-v1-1-2bd7b316409d@axis.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-tps-fix-v1-1-2bd7b316409d@axis.com>

Hi Jonas,

kernel test robot noticed the following build errors:

[auto build test ERROR on adc218676eef25575469234709c2d87185ca223a]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonas-Andreasson/regulator-TPS6287X-Use-min-max-uV-to-get-VRANGE/20250115-175832
base:   adc218676eef25575469234709c2d87185ca223a
patch link:    https://lore.kernel.org/r/20250115-tps-fix-v1-1-2bd7b316409d%40axis.com
patch subject: [PATCH] regulator: TPS6287X: Use min/max uV to get VRANGE
config: i386-randconfig-002-20250116 (https://download.01.org/0day-ci/archive/20250118/202501181129.ygE03Iho-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181129.ygE03Iho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181129.ygE03Iho-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/regulator/tps6287x-regulator.c:10:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/regulator/tps6287x-regulator.c:203:49: error: passing 'const struct regulator_desc *' to parameter of type 'struct regulator_desc *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     203 |         reg_data->range = tps6287x_best_range(&config, &tps6287x_reg);
         |                                                        ^~~~~~~~~~~~~
   drivers/regulator/tps6287x-regulator.c:59:88: note: passing argument to parameter 'desc' here
      59 | static int tps6287x_best_range(struct regulator_config *config, struct regulator_desc *desc)
         |                                                                                        ^
   1 warning and 1 error generated.


vim +203 drivers/regulator/tps6287x-regulator.c

   179	
   180	static int tps6287x_i2c_probe(struct i2c_client *i2c)
   181	{
   182		struct device *dev = &i2c->dev;
   183		struct regulator_config config = {};
   184		struct tps6287x_reg_data *reg_data;
   185		struct regulator_dev *rdev;
   186	
   187		reg_data = devm_kzalloc(dev, sizeof(struct tps6287x_reg_data), GFP_KERNEL);
   188	
   189		if (!reg_data)
   190			return -ENOMEM;
   191	
   192		config.regmap = devm_regmap_init_i2c(i2c, &tps6287x_regmap_config);
   193		if (IS_ERR(config.regmap)) {
   194			dev_err(dev, "Failed to init i2c\n");
   195			return PTR_ERR(config.regmap);
   196		}
   197	
   198		config.dev = dev;
   199		config.of_node = dev->of_node;
   200		config.init_data = of_get_regulator_init_data(dev, dev->of_node,
   201							      &tps6287x_reg);
   202	
 > 203		reg_data->range = tps6287x_best_range(&config, &tps6287x_reg);
   204	
   205		rdev = devm_regulator_register(dev, &tps6287x_reg, &config);
   206		if (IS_ERR(rdev)) {
   207			dev_err(dev, "Failed to register regulator\n");
   208			return PTR_ERR(rdev);
   209		}
   210	
   211		rdev->reg_data = (void *)reg_data;
   212		dev_dbg(dev, "Probed regulator\n");
   213	
   214		return 0;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
