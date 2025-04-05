Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2964C74;
	Sat,  5 Apr 2025 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743861508; cv=none; b=hwF3g/Sw25gR+Zw7tbAAOEAdVo9oEfrHCNij3GLZNTKiC8Di0QOBtz5/5oc+20cL7ndgSkWuSqlZ7X6fmYO7CcLz5J2HuoBPbC1w8Xa9qjseSrgQoKj2Mn5uZmu6zKvYKVvVYuOoJmm6ttXMo+7wcJIWMQesuE6xre20C5+Zrnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743861508; c=relaxed/simple;
	bh=TlcOy/LVXLNv4yOlY3OkbohiJ6xwZanBVIKgTD9Hyoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmGy+2xbckOOp3sbEvxW97yoehZOkRsETS+hOwBRaS8PLuoboO/xC6sYxYbljj9nPF6rxZqV9MQuOvs8NqwcatfYjakAiQ5me/ce4vSAr7yAufKKCw9GdH0Y+UyllLmJ5owIg2obHfrAJ9yCgokTLmjYiGJA1cbuSwJJXqLyp54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/uMKtKf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/uMKtKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743861507; x=1775397507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TlcOy/LVXLNv4yOlY3OkbohiJ6xwZanBVIKgTD9Hyoc=;
  b=C/uMKtKfq1f6rcMWQ9jgbAufwg2Ff1vNFAM4sfrlYohOUVhxuGvdPdyz
   7wQKiakBrJkvsvM3+G7UfdNyErTuyUHSuBygpa1MW846fl884qKN+0PdN
   3lNO5VsTIFF0VHP5P4uInAAlR7+kOird6C+jclRoSKDv8HvpjGiY19fbt
   5TjWQpFHYjk4nT6yrU9K3Jt5om77P+MoG1lXJut+lGfovwTSqzA/Jcgvf
   t6QB83xOpLEcfPe1wtYV5E5v5R4n+Xuq3LKNh6Dcbvt6+g/sNXBL65q6R
   bhleIpExwzgLj+TbWip8+cmE4/XPTiV2GNCTO5vHl0u87BsBkXLfEAmHJ
   Q==;
X-CSE-ConnectionGUID: dz9eEPCsR3qwkTQ7QsXjvw==
X-CSE-MsgGUID: UllqRi0aQK67JG0VcTFd8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="55925189"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="55925189"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 06:58:26 -0700
X-CSE-ConnectionGUID: JyKenM7OSU2LlvYNeODZiQ==
X-CSE-MsgGUID: H9qPe6F9R1aqu8H1I6IjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="132517891"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Apr 2025 06:58:24 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u142Q-00024B-1V;
	Sat, 05 Apr 2025 13:58:22 +0000
Date: Sat, 5 Apr 2025 21:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] veth: apply qdisc backpressure on full
 ptr_ring to reduce TX drops
Message-ID: <202504052130.3cm740O3-lkp@intel.com>
References: <174377814192.3376479.16481605648460889310.stgit@firesoul>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174377814192.3376479.16481605648460889310.stgit@firesoul>

Hi Jesper,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesper-Dangaard-Brouer/veth-apply-qdisc-backpressure-on-full-ptr_ring-to-reduce-TX-drops/20250404-225209
base:   net-next/main
patch link:    https://lore.kernel.org/r/174377814192.3376479.16481605648460889310.stgit%40firesoul
patch subject: [RFC PATCH net-next] veth: apply qdisc backpressure on full ptr_ring to reduce TX drops
config: arm-randconfig-001-20250405 (https://download.01.org/0day-ci/archive/20250405/202504052130.3cm740O3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504052130.3cm740O3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504052130.3cm740O3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/veth.c:399:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     399 |                 struct netdev_queue *txq = netdev_get_tx_queue(dev, rxq);
         |                 ^
   1 warning generated.


vim +399 drivers/net/veth.c

   355	
   356	static netdev_tx_t veth_xmit(struct sk_buff *skb, struct net_device *dev)
   357	{
   358		struct veth_priv *rcv_priv, *priv = netdev_priv(dev);
   359		struct veth_rq *rq = NULL;
   360		struct net_device *rcv;
   361		int length = skb->len;
   362		bool use_napi = false;
   363		int ret, rxq;
   364	
   365		rcu_read_lock();
   366		rcv = rcu_dereference(priv->peer);
   367		if (unlikely(!rcv) || !pskb_may_pull(skb, ETH_HLEN)) {
   368			kfree_skb(skb);
   369			goto drop;
   370		}
   371	
   372		rcv_priv = netdev_priv(rcv);
   373		rxq = skb_get_queue_mapping(skb);
   374		if (rxq < rcv->real_num_rx_queues) {
   375			rq = &rcv_priv->rq[rxq];
   376	
   377			/* The napi pointer is available when an XDP program is
   378			 * attached or when GRO is enabled
   379			 * Don't bother with napi/GRO if the skb can't be aggregated
   380			 */
   381			use_napi = rcu_access_pointer(rq->napi) &&
   382				   veth_skb_is_eligible_for_gro(dev, rcv, skb);
   383		}
   384	
   385		skb_tx_timestamp(skb);
   386	
   387		ret = veth_forward_skb(rcv, skb, rq, use_napi);
   388		switch(ret) {
   389		case NET_RX_SUCCESS: /* same as NETDEV_TX_OK */
   390			if (!use_napi)
   391				dev_sw_netstats_tx_add(dev, 1, length);
   392			else
   393				__veth_xdp_flush(rq);
   394			break;
   395		case NETDEV_TX_BUSY:
   396			/* If a qdisc is attached to our virtual device, returning
   397			 * NETDEV_TX_BUSY is allowed.
   398			 */
 > 399			struct netdev_queue *txq = netdev_get_tx_queue(dev, rxq);
   400	
   401			if (!txq_has_qdisc(txq)) {
   402				dev_kfree_skb_any(skb);
   403				goto drop;
   404			}
   405			netif_tx_stop_queue(txq); /* Unconditional netif_txq_try_stop */
   406			if (use_napi)
   407				__veth_xdp_flush(rq);
   408	
   409			break;
   410		case NET_RX_DROP: /* same as NET_XMIT_DROP */
   411	drop:
   412			atomic64_inc(&priv->dropped);
   413			ret = NET_XMIT_DROP;
   414			break;
   415		default:
   416			net_crit_ratelimited("veth_xmit(%s): Invalid return code(%d)",
   417					     dev->name, ret);
   418		}
   419		rcu_read_unlock();
   420	
   421		return ret;
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
