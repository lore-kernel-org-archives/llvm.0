Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D83133998;
	Mon, 14 Oct 2024 11:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728905104; cv=none; b=bXYnMVvu7cLxB7EtSOrDDJJ+HGHhM9MjkeAgL0jFLVbu9jhfVoQuogWXkGksK1sSHPubqr2gSrUnF6vbx4B+QskCZr3MWfAyJxTHlgA1irYqh4mlHq9jpwmHWsPs6M3QLh3uodb4HOJnI0fGuCfkfeOOCwqlwGCflOLVNxh9rW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728905104; c=relaxed/simple;
	bh=mtwBEEZAY1UHOZR3gv7yZrFG+V/9PYHdcOaJtjU3404=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=etSrPlDwclsddCSyaIZtVxLsWGjJEHK2jQgMok9Eq0MyhtEAZ/dQ2qss/3RcRFRl6yqs9WwgSD0l4y39C0CkTF/F5GVufmFIK8fwfdsST1yhlNam2zN1dj+brtT8sSCs0gaGWD9/FBjUGwQWePBYDqAvXv7/kbTs8iQKTAKy0KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0Ap+Bnw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0Ap+Bnw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728905102; x=1760441102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mtwBEEZAY1UHOZR3gv7yZrFG+V/9PYHdcOaJtjU3404=;
  b=V0Ap+BnwmCP0RSWV/wqrYIBqQqhlYpxp/iqlH01K01B7/VXfoyrnFw/4
   HqbvZl+kL5BoSDeunpVNOCVe8uOrQqwiWVF40qlMm8Lg2BEyrTs4yjpwp
   Oas8c1NB4/VYGM9jsvONxrQlS3v3VSrIhfXIeLqG0gYsXN27DNPrdMESY
   KdZvKAcHIrWkMaXpfW/B2snrcEGLCX1pXwHl26dyAUlT0Xy8hl6Fc0eFO
   ThfK69fZpfSm0Glf4961/HFoH1v1aHEEw/JZd0EgHYTkWoD8yuXZI4nGA
   5tzz3TstOAjmKLoCc6TgQGo68On/jc+nPQ/B/EWipMSxkJ4HRL+SN5p82
   A==;
X-CSE-ConnectionGUID: tb8nEPbBRDCKkWn5Ib2vww==
X-CSE-MsgGUID: UlCcgMeRRAya1Te15cZIfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53669449"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="53669449"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:25:02 -0700
X-CSE-ConnectionGUID: n2iPMLyFSw2spBKeYTM3sQ==
X-CSE-MsgGUID: QzZLO2M/S0ugMRGKS/xWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77195216"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Oct 2024 04:25:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0JC5-000FEJ-2q;
	Mon, 14 Oct 2024 11:24:57 +0000
Date: Mon, 14 Oct 2024 19:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nuno Sa <nuno.sa@analog.com>
Subject: [jic23-iio:testing 15/26] drivers/iio/adc/ad7625.c:613:33: warning:
 variable 'ref_clk' is uninitialized when used here
Message-ID: <202410141902.LbC578GQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   465644ac29536d10178b5ca4684d0b84765b9fa4
commit: 364bbb980a3b5657a64f887b67a3dba7770a236d [15/26] iio: adc: ad7625: add driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241014/202410141902.LbC578GQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141902.LbC578GQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141902.LbC578GQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/ad7625.c:613:33: warning: variable 'ref_clk' is uninitialized when used here [-Wuninitialized]
     613 |         ret = devm_ad7625_pwm_get(dev, ref_clk, st);
         |                                        ^~~~~~~
   drivers/iio/adc/ad7625.c:559:21: note: initialize the variable 'ref_clk' to silence this warning
     559 |         struct clk *ref_clk;
         |                            ^
         |                             = NULL
   1 warning generated.


