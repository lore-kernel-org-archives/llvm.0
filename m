Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B72A1607A4;
	Sun, 10 May 2026 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778412646; cv=none; b=j1Cq6Q9pBlO2bptPPG1IuoEW5ewNe/5jNOPavBoy0ZdlWBhR/AFo0+hHjYA58avGGTCKN0cnBv7tnd7bv5ZllNMp1AKxmQCZ3RspX686/NsM08Yt3pendMioLajsLR9k1NcCE1AJsAyFVyPS68Sgo0ssZ9OOwGo32pF92KBuoJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778412646; c=relaxed/simple;
	bh=K66Nolotuqz6YCr8C8gahsfBITEtXg/36b0zt/1hY+0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b0mQyHVobmlSG3FDGLmz2lxq4i/rLL5R1XZQcLbwJOD6bYWlC/5W8uo8bo19COJaTA3jN6r4MEKgbyZm6Z0SczrGeL6WsW39CH33+I4GBy/WyxOt/4C8ygNHAAvYywGxIrjBpZdlumXwl+HIAG2dBFF/4FG11zDHvh0iOY5EjL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThDqRVmA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThDqRVmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778412643; x=1809948643;
  h=date:from:to:cc:subject:message-id;
  bh=K66Nolotuqz6YCr8C8gahsfBITEtXg/36b0zt/1hY+0=;
  b=ThDqRVmAFHh5djhOWIkAG0zw/LPIctiE0VMqduNK5pKYNdBkEuIDMf2F
   InmWWTjIhsEZQYQ7P8cN7tlWI2Rh3KaE8T9J6BCUVSS8Enhnfg39UxMUg
   jJ0fK3JsEONE/YeWqYN6+Gr+exO6z5P4ulqC4jU5G7XgJNLbHVnZn/vdb
   4didZ+pt1oi7/9N1S7P7SmsBMY7V7WkoWMwv/95Puzm0YRoEhZ/4jo5Fs
   cFg7hL433oThvaONIMyuSko6LHGmV/CiMBt8bBRuDOEaeJIN3uBye/YlV
   SDSl2intzeqg2r8hF6xK5cQof91wYY+rBExvEA+E49dbljyRhkJYotNZC
   A==;
X-CSE-ConnectionGUID: mnlZkCtsSM6KvWx3KpOPqQ==
X-CSE-MsgGUID: voyEosgjQWudedQX68re1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="89629966"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="89629966"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 04:30:43 -0700
X-CSE-ConnectionGUID: StMdg9xPQL6LiCGCymqr+A==
X-CSE-MsgGUID: 40RE1RZQQJ+mBYoxxHao8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="230811324"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 10 May 2026 04:30:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM2Mp-000000007hp-0HSB;
	Sun, 10 May 2026 11:30:39 +0000
Date: Sun, 10 May 2026 13:30:04 +0200
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: net/ipv4/tcp.c:1606:2: error: call to undeclared function
 'tcp_bpf_rcvlowat'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605101359.dgJxhzI7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/selftest-bpf-Use-BPF_SOCK_OPS_ALL_CB_FLAGS-1-for-bad_cb_test_rv/20260510-125645
head:   8387600c3c2126ca1ff6d5718eb17e7840afd157
commit: ffaa25dad7353701805e9dae4e5d985b7ecebcc3 bpf: tcp: Add SOCK_OPS rcvlowat hook.
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260510/202605101359.dgJxhzI7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101359.dgJxhzI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101359.dgJxhzI7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/ipv4/tcp.c:1606:2: error: call to undeclared function 'tcp_bpf_rcvlowat'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1606 |         tcp_bpf_rcvlowat(sk, NULL);
         |         ^
   net/ipv4/tcp.c:1606:2: note: did you mean 'tcp_set_rcvlowat'?
   include/net/tcp.h:519:5: note: 'tcp_set_rcvlowat' declared here
     519 | int tcp_set_rcvlowat(struct sock *sk, int val);
         |     ^
   1 error generated.
--
>> net/ipv4/tcp_input.c:208:6: warning: no previous prototype for function 'bpf_skops_rcvlowat' [-Wmissing-prototypes]
     208 | void bpf_skops_rcvlowat(struct sock *sk, struct sk_buff *skb)
         |      ^
   net/ipv4/tcp_input.c:208:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     208 | void bpf_skops_rcvlowat(struct sock *sk, struct sk_buff *skb)
         | ^
         | static 
