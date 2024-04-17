Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262ED7D06B;
	Wed, 17 Apr 2024 08:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713341045; cv=none; b=BfVyXfXMd9a0xaYd7UVSYiBev1tQckvirsmPH8FsUU6QY7uOwFLlWGiXtzbkI9vywdTSXNpmPPrY1PEc6Cx6CVKX+k5u7kVldgyN6a5/h+xFo0sR5MUsltQADdcwKHUF72ckpTrnYlZDAi86D7kePv3KRGMKbpk1ej9W4EaKlWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713341045; c=relaxed/simple;
	bh=SxjEVoJrgVIfloCTCzXu8Y7yl+5hjVXlA38KKeb+h+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nrcj2/6VFnnuStHnVIq9UI6O8z45klJgv8I3aZD87WGxzcaGZp9IZCKFB8fxHCups/ghRjszTxBQ+T6AXPHKnCJDiKNXSOiWg7tKcelb7y9EFQVQNfxzGVJjxJX6moCPq4uCIdFlIPVrtWld9sH/pD56UeTk32ixWvZy7KunWgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbhkJ6Rf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbhkJ6Rf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713341040; x=1744877040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SxjEVoJrgVIfloCTCzXu8Y7yl+5hjVXlA38KKeb+h+o=;
  b=VbhkJ6Rfwj1PpxmubAtTMO1v5GudgwetpbxGooDF6X/bcOAKbzCClVDC
   JpFQbHVX3L4lrWHwRfN33BO/G2Vuew+erPMBYcM8vEPGSjDoNQgark2gY
   qb6XCk2yhqfSHbvpzM8ciqAT/bG08AHmVyFRZLadhK211eCAkRQrRxBMj
   RYiqdFiPybTk9K549yuZ6NQfl0LBxjeFAZZ4N23smtlN0Dw31IhlSRB/M
   D0zCDwcqdT8Uu+62zTTKvQF1Wbj0ShGWiDJ9VhH9C8dmeJkrJc9CvpBwX
   Z6mPa0cDq3GrTi1U4H/stUDjCFl+ee/EKyFKDPYzzJR2y2qXhFuiowyVY
   g==;
X-CSE-ConnectionGUID: J3L/FbXVSr+ga7avl+tvcA==
X-CSE-MsgGUID: 8+vtYOGbRBihq9Rora8Opg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31300752"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="31300752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 01:03:52 -0700
X-CSE-ConnectionGUID: 4E5PGOrOTmOpwVq2uhepEQ==
X-CSE-MsgGUID: 6XLRVu79SDq+suwd7stylA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="22413264"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2024 01:03:51 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx0Gf-0006He-2n;
	Wed, 17 Apr 2024 08:03:47 +0000
Date: Wed, 17 Apr 2024 16:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 16/16] net/rxrpc/input.c:915:3: error:
 invalid operand in inline asm: ' shr${1:z} $1
Message-ID: <202404171521.1nKCJ9R7-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240417/202404171521.1nKCJ9R7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171521.1nKCJ9R7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171521.1nKCJ9R7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/rxrpc/input.c:915:3: error: invalid operand in inline asm: ' shr${1:z} $1
    inc $0
    rcr${2:z} $2
   '
     915 |                 shiftr_adv_rotr(acks, extracted);
         |                 ^
   net/rxrpc/input.c:802:8: note: expanded from macro 'shiftr_adv_rotr'
     802 |                         asm(" shr%z1 %1\n"                              \
         |                             ^
>> net/rxrpc/input.c:915:3: error: invalid operand in inline asm: ' shr${1:z} $1
    inc $0
    rcr${2:z} $2
   '
   net/rxrpc/input.c:802:8: note: expanded from macro 'shiftr_adv_rotr'
     802 |                         asm(" shr%z1 %1\n"                              \
         |                             ^
>> net/rxrpc/input.c:915:3: error: ambiguous instructions require an explicit suffix (could be 'shrb', 'shrw', 'shrl', or 'shrq')
   net/rxrpc/input.c:802:8: note: expanded from macro 'shiftr_adv_rotr'
     802 |                         asm(" shr%z1 %1\n"                              \
         |                             ^
   <inline asm>:1:3: note: instantiated into assembly here
       1 |          shr (%rbp)
         |          ^
   3 errors generated.


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
