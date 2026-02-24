Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2811367;
	Tue, 24 Feb 2026 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771915688; cv=none; b=W0NPOn6NT4xlIzgddzj7YRVF0DIol/BX4eXXIvLnE7nfHVdz7e39tvtzshai8sJcPbyiYw3L5sLrsE2H8u9jAoMNXRKOYH1Fnag98VoDtUSI7IK1XBOSjBCr2y7fx6yPM6wUXVI6jwlr5lIpnRDux5E2TYYJ0zvyYvFF0FMzsg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771915688; c=relaxed/simple;
	bh=GrUYzsXIDV+OH0yNz8hiPOIqFT9k72qgEKaXyytp+ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZnL4vpfuWxH22qg2iy401lDzBpfhxngsH/advn8+q/iyfw+aT/bt5yArqj2sTix6bz7Ovz+UXIOu3hXJ3gxHl3dEEHYthFtaaQ0cSK9BJMuyLmGRF0Pf8ob7WrxFHIpHZJquUxyDj9UtWXXkqgMlN6adFaYpjC+/RIbGk8V07o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQtgUB/v; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQtgUB/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771915685; x=1803451685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GrUYzsXIDV+OH0yNz8hiPOIqFT9k72qgEKaXyytp+ig=;
  b=MQtgUB/v30hLif6aMaagGVbtdmLzJq0/PpPwhv7VfryyiwYJNuRUepNc
   azLxgJfg5p38Wy3w3WZBfdpO3tiiK69IJUITbIYccWvyhaLXOh4LCenbC
   IIFnZKtS5vti5H47beM+oH1bBFhfDbGctCU+BpDhx1OAJaII0RXds7u8S
   zVkCBc3EXHqTvy9h0PugCO30SCa53KY6oM7OYd+sVDr3nyKOzYAu84tyk
   jby1MCUAhLeHjO34Cxn/3q6caimtEx9GhDFb2uZTQkp2w3A7S7gtHk2Sv
   65/DR+Tz6VxGWaTHrZv3qkyudKGcVrWR8CFl+h9mVGeLXJy8DxGyN3/2x
   w==;
X-CSE-ConnectionGUID: ceHJndZyQjW6L+ELfrj2tQ==
X-CSE-MsgGUID: 58pNdnuQSMaEtJOcW5ahEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73103867"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="73103867"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 22:48:05 -0800
X-CSE-ConnectionGUID: 6WZVwSgCSdSpL0s9jZV4lw==
X-CSE-MsgGUID: Quk6GOUJT8GckrOXu0eLHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="243820291"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Feb 2026 22:48:03 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vumDB-000000001aj-2MJL;
	Tue, 24 Feb 2026 06:48:01 +0000
Date: Tue, 24 Feb 2026 14:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] mm/memcontrol: Make memory.high tier-aware
Message-ID: <202602241456.9NrcMR6n-lkp@intel.com>
References: <20260223223830.586018-7-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223223830.586018-7-joshua.hahnjy@gmail.com>

Hi Joshua,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-page_counter-Introduce-tiered-memory-awareness-to-page_counter/20260224-073845
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260223223830.586018-7-joshua.hahnjy%40gmail.com
patch subject: [RFC PATCH 6/6] mm/memcontrol: Make memory.high tier-aware
config: i386-buildonly-randconfig-002-20260224 (https://download.01.org/0day-ci/archive/20260224/202602241456.9NrcMR6n-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241456.9NrcMR6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241456.9NrcMR6n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:2193:23: error: use of undeclared identifier 'tier_aware_memcg_limits'
    2193 |                 toptier_high_ok = !(tier_aware_memcg_limits &&
         |                                     ^
   mm/memcontrol.c:2315:7: error: use of undeclared identifier 'tier_aware_memcg_limits'
    2315 |         if (!tier_aware_memcg_limits)
         |              ^
   mm/memcontrol.c:2640:18: error: use of undeclared identifier 'tier_aware_memcg_limits'
    2640 |                 toptier_high = tier_aware_memcg_limits &&
         |                                ^
   mm/memcontrol.c:4541:28: error: use of undeclared identifier 'tier_aware_memcg_limits'
    4541 |                 bool toptier_high_ok = !(tier_aware_memcg_limits &&
         |                                          ^
   4 errors generated.


vim +/tier_aware_memcg_limits +2193 mm/memcontrol.c

  2178	
  2179	static unsigned long reclaim_high(struct mem_cgroup *memcg,
  2180					  unsigned int nr_pages,
  2181					  gfp_t gfp_mask)
  2182	{
  2183		unsigned long nr_reclaimed = 0;
  2184	
  2185		do {
  2186			unsigned long pflags;
  2187			nodemask_t toptier_nodes, *reclaim_nodes;
  2188			bool mem_high_ok, toptier_high_ok;
  2189	
  2190			mt_get_toptier_nodemask(&toptier_nodes, NULL);
  2191			mem_high_ok = page_counter_read(&memcg->memory) <=
  2192				      READ_ONCE(memcg->memory.high);
> 2193			toptier_high_ok = !(tier_aware_memcg_limits &&
  2194					    mem_cgroup_toptier_usage(memcg) >
  2195					    page_counter_toptier_high(&memcg->memory));
  2196			if (mem_high_ok && toptier_high_ok)
  2197				continue;
  2198	
  2199			if (mem_high_ok && !toptier_high_ok)
  2200				reclaim_nodes = &toptier_nodes;
  2201			else
  2202				reclaim_nodes = NULL;
  2203	
  2204			memcg_memory_event(memcg, MEMCG_HIGH);
  2205	
  2206			psi_memstall_enter(&pflags);
  2207			nr_reclaimed += try_to_free_mem_cgroup_pages(memcg, nr_pages,
  2208								gfp_mask,
  2209								MEMCG_RECLAIM_MAY_SWAP,
  2210								NULL, reclaim_nodes);
  2211			psi_memstall_leave(&pflags);
  2212		} while ((memcg = parent_mem_cgroup(memcg)) &&
  2213			 !mem_cgroup_is_root(memcg));
  2214	
  2215		return nr_reclaimed;
  2216	}
  2217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
