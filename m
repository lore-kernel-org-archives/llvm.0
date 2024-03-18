Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEFF5A790;
	Mon, 18 Mar 2024 22:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710801799; cv=none; b=Zk+UdDjRHkxMM3ftitr8uLjXJM7TIE8uC4pC4Du+Ym9N/UPXkfUBZRO8Lo4pci5UqyD8GFBsm9uxaE4jUupMDyjwBBUWzxPQ+apjw00HucKH/bdEYB2yGpD5Vn0F1l27gw9jn4w0155fxfq8LSf3Dgj5to0dlAghLBEPF0YOvrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710801799; c=relaxed/simple;
	bh=ZB4Y0Im1Pmve8oPKTWzkIF5OjzBbiD9cY5nLcjTuxb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIJSVLie8/5aYbweMvnn5FVKs1uva+d6oexF6KUaoFVToIyEzXgAfrCt9i396Hb9gWz44mlas01jWYiFe3H8RKEppEId9OozwJ4zHy8mE2bvD4EQ2OEY29V1hmbhRVwkLgfccKgR0jb4MJD1sOZQ2vA1OPml/VY4jPwyrZN922w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKmD6XZv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKmD6XZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710801798; x=1742337798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZB4Y0Im1Pmve8oPKTWzkIF5OjzBbiD9cY5nLcjTuxb4=;
  b=YKmD6XZv1kPIX8brBv0Dznzv/7a1RNA4wMQC4K3OuM0arldt2y3mXPcy
   lbnUPfmnoDLv9hCEOtk2zIZKsQL+hxTWoxuE0xWqeY3DthPmXk7IvZFQb
   vd/Qo42bInn1dMWXEaOezBm2Zsokl2g7EqlB5dZQ5DYr4oPk7YsQCK3gT
   tZzAGTiOCvJ1Rd57Dl2l/of49YdcvOHJA1O6fFCtK3aiD+Omn/cbxtJK8
   y3YBFZ7zK/D8W1sD+a+qCliN0eJo7JVQJVdl0G9D53iK2CSr4tcJ24anU
   2SipMQEa3kC/6heckv9xwAWlTuNypKDX3FzVGdifRvLoOjv73XYAiWvxS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16791058"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="16791058"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 15:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="13588597"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Mar 2024 15:43:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmLhJ-000HIF-1D;
	Mon, 18 Mar 2024 22:43:13 +0000
Date: Tue, 19 Mar 2024 06:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8.0-net-next-mv88e6xxx-leds-v4 3/8]
 drivers/net/ethernet/intel/igc/igc_leds.c:254:12: error: no member named
 'hw_control_trigger' in 'struct led_classdev'
Message-ID: <202403190652.ruPDEFGw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

First bad commit (maybe != root cause):

