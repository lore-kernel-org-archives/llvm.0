Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8171015A8;
	Fri, 25 Oct 2024 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729815095; cv=none; b=KWvCYTWETj6s5X52+l4BM5CEoQLLNvCOTHslbtjgqDWmdUEz8QVmKDJaJD54wQYXMcn+d5Ljv+em2M16n1EJuNyQzBkG+7DozHkOgYikJ6UwfSXW14ze6hyVYEpFC7hKEIoeGYC8fEesePWZMt6lEZNLUcIseolfn+PctnwHlLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729815095; c=relaxed/simple;
	bh=USYJo6QAgIU+OcO7CNSnuj4I1wMoyUyaUIuZpwK3lwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bv1MCG4Z5s+emFB08xeaxi0ByAKrx3TpnEVMWevcU/dbF3gx2vUlIjbnZc5Iwht9aFDGF5+T+Os5MzOHLkkaZEGSHe3hAX1YZVdP+04prOMkhXT8h+s0HDuBGY0lWRRHAk1cL7iQ0/e8ruufnu71Ws9daD1e31y+6jPXCIlNQ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0kWvCZ1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0kWvCZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729815094; x=1761351094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=USYJo6QAgIU+OcO7CNSnuj4I1wMoyUyaUIuZpwK3lwk=;
  b=F0kWvCZ1vkzXYPHl2FVaJzFfPzvNpPSLhMZ2gSGD7fTsp91zEdKM3XcZ
   SeJUnB4cNH4e4evNrUjSN9N1a8ujWkMJ74rHt8Wlb1xH7AoMU1oB2L2n4
   2N/oRqTYUfEt5mFsDrMW6lMbp7+IoIs4XJHIkyreAnslvoCuhwrrycuvA
   s507DPI3mAYLDzbMrbbCIZ+/Y+aX2sJuAdNiZn0z4reBkkXvqn9iLxc5h
   EdtfYwaHWe28ZuEw3Dy7kuwNr20+PpVPcpba0CUcTAczg6s9RVJsoqRpC
   nuVh/Oh+fjce5g5BzPycSkNxT3hS7Qx91nxwbb7seitw3mDFqMXp9+k/Y
   w==;
X-CSE-ConnectionGUID: d2KRnNpaSwy1mjC8MzYsMQ==
X-CSE-MsgGUID: yu67CRmDSPOX9lj+4XueLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54877313"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="54877313"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 17:11:32 -0700
X-CSE-ConnectionGUID: 04ancdkiQTGNyo5erMwanQ==
X-CSE-MsgGUID: abV4XZMkRIGXHMPL4UPgqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85523483"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Oct 2024 17:11:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t47vK-000XJ6-0S;
	Fri, 25 Oct 2024 00:11:26 +0000
Date: Fri, 25 Oct 2024 08:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>, hannes@cmpxchg.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, nphamcs@gmail.com,
	mhocko@kernel.org, roman.gushcin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, lnyng@meta.com, akpm@linux-foundation.org,
	cgroups@vger.kernel.org
Subject: Re: [PATCH v2 1/1] memcg/hugetlb: Adding hugeTLB counters to memcg
Message-ID: <202410250704.0LVzYMzi-lkp@intel.com>
References: <20241023203433.1568323-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023203433.1568323-1-joshua.hahnjy@gmail.com>

