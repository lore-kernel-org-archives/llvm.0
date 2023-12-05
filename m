Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862875D8FF;
	Tue,  5 Dec 2023 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NsyI/qPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701780080; x=1733316080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gI7x2ikpkdZ7RpK/7GfN3p+KmRH/Pqha6bn7RpAGAVA=;
  b=NsyI/qPwMHcESQRH1U/PUaigMuAhh96fNlAvrUSexymIHzrM1359nf10
   694twc62APIm5nJiU7R+KP5M0izHGtN46s4XF8rQhQ1fBrDsgAagnfLN/
   BB7ww9MR+fxSmtj29+b781gbjqhK2Nuh6oeBLx35WXw1p86SBjbefgHdk
   Vq9V28eDywas7RjUzzb4E8HG7NensmVk8SGc2IWp1s8/+I1XgdukHs9g0
   ZLDY8UjGErSH34/hLjAe3zCUq1a6YTTGB9fUD4Cv7OOZiwosNexVX9+hI
   spXXna8xpJ2CV9Gwd5mvd91JgTN5TSoX5irNJPRvvF4ueqh8MwjZOoBcC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942063"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942063"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:41:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018209996"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018209996"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 04:41:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAUjb-0008ya-1o;
	Tue, 05 Dec 2023 12:41:09 +0000
Date: Tue, 5 Dec 2023 20:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: YangXin <yx.0xffff@gmail.com>, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ___neigh_lookup_noref(): remove redundant parameters
Message-ID: <202312052000.xiZkoBI4-lkp@intel.com>
References: <20231204185943.68-1-yx.0xffff@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204185943.68-1-yx.0xffff@gmail.com>

Hi YangXin,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.7-rc4 next-20231205]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/YangXin/net-___neigh_lookup_noref-remove-redundant-parameters/20231205-030205
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231204185943.68-1-yx.0xffff%40gmail.com
patch subject: [PATCH] net: ___neigh_lookup_noref(): remove redundant parameters
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231205/202312052000.xiZkoBI4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052000.xiZkoBI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052000.xiZkoBI4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/socket.c:108:
   In file included from include/net/busy_poll.h:18:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:28:
>> include/net/arp.h:27:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&arp_tbl, neigh_key_eq32, &key, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   In file included from net/socket.c:108:
   In file included from include/net/busy_poll.h:18:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:29:
>> include/net/ndisc.h:383:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   In file included from net/socket.c:108:
   In file included from include/net/busy_poll.h:18:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:29:
   include/net/ndisc.h:390:73: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(ipv6_stub->nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                           ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   3 errors generated.
--
   In file included from net/core/neighbour.c:30:
>> include/net/arp.h:27:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&arp_tbl, neigh_key_eq32, &key, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   1 error generated.
--
   In file included from net/ipv4/route.c:86:
   In file included from include/net/dst_metadata.h:6:
   In file included from include/net/ip_tunnels.h:18:
   In file included from include/net/lwtunnel.h:9:
   In file included from include/net/route.h:28:
>> include/net/arp.h:27:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&arp_tbl, neigh_key_eq32, &key, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   In file included from net/ipv4/route.c:86:
   In file included from include/net/dst_metadata.h:6:
   In file included from include/net/ip_tunnels.h:18:
   In file included from include/net/lwtunnel.h:9:
   In file included from include/net/route.h:29:
>> include/net/ndisc.h:383:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   In file included from net/ipv4/route.c:86:
   In file included from include/net/dst_metadata.h:6:
   In file included from include/net/ip_tunnels.h:18:
   In file included from include/net/lwtunnel.h:9:
   In file included from include/net/route.h:29:
   include/net/ndisc.h:390:73: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(ipv6_stub->nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                           ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   net/ipv4/route.c:880:6: warning: variable 'log_martians' set but not used [-Wunused-but-set-variable]
           int log_martians;
               ^
   1 warning and 3 errors generated.
--
   In file included from net/ipv4/igmp.c:91:
>> include/net/arp.h:27:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&arp_tbl, neigh_key_eq32, &key, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   In file included from net/ipv4/igmp.c:92:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:29:
>> include/net/ndisc.h:383:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   In file included from net/ipv4/igmp.c:92:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:29:
   include/net/ndisc.h:390:73: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(ipv6_stub->nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                           ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   net/ipv4/igmp.c:1915:6: warning: variable 'changerec' set but not used [-Wunused-but-set-variable]
           int     changerec = 0;
                   ^
   1 warning and 3 errors generated.
--
   In file included from net/ipv6/anycast.c:37:
>> include/net/ndisc.h:383:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   In file included from net/ipv6/anycast.c:37:
   include/net/ndisc.h:390:73: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(ipv6_stub->nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                           ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   In file included from net/ipv6/anycast.c:39:
   In file included from include/net/ip6_route.h:9:
   In file included from include/net/lwtunnel.h:9:
   In file included from include/net/route.h:28:
>> include/net/arp.h:27:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&arp_tbl, neigh_key_eq32, &key, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   3 errors generated.
--
   In file included from net/ipv6/ip6_fib.c:29:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:28:
>> include/net/arp.h:27:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&arp_tbl, neigh_key_eq32, &key, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   In file included from net/ipv6/ip6_fib.c:29:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:29:
>> include/net/ndisc.h:383:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   In file included from net/ipv6/ip6_fib.c:29:
   In file included from include/net/ip.h:30:
   In file included from include/net/route.h:29:
   include/net/ndisc.h:390:73: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(ipv6_stub->nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                           ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   net/ipv6/ip6_fib.c:1384:25: warning: variable 'pn' set but not used [-Wunused-but-set-variable]
           struct fib6_node *fn, *pn = NULL;
                                  ^
   1 warning and 3 errors generated.
--
   In file included from net/ipv6/sysctl_net_ipv6.c:15:
>> include/net/ndisc.h:383:63: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(&nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                 ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   In file included from net/ipv6/sysctl_net_ipv6.c:15:
   include/net/ndisc.h:390:73: error: too many arguments to function call, expected 3, have 4
           return ___neigh_lookup_noref(ipv6_stub->nd_tbl, neigh_key_eq128, pkey, dev);
                  ~~~~~~~~~~~~~~~~~~~~~                                           ^~~
   include/net/neighbour.h:293:33: note: '___neigh_lookup_noref' declared here
   static inline struct neighbour *___neigh_lookup_noref(
                                   ^
   2 errors generated.


vim +27 include/net/arp.h

    20	
    21	#ifdef CONFIG_INET
    22	static inline struct neighbour *__ipv4_neigh_lookup_noref(struct net_device *dev, u32 key)
    23	{
    24		if (dev->flags & (IFF_LOOPBACK | IFF_POINTOPOINT))
    25			key = INADDR_ANY;
    26	
  > 27		return ___neigh_lookup_noref(&arp_tbl, neigh_key_eq32, &key, dev);
    28	}
    29	#else
    30	static inline
    31	struct neighbour *__ipv4_neigh_lookup_noref(struct net_device *dev, u32 key)
    32	{
    33		return NULL;
    34	}
    35	#endif
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
