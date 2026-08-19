Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE33AB269;
	Wed, 19 Aug 2026 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787121764; cv=none; b=hsJaOBMcyVFKXDRHdLwEtCQWA8kB9laNVolt7hFsTRsAIGn9wgnht5sHYoHa81Evj7Oztc7uTQfftOjNft+kwKuPgEbwc3Hl+HUmbGeeSsyWyrMYw8rAg83LKcyK7rlZ/6XhqlZdU1gTVBj397yP3aFwunD4d/E5APMs4K21/c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787121764; c=relaxed/simple;
	bh=V9E5u2HgyGP463i60aQEWJYgpGhCjNkMp3Hg4Cd23TY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oEWoxyeOjUTTZnWx/+lkF0b0HfbC6rehpnyHQDpPeOgXd4lMvsYSiRw71jDitiJPlFRZMW7/i4Pxk6UecBILbg0cbtVftq0Q/psSPfU0LX9wQvYu31IyjEfwcvRaxiFkikHdzlzg0gkurPprjUu2ng2AD32Rmr6Tyx6ZOxtn75g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3hkEZDF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3hkEZDF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787121763; x=1818657763;
  h=date:from:to:cc:subject:message-id;
  bh=V9E5u2HgyGP463i60aQEWJYgpGhCjNkMp3Hg4Cd23TY=;
  b=E3hkEZDFge2LRpT1ZTsQQ4BMOPQG58nU7qKghyI1uipZuAVzyTonHm6X
   iXd9YjBae+oWQiL60paVwNsZevZin+cUo5mAKkpsmA6gTYx6ma5aCjxyz
   lnRd79cTCNGur00SRtZ18bBShLluFRov8Sf1Pfhh6G+VytxWSuRCdLCXQ
   cbXJSumw0fwSDQsjUkbV3+493S7fh5H+J+O9lgQdJvtbqmSIz8N47MUNp
   aq8jYGbd7K86V+EnAia18IcAX2Eqh0otG6hl98YqJeHxHLpEhXfN/dHSX
   VOHkjZYE4LGmHa867INszCip3hHxIL2cys3Ls+q3IgCYLJ8usxiiFs4E3
   A==;
X-CSE-ConnectionGUID: XRQ8r/muTeSsmZ7POzCUWA==
X-CSE-MsgGUID: 4qDxYVImRPKIFOdwqowcBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="99150389"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="99150389"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:42:41 -0700
X-CSE-ConnectionGUID: ik4Y6D5dQ0+BqViLNalTsA==
X-CSE-MsgGUID: xCrVE40SQhuliZe9AQQEVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="261696367"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Aug 2026 23:42:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwa0R-00000000ex2-2vgA;
	Wed, 19 Aug 2026 06:42:35 +0000
Date: Wed, 19 Aug 2026 14:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove 200/200]
 drivers/iio/frequency/adf4350.c:717:6: warning: variable 'pdata' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202608191415.46I3v29o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   c12d647b0229f4d75a2973c9b4e79f9b53406426
