Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683A015E89;
	Thu, 27 Jun 2024 03:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719458520; cv=none; b=NwWmEIa1gOJkhklriBfP/mLZe4TDIKImW0TMm+kX43LnrMA5bTML7gmQqfoBEBXLy3SIOLWrbx3wGZS9cYcIkuWf3m8YgNoARV/DRdKq3KVqSTEVWltrE+yzP215mK3KxqOyKaxQR6kH2kocDoMNLIBCj97liB1QMIbZy+KDZnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719458520; c=relaxed/simple;
	bh=a2j4j1Zo0stEOoIdBzfTk9w9JYOm/v7VuBNTR4pv0YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jj0rfjKnY4Uw/nk/keP1NypoOuLTaPNlCEYXG7Yw9BQZ0H8DwIN+OJ7GtGyXbu4IYK1sZyhvR4P3BS37xsf7eozw+ENbNYKcp5VWFtKemzQv0/W9Ap4pMsT+dKsz7AUN7NiZhJbJsfKo7S10m+zzVTG8RgjDr122TVaUBQ5nVE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aifqQpWs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aifqQpWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719458518; x=1750994518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a2j4j1Zo0stEOoIdBzfTk9w9JYOm/v7VuBNTR4pv0YQ=;
  b=aifqQpWsA0YW60Nop+DMgU/jM1gDbtW96wGzwLZI/4QDDh+oXuGBTvWj
   YR5h/eRF1noOdGt5ialBkTl9JOUWXhb7n1rbxK3YwiUKsB4aGXTdHcaX/
   Iy1RzhlKJFYoCMeB2fcDUtjGKKUoBiFfB+MpryD0qve0c8jRaQmjW9BRK
   yw06hoL8b/1S5XIYUnfaudjDK1jV74WMaRcH1RM9pEPspfH8V78Jo4WVm
   ADoSra7nVbmCm+3goKn8bEEWnrgkPFKh/8McFflHYCiotu9bX8Vuc8Owz
   W2YxWTBKEFwTiof2NlzsjPCWv+8vW9OZU2Cr8rn8cfhZ0D1IRiFcBTlm4
   A==;
X-CSE-ConnectionGUID: 1x22IVpmRVe9Mf/35x2m2Q==
X-CSE-MsgGUID: blbC3yU/T368Ct9BXxUIYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19452815"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="19452815"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 20:21:58 -0700
X-CSE-ConnectionGUID: /6fuO4dGQvKGkTegV2T3lQ==
X-CSE-MsgGUID: Ta08teF6QpuP8C7TqO+Ugw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="48692591"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 20:21:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMfhq-000Fq4-1e;
	Thu, 27 Jun 2024 03:21:54 +0000
Date: Thu, 27 Jun 2024 11:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-iio-ad9467-new-devs 4/9]
 drivers/iio/dac/ad9739a.c:417:9: error: too many arguments to function call,
 expected 2, have 3
Message-ID: <202406271101.huF6INy5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-iio-ad9467-new-devs
head:   07a190d5bdd96dcb948ba00339145f0bb2b461e9
commit: 93939e195eb7ec55a0bdefa022c33008ccf95e3c [4/9] iio: backend: remove unused parameter
config: i386-buildonly-randconfig-004-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271101.huF6INy5-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271101.huF6INy5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271101.huF6INy5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/dac/ad9739a.c:417:9: error: too many arguments to function call, expected 2, have 3
     416 |         ret = iio_backend_extend_chan_spec(indio_dev, st->back,
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     417 |                                            &ad9739a_channels[0]);
         |                                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/iio/backend.h:145:5: note: 'iio_backend_extend_chan_spec' declared here
     145 | int iio_backend_extend_chan_spec(struct iio_backend *back,
         |     ^                            ~~~~~~~~~~~~~~~~~~~~~~~~~
     146 |                                  struct iio_chan_spec *chan);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on [n]: SPI [=n]
   Selected by [m]:
   - AD9739A [=m] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])


vim +417 drivers/iio/dac/ad9739a.c

