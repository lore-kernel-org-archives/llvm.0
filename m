Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8A52BF3DF;
	Wed, 20 Aug 2025 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755670990; cv=none; b=LYduf2I7lLnscrHqnmUIVgp7v4y+s2kQ6rNld7ec5DeSV/0edefsx1Mmr2V9WF6y3WxDrCXBnBhoA41WyBXC9PCB+u+1A+E9FUeyVdcTM0BIVx4MtUCdS3Hlkq3gXT5+Ez1DR0F+XZGGSxawN32oh/ZwlYVplydMzP6LTDVvtmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755670990; c=relaxed/simple;
	bh=watyWEw6hBThy2QiBcLZwaeTiW1G7/06gJrk2f2XSwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2qLVUONdf+tIVTA4UkQILZDpExsYT6OP9KbNS+EJefJ/MtJacCqFYfWmXNipnFRE0j7GCtTthLEaXXgjHVUzpki7zvCPwU2jjfkHqfSElW3U0pzLS1fpe5hQOajh94ze1mPt/5YIdMh5eRDd13EPPT0jjJI5z3NAeTxuGRssOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baaTAlFq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baaTAlFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755670989; x=1787206989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=watyWEw6hBThy2QiBcLZwaeTiW1G7/06gJrk2f2XSwg=;
  b=baaTAlFqRkxgPqo/MS/ttdfcV7C+lYXrDa97j/jMThZr1bOXsyK9ABlj
   RsbsKlfCgJ70ufmwh9q4vmWpoT9bV5jazZkJOoTiQMD1jQMCnrTMEooC9
   v4kMzE6PA/F9UEUohoeOM4kH/G7AYyyDRs8PFC3oe7Du6ppji6FGtQb45
   ayesAPqY3n9u98H69wvFcFr8zzqnTNy6lgP9bbkfvNxW31dsIQXi8oojl
   kpkV9FFCHqcrUGHH0sMNwQbLVBSfvYje9RRP4Q42dXw28K5vUxx9WVHB7
   zJVNKhk4KrnrylLmx+z7yvlrkUhI0mSxYv8E3cDup/Siea3WQX43QikhE
   Q==;
X-CSE-ConnectionGUID: aNSH9+1TQ/GzZ+3yvTMWpg==
X-CSE-MsgGUID: 3WADKhXBSB28H9iEWH7WvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="83353610"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="83353610"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 23:23:08 -0700
X-CSE-ConnectionGUID: c/pl5iFOQHuKwVQPFow/RA==
X-CSE-MsgGUID: qOAb+k7sTmWH+p6b1U2CBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167547504"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2025 23:23:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uocDx-000IGx-04;
	Wed, 20 Aug 2025 06:23:05 +0000
Date: Wed, 20 Aug 2025 14:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 08/13] khugepaged: avoid unnecessary mTHP collapse
 attempts
Message-ID: <202508201447.n6ubJ93W-lkp@intel.com>
References: <20250819134205.622806-9-npache@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819134205.622806-9-npache@redhat.com>

