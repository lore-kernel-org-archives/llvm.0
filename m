Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79787B661;
	Thu,  6 Mar 2025 07:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741246372; cv=none; b=cjOY/JKl9Z2dp77RMu1vkvS9P1ChsJ/jq+UkxXLvlUrmjH/mjNaJLUfVTuH9oFy9d6pp/9+a5xZO2Zzi+yW7OvUEIyAIPu8lQMlq0d/5YScTX3iFKrKYtabQ168O7ssOwbuq36npRExnGA7vQL4mzu/m97jLMdOllPzvRwBvyTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741246372; c=relaxed/simple;
	bh=/yfygW4QEEAwUDbnmDSpRdaeh7sVFOcBMO70u+e9cXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kTzVVekLCOdWGhLj0oNrd7TFQKGug5MW0QnN7NFKmJBh+GtHhNCwWDnW1OiZokNs3ZTmobX5P+hyZaYAdk1E9vArB1M8OT0FmUdVivdsnfaPNIIfz1MRimw+opriG+oostIa4mQyavTjJLphzAbEo4HN2mlzL2uKm7K+r1m/My4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/UBuXaB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/UBuXaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741246370; x=1772782370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/yfygW4QEEAwUDbnmDSpRdaeh7sVFOcBMO70u+e9cXg=;
  b=E/UBuXaBS99CQm3YHLTgmcR3NnU7Zdxd4wDZK7ZcHXacGA7e/ayG4rIr
   trgCdwLjG0jFjLnZ2lwuauMrjtjcQdoWw25Iv+9MqPvj/oGEBvCY4uHDK
   ksQwUMaLHdRN5seedCFsojMGRyR5NecHFWAoSEcvquEbVhCk3Som7c3Qd
   9oT8mo3zh5dkh3U74ujBv9JkWgTicspl3mfh3kzn0UWXqN76sVEVkL/3u
   n+iD7A3R9yY/+xs1HwPUPBZy3atL/asAwLRSyn9QlvAMgYpEonL1UeIgE
   pl5T+q8GLkL3XUxtlmQg8QP6JS5oj6BiKvDd19yLXXcoXBrtsx8nIlUwf
   A==;
X-CSE-ConnectionGUID: wX/XJ2p8Tau8OjIIjQYI2w==
X-CSE-MsgGUID: DRgeB6JZT9KktxrWjiF2eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46165552"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="46165552"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 23:32:50 -0800
X-CSE-ConnectionGUID: U5ZV6vnXSD2z7EDi1AfTlQ==
X-CSE-MsgGUID: 3iB3MyD9RkSwZaPmsKL43Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="118670226"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2025 23:32:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq5il-000Mhq-2D;
	Thu, 06 Mar 2025 07:32:45 +0000
Date: Thu, 6 Mar 2025 15:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 48/88] drivers/net/usb/lan78xx.c:2459:22: warning:
 variable 'of_node' set but not used
Message-ID: <202503061520.5GrwtX36-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   321d82b640b78daba94d863283761c8fe95d17d7
commit: 9cdfa882e0196b967a675b0af9fe4c29882400a2 [48/88] irqdomain: net: Stop using irq_domain_add_simple()
config: i386-buildonly-randconfig-006-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061520.5GrwtX36-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061520.5GrwtX36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061520.5GrwtX36-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/usb/lan78xx.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2287:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/net/usb/lan78xx.c:2459:22: warning: variable 'of_node' set but not used [-Wunused-but-set-variable]
    2459 |         struct device_node *of_node;
         |                             ^
   drivers/net/usb/lan78xx.c:2516:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2516 |         int ret;
         |             ^
   3 warnings generated.


vim +/of_node +2459 drivers/net/usb/lan78xx.c

