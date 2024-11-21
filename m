Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122D24C6D;
	Thu, 21 Nov 2024 00:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732148281; cv=none; b=qiUHeGpmqjclBKZtj1VLLUszIAs/OWGHw48XgvcEl0sah/eZI8QWbSqfUWDnVDqXtn3hfOnM3EzPBhhQ9R2YD6MaqszFIrD5yeK5Dj3a6i7bqBMwj4FOhAD9Hsd/uf3Ufu46D7cvWQzc9BzYSSzmbe6XF4wf/LCmqwyrlRuPUpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732148281; c=relaxed/simple;
	bh=VARw5fREDUtgluGFrRUsItlJVWZU3CIMzLrU5oZVRqs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTRdtnXcSbi6l/0/V9hIC2wtpKIF/1J0PU14prmYlSocN5nl1xm2ufDFV0/rVUpy4dInIMP/pbhqI05I0oZUIQUOW+KKXR9wMgBHYapaRSjZhkfH/3XSjQPjt1KSY1aZVIQfdyrdGMN4USUXP5fDsqlPwhLsT+HWuL51zZLhtAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZiO/p0f; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZiO/p0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732148279; x=1763684279;
  h=date:from:cc:subject:message-id:mime-version;
  bh=VARw5fREDUtgluGFrRUsItlJVWZU3CIMzLrU5oZVRqs=;
  b=nZiO/p0fuklZ92jXlJ/j7g/TVQQEsSI2oY6MHDlinI6TM7fsT5ZZnMi8
   T7iF71b1OXFLB3rdbFZRX+squEmG2+spZICR4OWUJtNw8u0Knh4O/OkOj
   NhUiTKhYU1kifsv3MjKVmGVOrlsMVGGhBQoB5mhSt1V0DLyc5/zBBD5gU
   J+SVJ5r+ExOkNDOI03K9HUBGDv4OWaO59VfOPMDBkEcfY/J3edpqKolxo
   D0+nTSr/gPNBieesWvBl5NfaSthWPBquxDFopsguGOQNN/kdfp8sT7kjF
   utFYVwDFaEeRAc+h5iNHFjBiOZI7noMCfeU3MGBapKzgF+t0G+hLd1jb8
   w==;
X-CSE-ConnectionGUID: VwRAznLdQlq77gT2bNX9/A==
X-CSE-MsgGUID: DB9C72ZaS6ebOlSuMm9mVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32371921"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="32371921"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 16:17:58 -0800
X-CSE-ConnectionGUID: MRxCjepXRiijo6ekmnPTDw==
X-CSE-MsgGUID: n4eYRXkVRAS3our6JhAAwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95145343"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2024 16:17:58 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDutP-0001FP-1J;
	Thu, 21 Nov 2024 00:17:55 +0000
Date: Thu, 21 Nov 2024 08:17:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 69/69] net/rxrpc/call_event.c:343:39:
 warning: arithmetic between different enumeration types ('enum
 rxrpc_timer_trace' and 'enum rxrpc_rack_timer_mode')
Message-ID: <202411210818.CVy0TUO3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-iothread
head:   f743707b4a725deb115655603066d3760919b970
commit: f743707b4a725deb115655603066d3760919b970 [69/69] rxrpc: Implement RACK/TLP to deal with transmission stalls [RFC8985]
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20241121/202411210818.CVy0TUO3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210818.CVy0TUO3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210818.CVy0TUO3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/rxrpc/call_event.c:12:
   In file included from include/linux/net.h:24:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/rxrpc/call_event.c:13:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/rxrpc/call_event.c:13:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/rxrpc/call_event.c:13:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> net/rxrpc/call_event.c:343:39: warning: arithmetic between different enumeration types ('enum rxrpc_timer_trace' and 'enum rxrpc_rack_timer_mode') [-Wenum-enum-conversion]
     343 |                                               rxrpc_timer_trace_rack_off + call->rack_timer_mode);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.
