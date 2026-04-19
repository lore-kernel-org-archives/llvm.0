Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3A8A932;
	Sun, 19 Apr 2026 11:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776599689; cv=none; b=N15BirOWxQcfLg58DDC+y7sx7VXSAIjs4IHhbIqAVnl/CsU0nhOJsezoX3MyzyAbpBy8+UN3YD1VNbqTG/DS82ztQOCqN7V96Xgzi1vq2QIHY2xflG/cV+YGTGcr6Sw6/R5dS5TE0qh5rb7w+7ciHYZGsu1WWd6cXjhTK7bDgbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776599689; c=relaxed/simple;
	bh=k4WTC8L4wGyGKicY3LRUC31X6bA1oLOHSRNre46vA+s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s2BId0Q6JySf1g4Zcd8HmCt99aU7IwpOinRYPcLRWUBCrGUxpgW9fuINoPiNLNaK6h2+JRv4aoYMjLRMdYaCPg7UFmxCO5m9e/351Jean/9qVHWs7yrb/+ClOViUpX+TxmOFre+6EYQB+uwhVOI4D8QOQXFYeMirvQMCnnb9Ljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaLWNhS0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaLWNhS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776599688; x=1808135688;
  h=date:from:to:cc:subject:message-id;
  bh=k4WTC8L4wGyGKicY3LRUC31X6bA1oLOHSRNre46vA+s=;
  b=TaLWNhS0FH/0Z6n7niPttOEAoFxQ1rWsM2BSIc5P8I7BluzC1yKO6Fgc
   fapfGQajwJglFu3Loafw3WN9DgowT07k+6wz7HlQKt6+pcNWswqpcT90L
   x9i8RK8Cui81Rs21uWKqJzp7ENd4CGqRcjrPFIHv9oo1JQjZ2iqNOI/66
   5Qjh+jLNRMth7n7smyYUITfoUzUyCyMzSa3UVWGw4s/ciErDIzzcV1Y9t
   IaEXL1UkHz06BNr//D9ndlhksI+QTVFfdYMXATApXQ89BQqb5ixVcIufD
   sCRr7hyx9GzRrWE8X7lGVXksEYwlyucrZCmfVmDammGTLZgTDkCGg3Csj
   w==;
X-CSE-ConnectionGUID: EbrL+8XUR0CpQ9YttTrUkw==
X-CSE-MsgGUID: BwbavbgWQPOjsFxGPCzlnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="100196628"
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="100196628"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 04:54:47 -0700
X-CSE-ConnectionGUID: 2IdU+DEsS2W7Xjed/hKAxA==
X-CSE-MsgGUID: fYvQ5/ojQH6/e24Gq9vWmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="235856237"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 19 Apr 2026 04:54:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEQja-000000001xT-1VHK;
	Sun, 19 Apr 2026 11:54:42 +0000
Date: Sun, 19 Apr 2026 13:53:57 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Xing <kernelxing@tencent.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: net/core/dev.c:4896:5: warning: no previous prototype for
 function 'xsk_direct_xmit_batch'
Message-ID: <202604191309.zcfqiXcM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/xsk-introduce-XDP_GENERIC_XMIT_BATCH-setsockopt/20260419-142943
head:   4b82e4780ff9a121b25fbf30a8f9e6fcb9b0eb04
commit: f15c37d19d6d8ef60bfc87a982a5374e83994ac2 xsk: add direct xmit in batch function
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260419/202604191309.zcfqiXcM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604191309.zcfqiXcM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604191309.zcfqiXcM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/dev.c:4896:5: warning: no previous prototype for function 'xsk_direct_xmit_batch' [-Wmissing-prototypes]
    4896 | int xsk_direct_xmit_batch(struct xdp_sock *xs, struct net_device *dev)
         |     ^
   net/core/dev.c:4896:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4896 | int xsk_direct_xmit_batch(struct xdp_sock *xs, struct net_device *dev)
         | ^
         | static 
   1 warning generated.


vim +/xsk_direct_xmit_batch +4896 net/core/dev.c

  4895	
> 4896	int xsk_direct_xmit_batch(struct xdp_sock *xs, struct net_device *dev)
  4897	{
  4898		u16 queue_id = xs->queue_id;
  4899		struct netdev_queue *txq = netdev_get_tx_queue(dev, queue_id);
  4900		struct sk_buff_head *send_queue = &xs->batch.send_queue;
  4901		int ret = NETDEV_TX_BUSY;
  4902		struct sk_buff *skb;
  4903	
  4904		local_bh_disable();
  4905		HARD_TX_LOCK(dev, txq, smp_processor_id());
  4906		while ((skb = __skb_dequeue(send_queue)) != NULL) {
  4907			struct sk_buff *orig_skb = skb;
  4908			bool again = false;
  4909	
  4910			skb = validate_xmit_skb_list(skb, dev, &again);
  4911			if (skb != orig_skb) {
  4912				dev_core_stats_tx_dropped_inc(dev);
  4913				kfree_skb_list(skb);
  4914				ret = NET_XMIT_DROP;
  4915				break;
  4916			}
  4917	
  4918			if (netif_xmit_frozen_or_drv_stopped(txq)) {
  4919				__skb_queue_head(send_queue, skb);
  4920				break;
  4921			}
  4922			skb_set_queue_mapping(skb, queue_id);
  4923			ret = netdev_start_xmit(skb, dev, txq, false);
  4924			if (ret != NETDEV_TX_OK) {
  4925				if (ret == NETDEV_TX_BUSY)
  4926					__skb_queue_head(send_queue, skb);
  4927				break;
  4928			}
  4929		}
  4930		HARD_TX_UNLOCK(dev, txq);
  4931		local_bh_enable();
  4932	
  4933		return ret;
  4934	}
  4935	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
