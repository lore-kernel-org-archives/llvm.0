Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379BB1DDC14;
	Sun, 17 Nov 2024 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731884151; cv=none; b=eSJlgLfyGos6qLKtd3nZ0MvrLXK6F67k5+1nFCZzcaY2sPK+KPKLNb7ArpyjLKB/9wZ+ZUIeKwng3FoKFZfWBO09gZdTUIgA8j5aw4f+p0di/u2BKIni/TS87pJoYxY/Kjq52qxNfPPxTj3z0egzqRWRhSlIJSJXS7fcPezt1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731884151; c=relaxed/simple;
	bh=kKKkpDNE5nvQ7jwRnzsR1waq3sQOPuJSjLOs2di9J2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/8dg78fy3g99XCyVJwYgxcFM5RVG6vzbHWY2XHDHU7vgcpQT8pz0GUJ7WQfIcQCOwdYwKRiC1oDW6f/XR0xIJbq1zhNG4YyL7+Fjq22Q/u2ks0BBiq51mbZMq5zl26WhFlHT+vORwGlaPyBGDBGwatkb95aRDsbyrCxM7QjjL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iepxpx4N; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iepxpx4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731884149; x=1763420149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kKKkpDNE5nvQ7jwRnzsR1waq3sQOPuJSjLOs2di9J2g=;
  b=Iepxpx4NpTmQuGN1D/G8RfXrZJW6hkzAxbPIUlu5YMFZROkG+IM+JsuP
   0iVpnAJCieN5105GapcL194rI4hN5naDSHFKtGsGeo4RdfE+wTSfqGsfV
   jovC93fbngtJMMv+7oHhdTy7MQEOqDu9CIysPKYjocF2HQWXJPzmBVKCY
   TyJNcwlijParmxsSEdD9gdAeIuSNj0Ts3zNSDTE45zWWGnvLYotKzJOix
   MPDutLXngXiOl4pFnYMlZ/LYeCXixIIvZqxFkW1XF2UO2PIa80e6UFAPh
   bYgjUpqz+cTfsApaolbMyq7Q4qW/VB9ywLjPNEGN1HgAnhvHgOukjAuYK
   w==;
X-CSE-ConnectionGUID: SoahuQcMSmSeZRhL21JnoQ==
X-CSE-MsgGUID: JyvjdtNNRPapbXZzbDSFJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="54325009"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="54325009"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 14:55:47 -0800
X-CSE-ConnectionGUID: S2fN66BKRc+z+uZy8R8Zcw==
X-CSE-MsgGUID: Twv74Zn4T+6Z0zUhtleAQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="88820926"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2024 14:55:45 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCoBC-00024b-2A;
	Sun, 17 Nov 2024 22:55:42 +0000
Date: Mon, 18 Nov 2024 06:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 54/64] net/rxrpc/input.c:902:3: error:
 invalid operand in inline asm: ' shr${1:z} $1
Message-ID: <202411180620.8uhr11le-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-iothread
head:   2f36eeb32c6d169f6def5f26b80a769ce6e47821
commit: 4898ab00b3caa2ff67402130051c1135dbd14146 [54/64] rxrpc: Use the new rxrpc_tx_queue struct to more efficiently process ACKs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241118/202411180620.8uhr11le-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180620.8uhr11le-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180620.8uhr11le-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/rxrpc/input.c:10:
   In file included from net/rxrpc/ar-internal.h:11:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/input.c:744:25: warning: variable 'capacity' set but not used [-Wunused-but-set-variable]
     744 |         unsigned int max_data, capacity;
         |                                ^
