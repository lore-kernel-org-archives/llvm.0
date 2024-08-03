Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC91312B64;
	Sat,  3 Aug 2024 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722706741; cv=none; b=DBxhb8CIsE0Kku3TBBbSoh9dakeCkRSmGeptXLFwsRpHh5lbgZc0SdkZ2qKYZ1zOdEWzwUJe4xlC07ENT5gF2faj34dk3sMJiS36c1ErpIq8mZ3AE2iEMuQ3jw8RBr4rC0+TKlvFsXP6awzOuDe+NnssWDOQdprmll+7Sl5b2yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722706741; c=relaxed/simple;
	bh=6aijyQFeR/YkZEmq9mx6Su9P3RWmAUxeJFBlNdce7BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6dgO2HIPw6h2TTAGaoEvCP+EKhS0TrCED8RbNVvqzpEmv6JqmXzccVMXz0gK0W18asgoYK8KXFdwf9bfYVaSE1dqwTmXl3X+IryJ+63urZjDpP7P5SBCqjfmVdExdOQfT4e4d2bPZkXVB/0cyF57rOpPP/2D12CxfMgbGs4x78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhHq7JvW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhHq7JvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722706739; x=1754242739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6aijyQFeR/YkZEmq9mx6Su9P3RWmAUxeJFBlNdce7BE=;
  b=fhHq7JvWliS4TbC1ZABDhOqrKtNwCuslARmzIBHl3lnLHmCpcupDEVjR
   x93rDkLZ+HUCcper4RlA+sWBRnWm6rcnj2O5prcWpSCRlFWGfIupuehjq
   LoBTFF2vcUYnG1i9PHXjtqcLejCmuw0+9oqq4Wo/IJ1qDSd2gS7zJN5Ig
   CGGN7vripEcm1QqKF2aL6z+WyiS0msq8qNePpIxq+o4DTKsFweZyptXzE
   7NQHxjMKxmwiMNlCYLy1PR88WnCdI1BaiakC1fZr2WFoLmC0bVrvY/oua
   v95Y3iVzC1TKe1qvKqoY84Fv6VUuDzXr9gAOcDOB/Ye7VIrSALOmfwdfs
   Q==;
X-CSE-ConnectionGUID: mqFUJzXfQ5qUdFlhFDtQpQ==
X-CSE-MsgGUID: bRqr5Xm5R/OT92P19ioSYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="31337228"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="31337228"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 10:38:58 -0700
X-CSE-ConnectionGUID: r0krMamSSPKGapyGvaF81A==
X-CSE-MsgGUID: hICiBLgpQfyt0LLDP6dmdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60552879"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Aug 2024 10:38:56 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saIiU-0000nq-1X;
	Sat, 03 Aug 2024 17:38:54 +0000
Date: Sun, 4 Aug 2024 01:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] iio: adc: ad7625: add driver
Message-ID: <202408040114.uAr0ifMP-lkp@intel.com>
References: <20240731-ad7625_r1-v1-2-a1efef5a2ab9@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-ad7625_r1-v1-2-a1efef5a2ab9@baylibre.com>

Hi Trevor,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ac6a258892793f0a255fe7084ec2b612131c67fc]

url:    https://github.com/intel-lab-lkp/linux/commits/Trevor-Gamblin/dt-bindings-iio-adc-add-AD762x-AD796x-ADCs/20240802-054208
base:   ac6a258892793f0a255fe7084ec2b612131c67fc
patch link:    https://lore.kernel.org/r/20240731-ad7625_r1-v1-2-a1efef5a2ab9%40baylibre.com
patch subject: [PATCH RFC 2/3] iio: adc: ad7625: add driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240804/202408040114.uAr0ifMP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040114.uAr0ifMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040114.uAr0ifMP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/ad7625.c:553:33: warning: variable 'ref_clk' is uninitialized when used here [-Wuninitialized]
     553 |         ret = devm_ad7625_pwm_get(dev, ref_clk, st);
         |                                        ^~~~~~~
   drivers/iio/adc/ad7625.c:459:21: note: initialize the variable 'ref_clk' to silence this warning
     459 |         struct clk *ref_clk;
         |                            ^
         |                             = NULL
   1 warning generated.