Hi Nico,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[cannot apply to lwn/docs-next linus/master v6.17-rc2 next-20250819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nico-Pache/khugepaged-rename-hpage_collapse_-to-collapse_/20250819-222051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250819134205.622806-9-npache%40redhat.com
patch subject: [PATCH v10 08/13] khugepaged: avoid unnecessary mTHP collapse attempts
config: i386-randconfig-003-20250820 (https://download.01.org/0day-ci/archive/20250820/202508201447.n6ubJ93W-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508201447.n6ubJ93W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508201447.n6ubJ93W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/khugepaged.c:1403:4: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    1403 |                         case SCAN_PAGE_RO:
         |                         ^
   mm/khugepaged.c:1403:4: note: insert '__attribute__((fallthrough));' to silence this warning
    1403 |                         case SCAN_PAGE_RO:
         |                         ^
         |                         __attribute__((fallthrough)); 
   mm/khugepaged.c:1403:4: note: insert 'break;' to avoid fall-through
    1403 |                         case SCAN_PAGE_RO:
         |                         ^
         |                         break; 
   1 warning generated.


vim +1403 mm/khugepaged.c

  1350	
  1351	/* Recursive function to consume the bitmap */
  1352	static int collapse_scan_bitmap(struct mm_struct *mm, unsigned long address,
  1353				int referenced, int unmapped, struct collapse_control *cc,
  1354				bool *mmap_locked, unsigned long enabled_orders)
  1355	{
  1356		u8 order, next_order;
  1357		u16 offset, mid_offset;
  1358		int num_chunks;
  1359		int bits_set, threshold_bits;
  1360		int top = -1;
  1361		int collapsed = 0;
  1362		int ret;
  1363		struct scan_bit_state state;
  1364		bool is_pmd_only = (enabled_orders == (1 << HPAGE_PMD_ORDER));
  1365	
  1366		cc->mthp_bitmap_stack[++top] = (struct scan_bit_state)
  1367			{ HPAGE_PMD_ORDER - KHUGEPAGED_MIN_MTHP_ORDER, 0 };
  1368	
  1369		while (top >= 0) {
  1370			state = cc->mthp_bitmap_stack[top--];
  1371			order = state.order + KHUGEPAGED_MIN_MTHP_ORDER;
  1372			offset = state.offset;
  1373			num_chunks = 1 << (state.order);
  1374			/* Skip mTHP orders that are not enabled */
  1375			if (!test_bit(order, &enabled_orders))
  1376				goto next_order;
  1377	
  1378			/* copy the relavant section to a new bitmap */
  1379			bitmap_shift_right(cc->mthp_bitmap_temp, cc->mthp_bitmap, offset,
  1380					  MTHP_BITMAP_SIZE);
  1381	
  1382			bits_set = bitmap_weight(cc->mthp_bitmap_temp, num_chunks);
  1383			threshold_bits = (HPAGE_PMD_NR - khugepaged_max_ptes_none - 1)
  1384					>> (HPAGE_PMD_ORDER - state.order);
  1385	
  1386			/* Check if the region is "almost full" based on the threshold */
  1387			if (bits_set > threshold_bits || is_pmd_only
  1388				|| test_bit(order, &huge_anon_orders_always)) {
  1389				ret = collapse_huge_page(mm, address, referenced, unmapped,
  1390							 cc, mmap_locked, order,
  1391							 offset * KHUGEPAGED_MIN_MTHP_NR);
  1392	
  1393				/*
  1394				 * Analyze failure reason to determine next action:
  1395				 * - goto next_order: try smaller orders in same region
  1396				 * - continue: try other regions at same order
  1397				 * - break: stop all attempts (system-wide failure)
  1398				 */
  1399				switch (ret) {
  1400				/* Cases were we should continue to the next region */
  1401				case SCAN_SUCCEED:
  1402					collapsed += (1 << order);
> 1403				case SCAN_PAGE_RO:
  1404				case SCAN_PTE_MAPPED_HUGEPAGE:
  1405					continue;
  1406				/* Cases were lower orders might still succeed */
  1407				case SCAN_LACK_REFERENCED_PAGE:
  1408				case SCAN_EXCEED_NONE_PTE:
  1409				case SCAN_EXCEED_SWAP_PTE:
  1410				case SCAN_EXCEED_SHARED_PTE:
  1411				case SCAN_PAGE_LOCK:
  1412				case SCAN_PAGE_COUNT:
  1413				case SCAN_PAGE_LRU:
  1414				case SCAN_PAGE_NULL:
  1415				case SCAN_DEL_PAGE_LRU:
  1416				case SCAN_PTE_NON_PRESENT:
  1417				case SCAN_PTE_UFFD_WP:
  1418				case SCAN_ALLOC_HUGE_PAGE_FAIL:
  1419					goto next_order;
  1420				/* All other cases should stop collapse attempts */
  1421				default:
  1422					break;
  1423				}
  1424				break;
  1425			}
  1426	
  1427	next_order:
  1428			if (state.order > 0) {
  1429				next_order = state.order - 1;
  1430				mid_offset = offset + (num_chunks / 2);
  1431				cc->mthp_bitmap_stack[++top] = (struct scan_bit_state)
  1432					{ next_order, mid_offset };
  1433				cc->mthp_bitmap_stack[++top] = (struct scan_bit_state)
  1434					{ next_order, offset };
  1435			}
  1436		}
  1437		return collapsed;
  1438	}
  1439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
