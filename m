Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9114E37BE8A;
	Thu,  7 May 2026 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146199; cv=none; b=HINRrVhE+uUzBQlBpgyMk6yfTsPknI6ubL2FLAua+NxkZPT2DMGZMeP4yu+Yffxg9mn5grNUCWw+5CEFCmt5eIGFyy6lOnWyz1BSgGrvppOJ52bLaJ3cQFm7NbcV4XPLJtlHKWAXXGYj1y2kmrSjhSDUhaEVTr2FxZNHTzat18o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146199; c=relaxed/simple;
	bh=E6fNTky40pyAiAoFNGtGajY23Occazt372McMKoxIk4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MvZvHoiRhIpkSPMHPAUXzeWtKoJhxQHnmUNoZuFFjY1MA24faargzskYWfqzzBvuJIGdRgeVQH8rnLnQjiOKBb7g3c6tAMGfDP19UaP2IJmuaXzzqMgMkn7Zzh/hoiv1Le7P0uAzApQGaitZkpamhRp/V7Bcr3mBejs02dHB8yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LO2HYIhX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LO2HYIhX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778146197; x=1809682197;
  h=date:from:to:cc:subject:message-id;
  bh=E6fNTky40pyAiAoFNGtGajY23Occazt372McMKoxIk4=;
  b=LO2HYIhX1VHGEKowdof30jxy/zyF68tZLuMSxXaclXTPDVnxLjEIV+LH
   DefVNAJZpKXOy359pJmBJTjk0cf5OX9uQzljS1/LN7Kf5gQ9S1sc+6qM+
   nKRW2xbsD3Dpn7r5tLFGaP5mv5sMIxqilkuMyQZ6ckueKJi8WN59fyVLy
   xaKoJY0cmXgiJXibi+O+nd2dWDh1C0mU/TcVmxN2ohYw8+fy7uA+gLw2F
   nP8bG1cjSKO1DCLRTFsQc/Eerfylq/Rf/E5uquRID1ijy4hl5k2ZlXcVx
   CP+egHx12NaAkGTlWKmCf2fmsCpvKtyLs9OnkpIL6ipF37xI2T6aI2tfY
   g==;
X-CSE-ConnectionGUID: AA+bgFL3SAaMVd4Ecmbhvg==
X-CSE-MsgGUID: 58f1ZfiUT6uGHgE2VTNWcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78241428"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="78241428"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:29:57 -0700
X-CSE-ConnectionGUID: 9nzPgsimThSZq4pDnMbK7A==
X-CSE-MsgGUID: kWGwmICUQIKZzudwpov1bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="232050929"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2026 02:29:56 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKv3J-0000000009P-2Cl7;
	Thu, 07 May 2026 09:29:53 +0000
Date: Thu, 07 May 2026 17:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 17/18] mm/page_idle.c:105:16:
 error: use of undeclared identifier 'folio_lock_anon_vma_read'
Message-ID: <202605071744.yAZ3Fsvu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: d91a1a12c5871a70ef97dc4725f0ca758f210524 [17/18] HACK, tbh: mm: add pure CoW context mode
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260507/202605071744.yAZ3Fsvu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071744.yAZ3Fsvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071744.yAZ3Fsvu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_idle.c:105:16: error: use of undeclared identifier 'folio_lock_anon_vma_read'
     105 |                 .anon_lock = folio_lock_anon_vma_read,
         |                              ^
   1 error generated.
--
>> mm/damon/ops-common.c:175:16: error: use of undeclared identifier 'folio_lock_anon_vma_read'
     175 |                 .anon_lock = folio_lock_anon_vma_read,
         |                              ^
   mm/damon/ops-common.c:239:16: error: use of undeclared identifier 'folio_lock_anon_vma_read'
     239 |                 .anon_lock = folio_lock_anon_vma_read,
         |                              ^
   2 errors generated.


vim +/folio_lock_anon_vma_read +105 mm/page_idle.c

33c3fc71c8cfa3 Vladimir Davydov        2015-09-09   96  
5acc17fd35e627 Kefeng Wang             2022-12-30   97  static void page_idle_clear_pte_refs(struct folio *folio)
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09   98  {
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09   99  	/*
6d4675e6013578 Minchan Kim             2022-05-19  100  	 * Since rwc.try_lock is unused, rwc is effectively immutable, so we
6d4675e6013578 Minchan Kim             2022-05-19  101  	 * can make it static to save some cycles and stack.
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  102  	 */
6d4675e6013578 Minchan Kim             2022-05-19  103  	static struct rmap_walk_control rwc = {
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  104  		.rmap_one = page_idle_clear_pte_refs_one,
2f031c6f042cb8 Matthew Wilcox (Oracle  2022-01-29 @105) 		.anon_lock = folio_lock_anon_vma_read,
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  106  	};
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  107  
4aed23a2f8aaaa Matthew Wilcox (Oracle  2022-01-29  108) 	if (!folio_mapped(folio) || !folio_raw_mapping(folio))
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  109  		return;
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  110  
95b34d66480bbc Lokesh Gidra            2025-09-23  111  	if (!folio_trylock(folio))
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  112  		return;
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  113  
84fbbe21894bb9 Matthew Wilcox (Oracle  2022-01-29  114) 	rmap_walk(folio, &rwc);
4aed23a2f8aaaa Matthew Wilcox (Oracle  2022-01-29  115) 	folio_unlock(folio);
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  116  }
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  117  

:::::: The code at line 105 was first introduced by commit
:::::: 2f031c6f042cb8a9b221a8b6b80e69de5170f830 mm/rmap: Convert rmap_walk() to take a folio

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
