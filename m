Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8513E1474C1;
	Fri,  2 Feb 2024 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706888567; cv=none; b=fumX8uSSKi59mY1LCaQm2CA0sf+ydkHimIbAcr20czr0wSlFBZukjzLe5RstX/tiaQCUMlsVbBKMYHXJ4tKKbOqm9oka1sfB2F24Zha+b3lYCEsewNyg3BXtOZJbi8ksS30+SuMQjaqyOoF7yY/lSOm7M0sTHr0hmqeJ2gDNyQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706888567; c=relaxed/simple;
	bh=e8v8oDvK+GwgBcr8Q/bsQ5o9/zaV/lOO7oguPaZK2a4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YkoocF/HDI1v53+bapIMYN7l5YukgUQQjq5nEO3wqByXMq9mct6on2+GlhUz1LD00tvi3vDvwnt0SNaa6YqVmXpSPe/rfbfiyrBzx5H9i1EaoLiaMXG81I2iu48wUyHFHlombZ4n9sQ/QSu6VbTSMVUBbEC9e0YhNybsN+4m1PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bccKb3zf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bccKb3zf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706888564; x=1738424564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8v8oDvK+GwgBcr8Q/bsQ5o9/zaV/lOO7oguPaZK2a4=;
  b=bccKb3zfUyyDPMdKS6JPTnkh8gfzynib6KxacDhKQiksEXWVwXpXTpAu
   czjzJhxscE2EaqDSw8I4+ujWqR/1Wkvrfz9ugrFiW4m2eFhjZDTE8CZUU
   hRfiW21BG387qMHx2+sgnSvxxJ9rcwtThSP/CZAYP6onwZnDv3cpS90vx
   oSPIyL3bC0ffcfyWFUJAlct1FFhY1b6IwWWX9CauP+0HGVStNidBg+C8e
   MRNwXRTFhGJ1LcZiwJTV1y61uejtFW9mWqXXxkhpR59L3ErwphHWlJAlk
   K2CovuYndMPps0Kty77AmCBPp7ob6XKItBwZWbXMUhNqxX55JZ9LE6B1n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="352572"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="352572"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 07:42:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="111135"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Feb 2024 07:42:42 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVvgd-0003zo-1K;
	Fri, 02 Feb 2024 15:42:39 +0000
Date: Fri, 2 Feb 2024 23:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 21/24] net/rxrpc/call_event.c:83:6:
 warning: variable 'resend_at' is used uninitialized whenever 'if' condition
 is true
Message-ID: <202402022340.9lMHgvMR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-iothread
head:   975bd4732a7b88c6ec05685c43b639000f888fbe
commit: 00f26bacbd779af1d425524ff186a83b9e200e2c [21/24] rxrpc: Fix resend
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240202/202402022340.9lMHgvMR-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240202/202402022340.9lMHgvMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402022340.9lMHgvMR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/rxrpc/call_event.c:13:
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
   In file included from net/rxrpc/call_event.c:13:
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
   In file included from net/rxrpc/call_event.c:13:
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
>> net/rxrpc/call_event.c:83:6: warning: variable 'resend_at' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      83 |         if (list_empty(&call->tx_buffer))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/call_event.c:176:24: note: uninitialized use occurs here
     176 |         resend_at = ktime_add(resend_at, delay);
         |                               ^~~~~~~~~
   include/linux/ktime.h:48:31: note: expanded from macro 'ktime_add'
      48 | #define ktime_add(lhs, rhs)     ((lhs) + (rhs))
         |                                   ^~~
   net/rxrpc/call_event.c:83:2: note: remove the 'if' if its condition is always false
      83 |         if (list_empty(&call->tx_buffer))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      84 |                 goto no_resend;
         |                 ~~~~~~~~~~~~~~
   net/rxrpc/call_event.c:75:19: note: initialize the variable 'resend_at' to silence this warning
      75 |         ktime_t resend_at, now, delay;
         |                          ^
         |                           = 0
   13 warnings generated.


vim +83 net/rxrpc/call_event.c

