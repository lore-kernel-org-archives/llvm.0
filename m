Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE3B9454;
	Sun, 17 Nov 2024 00:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731803066; cv=none; b=gJ4Q5UuqWIKJJ51OmI+8xduT/faaKwUiDaoLsVKQB4ty5l6qAmPvYiMiU4nsLc2vERNPPVSrmjrw+jcAzrQ4g0qhVycHlUtyLwNVVl+aCY7PPbSRB28rwFRg5zwp3xWOZi6FqpDoODUqjqPButbnZ1zJjcqHQYcp7ohVfX6Hi+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731803066; c=relaxed/simple;
	bh=zHXVD/+Y97QcYT+zoO4ECZr7sn84GkiwwXWpQz6QsO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XgStVFZtvpaiWW+d9l8Km/QudMHvghK/XRnNf6IsMRC9gvtnhpCzJN5UWEa3er6NHcAcN1tRLwOgw9C08N8xJuwWDFYNPt7MlQKLpu0KnmMOz1aD0c7yf/LXCF8evB8kobqFSUY8bQK5oRje7bxnBB0hTkL40LEoAIMOnr8Xw+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lk7iMAiA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lk7iMAiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731803064; x=1763339064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zHXVD/+Y97QcYT+zoO4ECZr7sn84GkiwwXWpQz6QsO0=;
  b=lk7iMAiAIR8CeX4iuy6LGrV436k0T/j7wjtORAh+55Ys70iUDY4URgTj
   emA1KKYWAN+L3yWAnUCIyQyPM1O8NxELnpNvsM1TNec6QCVsoRMp88uxU
   zvKWg0ClvFHwA7wY1qw4/XZddKQrM3UaRq3c2DDcDDuLSpGM+j9gUHeFI
   6H1O5V9//dk6J8u455jJRT5ABdfJTPl+vReo80+O7sZqK1jH05jz8uGHq
   85x8zRQG/KQRv6O25ge/ObImzyWCf8Drw1LTlaA8Xyop6/vxgtl0obLkg
   JYSayxCecRpFjLaLI6yZylcihL38YUXgw4DtIQBt5vevXVoP5M3TUUquI
   A==;
X-CSE-ConnectionGUID: AbUpeYmRRY6zbDxsCa2Pnw==
X-CSE-MsgGUID: mI8jAMUsQTG3R7E4KCp8sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31536532"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31536532"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 16:24:24 -0800
X-CSE-ConnectionGUID: 17HIyrSjRxKtQ81gk3H5wg==
X-CSE-MsgGUID: 7kopQyAsRiqSfzv/dF3mHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="89280489"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Nov 2024 16:24:23 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCT5Q-0001BZ-3A;
	Sun, 17 Nov 2024 00:24:20 +0000
Date: Sun, 17 Nov 2024 08:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hwmon-thermal 2/3]
 include/linux/thermal.h:292:75: warning: omitting the parameter name in a
 function definition is a C2x extension
Message-ID: <202411170844.ytkewvwU-lkp@intel.com>
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
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241117/202411170844.ytkewvwU-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170844.ytkewvwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170844.ytkewvwU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/gpio-fan.c:23:
>> include/linux/thermal.h:292:75: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline void thermal_zone_device_update(struct thermal_zone_device *,
                                                                             ^
   include/linux/thermal.h:293:37: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
                                                 enum thermal_notify_event)
                                                                          ^
   2 warnings generated.


vim +292 include/linux/thermal.h

   291	
 > 292	static inline void thermal_zone_device_update(struct thermal_zone_device *,
   293						      enum thermal_notify_event)
   294	{ }
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