>> net/rxrpc/input.c:902:3: error: invalid operand in inline asm: ' shr${1:z} $1
    inc $0
    rcr${2:z} $2
   '
     902 |                 shiftr_adv_rotr(acks, extracted);
         |                 ^
   net/rxrpc/input.c:789:8: note: expanded from macro 'shiftr_adv_rotr'
     789 |                         asm(" shr%z1 %1\n"                              \
         |                             ^
>> net/rxrpc/input.c:902:3: error: invalid operand in inline asm: ' shr${1:z} $1
    inc $0
    rcr${2:z} $2
   '
   net/rxrpc/input.c:789:8: note: expanded from macro 'shiftr_adv_rotr'
     789 |                         asm(" shr%z1 %1\n"                              \
         |                             ^
>> net/rxrpc/input.c:902:3: error: ambiguous instructions require an explicit suffix (could be 'shrb', 'shrw', 'shrl', or 'shrq')
   net/rxrpc/input.c:789:8: note: expanded from macro 'shiftr_adv_rotr'
     789 |                         asm(" shr%z1 %1\n"                              \
         |                             ^
   <inline asm>:1:3: note: instantiated into assembly here
       1 |          shr (%rbx)
         |          ^
   5 warnings and 3 errors generated.


vim +902 net/rxrpc/input.c

   873	
   874	/*
   875	 * Process individual soft ACKs.
   876	 *
   877	 * Each ACK in the array corresponds to one packet and can be either an ACK or
   878	 * a NAK.  If we get find an explicitly NAK'd packet we resend immediately;
   879	 * packets that lie beyond the end of the ACK list are scheduled for resend by
   880	 * the timer on the basis that the peer might just not have processed them at
   881	 * the time the ACK was sent.
   882	 */
   883	static void rxrpc_input_soft_acks(struct rxrpc_call *call,
   884					  struct rxrpc_ack_summary *summary,
   885					  struct sk_buff *skb)
   886	{
   887		struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
   888		struct rxrpc_txqueue *tq = call->tx_queue;
   889		unsigned long extracted = ~0UL;
   890		unsigned int nr = 0;
   891		rxrpc_seq_t seq = call->acks_hard_ack + 1;
   892		rxrpc_seq_t lowest_nak = seq + sp->ack.nr_acks;
   893		u8 *acks = skb->data + sizeof(struct rxrpc_wire_header) + sizeof(struct rxrpc_ackpacket);
   894	
   895		_enter("%x,%x,%u", tq->qbase, seq, sp->ack.nr_acks);
   896	
   897		while (after(seq, tq->qbase + RXRPC_NR_TXQUEUE - 1))
   898			tq = tq->next;
   899	
   900		for (unsigned int i = 0; i < sp->ack.nr_acks; i++) {
   901			/* Decant ACKs until we hit a txqueue boundary. */
 > 902			shiftr_adv_rotr(acks, extracted);
   903			if (i == 256) {
   904				acks -= i;
   905				i = 0;
   906			}
   907			seq++;
   908			nr++;
   909			if ((seq & RXRPC_TXQ_MASK) != 0)
   910				continue;
   911	
   912			_debug("bound %16lx %u", extracted, nr);
   913	
   914			rxrpc_input_soft_ack_tq(call, summary, tq, extracted, RXRPC_NR_TXQUEUE,
   915						seq - RXRPC_NR_TXQUEUE, &lowest_nak);
   916			extracted = ~0UL;
   917			nr = 0;
   918			tq = tq->next;
   919			prefetch(tq);
   920		}
   921	
   922		if (nr) {
   923			unsigned int nr_reported = seq & RXRPC_TXQ_MASK;
   924	
   925			extracted >>= RXRPC_NR_TXQUEUE - nr_reported;
   926			_debug("tail  %16lx %u", extracted, nr_reported);
   927			rxrpc_input_soft_ack_tq(call, summary, tq, extracted, nr_reported,
   928						seq & ~RXRPC_TXQ_MASK, &lowest_nak);
   929		}
   930	
   931		/* We *can* have more nacks than we did - the peer is permitted to drop
   932		 * packets it has soft-acked and re-request them.  Further, it is
   933		 * possible for the nack distribution to change whilst the number of
   934		 * nacks stays the same or goes down.
   935		 */
   936		if (lowest_nak != call->acks_lowest_nak) {
   937			call->acks_lowest_nak = lowest_nak;
   938			summary->new_low_snack = true;
   939		}
   940	
   941		_debug("summary A=%d+%d N=%d+%d",
   942		       call->acks_nr_sacks,  summary->nr_new_sacks,
   943		       call->acks_nr_snacks, summary->nr_new_snacks);
   944	}
   945	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
