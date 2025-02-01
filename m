Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF50613D504;
	Sat,  1 Feb 2025 10:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738406335; cv=none; b=HeXbgnsiE3erKnKHYblVfxfwSHmiQBVhRXZCT9IQp9EMQxwNW+PminGnFAQ8780euMzXYT2Ylev1sn3RxeJZ6clsi3nlkqMMBGJIbGQWGnvlVF5F5ldFBUA8yFHDlXshdGl4qroDkhfL2TvX7ee/IaGERAri8iin5/m3p1GLEh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738406335; c=relaxed/simple;
	bh=C30HS8zoEz5mXy6IItjgUVqI7rWrJsCmGabBzALefXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCRE02yMH2snfqK6Tg5cMLWilmbxu6U8kYpFahK4uCbXN6uLBH1Fc7sQm/xRA12BPyWTrWxvbluK1ubun2LTJF+jkMZIbTrDWHurzaaf5wqfT22XC88OlSSv1408SbANUTbOBa+kwDAwZtKgUvKOj2Dfbl6PHkHaC8BNrBFtUMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mag24BW6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mag24BW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738406333; x=1769942333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C30HS8zoEz5mXy6IItjgUVqI7rWrJsCmGabBzALefXw=;
  b=mag24BW62tvB8y+6Edu55jjEcXYdjoyk1/oBtkSDAYUeMiUrZYAoBA0R
   /pOlza/0nC2bJsZoHce2Eu8OSOoSziV/PkAMEHlBts/9JNtxAnFhNq2Na
   9hORkZ1G8/aMqz8qgCWDDWm92A7kRGeDN4mkdZQNaTgokJ6y9ZBLM8P69
   6DU1naZNl9qXZIwbQw+dVcsMWO71N2JvSFeEWx5tm+I7K5ssCY460Gh/W
   AkUegWO8X/e//xE1s4CAWx0bP/kSUFI2PODqt0+De9uBqbzKTrDFf8BhS
   K6Ray1iGtqY8GT4PrOXiGe84kGpq3BGYSbwnvYJtFk3uY6MuKVf9on88o
   w==;
X-CSE-ConnectionGUID: eTXBm/9nRTmEGw4rrIXKXg==
X-CSE-MsgGUID: xnH5Mc1zRpaeeZGb9wS6HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38667204"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="38667204"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 02:38:52 -0800
X-CSE-ConnectionGUID: hwnUzIhaSASuDe1v89m3cQ==
X-CSE-MsgGUID: BGOW20BnTzqaOMqxP0RWvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="109980577"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Feb 2025 02:38:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teAtk-000o2B-2m;
	Sat, 01 Feb 2025 10:38:48 +0000
Date: Sat, 1 Feb 2025 18:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/5] mfd: Add ROHM BD79124 ADC/GPO
Message-ID: <202502011801.rWqfrePH-lkp@intel.com>
References: <cc30cf6859b5e5a7320282709f428cd42717ac6b.1738328714.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc30cf6859b5e5a7320282709f428cd42717ac6b.1738328714.git.mazziesaccount@gmail.com>

Hi Matti,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 5bc55a333a2f7316b58edc7573e8e893f7acb532]

url:    https://github.com/intel-lab-lkp/linux/commits/Matti-Vaittinen/dt-bindings-ROHM-BD79124-ADC-GPO/20250131-214129
base:   5bc55a333a2f7316b58edc7573e8e893f7acb532
patch link:    https://lore.kernel.org/r/cc30cf6859b5e5a7320282709f428cd42717ac6b.1738328714.git.mazziesaccount%40gmail.com
patch subject: [RFC PATCH 2/5] mfd: Add ROHM BD79124 ADC/GPO
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250201/202502011801.rWqfrePH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011801.rWqfrePH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502011801.rWqfrePH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/rohm-bd79124.c:114:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     114 |                 return dev_err_probe(dev, ret, "Failed to get the Vdd\n");
         |                                           ^~~
   drivers/mfd/rohm-bd79124.c:97:9: note: initialize the variable 'ret' to silence this warning
      97 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +114 drivers/mfd/rohm-bd79124.c

    94	
    95	static int bd79124_probe(struct i2c_client *i2c)
    96	{
    97		int ret;
    98		struct regmap *map;
    99		struct device *dev = &i2c->dev;
   100		int *adc_vref;
   101	
   102		adc_vref = devm_kzalloc(dev, sizeof(*adc_vref), GFP_KERNEL);
   103		if (!adc_vref)
   104			return -ENOMEM;
   105	
   106		/*
   107		 * Better to enable regulators here so we don't need to worry about the
   108		 * order of sub-device instantiation. We also need to deliver the
   109		 * reference voltage value to the ADC driver. This is done via
   110		 * the MFD driver's drvdata.
   111		 */
   112		*adc_vref = devm_regulator_get_enable_read_voltage(dev, "vdd");
   113		if (*adc_vref < 0)
 > 114			return dev_err_probe(dev, ret, "Failed to get the Vdd\n");
   115	
   116		dev_set_drvdata(dev, adc_vref);
   117	
   118		ret = devm_regulator_get_enable(dev, "iovdd");
   119		if (ret < 0)
   120			return dev_err_probe(dev, ret, "Failed to enable I/O voltage\n");
   121	
   122		map = devm_regmap_init_i2c(i2c, &bd79124_regmap);
   123		if (IS_ERR(map))
   124			return dev_err_probe(dev, PTR_ERR(map),
   125					     "Failed to initialize Regmap\n");
   126	
   127		if (i2c->irq) {
   128			adc_alert = DEFINE_RES_IRQ_NAMED(i2c->irq, "thresh-alert");
   129			bd79124_cells[CELL_ADC].resources = &adc_alert;
   130			bd79124_cells[CELL_ADC].num_resources = 1;
   131		}
   132	
   133		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, bd79124_cells,
   134					   ARRAY_SIZE(bd79124_cells), NULL, 0, NULL);
   135		if (ret)
   136			dev_err_probe(dev, ret, "Failed to create subdevices\n");
   137	
   138		return ret;
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
