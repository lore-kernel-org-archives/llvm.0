Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ACA18C008;
	Sat, 16 Nov 2024 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731799282; cv=none; b=P1QJ/NpaFn88N12uXu+B4FXS9jTVwF/qW2IslTy3jfVDibtTBdBI7h4iHzK4t+8XXhwDcpG558xjIHqyN1kTYY7Lwg5a+Dd4hvTK79fYSgDe8zFOaSXTN/6OxVBz1nsR0tTd9vUqRNsoYyeIxt19JFGgKx6bKkueq4eILsg8uOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731799282; c=relaxed/simple;
	bh=ikX2yoYOYRQ8RiG+71LUSv1FdTjHPo1fs4MlRSblGSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KmFmiO75+chPt5k9MhA19JbxMZBG8NVYSJMV4yIZW+Shn7GOw5OFT0Ct9LUmLbnm/RVyW9U8MIYIU53Wf188eMospCttozdzHGeN8PGjTsejBrQSlhdO9d7pvuNDwQQSU7PpSNGb8KW5ePeFa6Sol0+zJ4KMZZNfDaXv693fCDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPjd2cjF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPjd2cjF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731799281; x=1763335281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ikX2yoYOYRQ8RiG+71LUSv1FdTjHPo1fs4MlRSblGSI=;
  b=UPjd2cjFokpN40bWwC6VE3fnZ0TDD6D0w8XpaKrV2Kmgw5leld0S/8CJ
   A0dha5+IdA5Zmj5v9fK4uXCJO9KZJR08YmR64I47iVR/sW+Oscu7fuhWl
   jOj/bWxIXksYB0oE6duRlONxCZgjkKJg56nVy9xapUurBOUCEfngW08Ii
   EFBdb/ZDNuL4nxXGS6Q5m+9nF/p822kdxxakDQxJIjFQhDE5qUPyTkwG+
   sSA4944odrRp3wQ+iRvGW6MxOP+HfAJV6i5EiqCFM+DxrbbYCxOMaZObD
   KlqFcomEoTDR9iC3yUIVm0s8pXkSQGfVWqh18so2YPoLoWdjzKZrFwUBa
   w==;
X-CSE-ConnectionGUID: bkFACoZxQ7C2WwjBxnyTeA==
X-CSE-MsgGUID: 0wCtNHHzSkOiyA6Omd6miQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31534952"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31534952"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 15:21:21 -0800
X-CSE-ConnectionGUID: 1/ynm51SSdGTaduoTuYUGQ==
X-CSE-MsgGUID: yEymUa0TQcSNAdI8mPVraQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="126419797"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2024 15:21:19 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCS6O-0001AH-1n;
	Sat, 16 Nov 2024 23:21:16 +0000
Date: Sun, 17 Nov 2024 07:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hwmon-thermal 2/3]
 include/linux/thermal.h:292:75: warning: omitting the parameter name in a
 function definition is a C23 extension
Message-ID: <202411170759.O3omfgat-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hwmon-thermal
head:   cabfa33b49cc42e6b5648560d9813c16fa1e94d1
commit: a020a527900a03dc4215f48ba0f37329a04a1cc0 [2/3] thermal: core: Add stub for thermal_zone_device_update()
config: arm-lpc18xx_defconfig (https://download.01.org/0day-ci/archive/20241117/202411170759.O3omfgat-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170759.O3omfgat-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170759.O3omfgat-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/hwmon.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/hwmon/hwmon.c:26:
>> include/linux/thermal.h:292:75: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     292 | static inline void thermal_zone_device_update(struct thermal_zone_device *,
         |                                                                           ^
   include/linux/thermal.h:293:37: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     293 |                                               enum thermal_notify_event)
         |                                                                        ^
   3 warnings generated.


vim +292 include/linux/thermal.h

   291	
 > 292	static inline void thermal_zone_device_update(struct thermal_zone_device *,
   293						      enum thermal_notify_event)
   294	{ }
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
