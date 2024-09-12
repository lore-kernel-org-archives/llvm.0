Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452FA17DFF5;
	Thu, 12 Sep 2024 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726180528; cv=none; b=rEdPfDEBZaYkNhRZBakNv+VWbiEsZj7F9dO5CfGh+7EG9s8wW5nJfKqrI8YViQb5TNJQ6HEgbXEnfHE21csbJauiy2qI7ejcxUeBAlVTyjm8/FuNFnqs9QhnTgyEbSprsK3fRBR23tHl6ituZ5yzrlhMyd6Iz6Z0zQhJl9rRkR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726180528; c=relaxed/simple;
	bh=wuIELZcEof8EAfoBjEWh2KFq19kR4h+BfHve4ep/mrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DtW3lm+N/dj3nMMSp0T9tkRbUWFPDh5XsfIfs1o27TdsAf7U5ZTnUCJivrQptuVaftGzlBrKUunSjBOkSK6tE2rs0AmEssV13ImZ2NR9FHnvbzglHawBRTQIE4UCU5gG26INW+o0JamdXXqd7TU8LOfMqv+6auzhhqHg4qbibEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDPzrPRX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDPzrPRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726180527; x=1757716527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wuIELZcEof8EAfoBjEWh2KFq19kR4h+BfHve4ep/mrE=;
  b=SDPzrPRXJWFa2ypXOcVWuh7d88brok4kUTN7N9Cd1I3RXah21DB3Mw03
   ODT886nxekxlGhb3bYXsp/fMcI9OsprRLSZtOQfxnOuBE0SZnD3UR8Lsy
   c2Oy2UtjGBll3UpvquiqcUGhf1DzMIjA2YKT3h916wr56E11MFOYhPsVI
   0FLo/g9Yr9+HP7z5fQhZYNHMDdF4iLDN1Q5KHzwvJoNsr4fw1dKODoKQs
   Vu+UEEgThUZOoiA12IVGjG4slQ4X6RKFu0T0GaEWhvlc2xhAl4KsZ9jLS
   sGL0lmxL6dGacarhYCd1LGDRFD1PTxXW0iaHBO4JkKVWzJv8DZLH7CmBy
   A==;
X-CSE-ConnectionGUID: EJife8ESSMeR4bfxBXl13w==
X-CSE-MsgGUID: QlyrZmDtTn6tp7uhSacbMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35655345"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="35655345"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 15:35:26 -0700
X-CSE-ConnectionGUID: hiAirQFtSGS+mBZl7t9oeQ==
X-CSE-MsgGUID: 4VAvA29oTw2t6Evp0EQ2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="68374426"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Sep 2024 15:35:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sosPK-0005mQ-0V;
	Thu, 12 Sep 2024 22:35:22 +0000
Date: Fri, 13 Sep 2024 06:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-soc 13/13]
 drivers/cpuidle/cpuidle-apple.c:153:13: warning: variable 'pdev' is
 uninitialized when used here
Message-ID: <202409130612.wWkyxkkx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-soc
head:   0be532d0b8c8e4c9d35c7a7b2199e9296d8f68a8
commit: 0be532d0b8c8e4c9d35c7a7b2199e9296d8f68a8 [13/13] cpuidle: apple: Do not load on unsupported Apple platforms
config: arm64-randconfig-004-20240913 (https://download.01.org/0day-ci/archive/20240913/202409130612.wWkyxkkx-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130612.wWkyxkkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130612.wWkyxkkx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cpuidle/cpuidle-apple.c:14:
   In file included from arch/arm64/include/asm/cpuidle.h:8:
   In file included from arch/arm64/include/asm/arch_gicv3.h:17:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/cpuidle/cpuidle-apple.c:153:13: warning: variable 'pdev' is uninitialized when used here [-Wuninitialized]
     153 |                 dev_info(&pdev->dev, "cpuidle unavailable CPU does not retain state in deep WFI\n");
         |                           ^~~~
   include/linux/dev_printk.h:160:46: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/cpuidle/cpuidle-apple.c:142:30: note: initialize the variable 'pdev' to silence this warning
     142 |         struct platform_device *pdev;
         |                                     ^
         |                                      = NULL
   2 warnings generated.


vim +/pdev +153 drivers/cpuidle/cpuidle-apple.c

   139	
   140	static int __init apple_cpuidle_init(void)
   141	{
   142		struct platform_device *pdev;
   143		int ret;
   144	
   145		ret = platform_driver_register(&apple_cpuidle_driver);
   146		if (ret)
   147			return ret;
   148	
   149		if (!of_machine_is_compatible("apple,arm-platform"))
   150			return 0;
   151	
   152		if (!FIELD_GET(DEEP_WFI_STATE_RETENTION, read_sysreg(aidr_el1))) {
 > 153			dev_info(&pdev->dev, "cpuidle unavailable CPU does not retain state in deep WFI\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
