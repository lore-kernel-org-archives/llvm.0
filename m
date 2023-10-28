Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22C733C7;
	Sat, 28 Oct 2023 18:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcHi8mlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698518976; x=1730054976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=m46Mh0W1QqZHobwanJH5PDd2YTXuLYXd/tPc4iHEWGk=;
  b=UcHi8mlkYbWt5EGiM9SwpOrVLkAuNZLs468RNxyhpfV+B0FJfHZhgyp2
   8pSdUAGGmbjUDz5CshJrbMFyjVn5HQw7IcNd0WgaQFLDV4lgIXw1o3qsy
   ME73JvSpq1QdUxeivTe04C8iDIbJPWheIoU1UV0KtSuaqUrWFyBPabPsl
   n/+3mPj5dzbGgqXEkhHwDwFtUuId5CP3brTaf8Fua1hJB9CHil9Fj1C/e
   aRWoGXyqMu7lK2Ndi4mbfuaalHacmd9w0aFclWTUSDgRXfOyxp3o4gbT3
   7S2Y5TLgUOGpFdHUPSGCR/txd20Owhcl6bXFYb/cnSv04X07ThE7TOGcK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452161927"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="452161927"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 11:49:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="830312764"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="830312764"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2023 11:49:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwoNI-000Bzr-0y;
	Sat, 28 Oct 2023 18:49:32 +0000
Date: Sun, 29 Oct 2023 02:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Safonov <dima@arista.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v16 net-next 06/23] net/tcp: Add TCP-AO sign to outgoing
 packets
Message-ID: <202310290242.xsacizDz-lkp@intel.com>
References: <20231023192217.426455-7-dima@arista.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231023192217.426455-7-dima@arista.com>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d6e48462e88fe7efc78b455ecde5b0ca43ec50b7]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/net-tcp-Prepare-tcp_md5sig_pool-for-TCP-AO/20231024-034429
base:   d6e48462e88fe7efc78b455ecde5b0ca43ec50b7
patch link:    https://lore.kernel.org/r/20231023192217.426455-7-dima%40arista.com
patch subject: [PATCH v16 net-next 06/23] net/tcp: Add TCP-AO sign to outgoing packets
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231029/202310290242.xsacizDz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290242.xsacizDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290242.xsacizDz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_output.c:654:2: warning: label at end of compound statement is a C2x extension [-Wc2x-extensions]
     654 |         }
         |         ^
   1 warning generated.


vim +654 net/ipv4/tcp_output.c