tree:   https://github.com/lunn/linux.git v6.8.0-net-next-mv88e6xxx-leds-v4
head:   c85ce1c8e3761fc366533410f0318b01314ba819
commit: c4ae49b10529d66ed1aa9bf7c6e10ef95dfe7f75 [3/8] net: Add helpers for netdev LEDs
config: powerpc64-randconfig-001-20240318 (https://download.01.org/0day-ci/archive/20240319/202403190652.ruPDEFGw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190652.ruPDEFGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190652.ruPDEFGw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/igc/igc_leds.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2188:
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
>> drivers/net/ethernet/intel/igc/igc_leds.c:254:12: error: no member named 'hw_control_trigger' in 'struct led_classdev'
     254 |         led_cdev->hw_control_trigger = "netdev";
         |         ~~~~~~~~  ^
>> drivers/net/ethernet/intel/igc/igc_leds.c:255:12: error: no member named 'hw_control_is_supported' in 'struct led_classdev'
     255 |         led_cdev->hw_control_is_supported = igc_led_hw_control_is_supported;
         |         ~~~~~~~~  ^
>> drivers/net/ethernet/intel/igc/igc_leds.c:256:12: error: no member named 'hw_control_set' in 'struct led_classdev'
     256 |         led_cdev->hw_control_set = igc_led_hw_control_set;
         |         ~~~~~~~~  ^
>> drivers/net/ethernet/intel/igc/igc_leds.c:257:12: error: no member named 'hw_control_get' in 'struct led_classdev'
     257 |         led_cdev->hw_control_get = igc_led_hw_control_get;
         |         ~~~~~~~~  ^
>> drivers/net/ethernet/intel/igc/igc_leds.c:258:12: error: no member named 'hw_control_get_device' in 'struct led_classdev'
     258 |         led_cdev->hw_control_get_device = igc_led_hw_control_get_device;
         |         ~~~~~~~~  ^
   5 warnings and 5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LEDS_TRIGGER_NETDEV
   Depends on [n]: NEW_LEDS [=y] && LEDS_TRIGGERS [=n] && NET [=y]
   Selected by [y]:
   - NETDEV_LEDS [=y] && NET [=y] && LEDS_CLASS [=y]


vim +254 drivers/net/ethernet/intel/igc/igc_leds.c

ea578703b03d5d Kurt Kanzenbach 2024-02-13  238  
ea578703b03d5d Kurt Kanzenbach 2024-02-13  239  static void igc_setup_ldev(struct igc_led_classdev *ldev,
ea578703b03d5d Kurt Kanzenbach 2024-02-13  240  			   struct net_device *netdev, int index)
ea578703b03d5d Kurt Kanzenbach 2024-02-13  241  {
ea578703b03d5d Kurt Kanzenbach 2024-02-13  242  	struct igc_adapter *adapter = netdev_priv(netdev);
ea578703b03d5d Kurt Kanzenbach 2024-02-13  243  	struct led_classdev *led_cdev = &ldev->led;
ea578703b03d5d Kurt Kanzenbach 2024-02-13  244  	char led_name[LED_MAX_NAME_SIZE];
ea578703b03d5d Kurt Kanzenbach 2024-02-13  245  
ea578703b03d5d Kurt Kanzenbach 2024-02-13  246  	ldev->netdev = netdev;
ea578703b03d5d Kurt Kanzenbach 2024-02-13  247  	ldev->index = index;
ea578703b03d5d Kurt Kanzenbach 2024-02-13  248  
ea578703b03d5d Kurt Kanzenbach 2024-02-13  249  	igc_led_get_name(adapter, index, led_name, LED_MAX_NAME_SIZE);
ea578703b03d5d Kurt Kanzenbach 2024-02-13  250  	led_cdev->name = led_name;
ea578703b03d5d Kurt Kanzenbach 2024-02-13  251  	led_cdev->flags |= LED_RETAIN_AT_SHUTDOWN;
ea578703b03d5d Kurt Kanzenbach 2024-02-13  252  	led_cdev->max_brightness = 1;
ea578703b03d5d Kurt Kanzenbach 2024-02-13  253  	led_cdev->brightness_set_blocking = igc_led_brightness_set_blocking;
ea578703b03d5d Kurt Kanzenbach 2024-02-13 @254  	led_cdev->hw_control_trigger = "netdev";
ea578703b03d5d Kurt Kanzenbach 2024-02-13 @255  	led_cdev->hw_control_is_supported = igc_led_hw_control_is_supported;
ea578703b03d5d Kurt Kanzenbach 2024-02-13 @256  	led_cdev->hw_control_set = igc_led_hw_control_set;
ea578703b03d5d Kurt Kanzenbach 2024-02-13 @257  	led_cdev->hw_control_get = igc_led_hw_control_get;
ea578703b03d5d Kurt Kanzenbach 2024-02-13 @258  	led_cdev->hw_control_get_device = igc_led_hw_control_get_device;
ea578703b03d5d Kurt Kanzenbach 2024-02-13  259  
ea578703b03d5d Kurt Kanzenbach 2024-02-13  260  	devm_led_classdev_register(&netdev->dev, led_cdev);
ea578703b03d5d Kurt Kanzenbach 2024-02-13  261  }
ea578703b03d5d Kurt Kanzenbach 2024-02-13  262  

:::::: The code at line 254 was first introduced by commit
:::::: ea578703b03d5d651b091c39f717dc829155b520 igc: Add support for LEDs on i225/i226

:::::: TO: Kurt Kanzenbach <kurt@linutronix.de>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
