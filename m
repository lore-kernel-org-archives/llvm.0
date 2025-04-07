Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD86C211A11;
	Mon,  7 Apr 2025 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042383; cv=none; b=Hhf1AoYkl6U83DI5xRZwb11C98H6s2HHMdiWw5jmyQAXeGOw8X45JpfhQ6Lb1ieIP87ummxnPM7BCWUrf5myy16o+3iKeIoV18n88UiqnmgHivO9zypLZP7H/TmcxtshduAWX4v6eAUpRsqDvOr9jtEMV6Y/2+O+sl6kdmwt1vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042383; c=relaxed/simple;
	bh=7NRQROoGi6xdqbP2R4M0Uz5Zs5B5LfACyW4gQA73b3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHVY6sx6c4BBmiKM6ELXm1eCXat3P6s55LG8MUTfwxW1th6dPVFdxBF4/6Ia3WE6cy9gCFjuBgwKCzmgr8VHaCAK32kFwSltMTFLQbaXcI4zlQq+2jEQ60+PZyDF8AqwYSTxGq/Li/Uu728SQqTlCBoIO7fYMa6v7Ui2t+XjuSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7mRTEvY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7mRTEvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744042382; x=1775578382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7NRQROoGi6xdqbP2R4M0Uz5Zs5B5LfACyW4gQA73b3s=;
  b=C7mRTEvYBXToxDa9lJMtrAKa8FGcO6jqpejmwRMi4ppAqmcJ29ZfYzT/
   T812nofAieoAYKsPSWvqKINi9xSxp+IuH+3LeTQ49pAg47VQ+sw5bkd2E
   dk6ffmFDPI1DY9+ZzmurK1EWlj4j8tjOKCR9YLi1fqzIMVwxTAZ2PwO6J
   Mu1uPGgNOgehy0Tw4PX9sDdQrwYV37DyLxopeyHZXPBU/6H7lgl6j6sfg
   HP8PLlqqEpg6jlMXjGDp5BY4XdrYgKTPE+Tcl3oaFhwZwLdvjBUr5qcGr
   y21RylQO5JpHJcHXfhqsjVRym9Iy70u6JhS8BKYB/wXG+igLUoY9oSyjZ
   g==;
X-CSE-ConnectionGUID: H9+UX8nCSMuycyACqbJqXw==
X-CSE-MsgGUID: ZGux659FQOqTaOfsx4702Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="33043297"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="33043297"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:13:00 -0700
X-CSE-ConnectionGUID: pybg/E1uQ0KgOcJ41PlKUA==
X-CSE-MsgGUID: ginmmX3CSqO1+aY969XI7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158990716"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Apr 2025 09:12:58 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1p5j-0003aN-2J;
	Mon, 07 Apr 2025 16:12:55 +0000
Date: Tue, 8 Apr 2025 00:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ds4520: don't check the 'ngpios' property in the
 driver
Message-ID: <202504072320.SjnRj58d-lkp@intel.com>
References: <20250407-gpio-regmap-ngpios-v1-1-5ea63fcbde39@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpio-regmap-ngpios-v1-1-5ea63fcbde39@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-ds4520-don-t-check-the-ngpios-property-in-the-driver/20250407-150804
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250407-gpio-regmap-ngpios-v1-1-5ea63fcbde39%40linaro.org
patch subject: [PATCH] gpio: ds4520: don't check the 'ngpios' property in the driver
config: arm-randconfig-002-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072320.SjnRj58d-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504072320.SjnRj58d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504072320.SjnRj58d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-ds4520.c:43:17: warning: variable 'ngpio' is uninitialized when used here [-Wuninitialized]
      43 |         config.ngpio = ngpio;
         |                        ^~~~~
   drivers/gpio/gpio-ds4520.c:28:11: note: initialize the variable 'ngpio' to silence this warning
      28 |         u32 ngpio;
         |                  ^
         |                   = 0
   1 warning generated.


vim +/ngpio +43 drivers/gpio/gpio-ds4520.c

659ad5f7efece8 Okan Sahin 2023-07-29  22  
659ad5f7efece8 Okan Sahin 2023-07-29  23  static int ds4520_gpio_probe(struct i2c_client *client)
659ad5f7efece8 Okan Sahin 2023-07-29  24  {
659ad5f7efece8 Okan Sahin 2023-07-29  25  	struct gpio_regmap_config config = { };
659ad5f7efece8 Okan Sahin 2023-07-29  26  	struct device *dev = &client->dev;
659ad5f7efece8 Okan Sahin 2023-07-29  27  	struct regmap *regmap;
659ad5f7efece8 Okan Sahin 2023-07-29  28  	u32 ngpio;
659ad5f7efece8 Okan Sahin 2023-07-29  29  	u32 base;
659ad5f7efece8 Okan Sahin 2023-07-29  30  	int ret;
659ad5f7efece8 Okan Sahin 2023-07-29  31  
659ad5f7efece8 Okan Sahin 2023-07-29  32  	ret = device_property_read_u32(dev, "reg", &base);
659ad5f7efece8 Okan Sahin 2023-07-29  33  	if (ret)
659ad5f7efece8 Okan Sahin 2023-07-29  34  		return dev_err_probe(dev, ret, "Missing 'reg' property.\n");
659ad5f7efece8 Okan Sahin 2023-07-29  35  
659ad5f7efece8 Okan Sahin 2023-07-29  36  	regmap = devm_regmap_init_i2c(client, &ds4520_regmap_config);
659ad5f7efece8 Okan Sahin 2023-07-29  37  	if (IS_ERR(regmap))
659ad5f7efece8 Okan Sahin 2023-07-29  38  		return dev_err_probe(dev, PTR_ERR(regmap),
659ad5f7efece8 Okan Sahin 2023-07-29  39  				     "Failed to allocate register map\n");
659ad5f7efece8 Okan Sahin 2023-07-29  40  
659ad5f7efece8 Okan Sahin 2023-07-29  41  	config.regmap = regmap;
659ad5f7efece8 Okan Sahin 2023-07-29  42  	config.parent = dev;
659ad5f7efece8 Okan Sahin 2023-07-29 @43  	config.ngpio = ngpio;
659ad5f7efece8 Okan Sahin 2023-07-29  44  
659ad5f7efece8 Okan Sahin 2023-07-29  45  	config.reg_dat_base = base + DS4520_IO_STATUS0;
659ad5f7efece8 Okan Sahin 2023-07-29  46  	config.reg_set_base = base + DS4520_PULLUP0;
659ad5f7efece8 Okan Sahin 2023-07-29  47  	config.reg_dir_out_base = base + DS4520_IO_CONTROL0;
659ad5f7efece8 Okan Sahin 2023-07-29  48  
659ad5f7efece8 Okan Sahin 2023-07-29  49  	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &config));
659ad5f7efece8 Okan Sahin 2023-07-29  50  }
659ad5f7efece8 Okan Sahin 2023-07-29  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