331fca4315efa3 Martin KaFai Lau      2020-08-20  603  
67edfef7863957 Andi Kleen            2009-07-21  604  /* Write previously computed TCP options to the packet.
67edfef7863957 Andi Kleen            2009-07-21  605   *
67edfef7863957 Andi Kleen            2009-07-21  606   * Beware: Something in the Internet is very sensitive to the ordering of
fd6149d332973b Ilpo Järvinen         2008-10-23  607   * TCP options, we learned this through the hard way, so be careful here.
fd6149d332973b Ilpo Järvinen         2008-10-23  608   * Luckily we can at least blame others for their non-compliance but from
8e3bff96afa673 stephen hemminger     2013-12-08  609   * inter-operability perspective it seems that we're somewhat stuck with
fd6149d332973b Ilpo Järvinen         2008-10-23  610   * the ordering which we have been using if we want to keep working with
fd6149d332973b Ilpo Järvinen         2008-10-23  611   * those broken things (not that it currently hurts anybody as there isn't
fd6149d332973b Ilpo Järvinen         2008-10-23  612   * particular reason why the ordering would need to be changed).
fd6149d332973b Ilpo Järvinen         2008-10-23  613   *
fd6149d332973b Ilpo Järvinen         2008-10-23  614   * At least SACK_PERM as the first option is known to lead to a disaster
fd6149d332973b Ilpo Järvinen         2008-10-23  615   * (but it may well be that other scenarios fail similarly).
fd6149d332973b Ilpo Järvinen         2008-10-23  616   */
ea66758c1795ce Paolo Abeni           2022-05-04  617  static void tcp_options_write(struct tcphdr *th, struct tcp_sock *tp,
c4058c531ca477 Dmitry Safonov        2023-10-23  618  			      struct tcp_out_options *opts,
c4058c531ca477 Dmitry Safonov        2023-10-23  619  			      struct tcp_key *key)
bd0388ae770750 William Allen Simpson 2009-12-02  620  {
ea66758c1795ce Paolo Abeni           2022-05-04  621  	__be32 *ptr = (__be32 *)(th + 1);
2100c8d2d9db23 Yuchung Cheng         2012-07-19  622  	u16 options = opts->options;	/* mungable copy */
bd0388ae770750 William Allen Simpson 2009-12-02  623  
c4058c531ca477 Dmitry Safonov        2023-10-23  624  	if (tcp_key_is_md5(key)) {
1a2c6181c4a192 Christoph Paasch      2013-03-17  625  		*ptr++ = htonl((TCPOPT_NOP << 24) | (TCPOPT_NOP << 16) |
1a2c6181c4a192 Christoph Paasch      2013-03-17  626  			       (TCPOPT_MD5SIG << 8) | TCPOLEN_MD5SIG);
bd0388ae770750 William Allen Simpson 2009-12-02  627  		/* overload cookie hash location */
bd0388ae770750 William Allen Simpson 2009-12-02  628  		opts->hash_location = (__u8 *)ptr;
33ad798c924b4a Adam Langley          2008-07-19  629  		ptr += 4;
c4058c531ca477 Dmitry Safonov        2023-10-23  630  	} else if (tcp_key_is_ao(key)) {
c4058c531ca477 Dmitry Safonov        2023-10-23  631  #ifdef CONFIG_TCP_AO
c4058c531ca477 Dmitry Safonov        2023-10-23  632  		struct tcp_ao_key *rnext_key;
c4058c531ca477 Dmitry Safonov        2023-10-23  633  		struct tcp_ao_info *ao_info;
c4058c531ca477 Dmitry Safonov        2023-10-23  634  		u8 maclen;
c4058c531ca477 Dmitry Safonov        2023-10-23  635  
c4058c531ca477 Dmitry Safonov        2023-10-23  636  		ao_info = rcu_dereference_check(tp->ao_info,
c4058c531ca477 Dmitry Safonov        2023-10-23  637  				lockdep_sock_is_held(&tp->inet_conn.icsk_inet.sk));
c4058c531ca477 Dmitry Safonov        2023-10-23  638  		rnext_key = READ_ONCE(ao_info->rnext_key);
c4058c531ca477 Dmitry Safonov        2023-10-23  639  		if (WARN_ON_ONCE(!rnext_key))
c4058c531ca477 Dmitry Safonov        2023-10-23  640  			goto out_ao;
c4058c531ca477 Dmitry Safonov        2023-10-23  641  		maclen = tcp_ao_maclen(key->ao_key);
c4058c531ca477 Dmitry Safonov        2023-10-23  642  		*ptr++ = htonl((TCPOPT_AO << 24) |
c4058c531ca477 Dmitry Safonov        2023-10-23  643  				(tcp_ao_len(key->ao_key) << 16) |
c4058c531ca477 Dmitry Safonov        2023-10-23  644  				(key->ao_key->sndid << 8) |
c4058c531ca477 Dmitry Safonov        2023-10-23  645  				(rnext_key->rcvid));
c4058c531ca477 Dmitry Safonov        2023-10-23  646  		opts->hash_location = (__u8 *)ptr;
c4058c531ca477 Dmitry Safonov        2023-10-23  647  		ptr += maclen / sizeof(*ptr);
c4058c531ca477 Dmitry Safonov        2023-10-23  648  		if (unlikely(maclen % sizeof(*ptr))) {
c4058c531ca477 Dmitry Safonov        2023-10-23  649  			memset(ptr, TCPOPT_NOP, sizeof(*ptr));
c4058c531ca477 Dmitry Safonov        2023-10-23  650  			ptr++;
c4058c531ca477 Dmitry Safonov        2023-10-23  651  		}
c4058c531ca477 Dmitry Safonov        2023-10-23  652  out_ao:
c4058c531ca477 Dmitry Safonov        2023-10-23  653  #endif
33ad798c924b4a Adam Langley          2008-07-19 @654  	}
fd6149d332973b Ilpo Järvinen         2008-10-23  655  	if (unlikely(opts->mss)) {
fd6149d332973b Ilpo Järvinen         2008-10-23  656  		*ptr++ = htonl((TCPOPT_MSS << 24) |
fd6149d332973b Ilpo Järvinen         2008-10-23  657  			       (TCPOLEN_MSS << 16) |
fd6149d332973b Ilpo Järvinen         2008-10-23  658  			       opts->mss);
fd6149d332973b Ilpo Järvinen         2008-10-23  659  	}
fd6149d332973b Ilpo Järvinen         2008-10-23  660  
bd0388ae770750 William Allen Simpson 2009-12-02  661  	if (likely(OPTION_TS & options)) {
bd0388ae770750 William Allen Simpson 2009-12-02  662  		if (unlikely(OPTION_SACK_ADVERTISE & options)) {
33ad798c924b4a Adam Langley          2008-07-19  663  			*ptr++ = htonl((TCPOPT_SACK_PERM << 24) |
33ad798c924b4a Adam Langley          2008-07-19  664  				       (TCPOLEN_SACK_PERM << 16) |
33ad798c924b4a Adam Langley          2008-07-19  665  				       (TCPOPT_TIMESTAMP << 8) |
33ad798c924b4a Adam Langley          2008-07-19  666  				       TCPOLEN_TIMESTAMP);
bd0388ae770750 William Allen Simpson 2009-12-02  667  			options &= ~OPTION_SACK_ADVERTISE;
33ad798c924b4a Adam Langley          2008-07-19  668  		} else {
496c98dff8e353 YOSHIFUJI Hideaki     2006-10-10  669  			*ptr++ = htonl((TCPOPT_NOP << 24) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  670  				       (TCPOPT_NOP << 16) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  671  				       (TCPOPT_TIMESTAMP << 8) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  672  				       TCPOLEN_TIMESTAMP);
40efc6fa179f44 Stephen Hemminger     2006-01-03  673  		}
33ad798c924b4a Adam Langley          2008-07-19  674  		*ptr++ = htonl(opts->tsval);
33ad798c924b4a Adam Langley          2008-07-19  675  		*ptr++ = htonl(opts->tsecr);
33ad798c924b4a Adam Langley          2008-07-19  676  	}
33ad798c924b4a Adam Langley          2008-07-19  677  
bd0388ae770750 William Allen Simpson 2009-12-02  678  	if (unlikely(OPTION_SACK_ADVERTISE & options)) {
33ad798c924b4a Adam Langley          2008-07-19  679  		*ptr++ = htonl((TCPOPT_NOP << 24) |
33ad798c924b4a Adam Langley          2008-07-19  680  			       (TCPOPT_NOP << 16) |
33ad798c924b4a Adam Langley          2008-07-19  681  			       (TCPOPT_SACK_PERM << 8) |
33ad798c924b4a Adam Langley          2008-07-19  682  			       TCPOLEN_SACK_PERM);
33ad798c924b4a Adam Langley          2008-07-19  683  	}
33ad798c924b4a Adam Langley          2008-07-19  684  
bd0388ae770750 William Allen Simpson 2009-12-02  685  	if (unlikely(OPTION_WSCALE & options)) {
33ad798c924b4a Adam Langley          2008-07-19  686  		*ptr++ = htonl((TCPOPT_NOP << 24) |
33ad798c924b4a Adam Langley          2008-07-19  687  			       (TCPOPT_WINDOW << 16) |
33ad798c924b4a Adam Langley          2008-07-19  688  			       (TCPOLEN_WINDOW << 8) |
33ad798c924b4a Adam Langley          2008-07-19  689  			       opts->ws);
33ad798c924b4a Adam Langley          2008-07-19  690  	}
33ad798c924b4a Adam Langley          2008-07-19  691  
33ad798c924b4a Adam Langley          2008-07-19  692  	if (unlikely(opts->num_sack_blocks)) {
33ad798c924b4a Adam Langley          2008-07-19  693  		struct tcp_sack_block *sp = tp->rx_opt.dsack ?
33ad798c924b4a Adam Langley          2008-07-19  694  			tp->duplicate_sack : tp->selective_acks;
40efc6fa179f44 Stephen Hemminger     2006-01-03  695  		int this_sack;
40efc6fa179f44 Stephen Hemminger     2006-01-03  696  
40efc6fa179f44 Stephen Hemminger     2006-01-03  697  		*ptr++ = htonl((TCPOPT_NOP  << 24) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  698  			       (TCPOPT_NOP  << 16) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  699  			       (TCPOPT_SACK <<  8) |
33ad798c924b4a Adam Langley          2008-07-19  700  			       (TCPOLEN_SACK_BASE + (opts->num_sack_blocks *
40efc6fa179f44 Stephen Hemminger     2006-01-03  701  						     TCPOLEN_SACK_PERBLOCK)));
2de979bd7da9c8 Stephen Hemminger     2007-03-08  702  
33ad798c924b4a Adam Langley          2008-07-19  703  		for (this_sack = 0; this_sack < opts->num_sack_blocks;
33ad798c924b4a Adam Langley          2008-07-19  704  		     ++this_sack) {
40efc6fa179f44 Stephen Hemminger     2006-01-03  705  			*ptr++ = htonl(sp[this_sack].start_seq);
40efc6fa179f44 Stephen Hemminger     2006-01-03  706  			*ptr++ = htonl(sp[this_sack].end_seq);
40efc6fa179f44 Stephen Hemminger     2006-01-03  707  		}
2de979bd7da9c8 Stephen Hemminger     2007-03-08  708  
40efc6fa179f44 Stephen Hemminger     2006-01-03  709  		tp->rx_opt.dsack = 0;
40efc6fa179f44 Stephen Hemminger     2006-01-03  710  	}
2100c8d2d9db23 Yuchung Cheng         2012-07-19  711  
2100c8d2d9db23 Yuchung Cheng         2012-07-19  712  	if (unlikely(OPTION_FAST_OPEN_COOKIE & options)) {
2100c8d2d9db23 Yuchung Cheng         2012-07-19  713  		struct tcp_fastopen_cookie *foc = opts->fastopen_cookie;
7f9b838b71eb78 Daniel Lee            2015-04-06  714  		u8 *p = (u8 *)ptr;
7f9b838b71eb78 Daniel Lee            2015-04-06  715  		u32 len; /* Fast Open option length */
2100c8d2d9db23 Yuchung Cheng         2012-07-19  716  
7f9b838b71eb78 Daniel Lee            2015-04-06  717  		if (foc->exp) {
7f9b838b71eb78 Daniel Lee            2015-04-06  718  			len = TCPOLEN_EXP_FASTOPEN_BASE + foc->len;
7f9b838b71eb78 Daniel Lee            2015-04-06  719  			*ptr = htonl((TCPOPT_EXP << 24) | (len << 16) |
2100c8d2d9db23 Yuchung Cheng         2012-07-19  720  				     TCPOPT_FASTOPEN_MAGIC);
7f9b838b71eb78 Daniel Lee            2015-04-06  721  			p += TCPOLEN_EXP_FASTOPEN_BASE;
7f9b838b71eb78 Daniel Lee            2015-04-06  722  		} else {
7f9b838b71eb78 Daniel Lee            2015-04-06  723  			len = TCPOLEN_FASTOPEN_BASE + foc->len;
7f9b838b71eb78 Daniel Lee            2015-04-06  724  			*p++ = TCPOPT_FASTOPEN;
7f9b838b71eb78 Daniel Lee            2015-04-06  725  			*p++ = len;
7f9b838b71eb78 Daniel Lee            2015-04-06  726  		}
2100c8d2d9db23 Yuchung Cheng         2012-07-19  727  
7f9b838b71eb78 Daniel Lee            2015-04-06  728  		memcpy(p, foc->val, foc->len);
7f9b838b71eb78 Daniel Lee            2015-04-06  729  		if ((len & 3) == 2) {
7f9b838b71eb78 Daniel Lee            2015-04-06  730  			p[foc->len] = TCPOPT_NOP;
7f9b838b71eb78 Daniel Lee            2015-04-06  731  			p[foc->len + 1] = TCPOPT_NOP;
2100c8d2d9db23 Yuchung Cheng         2012-07-19  732  		}
7f9b838b71eb78 Daniel Lee            2015-04-06  733  		ptr += (len + 3) >> 2;
2100c8d2d9db23 Yuchung Cheng         2012-07-19  734  	}
60e2a7780793ba Ursula Braun          2017-10-25  735  
60e2a7780793ba Ursula Braun          2017-10-25  736  	smc_options_write(ptr, &options);
eda7acddf8080b Peter Krystad         2020-01-21  737  
ea66758c1795ce Paolo Abeni           2022-05-04  738  	mptcp_options_write(th, ptr, tp, opts);
60e2a7780793ba Ursula Braun          2017-10-25  739  }
60e2a7780793ba Ursula Braun          2017-10-25  740  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
