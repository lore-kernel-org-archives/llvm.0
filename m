Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1563168DA;
	Fri,  1 Nov 2024 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730468507; cv=none; b=BH/PIRtpB5rfVyndz+kU9sYsYojvWKRoyK/vTM3LBJXl+HcrdSrn1wvTxtVXttdFvK9cEpv+L6p1044ioGiN6Ydzz2MbqxWbKX+seEYgWmo1u2w103WgGojbZf5ARz23oQxjx/pEwU85Vae4/iQNKsCj/PeqlcngisxFKB6OMsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730468507; c=relaxed/simple;
	bh=DbrHzucDQTNLfVs72rLTmrnYfWOEPD0hPsBwPPQ7inA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RFIjP17vhe3bNrLP8htq8vh8IJynABGLWZQU+sNTHngFy2W5sFw+kFgH9V6/D77+tzyuhfsgj7yKpY54V7KQCbmg7tyip8KJriTxKXVZGdR+0uQ+ms7ovskUR4JwIr3zHdASaG8xVKy2VxWNRAiI9gAoXi7hOLjIJ7aZpo7RWkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvqBSx9a; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvqBSx9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730468505; x=1762004505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbrHzucDQTNLfVs72rLTmrnYfWOEPD0hPsBwPPQ7inA=;
  b=DvqBSx9atvjfYMMgq7JRxSsfCAHGIMhgsygDmZSXKlzuQvLqy6Q1G6Dx
   HkV5hzkFZNnzZEebd0vond2fMrQbI49WVtHTDBQyQ/jZvOGJM6x/rXBfE
   lUY0ak9BIppb01300w6pykafzZqOJv4eNu/p8t5eDnKivH5KzcxT3chUO
   JnAct7BVlCkRTsmLk2+qto2jyu+a4c4g0F4Eo8ohNVKk+OsvnTVUvrbh0
   U7SzqwF9GIwmuJ0kpXfUMfkttFf1XwEjFRT7e7RlG+/Jw9YbAHx3IQYAA
   AReVJESKkqOo+p8Chyy5008L+6fkMvZmscaiCtUw/xzAfc9sVGWoJhGDi
   w==;
X-CSE-ConnectionGUID: rIplhGK4SJOCeNqw06enpA==
X-CSE-MsgGUID: ByPMfshVRLCu81vOQ96Ayw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="47717866"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="47717866"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:41:41 -0700
X-CSE-ConnectionGUID: Zka9ghB+SP26Arbn8yGlSA==
X-CSE-MsgGUID: LVYKbddfReS3LngXkFRpCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="106309024"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Nov 2024 06:41:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6ruD-000har-0b;
	Fri, 01 Nov 2024 13:41:37 +0000
Date: Fri, 1 Nov 2024 21:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/must_check-devm_mutex_init 2/2]
 drivers/iio/adc/pac1921.c:1174:2: warning: ignoring return value of function
 declared with 'warn_unused_result' attribute
