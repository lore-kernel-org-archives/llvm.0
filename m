Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E172679F8;
	Thu, 31 Aug 2023 09:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693475833; x=1725011833;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=85GZHGFupcifHJ6NL4+c/l4haTc2gTLeO5aWOVjijlc=;
  b=iVEy/5kRQj642ESV1Qc8NAYa8uwJOODRULiagsEZoPUnTIecSqEr0lfe
   Si6gizYoBF/yt9tszX7EAo4zPddvuBMx1jAAnlfR1AtkbAXR/uRl1To+v
   kZIsr+RzXKVLojUPp8c59QNhUfAmYAj40mXZEVHaCDqQzCUCYK3WWkT5m
   lTKTTVyNp+Kdkg+z6fnlSNraWuNaKRa3LhGnF/wW9QZUYBcv1JdbgTDJG
   Saexk37eNyeUmYjwY+Aw3BM4B9pNsUlDbuJcL/yWXJmd2Fk0ncpFd9MC1
   lA4jWmTnK65jGsl95QlRt0rNKGtOrHslUL5Ia8Vi6RPl0NuPR9aN4f0Os
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355389027"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="355389027"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 02:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716278404"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="716278404"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 31 Aug 2023 02:57:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbeQE-000BDF-31;
	Thu, 31 Aug 2023 09:57:06 +0000
Date: Thu, 31 Aug 2023 17:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 5/7]
 drivers/regulator/max8973-regulator.c:641:19: error: use of undeclared
 identifier 'id'
Message-ID: <202308311712.TgXP2LO6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   2f859c7b504dbff5d4770187e5416610db4625e3
commit: ac865741027a59abe81c2e7d30edfd26082751f3 [5/7] Use of_device_get_match_data
config: i386-randconfig-r022-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311712.TgXP2LO6-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311712.TgXP2LO6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311712.TgXP2LO6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/max8973-regulator.c:641:19: error: use of undeclared identifier 'id'
           max->desc.name = id->name;
                            ^
   1 error generated.


vim +/id +641 drivers/regulator/max8973-regulator.c

