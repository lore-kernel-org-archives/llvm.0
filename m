Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6CA1A239A;
	Wed,  8 Apr 2026 02:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775616827; cv=none; b=OrdFXfAfUqZtGesgndcp0AHtZci4E0jYKQiqnh3OwdF3CGtABf12qZrmLKT8cxXAukHaBoEC020P4GIvJSUB89uKpeA+YZbpasLNRQS6lSnJtPd34Bg072bA8asT70fdgnGApk2Qv6HE+1/Pden0uqbgmIEKpVM4Sv1AevCycPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775616827; c=relaxed/simple;
	bh=W/q8yDzNKaB97FsCk47S1WxXRftQjKwIPb0Z+4wOefo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GMC30T4dr6LVxDf8oq1YePA8xKqx57XTK1A37pHmBe/9QgN4iuATn/Ttqy2k3+PxozDI0rw1pSWjJJHeIpGM/6OfluERT0yhvxkRwxe4OdSF0c7WzppJ9Y66oX86f/hhriQSH7upezaD/rR0uS4HrvDTfxcCd7hJ2vd+PFoUD68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKgbuSmv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKgbuSmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775616825; x=1807152825;
  h=date:from:to:cc:subject:message-id;
  bh=W/q8yDzNKaB97FsCk47S1WxXRftQjKwIPb0Z+4wOefo=;
  b=QKgbuSmvNajc+adaMGpM34XRMzROX9qwWRGjHuOsiIfOT41i5FhMBe0B
   0Q9dJOBlhM3y0vvQQaVqibeYtQo7qHSoYcAeAet1ut1GcjRoGnDkH9tXL
   k99uRcINHz3sGPbHh4QhXX1e+zOP3ashMSmSRZRsQKQJADczvHoUFmRcy
   dHxO5i6tWIlyCYzlLUkHvUvc0v8/G6w2BAoZVnSljqmMBVPfL0WOTBO8c
   /5xhXvuvrQA+kyZ4b4jFfA0puCUou2C6omfHGfzqOKPOMOzFMBG1hBQqA
   mOcH7G2/Y4xzfn5Bx1uklrB/J94F5je1ma4ai8Z2/qOM2zaJS74fc5ZoQ
   w==;
X-CSE-ConnectionGUID: uJ0RqFb7SYyMFqnaapBgSQ==
X-CSE-MsgGUID: kbuaGxjSTYGm4ErpMXxi1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76662928"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="76662928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 19:53:45 -0700
X-CSE-ConnectionGUID: P+8aSRA0T+iP26hg0d+kFw==
X-CSE-MsgGUID: +EtGsI7RQqmHJ/viBggvFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="232386234"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 07 Apr 2026 19:53:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAJ2y-00000000AOR-2FRQ;
	Wed, 08 Apr 2026 02:53:40 +0000
Date: Wed, 08 Apr 2026 04:53:33 +0200
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next 2/9] net/ipv4/af_inet.c:1503:6:
 warning: variable 'flush' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202604080419.GgJe0xs5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   bc8a19a194d5a72df5982c04f8a9e7bcff1306ca
commit: 595407f94f5e5b778a349bd5a323c5051920b864 [2/9] net: Avoid unaligned access in inet_gro_receive()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260408/202604080419.GgJe0xs5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080419.GgJe0xs5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604080419.GgJe0xs5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/af_inet.c:1503:6: warning: variable 'flush' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1503 |         if (unlikely(ip_fast_csum((u8 *)iph, 5)))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/af_inet.c:1543:31: note: uninitialized use occurs here
    1543 |         skb_gro_flush_final(skb, pp, flush);
         |                                      ^~~~~
   net/ipv4/af_inet.c:1503:2: note: remove the 'if' if its condition is always false
    1503 |         if (unlikely(ip_fast_csum((u8 *)iph, 5)))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1504 |                 goto out;
         |                 ~~~~~~~~
   net/ipv4/af_inet.c:1500:6: warning: variable 'flush' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1500 |         if (ip_is_fragment(iph))
         |             ^~~~~~~~~~~~~~~~~~~
   net/ipv4/af_inet.c:1543:31: note: uninitialized use occurs here
    1543 |         skb_gro_flush_final(skb, pp, flush);
         |                                      ^~~~~
   net/ipv4/af_inet.c:1500:2: note: remove the 'if' if its condition is always false
    1500 |         if (ip_is_fragment(iph))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
    1501 |                 goto out;
         |                 ~~~~~~~~
   net/ipv4/af_inet.c:1497:6: warning: variable 'flush' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1497 |         if (*(u8 *)iph != 0x45)
         |             ^~~~~~~~~~~~~~~~~~
   net/ipv4/af_inet.c:1543:31: note: uninitialized use occurs here
    1543 |         skb_gro_flush_final(skb, pp, flush);
         |                                      ^~~~~
   net/ipv4/af_inet.c:1497:2: note: remove the 'if' if its condition is always false
    1497 |         if (*(u8 *)iph != 0x45)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
    1498 |                 goto out;
         |                 ~~~~~~~~
   net/ipv4/af_inet.c:1494:6: warning: variable 'flush' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1494 |         if (!ops || !ops->callbacks.gro_receive)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/af_inet.c:1543:31: note: uninitialized use occurs here
    1543 |         skb_gro_flush_final(skb, pp, flush);
         |                                      ^~~~~
   net/ipv4/af_inet.c:1494:2: note: remove the 'if' if its condition is always false
    1494 |         if (!ops || !ops->callbacks.gro_receive)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1495 |                 goto out;
         |                 ~~~~~~~~
