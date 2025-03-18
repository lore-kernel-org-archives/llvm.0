Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA260175D47;
	Tue, 18 Mar 2025 06:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742277893; cv=none; b=I6LsWwOzDk1PLKyQeJ2h4YFoMsVM175KvLS4iEIxVf/l5HkL3MCDwlmhiIPSVXuxXVlt5TAP0bMIozsIDch2eeDY4ugC+OzBAe5dePKuIGkFqaviu54b2Ss2tcYne8NI712vxaDZLiII4ls1uR2RaOvT5qVSXURBrHU2qY3dJk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742277893; c=relaxed/simple;
	bh=BlRLEFdWsuBBz31H/uqbH7HRno/06bxYHJWxTHY3eVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4bnsE8H+pRkOIZDiLChwKpXsgX47xe/CKCMJVjHFvRB4pAaXG1mFLhkHpRPs81tvPBcChW7C+uX91Tu+qeF6d2Pgyd1O/aya8Qe9VXmLp9kdqkjtnrx6gnCd3FgEWl6s3qh5w3MYRiw2mVzoZsHiX2iOEnxlps3IDYkmvaBBvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fu7sP/YD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fu7sP/YD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742277892; x=1773813892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BlRLEFdWsuBBz31H/uqbH7HRno/06bxYHJWxTHY3eVw=;
  b=Fu7sP/YDS16rnj4iChj1XZlOB53XMyahm5qFH87M2dnYpgLdS4vI32Cx
   MW/jOvF1CcTqZVAYp4aJlJHObqm/DytH4ZynsJyrPEubhNR8djObtjN9g
   MWjZYc1DWv2CT8ELFL/7wysCCARFp/T8atMJFM2Qs3nv1bvdXv5GazPJR
   wUDdqrGEdYBypO9pd8R1ykE+3GLm9iwWbDtmcgFRRVsgQXqJP3yDkBL8D
   GKkYhO8Vdyya5rinx4CPv2ORNTSTzOAZT8f3Y01aZ//djoATP+fx2I8tG
   DgdgOzSzVcCBIJId5b9Y8uv9zHTFMq0KFt7Ogd87guw3+tNXD2dTwqkED
   w==;
X-CSE-ConnectionGUID: CnVuH+zXSxy+xQhF2kgiNg==
X-CSE-MsgGUID: YzHqXcd/QbCHcCRcQw3w1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54775780"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="54775780"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 23:04:51 -0700
X-CSE-ConnectionGUID: S2bVeloPR7maZM5rrIqknA==
X-CSE-MsgGUID: n024GdPLR4StpQcDUu0nyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122174319"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Mar 2025 23:04:50 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuQ3A-000DS3-12;
	Tue, 18 Mar 2025 06:04:05 +0000
Date: Tue, 18 Mar 2025 14:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 1/6] gpiolib: add gpiochip_add_pin_range_sparse()
 function
Message-ID: <202503181221.ubMklVAA-lkp@intel.com>
References: <20250317-aaeon-up-board-pinctrl-support-v2-1-36126e30aa62@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-aaeon-up-board-pinctrl-support-v2-1-36126e30aa62@bootlin.com>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 12b58398bffc23db89e715414399b0533255da51]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Richard/gpiolib-add-gpiochip_add_pin_range_sparse-function/20250317-234321
base:   12b58398bffc23db89e715414399b0533255da51
patch link:    https://lore.kernel.org/r/20250317-aaeon-up-board-pinctrl-support-v2-1-36126e30aa62%40bootlin.com
patch subject: [PATCH RFC v2 1/6] gpiolib: add gpiochip_add_pin_range_sparse() function
config: i386-buildonly-randconfig-006-20250318 (https://download.01.org/0day-ci/archive/20250318/202503181221.ubMklVAA-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181221.ubMklVAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181221.ubMklVAA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpiolib.c:2320: warning: Function parameter or struct member 'pins' not described in 'gpiochip_add_pin_range_sparse'
>> drivers/gpio/gpiolib.c:2320: warning: Excess function parameter 'pin_list' description in 'gpiochip_add_pin_range_sparse'


vim +2320 drivers/gpio/gpiolib.c

  2300	
  2301	/**
  2302	 * gpiochip_add_pin_range_sparse() - add a range for GPIO <-> pin mapping
  2303	 * @gc: the gpiochip to add the range for
  2304	 * @pinctl_name: the dev_name() of the pin controller to map to
  2305	 * @gpio_offset: the start offset in the current gpio_chip number space
  2306	 * @pin_list: the list of pins to accumulate in this range
  2307	 * @npins: the number of pins to accumulate in this range
  2308	 *
  2309	 * Calling this function directly from a DeviceTree-supported
  2310	 * pinctrl driver is DEPRECATED. Please see Section 2.1 of
  2311	 * Documentation/devicetree/bindings/gpio/gpio.txt on how to
  2312	 * bind pinctrl and gpio drivers via the "gpio-ranges" property.
  2313	 *
  2314	 * Returns:
  2315	 * 0 on success, or a negative errno on failure.
  2316	 */
  2317	int gpiochip_add_pin_range_sparse(struct gpio_chip *gc, const char *pinctl_name,
  2318					  unsigned int gpio_offset, unsigned int const *pins,
  2319					  unsigned int npins)
> 2320	{
  2321		return __gpiochip_add_pin_range(gc, pinctl_name, gpio_offset, 0, pins,
  2322						npins);
  2323	}
  2324	EXPORT_SYMBOL_GPL(gpiochip_add_pin_range_sparse);
  2325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
