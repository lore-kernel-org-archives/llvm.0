Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B21332B6;
	Tue, 16 Apr 2024 18:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713292108; cv=none; b=tQLLG9WiEM08vQqZDlDGthy1v3M3CRANzXeuMCJ8v+KpW+O6Ei7frp7UOF9bRhxuvq5F6OOr51euzvYOYVmKPIsz7zwOvqxIFDJv/ain0FD9OgjEw+Bdax6ZdoNv0ouH88fVrbq+7t8Syc/b6rT4hbdJJlmIU6Ywag3x5sCEFKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713292108; c=relaxed/simple;
	bh=mB0ZQbukTrmxwsHob6thlx8sTpyY0PET9pGJYnWFfvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h+bKqI8Rqt8ULa/3KMKLdOA472gB3prrA/2Dhb3mr03GxidgEmWH3e+SjAflvcHQnYqO2CNeiYcrTUWOsIsB2DcLQGTwyG5neZwAu2DpjdI09DMruFn2/FrF7U1Rlfq7YcoJUflEZKRXwUuANeghaJQkiX2FDSTSxqXh7a1XglU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Spg+kurn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Spg+kurn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713292107; x=1744828107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mB0ZQbukTrmxwsHob6thlx8sTpyY0PET9pGJYnWFfvE=;
  b=Spg+kurn23rH2NvXbgrmRc9tYn/ySHzgAml0aBPhGAXtlmmeVE+eNXh0
   g22ggzOj/suk6wy2d9m2G3FlnfUgVyEvy1o/iJU/rK5OGhu6a7qgD09R2
   ONMoRAcTWwrTVEqB6asH7u3aTUFuEzE48YclSKHwIdsQEGaYbd8kze/so
   6iQ6ryZQ+SLfB+7Ym2f0NlDtVyauzMdLPmOaOy92VuD1TouEQvoFht0OF
   K+hFMyY9O7onjnVtq3KKoObdD3Tjzbfj0UO3O1uCKfGlF6GBovyKdtW+u
   nXIa2/wNOOYrlppvMcQ6dj5wKHignJSNOlz6W3PG2yXWVhyeSXSkm9irQ
   A==;
X-CSE-ConnectionGUID: A+lfpqCtRq6jWzzalKhhhg==
X-CSE-MsgGUID: yiYfIKs/Rem0deVCZJpG6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19462594"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19462594"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 11:28:26 -0700
X-CSE-ConnectionGUID: +PVNkGbdTVilQkhUHvrreQ==
X-CSE-MsgGUID: ItOvGuSmSeCoUy2C0scQHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22411076"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Apr 2024 11:28:24 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwnXa-0005dg-2C;
	Tue, 16 Apr 2024 18:28:22 +0000
Date: Wed, 17 Apr 2024 02:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 16/16] net/rxrpc/input.c:915:3: warning:
 operator '<<' has lower precedence than '-'; '-' will be evaluated first
Message-ID: <202404170203.w9aBba2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-iothread
head:   0a6ac49e304f1644db056801640e1976a83a484f
commit: 0a6ac49e304f1644db056801640e1976a83a484f [16/16] rxrpc: Use the new rxrpc_tx_queue struct to more efficiently process ACKs
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240417/202404170203.w9aBba2c-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404170203.w9aBba2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170203.w9aBba2c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/rxrpc/input.c:10:
   In file included from net/rxrpc/ar-internal.h:11:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/rxrpc/input.c:10:
   In file included from net/rxrpc/ar-internal.h:11:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/rxrpc/input.c:10:
   In file included from net/rxrpc/ar-internal.h:11:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/rxrpc/input.c:10:
   In file included from net/rxrpc/ar-internal.h:11:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> net/rxrpc/input.c:915:3: warning: operator '<<' has lower precedence than '-'; '-' will be evaluated first [-Wshift-op-parentheses]
     915 |                 shiftr_adv_rotr(acks, extracted);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/input.c:814:53: note: expanded from macro 'shiftr_adv_rotr'
     814 |                         rotate_into |= __bit0 << sizeof(rotate_into) * 8 - 1; \
         |                                               ~~ ~~~~~~~~~~~~~~~~~~~~~~~~^~~
   net/rxrpc/input.c:915:3: note: place parentheses around the '-' expression to silence this warning
     915 |                 shiftr_adv_rotr(acks, extracted);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/input.c:814:53: note: expanded from macro 'shiftr_adv_rotr'
     814 |                         rotate_into |= __bit0 << sizeof(rotate_into) * 8 - 1; \
         |                                                  ~~~~~~~~~~~~~~~~~~~~~~~~^~~
   8 warnings generated.