vim +/ref_clk +613 drivers/iio/adc/ad7625.c

   553	
   554	static int ad7625_probe(struct platform_device *pdev)
   555	{
   556		struct device *dev = &pdev->dev;
   557		struct iio_dev *indio_dev;
   558		struct ad7625_state *st;
   559		struct clk *ref_clk;
   560		int ret;
   561		u32 default_sample_freq;
   562	
   563		indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
   564		if (!indio_dev)
   565			return -ENOMEM;
   566	
   567		st = iio_priv(indio_dev);
   568	
   569		st->info = device_get_match_data(dev);
   570		if (!st->info)
   571			return dev_err_probe(dev, -EINVAL, "no chip info\n");
   572	
   573		if (device_property_read_bool(dev, "adi,no-dco"))
   574			return dev_err_probe(dev, -EINVAL,
   575					     "self-clocked mode not supported\n");
   576	
   577		if (st->info->has_bandwidth_control)
   578			ret = ad7625_parse_mode(dev, st, 4);
   579		else
   580			ret = ad7625_parse_mode(dev, st, 2);
   581	
   582		if (ret)
   583			return ret;
   584	
   585		ret = devm_ad7625_regulator_setup(dev, st);
   586		if (ret)
   587			return ret;
   588	
   589		/* Set the device mode based on detected EN configuration. */
   590		if (!st->info->has_bandwidth_control) {
   591			ad7625_set_en_gpios_for_vref(st, st->have_refin, st->vref_mv);
   592		} else {
   593			/*
   594			 * If neither sampling mode is available, then report an error,
   595			 * since the other modes are not useful defaults.
   596			 */
   597			if (st->can_wide_bandwidth) {
   598				ret = ad7960_set_mode(st, AD7960_MODE_WIDE_BANDWIDTH,
   599						      st->have_refin, st->vref_mv);
   600			} else if (st->can_narrow_bandwidth) {
   601				ret = ad7960_set_mode(st, AD7960_MODE_NARROW_BANDWIDTH,
   602						      st->have_refin, st->vref_mv);
   603			} else {
   604				return dev_err_probe(dev, -EINVAL,
   605					"couldn't set device to wide or narrow bandwidth modes\n");
   606			}
   607	
   608			if (ret)
   609				return dev_err_probe(dev, -EINVAL,
   610						     "failed to set EN pins\n");
   611		}
   612	
 > 613		ret = devm_ad7625_pwm_get(dev, ref_clk, st);
   614		if (ret)
   615			return ret;
   616	
   617		indio_dev->channels = &st->info->chan_spec;
   618		indio_dev->num_channels = 1;
   619		indio_dev->name = st->info->name;
   620		indio_dev->info = &ad7625_info;
   621		indio_dev->setup_ops = &ad7625_buffer_setup_ops;
   622	
   623		st->back = devm_iio_backend_get(dev, NULL);
   624		if (IS_ERR(st->back))
   625			return dev_err_probe(dev, PTR_ERR(st->back),
   626					     "failed to get IIO backend");
   627	
   628		ret = devm_iio_backend_request_buffer(dev, st->back, indio_dev);
   629		if (ret)
   630			return ret;
   631	
   632		ret = devm_iio_backend_enable(dev, st->back);
   633		if (ret)
   634			return ret;
   635	
   636		/*
   637		 * Set the initial sampling frequency to the maximum, unless the
   638		 * AD796x device is limited to narrow bandwidth by EN2 == 1, in
   639		 * which case the sampling frequency should be limited to 2MSPS
   640		 */
   641		default_sample_freq = st->info->max_sample_freq_hz;
   642		if (st->info->has_bandwidth_control && !st->can_wide_bandwidth)
   643			default_sample_freq = AD7960_MAX_NBW_FREQ;
   644	
   645		ret = ad7625_set_sampling_freq(st, default_sample_freq);
   646		if (ret)
   647			dev_err_probe(dev, ret,
   648				      "failed to set valid sampling frequency\n");
   649	
   650		return devm_iio_device_register(dev, indio_dev);
   651	}
   652	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