vim +/ref_clk +553 drivers/iio/adc/ad7625.c

   448	
   449	static int ad7625_probe(struct platform_device *pdev)
   450	{
   451		/*
   452		 * Power-up info for the device says to bring up vio, then
   453		 * vdd2, then vdd1
   454		 */
   455		static const char * const regulator_names[] = { "vio", "vdd2", "vdd1" };
   456		struct device *dev = &pdev->dev;
   457		struct iio_dev *indio_dev;
   458		struct ad7625_state *st;
   459		struct clk *ref_clk;
   460		int ret, ref_mv;
   461		int default_sample_freq;
   462		bool have_refin;
   463	
   464		indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
   465		if (!indio_dev)
   466			return -ENOMEM;
   467	
   468		st = iio_priv(indio_dev);
   469	
   470		st->info = device_get_match_data(dev);
   471		if (!st->info)
   472			return dev_err_probe(dev, -EINVAL, "no chip info\n");
   473	
   474		ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(regulator_names),
   475			regulator_names);
   476		if (ret)
   477			return ret;
   478	
   479		if (st->info->has_bandwidth_control)
   480			ret = ad7625_parse_mode(dev, st, 4);
   481		else
   482			ret = ad7625_parse_mode(dev, st, 2);
   483	
   484		if (ret)
   485			return ret;
   486	
   487		/*
   488		 * Determine the source of the reference voltage:
   489		 * - internal reference: neither REF or REFIN is connected
   490		 *   (invalid for AD796x)
   491		 * - internal buffer, external reference: REF not connected,
   492		 *   is REFIN connected
   493		 * - external reference: REF connected, REFIN not connected
   494		 */
   495		ret = devm_regulator_get_enable_read_voltage(dev, "ref");
   496		if (ret < 0 && ret != -ENODEV)
   497			return dev_err_probe(dev, ret, "failed to get REF voltage\n");
   498	
   499		ref_mv = ret == -ENODEV ? 0 : ret / 1000;
   500	
   501		ret = devm_regulator_get_enable_optional(dev, "refin");
   502		if (ret < 0 && ret != -ENODEV)
   503			return dev_err_probe(dev, ret, "failed to get REFIN voltage\n");
   504	
   505		have_refin = ret != -ENODEV;
   506	
   507		if (have_refin && !st->can_refin)
   508			return dev_err_probe(dev, -EINVAL,
   509					     "REFIN provided in unsupported mode\n");
   510	
   511		if (!st->info->has_internal_vref && !have_refin && !ref_mv)
   512			return dev_err_probe(dev, -EINVAL,
   513					     "Need either REFIN or REF");
   514	
   515		if (have_refin && ref_mv)
   516			return dev_err_probe(dev, -EINVAL,
   517					     "cannot have both REFIN and REF supplies\n");
   518	
   519		st->vref_mv = ref_mv ?: AD7625_INTERNAL_REF_MV;
   520	
   521		if (ref_mv == 4096 && !st->can_ref_4v096)
   522			return dev_err_probe(dev, -EINVAL,
   523					     "REF is 4.096V in unsupported mode\n");
   524	
   525		if (ref_mv == 5000 && !st->can_ref_5v)
   526			return dev_err_probe(dev, -EINVAL,
   527					     "REF is 5V in unsupported mode\n");
   528	
   529		/* Set the device mode based on detected EN configuration. */
   530		if (!st->info->has_bandwidth_control) {
   531			ad7625_set_en_gpios_for_vref(st, have_refin, ref_mv);
   532		} else {
   533			/*
   534			 * If neither sampling mode is available, then report an error,
   535			 * since the other modes are not useful defaults.
   536			 */
   537			if (st->can_wide_bandwidth) {
   538				ret = ad7960_set_mode(st, AD7960_MODE_WIDE_BANDWIDTH,
   539					have_refin, ref_mv);
   540			} else if (st->can_narrow_bandwidth) {
   541				ret = ad7960_set_mode(st, AD7960_MODE_NARROW_BANDWIDTH,
   542					have_refin, ref_mv);
   543			} else {
   544				return dev_err_probe(dev, -EINVAL,
   545					"couldn't set device to wide or narrow bandwidth modes\n");
   546			}
   547	
   548			if (ret)
   549				return dev_err_probe(dev, -EINVAL,
   550						     "failed to set EN pins\n");
   551		}
   552	
 > 553		ret = devm_ad7625_pwm_get(dev, ref_clk, st);
   554		if (ret)
   555			return dev_err_probe(dev, -EINVAL,
   556					     "failed to set ref_clk_rate_hz\n");
   557	
   558		indio_dev->channels = &st->info->chan_spec;
   559		indio_dev->num_channels = 1;
   560		indio_dev->name = st->info->name;
   561		indio_dev->info = &ad7625_info;
   562	
   563		st->back = devm_iio_backend_get(dev, NULL);
   564		if (IS_ERR(st->back))
   565			return dev_err_probe(dev, PTR_ERR(st->back),
   566					     "failed to get IIO backend");
   567	
   568		ret = devm_iio_backend_request_buffer(dev, st->back, indio_dev);
   569		if (ret)
   570			return ret;
   571	
   572		ret = devm_iio_backend_enable(dev, st->back);
   573		if (ret)
   574			return ret;
   575	
   576		/*
   577		 * Set the initial sampling frequency to the maximum, unless the
   578		 * AD796x device is limited to narrow bandwidth, in which case
   579		 * the sampling frequency should be limited to 2MSPS
   580		 */
   581		if (!st->info->has_bandwidth_control) {
   582			default_sample_freq = st->info->max_sample_rate_hz;
   583		} else {
   584			default_sample_freq = !st->can_wide_bandwidth ? AD7960_MAX_NBW_FREQ :
   585					      st->info->max_sample_rate_hz;
   586		}
   587	
   588		ret = ad7625_set_sampling_freq(st, default_sample_freq);
   589		if (ret < 0)
   590			dev_err_probe(dev, ret, "failed to set sampling frequency\n");
   591	
   592		return devm_iio_device_register(dev, indio_dev);
   593	}
   594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
