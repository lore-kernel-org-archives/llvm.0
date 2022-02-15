Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333301578
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 15:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644938995; x=1676474995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7GyIzx2wPmqoXKHC37qPsaOExRweVV5eW3mv425Q9t8=;
  b=jH7ff5HNVUhdiXYFMYfBYqKdhwQ3b7w2vlgk0XpY5+ck111Fj5ubNGSG
   wczSVLBjlQ0U9PStAUjhUD483dmlUt9f3VX49ls0PbDzUfc+GF9P55wWr
   hR8Af5TgmDtvnowWLuesWVuG4vA9Is/1pHFcGKZd50yF6JSnl0eumkkhQ
   whVeNL0vRNp3CkLLbUQiMAlH8tZgyISkNR7YPDXPl6IbJtcvq0lO9KM0d
   8NXuYHln+0VPVvIAA+2F6w8XdhDyqX7Di1CFZvIdoR6sxKACZ0GIhEqK1
   oB747YqVMGQyImPSLEjp5edgpQTKeCBm8ODVkO627R+iZmiuPBuIYkj29
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="233916628"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="233916628"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 07:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="544345127"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Feb 2022 07:29:53 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJzm4-0009nc-Pu; Tue, 15 Feb 2022 15:29:52 +0000
Date: Tue, 15 Feb 2022 23:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: menglong8.dong@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 06/19] net: tcp: use kfree_skb_reason() for
 tcp_v{4,6}_do_rcv()
