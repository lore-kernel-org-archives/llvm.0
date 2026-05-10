Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B5E17B50A;
	Sun, 10 May 2026 03:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778385221; cv=none; b=lw29I7xpZ3GZ3jE28iv4R5Oat5fUTBySTMPsWFriEWgFHrmv8eeFU20X9rremZDo/laEX6vgjAaUXNTaniBRolE6BPP2NApaSyagUFfIW87W2c/sb2hHxxj8JYjCOy9rJpZngbHWIy8RBV2RkkQpR96sCDvyDF2oKpNVoty7ATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778385221; c=relaxed/simple;
	bh=MtJVwVr+12Fsb/UVgOEcwZP4tcysccsMOyrywVqSz7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MeizzxvzS9XH0iw0jcj2esoOzprfveJA1OMXwXQGfMq6V9/gncL+ul6O1EZR/1TjzHGCxZhh28/vgXUhoXp7R3UrR+MvLjzsXJ4+r25DFHpZy/GinU1RIXblNAUstOmcozcQG5kvM4ZvzME2kimSm91ng9h5ADHyURHW2v36HCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ali1Bh+B; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ali1Bh+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778385219; x=1809921219;
  h=date:from:to:cc:subject:message-id;
  bh=MtJVwVr+12Fsb/UVgOEcwZP4tcysccsMOyrywVqSz7E=;
  b=Ali1Bh+BVZ6cPC6GjzTMGylRErLc9P7eA4aBHkDorzzCxjRjfOdR5cTf
   J0+Q/z9GzlYUaVR2BIr+4Gw5LJVT/BjnfEYUk7aOFuNcJnlMS51UkaHx4
   Z4GruwtKdSzrnEgfXEwVn9T6FpuzhFKlgYKCM96JttcdSJ+GzcFW0badU
   9VIyCukdOfXc+zNvDQfnVL5Rp9FFmbDzhVRQefQfWsVxWkbCYUIfqF86A
   5vrUu+7bsyicKFtv3D2ksZwlEz9PNuOIh5PopN7shjNTdK190UciYTvdz
   1o+1cf0rimTo45TTXV91g70i11J1foxfF10zKpQMHX684EUCw/vOuqdNz
   w==;
X-CSE-ConnectionGUID: wEHK/V6IR0OLxTiBrr7XOQ==
X-CSE-MsgGUID: hzWnQcRER6OjtLg3YvArUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="82928122"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="82928122"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 20:53:39 -0700
X-CSE-ConnectionGUID: ChaEP/0VQWSgeOYK0XsQqw==
X-CSE-MsgGUID: R1JTC8MZTfaVgqZrQ3LoRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="237234962"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2026 20:53:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLvEU-000000007dP-2YXL;
	Sun, 10 May 2026 03:53:34 +0000
Date: Sun, 10 May 2026 05:52:44 +0200
From: kernel test robot <lkp@intel.com>
To: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/net/netdevsim/bus.c:192:3: error: call to undeclared
 function 'nsim_bus_dev_del'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202605100547.H0iG9hE4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jiakai-Xu/netdevsim-Fix-task-hung-by-releasing-bus-lock-before-device-ops/20260510-070550
head:   93a12a4523b770bda0f952a4d3a44cbee0775bb4
commit: 93a12a4523b770bda0f952a4d3a44cbee0775bb4 netdevsim: Fix task hung by releasing bus lock before device ops
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260510/202605100547.H0iG9hE4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100547.H0iG9hE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100547.H0iG9hE4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/netdevsim/bus.c:192:3: error: call to undeclared function 'nsim_bus_dev_del'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     192 |                 nsim_bus_dev_del(nsim_bus_dev);
         |                 ^
   drivers/net/netdevsim/bus.c:192:3: note: did you mean 'nsim_bus_dev_new'?
   drivers/net/netdevsim/bus.c:156:1: note: 'nsim_bus_dev_new' declared here
     156 | nsim_bus_dev_new(unsigned int id, unsigned int port_count, unsigned int num_queues);
         | ^
>> drivers/net/netdevsim/bus.c:206:13: error: conflicting types for 'nsim_bus_dev_del'
     206 | static void nsim_bus_dev_del(struct nsim_bus_dev *nsim_bus_dev);
         |             ^
   drivers/net/netdevsim/bus.c:192:3: note: previous implicit declaration is here
     192 |                 nsim_bus_dev_del(nsim_bus_dev);
         |                 ^
   2 errors generated.


vim +/nsim_bus_dev_del +192 drivers/net/netdevsim/bus.c

   157	
   158	static ssize_t
   159	new_device_store(const struct bus_type *bus, const char *buf, size_t count)
   160	{
   161		unsigned int id, port_count, num_queues;
   162		struct nsim_bus_dev *nsim_bus_dev;
   163		int err;
   164	
   165		err = sscanf(buf, "%u %u %u", &id, &port_count, &num_queues);
   166		switch (err) {
   167		case 1:
   168			port_count = 1;
   169			fallthrough;
   170		case 2:
   171			num_queues = 1;
   172			fallthrough;
   173		case 3:
   174			if (id > INT_MAX) {
   175				pr_err("Value of \"id\" is too big.\n");
   176				return -EINVAL;
   177			}
   178			break;
   179		default:
   180			pr_err("Format for adding new device is \"id port_count num_queues\" (uint uint uint).\n");
   181			return -EINVAL;
   182		}
   183	
   184		nsim_bus_dev = nsim_bus_dev_new(id, port_count, num_queues);
   185		if (IS_ERR(nsim_bus_dev))
   186			return PTR_ERR(nsim_bus_dev);
   187	
   188		mutex_lock(&nsim_bus_dev_list_lock);
   189		/* Prevent to use resource before initialization. */
   190		if (!smp_load_acquire(&nsim_bus_enable)) {
   191			mutex_unlock(&nsim_bus_dev_list_lock);
 > 192			nsim_bus_dev_del(nsim_bus_dev);
   193			return -EBUSY;
   194		}
   195	
   196		/* Allow using nsim_bus_dev */
   197		smp_store_release(&nsim_bus_dev->init, true);
   198	
   199		list_add_tail(&nsim_bus_dev->list, &nsim_bus_dev_list);
   200		mutex_unlock(&nsim_bus_dev_list_lock);
   201	
   202		return count;
   203	}
   204	static BUS_ATTR_WO(new_device);
   205	
 > 206	static void nsim_bus_dev_del(struct nsim_bus_dev *nsim_bus_dev);
   207	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
