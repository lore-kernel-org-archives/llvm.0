Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196222C08C0;
	Thu, 27 Nov 2025 20:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764273711; cv=none; b=j51O/41Yd7EBdzciuRt9jlxvd+yK851V+teRQWV8zHICVjuJPbvE3QeKpzPupOKtS3a7zoyEJ4phLnd3zOMH+xWgh6mhe48F6avp2ef9iHOazSETaDJvAGcQ+yrnJNWMs37cM7sm3q1aIa/4I7nY6MsBTst/JRKwnJiqWx1C49w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764273711; c=relaxed/simple;
	bh=NhLtvRlgRkk8b/SUPoYrU3x8hszh3kUTrFE2znwJD3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oKEecwOhcuOixbgp0wWj0wYvuixBWkXk8FTrU0+dWOdKa5r0ALFK/Lnrw4AKc6OALbsT0b6x05kQv7DuRb820ySKD8vninyTiaCOnAfpHsXTeXdVsVuXQ4QCgwnvV1TAiQx4hV4SEnNutXb3fFKxdQs7wpAt7Xs0ZRoIcw6VbLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbrkSNf6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbrkSNf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764273710; x=1795809710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NhLtvRlgRkk8b/SUPoYrU3x8hszh3kUTrFE2znwJD3s=;
  b=QbrkSNf6haRlHcrfuqe/1/oTZzu3aq7Xt5BcVSalqy5UtxZWSqZt+lXN
   F9o1f0K75QVlmMm/Ccc16ikqCQUA6J4SHI7dhsI75qsa05wFqu89nlsf9
   ETcnUl7H3Ozv/SmyFlC8V+TRwbm5/ZQeSz9iMf2WGEpzHQBX32SzLUI8I
   oE0WUbFmEb8UKscJ8TOyrDXyZLNi1lsf0sK5dG2b8fPCRXvaa7IX/3Yrz
   3jzA4OyCKUq9DJFaU+9RlfGQbix7yUFjI0EStgfjTGL3fHERdWB2HxLSC
   HN0hhj9fi9o3bGCsmB+45jJJ6sigBvgc6YIIpiI2qaNhi1YQSyWeGXmjU
   g==;
X-CSE-ConnectionGUID: Dg8s/fkwRdys1dnVeTsiCw==
X-CSE-MsgGUID: gRKjA5BNRuaAT3ILDpMidQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70186367"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="70186367"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 12:01:47 -0800
X-CSE-ConnectionGUID: suzrXYCwQfyuC9hx1oy0pw==
X-CSE-MsgGUID: usD33ZY6RI++hLZif8paqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="197781320"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Nov 2025 12:01:45 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOiBS-000000001pl-2i8F;
	Thu, 27 Nov 2025 20:01:42 +0000
Date: Thu, 27 Nov 2025 21:00:58 +0100
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring6 2/2] net/core/netdev_rx_queue.c:21:6:
 warning: no previous prototype for function 'netdev_rx_queue_peer'