Hi Joshua,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/memcg-hugetlb-Adding-hugeTLB-counters-to-memcg/20241024-043559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241023203433.1568323-1-joshua.hahnjy%40gmail.com
patch subject: [PATCH v2 1/1] memcg/hugetlb: Adding hugeTLB counters to memcg
config: i386-buildonly-randconfig-003-20241025 (https://download.01.org/0day-ci/archive/20241025/202410250704.0LVzYMzi-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250704.0LVzYMzi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250704.0LVzYMzi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/hugetlb.c:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/hugetlb.c:37:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/hugetlb.c:1928:6: error: use of undeclared identifier 'cgrp_dfl_root'
    1928 |         if (cgrp_dfl_root.flags & CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING)
         |             ^
>> mm/hugetlb.c:1928:28: error: use of undeclared identifier 'CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING'
    1928 |         if (cgrp_dfl_root.flags & CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING)
         |                                   ^
   mm/hugetlb.c:3099:6: error: use of undeclared identifier 'cgrp_dfl_root'
    3099 |         if (cgrp_dfl_root.flags & CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING)
         |             ^
   mm/hugetlb.c:3099:28: error: use of undeclared identifier 'CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING'
    3099 |         if (cgrp_dfl_root.flags & CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING)
         |                                   ^
   3 warnings and 4 errors generated.


vim +/cgrp_dfl_root +1928 mm/hugetlb.c

  1880	
  1881	void free_huge_folio(struct folio *folio)
  1882	{
  1883		/*
  1884		 * Can't pass hstate in here because it is called from the
  1885		 * generic mm code.
  1886		 */
  1887		struct hstate *h = folio_hstate(folio);
  1888		int nid = folio_nid(folio);
  1889		struct hugepage_subpool *spool = hugetlb_folio_subpool(folio);
  1890		bool restore_reserve;
  1891		unsigned long flags;
  1892	
  1893		VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
  1894		VM_BUG_ON_FOLIO(folio_mapcount(folio), folio);
  1895	
  1896		hugetlb_set_folio_subpool(folio, NULL);
  1897		if (folio_test_anon(folio))
  1898			__ClearPageAnonExclusive(&folio->page);
  1899		folio->mapping = NULL;
  1900		restore_reserve = folio_test_hugetlb_restore_reserve(folio);
  1901		folio_clear_hugetlb_restore_reserve(folio);
  1902	
  1903		/*
  1904		 * If HPageRestoreReserve was set on page, page allocation consumed a
  1905		 * reservation.  If the page was associated with a subpool, there
  1906		 * would have been a page reserved in the subpool before allocation
  1907		 * via hugepage_subpool_get_pages().  Since we are 'restoring' the
  1908		 * reservation, do not call hugepage_subpool_put_pages() as this will
  1909		 * remove the reserved page from the subpool.
  1910		 */
  1911		if (!restore_reserve) {
  1912			/*
  1913			 * A return code of zero implies that the subpool will be
  1914			 * under its minimum size if the reservation is not restored
  1915			 * after page is free.  Therefore, force restore_reserve
  1916			 * operation.
  1917			 */
  1918			if (hugepage_subpool_put_pages(spool, 1) == 0)
  1919				restore_reserve = true;
  1920		}
  1921	
  1922		spin_lock_irqsave(&hugetlb_lock, flags);
  1923		folio_clear_hugetlb_migratable(folio);
  1924		hugetlb_cgroup_uncharge_folio(hstate_index(h),
  1925					     pages_per_huge_page(h), folio);
  1926		hugetlb_cgroup_uncharge_folio_rsvd(hstate_index(h),
  1927						  pages_per_huge_page(h), folio);
> 1928		if (cgrp_dfl_root.flags & CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING)
  1929			lruvec_stat_mod_folio(folio, HUGETLB_B, -pages_per_huge_page(h));
  1930		mem_cgroup_uncharge(folio);
  1931		if (restore_reserve)
  1932			h->resv_huge_pages++;
  1933	
  1934		if (folio_test_hugetlb_temporary(folio)) {
  1935			remove_hugetlb_folio(h, folio, false);
  1936			spin_unlock_irqrestore(&hugetlb_lock, flags);
  1937			update_and_free_hugetlb_folio(h, folio, true);
  1938		} else if (h->surplus_huge_pages_node[nid]) {
  1939			/* remove the page from active list */
  1940			remove_hugetlb_folio(h, folio, true);
  1941			spin_unlock_irqrestore(&hugetlb_lock, flags);
  1942			update_and_free_hugetlb_folio(h, folio, true);
  1943		} else {
  1944			arch_clear_hugetlb_flags(folio);
  1945			enqueue_hugetlb_folio(h, folio);
  1946			spin_unlock_irqrestore(&hugetlb_lock, flags);
  1947		}
  1948	}
  1949	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
