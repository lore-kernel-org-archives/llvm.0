Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607C61ADC86;
	Sat,  1 Mar 2025 23:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740871421; cv=none; b=dNdoKwOmhptOF78gV7HGj+LeXwceGkpTiCUhVz3GmdP44TzrUzHh8mwgGY6fHXgrPic1hOL36xYdq2iO/EaVZ6F+uMnSOcpr3FpiY5+Oq9/OyaGSiFsgC4lJKXRzbuxLBtKJgox1hn4GgippyB2Cc+NwbU6GnTr34euWvIt7A0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740871421; c=relaxed/simple;
	bh=UyQgb+vzNU+0SZNfCmTAUHgtsZQ2K1rcC30RYOtUNKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRN/tarEZ5BwCwJY8297r786lURRBhZ7fJ567a6hSNh7ERdiiFCbdCtq1K6/c7JVH7GhjNyoc5r1aes9TiEnjSxsGrm95Zj7MPEYU/euvR/0yl+NDoeRtWNiewaK7BXiYtl+dTS134gNDsv7M6a+tBvTkWmm+gF44+6OtkfriT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kK/Et4Ss; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kK/Et4Ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740871419; x=1772407419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UyQgb+vzNU+0SZNfCmTAUHgtsZQ2K1rcC30RYOtUNKU=;
  b=kK/Et4Ss767wO7PFEsBmsgaKOgTEveklJY/hIUlbddNxW0nF0OfNfbPX
   Cina1jHOMg2HgZSAv5Bocgde/XPh2h1bPrw5oFEqCpsGoqE8Iu5K5CpHp
   LpLTKTfpjtCJO2p2AEjIT5SCc+UIDuYdxjA/9qF3py2XCxTYQCizsfSP9
   fbKjKr96JQllvEEjQ1U2piR1AP/mrvtowRlq59w+4aLKMKsbDFYKEBl+S
   3zyiYRwhVbr+GEItgF+/3FiDI7fI5xZT97N+nr4y0+bjmW60VhonJyMtG
   o4Am7dwJnZ7fOeh/Qeqp3AK1mVfB+vGyoPe9q3Jg8l5garMsVoTMgRpJm
   g==;
X-CSE-ConnectionGUID: PKLiULlaRNG3kprn7OrhYA==
X-CSE-MsgGUID: R/yAbicuShSwz1r2L2BlRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59318489"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="59318489"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 15:23:37 -0800
X-CSE-ConnectionGUID: OeXhvlmlTjyfZuukmC1FKA==
X-CSE-MsgGUID: vAyTAKFUTSirOg0xc41NMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118186861"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Mar 2025 15:23:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toWBB-000GpS-1i;
	Sat, 01 Mar 2025 23:23:33 +0000
Date: Sun, 2 Mar 2025 07:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: allison.henderson@oracle.com, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/6] net/rds: rds_tcp_accept_one ought to not discard
 messages
Message-ID: <202503020739.xWWyG7zO-lkp@intel.com>
References: <20250227042638.82553-6-allison.henderson@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227042638.82553-6-allison.henderson@oracle.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/allison-henderson-oracle-com/net-rds-Avoid-queuing-superfluous-send-and-recv-work/20250227-123038
base:   net/main
patch link:    https://lore.kernel.org/r/20250227042638.82553-6-allison.henderson%40oracle.com
patch subject: [PATCH 5/6] net/rds: rds_tcp_accept_one ought to not discard messages
config: riscv-randconfig-002-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020739.xWWyG7zO-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020739.xWWyG7zO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020739.xWWyG7zO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/rds/tcp_listen.c:137:6: warning: variable 'inet' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (!new_sock) {
               ^~~~~~~~~
   net/rds/tcp_listen.c:179:19: note: uninitialized use occurs here
                    my_addr, ntohs(inet->inet_sport),
                                   ^~~~
   include/linux/byteorder/generic.h:142:27: note: expanded from macro 'ntohs'
   #define ntohs(x) ___ntohs(x)
                             ^
   include/linux/byteorder/generic.h:137:35: note: expanded from macro '___ntohs'
   #define ___ntohs(x) __be16_to_cpu(x)
                                     ^
   include/uapi/linux/byteorder/little_endian.h:43:59: note: expanded from macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                                                             ^
   include/uapi/linux/swab.h:105:31: note: expanded from macro '__swab16'
           (__u16)(__builtin_constant_p(x) ?       \
                                        ^
   net/rds/tcp_listen.c:137:2: note: remove the 'if' if its condition is always true
           if (!new_sock) {
           ^~~~~~~~~~~~~~~
   net/rds/tcp_listen.c:115:24: note: initialize the variable 'inet' to silence this warning
           struct inet_sock *inet;
                                 ^
                                  = NULL
   1 warning generated.


vim +137 net/rds/tcp_listen.c

   108	
   109	int rds_tcp_accept_one(struct rds_tcp_net *rtn)
   110	{
   111		struct socket *listen_sock = rtn->rds_tcp_listen_sock;
   112		struct socket *new_sock = NULL;
   113		struct rds_connection *conn;
   114		int ret;
   115		struct inet_sock *inet;
   116		struct rds_tcp_connection *rs_tcp = NULL;
   117		int conn_state;
   118		struct rds_conn_path *cp;
   119		struct in6_addr *my_addr, *peer_addr;
   120		struct proto_accept_arg arg = {
   121			.flags = O_NONBLOCK,
   122			.kern = true,
   123		};
   124	#if !IS_ENABLED(CONFIG_IPV6)
   125		struct in6_addr saddr, daddr;
   126	#endif
   127		int dev_if = 0;
   128	
   129		mutex_lock(&rtn->rds_tcp_accept_lock);
   130	
   131		if (!listen_sock)
   132			return -ENETUNREACH;
   133	
   134		new_sock = rtn->rds_tcp_accepted_sock;
   135		rtn->rds_tcp_accepted_sock = NULL;
   136	
 > 137		if (!new_sock) {
   138			ret = sock_create_lite(listen_sock->sk->sk_family,
   139					       listen_sock->sk->sk_type,
   140					       listen_sock->sk->sk_protocol,
   141					       &new_sock);
   142			if (ret)
   143				goto out;
   144	
   145			ret = listen_sock->ops->accept(listen_sock, new_sock, &arg);
   146			if (ret < 0)
   147				goto out;
   148	
   149			/* sock_create_lite() does not get a hold on the owner module so we
   150			 * need to do it here.  Note that sock_release() uses sock->ops to
   151			 * determine if it needs to decrement the reference count.  So set
   152			 * sock->ops after calling accept() in case that fails.  And there's
   153			 * no need to do try_module_get() as the listener should have a hold
   154			 * already.
   155			 */
   156			new_sock->ops = listen_sock->ops;
   157			__module_get(new_sock->ops->owner);
   158	
   159			rds_tcp_keepalive(new_sock);
   160			if (!rds_tcp_tune(new_sock)) {
   161				ret = -EINVAL;
   162				goto out;
   163			}
   164	
   165			inet = inet_sk(new_sock->sk);
   166		}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
