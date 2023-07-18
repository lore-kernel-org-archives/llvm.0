Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7DC15A9;
	Tue, 18 Jul 2023 06:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689660497; x=1721196497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tyAPpcjqtrtYCeyYQ6r1WEacBk7luri7yztjPn5vve4=;
  b=fnfwNMmjNYFXL2v1O8On3DSpL1XSm7XPK2QtZDi3GfgXwpknEh7bolA2
   SN4ZiUfvTd3Jrj7KK+fAxJUULIQOFwX5HTHPalOh3JWc1YNMeef3OQ0lQ
   YKE6sI76WlUs76nEkRBETKiHdnDEPoGVJsIi7FMMuAnBWCk4d+HrYwXkz
   YUI7AH2BHVObMbTchciktWuusvMMeuSTuBm142pfxB/MZq6BSr0hDYaJ0
   MZlve/CSGdj3/vShpwZoJcIp9D/izhWwsZeIiP2x3GIYbiGvuT8lIvq3e
   hCPrXVCan3mv55HahrGRNz3a8zu4FxxgYIPWgxUnhBV4/82AghsbrTS6A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="350987191"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="350987191"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 23:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="723470671"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="723470671"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Jul 2023 23:08:15 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLdsc-0000Gz-1c;
	Tue, 18 Jul 2023 06:08:14 +0000
Date: Tue, 18 Jul 2023 14:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Okan Sahin <okan.sahin@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 2748/3113]
 drivers/regulator/max77857-regulator.c:312:16: error: initializer element is
 not a compile-time constant