vim +915 net/rxrpc/input.c

   886	
   887	/*
   888	 * Process individual soft ACKs.
   889	 *
   890	 * Each ACK in the array corresponds to one packet and can be either an ACK or
   891	 * a NAK.  If we get find an explicitly NAK'd packet we resend immediately;
   892	 * packets that lie beyond the end of the ACK list are scheduled for resend by
   893	 * the timer on the basis that the peer might just not have processed them at
   894	 * the time the ACK was sent.
   895	 */
   896	static void rxrpc_input_soft_acks(struct rxrpc_call *call,
   897					  struct rxrpc_ack_summary *summary,
   898					  struct sk_buff *skb,
   899					  rxrpc_seq_t first)
   900	{
   901		struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
   902		struct rxrpc_txqueue *tq = call->tx_queue;
   903		unsigned long extracted = ~0UL;
   904		unsigned int nr = 0;
   905		rxrpc_seq_t seq = first, lowest_nak = first + sp->ack.nr_acks;
   906		u8 *acks = skb->data + sizeof(struct rxrpc_wire_header) + sizeof(struct rxrpc_ackpacket);
   907	
   908		_enter("%x,%x,%u", tq->qbase, first, sp->ack.nr_acks);
   909	
   910		while (after(seq, tq->qbase + RXRPC_NR_TXQUEUE - 1))
   911			tq = tq->next;
   912	
   913		for (unsigned int i = 0; i < sp->ack.nr_acks; i++) {
   914			/* Decant ACKs until we hit a txqueue boundary. */
 > 915			shiftr_adv_rotr(acks, extracted);
   916			if (i == 256) {
   917				acks -= i;
   918				i = 0;
   919			}
   920			seq++;
   921			nr++;
   922			if ((seq & RXRPC_TXQ_MASK) != 0)
   923				continue;
   924	
   925			_debug("bound %16lx %u", extracted, nr);
   926	
   927			rxrpc_input_soft_ack_tq(call, summary, tq, extracted, RXRPC_NR_TXQUEUE,
   928						seq - RXRPC_NR_TXQUEUE, &lowest_nak);
   929			extracted = ~0UL;
   930			nr = 0;
   931			tq = tq->next;
   932		}
   933	
   934		if (nr) {
   935			unsigned int nr_reported = seq & RXRPC_TXQ_MASK;
   936	
   937			extracted >>= RXRPC_NR_TXQUEUE - nr_reported;
   938			_debug("tail  %16lx %u", extracted, nr_reported);
   939			rxrpc_input_soft_ack_tq(call, summary, tq, extracted, nr_reported,
   940						seq & ~RXRPC_TXQ_MASK, &lowest_nak);
   941		}
   942	
   943		/* We *can* have more nacks than we did - the peer is permitted to drop
   944		 * packets it has soft-acked and re-request them.  Further, it is
   945		 * possible for the nack distribution to change whilst the number of
   946		 * nacks stays the same or goes down.
   947		 */
   948		if (lowest_nak != call->acks_lowest_nak) {
   949			call->acks_lowest_nak = lowest_nak;
   950			summary->new_low_nack = true;
   951		}
   952	
   953		_debug("summary A=%d+%d N=%d+%d",
   954		       summary->nr_acks, summary->nr_new_acks,
   955		       summary->nr_nacks, summary->nr_new_nacks);
   956	}
   957	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
