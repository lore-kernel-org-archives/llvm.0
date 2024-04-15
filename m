Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D581EA80;
	Mon, 15 Apr 2024 08:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713169849; cv=none; b=UcnOtSLD1BFEGC/QMcyG0RCfkDfkCE9fbWtYiWoIoZmrmQvNM7pKu2/JHM193J86qaTn+exyZsX0yIVwHNNH7+DdlpW7NYk+JuRsXlJn5vsjqwn5lN4feDwm/dfnOIxwlH56Er+kPaSEjUGVQYBJVfl7zCy6550d4+2/ixqjCwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713169849; c=relaxed/simple;
	bh=gJg9rqZ6jtzx6mjXB1RN79exlv7+aeo42EuocAHXXTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPhn1m4rTOZuqzuo6eWxLdnT8DC2IwYIcylB+Vba8OOaLMe8UGAMHtli2YcjHOSrn9BRPx9/pWxIlSF+EQfUoJdrkrovbCn6iVybqRZfnCqQxKzDuFIWKC5UBLR7CsL4SFfD1Q8V4wezCDimlUPtuDCenMyGQ70kwvmKNoHSs5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Msfun5/x; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Msfun5/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713169848; x=1744705848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gJg9rqZ6jtzx6mjXB1RN79exlv7+aeo42EuocAHXXTk=;
  b=Msfun5/xh3FoHnENDLrcQvboWv84DPxlVZO5pbJ4eGUqSN60EtroBfh2
   ibwr2jmW4H5x4LjL5KXzpJtsynZ75C7/nJ1aimU2EtqEBTNURg/9yxISi
   jFtG74mn5ADi9H/q6serCOQbFFvpf51oKY95abRmTx/G4d2AHQ48kr6BY
   UsH/cIY2PZiBI0mxvZxDQ8lpFCDp7Eurqa6YzdC01Q07pmU8RfdMH2Lxc
   SrGBmrrJ7pQ+qSurJ7ml8pjOcLiLbGzgTIk/9oAhfgtH+8oUBsrbs4DXR
   abLBq61D6PaaLXNkvrST4vOs6bbObpwhx7VLf76W+sS6S5H06HqMdN7d0
   A==;
X-CSE-ConnectionGUID: f7bzfLdWTNaEDb8BzyPBSg==
X-CSE-MsgGUID: sID2AVxeSCqeQjtDPe9v5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="31027162"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="31027162"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 01:30:47 -0700
X-CSE-ConnectionGUID: s6QaqiqfSsSmQeqnVSkXeA==
X-CSE-MsgGUID: BXKaQ3T9TmCaMetL95c/EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="45120354"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Apr 2024 01:30:44 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwHje-00044C-1c;
	Mon, 15 Apr 2024 08:30:42 +0000
Date: Mon, 15 Apr 2024 16:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Chauhan <quic_abchauha@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next v3 1/2] net: Rename mono_delivery_time to
 tstamp_type for scalabilty
Message-ID: <202404151604.8WpyG3jW-lkp@intel.com>
References: <20240412210125.1780574-2-quic_abchauha@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412210125.1780574-2-quic_abchauha@quicinc.com>

Hi Abhishek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Chauhan/net-Rename-mono_delivery_time-to-tstamp_type-for-scalabilty/20240415-094415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240412210125.1780574-2-quic_abchauha%40quicinc.com
patch subject: [RFC PATCH bpf-next v3 1/2] net: Rename mono_delivery_time to tstamp_type for scalabilty
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240415/202404151604.8WpyG3jW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151604.8WpyG3jW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151604.8WpyG3jW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/ieee802154/6lowpan/reassembly.c:12:
   In file included from include/linux/net.h:24:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/ieee802154/6lowpan/reassembly.c:14:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from net/ieee802154/6lowpan/reassembly.c:14:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from net/ieee802154/6lowpan/reassembly.c:14:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> net/ieee802154/6lowpan/reassembly.c:133:8: error: no member named 'mono_delivery_time' in 'struct inet_frag_queue'
     133 |         fq->q.mono_delivery_time = skb->mono_delivery_time;
         |         ~~~~~ ^