Message-ID: <202411012150.KynHQ3Ht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/must_check-devm_mutex_init
head:   1806244ad4c894932db80d79aceae7a9fb262153
commit: 1806244ad4c894932db80d79aceae7a9fb262153 [2/2] locking/mutex: Mark devm_mutex_init() as __must_check
config: x86_64-buildonly-randconfig-004-20241101 (https://download.01.org/0day-ci/archive/20241101/202411012150.KynHQ3Ht-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012150.KynHQ3Ht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012150.KynHQ3Ht-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/adc/pac1921.c:10:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/pac1921.c:1174:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
    1174 |         devm_mutex_init(dev, &priv->lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mutex.h:152:37: note: expanded from macro 'devm_mutex_init'
     152 | #define devm_mutex_init(dev, mutex) __devm_mutex_init(dev, ___devm_mutex_init(mutex))
         |                                     ^~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +/warn_unused_result +1174 drivers/iio/adc/pac1921.c

371f778b83cd94 Matteo Martelli 2024-07-24  1153  
371f778b83cd94 Matteo Martelli 2024-07-24  1154  static int pac1921_probe(struct i2c_client *client)
371f778b83cd94 Matteo Martelli 2024-07-24  1155  {
371f778b83cd94 Matteo Martelli 2024-07-24  1156  	struct device *dev = &client->dev;
371f778b83cd94 Matteo Martelli 2024-07-24  1157  	struct pac1921_priv *priv;
371f778b83cd94 Matteo Martelli 2024-07-24  1158  	struct iio_dev *indio_dev;
371f778b83cd94 Matteo Martelli 2024-07-24  1159  	int ret;
371f778b83cd94 Matteo Martelli 2024-07-24  1160  
371f778b83cd94 Matteo Martelli 2024-07-24  1161  	indio_dev = devm_iio_device_alloc(dev, sizeof(*priv));
371f778b83cd94 Matteo Martelli 2024-07-24  1162  	if (!indio_dev)
371f778b83cd94 Matteo Martelli 2024-07-24  1163  		return -ENOMEM;
371f778b83cd94 Matteo Martelli 2024-07-24  1164  
371f778b83cd94 Matteo Martelli 2024-07-24  1165  	priv = iio_priv(indio_dev);
371f778b83cd94 Matteo Martelli 2024-07-24  1166  	priv->client = client;
371f778b83cd94 Matteo Martelli 2024-07-24  1167  	i2c_set_clientdata(client, indio_dev);
371f778b83cd94 Matteo Martelli 2024-07-24  1168  
371f778b83cd94 Matteo Martelli 2024-07-24  1169  	priv->regmap = devm_regmap_init_i2c(client, &pac1921_regmap_config);
371f778b83cd94 Matteo Martelli 2024-07-24  1170  	if (IS_ERR(priv->regmap))
c5d2291a3086f4 Dan Carpenter   2024-08-08  1171  		return dev_err_probe(dev, (int)PTR_ERR(priv->regmap),
371f778b83cd94 Matteo Martelli 2024-07-24  1172  				     "Cannot initialize register map\n");
371f778b83cd94 Matteo Martelli 2024-07-24  1173  
371f778b83cd94 Matteo Martelli 2024-07-24 @1174  	devm_mutex_init(dev, &priv->lock);
371f778b83cd94 Matteo Martelli 2024-07-24  1175  
371f778b83cd94 Matteo Martelli 2024-07-24  1176  	priv->dv_gain = PAC1921_DEFAULT_DV_GAIN;
371f778b83cd94 Matteo Martelli 2024-07-24  1177  	priv->di_gain = PAC1921_DEFAULT_DI_GAIN;
371f778b83cd94 Matteo Martelli 2024-07-24  1178  	priv->n_samples = PAC1921_DEFAULT_NUM_SAMPLES;
371f778b83cd94 Matteo Martelli 2024-07-24  1179  
371f778b83cd94 Matteo Martelli 2024-07-24  1180  	ret = device_property_read_u32(dev, "shunt-resistor-micro-ohms",
371f778b83cd94 Matteo Martelli 2024-07-24  1181  				       &priv->rshunt_uohm);
371f778b83cd94 Matteo Martelli 2024-07-24  1182  	if (ret)
371f778b83cd94 Matteo Martelli 2024-07-24  1183  		return dev_err_probe(dev, ret,
371f778b83cd94 Matteo Martelli 2024-07-24  1184  				     "Cannot read shunt resistor property\n");
371f778b83cd94 Matteo Martelli 2024-07-24  1185  	if (priv->rshunt_uohm == 0 || priv->rshunt_uohm > INT_MAX)
371f778b83cd94 Matteo Martelli 2024-07-24  1186  		return dev_err_probe(dev, -EINVAL,
371f778b83cd94 Matteo Martelli 2024-07-24  1187  				     "Invalid shunt resistor: %u\n",
371f778b83cd94 Matteo Martelli 2024-07-24  1188  				     priv->rshunt_uohm);
371f778b83cd94 Matteo Martelli 2024-07-24  1189  
371f778b83cd94 Matteo Martelli 2024-07-24  1190  	pac1921_calc_current_scales(priv);
371f778b83cd94 Matteo Martelli 2024-07-24  1191  
371f778b83cd94 Matteo Martelli 2024-07-24  1192  	priv->vdd = devm_regulator_get(dev, "vdd");
371f778b83cd94 Matteo Martelli 2024-07-24  1193  	if (IS_ERR(priv->vdd))
371f778b83cd94 Matteo Martelli 2024-07-24  1194  		return dev_err_probe(dev, (int)PTR_ERR(priv->vdd),
371f778b83cd94 Matteo Martelli 2024-07-24  1195  				     "Cannot get vdd regulator\n");
371f778b83cd94 Matteo Martelli 2024-07-24  1196  
371f778b83cd94 Matteo Martelli 2024-07-24  1197  	ret = regulator_enable(priv->vdd);
371f778b83cd94 Matteo Martelli 2024-07-24  1198  	if (ret)
371f778b83cd94 Matteo Martelli 2024-07-24  1199  		return dev_err_probe(dev, ret, "Cannot enable vdd regulator\n");
371f778b83cd94 Matteo Martelli 2024-07-24  1200  
371f778b83cd94 Matteo Martelli 2024-07-24  1201  	ret = devm_add_action_or_reset(dev, pac1921_regulator_disable,
371f778b83cd94 Matteo Martelli 2024-07-24  1202  				       priv->vdd);
371f778b83cd94 Matteo Martelli 2024-07-24  1203  	if (ret)
371f778b83cd94 Matteo Martelli 2024-07-24  1204  		return dev_err_probe(dev, ret,
371f778b83cd94 Matteo Martelli 2024-07-24  1205  			"Cannot add action for vdd regulator disposal\n");
371f778b83cd94 Matteo Martelli 2024-07-24  1206  
371f778b83cd94 Matteo Martelli 2024-07-24  1207  	msleep(PAC1921_POWERUP_TIME_MS);
371f778b83cd94 Matteo Martelli 2024-07-24  1208  
371f778b83cd94 Matteo Martelli 2024-07-24  1209  	ret = pac1921_init(priv);
371f778b83cd94 Matteo Martelli 2024-07-24  1210  	if (ret)
371f778b83cd94 Matteo Martelli 2024-07-24  1211  		return dev_err_probe(dev, ret, "Cannot initialize device\n");
371f778b83cd94 Matteo Martelli 2024-07-24  1212  
371f778b83cd94 Matteo Martelli 2024-07-24  1213  	priv->iio_info = pac1921_iio;
371f778b83cd94 Matteo Martelli 2024-07-24  1214  
371f778b83cd94 Matteo Martelli 2024-07-24  1215  	indio_dev->name = "pac1921";
371f778b83cd94 Matteo Martelli 2024-07-24  1216  	indio_dev->info = &priv->iio_info;
371f778b83cd94 Matteo Martelli 2024-07-24  1217  	indio_dev->modes = INDIO_DIRECT_MODE;
371f778b83cd94 Matteo Martelli 2024-07-24  1218  	indio_dev->channels = pac1921_channels;
371f778b83cd94 Matteo Martelli 2024-07-24  1219  	indio_dev->num_channels = ARRAY_SIZE(pac1921_channels);
371f778b83cd94 Matteo Martelli 2024-07-24  1220  
371f778b83cd94 Matteo Martelli 2024-07-24  1221  	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
371f778b83cd94 Matteo Martelli 2024-07-24  1222  					      &iio_pollfunc_store_time,
371f778b83cd94 Matteo Martelli 2024-07-24  1223  					      &pac1921_trigger_handler, NULL);
371f778b83cd94 Matteo Martelli 2024-07-24  1224  	if (ret)
371f778b83cd94 Matteo Martelli 2024-07-24  1225  		return dev_err_probe(dev, ret,
371f778b83cd94 Matteo Martelli 2024-07-24  1226  				     "Cannot setup IIO triggered buffer\n");
371f778b83cd94 Matteo Martelli 2024-07-24  1227  
371f778b83cd94 Matteo Martelli 2024-07-24  1228  	ret = devm_iio_device_register(dev, indio_dev);
371f778b83cd94 Matteo Martelli 2024-07-24  1229  	if (ret)
371f778b83cd94 Matteo Martelli 2024-07-24  1230  		return dev_err_probe(dev, ret, "Cannot register IIO device\n");
371f778b83cd94 Matteo Martelli 2024-07-24  1231  
371f778b83cd94 Matteo Martelli 2024-07-24  1232  	return 0;
371f778b83cd94 Matteo Martelli 2024-07-24  1233  }
371f778b83cd94 Matteo Martelli 2024-07-24  1234  

:::::: The code at line 1174 was first introduced by commit
:::::: 371f778b83cd94467852efb466d74dc84eddd11e iio: adc: add support for pac1921

:::::: TO: Matteo Martelli <matteomartelli3@gmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