e77603d5468b90 Nuno Sa 2024-04-19  361  
e77603d5468b90 Nuno Sa 2024-04-19  362  static int ad9739a_probe(struct spi_device *spi)
e77603d5468b90 Nuno Sa 2024-04-19  363  {
e77603d5468b90 Nuno Sa 2024-04-19  364  	struct device *dev = &spi->dev;
e77603d5468b90 Nuno Sa 2024-04-19  365  	struct iio_dev *indio_dev;
e77603d5468b90 Nuno Sa 2024-04-19  366  	struct ad9739a_state *st;
e77603d5468b90 Nuno Sa 2024-04-19  367  	unsigned int id;
e77603d5468b90 Nuno Sa 2024-04-19  368  	struct clk *clk;
e77603d5468b90 Nuno Sa 2024-04-19  369  	int ret;
e77603d5468b90 Nuno Sa 2024-04-19  370  
e77603d5468b90 Nuno Sa 2024-04-19  371  	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
e77603d5468b90 Nuno Sa 2024-04-19  372  	if (!indio_dev)
e77603d5468b90 Nuno Sa 2024-04-19  373  		return -ENOMEM;
e77603d5468b90 Nuno Sa 2024-04-19  374  
e77603d5468b90 Nuno Sa 2024-04-19  375  	st = iio_priv(indio_dev);
e77603d5468b90 Nuno Sa 2024-04-19  376  
e77603d5468b90 Nuno Sa 2024-04-19  377  	clk = devm_clk_get_enabled(dev, NULL);
e77603d5468b90 Nuno Sa 2024-04-19  378  	if (IS_ERR(clk))
e77603d5468b90 Nuno Sa 2024-04-19  379  		return dev_err_probe(dev, PTR_ERR(clk), "Could not get clkin\n");
e77603d5468b90 Nuno Sa 2024-04-19  380  
e77603d5468b90 Nuno Sa 2024-04-19  381  	st->sample_rate = clk_get_rate(clk);
e77603d5468b90 Nuno Sa 2024-04-19  382  	if (!in_range(st->sample_rate, AD9739A_MIN_DAC_CLK,
e77603d5468b90 Nuno Sa 2024-04-19  383  		      AD9739A_DAC_CLK_RANGE))
e77603d5468b90 Nuno Sa 2024-04-19  384  		return dev_err_probe(dev, -EINVAL,
e77603d5468b90 Nuno Sa 2024-04-19  385  				     "Invalid dac clk range(%lu) [%lu %lu]\n",
e77603d5468b90 Nuno Sa 2024-04-19  386  				     st->sample_rate, AD9739A_MIN_DAC_CLK,
e77603d5468b90 Nuno Sa 2024-04-19  387  				     AD9739A_MAX_DAC_CLK);
e77603d5468b90 Nuno Sa 2024-04-19  388  
e77603d5468b90 Nuno Sa 2024-04-19  389  	st->regmap = devm_regmap_init_spi(spi, &ad9739a_regmap_config);
e77603d5468b90 Nuno Sa 2024-04-19  390  	if (IS_ERR(st->regmap))
e77603d5468b90 Nuno Sa 2024-04-19  391  		return PTR_ERR(st->regmap);
e77603d5468b90 Nuno Sa 2024-04-19  392  
e77603d5468b90 Nuno Sa 2024-04-19  393  	ret = regmap_read(st->regmap, AD9739A_REG_ID, &id);
e77603d5468b90 Nuno Sa 2024-04-19  394  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  395  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  396  
e77603d5468b90 Nuno Sa 2024-04-19  397  	if (id != AD9739A_ID)
e77603d5468b90 Nuno Sa 2024-04-19  398  		dev_warn(dev, "Unrecognized CHIP_ID 0x%X", id);
e77603d5468b90 Nuno Sa 2024-04-19  399  
e77603d5468b90 Nuno Sa 2024-04-19  400  	ret = ad9739a_reset(dev, st);
e77603d5468b90 Nuno Sa 2024-04-19  401  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  402  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  403  
e77603d5468b90 Nuno Sa 2024-04-19  404  	ret = ad9739a_init(dev, st);
e77603d5468b90 Nuno Sa 2024-04-19  405  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  406  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  407  
e77603d5468b90 Nuno Sa 2024-04-19  408  	st->back = devm_iio_backend_get(dev, NULL);
e77603d5468b90 Nuno Sa 2024-04-19  409  	if (IS_ERR(st->back))
e77603d5468b90 Nuno Sa 2024-04-19  410  		return PTR_ERR(st->back);
e77603d5468b90 Nuno Sa 2024-04-19  411  
e77603d5468b90 Nuno Sa 2024-04-19  412  	ret = devm_iio_backend_request_buffer(dev, st->back, indio_dev);
e77603d5468b90 Nuno Sa 2024-04-19  413  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  414  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  415  
e77603d5468b90 Nuno Sa 2024-04-19  416  	ret = iio_backend_extend_chan_spec(indio_dev, st->back,
e77603d5468b90 Nuno Sa 2024-04-19 @417  					   &ad9739a_channels[0]);
e77603d5468b90 Nuno Sa 2024-04-19  418  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  419  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  420  
e77603d5468b90 Nuno Sa 2024-04-19  421  	ret = iio_backend_set_sampling_freq(st->back, 0, st->sample_rate);
e77603d5468b90 Nuno Sa 2024-04-19  422  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  423  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  424  
e77603d5468b90 Nuno Sa 2024-04-19  425  	ret = devm_iio_backend_enable(dev, st->back);
e77603d5468b90 Nuno Sa 2024-04-19  426  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  427  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  428  
e77603d5468b90 Nuno Sa 2024-04-19  429  	indio_dev->name = "ad9739a";
e77603d5468b90 Nuno Sa 2024-04-19  430  	indio_dev->info = &ad9739a_info;
e77603d5468b90 Nuno Sa 2024-04-19  431  	indio_dev->channels = ad9739a_channels;
e77603d5468b90 Nuno Sa 2024-04-19  432  	indio_dev->num_channels = ARRAY_SIZE(ad9739a_channels);
e77603d5468b90 Nuno Sa 2024-04-19  433  	indio_dev->setup_ops = &ad9739a_buffer_setup_ops;
e77603d5468b90 Nuno Sa 2024-04-19  434  
e77603d5468b90 Nuno Sa 2024-04-19  435  	return devm_iio_device_register(&spi->dev, indio_dev);
e77603d5468b90 Nuno Sa 2024-04-19  436  }
e77603d5468b90 Nuno Sa 2024-04-19  437  

:::::: The code at line 417 was first introduced by commit
:::::: e77603d5468b9093c111a998a86604e21a9e7f48 iio: dac: support the ad9739a RF DAC

:::::: TO: Nuno Sa <nuno.sa@analog.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
