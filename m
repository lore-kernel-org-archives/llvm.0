Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABFB13BADF;
	Thu,  9 May 2024 02:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715223127; cv=none; b=DGjvvi1f4+2OB3qRTD0/LxdqVaWmlFINBLBGo6Bn/wWCe8ilOoKVON1U6PemmXsMsQtJGCtjwJSQIetHTjnL75NbxHUlYulmyqwVzxJRPEv2KsU5BrBXi8sD85ModlbiWOASDEbm7CVmF3V4x1QvFXwwfOxz747Q4wIK2R+bmSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715223127; c=relaxed/simple;
	bh=TgxV07suzbFQlI3Iih4egVO1wPBqYm/Nd7XMqvx7ouw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I7BdnSWKK/djVkhRl4hcRNtW4Of+6/Asjq52VDYyT5vX1R5GVQA44pM+0ZwBKz2cKeejAmxCyVjtgdQQeVLfM49oOGr/tl+RbLYzFsWdMt2UO2MRzlpLGMgevyl+Gy10TQfs/0R/LebqfGPN++4CmVhTlOPX+xajc4vmKSnQilI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7uhU9cE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7uhU9cE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715223126; x=1746759126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TgxV07suzbFQlI3Iih4egVO1wPBqYm/Nd7XMqvx7ouw=;
  b=f7uhU9cEZm1xDx+7Cmig1KUcva4Mk/q/1eML7Y9MqV4gyvf8KM11ZX4J
   KpCUqsIeT5Dl2Q/rUxssssbNytFHiavj/IlMFzE3sVAOsLLVePoYTOE/o
   W3Dulob9tHJ1nJDpOib6Ue+dAQJjcGgnKWA7mBLYJABCT1OCcyfsS4YH1
   vfJsZmEJZWmknywr4pVNeA+Hyfgh9AULpbYGD9idP8IekepSIQV1W6PYv
   bn3Mf62OQfuwTP2UC3dLlqZvn9wwpBsiSUgEZDPCjlhqiexZwEFPGIQtO
   04L6D2ygo8GTzyK+3b8BEba53obaKGHgbgkHrUQufrZXtiR/eJXkLyEJz
   A==;
X-CSE-ConnectionGUID: VvSJg+4GQjm15Znap9tkmA==
X-CSE-MsgGUID: FxPxUccnT0mibEEYZseIIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22269510"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="22269510"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 19:51:56 -0700
X-CSE-ConnectionGUID: CoBu0VPYQHuh01EeQYE2Cg==
X-CSE-MsgGUID: dcIENkWXQx+qzfDVK6w6YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="60253172"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 May 2024 19:51:54 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4tst-0004NH-22;
	Thu, 09 May 2024 02:51:51 +0000
Date: Thu, 9 May 2024 10:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [broonie-ci:v5_20240507_wens_regulator_sun20i_add_allwinner_d1_ldos_driver
 11/11] drivers/regulator/sun20i-regulator.c:111:9: error: call to undeclared
 function 'of_device_get_match_data'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202405091005.QcdWxIfd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v5_20240507_wens_regulator_sun20i_add_allwinner_d1_ldos_driver
head:   d76a5d182fa92d5270e5689baa26841f7ac45228
commit: d76a5d182fa92d5270e5689baa26841f7ac45228 [11/11] regulator: sun20i: Add Allwinner D1 LDOs driver
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240509/202405091005.QcdWxIfd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405091005.QcdWxIfd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405091005.QcdWxIfd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/regulator/sun20i-regulator.c:11:
   In file included from include/linux/regulator/driver.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/regulator/sun20i-regulator.c:111:9: error: call to undeclared function 'of_device_get_match_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     111 |         data = of_device_get_match_data(dev);
         |                ^
>> drivers/regulator/sun20i-regulator.c:111:7: error: incompatible integer to pointer conversion assigning to 'const struct sun20i_regulator_data *' from 'int' [-Wint-conversion]
     111 |         data = of_device_get_match_data(dev);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/sun20i-regulator.c:136:59: error: array has incomplete element type 'const struct of_device_id'
     136 | static const struct of_device_id sun20i_regulator_of_match[] = {
         |                                                           ^
   include/linux/device/driver.h:106:15: note: forward declaration of 'struct of_device_id'
     106 |         const struct of_device_id       *of_match_table;
         |                      ^
   1 warning and 3 errors generated.


vim +/of_device_get_match_data +111 drivers/regulator/sun20i-regulator.c

   103	
   104	static int sun20i_regulator_probe(struct platform_device *pdev)
   105	{
   106		const struct sun20i_regulator_data *data;
   107		struct device *dev = &pdev->dev;
   108		struct regulator_config config;
   109		struct regmap *regmap;
   110	
 > 111		data = of_device_get_match_data(dev);
   112		if (!data)
   113			return -EINVAL;
   114	
   115		regmap = sun20i_regulator_get_regmap(dev);
   116		if (IS_ERR(regmap))
   117			return dev_err_probe(dev, PTR_ERR(regmap), "Failed to get regmap\n");
   118	
   119		config = (struct regulator_config) {
   120			.dev	= dev,
   121			.regmap	= regmap,
   122		};
   123	
   124		for (unsigned int i = 0; i < data->ndescs; ++i) {
   125			const struct regulator_desc *desc = &data->descs[i];
   126			struct regulator_dev *rdev;
   127	
   128			rdev = devm_regulator_register(dev, desc, &config);
   129			if (IS_ERR(rdev))
   130				return PTR_ERR(rdev);
   131		}
   132	
   133		return 0;
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