Message-ID: <202307181450.sfbuvMf5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aeba456828b4e47d99ec8ffb01412fbed0f94806
commit: af71cccadecedad3484c2208e2c4fc8eff927d4a [2748/3113] regulator: max77857: Add ADI MAX77857/59/MAX77831 Regulator Support
config: riscv-randconfig-r016-20230718 (https://download.01.org/0day-ci/archive/20230718/202307181450.sfbuvMf5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181450.sfbuvMf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307181450.sfbuvMf5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/regulator/max77857-regulator.c:56:24: warning: cast to smaller integer type 'enum max77857_id' from 'void *' [-Wvoid-pointer-to-enum-cast]
      56 |         enum max77857_id id = (enum max77857_id)dev_get_drvdata(dev);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max77857-regulator.c:94:24: warning: cast to smaller integer type 'enum max77857_id' from 'void *' [-Wvoid-pointer-to-enum-cast]
      94 |         enum max77857_id id = (enum max77857_id)rdev_get_drvdata(rdev);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max77857-regulator.c:128:24: warning: cast to smaller integer type 'enum max77857_id' from 'void *' [-Wvoid-pointer-to-enum-cast]
     128 |         enum max77857_id id = (enum max77857_id)rdev_get_drvdata(rdev);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/max77857-regulator.c:209:5: warning: no previous prototype for function 'max77859_get_voltage_sel' [-Wmissing-prototypes]
     209 | int max77859_get_voltage_sel(struct regulator_dev *rdev)
         |     ^
   drivers/regulator/max77857-regulator.c:209:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     209 | int max77859_get_voltage_sel(struct regulator_dev *rdev)
         | ^
         | static 
>> drivers/regulator/max77857-regulator.c:221:5: warning: no previous prototype for function 'max77859_set_current_limit' [-Wmissing-prototypes]
     221 | int max77859_set_current_limit(struct regulator_dev *rdev, int min_uA, int max_uA)
         |     ^
   drivers/regulator/max77857-regulator.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     221 | int max77859_set_current_limit(struct regulator_dev *rdev, int min_uA, int max_uA)
         | ^
         | static 
>> drivers/regulator/max77857-regulator.c:235:5: warning: no previous prototype for function 'max77859_get_current_limit' [-Wmissing-prototypes]
     235 | int max77859_get_current_limit(struct regulator_dev *rdev)
         |     ^
   drivers/regulator/max77857-regulator.c:235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     235 | int max77859_get_current_limit(struct regulator_dev *rdev)
         | ^
         | static 
>> drivers/regulator/max77857-regulator.c:312:16: error: initializer element is not a compile-time constant
     312 |         .ramp_delay = max77857_ramp_table[0][0],
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +312 drivers/regulator/max77857-regulator.c

   208	
 > 209	int max77859_get_voltage_sel(struct regulator_dev *rdev)
   210	{
   211		__be16 reg;
   212		int ret;
   213	
   214		ret = regmap_bulk_read(rdev->regmap, MAX77859_REG_CONT3, &reg, 2);
   215		if (ret)
   216			return ret;
   217	
   218		return FIELD_GET(MAX77859_VOLTAGE_SEL_MASK, __be16_to_cpu(reg));
   219	}
   220	
 > 221	int max77859_set_current_limit(struct regulator_dev *rdev, int min_uA, int max_uA)
   222	{
   223		u32 selector;
   224	
   225		if (max_uA < MAX77859_CURRENT_MIN)
   226			return -EINVAL;
   227	
   228		selector = 0x12 + (max_uA - MAX77859_CURRENT_MIN) / MAX77859_CURRENT_STEP;
   229	
   230		selector = clamp_val(selector, 0x00, 0x7F);
   231	
   232		return regmap_write(rdev->regmap, MAX77859_REG_CONT5, selector);
   233	}
   234	
 > 235	int max77859_get_current_limit(struct regulator_dev *rdev)
   236	{
   237		u32 selector;
   238		int ret;
   239	
   240		ret = regmap_read(rdev->regmap, MAX77859_REG_CONT5, &selector);
   241		if (ret)
   242			return ret;
   243	
   244		if (selector <= 0x12)
   245			return MAX77859_CURRENT_MIN;
   246	
   247		if (selector >= 0x64)
   248			return MAX77859_CURRENT_MAX;
   249	
   250		return MAX77859_CURRENT_MIN + (selector - 0x12) * MAX77859_CURRENT_STEP;
   251	}
   252	
   253	static const struct regulator_ops max77859_regulator_ops = {
   254		.list_voltage = regulator_list_voltage_linear_range,
   255		.set_voltage_sel = max77859_set_voltage_sel,
   256		.get_voltage_sel = max77859_get_voltage_sel,
   257		.set_ramp_delay = regulator_set_ramp_delay_regmap,
   258		.get_status = max77857_get_status,
   259		.set_mode = max77857_set_mode,
   260		.get_mode = max77857_get_mode,
   261		.get_error_flags = max77857_get_error_flags,
   262	};
   263	
   264	static const struct regulator_ops max77859a_regulator_ops = {
   265		.list_voltage = regulator_list_voltage_linear_range,
   266		.set_voltage_sel = max77859_set_voltage_sel,
   267		.get_voltage_sel = max77859_get_voltage_sel,
   268		.set_current_limit = max77859_set_current_limit,
   269		.get_current_limit = max77859_get_current_limit,
   270		.set_ramp_delay = regulator_set_ramp_delay_regmap,
   271		.get_status = max77857_get_status,
   272		.set_mode = max77857_set_mode,
   273		.get_mode = max77857_get_mode,
   274		.get_error_flags = max77857_get_error_flags,
   275	};
   276	
   277	static const struct regulator_ops max77857_regulator_ops = {
   278		.list_voltage = regulator_list_voltage_linear_range,
   279		.set_voltage_sel = regulator_set_voltage_sel_regmap,
   280		.get_voltage_sel = regulator_get_voltage_sel_regmap,
   281		.set_ramp_delay = regulator_set_ramp_delay_regmap,
   282		.get_status = max77857_get_status,
   283		.set_mode = max77857_set_mode,
   284		.get_mode = max77857_get_mode,
   285		.get_error_flags = max77857_get_error_flags,
   286	};
   287	
   288	static struct linear_range max77857_lin_ranges[] = {
   289		REGULATOR_LINEAR_RANGE(4485000, 0x3D, 0xCC, 73500)
   290	};
   291	
   292	static const unsigned int max77857_switch_freq[] = {
   293		1200000, 1500000, 1800000, 2100000
   294	};
   295	
   296	static const unsigned int max77857_ramp_table[2][4] = {
   297		{ 1333, 667, 333, 227 }, /* when switch freq is 1.8MHz or 2.1MHz */
   298		{ 1166, 667, 333, 167 }, /* when switch freq is 1.2MHz or 1.5MHz */
   299	};
   300	
   301	static struct regulator_desc max77857_regulator_desc = {
   302		.ops = &max77857_regulator_ops,
   303		.name = "max77857",
   304		.linear_ranges = max77857_lin_ranges,
   305		.n_linear_ranges = ARRAY_SIZE(max77857_lin_ranges),
   306		.vsel_mask = 0xFF,
   307		.vsel_reg = MAX77857_REG_CONT2,
   308		.ramp_delay_table = max77857_ramp_table[0],
   309		.n_ramp_values = ARRAY_SIZE(max77857_ramp_table[0]),
   310		.ramp_reg = MAX77857_REG_CONT3,
   311		.ramp_mask = GENMASK(1, 0),
 > 312		.ramp_delay = max77857_ramp_table[0][0],
   313		.owner = THIS_MODULE,
   314	};
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
