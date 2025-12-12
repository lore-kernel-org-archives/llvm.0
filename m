Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE0E256C6D;
	Fri, 12 Dec 2025 06:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765520796; cv=none; b=WEVgDYOA66kwzBAIMMNnwk/qMIUBJ/G0QhXJWNcucILIj8uBbfX2n1eJW9syug1HVk4CKFhqWA2GtwC6vRz6DI9imxHY55Qdc8f6LqIiBsLWkogH4+5Os0nKB7OS2At8H1+pDlDtsY7seNOmw2VjmxegWRXG64uTzyy3uM3KI9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765520796; c=relaxed/simple;
	bh=Iq4Mj6qpPSNHBj8ZaBv6q7Qg7Mz9GXbnVU5adFWF9CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeChEKtFRD7Jko5+O6nPsHI0chahvOmu6Rublhk/wlzZ7QDrgPFGJ80y/2riFSuSKb1bFwwf9u6H5bLuz3thcpsrb0M3nWcHFaJM2eiczdIBB76QuZTFSdF4gJTyRQjHuf4QvkQY+5Knh38nvy/ySOidyFQY/1u2qI8I8eKHRLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPg9FC5n; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPg9FC5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765520794; x=1797056794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iq4Mj6qpPSNHBj8ZaBv6q7Qg7Mz9GXbnVU5adFWF9CM=;
  b=lPg9FC5nn0bs3f2hJRxUcX8sN7J1SIsW/7Gb155kXSHOuMl5k6YJHxDT
   H2KAv+diDvB0u3aa7248KyfIpaKyg68H7Lfxj8W6ffFNO+KjzSFPtCL6S
   SpB0Jfb0q7e/hYGkEa9STXFMcqmDwPlOcEwu2wDx3nnbrLsm914veJtBL
   hMTehHKW8H9xv6elU8fP2kKYNEMg7rHfCLu+dZivY+eDn3OgbXizrQLJk
   vO+/tuiX+ZB0uWF+DGMUxiuHLYRuwAxM6ZMtwWMhr7KS1vXvW/CHC8qfo
   S1yAwJ+2mzaINTw+OKqUFuiol/wi92/MO5OdwBmd6Qjho6uIWRByWRMLs
   w==;
X-CSE-ConnectionGUID: NunvSPStSje1SyRYdjLXtw==
X-CSE-MsgGUID: Yq6Kr9VGQTKPA/gmeEJ5Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70090559"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="70090559"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 22:26:32 -0800
X-CSE-ConnectionGUID: AFItSRgNQO2tVqSiEPjhpA==
X-CSE-MsgGUID: 5TGpmnypSVOj76QjbsGzjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="227647676"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Dec 2025 22:26:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTwbk-000000005ez-3qiq;
	Fri, 12 Dec 2025 06:26:28 +0000
Date: Fri, 12 Dec 2025 14:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net 1/1] net: sched: Fix ethx:ingress -> ethy:egress
 -> ethx:ingress mirred loop
Message-ID: <202512121401.3NRi0dUf-lkp@intel.com>
References: <20251210172554.1071864-1-jhs@mojatatu.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210172554.1071864-1-jhs@mojatatu.com>

Hi Jamal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-Fix-ethx-ingress-ethy-egress-ethx-ingress-mirred-loop/20251211-012948
base:   net/main
patch link:    https://lore.kernel.org/r/20251210172554.1071864-1-jhs%40mojatatu.com
patch subject: [PATCH RFC net 1/1] net: sched: Fix ethx:ingress -> ethy:egress -> ethx:ingress mirred loop
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251212/202512121401.3NRi0dUf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121401.3NRi0dUf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121401.3NRi0dUf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/pktgen.c:3593:4: error: call to undeclared function 'skb_reset_redirect'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3593 |                         skb_reset_redirect(skb);
         |                         ^
   1 error generated.
