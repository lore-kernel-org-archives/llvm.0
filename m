Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3823638E113;
	Sun, 14 Jun 2026 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781447317; cv=none; b=C0XEvW79F9yNi2AygWgTlsG1NWDdgK+g+McYHn1Qft48jrU2OCCNFdKm6/6h0/yHHHgpGwIUEEuMEjD80RU3HW6ZCygh/m+HFxA7cUnXIHqbRvxHIUXh/abGP+w6jcns/A+LNZRakZqKGIGYiR5ELqVCDHfmYnafv7UMBPP5Ji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781447317; c=relaxed/simple;
	bh=0xiGbE6dbs6t1Dhv278LQe4tisYyt6tKw0gRetlcL4s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MgcaaMS9WUXRHbMNrOf0d4f+2UdlfK/zKAgFZkB2BNsxuYmYPuYfiK2UhUNzpE3jYnEEtC65+6mRGycI06eXUQWOeDvbtLWbe/kfFbp4//HnE6T7ll8v8YNHS23WRPzV6wjzdJTtrXTJ0Jc8So5LudaizrVHjp/lOjX/5JASAaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lF2qspHF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lF2qspHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781447316; x=1812983316;
  h=date:from:to:cc:subject:message-id;
  bh=0xiGbE6dbs6t1Dhv278LQe4tisYyt6tKw0gRetlcL4s=;
  b=lF2qspHFVh7dFmvBDyQJhoAvhKijddJiA8ofyrjmwZDwDaiU5TuZVmnq
   E8jHaJGdrAmEmXanaIygNyxCOe5SuPy4eZXmqDVK5K/JJ8dOvKDUkc/IP
   FK8QHM8xAV7cbfxlvxjXolidtdDY8GS/IXZTXD9RT6irN+7w9bSZqdh1A
   l+bsfkWhshz5PZa1ygeZGKJgJ8D2E498zinJHwSzYNjirloqvOIC1uYDR
   p8l7WzSmRydPODuwUgc9WY0jJO1vNrS467O+BT++Z6DX1aeBES2nr7sAH
   c9C9Hny+YgfxPospDlebtNhMrsR+5YG4hM2hGogcKTkmxy8QQsa5HbOK1
   g==;
X-CSE-ConnectionGUID: f9Jz6NNhQPKwkGVNzkXguw==
X-CSE-MsgGUID: RQH4N7JjTUiYyV8g0wMHhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="93698151"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="93698151"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 07:28:33 -0700
X-CSE-ConnectionGUID: f2vYhMG4SRisA/QLMGezRw==
X-CSE-MsgGUID: wDXDobVCTRab2A3j5JHf6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="244343464"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jun 2026 07:28:31 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYlp7-00000000QtG-0RJL;
	Sun, 14 Jun 2026 14:28:29 +0000
Date: Sun, 14 Jun 2026 22:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [pabeni-devel:mptcp_out_opt_refactor 1/3]
 net/ipv4/tcp_output.c:846:36: error: incompatible integer to pointer
 conversion passing 'unsigned int' to parameter of type 'unsigned int *';
 remove *
Message-ID: <202606142224.qs4u2q4L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/pabeni/linux-devel mptcp_out_opt_refactor
head:   626881f865b7b1234b444dfa972f0fa3ef80e920
commit: 1414ccc3a56482387d4d1732f8eda9f7ca73647e [1/3] tcp: clean-up mptcp option selection hooks signature
config: i386-randconfig-004-20260614 (https://download.01.org/0day-ci/archive/20260614/202606142224.qs4u2q4L-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606142224.qs4u2q4L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606142224.qs4u2q4L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ipv4/tcp_output.c:846:36: error: incompatible integer to pointer conversion passing 'unsigned int' to parameter of type 'unsigned int *'; remove * [-Wint-conversion]
     846 |                 size = mptcp_synack_options(req, *remaining, opts);
         |                                                  ^~~~~~~~~~
   include/net/mptcp.h:270:20: note: passing argument to parameter 'size' here
     270 |                                         unsigned int *size,
         |                                                       ^
>> net/ipv4/tcp_output.c:846:48: error: incompatible pointer types passing 'struct tcp_out_options *' to parameter of type 'struct mptcp_out_options *' [-Wincompatible-pointer-types]
     846 |                 size = mptcp_synack_options(req, *remaining, opts);
         |                                                              ^~~~
   include/net/mptcp.h:271:32: note: passing argument to parameter 'opts' here
     271 |                                         struct mptcp_out_options *opts)
         |                                                                   ^