cc89c323a30e73 Woojung Huh       2016-11-01  2456  
cc89c323a30e73 Woojung Huh       2016-11-01  2457  static int lan78xx_setup_irq_domain(struct lan78xx_net *dev)
cc89c323a30e73 Woojung Huh       2016-11-01  2458  {
cc89c323a30e73 Woojung Huh       2016-11-01 @2459  	struct device_node *of_node;
cc89c323a30e73 Woojung Huh       2016-11-01  2460  	struct irq_domain *irqdomain;
cc89c323a30e73 Woojung Huh       2016-11-01  2461  	unsigned int irqmap = 0;
cc89c323a30e73 Woojung Huh       2016-11-01  2462  	u32 buf;
cc89c323a30e73 Woojung Huh       2016-11-01  2463  	int ret = 0;
cc89c323a30e73 Woojung Huh       2016-11-01  2464  
cc89c323a30e73 Woojung Huh       2016-11-01  2465  	of_node = dev->udev->dev.parent->of_node;
cc89c323a30e73 Woojung Huh       2016-11-01  2466  
cc89c323a30e73 Woojung Huh       2016-11-01  2467  	mutex_init(&dev->domain_data.irq_lock);
cc89c323a30e73 Woojung Huh       2016-11-01  2468  
d354d008255ffd Oleksij Rempel    2024-12-09  2469  	ret = lan78xx_read_reg(dev, INT_EP_CTL, &buf);
d354d008255ffd Oleksij Rempel    2024-12-09  2470  	if (ret < 0)
d354d008255ffd Oleksij Rempel    2024-12-09  2471  		return ret;
d354d008255ffd Oleksij Rempel    2024-12-09  2472  
cc89c323a30e73 Woojung Huh       2016-11-01  2473  	dev->domain_data.irqenable = buf;
cc89c323a30e73 Woojung Huh       2016-11-01  2474  
cc89c323a30e73 Woojung Huh       2016-11-01  2475  	dev->domain_data.irqchip = &lan78xx_irqchip;
cc89c323a30e73 Woojung Huh       2016-11-01  2476  	dev->domain_data.irq_handler = handle_simple_irq;
cc89c323a30e73 Woojung Huh       2016-11-01  2477  
9cdfa882e0196b Jiri Slaby (SUSE  2025-02-26  2478) 	irqdomain = irq_domain_create_simple(of_fwnode_handle(of_node),
9cdfa882e0196b Jiri Slaby (SUSE  2025-02-26  2479) 					     MAX_INT_EP, 0,
9cdfa882e0196b Jiri Slaby (SUSE  2025-02-26  2480) 					     &chip_domain_ops,
9cdfa882e0196b Jiri Slaby (SUSE  2025-02-26  2481) 					     &dev->domain_data);
cc89c323a30e73 Woojung Huh       2016-11-01  2482  	if (irqdomain) {
cc89c323a30e73 Woojung Huh       2016-11-01  2483  		/* create mapping for PHY interrupt */
cc89c323a30e73 Woojung Huh       2016-11-01  2484  		irqmap = irq_create_mapping(irqdomain, INT_EP_PHY);
cc89c323a30e73 Woojung Huh       2016-11-01  2485  		if (!irqmap) {
cc89c323a30e73 Woojung Huh       2016-11-01  2486  			irq_domain_remove(irqdomain);
cc89c323a30e73 Woojung Huh       2016-11-01  2487  
cc89c323a30e73 Woojung Huh       2016-11-01  2488  			irqdomain = NULL;
cc89c323a30e73 Woojung Huh       2016-11-01  2489  			ret = -EINVAL;
cc89c323a30e73 Woojung Huh       2016-11-01  2490  		}
cc89c323a30e73 Woojung Huh       2016-11-01  2491  	} else {
cc89c323a30e73 Woojung Huh       2016-11-01  2492  		ret = -EINVAL;
cc89c323a30e73 Woojung Huh       2016-11-01  2493  	}
cc89c323a30e73 Woojung Huh       2016-11-01  2494  
cc89c323a30e73 Woojung Huh       2016-11-01  2495  	dev->domain_data.irqdomain = irqdomain;
cc89c323a30e73 Woojung Huh       2016-11-01  2496  	dev->domain_data.phyirq = irqmap;
cc89c323a30e73 Woojung Huh       2016-11-01  2497  
cc89c323a30e73 Woojung Huh       2016-11-01  2498  	return ret;
cc89c323a30e73 Woojung Huh       2016-11-01  2499  }
cc89c323a30e73 Woojung Huh       2016-11-01  2500  

:::::: The code at line 2459 was first introduced by commit
:::::: cc89c323a30e73114a21fc125d2f841658a09987 lan78xx: Use irq_domain for phy interrupt from USB Int. EP

:::::: TO: Woojung Huh <woojung.huh@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
