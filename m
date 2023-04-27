Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDE1C2CB;
	Thu, 27 Apr 2023 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682626647; x=1714162647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HObM5/TO4BIZUcu6zlgmq4OGW7GWy42sz99p4qzSwws=;
  b=FDgCRU+hL/dXw379UY51KgYk5+khXELVXoPl6aDjApfaoMBJwYLn5CgG
   6u9OFbvvIh/r3OAoz5ej4c3WGpPdWEv4zdzHkljTu0NthANhMc3sT4L1C
   /WTWSX2yqngtZYWBbcFFTZt3g5+Ca80jOeaOqm1OyTnbgi5LiDx6GelE2
   ZstN4aRJg+vjKoYgRwBFcQyWfVxrFbsEDviNG9KcF2ENzS4nYeymXG/td
   EcLZrsuCtU2uBJ53DGmigAe9fiEwEJOkFC/NE/BL1iZoPWCkoEFSwIoHv
   AznYQ9BVf5Te1LCUkgba6BOpBWf0XHCxnOBRZ5zguSBGMTuptsWqjL3T4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346324592"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="346324592"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 13:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="940804807"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="940804807"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2023 13:17:25 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps83R-00006H-0s;
	Thu, 27 Apr 2023 20:17:25 +0000
Date: Fri, 28 Apr 2023 04:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 55/57]
 drivers/hwmon/pmbus/lm25066.c:485:13: warning: cast to smaller integer type
 'enum chips' from 'const void *'
Message-ID: <202304280427.UgLOpheh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   d03f4bcb40575c1caf4deb8072eb2f9486e51b25
commit: a581a78403b6af4ee0aa9c6ee6701e92dc2555f6 [55/57] Use of_device_get_match_data
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230428/202304280427.UgLOpheh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=a581a78403b6af4ee0aa9c6ee6701e92dc2555f6
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout a581a78403b6af4ee0aa9c6ee6701e92dc2555f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hwmon/pmbus/ drivers/of/ lib/ net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280427.UgLOpheh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/lm25066.c:485:13: warning: cast to smaller integer type 'enum chips' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           data->id = (enum chips)of_device_get_match_data(&client->dev);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
 > 485		data->id = (enum chips)of_device_get_match_data(&client->dev);
   486		if (!data->id)
   487			data->id = i2c_match_id(lm25066_id, client)->driver_data;
   488		if (!data->id)
   489			return -ENODEV;
   490	
   491		info = &data->info;
   492	
   493		info->pages = 1;
   494		info->format[PSC_VOLTAGE_IN] = direct;
   495		info->format[PSC_VOLTAGE_OUT] = direct;
   496		info->format[PSC_CURRENT_IN] = direct;
   497		info->format[PSC_TEMPERATURE] = direct;
   498		info->format[PSC_POWER] = direct;
   499	
   500		info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VMON
   501		  | PMBUS_HAVE_PIN | PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT
   502		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_SAMPLES;
   503	
   504		if (data->id == lm25056) {
   505			info->func[0] |= PMBUS_HAVE_STATUS_VMON;
   506			info->read_word_data = lm25056_read_word_data;
   507			info->read_byte_data = lm25056_read_byte_data;
   508			data->rlimit = 0x0fff;
   509		} else {
   510			info->func[0] |= PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
   511			info->read_word_data = lm25066_read_word_data;
   512			data->rlimit = 0x0fff;
   513		}
   514		info->write_word_data = lm25066_write_word_data;
   515	
   516		coeff = &lm25066_coeff[data->id][0];
   517		info->m[PSC_TEMPERATURE] = coeff[PSC_TEMPERATURE].m;
   518		info->b[PSC_TEMPERATURE] = coeff[PSC_TEMPERATURE].b;
   519		info->R[PSC_TEMPERATURE] = coeff[PSC_TEMPERATURE].R;
   520		info->m[PSC_VOLTAGE_IN] = coeff[PSC_VOLTAGE_IN].m;
   521		info->b[PSC_VOLTAGE_IN] = coeff[PSC_VOLTAGE_IN].b;
   522		info->R[PSC_VOLTAGE_IN] = coeff[PSC_VOLTAGE_IN].R;
   523		info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
   524		info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
   525		info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
   526		info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
   527		info->R[PSC_POWER] = coeff[PSC_POWER].R;
   528		if (config & LM25066_DEV_SETUP_CL) {
   529			info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
   530			info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
   531			info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
   532			info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
   533		} else {
   534			info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
   535			info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
   536			info->m[PSC_POWER] = coeff[PSC_POWER].m;
   537			info->b[PSC_POWER] = coeff[PSC_POWER].b;
   538		}
   539	
   540		/*
   541		 * Values in the TI datasheets are normalized for a 1mOhm sense
   542		 * resistor; assume that unless DT specifies a value explicitly.
   543		 */
   544		if (of_property_read_u32(client->dev.of_node, "shunt-resistor-micro-ohms", &shunt))
   545			shunt = 1000;
   546	
   547		info->m[PSC_CURRENT_IN] = info->m[PSC_CURRENT_IN] * shunt / 1000;
   548		info->m[PSC_POWER] = info->m[PSC_POWER] * shunt / 1000;
   549	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