--
>> net/netfilter/nft_fwd_netdev.c:34:2: error: call to undeclared function 'skb_set_redirected'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      34 |         skb_set_redirected(skb, nft_hook(pkt) == NF_NETDEV_INGRESS);
         |         ^
   1 error generated.
--
   In file included from drivers/net/wireguard/main.c:9:
>> drivers/net/wireguard/queueing.h:96:2: error: call to undeclared function 'skb_reset_redirect'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      96 |         skb_reset_redirect(skb);
         |         ^
   1 error generated.


vim +/skb_reset_redirect +3593 net/core/pktgen.c

3791decb5aa0202 Stephen Hemminger   2009-08-27  3509  
475ac1e4099a005 Stephen Hemminger   2009-08-27  3510  static void pktgen_xmit(struct pktgen_dev *pkt_dev)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3511  {
7c7dd1d64910d07 Liang Chen          2023-09-20  3512  	bool skb_shared = !!(READ_ONCE(pkt_dev->flags) & F_SHARED);
008298231abbeb9 Stephen Hemminger   2008-11-20  3513  	struct net_device *odev = pkt_dev->odev;
fd2ea0a79faad82 David S. Miller     2008-07-17  3514  	struct netdev_queue *txq;
7c7dd1d64910d07 Liang Chen          2023-09-20  3515  	unsigned int burst = 1;
62f64aed622b605 Alexei Starovoitov  2015-05-07  3516  	struct sk_buff *skb;
7c7dd1d64910d07 Liang Chen          2023-09-20  3517  	int clone_skb = 0;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3518  	int ret;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3519  
7c7dd1d64910d07 Liang Chen          2023-09-20  3520  	/* If 'skb_shared' is false, the read of possible
7c7dd1d64910d07 Liang Chen          2023-09-20  3521  	 * new values (if any) for 'burst' and 'clone_skb' will be skipped to
7c7dd1d64910d07 Liang Chen          2023-09-20  3522  	 * prevent some concurrent changes from slipping in. And the stabilized
7c7dd1d64910d07 Liang Chen          2023-09-20  3523  	 * config will be read in during the next run of pktgen_xmit.
7c7dd1d64910d07 Liang Chen          2023-09-20  3524  	 */
7c7dd1d64910d07 Liang Chen          2023-09-20  3525  	if (skb_shared) {
7c7dd1d64910d07 Liang Chen          2023-09-20  3526  		burst = READ_ONCE(pkt_dev->burst);
7c7dd1d64910d07 Liang Chen          2023-09-20  3527  		clone_skb = READ_ONCE(pkt_dev->clone_skb);
7c7dd1d64910d07 Liang Chen          2023-09-20  3528  	}
7c7dd1d64910d07 Liang Chen          2023-09-20  3529  
ef87979c273a234 Stephen Hemminger   2009-09-22  3530  	/* If device is offline, then don't send */
ef87979c273a234 Stephen Hemminger   2009-09-22  3531  	if (unlikely(!netif_running(odev) || !netif_carrier_ok(odev))) {
ef87979c273a234 Stephen Hemminger   2009-09-22  3532  		pktgen_stop_device(pkt_dev);
ef87979c273a234 Stephen Hemminger   2009-09-22  3533  		return;
ef87979c273a234 Stephen Hemminger   2009-09-22  3534  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3535  
^1da177e4c3f415 Linus Torvalds      2005-04-16  3536  	/* This is max DELAY, this has special meaning of
^1da177e4c3f415 Linus Torvalds      2005-04-16  3537  	 * "never transmit"
^1da177e4c3f415 Linus Torvalds      2005-04-16  3538  	 */
ef87979c273a234 Stephen Hemminger   2009-09-22  3539  	if (unlikely(pkt_dev->delay == ULLONG_MAX)) {
398f382c0a5bd62 Daniel Borkmann     2012-10-28  3540  		pkt_dev->next_tx = ktime_add_ns(ktime_get(), ULONG_MAX);
3791decb5aa0202 Stephen Hemminger   2009-08-27  3541  		return;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3542  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3543  
ef87979c273a234 Stephen Hemminger   2009-09-22  3544  	/* If no skb or clone count exhausted then get new one */
7d7bb1cf0ea7434 Stephen Hemminger   2009-08-27  3545  	if (!pkt_dev->skb || (pkt_dev->last_ok &&
7c7dd1d64910d07 Liang Chen          2023-09-20  3546  			      ++pkt_dev->clone_count >= clone_skb)) {
^1da177e4c3f415 Linus Torvalds      2005-04-16  3547  		/* build a new pkt */
^1da177e4c3f415 Linus Torvalds      2005-04-16  3548  		kfree_skb(pkt_dev->skb);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3549  
^1da177e4c3f415 Linus Torvalds      2005-04-16  3550  		pkt_dev->skb = fill_packet(odev, pkt_dev);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3551  		if (pkt_dev->skb == NULL) {
f9467eaec36a4ee Joe Perches         2010-06-21  3552  			pr_err("ERROR: couldn't allocate skb in fill_packet\n");
^1da177e4c3f415 Linus Torvalds      2005-04-16  3553  			schedule();
^1da177e4c3f415 Linus Torvalds      2005-04-16  3554  			pkt_dev->clone_count--;	/* back out increment, OOM */
3791decb5aa0202 Stephen Hemminger   2009-08-27  3555  			return;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3556  		}
baac8564547ac7f Eric Dumazet        2009-11-05  3557  		pkt_dev->last_pkt_size = pkt_dev->skb->len;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3558  		pkt_dev->clone_count = 0;	/* reset counter */
^1da177e4c3f415 Linus Torvalds      2005-04-16  3559  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3560  
ef87979c273a234 Stephen Hemminger   2009-09-22  3561  	if (pkt_dev->delay && pkt_dev->last_ok)
ef87979c273a234 Stephen Hemminger   2009-09-22  3562  		spin(pkt_dev, pkt_dev->next_tx);
ef87979c273a234 Stephen Hemminger   2009-09-22  3563  
62f64aed622b605 Alexei Starovoitov  2015-05-07  3564  	if (pkt_dev->xmit_mode == M_NETIF_RECEIVE) {
62f64aed622b605 Alexei Starovoitov  2015-05-07  3565  		skb = pkt_dev->skb;
62f64aed622b605 Alexei Starovoitov  2015-05-07  3566  		skb->protocol = eth_type_trans(skb, skb->dev);
7c7dd1d64910d07 Liang Chen          2023-09-20  3567  		if (skb_shared)
633547973ffc32f Reshetova, Elena    2017-06-30  3568  			refcount_add(burst, &skb->users);
62f64aed622b605 Alexei Starovoitov  2015-05-07  3569  		local_bh_disable();
62f64aed622b605 Alexei Starovoitov  2015-05-07  3570  		do {
62f64aed622b605 Alexei Starovoitov  2015-05-07  3571  			ret = netif_receive_skb(skb);
62f64aed622b605 Alexei Starovoitov  2015-05-07  3572  			if (ret == NET_RX_DROP)
62f64aed622b605 Alexei Starovoitov  2015-05-07  3573  				pkt_dev->errors++;
62f64aed622b605 Alexei Starovoitov  2015-05-07  3574  			pkt_dev->sofar++;
62f64aed622b605 Alexei Starovoitov  2015-05-07  3575  			pkt_dev->seq_num++;
7c7dd1d64910d07 Liang Chen          2023-09-20  3576  			if (unlikely(!skb_shared)) {
7c7dd1d64910d07 Liang Chen          2023-09-20  3577  				pkt_dev->skb = NULL;
7c7dd1d64910d07 Liang Chen          2023-09-20  3578  				break;
7c7dd1d64910d07 Liang Chen          2023-09-20  3579  			}
633547973ffc32f Reshetova, Elena    2017-06-30  3580  			if (refcount_read(&skb->users) != burst) {
62f64aed622b605 Alexei Starovoitov  2015-05-07  3581  				/* skb was queued by rps/rfs or taps,
62f64aed622b605 Alexei Starovoitov  2015-05-07  3582  				 * so cannot reuse this skb
62f64aed622b605 Alexei Starovoitov  2015-05-07  3583  				 */
633547973ffc32f Reshetova, Elena    2017-06-30  3584  				WARN_ON(refcount_sub_and_test(burst - 1, &skb->users));
62f64aed622b605 Alexei Starovoitov  2015-05-07  3585  				/* get out of the loop and wait
62f64aed622b605 Alexei Starovoitov  2015-05-07  3586  				 * until skb is consumed
62f64aed622b605 Alexei Starovoitov  2015-05-07  3587  				 */
62f64aed622b605 Alexei Starovoitov  2015-05-07  3588  				break;
62f64aed622b605 Alexei Starovoitov  2015-05-07  3589  			}
62f64aed622b605 Alexei Starovoitov  2015-05-07  3590  			/* skb was 'freed' by stack, so clean few
62f64aed622b605 Alexei Starovoitov  2015-05-07  3591  			 * bits and reuse it
62f64aed622b605 Alexei Starovoitov  2015-05-07  3592  			 */
2c64605b590edad Pablo Neira Ayuso   2020-03-25 @3593  			skb_reset_redirect(skb);
62f64aed622b605 Alexei Starovoitov  2015-05-07  3594  		} while (--burst > 0);
62f64aed622b605 Alexei Starovoitov  2015-05-07  3595  		goto out; /* Skips xmit_mode M_START_XMIT */
0967f2445963b63 John Fastabend      2016-07-02  3596  	} else if (pkt_dev->xmit_mode == M_QUEUE_XMIT) {
0967f2445963b63 John Fastabend      2016-07-02  3597  		local_bh_disable();
7c7dd1d64910d07 Liang Chen          2023-09-20  3598  		if (skb_shared)
633547973ffc32f Reshetova, Elena    2017-06-30  3599  			refcount_inc(&pkt_dev->skb->users);
0967f2445963b63 John Fastabend      2016-07-02  3600  
0967f2445963b63 John Fastabend      2016-07-02  3601  		ret = dev_queue_xmit(pkt_dev->skb);
7c7dd1d64910d07 Liang Chen          2023-09-20  3602  
7c7dd1d64910d07 Liang Chen          2023-09-20  3603  		if (!skb_shared && dev_xmit_complete(ret))
7c7dd1d64910d07 Liang Chen          2023-09-20  3604  			pkt_dev->skb = NULL;
7c7dd1d64910d07 Liang Chen          2023-09-20  3605  
0967f2445963b63 John Fastabend      2016-07-02  3606  		switch (ret) {
0967f2445963b63 John Fastabend      2016-07-02  3607  		case NET_XMIT_SUCCESS:
0967f2445963b63 John Fastabend      2016-07-02  3608  			pkt_dev->sofar++;
0967f2445963b63 John Fastabend      2016-07-02  3609  			pkt_dev->seq_num++;
0967f2445963b63 John Fastabend      2016-07-02  3610  			pkt_dev->tx_bytes += pkt_dev->last_pkt_size;
0967f2445963b63 John Fastabend      2016-07-02  3611  			break;
0967f2445963b63 John Fastabend      2016-07-02  3612  		case NET_XMIT_DROP:
0967f2445963b63 John Fastabend      2016-07-02  3613  		case NET_XMIT_CN:
0967f2445963b63 John Fastabend      2016-07-02  3614  		/* These are all valid return codes for a qdisc but
0967f2445963b63 John Fastabend      2016-07-02  3615  		 * indicate packets are being dropped or will likely
0967f2445963b63 John Fastabend      2016-07-02  3616  		 * be dropped soon.
0967f2445963b63 John Fastabend      2016-07-02  3617  		 */
0967f2445963b63 John Fastabend      2016-07-02  3618  		case NETDEV_TX_BUSY:
0967f2445963b63 John Fastabend      2016-07-02  3619  		/* qdisc may call dev_hard_start_xmit directly in cases
0967f2445963b63 John Fastabend      2016-07-02  3620  		 * where no queues exist e.g. loopback device, virtual
0967f2445963b63 John Fastabend      2016-07-02  3621  		 * devices, etc. In this case we need to handle
0967f2445963b63 John Fastabend      2016-07-02  3622  		 * NETDEV_TX_ codes.
0967f2445963b63 John Fastabend      2016-07-02  3623  		 */
0967f2445963b63 John Fastabend      2016-07-02  3624  		default:
0967f2445963b63 John Fastabend      2016-07-02  3625  			pkt_dev->errors++;
0967f2445963b63 John Fastabend      2016-07-02  3626  			net_info_ratelimited("%s xmit error: %d\n",
0967f2445963b63 John Fastabend      2016-07-02  3627  					     pkt_dev->odevname, ret);
0967f2445963b63 John Fastabend      2016-07-02  3628  			break;
0967f2445963b63 John Fastabend      2016-07-02  3629  		}
0967f2445963b63 John Fastabend      2016-07-02  3630  		goto out;
62f64aed622b605 Alexei Starovoitov  2015-05-07  3631  	}
62f64aed622b605 Alexei Starovoitov  2015-05-07  3632  
10c51b56232d24f Daniel Borkmann     2014-08-27  3633  	txq = skb_get_tx_queue(odev, pkt_dev->skb);
fd2ea0a79faad82 David S. Miller     2008-07-17  3634  
0f2eea4b7e29ab6 Daniel Borkmann     2014-04-11  3635  	local_bh_disable();
0f2eea4b7e29ab6 Daniel Borkmann     2014-04-11  3636  
0f2eea4b7e29ab6 Daniel Borkmann     2014-04-11  3637  	HARD_TX_LOCK(odev, txq, smp_processor_id());
5b8db2f568c4ee2 Stephen Hemminger   2009-08-27  3638  
6f25cd47dcd2b99 Daniel Borkmann     2014-04-07  3639  	if (unlikely(netif_xmit_frozen_or_drv_stopped(txq))) {
0835acfe72e43b2 Eric Dumazet        2009-09-30  3640  		pkt_dev->last_ok = 0;
0835acfe72e43b2 Eric Dumazet        2009-09-30  3641  		goto unlock;
0835acfe72e43b2 Eric Dumazet        2009-09-30  3642  	}
7c7dd1d64910d07 Liang Chen          2023-09-20  3643  	if (skb_shared)
633547973ffc32f Reshetova, Elena    2017-06-30  3644  		refcount_add(burst, &pkt_dev->skb->users);
38b2cf2982dc73d Alexei Starovoitov  2014-09-30  3645  
38b2cf2982dc73d Alexei Starovoitov  2014-09-30  3646  xmit_more:
38b2cf2982dc73d Alexei Starovoitov  2014-09-30  3647  	ret = netdev_start_xmit(pkt_dev->skb, odev, txq, --burst > 0);
ef87979c273a234 Stephen Hemminger   2009-09-22  3648  
7c7dd1d64910d07 Liang Chen          2023-09-20  3649  	if (!skb_shared && dev_xmit_complete(ret))
7c7dd1d64910d07 Liang Chen          2023-09-20  3650  		pkt_dev->skb = NULL;
7c7dd1d64910d07 Liang Chen          2023-09-20  3651  
5b8db2f568c4ee2 Stephen Hemminger   2009-08-27  3652  	switch (ret) {
5b8db2f568c4ee2 Stephen Hemminger   2009-08-27  3653  	case NETDEV_TX_OK:
^1da177e4c3f415 Linus Torvalds      2005-04-16  3654  		pkt_dev->last_ok = 1;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3655  		pkt_dev->sofar++;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3656  		pkt_dev->seq_num++;
baac8564547ac7f Eric Dumazet        2009-11-05  3657  		pkt_dev->tx_bytes += pkt_dev->last_pkt_size;
38b2cf2982dc73d Alexei Starovoitov  2014-09-30  3658  		if (burst > 0 && !netif_xmit_frozen_or_drv_stopped(txq))
38b2cf2982dc73d Alexei Starovoitov  2014-09-30  3659  			goto xmit_more;
5b8db2f568c4ee2 Stephen Hemminger   2009-08-27  3660  		break;
f466dba1832f050 John Fastabend      2009-12-23  3661  	case NET_XMIT_DROP:
f466dba1832f050 John Fastabend      2009-12-23  3662  	case NET_XMIT_CN:
f466dba1832f050 John Fastabend      2009-12-23  3663  		/* skb has been consumed */
f466dba1832f050 John Fastabend      2009-12-23  3664  		pkt_dev->errors++;
f466dba1832f050 John Fastabend      2009-12-23  3665  		break;
5b8db2f568c4ee2 Stephen Hemminger   2009-08-27  3666  	default: /* Drivers are not supposed to return other values! */
e87cc4728f0e2fb Joe Perches         2012-05-13  3667  		net_info_ratelimited("%s xmit error: %d\n",
e87cc4728f0e2fb Joe Perches         2012-05-13  3668  				     pkt_dev->odevname, ret);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3669  		pkt_dev->errors++;
df561f6688fef77 Gustavo A. R. Silva 2020-08-23  3670  		fallthrough;
5b8db2f568c4ee2 Stephen Hemminger   2009-08-27  3671  	case NETDEV_TX_BUSY:
5b8db2f568c4ee2 Stephen Hemminger   2009-08-27  3672  		/* Retry it next time */
7c7dd1d64910d07 Liang Chen          2023-09-20  3673  		if (skb_shared)
7c7dd1d64910d07 Liang Chen          2023-09-20  3674  			refcount_dec(&pkt_dev->skb->users);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3675  		pkt_dev->last_ok = 0;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3676  	}
38b2cf2982dc73d Alexei Starovoitov  2014-09-30  3677  	if (unlikely(burst))
633547973ffc32f Reshetova, Elena    2017-06-30  3678  		WARN_ON(refcount_sub_and_test(burst, &pkt_dev->skb->users));
0835acfe72e43b2 Eric Dumazet        2009-09-30  3679  unlock:
0f2eea4b7e29ab6 Daniel Borkmann     2014-04-11  3680  	HARD_TX_UNLOCK(odev, txq);
0f2eea4b7e29ab6 Daniel Borkmann     2014-04-11  3681  
62f64aed622b605 Alexei Starovoitov  2015-05-07  3682  out:
0f2eea4b7e29ab6 Daniel Borkmann     2014-04-11  3683  	local_bh_enable();
^1da177e4c3f415 Linus Torvalds      2005-04-16  3684  
^1da177e4c3f415 Linus Torvalds      2005-04-16  3685  	/* If pkt_dev->count is zero, then run forever */
^1da177e4c3f415 Linus Torvalds      2005-04-16  3686  	if ((pkt_dev->count != 0) && (pkt_dev->sofar >= pkt_dev->count)) {
7c7dd1d64910d07 Liang Chen          2023-09-20  3687  		if (pkt_dev->skb)
ef87979c273a234 Stephen Hemminger   2009-09-22  3688  			pktgen_wait_for_skb(pkt_dev);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3689  
^1da177e4c3f415 Linus Torvalds      2005-04-16  3690  		/* Done with this */
^1da177e4c3f415 Linus Torvalds      2005-04-16  3691  		pktgen_stop_device(pkt_dev);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3692  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3693  }
^1da177e4c3f415 Linus Torvalds      2005-04-16  3694  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
