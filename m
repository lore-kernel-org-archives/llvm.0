Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3E43161B2;
	Wed, 28 Jan 2026 06:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769580022; cv=none; b=qWVVJ0gYsRnoQVVPSNTbZhwgxV0dig2NLan3+VFUkATe9HeXoLgmXLTG3HVRZYRQQuUDYI0S+pZ3P8mxOfH7XA2qLeuWgI4qyJ8ufxxydD79GOMUTY6CZ1iVptAXYI2E6bXd1ejoinPnI/b0Gog+JYzoQBDowg0nxVLwmlUndqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769580022; c=relaxed/simple;
	bh=OLtl3deh0jmXHjSJOY3sV0GUzjYV0LUGDcIBUVgAqp0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jKUWPO0hoWMDX4pq4JT+uZzL9a9ValE1cy2XQ+yWWpSYtT2MlRh3+c5c0aLRrRhllemoNLVUgytVeGu+KnEbNIKHKdHWCVtU0ahHRr+dL6CJhJuWaCelMbUv9OAmjpgtZN5rvS8WpoOHyIsukcOVL2t/z/cX6i1XnO/O70nnpOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQVrmVzP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQVrmVzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769580021; x=1801116021;
  h=date:from:to:cc:subject:message-id;
  bh=OLtl3deh0jmXHjSJOY3sV0GUzjYV0LUGDcIBUVgAqp0=;
  b=YQVrmVzPj+X6Aw8bwwYlpmqkdC1ZfrHpFCxB+EJ3ZcLLmr3veM5nwT1i
   QdLvemC/toXix4WK6nxSpoW8sa4FtpyD2gekRFoPJUzI2olMGcBV7RGl+
   GGFqzRaR/g6Ny5c39wSk2zsvZ4rJV2/3urIi748L7GlIBQaZ9H9CZOQ8R
   PA9xqaj0hCOD1PDUvKVACh4Ti/mdO8ytmBJvC45D4kTCopJMwnhakk4yC
   SzSPWjoNM4Kv4Z5FjoMb3c5ZxGHErKbuueujMlVctVKStLM6KFaGm4qk7
   qLwf0kgG9eqAvca3IDMlU/MHogGNp1lfUSOtT1GsfqxORhFcyO6BmyHWL
   Q==;
X-CSE-ConnectionGUID: JH3DAmj8Rnqu2N0osaHBhw==
X-CSE-MsgGUID: kMEuBz4BTR2v/JhS6gYVqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88205160"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="88205160"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 22:00:20 -0800
X-CSE-ConnectionGUID: uJrgQAidQ12t4tIqCTP/yA==
X-CSE-MsgGUID: 3+LZFOeaS+6DzRgVREfs9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207315325"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jan 2026 22:00:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkyb9-00000000ZM4-3gUI;
	Wed, 28 Jan 2026 06:00:15 +0000
Date: Wed, 28 Jan 2026 14:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/netkit-iouring15 17/18] net/xdp/xsk.c:126:17:
 error: call to undeclared function 'netif_get_rx_queue_lease_locked'; ISO C99
 and later do not support implicit function declarations
Message-ID: <202601281348.paXuq0x3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring15
head:   2bfd97dc4072315c583d973b90386dd82df70fae
commit: 2735913301fe3285613f291f594b1749487137aa [17/18] Revert "net: Proxy net_mp_{open,close}_rxq for leased queues"
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260128/202601281348.paXuq0x3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281348.paXuq0x3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281348.paXuq0x3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/xdp/xsk.c:126:17: error: call to undeclared function 'netif_get_rx_queue_lease_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |                 WARN_ON_ONCE(!netif_get_rx_queue_lease_locked(&dev, &id));
         |                               ^
   net/xdp/xsk.c:126:17: note: did you mean '__netif_get_rx_queue_lease'?
   include/net/netdev_rx_queue.h:76:1: note: '__netif_get_rx_queue_lease' declared here
      76 | __netif_get_rx_queue_lease(struct net_device **dev, unsigned int *rxq,
         | ^
>> net/xdp/xsk.c:133:2: error: call to undeclared function 'netif_put_rx_queue_lease_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     133 |         netif_put_rx_queue_lease_locked(orig_dev, dev);
         |         ^
   net/xdp/xsk.c:151:8: error: call to undeclared function 'netif_get_rx_queue_lease_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     151 |                 if (!netif_get_rx_queue_lease_locked(&dev, &id))
         |                      ^
   net/xdp/xsk.c:164:2: error: call to undeclared function 'netif_put_rx_queue_lease_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     164 |         netif_put_rx_queue_lease_locked(orig_dev, dev);
         |         ^
   4 errors generated.


vim +/netif_get_rx_queue_lease_locked +126 net/xdp/xsk.c

1c1efc2af15886 Magnus Karlsson 2020-08-28  119  
1c1efc2af15886 Magnus Karlsson 2020-08-28  120  void xsk_clear_pool_at_qid(struct net_device *dev, u16 queue_id)
1c1efc2af15886 Magnus Karlsson 2020-08-28  121  {
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  122  	struct net_device *orig_dev = dev;
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  123  	unsigned int id = queue_id;
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  124  
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  125  	if (id < dev->real_num_rx_queues)
e1d8d7f33eef21 Daniel Borkmann 2026-01-15 @126  		WARN_ON_ONCE(!netif_get_rx_queue_lease_locked(&dev, &id));
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  127  
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  128  	if (id < dev->real_num_rx_queues)
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  129  		dev->_rx[id].pool = NULL;
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  130  	if (id < dev->real_num_tx_queues)
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  131  		dev->_tx[id].pool = NULL;
e1d8d7f33eef21 Daniel Borkmann 2026-01-15  132  
e1d8d7f33eef21 Daniel Borkmann 2026-01-15 @133  	netif_put_rx_queue_lease_locked(orig_dev, dev);
1c1efc2af15886 Magnus Karlsson 2020-08-28  134  }
1c1efc2af15886 Magnus Karlsson 2020-08-28  135  

:::::: The code at line 126 was first introduced by commit
:::::: e1d8d7f33eef21fc3c25b5f8234820db9dec3438 xsk: Proxy pool management for leased queues

:::::: TO: Daniel Borkmann <daniel@iogearbox.net>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
