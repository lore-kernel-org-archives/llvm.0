Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8783D76;
	Sat, 14 Jun 2025 22:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749938622; cv=none; b=UZOBK+MWzLa9nQDwCXGhA7wELB8VjzI8+HNMMCbNyuEYfck3LVFQQJiKLX/NIfmELSJUIDT70Y7kYsF7ascIDjgGHS9i6egN/ecgWTJ4aEHVuIauIvXWRIr3KqnQRWyCK5aFeJLdjMe+am7r0ekq8iPNGw3QcvADsQQD86oy3WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749938622; c=relaxed/simple;
	bh=JTYmqaFXj4wcl4pE7bwxx/owd8qHlqKHvuBhdYBcTyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/yGClURU2WVc/Bz2wpi6T0qpvGM5LKgfSvmiwO1NRi5TZEzgSD1m4AN8R99OGTSvB2r84OJR7HSXx6PYb2sfbUauF3CccYK8L1VBPHSkSzGqPpDrLnyb/Cf0G5fHdOELFsJepLybTUA4QE4q3tLtlyvDVNc/iYkjJ/VVNZQOC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tpkra5Gx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tpkra5Gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749938620; x=1781474620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JTYmqaFXj4wcl4pE7bwxx/owd8qHlqKHvuBhdYBcTyo=;
  b=Tpkra5Gx3QyH8BU9luiN+LJDbvlVQp9CYArDJWAJretpIVplOcXTJswP
   /wvH2CrRIAQQuPDHsED4oE6+zvh9kHNILnQ11SiXmtsQaXlLxCmr5TmLb
   BMoIkhb/mIIgNRupNRPUhUTwwc7qhjGrwcjmX4PDmzBQfC/H9xjHIx8D1
   ckwLp1m6G0UFutu7TXEXXZHFQmDl8HdQ4C/ejMpVsJo1vAy6wzBMkoUHm
   PaYapT2ArxQ0yQMEjTgPCXeGtleX00I0wWr00/bXfdcaOapOmqIvd2M6y
   m7OByRqfLDz24J1NGvah7leXV9YIobhAqECADvCwXw9Gr02om+588LzCx
   Q==;
X-CSE-ConnectionGUID: 42+PZrX+S4Wd+PZ+THZ4rQ==
X-CSE-MsgGUID: 4FcNLWZ9REqDpON3UCOe/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="69568282"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="69568282"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 15:03:38 -0700
X-CSE-ConnectionGUID: mKn+G2v+SNWkFfgsgZGjqw==
X-CSE-MsgGUID: ORFGeCMXT7+Jc9pz8ejhVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="148106496"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2025 15:03:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQYyM-000Dtc-30;
	Sat, 14 Jun 2025 22:03:34 +0000
Date: Sun, 15 Jun 2025 06:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: Neal Cardwell <ncardwell.sw@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 1/3] tcp: remove obsolete and unused
 RFC3517/RFC6675 loss recovery code
Message-ID: <202506150546.5gETHB6Z-lkp@intel.com>
References: <20250613230907.1702265-2-ncardwell.sw@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613230907.1702265-2-ncardwell.sw@gmail.com>

Hi Neal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Neal-Cardwell/tcp-remove-obsolete-and-unused-RFC3517-RFC6675-loss-recovery-code/20250614-071032
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250613230907.1702265-2-ncardwell.sw%40gmail.com
patch subject: [PATCH net-next 1/3] tcp: remove obsolete and unused RFC3517/RFC6675 loss recovery code
config: i386-buildonly-randconfig-004-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150546.5gETHB6Z-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150546.5gETHB6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150546.5gETHB6Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_input.c:2959:6: warning: variable 'fast_rexmit' set but not used [-Wunused-but-set-variable]
    2959 |         int fast_rexmit = 0, flag = *ack_flag;
         |             ^
   1 warning generated.


vim +/fast_rexmit +2959 net/ipv4/tcp_input.c

