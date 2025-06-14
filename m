Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C671EF375;
	Sat, 14 Jun 2025 22:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749941747; cv=none; b=XiYaFcJUAfczuKOt61k3y34vcklnJ9XSgwwkj1N/Lf82R6RNLgjLTg85qMj2pHzF8mT0UPe5txRoCEXnekFZ8U0XGsrcwKyMGiJOdQmkb4PsoKUHJptkGBIExR9MihWGPDrjbrDTDOij17d+tcNgW3u6KQ+0qw07VhrzDa0CggY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749941747; c=relaxed/simple;
	bh=34eqgrFs4UAumyt2zeMI0TpKh8XBFP0453vWpugXq0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxlp9oo0OPQ5Qhk/Mm44uIFT4iB605JMYj8/616pFjuol+qGPi57UrcxTpJSag7oOPFhhc7CcZ0L3d51Hm9Z0PGIcHMwZlzPgzv2RcmL88QPkT27kTmDe8ZkC0NKvqRjeLA35ZLfYwACwBJ3Ica71e5TYhU6KNRWLv2ejQSEyrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/xlRy0S; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/xlRy0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749941744; x=1781477744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=34eqgrFs4UAumyt2zeMI0TpKh8XBFP0453vWpugXq0s=;
  b=T/xlRy0SRuKnZguNfdjymf5ctneij1x8J3rhKDsr59EjEcB6KPXZO/41
   CBbTlpNHVG6PsrV8CEBQZ8nmxILNP/Fj9FnBcivXXolsQvURiq9Zxp4ez
   OqVfLtSSYpprCtuSt1Q3bk5u2H8sPiUYujFEoVGNck8rD/4RUynrpbCW7
   4zjgnciKquJ+EVKieTbvf04En6f2A3YEkvk3zSnH0165XofSQxJlUfzS8
   d4F/mr7IOjEqcxXM3FurRvTd6wfNOEvupF4QdcW6IKkwfFQQIyiwn++vX
   6dm/dtCnHR1KaXuWMKqAiNIuvHp2jmlG3JKgx3zoxM/CdTT0vBha/Xn4M
   w==;
X-CSE-ConnectionGUID: wdidZOYVTAWVq41bzykoyA==
X-CSE-MsgGUID: /aVoW8sfTlGxRfzmID0Icw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52268119"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="52268119"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 15:55:43 -0700
X-CSE-ConnectionGUID: f6qu+tcqSm6Fg3AIXTEYeA==
X-CSE-MsgGUID: OKrfWjZOTAaYdaHQ7s7MFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="149040000"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2025 15:55:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQZml-000Dvk-20;
	Sat, 14 Jun 2025 22:55:39 +0000
Date: Sun, 15 Jun 2025 06:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: Neal Cardwell <ncardwell.sw@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 2/3] tcp: remove RFC3517/RFC6675 hint state:
 lost_skb_hint, lost_cnt_hint
Message-ID: <202506150617.IXN2yJ4v-lkp@intel.com>
References: <20250613230907.1702265-3-ncardwell.sw@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613230907.1702265-3-ncardwell.sw@gmail.com>

Hi Neal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Neal-Cardwell/tcp-remove-obsolete-and-unused-RFC3517-RFC6675-loss-recovery-code/20250614-071032
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250613230907.1702265-3-ncardwell.sw%40gmail.com
patch subject: [PATCH net-next 2/3] tcp: remove RFC3517/RFC6675 hint state: lost_skb_hint, lost_cnt_hint
config: i386-buildonly-randconfig-004-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150617.IXN2yJ4v-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150617.IXN2yJ4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150617.IXN2yJ4v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/tcp_input.c:2947:6: warning: variable 'fast_rexmit' set but not used [-Wunused-but-set-variable]
    2947 |         int fast_rexmit = 0, flag = *ack_flag;
         |             ^
>> net/ipv4/tcp_input.c:3367:8: warning: variable 'delta' set but not used [-Wunused-but-set-variable]
    3367 |                         int delta;
         |                             ^
   2 warnings generated.


