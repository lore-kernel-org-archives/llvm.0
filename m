Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3136E166F29;
	Fri, 17 Jan 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123413; cv=none; b=EXEaYOUitO5i0jE+Jc1MAXNdNdab/fZ9lZ/sQucYohnVGlPXhvZsPLy+3Qx3hg/v21hXZfgGYwuKEfOhGFKsVx11UaZPqDDIk+CFQ7enhO4ZrMCrWwiL9XFNU5m5rvfm5NTQFLGm3SHMMCOHlxryqaobDbY9rhiY7pGyx47v5sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123413; c=relaxed/simple;
	bh=14ciKrEXUQtwTOla9ClEyvwfPsCnIydzYbCISVbfx+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAA0xlxyj9WO8InqUuihWKIi2D9MRzWy7PpG2slc4IBokZKiNzKVauFfoo0MvAUcPHC+4gAwR9li6LBShnZbzw0mkIVyawaUYC0U+qdAwikw6L+Oi1FRmb4kxoFhi2Xk7c3id1YSQWOxutBZUwdXEDOZxMhtJTSSC0lvXV751QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0qpJiUE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0qpJiUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123411; x=1768659411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=14ciKrEXUQtwTOla9ClEyvwfPsCnIydzYbCISVbfx+s=;
  b=b0qpJiUEh7i48raAm/WSmcCpRBbGV0U+pv0o4uFsriDZ66hM+hV5tkSj
   yMyr355tcdb5GBAkY1VGh1fi/rglmCJtJHiXH+soYiNmA/Lnu7AnH0cGN
   BO6wb3IAhaesMcEXsbPIQGbdvZFlYNj1A91bg7VgvyLAi+GSfjsKBdavZ
   4bct10dn3s2dbgz73bEz7jk8bhOPt6rWHHrvCP308gV2tGPzvZuOjsnEB
   fwDL3xsAIk6J92BRj839/297K4LqaXj2WKzWPigLxebXX3WS3q/zdAqqs
   JlsQ1vJC8Bg6jXuo2g3bc+9on6WbEQ/Gyulus3boF9lWdy8piWWxk87S2
   w==;
X-CSE-ConnectionGUID: TJQdxzsiT36i33CT9lAy/Q==
X-CSE-MsgGUID: qlPnXO2HSSaB8KuSMAB7cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37715077"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37715077"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:16:51 -0800
X-CSE-ConnectionGUID: jhYmPnGdRVy+7FlK/L8zew==
X-CSE-MsgGUID: v5PBERN1RkuvW9OTEoedxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="110816818"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2025 06:16:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYn9T-000TIt-0i;
	Fri, 17 Jan 2025 14:16:47 +0000
Date: Fri, 17 Jan 2025 22:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: Donet Tom <donettom@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] mm/swap.c: Enable promotion of unmapped MGLRU page cache
 pages
Message-ID: <202501172113.JJBKAvMq-lkp@intel.com>
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
config: arm64-randconfig-003-20250116 (https://download.01.org/0day-ci/archive/20250117/202501172113.JJBKAvMq-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172113.JJBKAvMq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172113.JJBKAvMq-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/swap.c:413:4: error: use of undeclared identifier 'sysctl_numa_balancing_mode'
                   (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
                    ^
   mm/swap.c:413:33: error: use of undeclared identifier 'NUMA_BALANCING_MEMORY_TIERING'
                   (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
                                                 ^
   mm/swap.c:414:3: error: use of undeclared identifier 'numa_pagecache_promotion_enabled'
                   numa_pagecache_promotion_enabled) {
                   ^
>> mm/swap.c:421:5: error: call to undeclared function 'promotion_candidate'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                                   promotion_candidate(folio);
                                   ^
   4 errors generated.


vim +/promotion_candidate +421 mm/swap.c

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
   414			numa_pagecache_promotion_enabled) {
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
