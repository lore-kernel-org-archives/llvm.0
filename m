Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D381C1DF97E;
	Wed, 13 Nov 2024 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731501674; cv=none; b=lGBrr0EIBy1qwL+8il1h8mhxv0+q0Vd7GRS5JnKlT43pr618CCcTTwm18KyrVDNAQym0UOtq8aRsCEZMTE7zsytyniYfY1e5ZjiSqH+5Mc+nbdm9uk9qQ7r2tSQjwGbA+Z/+Tq7drUcCPtREssvhyh6MI/soQNp4l548U2uDaQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731501674; c=relaxed/simple;
	bh=27FWXaDdzwaUofkwddKg9sR1t3DRIWuLQt9yPeJVYwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tlS9J45ymKDqpmMyQh0UVzSjFnF88YIf44fjDYS/yhaulyPdHtmlCrIS0NXFlh5Yq4SceQQPKiBdhAAEKPj9o0+XyU1an5ls2HnXs14XwrlLq0Ux6+w/Zgdbaz7kEsU9yUAjOvOrKkJhV9KDrpPmPVAIm7g6x7YTnrsVN/jMdY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DcrFhjJr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcrFhjJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731501673; x=1763037673;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=27FWXaDdzwaUofkwddKg9sR1t3DRIWuLQt9yPeJVYwk=;
  b=DcrFhjJrKJFzFumTIZzi7UFragU8cBNlZlH0/HzfsT4u7aDEVy+7H82y
   RCEBN7ManRPURCpyxjaxgyAieojlGSTz4qmH5hoURf+mnltvUy4zqnyjD
   VuDrp+8paJdm0xS79x/Ep0Fs42xrPeu4gmH47dYfaefF7JSWLMb9veidO
   slj+Bui9ZQulB51tCVcYZlJ2bZEluzSylrMTotj+u/3KOKy8xHcGzC0MN
   p+T4ngO/sWR10aV1qyso39FXqZddV/sJyCngzXFS4QzgxKdAOVwSa+ztk
   yUdySId/5dLH7LD1YEJBobzTFOG4hDvBj9pZmMZ4KKfHkT1B0fL9Al+8Q
   g==;
X-CSE-ConnectionGUID: 0OhKBFxFTHiiNSzCdujrsg==
X-CSE-MsgGUID: 7kfyZgAzQPai8kmcNJU31A==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30784411"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="30784411"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 04:41:12 -0800
X-CSE-ConnectionGUID: WPHuTR2uQS6XMPMZf5KGDg==
X-CSE-MsgGUID: 2NORfINmT3yPYY/PR+8rLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87431172"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2024 04:41:11 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBCgH-0000Nv-00;
	Wed, 13 Nov 2024 12:41:09 +0000
Date: Wed, 13 Nov 2024 20:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hwmon-thermal 2/2]
 drivers/hwmon/hwmon.c:291:4: error: call to undeclared function
 'thermal_zone_device_update'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202411132024.qjTUd8Cq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hwmon-thermal
head:   62f918135d3a460bea6c9e74d19af6af41602ed3
commit: 62f918135d3a460bea6c9e74d19af6af41602ed3 [2/2] hwmon: (core) Avoid ifdef in C source file
config: i386-buildonly-randconfig-002-20241113 (https://download.01.org/0day-ci/archive/20241113/202411132024.qjTUd8Cq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411132024.qjTUd8Cq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411132024.qjTUd8Cq-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> drivers/hwmon/hwmon.c:291:4: error: call to undeclared function 'thermal_zone_device_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     291 |                         thermal_zone_device_update(tzdata->tzd,
         |                         ^
   1 warning and 1 error generated.


vim +/thermal_zone_device_update +291 drivers/hwmon/hwmon.c

44e3ad882bb2685 Akinobu Mita     2020-05-04  280  
1597b374af22266 Guenter Roeck    2020-05-28  281  static void hwmon_thermal_notify(struct device *dev, int index)
1597b374af22266 Guenter Roeck    2020-05-28  282  {
1597b374af22266 Guenter Roeck    2020-05-28  283  	struct hwmon_device *hwdev = to_hwmon_device(dev);
1597b374af22266 Guenter Roeck    2020-05-28  284  	struct hwmon_thermal_data *tzdata;
1597b374af22266 Guenter Roeck    2020-05-28  285  
62f918135d3a460 Thomas Weißschuh 2024-11-13  286  	if (!IS_ENABLED(CONFIG_THERMAL_OF))
62f918135d3a460 Thomas Weißschuh 2024-11-13  287  		return;
62f918135d3a460 Thomas Weißschuh 2024-11-13  288  
1597b374af22266 Guenter Roeck    2020-05-28  289  	list_for_each_entry(tzdata, &hwdev->tzdata, node) {
1597b374af22266 Guenter Roeck    2020-05-28  290  		if (tzdata->index == index) {
1597b374af22266 Guenter Roeck    2020-05-28 @291  			thermal_zone_device_update(tzdata->tzd,
1597b374af22266 Guenter Roeck    2020-05-28  292  						   THERMAL_EVENT_UNSPECIFIED);
1597b374af22266 Guenter Roeck    2020-05-28  293  		}
1597b374af22266 Guenter Roeck    2020-05-28  294  	}
1597b374af22266 Guenter Roeck    2020-05-28  295  }
1597b374af22266 Guenter Roeck    2020-05-28  296  

:::::: The code at line 291 was first introduced by commit
:::::: 1597b374af22266266e1e20612208c4b11359ad4 hwmon: Add notification support

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
