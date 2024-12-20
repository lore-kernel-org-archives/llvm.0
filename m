Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E346C22D4F4;
	Fri, 20 Dec 2024 17:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715980; cv=none; b=DmL7i4xEuzSbcPTyC54iyB8EigJhx22cT0aA9zOWJoK8yVIcwBTWNbtV1JeFyRQFAazXrlOEpGc5eK5tLMdlNtZisZ1lKuj2VVVrAwWSMp0T7rJyw8Y/FPr+BAJwkFbDCN4Gin9TUgEfFfxdhZDI26E1EjqvCSrxZIAG3B9Cqv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715980; c=relaxed/simple;
	bh=TBas8igC7du+Ed2ZzdVC19hjX6NShxHjnEaw1zBz9nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEWWVjah7cwybNEZYYIt/UsUxUJRozuBqpAH0P5e3LBbf7RhGF3b88OFN/A8fcmYIpPMCav+GXHCUrykztKFjlq7+/bvdIc/u0jImNYTWA2q5PR51YcZ4KJKVxesmFDy+qt/BMs5NhUYu/jPovbVuQRM29W4SW6llGxO4d619jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsxHvWxv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsxHvWxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734715979; x=1766251979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TBas8igC7du+Ed2ZzdVC19hjX6NShxHjnEaw1zBz9nw=;
  b=JsxHvWxvt8exs/8PKIZIp9M7VE3c8w/4EfaZCNNEf0NM4fL+FDrCu6p1
   ZzJeG+ppUWgyzAQQAKQQpGcQG/L1g0nVChyfoagg4wCZxC67todu+iqXW
   LPlQVSSmPBgRI8o2w7EQre3NeI+j6Xtge5mwNX6n+BaIRFx38GD4rxr0Z
   NEYvQv1IIHKscUUVsk5dYWpvJBS/Iy3A5aRco2H5hrOvudwVpkfbeQo6K
   VmNx+8VpAvfza7ltW+q7x1nCxVaEot96qLck+CYw5Pp1dpgsPClD6WzED
   tJnvEshCxc7DDC4uL5zo/VfpPVmXN97SOC2TQdw2gwpQuGOlB/fUybeA3
   A==;
X-CSE-ConnectionGUID: 6jjN2UvARZ2ecjYEfRup4g==
X-CSE-MsgGUID: +qsB15xCQa+yIne25b2KfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39207310"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="39207310"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 09:32:58 -0800
X-CSE-ConnectionGUID: FvIR2muVRgO6CkiEz0P5jw==
X-CSE-MsgGUID: 4+QdaSJVTyOWvnJhHLezLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98771468"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2024 09:32:54 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOgrr-0001U3-1u;
	Fri, 20 Dec 2024 17:32:51 +0000
Date: Sat, 21 Dec 2024 01:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Ridong <chenridong@huaweicloud.com>, akpm@linux-foundation.org,
	mhocko@suse.com, hannes@cmpxchg.org, yosryahmed@google.com,
	yuzhao@google.com, david@redhat.com, willy@infradead.org,
	ryan.roberts@arm.com, baohua@kernel.org, 21cnbao@gmail.com,
	wangkefeng.wang@huawei.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, chenridong@huawei.com,
	wangweiyang2@huawei.com, xieym_ict@hotmail.com
Subject: Re: [PATCH -next v5] mm: vmscan: retry folios written back while
 isolated for traditional LRU
Message-ID: <202412210101.Og2hX0Rs-lkp@intel.com>
References: <20241220010931.3603111-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220010931.3603111-1-chenridong@huaweicloud.com>

Hi Chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/mm-vmscan-retry-folios-written-back-while-isolated-for-traditional-LRU/20241220-092147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241220010931.3603111-1-chenridong%40huaweicloud.com
patch subject: [PATCH -next v5] mm: vmscan: retry folios written back while isolated for traditional LRU
config: i386-buildonly-randconfig-004-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210101.Og2hX0Rs-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210101.Og2hX0Rs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210101.Og2hX0Rs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:42:
   In file included from include/linux/migrate.h:8:
   include/linux/hugetlb.h:1063:5: warning: no previous prototype for function 'replace_free_hugepage_folios' [-Wmissing-prototypes]
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         |     ^
   include/linux/hugetlb.h:1063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
         | ^
         | static 
>> mm/vmscan.c:313:29: error: call to undeclared function 'lru_gen_distance'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     313 |                 if (lru_gen_enabled() && !lru_gen_distance(folio, false))
         |                                           ^
   mm/vmscan.c:442:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     442 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1806:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1806 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2330:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2330 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2331:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2331 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6271:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6271 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings and 1 error generated.


vim +/lru_gen_distance +313 mm/vmscan.c

   285	
   286	/**
   287	 * find_folios_written_back - Find and move the written back folios to a new list.
   288	 * @list: filios list
   289	 * @clean: the written back folios list
   290	 * @is_retried: whether the list has already been retried.
   291	 */
   292	static inline void find_folios_written_back(struct list_head *list,
   293			struct list_head *clean, bool is_retried)
   294	{
   295		struct folio *folio;
   296		struct folio *next;
   297	
   298		list_for_each_entry_safe_reverse(folio, next, list, lru) {
   299			if (!folio_evictable(folio)) {
   300				list_del(&folio->lru);
   301				folio_putback_lru(folio);
   302				continue;
   303			}
   304	
   305			/* retry folios that may have missed folio_rotate_reclaimable() */
   306			if (!is_retried && !folio_test_active(folio) && !folio_mapped(folio) &&
   307			    !folio_test_dirty(folio) && !folio_test_writeback(folio)) {
   308				list_move(&folio->lru, clean);
   309				continue;
   310			}
   311	
   312			/* don't add rejected folios to the oldest generation */
 > 313			if (lru_gen_enabled() && !lru_gen_distance(folio, false))
   314				set_mask_bits(&folio->flags, LRU_REFS_FLAGS, BIT(PG_active));
   315		}
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
