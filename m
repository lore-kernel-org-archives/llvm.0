Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F69C20E033;
	Wed, 12 Feb 2025 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739366820; cv=none; b=McgZ7T6Ju3jNjMgMrAd6ExZhGKQmYsMtk87mBrEUdSPwq2rIelSmVNb0IE7xHSvSlVu28oLEM/AWB6HNx8cDTUpNFGYjNecI4AI3HqxdeLd451MU7rHj+XGmaTY2mBlzKYhMpgltKrkDJQDiU/u2TMVf7pem/1jhFTCGG31awAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739366820; c=relaxed/simple;
	bh=bkXdmxCxZsDHk3Y05ARA4UQDiBcjf3UwW9xdZH1Iiik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwo2hOEY/m1XDCC3qTqe0RwVt5he97JC2g4BoX6Y63RApRCa5axMIrwZ03CM3E6MXYiMk+8E78Rwup1faZIqbietnZbhOfFoieGrfMN5OGBXnTAzX0WQoa78o7uIrN6gLW1MIPAvrSMZeR0XoYigbYa6GskXIqvs8AxeI/jFAgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrT7U/PX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrT7U/PX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739366820; x=1770902820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bkXdmxCxZsDHk3Y05ARA4UQDiBcjf3UwW9xdZH1Iiik=;
  b=HrT7U/PXNkU4N5u8S+pFzmwQ/H4KKpUx0FzDrLQ4wCJkDO8g5L1ItGX0
   a4B4qstNRe1+Mj1iolWAFgx3Zn6UeISwPQ6Ya/NNWtwwnXM3n4mVqKIDd
   cI1Vvy6aK+CQGhLK7p9fTwBevI0XbSQ4NJPqmwb5taknSYZSKvDKgHw7U
   wWzaA3SYg5q8JiMeEhIh08Jm8k5R28R1Y4TxOQmGXIfN777kogOWDTXPx
   bt21GF/vIAqde45ZySBNnfRj0MksyjZO09Vf/jv54D3sGH3Whvt2dJk1g
   bslYEkv5EozHIoZcSliFdEabypAbMg5D9uV3sMM6yUq31nwt7CE6zl9mv
   A==;
X-CSE-ConnectionGUID: 25RabCyVQTeJdfH1Tzc2Xw==
X-CSE-MsgGUID: cmv8Fu9/Qm61RqEReY4Q1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27617279"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="27617279"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 05:26:57 -0800
X-CSE-ConnectionGUID: imw32EpcR822tBT37IxG4g==
X-CSE-MsgGUID: 1TPyhM8qQ/m2nv0IUNI+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="113327526"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Feb 2025 05:26:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiClQ-0015eB-15;
	Wed, 12 Feb 2025 13:26:52 +0000
Date: Wed, 12 Feb 2025 21:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Keerthy <j-keerthy@ti.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 01/14] gpiolib: make value setters have return values
Message-ID: <202502122145.IvWgtz8V-lkp@intel.com>
References: <20250211-gpio-set-retval-v1-1-52d3d613d7d3@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-gpio-set-retval-v1-1-52d3d613d7d3@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on df5d6180169ae06a2eac57e33b077ad6f6252440]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpiolib-make-value-setters-have-return-values/20250211-201426
base:   df5d6180169ae06a2eac57e33b077ad6f6252440
patch link:    https://lore.kernel.org/r/20250211-gpio-set-retval-v1-1-52d3d613d7d3%40linaro.org
patch subject: [PATCH 01/14] gpiolib: make value setters have return values
config: s390-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250212/202502122145.IvWgtz8V-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502122145.IvWgtz8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502122145.IvWgtz8V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-aw200xx.c:382:2: warning: void function 'aw200xx_disable' should not return a value [-Wreturn-type]
           return gpiod_set_value_cansleep(chip->hwen, 0);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/aw200xx_disable +382 drivers/leds/leds-aw200xx.c

d882762f7950c3 Dmitry Rokosov 2023-11-25  379  
d882762f7950c3 Dmitry Rokosov 2023-11-25  380  static void aw200xx_disable(const struct aw200xx *const chip)
d882762f7950c3 Dmitry Rokosov 2023-11-25  381  {
d882762f7950c3 Dmitry Rokosov 2023-11-25 @382  	return gpiod_set_value_cansleep(chip->hwen, 0);
d882762f7950c3 Dmitry Rokosov 2023-11-25  383  }
d882762f7950c3 Dmitry Rokosov 2023-11-25  384  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