Message-ID: <202511272127.HJ4NxkVL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring6
head:   7bfb4fc5f460441d05b483647e4f4c59c4afaeb1
commit: 7bfb4fc5f460441d05b483647e4f4c59c4afaeb1 [2/2] net: Implement netdev_nl_bind_queue_doit
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251127/202511272127.HJ4NxkVL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511272127.HJ4NxkVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511272127.HJ4NxkVL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/netdev_rx_queue.c:21:6: warning: no previous prototype for function 'netdev_rx_queue_peer' [-Wmissing-prototypes]
      21 | void netdev_rx_queue_peer(struct net_device *src_dev,
         |      ^
   net/core/netdev_rx_queue.c:21:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      21 | void netdev_rx_queue_peer(struct net_device *src_dev,
         | ^
         | static 
>> net/core/netdev_rx_queue.c:34:6: warning: no previous prototype for function 'netdev_rx_queue_unpeer' [-Wmissing-prototypes]
      34 | void netdev_rx_queue_unpeer(struct net_device *src_dev,
         |      ^
   net/core/netdev_rx_queue.c:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      34 | void netdev_rx_queue_unpeer(struct net_device *src_dev,
         | ^
         | static 
   net/core/netdev_rx_queue.c:55:11: error: no member named 'peer' in 'struct netdev_rx_queue'
      55 |         if (rxq->peer) {
         |             ~~~  ^
   net/core/netdev_rx_queue.c:58:14: error: no member named 'peer' in 'struct netdev_rx_queue'
      58 |                 rxq = rxq->peer;
         |                       ~~~  ^
>> net/core/netdev_rx_queue.c:66:1: warning: no previous prototype for function 'netif_get_rx_queue_peer_locked' [-Wmissing-prototypes]
      66 | netif_get_rx_queue_peer_locked(struct net_device **dev, unsigned int *rxq_idx)
         | ^
   net/core/netdev_rx_queue.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      65 | struct netdev_rx_queue *
         | ^
         | static 
>> net/core/netdev_rx_queue.c:81:6: warning: no previous prototype for function 'netif_put_rx_queue_peer_locked' [-Wmissing-prototypes]
      81 | void netif_put_rx_queue_peer_locked(struct net_device *orig_dev,
         |      ^
   net/core/netdev_rx_queue.c:81:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      81 | void netif_put_rx_queue_peer_locked(struct net_device *orig_dev,
         | ^
         | static 
   4 warnings and 2 errors generated.


vim +/netdev_rx_queue_peer +21 net/core/netdev_rx_queue.c

    20	
  > 21	void netdev_rx_queue_peer(struct net_device *src_dev,
    22				  struct netdev_rx_queue *src_rxq,
    23				  struct netdev_rx_queue *dst_rxq)
    24	{
    25		netdev_assert_locked(src_dev);
    26		netdev_assert_locked(dst_rxq->dev);
    27	
    28		netdev_hold(src_dev, &src_rxq->lease_tracker, GFP_KERNEL);
    29	
    30		WRITE_ONCE(src_rxq->lease, dst_rxq);
    31		WRITE_ONCE(dst_rxq->lease, src_rxq);
    32	}
    33	
  > 34	void netdev_rx_queue_unpeer(struct net_device *src_dev,
    35				    struct netdev_rx_queue *src_rxq,
    36				    struct netdev_rx_queue *dst_rxq)
    37	{
    38		WARN_ON_ONCE(READ_ONCE(dst_rxq->dev->reg_state) != NETREG_UNREGISTERING);
    39	
    40		netdev_assert_locked(dst_rxq->dev);
    41		netdev_assert_locked(src_dev);
    42	
    43		WRITE_ONCE(src_rxq->lease, NULL);
    44		WRITE_ONCE(dst_rxq->lease, NULL);
    45	
    46		netdev_put(src_dev, &src_rxq->lease_tracker);
    47	}
    48	
    49	static struct netdev_rx_queue *
    50	__netif_get_rx_queue_peer(struct net_device **dev, unsigned int *rxq_idx)
    51	{
    52		struct net_device *orig_dev = *dev;
    53		struct netdev_rx_queue *rxq = __netif_get_rx_queue(orig_dev, *rxq_idx);
    54	
  > 55		if (rxq->peer) {
    56			if (orig_dev->dev.parent)
    57				return NULL;
    58			rxq = rxq->peer;
    59			*rxq_idx = get_netdev_rx_queue_index(rxq);
    60			*dev = rxq->dev;
    61		}
    62		return rxq;
    63	}
    64	
    65	struct netdev_rx_queue *
  > 66	netif_get_rx_queue_peer_locked(struct net_device **dev, unsigned int *rxq_idx)
    67	{
    68		struct net_device *orig_dev = *dev;
    69		struct netdev_rx_queue *rxq;
    70	
    71		/* Locking order is always from the virtual to the physical device
    72		 * see netdev_nl_bind_queue_doit().
    73		 */
    74		netdev_ops_assert_locked(orig_dev);
    75		rxq = __netif_get_rx_queue_peer(dev, rxq_idx);
    76		if (rxq && orig_dev != *dev)
    77			netdev_lock(*dev);
    78		return rxq;
    79	}
    80	
  > 81	void netif_put_rx_queue_peer_locked(struct net_device *orig_dev,
    82					    struct net_device *dev)
    83	{
    84		if (orig_dev != dev)
    85			netdev_unlock(dev);
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