>> net/ipv4/af_inet.c:1494:6: warning: variable 'flush' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
    1494 |         if (!ops || !ops->callbacks.gro_receive)
         |             ^~~~
   net/ipv4/af_inet.c:1543:31: note: uninitialized use occurs here
    1543 |         skb_gro_flush_final(skb, pp, flush);
         |                                      ^~~~~
   net/ipv4/af_inet.c:1494:6: note: remove the '||' if its condition is always false
    1494 |         if (!ops || !ops->callbacks.gro_receive)
         |             ^~~~~~~
   net/ipv4/af_inet.c:1488:6: warning: variable 'flush' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1488 |         if (unlikely(!iph))
         |             ^~~~~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/af_inet.c:1543:31: note: uninitialized use occurs here
    1543 |         skb_gro_flush_final(skb, pp, flush);
         |                                      ^~~~~
   net/ipv4/af_inet.c:1488:2: note: remove the 'if' if its condition is always false
    1488 |         if (unlikely(!iph))
         |         ^~~~~~~~~~~~~~~~~~~
    1489 |                 goto out;
         |                 ~~~~~~~~
   net/ipv4/af_inet.c:1482:13: note: initialize the variable 'flush' to silence this warning
    1482 |         __u16 flush;
         |                    ^
         |                     = 0
   6 warnings generated.


vim +1503 net/ipv4/af_inet.c

