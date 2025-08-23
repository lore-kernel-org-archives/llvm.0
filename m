Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F2F3C26;
	Sat, 23 Aug 2025 07:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755935632; cv=none; b=lETdwDKzpLcn314lx5sG0JSEhpuT4Z+ZnYqrwThzUoAMof5chkSvDDpNl5eg/mbQ+Z3KyIs6me36rv0koqbOHvQAMm8BhdA7WqPZkLlQeFCjBtWaQLV5ANTPn7zDPr69hGAztYuBdyKrYzNar0/VmaWnVVOHI4oJkTbYCNG6Rkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755935632; c=relaxed/simple;
	bh=tkwEdL9tzdcawV9nya6XFlUogcn6ps7dV7hKg+ucbZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lu6APwPJYiFdZHOSbGFwjLgiHw4Q+guoi6KoNj3/lYf0TMGcADQNLTV7zUd7D+chpIMPuWc+HchQ6WdZrjoffmQFZTinTbDUzrGBJzqgQpgyYFMC2mTrOD3gcEpOxtaR90JWY/zpaJX7/NfPRQkTGW9Cs3z3lxjBYjGVziqGQTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aq1sJTfI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aq1sJTfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755935630; x=1787471630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tkwEdL9tzdcawV9nya6XFlUogcn6ps7dV7hKg+ucbZg=;
  b=aq1sJTfIDeilaaJJ0zJdN1S0l09NzxwmQlW0iG3xz/+pSXjP7bEipgg/
   nlXbLCjllEFVJqfgfWAbeqUnNz1Unjs0wBzA8oH0I9g4YONbqkCWk22SZ
   zcliEGJCmY2P3Q1IQeJc114DfKO6N3NFQ61CiCBU7FujTfiFgl/q58vKw
   mI6OIAIfAY2LN/qthtBF5u7SknOaW8zcxmOpwKJoK/YUpSukiUZY6qU9r
   oFsUngcrpidMrG4Srm5hSS16ZO4QyP0uVF6eJM4KaUg7O+PfvRj0Rujly
   3uMgmov0bHuQsQgK31FpC+w3Tst9sz413AJsEOZSXxPvrmYEHe2OBS5y4
   g==;
X-CSE-ConnectionGUID: /UGryhVmQKmfFPi6PSq1Mw==
X-CSE-MsgGUID: skpTA/qASKGL2teyr3DfvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58090738"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58090738"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 00:53:49 -0700
X-CSE-ConnectionGUID: /+NPcWYbQlOnDYAZcB9xwg==
X-CSE-MsgGUID: gFAtohXYRLC9jkn0N9zoUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199838634"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Aug 2025 00:53:49 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upj4A-000MBH-1Y;
	Sat, 23 Aug 2025 07:53:42 +0000
Date: Sat, 23 Aug 2025 15:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:nth_page 13/34] mm/hugetlb.c:3250:28: error: use
 of undeclared identifier 'pfn'
Message-ID: <202508231549.LAQRn060-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nth_page
head:   6604ef076c5814154b00afdb7ea9ce90fd598b08
commit: a81868b2ce05b94ec839ecbb2bb93376cf44c724 [13/34] mm/hugetlb: cleanup hugetlb_folio_init_tail_vmemmap()
config: i386-buildonly-randconfig-003-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231549.LAQRn060-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231549.LAQRn060-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231549.LAQRn060-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hugetlb.c:3250:28: error: use of undeclared identifier 'pfn'
    3250 |                 __init_single_page(page, pfn, zone, nid);
         |                                          ^
   1 error generated.


vim +/pfn +3250 mm/hugetlb.c

aa888a74977a8f2 Andi Kleen        2008-07-23  3232  
fde1c4ecf91640e Usama Arif        2023-09-13  3233  /* Initialize [start_page:end_page_number] tail struct pages of a hugepage */
fde1c4ecf91640e Usama Arif        2023-09-13  3234  static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
fde1c4ecf91640e Usama Arif        2023-09-13  3235  					unsigned long start_page_number,
fde1c4ecf91640e Usama Arif        2023-09-13  3236  					unsigned long end_page_number)
fde1c4ecf91640e Usama Arif        2023-09-13  3237  {
fde1c4ecf91640e Usama Arif        2023-09-13  3238  	enum zone_type zone = zone_idx(folio_zone(folio));
fde1c4ecf91640e Usama Arif        2023-09-13  3239  	int nid = folio_nid(folio);
a81868b2ce05b94 David Hildenbrand 2025-08-07  3240  	struct page *head_page = folio_page(folio, 0);
a81868b2ce05b94 David Hildenbrand 2025-08-07  3241  	struct page *page = folio_page(folio, start_page_number);
a81868b2ce05b94 David Hildenbrand 2025-08-07  3242  	unsigned long i;
fde1c4ecf91640e Usama Arif        2023-09-13  3243  	int ret;
fde1c4ecf91640e Usama Arif        2023-09-13  3244  
a81868b2ce05b94 David Hildenbrand 2025-08-07  3245  	/*
a81868b2ce05b94 David Hildenbrand 2025-08-07  3246  	 * We mark all tail pages with memblock_reserved_mark_noinit(),
a81868b2ce05b94 David Hildenbrand 2025-08-07  3247  	 * so these pages are completely uninitialized.
a81868b2ce05b94 David Hildenbrand 2025-08-07  3248  	 */
a81868b2ce05b94 David Hildenbrand 2025-08-07  3249  	for (i = start_page_number; i < end_page_number; i++, page++) {
fde1c4ecf91640e Usama Arif        2023-09-13 @3250  		__init_single_page(page, pfn, zone, nid);
a81868b2ce05b94 David Hildenbrand 2025-08-07  3251  		prep_compound_tail(head_page, i);
a81868b2ce05b94 David Hildenbrand 2025-08-07  3252  		set_page_count(page, 0);
fde1c4ecf91640e Usama Arif        2023-09-13  3253  	}
fde1c4ecf91640e Usama Arif        2023-09-13  3254  }
fde1c4ecf91640e Usama Arif        2023-09-13  3255  

:::::: The code at line 3250 was first introduced by commit
:::::: fde1c4ecf91640e5a95ec36b71ec2e8ec379ce40 mm: hugetlb: skip initialization of gigantic tail struct pages if freed by HVO

:::::: TO: Usama Arif <usama.arif@bytedance.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