commit: c12d647b0229f4d75a2973c9b4e79f9b53406426 [200/200] remaining pdata removal
config: hexagon-randconfig-001-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191415.46I3v29o-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191415.46I3v29o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191415.46I3v29o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/frequency/adf4350.c:717:6: warning: variable 'pdata' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     717 |         if (dev_fwnode(&spi->dev)) {
         |             ^~~~~~~~~~~~~~~~~~~~~
   include/linux/property.h:36:2: note: expanded from macro 'dev_fwnode'
      36 |         _Generic((dev),                                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      37 |                  const struct device *: __dev_fwnode_const,     \
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      38 |                  struct device *: __dev_fwnode)(dev)
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/frequency/adf4350.c:723:7: note: uninitialized use occurs here
     723 |         if (!pdata) {
         |              ^~~~~
   drivers/iio/frequency/adf4350.c:717:2: note: remove the 'if' if its condition is always true
     717 |         if (dev_fwnode(&spi->dev)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/frequency/adf4350.c:711:37: note: initialize the variable 'pdata' to silence this warning
     711 |         struct adf4350_platform_data *pdata;
         |                                            ^
         |                                             = NULL
   1 warning generated.


vim +717 drivers/iio/frequency/adf4350.c

9979cc64853b59 Jinjie Ruan        2023-08-28  708  
fc52692c49969e Greg Kroah-Hartman 2012-12-21  709  static int adf4350_probe(struct spi_device *spi)
e31166f0fd4847 Michael Hennerich  2012-05-29  710  {
e764df67963940 Michael Hennerich  2013-06-03  711  	struct adf4350_platform_data *pdata;
e31166f0fd4847 Michael Hennerich  2012-05-29  712  	struct iio_dev *indio_dev;
e31166f0fd4847 Michael Hennerich  2012-05-29  713  	struct adf4350_state *st;
9404fa15f20e89 Michael Hennerich  2013-06-03  714  	struct clk *clk = NULL;
e31166f0fd4847 Michael Hennerich  2012-05-29  715  	int ret;
e31166f0fd4847 Michael Hennerich  2012-05-29  716  
130650e8360fa3 Andy Shevchenko    2022-02-03 @717  	if (dev_fwnode(&spi->dev)) {
e764df67963940 Michael Hennerich  2013-06-03  718  		pdata = adf4350_parse_dt(&spi->dev);
e764df67963940 Michael Hennerich  2013-06-03  719  		if (pdata == NULL)
bc2cb23607eb0f Antoniu Miclaus    2026-02-11  720  			return -ENOMEM;
e764df67963940 Michael Hennerich  2013-06-03  721  	}
e764df67963940 Michael Hennerich  2013-06-03  722  
e31166f0fd4847 Michael Hennerich  2012-05-29  723  	if (!pdata) {
e31166f0fd4847 Michael Hennerich  2012-05-29  724  		dev_warn(&spi->dev, "no platform data? using default\n");
e31166f0fd4847 Michael Hennerich  2012-05-29  725  		pdata = &default_pdata;
e31166f0fd4847 Michael Hennerich  2012-05-29  726  	}
e31166f0fd4847 Michael Hennerich  2012-05-29  727  
9404fa15f20e89 Michael Hennerich  2013-06-03  728  	if (!pdata->clkin) {
9979cc64853b59 Jinjie Ruan        2023-08-28  729  		clk = devm_clk_get_enabled(&spi->dev, "clkin");
9404fa15f20e89 Michael Hennerich  2013-06-03  730  		if (IS_ERR(clk))
9979cc64853b59 Jinjie Ruan        2023-08-28  731  			return PTR_ERR(clk);
9404fa15f20e89 Michael Hennerich  2013-06-03  732  	}
9404fa15f20e89 Michael Hennerich  2013-06-03  733  
a8b168a15f8d7b Sachin Kamat       2013-07-22  734  	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
9979cc64853b59 Jinjie Ruan        2023-08-28  735  	if (indio_dev == NULL)
9979cc64853b59 Jinjie Ruan        2023-08-28  736  		return -ENOMEM;
e31166f0fd4847 Michael Hennerich  2012-05-29  737  
e31166f0fd4847 Michael Hennerich  2012-05-29  738  	st = iio_priv(indio_dev);
e31166f0fd4847 Michael Hennerich  2012-05-29  739  
9979cc64853b59 Jinjie Ruan        2023-08-28  740  	ret = devm_regulator_get_enable(&spi->dev, "vcc");
e31166f0fd4847 Michael Hennerich  2012-05-29  741  	if (ret)
9979cc64853b59 Jinjie Ruan        2023-08-28  742  		return ret;
e31166f0fd4847 Michael Hennerich  2012-05-29  743  
e31166f0fd4847 Michael Hennerich  2012-05-29  744  	st->spi = spi;
e31166f0fd4847 Michael Hennerich  2012-05-29  745  	st->pdata = pdata;
e31166f0fd4847 Michael Hennerich  2012-05-29  746  
e31166f0fd4847 Michael Hennerich  2012-05-29  747  	indio_dev->name = (pdata->name[0] != 0) ? pdata->name :
e31166f0fd4847 Michael Hennerich  2012-05-29  748  		spi_get_device_id(spi)->name;
e31166f0fd4847 Michael Hennerich  2012-05-29  749  
e31166f0fd4847 Michael Hennerich  2012-05-29  750  	indio_dev->info = &adf4350_info;
e31166f0fd4847 Michael Hennerich  2012-05-29  751  	indio_dev->modes = INDIO_DIRECT_MODE;
e31166f0fd4847 Michael Hennerich  2012-05-29  752  
f0e64305cf741c Sergiu Cuciurean   2020-09-16  753  	mutex_init(&st->lock);
f0e64305cf741c Sergiu Cuciurean   2020-09-16  754  
e31166f0fd4847 Michael Hennerich  2012-05-29  755  	st->chspc = pdata->channel_spacing;
9404fa15f20e89 Michael Hennerich  2013-06-03  756  	if (clk) {
9404fa15f20e89 Michael Hennerich  2013-06-03  757  		st->clk = clk;
9404fa15f20e89 Michael Hennerich  2013-06-03  758  		st->clkin = clk_get_rate(clk);
9404fa15f20e89 Michael Hennerich  2013-06-03  759  	} else {
e31166f0fd4847 Michael Hennerich  2012-05-29  760  		st->clkin = pdata->clkin;
9404fa15f20e89 Michael Hennerich  2013-06-03  761  	}
e31166f0fd4847 Michael Hennerich  2012-05-29  762  
e31166f0fd4847 Michael Hennerich  2012-05-29  763  	st->min_out_freq = spi_get_device_id(spi)->driver_data == 4351 ?
e31166f0fd4847 Michael Hennerich  2012-05-29  764  		ADF4351_MIN_OUT_FREQ : ADF4350_MIN_OUT_FREQ;
e31166f0fd4847 Michael Hennerich  2012-05-29  765  
e31166f0fd4847 Michael Hennerich  2012-05-29  766  	memset(st->regs_hw, 0xFF, sizeof(st->regs_hw));
e31166f0fd4847 Michael Hennerich  2012-05-29  767  
4a89d2f47ccdce Linus Walleij      2019-12-02  768  	st->lock_detect_gpiod = devm_gpiod_get_optional(&spi->dev, NULL,
4a89d2f47ccdce Linus Walleij      2019-12-02  769  							GPIOD_IN);
9979cc64853b59 Jinjie Ruan        2023-08-28  770  	if (IS_ERR(st->lock_detect_gpiod))
9979cc64853b59 Jinjie Ruan        2023-08-28  771  		return PTR_ERR(st->lock_detect_gpiod);
e31166f0fd4847 Michael Hennerich  2012-05-29  772  
e31166f0fd4847 Michael Hennerich  2012-05-29  773  	if (pdata->power_up_frequency) {
e31166f0fd4847 Michael Hennerich  2012-05-29  774  		ret = adf4350_set_freq(st, pdata->power_up_frequency);
e31166f0fd4847 Michael Hennerich  2012-05-29  775  		if (ret)
e31166f0fd4847 Michael Hennerich  2012-05-29  776  			return ret;
e31166f0fd4847 Michael Hennerich  2012-05-29  777  	}
e31166f0fd4847 Michael Hennerich  2012-05-29  778  
a1a09713b40dfc Antoniu Miclaus    2024-06-21  779  	ret = adf4350_clk_register(st);
a1a09713b40dfc Antoniu Miclaus    2024-06-21  780  	if (ret)
a1a09713b40dfc Antoniu Miclaus    2024-06-21  781  		return ret;
a1a09713b40dfc Antoniu Miclaus    2024-06-21  782  
a1a09713b40dfc Antoniu Miclaus    2024-06-21  783  	if (!st->clkout) {
a1a09713b40dfc Antoniu Miclaus    2024-06-21  784  		indio_dev->channels = &adf4350_chan;
a1a09713b40dfc Antoniu Miclaus    2024-06-21  785  		indio_dev->num_channels = 1;
a1a09713b40dfc Antoniu Miclaus    2024-06-21  786  	}
a1a09713b40dfc Antoniu Miclaus    2024-06-21  787  
9979cc64853b59 Jinjie Ruan        2023-08-28  788  	ret = devm_add_action_or_reset(&spi->dev, adf4350_power_down, indio_dev);
9979cc64853b59 Jinjie Ruan        2023-08-28  789  	if (ret)
65e8202f03224d Waqar Hameed       2025-08-05  790  		return ret;
9404fa15f20e89 Michael Hennerich  2013-06-03  791  
9979cc64853b59 Jinjie Ruan        2023-08-28  792  	return devm_iio_device_register(&spi->dev, indio_dev);
e31166f0fd4847 Michael Hennerich  2012-05-29  793  }
e31166f0fd4847 Michael Hennerich  2012-05-29  794  

:::::: The code at line 717 was first introduced by commit
:::::: 130650e8360fa39919b61eab048c6a724da243d8 iio: frequency: adf4350: Make use of device properties

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
