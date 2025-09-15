Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DFA327A19;
	Mon, 15 Sep 2025 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946342; cv=none; b=ZXoveixITskUle96UUdOB+bVTe0oGRZEC6Ye+j56+GGVndcQhIMzDtzCe05tg9gDdYfKQBtO0Ngtmz15is6LUZXd+X0EG2+79xjoHIS0KhAEANhwVYJ2/jj2ZENskr8qlYOgRPWrk+wdqE07Y1crdMELg8bjuqYvIVma3JMpJak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946342; c=relaxed/simple;
	bh=sotKzKeMRre9Y3CW/HCu1/nev4wM8yBFBDrivWmy6pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ytov0vXVbVkc/7MhxCV2sLcFvJOwGB9chP+1empPDQQVNqd9ApLczABq0LsAnGGfnnImtZeXlqPvR7bcdpO1x+v23gL99dYNwUHghNLy9q69LOCx8G6CjosG2jj/L5jlQyUS6kI7gYpzJo0xeopCXDsGEaSIuMxQDqtQOPVf9Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiR+0C5E; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiR+0C5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757946340; x=1789482340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sotKzKeMRre9Y3CW/HCu1/nev4wM8yBFBDrivWmy6pg=;
  b=YiR+0C5EqTi8w7GAov8ZD3Cmm/4xje8jeTUuXolyToGZNKQmPmwSmvXP
   wIc+pL1vdbMUEJUXn/Yh5gyWYckzFZeH/wOVQiKvY70sR/rSm41C68eVk
   poqRK7/2EeV6SHEhb+kAoD5LDX8iWzoW1KdJ6TUYHk62uA3posNXauX3i
   sTwYJnTgiPqnPorF7L6Ak2Cc5uPUJnc4q28A0s/r4YxnmLKcLL4wEWcfl
   MVq9gkXUjCv/F8LoVk8F8traNNVaDifG7OBQf76KVYOxeZ/LP4+9cjn4r
   a1cuOL922dvCiChzHePJp9n1lCVgPsi+689O+ZfA4mAD1B+8gk6VnPBGd
   Q==;
X-CSE-ConnectionGUID: wPVI3sbGQK2+8cnFj+XSIA==
X-CSE-MsgGUID: mjBSaYsATh+S75dwgFFj1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60269024"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="60269024"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 07:25:40 -0700
X-CSE-ConnectionGUID: W5EJm7f2TqW0HAHVhc2Bhg==
X-CSE-MsgGUID: UuU7av3uTraGXT+9jn6cCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="179021792"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Sep 2025 07:25:38 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyA9A-0000J9-0Q;
	Mon, 15 Sep 2025 14:25:36 +0000
Date: Mon, 15 Sep 2025 22:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-iouring 11/13] drivers/net/netkit.c:396:13: error:
 no member named 'pool' in 'struct netdev_rx_queue'
Message-ID: <202509152205.rMP7qLkG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring
head:   2349bbb5912e0d52fba70db82bfbf45064f824f6
commit: 75c1fb3cba77335698d2293e139596fb67f3a330 [11/13] netkit: Implement ndo_queue_xsk_pool_{register,get,clear} operations
config: powerpc-randconfig-003-20250915 (https://download.01.org/0day-ci/archive/20250915/202509152205.rMP7qLkG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509152205.rMP7qLkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509152205.rMP7qLkG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:351:9: note: previous definition is here
     351 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   drivers/net/netkit.c:390:6: error: call to undeclared function 'xsk_get_pool_from_qid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     390 |         if (xsk_get_pool_from_qid(phys, phys_idx))
         |             ^
   drivers/net/netkit.c:393:6: error: incomplete definition of type 'struct xsk_buff_pool'
     393 |         pool->netdev = phys;
         |         ~~~~^
   include/linux/netdevice.h:1007:11: note: forward declaration of 'struct xsk_buff_pool'
    1007 |                         struct xsk_buff_pool *pool;
         |                                ^
   drivers/net/netkit.c:394:6: error: incomplete definition of type 'struct xsk_buff_pool'
     394 |         pool->queue_id = phys_idx;
         |         ~~~~^
   include/linux/netdevice.h:1007:11: note: forward declaration of 'struct xsk_buff_pool'
    1007 |                         struct xsk_buff_pool *pool;
         |                                ^
>> drivers/net/netkit.c:396:13: error: no member named 'pool' in 'struct netdev_rx_queue'
     396 |         rxq->peer->pool = pool;
         |         ~~~~~~~~~  ^
   drivers/net/netkit.c:412:20: error: no member named 'pool' in 'struct netdev_rx_queue'
     412 |         return rxq->peer->pool;
         |                ~~~~~~~~~  ^
   drivers/net/netkit.c:426:13: error: no member named 'pool' in 'struct netdev_rx_queue'
     426 |         rxq->peer->pool = NULL;
         |         ~~~~~~~~~  ^
   1 warning and 6 errors generated.


vim +396 drivers/net/netkit.c

   372	
   373	static int netkit_queue_xsk_pool_register(struct net_device *dev,
   374						  struct xsk_buff_pool *pool, int idx)
   375	{
   376		struct netdev_rx_queue *rxq;
   377		struct net_device *phys;
   378		int phys_idx;
   379	
   380		if (idx >= dev->real_num_rx_queues)
   381			return -EINVAL;
   382	
   383		rxq = __netif_get_rx_queue(dev, idx);
   384		if (!rxq->peer)
   385			return -EOPNOTSUPP;
   386	
   387		phys = rxq->peer->dev;
   388		phys_idx = get_netdev_rx_queue_index(rxq->peer);
   389	
   390		if (xsk_get_pool_from_qid(phys, phys_idx))
   391			return -EBUSY;
   392	
   393		pool->netdev = phys;
   394		pool->queue_id = phys_idx;
   395	
 > 396		rxq->peer->pool = pool;
   397		return 0;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