0f7d6ece6363f31 Laxman Dewangan       2015-06-09  587  
4e85e5d64f66ac5 Uwe Kleine-König      2022-11-18  588  static int max8973_probe(struct i2c_client *client)
5928f5389664fff Laxman Dewangan       2012-11-19  589  {
5928f5389664fff Laxman Dewangan       2012-11-19  590  	struct max8973_regulator_platform_data *pdata;
69eb0980ab4ced0 Laxman Dewangan       2015-04-23  591  	struct regulator_init_data *ridata;
5928f5389664fff Laxman Dewangan       2012-11-19  592  	struct regulator_config config = { };
5928f5389664fff Laxman Dewangan       2012-11-19  593  	struct regulator_dev *rdev;
5928f5389664fff Laxman Dewangan       2012-11-19  594  	struct max8973_chip *max;
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  595  	bool pdata_from_dt = false;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  596  	unsigned int chip_id;
e7d2be696faa3c8 Linus Walleij         2018-05-14  597  	struct gpio_desc *gpiod;
e7d2be696faa3c8 Linus Walleij         2018-05-14  598  	enum gpiod_flags gflags;
5928f5389664fff Laxman Dewangan       2012-11-19  599  	int ret;
5928f5389664fff Laxman Dewangan       2012-11-19  600  
dff91d0b721bf8f Jingoo Han            2013-07-30  601  	pdata = dev_get_platdata(&client->dev);
42dc30231ba3593 Guennadi Liakhovetski 2013-06-24  602  
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  603  	if (!pdata && client->dev.of_node) {
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  604  		pdata = max8973_parse_dt(&client->dev);
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  605  		pdata_from_dt = true;
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  606  	}
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  607  
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  608  	if (!pdata) {
5928f5389664fff Laxman Dewangan       2012-11-19  609  		dev_err(&client->dev, "No Platform data");
5928f5389664fff Laxman Dewangan       2012-11-19  610  		return -EIO;
5928f5389664fff Laxman Dewangan       2012-11-19  611  	}
5928f5389664fff Laxman Dewangan       2012-11-19  612  
e7d2be696faa3c8 Linus Walleij         2018-05-14  613  	if (pdata->dvs_gpio == -EPROBE_DEFER)
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  614  		return -EPROBE_DEFER;
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  615  
5928f5389664fff Laxman Dewangan       2012-11-19  616  	max = devm_kzalloc(&client->dev, sizeof(*max), GFP_KERNEL);
21024dee20ae617 Sachin Kamat          2014-02-18  617  	if (!max)
5928f5389664fff Laxman Dewangan       2012-11-19  618  		return -ENOMEM;
5928f5389664fff Laxman Dewangan       2012-11-19  619  
5928f5389664fff Laxman Dewangan       2012-11-19  620  	max->regmap = devm_regmap_init_i2c(client, &max8973_regmap_config);
5928f5389664fff Laxman Dewangan       2012-11-19  621  	if (IS_ERR(max->regmap)) {
5928f5389664fff Laxman Dewangan       2012-11-19  622  		ret = PTR_ERR(max->regmap);
5928f5389664fff Laxman Dewangan       2012-11-19  623  		dev_err(&client->dev, "regmap init failed, err %d\n", ret);
5928f5389664fff Laxman Dewangan       2012-11-19  624  		return ret;
5928f5389664fff Laxman Dewangan       2012-11-19  625  	}
5928f5389664fff Laxman Dewangan       2012-11-19  626  
ac865741027a59a Rob Herring           2023-07-14  627  	max->id = (enum device_id)i2c_get_match_data(client);
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  628  
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  629  	ret = regmap_read(max->regmap, MAX8973_CHIPID1, &chip_id);
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  630  	if (ret < 0) {
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  631  		dev_err(&client->dev, "register CHIPID1 read failed, %d", ret);
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  632  		return ret;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  633  	}
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  634  
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  635  	dev_info(&client->dev, "CHIP-ID OTP: 0x%02x ID_M: 0x%02x\n",
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  636  			(chip_id >> 4) & 0xF, (chip_id >> 1) & 0x7);
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  637  
5928f5389664fff Laxman Dewangan       2012-11-19  638  	i2c_set_clientdata(client, max);
db892ff6c0f4970 Guennadi Liakhovetski 2013-06-21  639  	max->ops = max8973_dcdc_ops;
5928f5389664fff Laxman Dewangan       2012-11-19  640  	max->dev = &client->dev;
5928f5389664fff Laxman Dewangan       2012-11-19 @641  	max->desc.name = id->name;
5928f5389664fff Laxman Dewangan       2012-11-19  642  	max->desc.id = 0;
db892ff6c0f4970 Guennadi Liakhovetski 2013-06-21  643  	max->desc.ops = &max->ops;
5928f5389664fff Laxman Dewangan       2012-11-19  644  	max->desc.type = REGULATOR_VOLTAGE;
5928f5389664fff Laxman Dewangan       2012-11-19  645  	max->desc.owner = THIS_MODULE;
5928f5389664fff Laxman Dewangan       2012-11-19  646  	max->desc.min_uV = MAX8973_MIN_VOLATGE;
5928f5389664fff Laxman Dewangan       2012-11-19  647  	max->desc.uV_step = MAX8973_VOLATGE_STEP;
5928f5389664fff Laxman Dewangan       2012-11-19  648  	max->desc.n_voltages = MAX8973_BUCK_N_VOLTAGE;
8590ccd4dfd207d Axel Lin              2021-05-22  649  	max->desc.ramp_reg = MAX8973_CONTROL1;
8590ccd4dfd207d Axel Lin              2021-05-22  650  	max->desc.ramp_mask = MAX8973_RAMP_MASK;
8590ccd4dfd207d Axel Lin              2021-05-22  651  	max->desc.ramp_delay_table = max8973_buck_ramp_table;
8590ccd4dfd207d Axel Lin              2021-05-22  652  	max->desc.n_ramp_values = ARRAY_SIZE(max8973_buck_ramp_table);
5928f5389664fff Laxman Dewangan       2012-11-19  653  
69eb0980ab4ced0 Laxman Dewangan       2015-04-23  654  	max->dvs_gpio = (pdata->dvs_gpio) ? pdata->dvs_gpio : -EINVAL;
69eb0980ab4ced0 Laxman Dewangan       2015-04-23  655  	max->enable_external_control = pdata->enable_ext_control;
69eb0980ab4ced0 Laxman Dewangan       2015-04-23  656  	max->curr_gpio_val = pdata->dvs_def_state;
69eb0980ab4ced0 Laxman Dewangan       2015-04-23  657  	max->curr_vout_reg = MAX8973_VOUT + pdata->dvs_def_state;
d2d5437bdfdde20 Laxman Dewangan       2016-04-13  658  	max->junction_temp_warning = pdata->junction_temp_warning;
69eb0980ab4ced0 Laxman Dewangan       2015-04-23  659  
5928f5389664fff Laxman Dewangan       2012-11-19  660  	max->lru_index[0] = max->curr_vout_reg;
5928f5389664fff Laxman Dewangan       2012-11-19  661  
5928f5389664fff Laxman Dewangan       2012-11-19  662  	if (gpio_is_valid(max->dvs_gpio)) {
5928f5389664fff Laxman Dewangan       2012-11-19  663  		int gpio_flags;
5928f5389664fff Laxman Dewangan       2012-11-19  664  		int i;
5928f5389664fff Laxman Dewangan       2012-11-19  665  
5928f5389664fff Laxman Dewangan       2012-11-19  666  		gpio_flags = (pdata->dvs_def_state) ?
5928f5389664fff Laxman Dewangan       2012-11-19  667  				GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW;
5928f5389664fff Laxman Dewangan       2012-11-19  668  		ret = devm_gpio_request_one(&client->dev, max->dvs_gpio,
5928f5389664fff Laxman Dewangan       2012-11-19  669  				gpio_flags, "max8973-dvs");
5928f5389664fff Laxman Dewangan       2012-11-19  670  		if (ret) {
5928f5389664fff Laxman Dewangan       2012-11-19  671  			dev_err(&client->dev,
5928f5389664fff Laxman Dewangan       2012-11-19  672  				"gpio_request for gpio %d failed, err = %d\n",
5928f5389664fff Laxman Dewangan       2012-11-19  673  				max->dvs_gpio, ret);
5928f5389664fff Laxman Dewangan       2012-11-19  674  			return ret;
5928f5389664fff Laxman Dewangan       2012-11-19  675  		}
5928f5389664fff Laxman Dewangan       2012-11-19  676  
5928f5389664fff Laxman Dewangan       2012-11-19  677  		/*
5928f5389664fff Laxman Dewangan       2012-11-19  678  		 * Initialize the lru index with vout_reg id
5928f5389664fff Laxman Dewangan       2012-11-19  679  		 * The index 0 will be most recently used and
5928f5389664fff Laxman Dewangan       2012-11-19  680  		 * set with the max->curr_vout_reg */
5928f5389664fff Laxman Dewangan       2012-11-19  681  		for (i = 0; i < MAX8973_MAX_VOUT_REG; ++i)
5928f5389664fff Laxman Dewangan       2012-11-19  682  			max->lru_index[i] = i;
5928f5389664fff Laxman Dewangan       2012-11-19  683  		max->lru_index[0] = max->curr_vout_reg;
5928f5389664fff Laxman Dewangan       2012-11-19  684  		max->lru_index[max->curr_vout_reg] = 0;
b10c7f3cc948107 Mikko Perttunen       2015-07-28  685  	} else {
b10c7f3cc948107 Mikko Perttunen       2015-07-28  686  		/*
b10c7f3cc948107 Mikko Perttunen       2015-07-28  687  		 * If there is no DVS GPIO, the VOUT register
b10c7f3cc948107 Mikko Perttunen       2015-07-28  688  		 * address is fixed.
b10c7f3cc948107 Mikko Perttunen       2015-07-28  689  		 */
b10c7f3cc948107 Mikko Perttunen       2015-07-28  690  		max->ops.set_voltage_sel = regulator_set_voltage_sel_regmap;
b10c7f3cc948107 Mikko Perttunen       2015-07-28  691  		max->ops.get_voltage_sel = regulator_get_voltage_sel_regmap;
b10c7f3cc948107 Mikko Perttunen       2015-07-28  692  		max->desc.vsel_reg = max->curr_vout_reg;
b10c7f3cc948107 Mikko Perttunen       2015-07-28  693  		max->desc.vsel_mask = MAX8973_VOUT_MASK;
5928f5389664fff Laxman Dewangan       2012-11-19  694  	}
5928f5389664fff Laxman Dewangan       2012-11-19  695  
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  696  	if (pdata_from_dt)
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  697  		pdata->reg_init_data = of_get_regulator_init_data(&client->dev,
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  698  					client->dev.of_node, &max->desc);
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  699  
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  700  	ridata = pdata->reg_init_data;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  701  	switch (max->id) {
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  702  	case MAX8973:
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  703  		if (!pdata->enable_ext_control) {
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  704  			max->desc.enable_reg = MAX8973_VOUT;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  705  			max->desc.enable_mask = MAX8973_VOUT_ENABLE;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  706  			max->ops.enable = regulator_enable_regmap;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  707  			max->ops.disable = regulator_disable_regmap;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  708  			max->ops.is_enabled = regulator_is_enabled_regmap;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  709  			break;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  710  		}
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  711  
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  712  		if (ridata && (ridata->constraints.always_on ||
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  713  			       ridata->constraints.boot_on))
e7d2be696faa3c8 Linus Walleij         2018-05-14  714  			gflags = GPIOD_OUT_HIGH;
e7d2be696faa3c8 Linus Walleij         2018-05-14  715  		else
e7d2be696faa3c8 Linus Walleij         2018-05-14  716  			gflags = GPIOD_OUT_LOW;
63239e4bf7eff39 Linus Walleij         2018-10-15  717  		gflags |= GPIOD_FLAGS_BIT_NONEXCLUSIVE;
e7d2be696faa3c8 Linus Walleij         2018-05-14  718  		gpiod = devm_gpiod_get_optional(&client->dev,
e7d2be696faa3c8 Linus Walleij         2018-05-14  719  						"maxim,enable",
e7d2be696faa3c8 Linus Walleij         2018-05-14  720  						gflags);
e7d2be696faa3c8 Linus Walleij         2018-05-14  721  		if (IS_ERR(gpiod))
e7d2be696faa3c8 Linus Walleij         2018-05-14  722  			return PTR_ERR(gpiod);
e7d2be696faa3c8 Linus Walleij         2018-05-14  723  		if (gpiod) {
e7d2be696faa3c8 Linus Walleij         2018-05-14  724  			config.ena_gpiod = gpiod;
e7d2be696faa3c8 Linus Walleij         2018-05-14  725  			max->enable_external_control = true;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  726  		}
e7d2be696faa3c8 Linus Walleij         2018-05-14  727  
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  728  		break;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  729  
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  730  	case MAX77621:
e7d2be696faa3c8 Linus Walleij         2018-05-14  731  		/*
e7d2be696faa3c8 Linus Walleij         2018-05-14  732  		 * We do not let the core switch this regulator on/off,
e7d2be696faa3c8 Linus Walleij         2018-05-14  733  		 * we just leave it on.
e7d2be696faa3c8 Linus Walleij         2018-05-14  734  		 */
e7d2be696faa3c8 Linus Walleij         2018-05-14  735  		gpiod = devm_gpiod_get_optional(&client->dev,
e7d2be696faa3c8 Linus Walleij         2018-05-14  736  						"maxim,enable",
e7d2be696faa3c8 Linus Walleij         2018-05-14  737  						GPIOD_OUT_HIGH);
e7d2be696faa3c8 Linus Walleij         2018-05-14  738  		if (IS_ERR(gpiod))
e7d2be696faa3c8 Linus Walleij         2018-05-14  739  			return PTR_ERR(gpiod);
e7d2be696faa3c8 Linus Walleij         2018-05-14  740  		if (gpiod)
e7d2be696faa3c8 Linus Walleij         2018-05-14  741  			max->enable_external_control = true;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  742  
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  743  		max->desc.enable_reg = MAX8973_VOUT;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  744  		max->desc.enable_mask = MAX8973_VOUT_ENABLE;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  745  		max->ops.enable = regulator_enable_regmap;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  746  		max->ops.disable = regulator_disable_regmap;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  747  		max->ops.is_enabled = regulator_is_enabled_regmap;
ffaab99184a2c8b Laxman Dewangan       2015-07-01  748  		max->ops.set_current_limit = max8973_set_current_limit;
ffaab99184a2c8b Laxman Dewangan       2015-07-01  749  		max->ops.get_current_limit = max8973_get_current_limit;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  750  		break;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  751  	default:
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  752  		break;
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  753  	}
0f7d6ece6363f31 Laxman Dewangan       2015-06-09  754  
5928f5389664fff Laxman Dewangan       2012-11-19  755  	ret = max8973_init_dcdc(max, pdata);
5928f5389664fff Laxman Dewangan       2012-11-19  756  	if (ret < 0) {
5928f5389664fff Laxman Dewangan       2012-11-19  757  		dev_err(max->dev, "Max8973 Init failed, err = %d\n", ret);
5928f5389664fff Laxman Dewangan       2012-11-19  758  		return ret;
5928f5389664fff Laxman Dewangan       2012-11-19  759  	}
5928f5389664fff Laxman Dewangan       2012-11-19  760  
5928f5389664fff Laxman Dewangan       2012-11-19  761  	config.dev = &client->dev;
c2ffa9737878ad9 Laxman Dewangan       2015-04-23  762  	config.init_data = pdata->reg_init_data;
5928f5389664fff Laxman Dewangan       2012-11-19  763  	config.driver_data = max;
5928f5389664fff Laxman Dewangan       2012-11-19  764  	config.of_node = client->dev.of_node;
5928f5389664fff Laxman Dewangan       2012-11-19  765  	config.regmap = max->regmap;
5928f5389664fff Laxman Dewangan       2012-11-19  766  
48bd226f0ab3b91 Linus Walleij         2018-12-06  767  	/*
48bd226f0ab3b91 Linus Walleij         2018-12-06  768  	 * Register the regulators
48bd226f0ab3b91 Linus Walleij         2018-12-06  769  	 * Turn the GPIO descriptor over to the regulator core for
48bd226f0ab3b91 Linus Walleij         2018-12-06  770  	 * lifecycle management if we pass an ena_gpiod.
48bd226f0ab3b91 Linus Walleij         2018-12-06  771  	 */
48bd226f0ab3b91 Linus Walleij         2018-12-06  772  	if (config.ena_gpiod)
48bd226f0ab3b91 Linus Walleij         2018-12-06  773  		devm_gpiod_unhinge(&client->dev, config.ena_gpiod);
8d581fd01c922f9 Sachin Kamat          2013-09-04  774  	rdev = devm_regulator_register(&client->dev, &max->desc, &config);
5928f5389664fff Laxman Dewangan       2012-11-19  775  	if (IS_ERR(rdev)) {
5928f5389664fff Laxman Dewangan       2012-11-19  776  		ret = PTR_ERR(rdev);
5928f5389664fff Laxman Dewangan       2012-11-19  777  		dev_err(max->dev, "regulator register failed, err %d\n", ret);
5928f5389664fff Laxman Dewangan       2012-11-19  778  		return ret;
5928f5389664fff Laxman Dewangan       2012-11-19  779  	}
5928f5389664fff Laxman Dewangan       2012-11-19  780  
d2d5437bdfdde20 Laxman Dewangan       2016-04-13  781  	max8973_thermal_init(max);
5928f5389664fff Laxman Dewangan       2012-11-19  782  	return 0;
5928f5389664fff Laxman Dewangan       2012-11-19  783  }
5928f5389664fff Laxman Dewangan       2012-11-19  784  

:::::: The code at line 641 was first introduced by commit
:::::: 5928f5389664fffa295c39bbe23de73069124451 regulator: max8973: add regulator driver support

:::::: TO: Laxman Dewangan <ldewangan@nvidia.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
