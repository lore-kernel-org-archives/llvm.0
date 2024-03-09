Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2A924A12;
	Sat,  9 Mar 2024 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710008319; cv=none; b=WF3chlbX1HyT5rUACtXMeGux+KH39+nkWpRFl7LnCY78KW+Zm4d6qPbEcR/NidwU7tbcGPV4bWpYoQdpuejZJBlGNTNK8WkF7rghczpo3+5P9KPm/eOr3bG828OT1ZpYBs3et2/Gp28yV6IsziNh8TruOkD8NbkjaQYz1SPmv30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710008319; c=relaxed/simple;
	bh=qTGhDy+vIDlsIBOvVoJcmH8QuQopBreaGm6kLFiyf5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2r8AiUJ9vg6om0gpXkV+rRz/YJ1Op5aCvtFvYqk0sZ8D41SCzUnSovDjxkt3eRGKaGJLTddbODCCogIsL456P+L/PrkJGVSjlrIqNmAby9+XWZXRAG1HC8t8/plesHqeil6meOifmOeVB27qofK9M+DCeEseMxetj9eBeHSuSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Px0JF3h3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Px0JF3h3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710008317; x=1741544317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qTGhDy+vIDlsIBOvVoJcmH8QuQopBreaGm6kLFiyf5w=;
  b=Px0JF3h3IQXWn5OOrQf3Eqf019p+p4h17MIdthJshRbQmLfYAL9OANIp
   52CpwEZ2PIpWG1IpMdJH5C3ThxRhXpk440IkAAZKG02j2DoKH6ud7Vu7R
   tB7zZi+XaJ+I5aUKNTeV5LRplMHbjyCfzaKUcRH0nHxvBbQvHhTF0RDDS
   wXFHDdFf0TpU1RNZG8FlK+tJJzbVkg5rCVk3eFZggMAI0V9O+d+2gmRLF
   EZVyaQxjNJKNSmKxAFgTkx1p5Wcv6t4vEM0llB/VKzgAK447L6yvkmCqv
   lJpvzTbFqFyydXMHLOMEplcoVQcTEOhMupiGa3/htmkyaLI8jZkMdo3dW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4895575"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="4895575"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 10:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="33917428"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Mar 2024 10:18:35 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj1HF-0007Zh-0M;
	Sat, 09 Mar 2024 18:18:33 +0000
Date: Sun, 10 Mar 2024 02:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/277 1/1] drivers/power/supply/macsmc_power.c:520:56:
 error: unexpected ';' before '}'
Message-ID: <202403100254.Jj0p94ja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/277
head:   aeba5500b9346eeb8a6aed58c087fdbd931c6532
commit: aeba5500b9346eeb8a6aed58c087fdbd931c6532 [1/1] power: supply: macsmc_power: Report available charge_behaviours
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240310/202403100254.Jj0p94ja-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100254.Jj0p94ja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100254.Jj0p94ja-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/power/supply/macsmc_power.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/power/supply/macsmc_power.c:520:56: error: unexpected ';' before '}'
     520 |                                 | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE);
         |                                                                                    ^
>> drivers/power/supply/macsmc_power.c:518:3: error: field designator 'charge_behaviours' does not refer to any field in type 'const struct power_supply_desc'
     518 |         .charge_behaviours      = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     519 |                                 | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     520 |                                 | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings and 2 errors generated.


vim +520 drivers/power/supply/macsmc_power.c

   509	
   510	static const struct power_supply_desc macsmc_battery_desc = {
   511		.name			= "macsmc-battery",
   512		.type			= POWER_SUPPLY_TYPE_BATTERY,
   513		.get_property		= macsmc_battery_get_property,
   514		.set_property		= macsmc_battery_set_property,
   515		.property_is_writeable	= macsmc_battery_property_is_writeable,
   516		.properties		= macsmc_battery_props,
   517		.num_properties		= ARRAY_SIZE(macsmc_battery_props),
 > 518		.charge_behaviours	= BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
   519					| BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE)
 > 520					| BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE);
   521	};
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
