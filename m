Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965F9286D5C;
	Fri,  3 Oct 2025 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759505429; cv=none; b=jj4SKOVzMl/sbiX7eEkDK4juLN2HccW0G+EuzKUNhjng2OO+hLh2fRKIpFaNZSNR/GaTAUAMiZM/0ZEHvM7xWDPh8uko0dai69R99YUgWmErYpvfyT2/BsqWqMqV3EyFanrsfNmVVzelW+4mFDfTUp5YqC4N8bUnOOY7ymMXzzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759505429; c=relaxed/simple;
	bh=q/9Xu2YYVG+OUUPaY0oOhfiQYqYmkFvJm1jxGPXbccQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9alaOfosxaIn6BJYrdt3a2faB1VrKNq9By9Yh/+zXhA13ZT55iti5vmOgrwkE+FjwLMDwBMEFGDmQnXJuL7YrDIHZgpoItDPtTwn/oACwZaWc82D2b/QOOULKEOO4L3ATRExTRNMlM7K41thQTdj1XhgnESW5kgr4iNFEnGk6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvamK2Hk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvamK2Hk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759505428; x=1791041428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q/9Xu2YYVG+OUUPaY0oOhfiQYqYmkFvJm1jxGPXbccQ=;
  b=QvamK2Hkj+qU4qqyfEQJOO1bsXhFjR4JpfFQjtxwkTwLDsOA7Y3e7gtc
   cggT4KI85HIfF6KZ49jFUL1z3nRcCSLLuoIQ7Vl6I+5UIUkUT8+ym20dv
   8U2+vO6esydE5uLpGInp4J6lQLKLG9E2QStxvqU0frxNrgQ4ZQl2zsQY5
   ywf1Pin62+SFn1qHz4U9JkmnaG+oZKNQcbdsV7j7sKe90nO5ehlzfLXVq
   gVMzyNZBXme0CDaCsTbjc4zHjdiL6V+cbdi0c0+Ee+nHUOprlp5SxrDTW
   EOovcV1F2HzLdU4pw4+7c50IVhvDG3RZs/nNrZyDU/Y1fKsOXkyBBLuYU
   w==;
X-CSE-ConnectionGUID: ihF0HE5FTueVITbwWex3pA==
X-CSE-MsgGUID: olHoZa5/Tseh8/fxAbOP2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="60826083"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="60826083"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 08:30:27 -0700
X-CSE-ConnectionGUID: BDdaxFHARMmz3JkgtkXyTg==
X-CSE-MsgGUID: KR53dd6NS0C+e6sSWxZPiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="184505759"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Oct 2025 08:30:25 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4hjj-0004cc-1E;
	Fri, 03 Oct 2025 15:30:23 +0000
Date: Fri, 3 Oct 2025 23:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-iouring2 16/17] net/xdp/xsk.c:129:44: error: too
 few arguments to function call, expected 3, have 2
Message-ID: <202510032323.xc2oFL3L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring2
head:   8f75591c849f4deeaa81c54aa15f111c1db0d47e
commit: b1267b3c6afc658b47021929dc9ae44acef2c68f [16/17] errata: mp open/close conversion
config: hexagon-randconfig-001-20251003 (https://download.01.org/0day-ci/archive/20251003/202510032323.xc2oFL3L-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510032323.xc2oFL3L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510032323.xc2oFL3L-lkp@intel.com/

Note: the cilium/pr/netkit-iouring2 HEAD 8f75591c849f4deeaa81c54aa15f111c1db0d47e builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> net/xdp/xsk.c:129:44: error: too few arguments to function call, expected 3, have 2
     129 |                 __netif_get_rx_queue_peer(&dev, &queue_id);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~                ^
   include/net/netdev_rx_queue.h:96:1: note: '__netif_get_rx_queue_peer' declared here
      96 | __netif_get_rx_queue_peer(struct net_device **dev, unsigned int *rxq_idx,
         | ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      97 |                           bool virt_to_phys_only);
         |                           ~~~~~~~~~~~~~~~~~~~~~~
   net/xdp/xsk.c:150:44: error: too few arguments to function call, expected 3, have 2
     150 |                 __netif_get_rx_queue_peer(&dev, &queue_id);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~                ^
   include/net/netdev_rx_queue.h:96:1: note: '__netif_get_rx_queue_peer' declared here
      96 | __netif_get_rx_queue_peer(struct net_device **dev, unsigned int *rxq_idx,
         | ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      97 |                           bool virt_to_phys_only);
         |                           ~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +129 net/xdp/xsk.c

1c1efc2af15886 Magnus Karlsson    2020-08-28  125  
c835a0c7c90035 Daniel Borkmann    2025-09-03  126  void xsk_clear_pool_at_qid(struct net_device *dev, unsigned int queue_id)
1c1efc2af15886 Magnus Karlsson    2020-08-28  127  {
c835a0c7c90035 Daniel Borkmann    2025-09-03  128  	if (queue_id < dev->real_num_rx_queues)
c835a0c7c90035 Daniel Borkmann    2025-09-03 @129  		__netif_get_rx_queue_peer(&dev, &queue_id);
b425e24a934e21 Maxim Mikityanskiy 2021-01-18  130  	if (queue_id < dev->num_rx_queues)
1c1efc2af15886 Magnus Karlsson    2020-08-28  131  		dev->_rx[queue_id].pool = NULL;
b425e24a934e21 Maxim Mikityanskiy 2021-01-18  132  	if (queue_id < dev->num_tx_queues)
1c1efc2af15886 Magnus Karlsson    2020-08-28  133  		dev->_tx[queue_id].pool = NULL;
1c1efc2af15886 Magnus Karlsson    2020-08-28  134  }
1c1efc2af15886 Magnus Karlsson    2020-08-28  135  

:::::: The code at line 129 was first introduced by commit
:::::: c835a0c7c90035db3e1ca49bdb371bdd62ffa6bd xsk: Proxy pool management for mapped queues

:::::: TO: Daniel Borkmann <daniel@iogearbox.net>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
