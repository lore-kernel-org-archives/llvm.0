Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D252E53376;
	Fri,  9 Aug 2024 05:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723181329; cv=none; b=cOutUE9EclhzQBpujYJSaOBrM4ekv8HWrutUS8RiUQQNrE8Rq8rmUuuR5yDcd/fHo+juYLUxuieMZGmZuxU9AhUBZ77DUB+orQfx6EZ5KYwGLQSX31ecaWP0ACZFyHidywICbjTxl/6z62sRFy0vGpqSxmArFeCbtrwMMuBCI68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723181329; c=relaxed/simple;
	bh=DWFxlq9QSFDu6r+eAs+CgqjU9cdCaaa55xMa9H8z9oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHqof1vOY9z3yvGybHT7ptcMUHdEl+PQWoDu2y5iJ5GRHtIZvZLeqlFk6UQegjTXpmTg9GJ9LN+FA8FILAzHC6JCUT8muPM8dQniDu62lsKdY8rHQXJNB8bVzBScmon3ltcZQ/zEaqgauIigCSjzcJeQH4plV8fo6McjPiHrOpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1i8S2EB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1i8S2EB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723181328; x=1754717328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DWFxlq9QSFDu6r+eAs+CgqjU9cdCaaa55xMa9H8z9oc=;
  b=F1i8S2EBF56qVcmDsASTQWdy3N7FlFra8VcDTIIty2jTy1FH3+Xqb5tf
   /UOefa5lhdZOiNhtqJB6KJJhlCNBP+IG67DJhgTpKx0j5Zq1HVtohb+/+
   bx3xUbKMLrFWGsC3btjxPOkF7IFMxBzAuLdJy6eK7q5aiq3kXsRv9cSIW
   L+/wtGAYRlFEIqJ0JLfg+j02uLPkb/amy2l3IKMiV05SGUbDBfLwt/tby
   +CSEJ7nEE7IV8SjQYiAUHeE8/9SZzy+qqx8r1cG/3Wxjg8HgT0zMTbgd8
   RtL5Pt9mPfB/d6bVjyDn1/lk2hCrg1Z9pgP9e1xzeGXrqmA4UPezk4gHA
   g==;
X-CSE-ConnectionGUID: xp8JDCdCQkyhrNAMpoetwQ==
X-CSE-MsgGUID: FTXO0zkERJeKUiTAFpQFiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21498467"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="21498467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 22:28:46 -0700
X-CSE-ConnectionGUID: Ph66DVu0QmKx5/+KmXrWXQ==
X-CSE-MsgGUID: AxsRRFLuQVep7AGIfqKxMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="57109750"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 08 Aug 2024 22:28:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scIB9-0006re-0Q;
	Fri, 09 Aug 2024 05:28:43 +0000
Date: Fri, 9 Aug 2024 13:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] mm: collect the number of anon large folios
Message-ID: <202408091324.ZqWOIwKo-lkp@intel.com>
References: <20240808010457.228753-2-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808010457.228753-2-21cnbao@gmail.com>

Hi Barry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240807]
[also build test ERROR on v6.11-rc2]
[cannot apply to akpm-mm/mm-everything linus/master v6.11-rc2 v6.11-rc1 v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-collect-the-number-of-anon-large-folios/20240808-090627
base:   next-20240807
patch link:    https://lore.kernel.org/r/20240808010457.228753-2-21cnbao%40gmail.com
patch subject: [PATCH RFC 1/2] mm: collect the number of anon large folios
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240809/202408091324.ZqWOIwKo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091324.ZqWOIwKo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408091324.ZqWOIwKo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/rmap.c:56:
   In file included from include/linux/mm.h:2199:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/rmap.c:77:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/rmap.c:1470:2: error: call to undeclared function 'mod_mthp_stat'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1470 |         mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1);
         |         ^
>> mm/rmap.c:1470:36: error: use of undeclared identifier 'MTHP_STAT_NR_ANON'
    1470 |         mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1);
         |                                           ^
   mm/rmap.c:1587:3: error: call to undeclared function 'mod_mthp_stat'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1587 |                 mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, -1);
         |                 ^
   mm/rmap.c:1587:37: error: use of undeclared identifier 'MTHP_STAT_NR_ANON'
    1587 |                 mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, -1);
         |                                                   ^
   3 warnings and 4 errors generated.


vim +/mod_mthp_stat +1470 mm/rmap.c

  1402	
  1403	/**
  1404	 * folio_add_new_anon_rmap - Add mapping to a new anonymous folio.
  1405	 * @folio:	The folio to add the mapping to.
  1406	 * @vma:	the vm area in which the mapping is added
  1407	 * @address:	the user virtual address mapped
  1408	 * @flags:	The rmap flags
  1409	 *
  1410	 * Like folio_add_anon_rmap_*() but must only be called on *new* folios.
  1411	 * This means the inc-and-test can be bypassed.
  1412	 * The folio doesn't necessarily need to be locked while it's exclusive
  1413	 * unless two threads map it concurrently. However, the folio must be
  1414	 * locked if it's shared.
  1415	 *
  1416	 * If the folio is pmd-mappable, it is accounted as a THP.
  1417	 */
  1418	void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
  1419			unsigned long address, rmap_t flags)
  1420	{
  1421		const int nr = folio_nr_pages(folio);
  1422		const bool exclusive = flags & RMAP_EXCLUSIVE;
  1423		int nr_pmdmapped = 0;
  1424	
  1425		VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
  1426		VM_WARN_ON_FOLIO(!exclusive && !folio_test_locked(folio), folio);
  1427		VM_BUG_ON_VMA(address < vma->vm_start ||
  1428				address + (nr << PAGE_SHIFT) > vma->vm_end, vma);
  1429	
  1430		/*
  1431		 * VM_DROPPABLE mappings don't swap; instead they're just dropped when
  1432		 * under memory pressure.
  1433		 */
  1434		if (!folio_test_swapbacked(folio) && !(vma->vm_flags & VM_DROPPABLE))
  1435			__folio_set_swapbacked(folio);
  1436		__folio_set_anon(folio, vma, address, exclusive);
  1437	
  1438		if (likely(!folio_test_large(folio))) {
  1439			/* increment count (starts at -1) */
  1440			atomic_set(&folio->_mapcount, 0);
  1441			if (exclusive)
  1442				SetPageAnonExclusive(&folio->page);
  1443		} else if (!folio_test_pmd_mappable(folio)) {
  1444			int i;
  1445	
  1446			for (i = 0; i < nr; i++) {
  1447				struct page *page = folio_page(folio, i);
  1448	
  1449				/* increment count (starts at -1) */
  1450				atomic_set(&page->_mapcount, 0);
  1451				if (exclusive)
  1452					SetPageAnonExclusive(page);
  1453			}
  1454	
  1455			/* increment count (starts at -1) */
  1456			atomic_set(&folio->_large_mapcount, nr - 1);
  1457			atomic_set(&folio->_nr_pages_mapped, nr);
  1458		} else {
  1459			/* increment count (starts at -1) */
  1460			atomic_set(&folio->_entire_mapcount, 0);
  1461			/* increment count (starts at -1) */
  1462			atomic_set(&folio->_large_mapcount, 0);
  1463			atomic_set(&folio->_nr_pages_mapped, ENTIRELY_MAPPED);
  1464			if (exclusive)
  1465				SetPageAnonExclusive(&folio->page);
  1466			nr_pmdmapped = nr;
  1467		}
  1468	
  1469		__folio_mod_stat(folio, nr, nr_pmdmapped);
> 1470		mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1);
  1471	}
  1472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
