Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFD51F78E6;
	Thu,  6 Feb 2025 22:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738881810; cv=none; b=cDkNSF9AHEAve78IspBDhfUt7fTO3amNzsvFKUzIjhmXQa8gqartYDwbZSFWb2mhWZlG5+PXFineUFZpROObLQywHeom8/opL4Sp7/0Oc8q79WQrVh+mQmVMEoXUqu3UFWPBxTl081CCw5JUGGIM4YhfYa2xIDcLmv3/WPpfZ+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738881810; c=relaxed/simple;
	bh=RRyeWgDKYUXqPj9AK9HawjmXCxmssH+oPCpVBdzfC7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYgYO+Flx8R3+XPiqbGvhL9RsGfIOnO5yqsBO5FE9R+OrR+7OqVdTJl/qEMi+4jrpnolkB/ILtNQ9DlXW44G04p1EVMKdY0KqfWPYfpzPwTG2rAE0R4yhJ8LnppUmNLx5zEXWNUNB7z5Ky5oH7bgZYfnP+YqUcpEB2Ih525vLBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqBdpuyc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqBdpuyc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738881808; x=1770417808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RRyeWgDKYUXqPj9AK9HawjmXCxmssH+oPCpVBdzfC7s=;
  b=WqBdpuyc8olEislBEVa8U8i39UUZOY/40rFrho5H058fJkIxTNk2fXDX
   jBbDIOwBwkB3gWbrdsjMGHFi3J4nH0HzRbmLuZVruLgUotMYZaiiWzmqg
   PRejsbeAzQQOPEgyN+rHzdK9WvkFKoIwyX7YQtoFyBlsIu7Btcvzhe2y8
   +uxiGyK/SovrARCrHYU1e+k44bxnRuPLmSl205swOG2gVi6FTvRl7HOGH
   J+N6kPpWZjR9CcW1C+XpN8cCKphAJizLmx6BcetyPCA6BSN3JU7A2DQIE
   IKth3+Y/ol7uq/kSdpS9n+HKpVGlDBRoQ7LNN0awo0b/kJ4DYrdswBqPQ
   A==;
X-CSE-ConnectionGUID: o1R+9GmCSj295C2rASGZzA==
X-CSE-MsgGUID: qZqQw6AZRC6D2DxuMKTnNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39385321"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39385321"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 14:43:28 -0800
X-CSE-ConnectionGUID: jROx22NBQcGGvRMsd4YqeA==
X-CSE-MsgGUID: tiD9h/EPS9SDj5QwMK+YGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111181311"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Feb 2025 14:43:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgAag-000xTb-17;
	Thu, 06 Feb 2025 22:43:22 +0000
Date: Fri, 7 Feb 2025 06:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] iio: adc: Support ROHM BD79124 ADC
Message-ID: <202502070654.5T9Nk6dN-lkp@intel.com>
References: <4781e1b1f074ca6c84ecc084b152885d08e826cc.1738761899.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4781e1b1f074ca6c84ecc084b152885d08e826cc.1738761899.git.mazziesaccount@gmail.com>

Hi Matti,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5bc55a333a2f7316b58edc7573e8e893f7acb532]

url:    https://github.com/intel-lab-lkp/linux/commits/Matti-Vaittinen/dt-bindings-ROHM-BD79124-ADC-GPO/20250205-214127
base:   5bc55a333a2f7316b58edc7573e8e893f7acb532
patch link:    https://lore.kernel.org/r/4781e1b1f074ca6c84ecc084b152885d08e826cc.1738761899.git.mazziesaccount%40gmail.com
patch subject: [PATCH v2 3/5] iio: adc: Support ROHM BD79124 ADC
config: i386-randconfig-004-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070654.5T9Nk6dN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070654.5T9Nk6dN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070654.5T9Nk6dN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/rohm-bd79124.c:1072:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1072 |                 return dev_err_probe(dev, ret, "Failed to get the Vdd\n");
         |                                           ^~~
   drivers/iio/adc/rohm-bd79124.c:1057:9: note: initialize the variable 'ret' to silence this warning
    1057 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +1072 drivers/iio/adc/rohm-bd79124.c

  1049	
  1050	static int bd79124_probe(struct i2c_client *i2c)
  1051	{
  1052		struct bd79124_data *data;
  1053		struct iio_dev *iio_dev;
  1054		const struct iio_chan_spec *template;
  1055		struct iio_chan_spec *cs;
  1056		struct device *dev = &i2c->dev;
  1057		int ret;
  1058	
  1059		iio_dev = devm_iio_device_alloc(dev, sizeof(*data));
  1060		if (!iio_dev)
  1061			return -ENOMEM;
  1062	
  1063		data = iio_priv(iio_dev);
  1064		data->dev = dev;
  1065		data->map = devm_regmap_init_i2c(i2c, &bd79124_regmap);
  1066		if (IS_ERR(data->map))
  1067			return dev_err_probe(dev, PTR_ERR(data->map),
  1068					     "Failed to initialize Regmap\n");
  1069	
  1070		data->vmax = devm_regulator_get_enable_read_voltage(dev, "vdd");
  1071		if (data->vmax < 0)
> 1072			return dev_err_probe(dev, ret, "Failed to get the Vdd\n");
  1073	
  1074		ret = devm_regulator_get_enable(dev, "iovdd");
  1075		if (ret < 0)
  1076			return dev_err_probe(dev, ret, "Failed to enable I/O voltage\n");
  1077	
  1078		ret = devm_delayed_work_autocancel(dev, &data->alm_enable_work,
  1079						   bd79124_alm_enable_worker);
  1080		if (ret)
  1081			return ret;
  1082	
  1083		if (i2c->irq) {
  1084			template = &bd79124_chan_template;
  1085		} else {
  1086			template = &bd79124_chan_template_noirq;
  1087			dev_dbg(dev, "No IRQ found, events disabled\n");
  1088		}
  1089		ret = devm_iio_adc_device_alloc_chaninfo(dev, template, &cs);
  1090		if (ret < 0)
  1091			return ret;
  1092	
  1093		iio_dev->channels = cs;
  1094		iio_dev->num_channels = ret;
  1095		iio_dev->info = &bd79124_info;
  1096		iio_dev->name = "bd79124";
  1097		iio_dev->modes = INDIO_DIRECT_MODE;
  1098	
  1099		data->gc = bd79124gpo_chip;
  1100		data->gc.parent = dev;
  1101	
  1102		mutex_init(&data->mutex);
  1103	
  1104		ret = bd79124_hw_init(data);
  1105		if (ret)
  1106			return ret;
  1107	
  1108		ret = devm_gpiochip_add_data(data->dev, &data->gc, data);
  1109		if (ret)
  1110			return dev_err_probe(data->dev, ret, "gpio init Failed\n");
  1111	
  1112		if (i2c->irq > 0) {
  1113			ret = devm_request_threaded_irq(data->dev, i2c->irq,
  1114						bd79124_irq_handler,
  1115						&bd79124_event_handler, IRQF_ONESHOT,
  1116						"adc-thresh-alert", iio_dev);
  1117			if (ret)
  1118				return dev_err_probe(data->dev, ret,
  1119						     "Failed to register IRQ\n");
  1120		}
  1121	
  1122		return devm_iio_device_register(data->dev, iio_dev);
  1123	}
  1124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
