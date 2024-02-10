Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708123D0AD;
	Sat, 10 Feb 2024 11:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707564803; cv=none; b=ZgvraKHq/K1Usr33mJmcbgT1AMCx3XjaG8cI7cBgqD6gyn2lfZjJM6djiYm7cML/8UWNhk1uIVd2V6slu1271fRcrhjAlcR9kL2akVB+nB8wa95GlqpiJ0QWIFv5e7BGEHyd0Q3vdK/DV6gfjQ6+Fl20nqJRfCpmWxX+IVC83Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707564803; c=relaxed/simple;
	bh=ARSQGm2CJQFN1W4YwhGMDna2utCYZM7M42txnPY2UYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L7WPFzd2A9tZzMSgtlKS4R2KvfcSLZriVpaXu0tACQ7XS5hIrB/IudPYLdm2fIVSTeZIs5E7plSbE/9oS13s1l5jdfw05d3K/k5yn0xPl07Lc6jJ3+Ld7Og6XP8gAJgKErMxBjF8n1zN0VlrEiFSVfsS3MiqaMSvUJhn+k8uqSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AH122EQL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AH122EQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707564802; x=1739100802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ARSQGm2CJQFN1W4YwhGMDna2utCYZM7M42txnPY2UYQ=;
  b=AH122EQLGjAyUIQQJ8o3AL0FfyyhkFKVzfLTgrzbDQxB9s27UiirNKWP
   OeG7FQT9NDqmLcT/XKui2o9MwaUgZ46BIwXRUJoGyUtXvjVKgqyZb/1qI
   TVxMm9vy6N+kNw1gZnIlUHdMt4YoaSDkOGcb8JqK6yKPLRrXvCKxfzTBp
   WFewSvZXemM63PbQm5VE17J/EhMAfOBYHBG1s8wMJv/FaEPZplczW61i6
   mm+gjt5GEYx+lVWS9FyLbY7vQXzO0ifO8b639nCWSDQp+/A3ZkX8895Jj
   X/t4ESz09fP1wpauJmNLFYuJBy0wPE3IagGdvCfNcrN6kpBQ9lsbdl+lI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1444789"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1444789"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 03:33:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="33239087"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2024 03:33:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYlbf-0005bq-1R;
	Sat, 10 Feb 2024 11:33:15 +0000
Date: Sat, 10 Feb 2024 19:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ukleinek:pwm-lifetime-tracking 66/159]
 drivers/pinctrl/intel/pinctrl-intel.c:1503:6: error: incompatible pointer
 types assigning to 'struct pwm_lpss_chip *' from 'struct pwm_chip *'
Message-ID: <202402101951.fvAOuKFi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm-lifetime-tracking
head:   f10ff6c7e1f341afe7f15a1f5f53379a0752bcb0
commit: 82415fb0b6b61675cdd5c9c252c71634d986c613 [66/159] pwm: lpss-*: Make use of devm_pwmchip_alloc() function
config: i386-buildonly-randconfig-003-20240210 (https://download.01.org/0day-ci/archive/20240210/202402101951.fvAOuKFi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101951.fvAOuKFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101951.fvAOuKFi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/intel/pinctrl-intel.c:1503:6: error: incompatible pointer types assigning to 'struct pwm_lpss_chip *' from 'struct pwm_chip *' [-Werror,-Wincompatible-pointer-types]
    1503 |         pwm = devm_pwm_lpss_probe(pctrl->dev, community->regs + PWMC, &info);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1503 drivers/pinctrl/intel/pinctrl-intel.c

7981c0015af263 Mika Westerberg 2015-03-30  1485  
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1486  static int intel_pinctrl_probe_pwm(struct intel_pinctrl *pctrl,
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1487  				   struct intel_community *community)
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1488  {
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1489  	static const struct pwm_lpss_boardinfo info = {
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1490  		.clk_rate = 19200000,
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1491  		.npwm = 1,
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1492  		.base_unit_bits = 22,
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1493  		.bypass = true,
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1494  	};
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1495  	struct pwm_lpss_chip *pwm;
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1496  
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1497  	if (!(community->features & PINCTRL_FEATURE_PWM))
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1498  		return 0;
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1499  
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1500  	if (!IS_REACHABLE(CONFIG_PWM_LPSS))
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1501  		return 0;
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1502  
eb78d3604d6bcb Andy Shevchenko 2022-11-17 @1503  	pwm = devm_pwm_lpss_probe(pctrl->dev, community->regs + PWMC, &info);
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1504  	return PTR_ERR_OR_ZERO(pwm);
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1505  }
eb78d3604d6bcb Andy Shevchenko 2022-11-17  1506  

:::::: The code at line 1503 was first introduced by commit
:::::: eb78d3604d6bcbe9743e036114c33a5a17090a0a pinctrl: intel: Enumerate PWM device when community has a capability

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