Message-ID: <202202152352.9jAkQxUc-lkp@intel.com>
References: <20220215112812.2093852-7-imagedong@tencent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215112812.2093852-7-imagedong@tencent.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220214]
[cannot apply to net-next/master rostedt-trace/for-next net/master linus/master v5.17-rc4 v5.17-rc3 v5.17-rc2 v5.17-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/menglong8-dong-gmail-com/net-add-skb-drop-reasons-for-TCP-IP-dev-and-neigh/20220215-193437
base:    259cbfc98c55ba3b6ef6e61fb7cfc3751dfded1e
config: i386-randconfig-a004-20220214 (https://download.01.org/0day-ci/archive/20220215/202202152352.9jAkQxUc-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8619663f7f150a5f5d782d8f6083988f56505777
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review menglong8-dong-gmail-com/net-add-skb-drop-reasons-for-TCP-IP-dev-and-neigh/20220215-193437
        git checkout 8619663f7f150a5f5d782d8f6083988f56505777
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/ipv6/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv6/tcp_ipv6.c:1556:6: warning: variable 'reason' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (tcp_rcv_state_process(sk, skb))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/tcp_ipv6.c:1567:24: note: uninitialized use occurs here
           kfree_skb_reason(skb, reason);
                                 ^~~~~~
   net/ipv6/tcp_ipv6.c:1556:2: note: remove the 'if' if its condition is always false
           if (tcp_rcv_state_process(sk, skb))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/tcp_ipv6.c:1547:8: warning: variable 'reason' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                           if (tcp_child_process(sk, nsk, skb))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/tcp_ipv6.c:1567:24: note: uninitialized use occurs here
           kfree_skb_reason(skb, reason);
                                 ^~~~~~
   net/ipv6/tcp_ipv6.c:1547:4: note: remove the 'if' if its condition is always false
                           if (tcp_child_process(sk, nsk, skb))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/tcp_ipv6.c:1543:7: warning: variable 'reason' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (!nsk)
                       ^~~~
   net/ipv6/tcp_ipv6.c:1567:24: note: uninitialized use occurs here
           kfree_skb_reason(skb, reason);
                                 ^~~~~~
   net/ipv6/tcp_ipv6.c:1543:3: note: remove the 'if' if its condition is always false
                   if (!nsk)
                   ^~~~~~~~~
   net/ipv6/tcp_ipv6.c:1479:2: note: variable 'reason' is declared here
           enum skb_drop_reason reason;
           ^
   3 warnings generated.


vim +1556 net/ipv6/tcp_ipv6.c

^1da177e4c3f41 Linus Torvalds           2005-04-16  1463  
bbd807dfbf2050 Brian Vazquez            2021-02-01  1464  INDIRECT_CALLABLE_DECLARE(struct dst_entry *ipv4_dst_check(struct dst_entry *,
bbd807dfbf2050 Brian Vazquez            2021-02-01  1465  							   u32));
^1da177e4c3f41 Linus Torvalds           2005-04-16  1466  /* The socket must have it's spinlock held when we get
e994b2f0fb9229 Eric Dumazet             2015-10-02  1467   * here, unless it is a TCP_LISTEN socket.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1468   *
^1da177e4c3f41 Linus Torvalds           2005-04-16  1469   * We have a potential double-lock case here, so even when
^1da177e4c3f41 Linus Torvalds           2005-04-16  1470   * doing backlog processing we use the BH locking scheme.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1471   * This is because we cannot sleep with the original spinlock
^1da177e4c3f41 Linus Torvalds           2005-04-16  1472   * held.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1473   */
d2489c7b6d7d5e Eric Dumazet             2021-11-15  1474  INDIRECT_CALLABLE_SCOPE
d2489c7b6d7d5e Eric Dumazet             2021-11-15  1475  int tcp_v6_do_rcv(struct sock *sk, struct sk_buff *skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1476  {
93a77c11ae79e8 Eric Dumazet             2019-03-19  1477  	struct ipv6_pinfo *np = tcp_inet6_sk(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1478  	struct sk_buff *opt_skb = NULL;
8619663f7f150a Menglong Dong            2022-02-15  1479  	enum skb_drop_reason reason;
93a77c11ae79e8 Eric Dumazet             2019-03-19  1480  	struct tcp_sock *tp;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1481  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1482  	/* Imagine: socket is IPv6. IPv4 packet arrives,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1483  	   goes to IPv4 receive handler and backlogged.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1484  	   From backlog it always goes here. Kerboom...
^1da177e4c3f41 Linus Torvalds           2005-04-16  1485  	   Fortunately, tcp_rcv_established and rcv_established
^1da177e4c3f41 Linus Torvalds           2005-04-16  1486  	   handle them correctly, but it is not case with
^1da177e4c3f41 Linus Torvalds           2005-04-16  1487  	   tcp_v6_hnd_req and tcp_v6_send_reset().   --ANK
^1da177e4c3f41 Linus Torvalds           2005-04-16  1488  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1489  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1490  	if (skb->protocol == htons(ETH_P_IP))
^1da177e4c3f41 Linus Torvalds           2005-04-16  1491  		return tcp_v4_do_rcv(sk, skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1492  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1493  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1494  	 *	socket locking is here for SMP purposes as backlog rcv
^1da177e4c3f41 Linus Torvalds           2005-04-16  1495  	 *	is currently called with bh processing disabled.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1496  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1497  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1498  	/* Do Stevens' IPV6_PKTOPTIONS.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1499  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1500  	   Yes, guys, it is the only place in our code, where we
^1da177e4c3f41 Linus Torvalds           2005-04-16  1501  	   may make it not affecting IPv4.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1502  	   The rest of code is protocol independent,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1503  	   and I do not like idea to uglify IPv4.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1504  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1505  	   Actually, all the idea behind IPV6_PKTOPTIONS
^1da177e4c3f41 Linus Torvalds           2005-04-16  1506  	   looks not very well thought. For now we latch
^1da177e4c3f41 Linus Torvalds           2005-04-16  1507  	   options, received in the last packet, enqueued
^1da177e4c3f41 Linus Torvalds           2005-04-16  1508  	   by tcp. Feel free to propose better solution.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1509  					       --ANK (980728)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1510  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1511  	if (np->rxopt.all)
7450aaf61f0ae2 Eric Dumazet             2015-11-30  1512  		opt_skb = skb_clone(skb, sk_gfp_mask(sk, GFP_ATOMIC));
^1da177e4c3f41 Linus Torvalds           2005-04-16  1513  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1514  	if (sk->sk_state == TCP_ESTABLISHED) { /* Fast path */
8f905c0e7354ef Eric Dumazet             2021-12-20  1515  		struct dst_entry *dst;
8f905c0e7354ef Eric Dumazet             2021-12-20  1516  
8f905c0e7354ef Eric Dumazet             2021-12-20  1517  		dst = rcu_dereference_protected(sk->sk_rx_dst,
8f905c0e7354ef Eric Dumazet             2021-12-20  1518  						lockdep_sock_is_held(sk));
5d299f3d3c8a2f Eric Dumazet             2012-08-06  1519  
bdeab991918663 Tom Herbert              2011-08-14  1520  		sock_rps_save_rxhash(sk, skb);
3d97379a67486b Eric Dumazet             2014-11-11  1521  		sk_mark_napi_id(sk, skb);
5d299f3d3c8a2f Eric Dumazet             2012-08-06  1522  		if (dst) {
0c0a5ef809f915 Eric Dumazet             2021-10-25  1523  			if (sk->sk_rx_dst_ifindex != skb->skb_iif ||
bbd807dfbf2050 Brian Vazquez            2021-02-01  1524  			    INDIRECT_CALL_1(dst->ops->check, ip6_dst_check,
ef57c1610dd8fb Eric Dumazet             2021-10-25  1525  					    dst, sk->sk_rx_dst_cookie) == NULL) {
8f905c0e7354ef Eric Dumazet             2021-12-20  1526  				RCU_INIT_POINTER(sk->sk_rx_dst, NULL);
5d299f3d3c8a2f Eric Dumazet             2012-08-06  1527  				dst_release(dst);
5d299f3d3c8a2f Eric Dumazet             2012-08-06  1528  			}
5d299f3d3c8a2f Eric Dumazet             2012-08-06  1529  		}
5d299f3d3c8a2f Eric Dumazet             2012-08-06  1530  
3d97d88e8091f3 Yafang Shao              2018-05-29  1531  		tcp_rcv_established(sk, skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1532  		if (opt_skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1533  			goto ipv6_pktoptions;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1534  		return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1535  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1536  
12e25e1041d044 Eric Dumazet             2015-06-03  1537  	if (tcp_checksum_complete(skb))
^1da177e4c3f41 Linus Torvalds           2005-04-16  1538  		goto csum_err;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1539  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1540  	if (sk->sk_state == TCP_LISTEN) {
079096f103faca Eric Dumazet             2015-10-02  1541  		struct sock *nsk = tcp_v6_cookie_check(sk, skb);
079096f103faca Eric Dumazet             2015-10-02  1542  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1543  		if (!nsk)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1544  			goto discard;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1545  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1546  		if (nsk != sk) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1547  			if (tcp_child_process(sk, nsk, skb))
^1da177e4c3f41 Linus Torvalds           2005-04-16  1548  				goto reset;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1549  			if (opt_skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1550  				__kfree_skb(opt_skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1551  			return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1552  		}
47482f132a689a Neil Horman              2011-04-06  1553  	} else
bdeab991918663 Tom Herbert              2011-08-14  1554  		sock_rps_save_rxhash(sk, skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1555  
72ab4a86f7a260 Eric Dumazet             2015-09-29 @1556  	if (tcp_rcv_state_process(sk, skb))
^1da177e4c3f41 Linus Torvalds           2005-04-16  1557  		goto reset;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1558  	if (opt_skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1559  		goto ipv6_pktoptions;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1560  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1561  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1562  reset:
cfb6eeb4c86059 YOSHIFUJI Hideaki        2006-11-14  1563  	tcp_v6_send_reset(sk, skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1564  discard:
^1da177e4c3f41 Linus Torvalds           2005-04-16  1565  	if (opt_skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1566  		__kfree_skb(opt_skb);
8619663f7f150a Menglong Dong            2022-02-15  1567  	kfree_skb_reason(skb, reason);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1568  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1569  csum_err:
8619663f7f150a Menglong Dong            2022-02-15  1570  	reason = SKB_DROP_REASON_TCP_CSUM;
709c0314239992 Jakub Kicinski           2021-05-14  1571  	trace_tcp_bad_csum(skb);
c10d9310edf5aa Eric Dumazet             2016-04-29  1572  	TCP_INC_STATS(sock_net(sk), TCP_MIB_CSUMERRORS);
c10d9310edf5aa Eric Dumazet             2016-04-29  1573  	TCP_INC_STATS(sock_net(sk), TCP_MIB_INERRS);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1574  	goto discard;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1575  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1576  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1577  ipv6_pktoptions:
^1da177e4c3f41 Linus Torvalds           2005-04-16  1578  	/* Do you ask, what is it?
^1da177e4c3f41 Linus Torvalds           2005-04-16  1579  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1580  	   1. skb was enqueued by tcp.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1581  	   2. skb is added to tail of read queue, rather than out of order.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1582  	   3. socket is not in passive state.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1583  	   4. Finally, it really contains options, which user wants to receive.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1584  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1585  	tp = tcp_sk(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1586  	if (TCP_SKB_CB(opt_skb)->end_seq == tp->rcv_nxt &&
^1da177e4c3f41 Linus Torvalds           2005-04-16  1587  	    !((1 << sk->sk_state) & (TCPF_CLOSE | TCPF_LISTEN))) {
333fad5364d6b4 YOSHIFUJI Hideaki        2005-09-08  1588  		if (np->rxopt.bits.rxinfo || np->rxopt.bits.rxoinfo)
870c3151382c98 Eric Dumazet             2014-10-17  1589  			np->mcast_oif = tcp_v6_iif(opt_skb);
333fad5364d6b4 YOSHIFUJI Hideaki        2005-09-08  1590  		if (np->rxopt.bits.rxhlim || np->rxopt.bits.rxohlim)
0660e03f6b18f1 Arnaldo Carvalho de Melo 2007-04-25  1591  			np->mcast_hops = ipv6_hdr(opt_skb)->hop_limit;
82e9f105a28006 Florent Fourcot          2013-12-08  1592  		if (np->rxopt.bits.rxflow || np->rxopt.bits.rxtclass)
1397ed35f22d7c Florent Fourcot          2013-12-08  1593  			np->rcv_flowinfo = ip6_flowinfo(ipv6_hdr(opt_skb));
df3687ffc6653e Florent Fourcot          2014-01-17  1594  		if (np->repflow)
df3687ffc6653e Florent Fourcot          2014-01-17  1595  			np->flow_label = ip6_flowlabel(ipv6_hdr(opt_skb));
a224772db8420e Eric Dumazet             2014-09-27  1596  		if (ipv6_opt_accepted(sk, opt_skb, &TCP_SKB_CB(opt_skb)->header.h6)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1597  			skb_set_owner_r(opt_skb, sk);
8ce48623f0cf3d Eric Dumazet             2016-10-12  1598  			tcp_v6_restore_cb(opt_skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1599  			opt_skb = xchg(&np->pktoptions, opt_skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1600  		} else {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1601  			__kfree_skb(opt_skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1602  			opt_skb = xchg(&np->pktoptions, NULL);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1603  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1604  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1605  
12c8691de30734 Eric Dumazet             2021-10-25  1606  	consume_skb(opt_skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1607  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1608  }
^1da177e4c3f41 Linus Torvalds           2005-04-16  1609  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
