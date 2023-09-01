Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F4AAD41;
	Fri,  1 Sep 2023 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693569940; x=1725105940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aWBTpNJ6di9XrsyrAF91ADYofPyzQ4rj7ODkD3xImjY=;
  b=KM89GeyPdPejYOa57oi44tXtMmYUuMbCSDmobrqBYqlVQHWyRq7c+YSm
   jMEzfB3hQzTEZthX56BR8gwGiqVTGV839t8DQkhJPZx8rugsZ9P0w3hXN
   PV1dF87qE18T/gD6pRYYinBgdMNyHN8gf3PV9iNktTzBOu+qbh/Qi/qwM
   /QEA43cbwnr3Spe7NvJ7AUoDi2czgBYm7UKT9Wls0/mbMDbakJoCXVsXf
   mMVWI4dUpNPDoHaBNMrKDtZq4pOI2ga2R5b1YkiOKZKUm1HPX/+tg479V
   4N7+ANL4W9JMGP5xCj5uYAPviiZc29ijJ/I36YF0Cu/o0TdT1XXBbgOaf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462572374"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="462572374"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 05:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070726921"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="1070726921"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Sep 2023 05:05:37 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc2u7-0001Fz-0k;
	Fri, 01 Sep 2023 12:05:35 +0000
Date: Fri, 1 Sep 2023 20:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 5/8] drivers/hwmon/pmbus/lm25066.c:485:13:
 warning: cast to smaller integer type 'enum chips' from 'const void *'
Message-ID: <202309012008.j6bF81zg-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-006-20230901 (https://download.01.org/0day-ci/archive/20230901/202309012008.j6bF81zg-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012008.j6bF81zg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012008.j6bF81zg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/lm25066.c:485:13: warning: cast to smaller integer type 'enum chips' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           data->id = (enum chips)i2c_get_match_data(client);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +485 drivers/hwmon/pmbus/lm25066.c

   463	
   464	static int lm25066_probe(struct i2c_client *client)
   465	{
   466		int config;
   467		u32 shunt;
   468		struct lm25066_data *data;
   469		struct pmbus_driver_info *info;
   470		const struct __coeff *coeff;
   471	
   472		if (!i2c_check_functionality(client->adapter,
   473					     I2C_FUNC_SMBUS_READ_BYTE_DATA))
   474			return -ENODEV;
   475	
   476		data = devm_kzalloc(&client->dev, sizeof(struct lm25066_data),
   477				    GFP_KERNEL);
   478		if (!data)
   479			return -ENOMEM;
   480	
   481		config = i2c_smbus_read_byte_data(client, LM25066_DEVICE_SETUP);
   482		if (config < 0)
   483			return config;
   484	
 > 485		data->id = (enum chips)i2c_get_match_data(client);
   486	
   487		info = &data->info;
   488	
   489		info->pages = 1;
   490		info->format[PSC_VOLTAGE_IN] = direct;
   491		info->format[PSC_VOLTAGE_OUT] = direct;
   492		info->format[PSC_CURRENT_IN] = direct;
   493		info->format[PSC_TEMPERATURE] = direct;
   494		info->format[PSC_POWER] = direct;
   495	
   496		info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VMON
   497		  | PMBUS_HAVE_PIN | PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT
   498		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_SAMPLES;
   499	
   500		if (data->id == lm25056) {
   501			info->func[0] |= PMBUS_HAVE_STATUS_VMON;
   502			info->read_word_data = lm25056_read_word_data;
   503			info->read_byte_data = lm25056_read_byte_data;
   504			data->rlimit = 0x0fff;
   505		} else {
   506			info->func[0] |= PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
   507			info->read_word_data = lm25066_read_word_data;
   508			data->rlimit = 0x0fff;
   509		}
   510		info->write_word_data = lm25066_write_word_data;
   511	
   512		coeff = &lm25066_coeff[data->id][0];
   513		info->m[PSC_TEMPERATURE] = coeff[PSC_TEMPERATURE].m;
   514		info->b[PSC_TEMPERATURE] = coeff[PSC_TEMPERATURE].b;
   515		info->R[PSC_TEMPERATURE] = coeff[PSC_TEMPERATURE].R;
   516		info->m[PSC_VOLTAGE_IN] = coeff[PSC_VOLTAGE_IN].m;
   517		info->b[PSC_VOLTAGE_IN] = coeff[PSC_VOLTAGE_IN].b;
   518		info->R[PSC_VOLTAGE_IN] = coeff[PSC_VOLTAGE_IN].R;
   519		info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
   520		info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
   521		info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
   522		info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
   523		info->R[PSC_POWER] = coeff[PSC_POWER].R;
   524		if (config & LM25066_DEV_SETUP_CL) {
   525			info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
   526			info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
   527			info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
   528			info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
   529		} else {
   530			info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
   531			info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
   532			info->m[PSC_POWER] = coeff[PSC_POWER].m;
   533			info->b[PSC_POWER] = coeff[PSC_POWER].b;
   534		}
   535	
   536		/*
   537		 * Values in the TI datasheets are normalized for a 1mOhm sense
   538		 * resistor; assume that unless DT specifies a value explicitly.
   539		 */
   540		if (of_property_read_u32(client->dev.of_node, "shunt-resistor-micro-ohms", &shunt))
   541			shunt = 1000;
   542	
   543		info->m[PSC_CURRENT_IN] = info->m[PSC_CURRENT_IN] * shunt / 1000;
   544		info->m[PSC_POWER] = info->m[PSC_POWER] * shunt / 1000;
   545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
