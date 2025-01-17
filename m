Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950271D540;
	Fri, 17 Jan 2025 14:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737125335; cv=none; b=DDv80MHB9HgnJy6TNLRlTe9y1uQ0EiU4IBulN12KmmpSCmMHXfCC/GB+lFuSV9AocEVxLtgq7LSWTR7r+ygtYOjarMPKbMiwUpSlH2HB22cIbIp6e2fG4E4WdMiW8aaU2xW6uJoj/bL2lydCyvia6Bq/sb7tmqMVdwB0mSxOngc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737125335; c=relaxed/simple;
	bh=uSNmUN1BqLQ9wV34rv8bt4L6xF2G4DbRVFxELzBA59k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mz6eiSj+ZfVzAnswl9TFEEuLFlW7Og01MBUsEPP+cUZFJlYRYsGO1mhBVxkuCr1Zs9Nv4XmrlOPAR970vZ+VlHGdOoCHRrEjjMngTvpyGVqdI2FylOlLJrkgnJ6x1/BW6Pv9ca4NRgPv06cPq79WQDqmPisjtRnZ7pWV6t+mS9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsAD4Ctu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsAD4Ctu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737125334; x=1768661334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uSNmUN1BqLQ9wV34rv8bt4L6xF2G4DbRVFxELzBA59k=;
  b=jsAD4CtubH7Mq8KFn/uGSnwKBzNPuiVQEzYPQBvw3rF9+D2AhrkqxUpe
   H/l8fyZ96q/Y87LsHuQtwDEU5/I/IYzAPkTiTvtu6JlRAebgveARl8xBc
   mvkl8+Su8YjCZ3ZsseV50O4c0eC9vhUytjcpHpBpUjfQp8PMoYD2tlnfM
   MhdQRngaRtXP9OmPBu1BRBCdZQJs9SmdqlaTyiNxxfyvGkXFcfvLuUOF7
   nB6geMHx6TlABCid/EXI7Q082aNarNwYXQAiJa+L515H2Yout2TQl5jUk
   +2mxiaA31M/C7dpJE4b4zWCzGk+3esM6deS5HIAv0GQBgmYck3gBzPgc6
   g==;
X-CSE-ConnectionGUID: ePM/72yLQKS5skuzssEldg==
X-CSE-MsgGUID: bEkcMzSYRI2nWPsnHtCrTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="60030463"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="60030463"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:48:53 -0800
X-CSE-ConnectionGUID: wu1BXsROQ3idFY6TMr5Tbg==
X-CSE-MsgGUID: oeBZ5H/lSdynd4Bp/ys8ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="106380398"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jan 2025 06:48:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYneU-000TKt-09;
	Fri, 17 Jan 2025 14:48:50 +0000
Date: Fri, 17 Jan 2025 22:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Donet Tom <donettom@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] mm/swap.c: Enable promotion of unmapped MGLRU page cache
 pages
Message-ID: <202501172215.r6eZaaVD-lkp@intel.com>
References: <20250115120625.3785-1-donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115120625.3785-1-donettom@linux.ibm.com>

Hi Donet,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Donet-Tom/mm-swap-c-Enable-promotion-of-unmapped-MGLRU-page-cache-pages/20250115-200910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250115120625.3785-1-donettom%40linux.ibm.com
patch subject: [RFC] mm/swap.c: Enable promotion of unmapped MGLRU page cache pages
config: i386-buildonly-randconfig-003-20250116 (https://download.01.org/0day-ci/archive/20250117/202501172215.r6eZaaVD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172215.r6eZaaVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172215.r6eZaaVD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/swap.c:26:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/swap.c:413:4: error: use of undeclared identifier 'sysctl_numa_balancing_mode'
     413 |                 (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
         |                  ^
>> mm/swap.c:413:33: error: use of undeclared identifier 'NUMA_BALANCING_MEMORY_TIERING'
     413 |                 (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
         |                                               ^
>> mm/swap.c:414:3: error: use of undeclared identifier 'numa_pagecache_promotion_enabled'
     414 |                 numa_pagecache_promotion_enabled) {
         |                 ^
>> mm/swap.c:421:5: error: call to undeclared function 'promotion_candidate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     421 |                                 promotion_candidate(folio);
         |                                 ^
   2 warnings and 4 errors generated.


vim +/sysctl_numa_balancing_mode +413 mm/swap.c

   382	
   383	static void lru_gen_inc_refs(struct folio *folio)
   384	{
   385		struct mem_cgroup *memcg;
   386		struct lruvec *lruvec;
   387		int gen;
   388		unsigned long new_flags, old_flags = READ_ONCE(folio->flags);
   389	
   390		if (folio_test_unevictable(folio))
   391			return;
   392	
   393		/* see the comment on LRU_REFS_FLAGS */
   394		if (!folio_test_referenced(folio)) {
   395			set_mask_bits(&folio->flags, LRU_REFS_MASK, BIT(PG_referenced));
   396			return;
   397		}
   398	
   399		do {
   400			if ((old_flags & LRU_REFS_MASK) == LRU_REFS_MASK) {
   401				if (!folio_test_workingset(folio)) {
   402					folio_set_workingset(folio);
   403					return;
   404				}
   405				goto promo_candid;
   406			}
   407	
   408			new_flags = old_flags + BIT(LRU_REFS_PGOFF);
   409		} while (!try_cmpxchg(&folio->flags, &old_flags, new_flags));
   410	
   411	promo_candid:
   412		if (!folio_test_isolated(folio) &&
 > 413			(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
 > 414			numa_pagecache_promotion_enabled) {
   415			memcg = folio_memcg(folio);
   416			if (memcg) {
   417				lruvec = mem_cgroup_lruvec(memcg, folio_pgdat(folio));
   418				gen = folio_lru_gen(folio);
   419	
   420				if ((gen < MAX_NR_GENS) && lru_gen_is_active(lruvec, gen))
 > 421					promotion_candidate(folio);
   422			}
   423		}
   424	}
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