418e897e0716b2 Willem de Bruijn 2019-02-20  1473  
d4546c2509b1e9 David Miller     2018-06-24  1474  struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
73cc19f1556b95 Herbert Xu       2008-12-15  1475  {
bca49f843eac59 Vlad Yasevich    2012-11-15  1476  	const struct net_offload *ops;
d4546c2509b1e9 David Miller     2018-06-24  1477  	struct sk_buff *pp = NULL;
b71d1d426d263b Eric Dumazet     2011-04-22  1478  	const struct iphdr *iph;
d4546c2509b1e9 David Miller     2018-06-24  1479  	struct sk_buff *p;
a5b1cf288d4200 Herbert Xu       2009-05-26  1480  	unsigned int hlen;
a5b1cf288d4200 Herbert Xu       2009-05-26  1481  	unsigned int off;
595407f94f5e5b Helge Deller     2026-04-07  1482  	__u16 flush;
73cc19f1556b95 Herbert Xu       2008-12-15  1483  	int proto;
73cc19f1556b95 Herbert Xu       2008-12-15  1484  
a5b1cf288d4200 Herbert Xu       2009-05-26  1485  	off = skb_gro_offset(skb);
a5b1cf288d4200 Herbert Xu       2009-05-26  1486  	hlen = off + sizeof(*iph);
35ffb66547295c Richard Gobert   2022-08-23  1487  	iph = skb_gro_header(skb, hlen, off);
86911732d3996a Herbert Xu       2009-01-29  1488  	if (unlikely(!iph))
73cc19f1556b95 Herbert Xu       2008-12-15  1489  		goto out;
73cc19f1556b95 Herbert Xu       2008-12-15  1490  
f9242b6b28d612 David S. Miller  2012-06-19  1491  	proto = iph->protocol;
73cc19f1556b95 Herbert Xu       2008-12-15  1492  
bca49f843eac59 Vlad Yasevich    2012-11-15  1493  	ops = rcu_dereference(inet_offloads[proto]);
f191a1d17f2270 Vlad Yasevich    2012-11-15 @1494  	if (!ops || !ops->callbacks.gro_receive)
fc1ca3348a74a1 Eric Dumazet     2021-11-23  1495  		goto out;
73cc19f1556b95 Herbert Xu       2008-12-15  1496  
a5ad24be728d43 Herbert Xu       2009-02-08  1497  	if (*(u8 *)iph != 0x45)
fc1ca3348a74a1 Eric Dumazet     2021-11-23  1498  		goto out;
73cc19f1556b95 Herbert Xu       2008-12-15  1499  
9b83e0319840ec Steffen Klassert 2017-04-28  1500  	if (ip_is_fragment(iph))
fc1ca3348a74a1 Eric Dumazet     2021-11-23  1501  		goto out;
9b83e0319840ec Steffen Klassert 2017-04-28  1502  
a9e050f4e7f9d3 Eric Dumazet     2012-08-05 @1503  	if (unlikely(ip_fast_csum((u8 *)iph, 5)))
fc1ca3348a74a1 Eric Dumazet     2021-11-23  1504  		goto out;
73cc19f1556b95 Herbert Xu       2008-12-15  1505  
b1a78b9b98862c Xin Long         2023-01-28  1506  	NAPI_GRO_CB(skb)->proto = proto;
595407f94f5e5b Helge Deller     2026-04-07  1507  	flush = (get_unaligned_be16(&iph->tot_len) ^ skb_gro_len(skb)) |
595407f94f5e5b Helge Deller     2026-04-07  1508  	        (get_unaligned_be16(&iph->frag_off) & ~IP_DF);
73cc19f1556b95 Herbert Xu       2008-12-15  1509  
d4546c2509b1e9 David Miller     2018-06-24  1510  	list_for_each_entry(p, head, list) {
73cc19f1556b95 Herbert Xu       2008-12-15  1511  		struct iphdr *iph2;
73cc19f1556b95 Herbert Xu       2008-12-15  1512  
73cc19f1556b95 Herbert Xu       2008-12-15  1513  		if (!NAPI_GRO_CB(p)->same_flow)
73cc19f1556b95 Herbert Xu       2008-12-15  1514  			continue;
73cc19f1556b95 Herbert Xu       2008-12-15  1515  
299603e8370a93 Jerry Chu        2013-12-11  1516  		iph2 = (struct iphdr *)(p->data + off);
299603e8370a93 Jerry Chu        2013-12-11  1517  		/* The above works because, with the exception of the top
299603e8370a93 Jerry Chu        2013-12-11  1518  		 * (inner most) layer, we only aggregate pkts with the same
299603e8370a93 Jerry Chu        2013-12-11  1519  		 * hdr length so all the hdrs we'll need to verify will start
299603e8370a93 Jerry Chu        2013-12-11  1520  		 * at the same offset.
299603e8370a93 Jerry Chu        2013-12-11  1521  		 */
a5ad24be728d43 Herbert Xu       2009-02-08  1522  		if ((iph->protocol ^ iph2->protocol) |
595407f94f5e5b Helge Deller     2026-04-07  1523  		    (get_unaligned(&iph->saddr) ^ get_unaligned(&iph2->saddr)) |
595407f94f5e5b Helge Deller     2026-04-07  1524  		    (get_unaligned(&iph->daddr) ^ get_unaligned(&iph2->daddr))) {
73cc19f1556b95 Herbert Xu       2008-12-15  1525  			NAPI_GRO_CB(p)->same_flow = 0;
73cc19f1556b95 Herbert Xu       2008-12-15  1526  			continue;
73cc19f1556b95 Herbert Xu       2008-12-15  1527  		}
73cc19f1556b95 Herbert Xu       2008-12-15  1528  	}
73cc19f1556b95 Herbert Xu       2008-12-15  1529  
73cc19f1556b95 Herbert Xu       2008-12-15  1530  	NAPI_GRO_CB(skb)->flush |= flush;
be008726d0ac33 Willem de Bruijn 2024-05-23  1531  	NAPI_GRO_CB(skb)->network_offsets[NAPI_GRO_CB(skb)->encap_mark] = off;
299603e8370a93 Jerry Chu        2013-12-11  1532  
2c804d0f8fc779 Eric Dumazet     2014-09-30  1533  	/* Note : No need to call skb_gro_postpull_rcsum() here,
2c804d0f8fc779 Eric Dumazet     2014-09-30  1534  	 * as we already checked checksum over ipv4 header was 0
2c804d0f8fc779 Eric Dumazet     2014-09-30  1535  	 */
86911732d3996a Herbert Xu       2009-01-29  1536  	skb_gro_pull(skb, sizeof(*iph));
86911732d3996a Herbert Xu       2009-01-29  1537  	skb_set_transport_header(skb, skb_gro_offset(skb));
73cc19f1556b95 Herbert Xu       2008-12-15  1538  
028e0a4766844e Paolo Abeni      2018-12-14  1539  	pp = indirect_call_gro_receive(tcp4_gro_receive, udp4_gro_receive,
028e0a4766844e Paolo Abeni      2018-12-14  1540  				       ops->callbacks.gro_receive, head, skb);
73cc19f1556b95 Herbert Xu       2008-12-15  1541  
73cc19f1556b95 Herbert Xu       2008-12-15  1542  out:
5f114163f2f5eb Steffen Klassert 2017-02-15 @1543  	skb_gro_flush_final(skb, pp, flush);
73cc19f1556b95 Herbert Xu       2008-12-15  1544  
73cc19f1556b95 Herbert Xu       2008-12-15  1545  	return pp;
73cc19f1556b95 Herbert Xu       2008-12-15  1546  }
73cc19f1556b95 Herbert Xu       2008-12-15  1547  

:::::: The code at line 1503 was first introduced by commit
:::::: a9e050f4e7f9d36afe0dcc0bddba864ee442715e net: tcp: GRO should be ECN friendly

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