--
   In file included from net/rxrpc/input.c:10:
   In file included from net/rxrpc/ar-internal.h:11:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
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
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> net/rxrpc/input.c:356:57: warning: arithmetic between different enumeration types ('enum rxrpc_timer_trace' and 'enum rxrpc_rack_timer_mode') [-Wenum-enum-conversion]
     356 |         trace_rxrpc_timer_can(call, rxrpc_timer_trace_rack_off + call->rack_timer_mode);
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +343 net/rxrpc/call_event.c

   296	
   297	/*
   298	 * Handle retransmission and deferred ACK/abort generation.
   299	 */
   300	bool rxrpc_input_call_event(struct rxrpc_call *call)
   301	{
   302		struct sk_buff *skb;
   303		ktime_t now, t;
   304		bool did_receive = false, saw_ack = false;
   305		s32 abort_code;
   306	
   307		rxrpc_see_call(call, rxrpc_call_see_input);
   308	
   309		//printk("\n--------------------\n");
   310		_enter("{%d,%s,%lx}",
   311		       call->debug_id, rxrpc_call_states[__rxrpc_call_state(call)],
   312		       call->events);
   313	
   314		/* Handle abort request locklessly, vs rxrpc_propose_abort(). */
   315		abort_code = smp_load_acquire(&call->send_abort);
   316		if (abort_code) {
   317			rxrpc_abort_call(call, 0, call->send_abort, call->send_abort_err,
   318					 call->send_abort_why);
   319			goto out;
   320		}
   321	
   322		do {
   323			skb = __skb_dequeue(&call->rx_queue);
   324			if (skb) {
   325				struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
   326	
   327				if (__rxrpc_call_is_complete(call) ||
   328				    skb->mark == RXRPC_SKB_MARK_ERROR) {
   329					rxrpc_free_skb(skb, rxrpc_skb_put_call_rx);
   330					goto out;
   331				}
   332	
   333				saw_ack |= sp->hdr.type == RXRPC_PACKET_TYPE_ACK;
   334	
   335				rxrpc_input_call_packet(call, skb);
   336				rxrpc_free_skb(skb, rxrpc_skb_put_call_rx);
   337				did_receive = true;
   338			}
   339	
   340			t = ktime_sub(call->rack_timo_at, ktime_get_real());
   341			if (t <= 0) {
   342				trace_rxrpc_timer_exp(call, t,
 > 343						      rxrpc_timer_trace_rack_off + call->rack_timer_mode);
   344				call->rack_timo_at = KTIME_MAX;
   345				rxrpc_rack_timer_expired(call, t);
   346			}
   347	
   348		} while (!skb_queue_empty(&call->rx_queue));
   349	
   350		/* If we see our async-event poke, check for timeout trippage. */
   351		now = ktime_get_real();
   352		t = ktime_sub(call->expect_rx_by, now);
   353		if (t <= 0) {
   354			trace_rxrpc_timer_exp(call, t, rxrpc_timer_trace_expect_rx);
   355			goto expired;
   356		}
   357	
   358		t = ktime_sub(call->expect_req_by, now);
   359		if (t <= 0) {
   360			call->expect_req_by = KTIME_MAX;
   361			if (__rxrpc_call_state(call) == RXRPC_CALL_SERVER_RECV_REQUEST) {
   362				trace_rxrpc_timer_exp(call, t, rxrpc_timer_trace_idle);
   363				goto expired;
   364			}
   365		}
   366	
   367		t = ktime_sub(READ_ONCE(call->expect_term_by), now);
   368		if (t <= 0) {
   369			trace_rxrpc_timer_exp(call, t, rxrpc_timer_trace_hard);
   370			goto expired;
   371		}
   372	
   373		t = ktime_sub(call->delay_ack_at, now);
   374		if (t <= 0) {
   375			trace_rxrpc_timer_exp(call, t, rxrpc_timer_trace_delayed_ack);
   376			call->delay_ack_at = KTIME_MAX;
   377			rxrpc_send_ACK(call, RXRPC_ACK_DELAY, 0,
   378				       rxrpc_propose_ack_delayed_ack);
   379		}
   380	
   381		t = ktime_sub(call->ping_at, now);
   382		if (t <= 0) {
   383			trace_rxrpc_timer_exp(call, t, rxrpc_timer_trace_ping);
   384			call->ping_at = KTIME_MAX;
   385			rxrpc_send_ACK(call, RXRPC_ACK_PING, 0,
   386				       rxrpc_propose_ack_ping_for_keepalive);
   387		}
   388	
   389		now = ktime_get_real();
   390		t = ktime_sub(call->keepalive_at, now);
   391		if (t <= 0) {
   392			trace_rxrpc_timer_exp(call, t, rxrpc_timer_trace_keepalive);
   393			call->keepalive_at = KTIME_MAX;
   394			rxrpc_send_ACK(call, RXRPC_ACK_PING, 0,
   395				       rxrpc_propose_ack_ping_for_keepalive);
   396		}
   397	
   398		if (saw_ack)
   399			rxrpc_congestion_degrade(call);
   400	
   401		if (test_and_clear_bit(RXRPC_CALL_EV_INITIAL_PING, &call->events))
   402			rxrpc_send_initial_ping(call);
   403	
   404		rxrpc_transmit_some_data(call, UINT_MAX, rxrpc_txdata_new_data);
   405	
   406		if (did_receive) {
   407			t = ktime_sub(call->rack_timo_at, ktime_get_real());
   408			trace_rxrpc_rack(call, t);
   409		}
   410	
   411		/* Process events */
   412		if (test_and_clear_bit(RXRPC_CALL_EV_ACK_LOST, &call->events))
   413			rxrpc_send_ACK(call, RXRPC_ACK_PING, 0,
   414				       rxrpc_propose_ack_ping_for_lost_ack);
   415	
   416		if (call->tx_nr_lost > 0 &&
   417		    __rxrpc_call_state(call) != RXRPC_CALL_CLIENT_RECV_REPLY &&
   418		    !test_bit(RXRPC_CALL_TX_ALL_ACKED, &call->flags))
   419			rxrpc_resend(call);
   420	
   421		if (test_and_clear_bit(RXRPC_CALL_RX_IS_IDLE, &call->flags))
   422			rxrpc_send_ACK(call, RXRPC_ACK_IDLE, 0,
   423				       rxrpc_propose_ack_rx_idle);
   424	
   425		if (call->ackr_nr_unacked > 2) {
   426			if (call->peer->rtt_count < 3)
   427				rxrpc_send_ACK(call, RXRPC_ACK_PING, 0,
   428					       rxrpc_propose_ack_ping_for_rtt);
   429			else if (ktime_before(ktime_add_ms(call->peer->rtt_last_req, 1000),
   430					      ktime_get_real()))
   431				rxrpc_send_ACK(call, RXRPC_ACK_PING, 0,
   432					       rxrpc_propose_ack_ping_for_old_rtt);
   433			else
   434				rxrpc_send_ACK(call, RXRPC_ACK_IDLE, 0,
   435					       rxrpc_propose_ack_input_data);
   436		}
   437	
   438		/* Make sure the timer is restarted */
   439		if (!__rxrpc_call_is_complete(call)) {
   440			ktime_t next = READ_ONCE(call->expect_term_by), delay;
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