>> net/ipv4/tcp_input.c:5309:3: error: call to undeclared function 'tcp_bpf_rcvlowat'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5309 |                 tcp_bpf_rcvlowat(sk, skb);
         |                 ^
   net/ipv4/tcp_input.c:5309:3: note: did you mean 'tcp_set_rcvlowat'?
   include/net/tcp.h:519:5: note: 'tcp_set_rcvlowat' declared here
     519 | int tcp_set_rcvlowat(struct sock *sk, int val);
         |     ^
   net/ipv4/tcp_input.c:5514:2: error: call to undeclared function 'tcp_bpf_rcvlowat'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5514 |         tcp_bpf_rcvlowat(sk, skb);
         |         ^
   1 warning and 2 errors generated.
--
>> net/ipv4/tcp_fastopen.c:284:2: error: call to undeclared function 'tcp_bpf_rcvlowat'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |         tcp_bpf_rcvlowat(sk, skb);
         |         ^
   net/ipv4/tcp_fastopen.c:284:2: note: did you mean 'tcp_set_rcvlowat'?
   include/net/tcp.h:519:5: note: 'tcp_set_rcvlowat' declared here
     519 | int tcp_set_rcvlowat(struct sock *sk, int val);
         |     ^
   1 error generated.


vim +/tcp_bpf_rcvlowat +1606 net/ipv4/tcp.c

  1548	
  1549	/* Clean up the receive buffer for full frames taken by the user,
  1550	 * then send an ACK if necessary.  COPIED is the number of bytes
  1551	 * tcp_recvmsg has given to the user so far, it speeds up the
  1552	 * calculation of whether or not we must ACK for the sake of
  1553	 * a window update.
  1554	 */
  1555	void __tcp_cleanup_rbuf(struct sock *sk, int copied)
  1556	{
  1557		struct tcp_sock *tp = tcp_sk(sk);
  1558		bool time_to_ack = false;
  1559	
  1560		if (inet_csk_ack_scheduled(sk)) {
  1561			const struct inet_connection_sock *icsk = inet_csk(sk);
  1562	
  1563			if (/* Once-per-two-segments ACK was not sent by tcp_input.c */
  1564			    tp->rcv_nxt - tp->rcv_wup > icsk->icsk_ack.rcv_mss ||
  1565			    /*
  1566			     * If this read emptied read buffer, we send ACK, if
  1567			     * connection is not bidirectional, user drained
  1568			     * receive buffer and there was a small segment
  1569			     * in queue.
  1570			     */
  1571			    (copied > 0 &&
  1572			     ((icsk->icsk_ack.pending & ICSK_ACK_PUSHED2) ||
  1573			      ((icsk->icsk_ack.pending & ICSK_ACK_PUSHED) &&
  1574			       !inet_csk_in_pingpong_mode(sk))) &&
  1575			      !atomic_read(&sk->sk_rmem_alloc)))
  1576				time_to_ack = true;
  1577		}
  1578	
  1579		/* We send an ACK if we can now advertise a non-zero window
  1580		 * which has been raised "significantly".
  1581		 *
  1582		 * Even if window raised up to infinity, do not send window open ACK
  1583		 * in states, where we will not receive more. It is useless.
  1584		 */
  1585		if (copied > 0 && !time_to_ack && !(sk->sk_shutdown & RCV_SHUTDOWN)) {
  1586			__u32 rcv_window_now = tcp_receive_window(tp);
  1587	
  1588			/* Optimize, __tcp_select_window() is not cheap. */
  1589			if (2*rcv_window_now <= tp->window_clamp) {
  1590				__u32 new_window = __tcp_select_window(sk);
  1591	
  1592				/* Send ACK now, if this read freed lots of space
  1593				 * in our buffer. Certainly, new_window is new window.
  1594				 * We can advertise it now, if it is not less than current one.
  1595				 * "Lots" means "at least twice" here.
  1596				 */
  1597				if (new_window && new_window >= 2 * rcv_window_now)
  1598					time_to_ack = true;
  1599			}
  1600		}
  1601		if (time_to_ack) {
  1602			tcp_mstamp_refresh(tp);
  1603			tcp_send_ack(sk);
  1604		}
  1605	
> 1606		tcp_bpf_rcvlowat(sk, NULL);
  1607	}
  1608	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