vim +/delta +3367 net/ipv4/tcp_input.c

ad971f616aa98e Eric Dumazet            2014-10-11  3212  
7c46a03e67d11d Ilpo Järvinen           2007-09-20  3213  /* Remove acknowledged frames from the retransmission queue. If our packet
7c46a03e67d11d Ilpo Järvinen           2007-09-20  3214   * is before the ack sequence we can discard it as it's confirmed to have
7c46a03e67d11d Ilpo Järvinen           2007-09-20  3215   * arrived at the other end.
7c46a03e67d11d Ilpo Järvinen           2007-09-20  3216   */
e7ed11ee945438 Yousuk Seung            2021-01-20  3217  static int tcp_clean_rtx_queue(struct sock *sk, const struct sk_buff *ack_skb,
e7ed11ee945438 Yousuk Seung            2021-01-20  3218  			       u32 prior_fack, u32 prior_snd_una,
c634e34f6ebfb7 Yousuk Seung            2020-06-26  3219  			       struct tcp_sacktag_state *sack, bool ece_ack)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3220  {
2d2abbab63f672 Stephen Hemminger       2005-11-10  3221  	const struct inet_connection_sock *icsk = inet_csk(sk);
9a568de4818dea Eric Dumazet            2017-05-16  3222  	u64 first_ackt, last_ackt;
740b0f1841f6e3 Eric Dumazet            2014-02-26  3223  	struct tcp_sock *tp = tcp_sk(sk);
740b0f1841f6e3 Eric Dumazet            2014-02-26  3224  	u32 prior_sacked = tp->sacked_out;
737ff314563ca2 Yuchung Cheng           2017-11-08  3225  	u32 reord = tp->snd_nxt; /* lowest acked un-retx un-sacked seq */
75c119afe14f74 Eric Dumazet            2017-10-05  3226  	struct sk_buff *skb, *next;
34a6eda163975d Peter Senna Tschudin    2013-10-02  3227  	bool fully_acked = true;
31231a8a873026 Kenneth Klette Jonassen 2015-05-01  3228  	long sack_rtt_us = -1L;
740b0f1841f6e3 Eric Dumazet            2014-02-26  3229  	long seq_rtt_us = -1L;
31231a8a873026 Kenneth Klette Jonassen 2015-05-01  3230  	long ca_rtt_us = -1L;
7201883599ac8b Ilpo Järvinen           2007-12-30  3231  	u32 pkts_acked = 0;
2f715c1dde6e17 Yuchung Cheng           2013-10-24  3232  	bool rtt_update;
740b0f1841f6e3 Eric Dumazet            2014-02-26  3233  	int flag = 0;
740b0f1841f6e3 Eric Dumazet            2014-02-26  3234  
9a568de4818dea Eric Dumazet            2017-05-16  3235  	first_ackt = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3236  
75c119afe14f74 Eric Dumazet            2017-10-05  3237  	for (skb = skb_rb_first(&sk->tcp_rtx_queue); skb; skb = next) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3238  		struct tcp_skb_cb *scb = TCP_SKB_CB(skb);
737ff314563ca2 Yuchung Cheng           2017-11-08  3239  		const u32 start_seq = scb->seq;
7c46a03e67d11d Ilpo Järvinen           2007-09-20  3240  		u8 sacked = scb->sacked;
740b0f1841f6e3 Eric Dumazet            2014-02-26  3241  		u32 acked_pcount;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3242  
2072c228c9a05c Gavin McCullagh         2007-12-29  3243  		/* Determine how many packets and what bytes were acked, tso and else */
^1da177e4c3f41 Linus Torvalds          2005-04-16  3244  		if (after(scb->end_seq, tp->snd_una)) {
13fcf850cc2037 Ilpo Järvinen           2007-10-09  3245  			if (tcp_skb_pcount(skb) == 1 ||
13fcf850cc2037 Ilpo Järvinen           2007-10-09  3246  			    !after(tp->snd_una, scb->seq))
^1da177e4c3f41 Linus Torvalds          2005-04-16  3247  				break;
13fcf850cc2037 Ilpo Järvinen           2007-10-09  3248  
7201883599ac8b Ilpo Järvinen           2007-12-30  3249  			acked_pcount = tcp_tso_acked(sk, skb);
7201883599ac8b Ilpo Järvinen           2007-12-30  3250  			if (!acked_pcount)
13fcf850cc2037 Ilpo Järvinen           2007-10-09  3251  				break;
a2a385d627e154 Eric Dumazet            2012-05-16  3252  			fully_acked = false;
13fcf850cc2037 Ilpo Järvinen           2007-10-09  3253  		} else {
7201883599ac8b Ilpo Järvinen           2007-12-30  3254  			acked_pcount = tcp_skb_pcount(skb);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3255  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3256  
ad971f616aa98e Eric Dumazet            2014-10-11  3257  		if (unlikely(sacked & TCPCB_RETRANS)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3258  			if (sacked & TCPCB_SACKED_RETRANS)
7201883599ac8b Ilpo Järvinen           2007-12-30  3259  				tp->retrans_out -= acked_pcount;
7c46a03e67d11d Ilpo Järvinen           2007-09-20  3260  			flag |= FLAG_RETRANS_DATA_ACKED;
3d0d26c7976bf1 Kenneth Klette Jonassen 2015-04-11  3261  		} else if (!(sacked & TCPCB_SACKED_ACKED)) {
2fd66ffba50716 Eric Dumazet            2018-09-21  3262  			last_ackt = tcp_skb_timestamp_us(skb);
9a568de4818dea Eric Dumazet            2017-05-16  3263  			WARN_ON_ONCE(last_ackt == 0);
9a568de4818dea Eric Dumazet            2017-05-16  3264  			if (!first_ackt)
740b0f1841f6e3 Eric Dumazet            2014-02-26  3265  				first_ackt = last_ackt;
740b0f1841f6e3 Eric Dumazet            2014-02-26  3266  
737ff314563ca2 Yuchung Cheng           2017-11-08  3267  			if (before(start_seq, reord))
737ff314563ca2 Yuchung Cheng           2017-11-08  3268  				reord = start_seq;
e33099f96d99c3 Yuchung Cheng           2013-03-20  3269  			if (!after(scb->end_seq, tp->high_seq))
e33099f96d99c3 Yuchung Cheng           2013-03-20  3270  				flag |= FLAG_ORIG_SACK_ACKED;
c7caf8d3ed7a66 Ilpo J�rvinen           2007-11-10  3271  		}
7c46a03e67d11d Ilpo Järvinen           2007-09-20  3272  
ddf1af6fa00e77 Yuchung Cheng           2016-02-02  3273  		if (sacked & TCPCB_SACKED_ACKED) {
7201883599ac8b Ilpo Järvinen           2007-12-30  3274  			tp->sacked_out -= acked_pcount;
ddf1af6fa00e77 Yuchung Cheng           2016-02-02  3275  		} else if (tcp_is_sack(tp)) {
082d4fa980b07b Yousuk Seung            2020-06-26  3276  			tcp_count_delivered(tp, acked_pcount, ece_ack);
ddf1af6fa00e77 Yuchung Cheng           2016-02-02  3277  			if (!tcp_skb_spurious_retrans(tp, skb))
1d0833df594390 Yuchung Cheng           2017-01-12  3278  				tcp_rack_advance(tp, sacked, scb->end_seq,
2fd66ffba50716 Eric Dumazet            2018-09-21  3279  						 tcp_skb_timestamp_us(skb));
ddf1af6fa00e77 Yuchung Cheng           2016-02-02  3280  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3281  		if (sacked & TCPCB_LOST)
7201883599ac8b Ilpo Järvinen           2007-12-30  3282  			tp->lost_out -= acked_pcount;
7c46a03e67d11d Ilpo Järvinen           2007-09-20  3283  
7201883599ac8b Ilpo Järvinen           2007-12-30  3284  		tp->packets_out -= acked_pcount;
7201883599ac8b Ilpo Järvinen           2007-12-30  3285  		pkts_acked += acked_pcount;
b9f64820fb226a Yuchung Cheng           2016-09-19  3286  		tcp_rate_skb_delivered(sk, skb, sack->rate);
13fcf850cc2037 Ilpo Järvinen           2007-10-09  3287  
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3288  		/* Initial outgoing SYN's get put onto the write_queue
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3289  		 * just like anything else we transmit.  It is not
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3290  		 * true data, and if we misinform our callers that
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3291  		 * this ACK acks real data, we will erroneously exit
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3292  		 * connection startup slow start one packet too
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3293  		 * quickly.  This is severely frowned upon behavior.
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3294  		 */
ad971f616aa98e Eric Dumazet            2014-10-11  3295  		if (likely(!(scb->tcp_flags & TCPHDR_SYN))) {
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3296  			flag |= FLAG_DATA_ACKED;
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3297  		} else {
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3298  			flag |= FLAG_SYN_ACKED;
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3299  			tp->retrans_stamp = 0;
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3300  		}
009a2e3e4ec395 Ilpo Järvinen           2007-09-20  3301  
13fcf850cc2037 Ilpo Järvinen           2007-10-09  3302  		if (!fully_acked)
13fcf850cc2037 Ilpo Järvinen           2007-10-09  3303  			break;
13fcf850cc2037 Ilpo Järvinen           2007-10-09  3304  
e7ed11ee945438 Yousuk Seung            2021-01-20  3305  		tcp_ack_tstamp(sk, skb, ack_skb, prior_snd_una);
fdb7eb21ddd3cc Yousuk Seung            2020-06-26  3306  
75c119afe14f74 Eric Dumazet            2017-10-05  3307  		next = skb_rb_next(skb);
ad971f616aa98e Eric Dumazet            2014-10-11  3308  		if (unlikely(skb == tp->retransmit_skb_hint))
ef9da47c7cc64d Ilpo Järvinen           2008-09-20  3309  			tp->retransmit_skb_hint = NULL;
2bec445f9bf35e Eric Dumazet            2020-01-22  3310  		tcp_highest_sack_replace(sk, skb, next);
75c119afe14f74 Eric Dumazet            2017-10-05  3311  		tcp_rtx_queue_unlink_and_free(skb, sk);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3312  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3313  
0f87230d1a6c25 Francis Yan             2016-11-27  3314  	if (!skb)
0f87230d1a6c25 Francis Yan             2016-11-27  3315  		tcp_chrono_stop(sk, TCP_CHRONO_BUSY);
0f87230d1a6c25 Francis Yan             2016-11-27  3316  
33f5f57eeb0c63 Ilpo Järvinen           2008-10-07  3317  	if (likely(between(tp->snd_up, prior_snd_una, tp->snd_una)))
33f5f57eeb0c63 Ilpo Järvinen           2008-10-07  3318  		tp->snd_up = tp->snd_una;
33f5f57eeb0c63 Ilpo Järvinen           2008-10-07  3319  
ff91e9292fc5aa Yousuk Seung            2020-06-30  3320  	if (skb) {
e7ed11ee945438 Yousuk Seung            2021-01-20  3321  		tcp_ack_tstamp(sk, skb, ack_skb, prior_snd_una);
ff91e9292fc5aa Yousuk Seung            2020-06-30  3322  		if (TCP_SKB_CB(skb)->sacked & TCPCB_SACKED_ACKED)
cadbd0313bc897 Ilpo Järvinen           2007-12-31  3323  			flag |= FLAG_SACK_RENEGING;
ff91e9292fc5aa Yousuk Seung            2020-06-30  3324  	}
cadbd0313bc897 Ilpo Järvinen           2007-12-31  3325  
9a568de4818dea Eric Dumazet            2017-05-16  3326  	if (likely(first_ackt) && !(flag & FLAG_RETRANS_DATA_ACKED)) {
9a568de4818dea Eric Dumazet            2017-05-16  3327  		seq_rtt_us = tcp_stamp_us_delta(tp->tcp_mstamp, first_ackt);
9a568de4818dea Eric Dumazet            2017-05-16  3328  		ca_rtt_us = tcp_stamp_us_delta(tp->tcp_mstamp, last_ackt);
eb36be0fd55e0a Yuchung Cheng           2018-01-17  3329  
40bc6063796ec7 Yuchung Cheng           2021-09-23  3330  		if (pkts_acked == 1 && fully_acked && !prior_sacked &&
40bc6063796ec7 Yuchung Cheng           2021-09-23  3331  		    (tp->snd_una - prior_snd_una) < tp->mss_cache &&
eb36be0fd55e0a Yuchung Cheng           2018-01-17  3332  		    sack->rate->prior_delivered + 1 == tp->delivered &&
eb36be0fd55e0a Yuchung Cheng           2018-01-17  3333  		    !(flag & (FLAG_CA_ALERT | FLAG_SYN_ACKED))) {
eb36be0fd55e0a Yuchung Cheng           2018-01-17  3334  			/* Conservatively mark a delayed ACK. It's typically
eb36be0fd55e0a Yuchung Cheng           2018-01-17  3335  			 * from a lone runt packet over the round trip to
eb36be0fd55e0a Yuchung Cheng           2018-01-17  3336  			 * a receiver w/o out-of-order or CE events.
eb36be0fd55e0a Yuchung Cheng           2018-01-17  3337  			 */
eb36be0fd55e0a Yuchung Cheng           2018-01-17  3338  			flag |= FLAG_ACK_MAYBE_DELAYED;
eb36be0fd55e0a Yuchung Cheng           2018-01-17  3339  		}
31231a8a873026 Kenneth Klette Jonassen 2015-05-01  3340  	}
9a568de4818dea Eric Dumazet            2017-05-16  3341  	if (sack->first_sackt) {
9a568de4818dea Eric Dumazet            2017-05-16  3342  		sack_rtt_us = tcp_stamp_us_delta(tp->tcp_mstamp, sack->first_sackt);
9a568de4818dea Eric Dumazet            2017-05-16  3343  		ca_rtt_us = tcp_stamp_us_delta(tp->tcp_mstamp, sack->last_sackt);
740b0f1841f6e3 Eric Dumazet            2014-02-26  3344  	}
f672258391b42a Yuchung Cheng           2015-10-16  3345  	rtt_update = tcp_ack_update_rtt(sk, flag, seq_rtt_us, sack_rtt_us,
775e68a93fe4d3 Yuchung Cheng           2017-05-31  3346  					ca_rtt_us, sack->rate);
ed08495c31bb99 Yuchung Cheng           2013-07-22  3347  
7c46a03e67d11d Ilpo Järvinen           2007-09-20  3348  	if (flag & FLAG_ACKED) {
df92c8394e6ea0 Neal Cardwell           2017-08-03  3349  		flag |= FLAG_SET_XMIT_TIMER;  /* set TLP or RTO timer */
72211e90501f95 Ilpo Järvinen           2009-03-14  3350  		if (unlikely(icsk->icsk_mtup.probe_size &&
72211e90501f95 Ilpo Järvinen           2009-03-14  3351  			     !after(tp->mtu_probe.probe_seq_end, tp->snd_una))) {
72211e90501f95 Ilpo Järvinen           2009-03-14  3352  			tcp_mtup_probe_success(sk);
72211e90501f95 Ilpo Järvinen           2009-03-14  3353  		}
72211e90501f95 Ilpo Järvinen           2009-03-14  3354  
c7caf8d3ed7a66 Ilpo J�rvinen           2007-11-10  3355  		if (tcp_is_reno(tp)) {
c634e34f6ebfb7 Yousuk Seung            2020-06-26  3356  			tcp_remove_reno_sacks(sk, pkts_acked, ece_ack);
1236f22fbae15d Ilpo Järvinen           2018-06-29  3357  
1236f22fbae15d Ilpo Järvinen           2018-06-29  3358  			/* If any of the cumulatively ACKed segments was
1236f22fbae15d Ilpo Järvinen           2018-06-29  3359  			 * retransmitted, non-SACK case cannot confirm that
1236f22fbae15d Ilpo Järvinen           2018-06-29  3360  			 * progress was due to original transmission due to
1236f22fbae15d Ilpo Järvinen           2018-06-29  3361  			 * lack of TCPCB_SACKED_ACKED bits even if some of
1236f22fbae15d Ilpo Järvinen           2018-06-29  3362  			 * the packets may have been never retransmitted.
1236f22fbae15d Ilpo Järvinen           2018-06-29  3363  			 */
1236f22fbae15d Ilpo Järvinen           2018-06-29  3364  			if (flag & FLAG_RETRANS_DATA_ACKED)
1236f22fbae15d Ilpo Järvinen           2018-06-29  3365  				flag &= ~FLAG_ORIG_SACK_ACKED;
c7caf8d3ed7a66 Ilpo J�rvinen           2007-11-10  3366  		} else {
59a08cba6a604a Ilpo Järvinen           2009-02-28 @3367  			int delta;
59a08cba6a604a Ilpo Järvinen           2009-02-28  3368  
c7caf8d3ed7a66 Ilpo J�rvinen           2007-11-10  3369  			/* Non-retransmitted hole got filled? That's reordering */
737ff314563ca2 Yuchung Cheng           2017-11-08  3370  			if (before(reord, prior_fack))
737ff314563ca2 Yuchung Cheng           2017-11-08  3371  				tcp_check_sack_reordering(sk, reord, 0);
90638a04ad8484 Ilpo Järvinen           2008-09-20  3372  
713bafea929201 Yuchung Cheng           2017-11-08  3373  			delta = prior_sacked - tp->sacked_out;
c7caf8d3ed7a66 Ilpo J�rvinen           2007-11-10  3374  		}
740b0f1841f6e3 Eric Dumazet            2014-02-26  3375  	} else if (skb && rtt_update && sack_rtt_us >= 0 &&
2fd66ffba50716 Eric Dumazet            2018-09-21  3376  		   sack_rtt_us > tcp_stamp_us_delta(tp->tcp_mstamp,
2fd66ffba50716 Eric Dumazet            2018-09-21  3377  						    tcp_skb_timestamp_us(skb))) {
2f715c1dde6e17 Yuchung Cheng           2013-10-24  3378  		/* Do not re-arm RTO if the sack RTT is measured from data sent
2f715c1dde6e17 Yuchung Cheng           2013-10-24  3379  		 * after when the head was last (re)transmitted. Otherwise the
2f715c1dde6e17 Yuchung Cheng           2013-10-24  3380  		 * timeout may continue to extend in loss recovery.
2f715c1dde6e17 Yuchung Cheng           2013-10-24  3381  		 */
df92c8394e6ea0 Neal Cardwell           2017-08-03  3382  		flag |= FLAG_SET_XMIT_TIMER;  /* set TLP or RTO timer */
^1da177e4c3f41 Linus Torvalds          2005-04-16  3383  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3384  
756ee1729b2feb Lawrence Brakmo         2016-05-11  3385  	if (icsk->icsk_ca_ops->pkts_acked) {
756ee1729b2feb Lawrence Brakmo         2016-05-11  3386  		struct ack_sample sample = { .pkts_acked = pkts_acked,
40bc6063796ec7 Yuchung Cheng           2021-09-23  3387  					     .rtt_us = sack->rate->rtt_us };
756ee1729b2feb Lawrence Brakmo         2016-05-11  3388  
40bc6063796ec7 Yuchung Cheng           2021-09-23  3389  		sample.in_flight = tp->mss_cache *
40bc6063796ec7 Yuchung Cheng           2021-09-23  3390  			(tp->delivered - sack->rate->prior_delivered);
756ee1729b2feb Lawrence Brakmo         2016-05-11  3391  		icsk->icsk_ca_ops->pkts_acked(sk, &sample);
756ee1729b2feb Lawrence Brakmo         2016-05-11  3392  	}
138998fdd12e73 Kenneth Klette Jonassen 2015-05-01  3393  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