57494343cb5d66 net/rxrpc/call_event.c David Howells 2016-09-24   64  
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26   65  /*
248f219cb8bcbf net/rxrpc/call_event.c David Howells 2016-09-08   66   * Perform retransmission of NAK'd and unack'd packets.
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26   67   */
5e6ef4f1017c7f net/rxrpc/call_event.c David Howells 2020-01-23   68  void rxrpc_resend(struct rxrpc_call *call, struct sk_buff *ack_skb)
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26   69  {
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   70  	struct rxrpc_ackpacket *ack = NULL;
142c415e095a57 net/rxrpc/call_event.c David Howells 2024-01-24   71  	struct rxrpc_skb_priv *sp;
a4ea4c47761943 net/rxrpc/call_event.c David Howells 2022-03-31   72  	struct rxrpc_txbuf *txb;
a37701edb8a3b0 net/rxrpc/call_event.c David Howells 2024-01-29   73  	rxrpc_seq_t transmitted = call->tx_transmitted;
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31   74  	ktime_t next_resend = KTIME_MAX, rto = ns_to_ktime(call->peer->rto_us * NSEC_PER_USEC);
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31   75  	ktime_t resend_at, now, delay;
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31   76  	bool unacked = false, did_send = false;
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   77  	unsigned int i;
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26   78  
a4ea4c47761943 net/rxrpc/call_event.c David Howells 2022-03-31   79  	_enter("{%d,%d}", call->acks_hard_ack, call->tx_top);
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26   80  
a158bdd3247b96 net/rxrpc/call_event.c David Howells 2017-11-24   81  	now = ktime_get_real();
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   82  
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  @83  	if (list_empty(&call->tx_buffer))
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   84  		goto no_resend;
50235c4b5a2fb9 net/rxrpc/call_event.c David Howells 2016-09-22   85  
5e6ef4f1017c7f net/rxrpc/call_event.c David Howells 2020-01-23   86  	trace_rxrpc_resend(call, ack_skb);
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   87  	txb = list_first_entry(&call->tx_buffer, struct rxrpc_txbuf, call_link);
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   88  
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   89  	/* Scan the soft ACK table without dropping the lock and resend any
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   90  	 * explicitly NAK'd packets.
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   91  	 */
5e6ef4f1017c7f net/rxrpc/call_event.c David Howells 2020-01-23   92  	if (ack_skb) {
142c415e095a57 net/rxrpc/call_event.c David Howells 2024-01-24   93  		sp = rxrpc_skb(ack_skb);
5e6ef4f1017c7f net/rxrpc/call_event.c David Howells 2020-01-23   94  		ack = (void *)ack_skb->data + sizeof(struct rxrpc_wire_header);
5e6ef4f1017c7f net/rxrpc/call_event.c David Howells 2020-01-23   95  
142c415e095a57 net/rxrpc/call_event.c David Howells 2024-01-24   96  		for (i = 0; i < sp->nr_acks; i++) {
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   97  			rxrpc_seq_t seq;
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   98  
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07   99  			if (ack->acks[i] & 1)
248f219cb8bcbf net/rxrpc/call_event.c David Howells 2016-09-08  100  				continue;
142c415e095a57 net/rxrpc/call_event.c David Howells 2024-01-24  101  			seq = sp->first_ack + i;
a4ea4c47761943 net/rxrpc/call_event.c David Howells 2022-03-31  102  			if (after(txb->seq, transmitted))
a4ea4c47761943 net/rxrpc/call_event.c David Howells 2022-03-31  103  				break;
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  104  			if (after(txb->seq, seq))
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  105  				continue; /* A new hard ACK probably came in */
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  106  			list_for_each_entry_from(txb, &call->tx_buffer, call_link) {
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  107  				if (txb->seq == seq)
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  108  					goto found_txb;
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  109  			}
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  110  			goto no_further_resend;
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  111  
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  112  		found_txb:
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  113  			resend_at = ktime_add(txb->last_sent, rto);
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  114  			if (after(txb->serial, call->acks_highest_serial)) {
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  115  				if (ktime_after(resend_at, now) &&
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  116  				    ktime_before(resend_at, next_resend))
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  117  					next_resend = resend_at;
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  118  				continue; /* Ack point not yet reached */
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  119  			}
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  120  
a4ea4c47761943 net/rxrpc/call_event.c David Howells 2022-03-31  121  			rxrpc_see_txbuf(txb, rxrpc_txbuf_see_unacked);
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  122  
8215b6a038133c net/rxrpc/call_event.c David Howells 2024-01-29  123  			trace_rxrpc_retransmit(call, txb->seq, txb->serial,
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  124  					       ktime_sub(resend_at, now));
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  125  
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  126  			txb->flags |= RXRPC_TXBUF_RESENT;
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  127  			rxrpc_transmit_one(call, txb);
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  128  			did_send = true;
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  129  			now = ktime_get_real();
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  130  
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  131  			if (list_is_last(&txb->call_link, &call->tx_buffer))
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  132  				goto no_further_resend;
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  133  			txb = list_next_entry(txb, call_link);
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  134  		}
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  135  	}
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  136  
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  137  	/* Fast-forward through the Tx queue to the point the peer says it has
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  138  	 * seen.  Anything between the soft-ACK table and that point will get
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  139  	 * ACK'd or NACK'd in due course, so don't worry about it here; here we
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  140  	 * need to consider retransmitting anything beyond that point.
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  141  	 */
a37701edb8a3b0 net/rxrpc/call_event.c David Howells 2024-01-29  142  	if (after_eq(call->acks_prev_seq, call->tx_transmitted))
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  143  		goto no_further_resend;
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  144  
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  145  	list_for_each_entry_from(txb, &call->tx_buffer, call_link) {
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  146  		resend_at = ktime_add(txb->last_sent, rto);
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  147  
a37701edb8a3b0 net/rxrpc/call_event.c David Howells 2024-01-29  148  		if (before_eq(txb->seq, call->acks_prev_seq))
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  149  			continue;
a37701edb8a3b0 net/rxrpc/call_event.c David Howells 2024-01-29  150  		if (after(txb->seq, call->tx_transmitted))
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  151  			break; /* Not transmitted yet */
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  152  
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  153  		if (ack && ack->reason == RXRPC_ACK_PING_RESPONSE &&
8215b6a038133c net/rxrpc/call_event.c David Howells 2024-01-29  154  		    before(txb->serial, ntohl(ack->serial)))
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  155  			goto do_resend; /* Wasn't accounted for by a more recent ping. */
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  156  
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  157  		if (ktime_after(resend_at, now)) {
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  158  			if (ktime_before(resend_at, next_resend))
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  159  				next_resend = resend_at;
248f219cb8bcbf net/rxrpc/call_event.c David Howells 2016-09-08  160  			continue;
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  161  		}
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  162  
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  163  	do_resend:
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  164  		unacked = true;
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  165  
6a9ccf1c9731d4 net/rxrpc/call_event.c David Howells 2024-01-29  166  		txb->flags |= RXRPC_TXBUF_RESENT;
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  167  		rxrpc_transmit_one(call, txb);
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  168  		did_send = true;
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  169  		rxrpc_inc_stat(call->rxnet, stat_tx_data_retrans);
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  170  		now = ktime_get_real();
dfa7d9204054b0 net/rxrpc/call_event.c David Howells 2016-09-17  171  	}
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  172  
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  173  no_further_resend:
d57a3a15166090 net/rxrpc/call_event.c David Howells 2022-05-07  174  no_resend:
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  175  	delay = rxrpc_get_rto_backoff(call->peer, did_send);
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  176  	resend_at = ktime_add(resend_at, delay);
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  177  	call->resend_at = resend_at;
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  178  	trace_rxrpc_timer_set(call, resend_at - now, rxrpc_timer_trace_resend_reset);
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  179  
57494343cb5d66 net/rxrpc/call_event.c David Howells 2016-09-24  180  	if (unacked)
57494343cb5d66 net/rxrpc/call_event.c David Howells 2016-09-24  181  		rxrpc_congestion_timeout(call);
57494343cb5d66 net/rxrpc/call_event.c David Howells 2016-09-24  182  
57494343cb5d66 net/rxrpc/call_event.c David Howells 2016-09-24  183  	/* If there was nothing that needed retransmission then it's likely
57494343cb5d66 net/rxrpc/call_event.c David Howells 2016-09-24  184  	 * that an ACK got lost somewhere.  Send a ping to find out instead of
57494343cb5d66 net/rxrpc/call_event.c David Howells 2016-09-24  185  	 * retransmitting data.
57494343cb5d66 net/rxrpc/call_event.c David Howells 2016-09-24  186  	 */
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  187  	if (!did_send) {
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  188  		ktime_t next_ping = ktime_add_us(call->acks_latest_ts,
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  189  						 call->peer->srtt_us >> 3);
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  190  
00f26bacbd779a net/rxrpc/call_event.c David Howells 2024-01-31  191  		if (ktime_sub(next_ping, now) <= 0)
72f0c6fb057971 net/rxrpc/call_event.c David Howells 2020-01-30  192  			rxrpc_send_ACK(call, RXRPC_ACK_PING, 0,
caae5a7be76d20 net/rxrpc/call_event.c David Howells 2024-01-30  193  				       rxrpc_propose_ack_ping_for_0_retrans);
dfa7d9204054b0 net/rxrpc/call_event.c David Howells 2016-09-17  194  	}
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  195  
248f219cb8bcbf net/rxrpc/call_event.c David Howells 2016-09-08  196  	_leave("");
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  197  }
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  198  

:::::: The code at line 83 was first introduced by commit
:::::: d57a3a151660902091491ac2633134e1be92557f rxrpc: Save last ACK's SACK table rather than marking txbufs

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