>> net/ipv4/tcp_output.c:1004:37: error: incompatible integer to pointer conversion passing 'unsigned int' to parameter of type 'unsigned int *'; take the address with & [-Wint-conversion]
    1004 |                 size = mptcp_syn_options(sk, skb, remaining, opts);
         |                                                   ^~~~~~~~~
         |                                                   &
   include/net/mptcp.h:263:24: note: passing argument to parameter 'size' here
     263 |                                      unsigned int *size,
         |                                                    ^
   net/ipv4/tcp_output.c:1004:48: error: incompatible pointer types passing 'struct tcp_out_options *' to parameter of type 'struct mptcp_out_options *' [-Wincompatible-pointer-types]
    1004 |                 size = mptcp_syn_options(sk, skb, remaining, opts);
         |                                                              ^~~~
   include/net/mptcp.h:264:36: note: passing argument to parameter 'opts' here
     264 |                                      struct mptcp_out_options *opts)
         |                                                                ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +846 net/ipv4/tcp_output.c

   838	
   839	static void mptcp_set_option_cond(const struct request_sock *req,
   840					  struct tcp_out_options *opts,
   841					  unsigned int *remaining)
   842	{
   843		if (rsk_is_mptcp(req)) {
   844			unsigned int size;
   845	
 > 846			size = mptcp_synack_options(req, *remaining, opts);
   847			if (size >= 0) {
   848				opts->options |= OPTION_MPTCP;
   849				*remaining -= size;
   850			}
   851		}
   852	}
   853	
   854	static u32 tcp_synack_options_combine_saving(struct tcp_out_options *opts)
   855	{
   856		/* How much there's room for combining with the alignment padding? */
   857		if ((opts->options & (OPTION_SACK_ADVERTISE | OPTION_TS)) ==
   858		    OPTION_SACK_ADVERTISE)
   859			return 2;
   860		else if (opts->options & OPTION_WSCALE)
   861			return 1;
   862		return 0;
   863	}
   864	
   865	/* Calculates how long AccECN option will fit to @remaining option space.
   866	 *
   867	 * AccECN option can sometimes replace NOPs used for alignment of other
   868	 * TCP options (up to @max_combine_saving available).
   869	 *
   870	 * Only solutions with at least @required AccECN fields are accepted.
   871	 *
   872	 * Returns: The size of the AccECN option excluding space repurposed from
   873	 * the alignment of the other options.
   874	 */
   875	static int tcp_options_fit_accecn(struct tcp_out_options *opts, int required,
   876					  int remaining)
   877	{
   878		int size = TCP_ACCECN_MAXSIZE;
   879		int sack_blocks_reduce = 0;
   880		int max_combine_saving;
   881		int rem = remaining;
   882		int align_size;
   883	
   884		if (opts->use_synack_ecn_bytes)
   885			max_combine_saving = tcp_synack_options_combine_saving(opts);
   886		else
   887			max_combine_saving = opts->num_sack_blocks > 0 ? 2 : 0;
   888		opts->num_accecn_fields = TCP_ACCECN_NUMFIELDS;
   889		while (opts->num_accecn_fields >= required) {
   890			/* Pad to dword if cannot combine */
   891			if ((size & 0x3) > max_combine_saving)
   892				align_size = ALIGN(size, 4);
   893			else
   894				align_size = ALIGN_DOWN(size, 4);
   895	
   896			if (rem >= align_size) {
   897				size = align_size;
   898				break;
   899			} else if (opts->num_accecn_fields == required &&
   900				   opts->num_sack_blocks > 2 &&
   901				   required > 0) {
   902				/* Try to fit the option by removing one SACK block */
   903				opts->num_sack_blocks--;
   904				sack_blocks_reduce++;
   905				rem = rem + TCPOLEN_SACK_PERBLOCK;
   906	
   907				opts->num_accecn_fields = TCP_ACCECN_NUMFIELDS;
   908				size = TCP_ACCECN_MAXSIZE;
   909				continue;
   910			}
   911	
   912			opts->num_accecn_fields--;
   913			size -= TCPOLEN_ACCECN_PERFIELD;
   914		}
   915		if (sack_blocks_reduce > 0) {
   916			if (opts->num_accecn_fields >= required)
   917				size -= sack_blocks_reduce * TCPOLEN_SACK_PERBLOCK;
   918			else
   919				opts->num_sack_blocks += sack_blocks_reduce;
   920		}
   921		if (opts->num_accecn_fields < required)
   922			return 0;
   923	
   924		opts->options |= OPTION_ACCECN;
   925		return size;
   926	}
   927	
   928	/* Compute TCP options for SYN packets. This is not the final
   929	 * network wire format yet.
   930	 */
   931	static unsigned int tcp_syn_options(struct sock *sk, struct sk_buff *skb,
   932					struct tcp_out_options *opts,
   933					struct tcp_key *key)
   934	{
   935		struct tcp_sock *tp = tcp_sk(sk);
   936		unsigned int remaining = MAX_TCP_OPTION_SPACE;
   937		struct tcp_fastopen_request *fastopen = tp->fastopen_req;
   938		bool timestamps;
   939	
   940		opts->options = 0;
   941	
   942		/* Better than switch (key.type) as it has static branches */
   943		if (tcp_key_is_md5(key)) {
   944			timestamps = false;
   945			opts->options |= OPTION_MD5;
   946			remaining -= TCPOLEN_MD5SIG_ALIGNED;
   947		} else {
   948			timestamps = READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_timestamps);
   949			if (tcp_key_is_ao(key)) {
   950				opts->options |= OPTION_AO;
   951				remaining -= tcp_ao_len_aligned(key->ao_key);
   952			}
   953		}
   954	
   955		/* We always get an MSS option.  The option bytes which will be seen in
   956		 * normal data packets should timestamps be used, must be in the MSS
   957		 * advertised.  But we subtract them from tp->mss_cache so that
   958		 * calculations in tcp_sendmsg are simpler etc.  So account for this
   959		 * fact here if necessary.  If we don't do this correctly, as a
   960		 * receiver we won't recognize data packets as being full sized when we
   961		 * should, and thus we won't abide by the delayed ACK rules correctly.
   962		 * SACKs don't matter, we never delay an ACK when we have any of those
   963		 * going out.  */
   964		opts->mss = tcp_advertise_mss(sk);
   965		remaining -= TCPOLEN_MSS_ALIGNED;
   966	
   967		if (likely(timestamps)) {
   968			opts->options |= OPTION_TS;
   969			opts->tsval = tcp_skb_timestamp_ts(tp->tcp_usec_ts, skb) + tp->tsoffset;
   970			opts->tsecr = tp->rx_opt.ts_recent;
   971			remaining -= TCPOLEN_TSTAMP_ALIGNED;
   972		}
   973		if (likely(READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_window_scaling))) {
   974			opts->ws = tp->rx_opt.rcv_wscale;
   975			opts->options |= OPTION_WSCALE;
   976			remaining -= TCPOLEN_WSCALE_ALIGNED;
   977		}
   978		if (likely(READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_sack))) {
   979			opts->options |= OPTION_SACK_ADVERTISE;
   980			if (unlikely(!(OPTION_TS & opts->options)))
   981				remaining -= TCPOLEN_SACKPERM_ALIGNED;
   982		}
   983	
   984		if (fastopen && fastopen->cookie.len >= 0) {
   985			u32 need = fastopen->cookie.len;
   986	
   987			need += fastopen->cookie.exp ? TCPOLEN_EXP_FASTOPEN_BASE :
   988						       TCPOLEN_FASTOPEN_BASE;
   989			need = (need + 3) & ~3U;  /* Align to 32 bits */
   990			if (remaining >= need) {
   991				opts->options |= OPTION_FAST_OPEN_COOKIE;
   992				opts->fastopen_cookie = &fastopen->cookie;
   993				remaining -= need;
   994				tp->syn_fastopen = 1;
   995				tp->syn_fastopen_exp = fastopen->cookie.exp ? 1 : 0;
   996			}
   997		}
   998	
   999		smc_set_option(tp, opts, &remaining);
  1000	
  1001		if (sk_is_mptcp(sk)) {
  1002			unsigned int size;
  1003	
> 1004			size = mptcp_syn_options(sk, skb, remaining, opts);
  1005			if (size >= 0) {
  1006				opts->options |= OPTION_MPTCP;
  1007				remaining -= size;
  1008			}
  1009		}
  1010	
  1011		/* Simultaneous open SYN/ACK needs AccECN option but not SYN.
  1012		 * It is attempted to negotiate the use of AccECN also on the first
  1013		 * retransmitted SYN, as mentioned in "3.1.4.1. Retransmitted SYNs"
  1014		 * of AccECN draft.
  1015		 */
  1016		if (unlikely((TCP_SKB_CB(skb)->tcp_flags & TCPHDR_ACK) &&
  1017			     tcp_ecn_mode_accecn(tp) &&
  1018			     inet_csk(sk)->icsk_retransmits < 2 &&
  1019			     READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn_option) &&
  1020			     remaining >= TCPOLEN_ACCECN_BASE)) {
  1021			opts->use_synack_ecn_bytes = 1;
  1022			remaining -= tcp_options_fit_accecn(opts, 0, remaining);
  1023		}
  1024	
  1025		remaining = bpf_skops_hdr_opt_len(sk, skb, NULL, NULL, 0, opts,
  1026						  remaining);
  1027	
  1028		return MAX_TCP_OPTION_SPACE - remaining;
  1029	}
  1030	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
