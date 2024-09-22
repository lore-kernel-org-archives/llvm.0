Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496F219306D;
	Sun, 22 Sep 2024 01:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726968858; cv=none; b=RCgzGG96XXU8vh+2eWSXE1u/XZqrCjJoYH7OTMJ9ysZZJcBzr5YzJeVx9jJm0ouFCarHs695cuHJM+ayGw3yYN0KDwC/1bbfKmICb7jmRroDA5kV3s4toOk4wezr3Wo//Bzsgl0oeiTDk5qv+DQWwU3dsfMcNpZu9s5Auq5U24E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726968858; c=relaxed/simple;
	bh=zAFLtykeehVz6NlPD7k40sEepQa7MH97AX9LEEO51eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTXcSolTfKtcNeA0UMd5c58DdWIq9ogIYGm5w9aVNmq02alnBjtzIjmKKxt3l2/Z5RyAcKhylcvWplHZuIgQbzztLTwGEgqyk8+v9VRlSp7Y+xORIo+YHozOVEIdaCktVYYCJGxAVBNpVD0YHad9FlQE8vTY0KDnO14RHpD7o/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCItdcjZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCItdcjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726968857; x=1758504857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zAFLtykeehVz6NlPD7k40sEepQa7MH97AX9LEEO51eg=;
  b=NCItdcjZhnTg5InKT8plhEhVXNW1MgFp4QlxhRR4eCOF5k3UVWVQZsfw
   9KIs2EZV2rWpzoRK+7kyaciMVGfZVIWB3lgeDF6h+qpjBKR0mm249jFIq
   W9usFxwVDLuxEt6ZRYXDYpTtynTuJyCPca7PwKLVzc7elF/so2rOkjKtK
   lmQllG23Ik/5Go7A3l2J9DH31cx2udwLhNAmBWtthoUKBUUyuAwrx4K7t
   cLvw0cD3XIl52Q+iisiep2iw/XbIYkSJ2WyGCAcSdNlyqVxNjkSx1Rld2
   7R6aBjubsKjoFw1HNBb4+00/JUMjP4xMrqLYevfrCicEC7DIDpXvvmj7z
   g==;
X-CSE-ConnectionGUID: TtqDK2TdRluDcXvLlJXK5w==
X-CSE-MsgGUID: T7je9RFmQIGyGHEdbDvrOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37077095"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="37077095"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 18:34:13 -0700
X-CSE-ConnectionGUID: mQRUdHG0SS22A/Mlj4Vs6A==
X-CSE-MsgGUID: 5ntGIEzZSAG3BwZUjXeDwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="74809218"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Sep 2024 18:34:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssBUH-000FwK-1O;
	Sun, 22 Sep 2024 01:34:09 +0000
Date: Sun, 22 Sep 2024 09:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] net/smc: Introduce a hook to modify syn_smc
 at runtime
Message-ID: <202409220912.ueH73mHB-lkp@intel.com>
References: <1726654204-61655-1-git-send-email-alibuda@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1726654204-61655-1-git-send-email-alibuda@linux.alibaba.com>

Hi Wythe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/D-Wythe/net-smc-Introduce-a-hook-to-modify-syn_smc-at-runtime/20240918-181133
base:   net-next/main
patch link:    https://lore.kernel.org/r/1726654204-61655-1-git-send-email-alibuda%40linux.alibaba.com
patch subject: [RFC PATCH net-next] net/smc: Introduce a hook to modify syn_smc at runtime
config: arm-randconfig-002-20240922 (https://download.01.org/0day-ci/archive/20240922/202409220912.ueH73mHB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220912.ueH73mHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220912.ueH73mHB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/smc/af_smc.c:27:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   net/smc/af_smc.c:194:36: error: no member named 'skc_v6_daddr' in 'struct sock_common'
     194 |                 rmt6_sockaddr->sin6_addr = ireq->ir_v6_rmt_addr;
         |                                            ~~~~~~^~~~~~~~~~~~~~
   include/net/inet_sock.h:74:42: note: expanded from macro 'ir_v6_rmt_addr'
      74 | #define ir_v6_rmt_addr          req.__req_common.skc_v6_daddr
         |                                                  ^
>> net/smc/af_smc.c:3519:9: error: call to undeclared function 'register_btf_fmodret_id_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3519 |         return register_btf_fmodret_id_set(&bpf_smc_fmodret_set);
         |                ^
   net/smc/af_smc.c:3519:9: note: did you mean 'register_btf_kfunc_id_set'?
   include/linux/btf.h:623:19: note: 'register_btf_kfunc_id_set' declared here
     623 | static inline int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
         |                   ^
   1 warning and 2 errors generated.


vim +/register_btf_fmodret_id_set +3519 net/smc/af_smc.c

  3516	
  3517	static int __init bpf_smc_kfunc_init(void)
  3518	{
> 3519		return register_btf_fmodret_id_set(&bpf_smc_fmodret_set);
  3520	}
  3521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
