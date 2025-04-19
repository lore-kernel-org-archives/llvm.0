Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D78919259E;
	Sat, 19 Apr 2025 06:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745045945; cv=none; b=SsWdFx3Yb5dQZer+WYlv9Z5+EipDjw3a5IMiRsRevEUtsDOBCAj/ZdBWKKoo8quEetU+lsyPFXMRldHDTioDOMQR0L3fh36GFnb8b+sVH93AXK5ZRYgGzWu7eogleWDb4xYcOltieo+rpAmWCMrSohhK4twjtcSShIi4IEQF8Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745045945; c=relaxed/simple;
	bh=NUjvb2G8FmtEyIc6MUMmMMeecADcavEM7FtAgAxHrv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8gm0/1rNdLY5QDurWCbEdRMFyvTO68UaeHGQs4F28vs1TaLKadGB/tZ3j3TuWWQoXk39XCBiRa6qnY5eIpriYz0qF4ckiq+ophD2vhLjO52kmCqeuNC76tbTMCZZ4UyTlsfzEiJ9O0xOTYQ3+py1hYoAAnNo6hXlTH5Wt0y4Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Re2mDuE1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Re2mDuE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745045942; x=1776581942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUjvb2G8FmtEyIc6MUMmMMeecADcavEM7FtAgAxHrv4=;
  b=Re2mDuE1nYWLvuL1GfTsRiHYHlKlk8aUGbjUYwU4rw+3opIZ17WRyMgJ
   R9dTm53CoBV6EyRNHE4CXhK+sVTqwZEYvOUC/ju5babDCl+RUnDjJGkav
   a0pFMbpX8xElLbEmmzxSKKKkmn9ewOyPhRFmA1KHq9NsXCRdpTJTa7NH1
   vt0a1u/jqVeDBD5oXMj5CLDLDGW9UwO9BJOZK88yKgB+/BJ9chL65EhIb
   /D9DMvR/uoxCtukHmsnphbdfpVLOzWRT5XuJWKoV7g0xoQ2d9CzLpsyT6
   Ei7MpvF/xUtbW3sqQdwUTjJbe9KqXavfvoLlySzVdAbMRyQiy1SBozfoo
   g==;
X-CSE-ConnectionGUID: onA2tI1uQKWMzWI08OrvZA==
X-CSE-MsgGUID: b6iu8S23QN2qF71Hf3BqVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="64073849"
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="64073849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 23:59:01 -0700
X-CSE-ConnectionGUID: 4QlOuSX8T6KIX8zVNjbGQg==
X-CSE-MsgGUID: H7Jh2vy+SK6ZaLvmZjyIhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="131298101"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Apr 2025 23:59:00 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u62AE-0003fd-12;
	Sat, 19 Apr 2025 06:58:58 +0000
Date: Sat, 19 Apr 2025 14:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 1/22] mm/page_isolation.c:575:5: error:
 expected ')'
Message-ID: <202504191437.oVMpuu1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   c0ca4eb396d25b10b9c749411814cff272b05065
commit: 6beb1db008901362ed89cc414af874229d4cef95 [1/22] mm/memory_hotplug: PG_offline_restorable for offlining memory with PageOffline pages
config: hexagon-randconfig-002-20250419 (https://download.01.org/0day-ci/archive/20250419/202504191437.oVMpuu1Q-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504191437.oVMpuu1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504191437.oVMpuu1Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_isolation.c:575:5: error: expected ')'
     575 |                          PageOfflineRestorable(page))
         |                          ^
   mm/page_isolation.c:574:11: note: to match this '('
     574 |                 else if ((flags & MEMORY_OFFLINE) && PageOffline(page)
         |                         ^
   1 error generated.


vim +575 mm/page_isolation.c

   522	
   523	/**
   524	 * undo_isolate_page_range - undo effects of start_isolate_page_range()
   525	 * @start_pfn:		The first PFN of the isolated range
   526	 * @end_pfn:		The last PFN of the isolated range
   527	 * @migratetype:	New migrate type to set on the range
   528	 *
   529	 * This finds every MIGRATE_ISOLATE page block in the given range
   530	 * and switches it to @migratetype.
   531	 */
   532	void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
   533				    int migratetype)
   534	{
   535		unsigned long pfn;
   536		struct page *page;
   537		unsigned long isolate_start = pageblock_start_pfn(start_pfn);
   538		unsigned long isolate_end = pageblock_align(end_pfn);
   539	
   540		for (pfn = isolate_start;
   541		     pfn < isolate_end;
   542		     pfn += pageblock_nr_pages) {
   543			page = __first_valid_page(pfn, pageblock_nr_pages);
   544			if (!page || !is_migrate_isolate_page(page))
   545				continue;
   546			unset_migratetype_isolate(page, migratetype);
   547		}
   548	}
   549	/*
   550	 * Test all pages in the range is free(means isolated) or not.
   551	 * all pages in [start_pfn...end_pfn) must be in the same zone.
   552	 * zone->lock must be held before call this.
   553	 *
   554	 * Returns the last tested pfn.
   555	 */
   556	static unsigned long
   557	__test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
   558					  int flags)
   559	{
   560		struct page *page;
   561	
   562		while (pfn < end_pfn) {
   563			page = pfn_to_page(pfn);
   564			if (PageBuddy(page))
   565				/*
   566				 * If the page is on a free list, it has to be on
   567				 * the correct MIGRATE_ISOLATE freelist. There is no
   568				 * simple way to verify that as VM_BUG_ON(), though.
   569				 */
   570				pfn += 1 << buddy_order(page);
   571			else if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
   572				/* A HWPoisoned page cannot be also PageBuddy */
   573				pfn++;
   574			else if ((flags & MEMORY_OFFLINE) && PageOffline(page)
 > 575				 PageOfflineRestorable(page))
   576				/*
   577				 * If the page is a restorable PageOffline() page,
   578				 * we can offline the memory block, as the driver will
   579				 * re-discover them when re-onlining the memory.
   580				 */
   581				pfn++;
   582			else
   583				break;
   584		}
   585	
   586		return pfn;
   587	}
   588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