>> net/ieee802154/6lowpan/reassembly.c:133:34: error: no member named 'mono_delivery_time' in 'struct sk_buff'
     133 |         fq->q.mono_delivery_time = skb->mono_delivery_time;
         |                                    ~~~  ^
   17 warnings and 2 errors generated.


vim +133 net/ieee802154/6lowpan/reassembly.c

7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   83  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   84  static int lowpan_frag_queue(struct lowpan_frag_queue *fq,
72a5e6bb5120d6 net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02   85  			     struct sk_buff *skb, u8 frag_type)
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   86  {
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   87  	struct sk_buff *prev_tail;
f4606583fd8dcf net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02   88  	struct net_device *ldev;
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   89  	int end, offset, err;
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   90  
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   91  	/* inet_frag_queue_* functions use skb->cb; see struct ipfrag_skb_cb
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   92  	 * in inet_fragment.c
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   93  	 */
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   94  	BUILD_BUG_ON(sizeof(struct lowpan_802154_cb) > sizeof(struct inet_skb_parm));
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   95  	BUILD_BUG_ON(sizeof(struct lowpan_802154_cb) > sizeof(struct inet6_skb_parm));
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   96  
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01   97  	if (fq->q.flags & INET_FRAG_COMPLETE)
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   98  		goto err;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   99  
72a5e6bb5120d6 net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  100  	offset = lowpan_802154_cb(skb)->d_offset << 3;
72a5e6bb5120d6 net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  101  	end = lowpan_802154_cb(skb)->d_size;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  102  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  103  	/* Is this the final fragment? */
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  104  	if (offset + skb->len == end) {
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  105  		/* If we already have some bits beyond end
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  106  		 * or have different end, the segment is corrupted.
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  107  		 */
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  108  		if (end < fq->q.len ||
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01  109  		    ((fq->q.flags & INET_FRAG_LAST_IN) && end != fq->q.len))
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  110  			goto err;
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01  111  		fq->q.flags |= INET_FRAG_LAST_IN;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  112  		fq->q.len = end;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  113  	} else {
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  114  		if (end > fq->q.len) {
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  115  			/* Some bits beyond end -> corruption. */
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01  116  			if (fq->q.flags & INET_FRAG_LAST_IN)
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  117  				goto err;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  118  			fq->q.len = end;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  119  		}
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  120  	}
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  121  
f4606583fd8dcf net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  122  	ldev = skb->dev;
f4606583fd8dcf net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  123  	if (ldev)
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  124  		skb->dev = NULL;
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  125  	barrier();
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  126  
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  127  	prev_tail = fq->q.fragments_tail;
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  128  	err = inet_frag_queue_insert(&fq->q, skb, offset, end);
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  129  	if (err)
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  130  		goto err;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  131  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  132  	fq->q.stamp = skb->tstamp;
335c8cf3b53760 net/ieee802154/6lowpan/reassembly.c Martin KaFai Lau    2022-03-02 @133  	fq->q.mono_delivery_time = skb->mono_delivery_time;
72a5e6bb5120d6 net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  134  	if (frag_type == LOWPAN_DISPATCH_FRAG1)
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01  135  		fq->q.flags |= INET_FRAG_FIRST_IN;
72a5e6bb5120d6 net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  136  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  137  	fq->q.meat += skb->len;
6ce3b4dcee4f96 net/ieee802154/6lowpan/reassembly.c Eric Dumazet        2019-05-24  138  	add_frag_mem_limit(fq->q.fqdir, skb->truesize);
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  139  
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01  140  	if (fq->q.flags == (INET_FRAG_FIRST_IN | INET_FRAG_LAST_IN) &&
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  141  	    fq->q.meat == fq->q.len) {
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  142  		int res;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  143  		unsigned long orefdst = skb->_skb_refdst;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  144  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  145  		skb->_skb_refdst = 0UL;
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  146  		res = lowpan_frag_reasm(fq, skb, prev_tail, ldev);
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  147  		skb->_skb_refdst = orefdst;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  148  		return res;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  149  	}
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  150  	skb_dst_drop(skb);
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  151  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  152  	return -1;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  153  err:
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  154  	kfree_skb(skb);
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  155  	return -1;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  156  }
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
