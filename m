Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C132ED84A;
	Mon,  8 Jun 2026 19:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780945689; cv=none; b=VLcW6y7iJTt09eBHZ6vAjfM3+Ep2VQbiXDjiDRve3jCXNYFwtIlFREiFSmmMb4Ve6elBRNwflETPdylypaQqSlVHgn/Uf+wawPVmBpHAAZoCNxVfcrYTR2Z+10/Ho0115yNDxb/0TPP3pn3mtN3vy19NO2jLbHWzKpYEPvYg+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780945689; c=relaxed/simple;
	bh=Af0JZX8s+dvZ78Bdx0K+Qrq6cFPSC7gdfCps7yQ40GE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GLNllR6aMvGAhIU3rJUEh8j/tdiUvjpl3aSltfYMz0rKZWAQmiKRpCvQxCgC/U8xP7PemXhVC4oXzST4VErwHQkfA25v3GKMzmh9/wx0FMriD+G4esuPiKVbpGmtYGuMkKS+aQvPy2q2XPt3KpdKcVmzA9zYtgQSPNEVj7AdTGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1cHekBj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1cHekBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780945687; x=1812481687;
  h=date:from:to:cc:subject:message-id;
  bh=Af0JZX8s+dvZ78Bdx0K+Qrq6cFPSC7gdfCps7yQ40GE=;
  b=K1cHekBjQCaF9a+hBPRxB3NV9U0vphC9rCC6eZH25aNxVGxo/nvoTDMt
   uL0oj2Q1ZTMmh5HN8C+kAeqKau67o3qfc046JEfj1Uxm/+2LvNOYoTbCN
   0FxZTbDAAGZ7ziakx0gGYIzWCI8yAhbBzRvviB32kQl7jqqk4Kg0uAn15
   MlXzyIehXsKA9q/n07xTLQ2xwkXY/sR8htHgbwDC3OvWZKNlr3W+oEDMa
   foHHUy4EeBRgy1xSs2wy+idXFiScyQLww7uwzm3zg6ckY80BvoQii/kf6
   4RTCYVbRlbxayXuM2sTS1fPQDre/oqxR1thCn6FinQQwVwb3MNFNCKOg7
   Q==;
X-CSE-ConnectionGUID: rTZd6yNmTJqyXorH37hidA==
X-CSE-MsgGUID: EMoPlcO/Q+y85lPephSt+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="84265906"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="84265906"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 12:08:07 -0700
X-CSE-ConnectionGUID: dqv8suxARmeQuRB+FXNCZg==
X-CSE-MsgGUID: Ytun5s7cSvmbwi+5FJIUFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="245500175"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Jun 2026 12:08:06 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWfKN-000000003J3-16xq;
	Mon, 08 Jun 2026 19:08:03 +0000
Date: Mon, 08 Jun 2026 21:07:58 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: net/sched/sch_generic.c:594:22: error: passing
 'netdevice_tracker' to parameter of incompatible type 'const void *'
Message-ID: <202606082019.OHi1pHox-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-watchdog-fix-refcount-tracking-races/20260608-205327
head:   db0aade8ee8c6b624d8541821b8124d51e9c565a
commit: db0aade8ee8c6b624d8541821b8124d51e9c565a net: watchdog: fix refcount tracking races
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260608/202606082019.OHi1pHox-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260608/202606082019.OHi1pHox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606082019.OHi1pHox-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sched/sch_generic.c:594:22: error: passing 'netdevice_tracker' to parameter of incompatible type 'const void *'
     594 |                 if (IS_ERR_OR_NULL(dev->watchdog_dev_tracker))
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:90:68: note: passing argument to parameter 'ptr' here
      90 | static inline bool __must_check IS_ERR_OR_NULL(__force const void *ptr)
         |                                                                    ^
   1 error generated.


vim +594 net/sched/sch_generic.c

   584	
   585	void netdev_watchdog_up(struct net_device *dev)
   586	{
   587		if (!dev->netdev_ops->ndo_tx_timeout)
   588			return;
   589		if (dev->watchdog_timeo <= 0)
   590			dev->watchdog_timeo = 5*HZ;
   591		spin_lock_bh(&dev->tx_global_lock);
   592		if (!mod_timer(&dev->watchdog_timer,
   593			       round_jiffies(jiffies + dev->watchdog_timeo))) {
 > 594			if (IS_ERR_OR_NULL(dev->watchdog_dev_tracker))
   595				netdev_hold(dev, &dev->watchdog_dev_tracker,
   596					    GFP_ATOMIC);
   597		}
   598		spin_unlock_bh(&dev->tx_global_lock);
   599	}
   600	EXPORT_SYMBOL_GPL(netdev_watchdog_up);
   601	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