98e36d449cc681 Yuchung Cheng            2017-01-12  2941  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2942  /* Process an event, which can update packets-in-flight not trivially.
^1da177e4c3f41 Linus Torvalds           2005-04-16  2943   * Main goal of this function is to calculate new estimate for left_out,
^1da177e4c3f41 Linus Torvalds           2005-04-16  2944   * taking into account both packets sitting in receiver's buffer and
^1da177e4c3f41 Linus Torvalds           2005-04-16  2945   * packets lost by network.
^1da177e4c3f41 Linus Torvalds           2005-04-16  2946   *
31ba0c10723e9e Yuchung Cheng            2016-02-02  2947   * Besides that it updates the congestion state when packet loss or ECN
31ba0c10723e9e Yuchung Cheng            2016-02-02  2948   * is detected. But it does not reduce the cwnd, it is done by the
31ba0c10723e9e Yuchung Cheng            2016-02-02  2949   * congestion control later.
^1da177e4c3f41 Linus Torvalds           2005-04-16  2950   *
^1da177e4c3f41 Linus Torvalds           2005-04-16  2951   * It does _not_ decide what to send, it is made in function
^1da177e4c3f41 Linus Torvalds           2005-04-16  2952   * tcp_xmit_retransmit_queue().
^1da177e4c3f41 Linus Torvalds           2005-04-16  2953   */
737ff314563ca2 Yuchung Cheng            2017-11-08  2954  static void tcp_fastretrans_alert(struct sock *sk, const u32 prior_snd_una,
19119f298bb1f2 Eric Dumazet             2018-11-27  2955  				  int num_dupack, int *ack_flag, int *rexmit)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2956  {
6687e988d9aeac Arnaldo Carvalho de Melo 2005-08-10  2957  	struct inet_connection_sock *icsk = inet_csk(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2958  	struct tcp_sock *tp = tcp_sk(sk);
31ba0c10723e9e Yuchung Cheng            2016-02-02 @2959  	int fast_rexmit = 0, flag = *ack_flag;
c634e34f6ebfb7 Yousuk Seung             2020-06-26  2960  	bool ece_ack = flag & FLAG_ECE;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2961  
8ba6ddaaf86c4c Eric Dumazet             2017-10-05  2962  	if (!tp->packets_out && tp->sacked_out)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2963  		tp->sacked_out = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2964  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2965  	/* Now state machine starts.
^1da177e4c3f41 Linus Torvalds           2005-04-16  2966  	 * A. ECE, hence prohibit cwnd undoing, the reduction is required. */
c634e34f6ebfb7 Yousuk Seung             2020-06-26  2967  	if (ece_ack)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2968  		tp->prior_ssthresh = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2969  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2970  	/* B. In all the states check for reneging SACKs. */
d2a0fc372aca56 Fred Chen                2023-10-21  2971  	if (tcp_check_sack_reneging(sk, ack_flag))
^1da177e4c3f41 Linus Torvalds           2005-04-16  2972  		return;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2973  
974c12360dfe6a Yuchung Cheng            2012-01-19  2974  	/* C. Check consistency of the current state. */
005903bc3a0e84 Ilpo Järvinen            2007-08-09  2975  	tcp_verify_left_out(tp);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2976  
974c12360dfe6a Yuchung Cheng            2012-01-19  2977  	/* D. Check state exit conditions. State can be terminated
^1da177e4c3f41 Linus Torvalds           2005-04-16  2978  	 *    when high_seq is ACKed. */
6687e988d9aeac Arnaldo Carvalho de Melo 2005-08-10  2979  	if (icsk->icsk_ca_state == TCP_CA_Open) {
a7abf3cd76e1e1 Eric Dumazet             2021-03-11  2980  		WARN_ON(tp->retrans_out != 0 && !tp->syn_data);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2981  		tp->retrans_stamp = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2982  	} else if (!before(tp->snd_una, tp->high_seq)) {
6687e988d9aeac Arnaldo Carvalho de Melo 2005-08-10  2983  		switch (icsk->icsk_ca_state) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  2984  		case TCP_CA_CWR:
^1da177e4c3f41 Linus Torvalds           2005-04-16  2985  			/* CWR is to be held something *above* high_seq
^1da177e4c3f41 Linus Torvalds           2005-04-16  2986  			 * is ACKed for CWR bit to reach receiver. */
^1da177e4c3f41 Linus Torvalds           2005-04-16  2987  			if (tp->snd_una != tp->high_seq) {
684bad1107571d Yuchung Cheng            2012-09-02  2988  				tcp_end_cwnd_reduction(sk);
6687e988d9aeac Arnaldo Carvalho de Melo 2005-08-10  2989  				tcp_set_ca_state(sk, TCP_CA_Open);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2990  			}
^1da177e4c3f41 Linus Torvalds           2005-04-16  2991  			break;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2992  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2993  		case TCP_CA_Recovery:
e60402d0a909ca Ilpo Järvinen            2007-08-09  2994  			if (tcp_is_reno(tp))
^1da177e4c3f41 Linus Torvalds           2005-04-16  2995  				tcp_reset_reno_sack(tp);
9e412ba7632f71 Ilpo Järvinen            2007-04-20  2996  			if (tcp_try_undo_recovery(sk))
^1da177e4c3f41 Linus Torvalds           2005-04-16  2997  				return;
684bad1107571d Yuchung Cheng            2012-09-02  2998  			tcp_end_cwnd_reduction(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2999  			break;
^1da177e4c3f41 Linus Torvalds           2005-04-16  3000  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  3001  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  3002  
974c12360dfe6a Yuchung Cheng            2012-01-19  3003  	/* E. Process state. */
6687e988d9aeac Arnaldo Carvalho de Melo 2005-08-10  3004  	switch (icsk->icsk_ca_state) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  3005  	case TCP_CA_Recovery:
2e6052941ae1f2 Ilpo Järvinen            2007-08-02  3006  		if (!(flag & FLAG_SND_UNA_ADVANCED)) {
19119f298bb1f2 Eric Dumazet             2018-11-27  3007  			if (tcp_is_reno(tp))
c634e34f6ebfb7 Yousuk Seung             2020-06-26  3008  				tcp_add_reno_sack(sk, num_dupack, ece_ack);
f6e254d10bca5a Neal Cardwell            2025-06-13  3009  		} else if (tcp_try_undo_partial(sk, prior_snd_una))
7026b912f97d91 Yuchung Cheng            2013-05-29  3010  			return;
a29cb6914681a5 Yuchung Cheng            2021-06-02  3011  
a29cb6914681a5 Yuchung Cheng            2021-06-02  3012  		if (tcp_try_undo_dsack(sk))
a6458ab7fd4f42 Neal Cardwell            2024-06-26  3013  			tcp_try_to_open(sk, flag);
a29cb6914681a5 Yuchung Cheng            2021-06-02  3014  
a29cb6914681a5 Yuchung Cheng            2021-06-02  3015  		tcp_identify_packet_loss(sk, ack_flag);
a29cb6914681a5 Yuchung Cheng            2021-06-02  3016  		if (icsk->icsk_ca_state != TCP_CA_Recovery) {
a29cb6914681a5 Yuchung Cheng            2021-06-02  3017  			if (!tcp_time_to_recover(sk, flag))
c7d9d6a185a7ea Yuchung Cheng            2013-05-29  3018  				return;
a29cb6914681a5 Yuchung Cheng            2021-06-02  3019  			/* Undo reverts the recovery state. If loss is evident,
a29cb6914681a5 Yuchung Cheng            2021-06-02  3020  			 * starts a new recovery (e.g. reordering then loss);
a29cb6914681a5 Yuchung Cheng            2021-06-02  3021  			 */
a29cb6914681a5 Yuchung Cheng            2021-06-02  3022  			tcp_enter_recovery(sk, ece_ack);
c7d9d6a185a7ea Yuchung Cheng            2013-05-29  3023  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  3024  		break;
^1da177e4c3f41 Linus Torvalds           2005-04-16  3025  	case TCP_CA_Loss:
19119f298bb1f2 Eric Dumazet             2018-11-27  3026  		tcp_process_loss(sk, flag, num_dupack, rexmit);
3868ab0f192581 Aananth V                2023-09-14  3027  		if (icsk->icsk_ca_state != TCP_CA_Loss)
3868ab0f192581 Aananth V                2023-09-14  3028  			tcp_update_rto_time(tp);
6ac06ecd3a5d1d Yuchung Cheng            2018-05-16  3029  		tcp_identify_packet_loss(sk, ack_flag);
98e36d449cc681 Yuchung Cheng            2017-01-12  3030  		if (!(icsk->icsk_ca_state == TCP_CA_Open ||
98e36d449cc681 Yuchung Cheng            2017-01-12  3031  		      (*ack_flag & FLAG_LOST_RETRANS)))
^1da177e4c3f41 Linus Torvalds           2005-04-16  3032  			return;
291a00d1a70f96 Yuchung Cheng            2015-07-01  3033  		/* Change state if cwnd is undone or retransmits are lost */
a8eceea84a3a35 Joe Perches              2020-03-12  3034  		fallthrough;
^1da177e4c3f41 Linus Torvalds           2005-04-16  3035  	default:
e60402d0a909ca Ilpo Järvinen            2007-08-09  3036  		if (tcp_is_reno(tp)) {
2e6052941ae1f2 Ilpo Järvinen            2007-08-02  3037  			if (flag & FLAG_SND_UNA_ADVANCED)
^1da177e4c3f41 Linus Torvalds           2005-04-16  3038  				tcp_reset_reno_sack(tp);
c634e34f6ebfb7 Yousuk Seung             2020-06-26  3039  			tcp_add_reno_sack(sk, num_dupack, ece_ack);
^1da177e4c3f41 Linus Torvalds           2005-04-16  3040  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  3041  
f698204bd0bfdc Neal Cardwell            2011-11-16  3042  		if (icsk->icsk_ca_state <= TCP_CA_Disorder)
9e412ba7632f71 Ilpo Järvinen            2007-04-20  3043  			tcp_try_undo_dsack(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  3044  
6ac06ecd3a5d1d Yuchung Cheng            2018-05-16  3045  		tcp_identify_packet_loss(sk, ack_flag);
750ea2bafa55aa Yuchung Cheng            2012-05-02  3046  		if (!tcp_time_to_recover(sk, flag)) {
31ba0c10723e9e Yuchung Cheng            2016-02-02  3047  			tcp_try_to_open(sk, flag);
^1da177e4c3f41 Linus Torvalds           2005-04-16  3048  			return;
^1da177e4c3f41 Linus Torvalds           2005-04-16  3049  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  3050  
5d424d5a674f78 John Heffner             2006-03-20  3051  		/* MTU probe failure: don't reduce cwnd */
5d424d5a674f78 John Heffner             2006-03-20  3052  		if (icsk->icsk_ca_state < TCP_CA_CWR &&
5d424d5a674f78 John Heffner             2006-03-20  3053  		    icsk->icsk_mtup.probe_size &&
0e7b13685f9a06 John Heffner             2006-03-20  3054  		    tp->snd_una == tp->mtu_probe.probe_seq_start) {
5d424d5a674f78 John Heffner             2006-03-20  3055  			tcp_mtup_probe_failed(sk);
5d424d5a674f78 John Heffner             2006-03-20  3056  			/* Restores the reduction we did in tcp_mtup_probe() */
40570375356c87 Eric Dumazet             2022-04-05  3057  			tcp_snd_cwnd_set(tp, tcp_snd_cwnd(tp) + 1);
5d424d5a674f78 John Heffner             2006-03-20  3058  			tcp_simple_retransmit(sk);
5d424d5a674f78 John Heffner             2006-03-20  3059  			return;
5d424d5a674f78 John Heffner             2006-03-20  3060  		}
5d424d5a674f78 John Heffner             2006-03-20  3061  
^1da177e4c3f41 Linus Torvalds           2005-04-16  3062  		/* Otherwise enter Recovery state */
c634e34f6ebfb7 Yousuk Seung             2020-06-26  3063  		tcp_enter_recovery(sk, ece_ack);
85cc391c0e4584 Ilpo Järvinen            2007-11-15  3064  		fast_rexmit = 1;
^1da177e4c3f41 Linus Torvalds           2005-04-16  3065  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  3066  
e662ca40de846e Yuchung Cheng            2016-02-02  3067  	*rexmit = REXMIT_LOST;
^1da177e4c3f41 Linus Torvalds           2005-04-16  3068  }
^1da177e4c3f41 Linus Torvalds           2005-04-16  3069  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
