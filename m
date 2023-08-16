Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B310957;
	Wed, 16 Aug 2023 15:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692198724; x=1723734724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p+r7n8YCIiGsobeKQXD1BlmAUYuDkI9/aXWSyVZ4wjI=;
  b=b0vKxIdLk2CtNPgfSaqCGo7nytTrC9QrktL7klej0HkSSquTQQu6V6bL
   574hgJFAT6IbGQwmv2yeYu3z2m45Gk3tBFQ+L+9b+NH5QxXgOe5hgE+y/
   Xn4c8KKnFvfRj+DK5d9xIMh7mWXFODHctbY8c7s8Zaa1mpr9u2b5pf8dW
   U+cn9H+cjbQd+hhbjT4JLpe9TDmqiS44mxHVpqHKi6MiCHfsyd6PF8z4r
   WWvb44DKu9GUY+Pw3BPE0OgMUnxcV+FOpIsJ3jLXPFdq/0tASKzv51Oys
   eA38Nl/fEoiB4GIZ/nwHWCUoLH3hcXtv8yWoOJGoszV/dhNG1ym3mMjiO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="438908853"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="438908853"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 08:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="711141407"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="711141407"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Aug 2023 08:12:03 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWIBm-0000OT-0r;
	Wed, 16 Aug 2023 15:12:02 +0000
Date: Wed, 16 Aug 2023 23:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Anastasov <ja@ssi.bg>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 11/14] ipvs: no_cport and dropentry counters
 can be per-net
Message-ID: <202308162222.Kp161L5h-lkp@intel.com>
References: <20230815173031.168344-12-ja@ssi.bg>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815173031.168344-12-ja@ssi.bg>

Hi Julian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Anastasov/rculist_bl-add-hlist_bl_for_each_entry_continue_rcu/20230816-100047
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230815173031.168344-12-ja%40ssi.bg
patch subject: [PATCH RFC net-next 11/14] ipvs: no_cport and dropentry counters can be per-net
config: arm-randconfig-r035-20230816 (https://download.01.org/0day-ci/archive/20230816/202308162222.Kp161L5h-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308162222.Kp161L5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308162222.Kp161L5h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/ipvs/ip_vs_conn.c:1599:14: error: no member named 'dropentry_counters' in 'struct netns_ipvs'
           if (--ipvs->dropentry_counters[i] > 0)
                 ~~~~  ^
   net/netfilter/ipvs/ip_vs_conn.c:1603:8: error: no member named 'dropentry_counters' in 'struct netns_ipvs'
           ipvs->dropentry_counters[i] = i + 1;
           ~~~~  ^
   2 errors generated.


vim +1599 net/netfilter/ipvs/ip_vs_conn.c

  1574	
  1575	
  1576	/* Randomly drop connection entries before running out of memory
  1577	 * Can be used for DATA and CTL conns. For TPL conns there are exceptions:
  1578	 * - traffic for services in OPS mode increases ct->in_pkts, so it is supported
  1579	 * - traffic for services not in OPS mode does not increase ct->in_pkts in
  1580	 * all cases, so it is not supported
  1581	 */
  1582	static inline int todrop_entry(struct ip_vs_conn *cp)
  1583	{
  1584		struct netns_ipvs *ipvs = cp->ipvs;
  1585		int i;
  1586	
  1587		/* if the conn entry hasn't lasted for 60 seconds, don't drop it.
  1588		   This will leave enough time for normal connection to get
  1589		   through. */
  1590		if (time_before(cp->timeout + jiffies, cp->timer.expires + 60*HZ))
  1591			return 0;
  1592	
  1593		/* Drop only conns with number of incoming packets in [1..8] range */
  1594		i = atomic_read(&cp->in_pkts);
  1595		if (i > 8 || i < 1)
  1596			return 0;
  1597	
  1598		i--;
> 1599		if (--ipvs->dropentry_counters[i] > 0)
  1600			return 0;
  1601	
  1602		/* Prefer to drop conns with less number of incoming packets */
  1603		ipvs->dropentry_counters[i] = i + 1;
  1604		return 1;
  1605	}
  1606	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
