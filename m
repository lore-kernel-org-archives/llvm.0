Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1259635949;
	Thu,  3 Apr 2025 05:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659487; cv=none; b=EVqDkGZnOfxiOfYVsLGt8GSROeV5MpQBSPUrRAAPq+QkDp22yQg2BckDBEssPrIkmFGVjWWhs3nZsh4a+/41/JL+mOPSTmwS8Pm6EdRzPzV8dZNLmOJKWadvW3eiIWYr2xAW4f3B68GgSxY+jjNla1kI6l4PQ18Gw8OVVbONiFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659487; c=relaxed/simple;
	bh=OW+m2PrBq3ypCeQb74HrdgQXTRSWQklEQYIOYsfAtTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAcAe+oO971/dWYU7xsv7GKWaLL/1CxjaD1knpKlGHNDqQPbXFLw3EvX6CZSMs/Hb9c5gidIy8v55UgmXcUOmD2hk9YtCrpuRxjNBu9DOxwftMvGac3Mzk8ICfi0Bp6LsBfi41xOp4Mn+8xPWpP9QCARxCp47WyX5s77kSUXzPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBWSzEAh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBWSzEAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743659486; x=1775195486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OW+m2PrBq3ypCeQb74HrdgQXTRSWQklEQYIOYsfAtTA=;
  b=dBWSzEAhI5AjIOLb4eFnF96naPDm7Uwp06KN3zQfNx6GpRaeIlxMuscB
   TQGZj1v17627Jr5OFyiwfR0RQ8KqXXVBHO93gwaIHZGMr6bug2buWgn+X
   kNRyC2yjGzI0iTnJPAUfI5SrjheE77F8cmq3Ljtct4ufktVPxgxe27AUv
   ljyxm4jQG+MfKGZeOTmcxdUU/D5rOb47hIP7Z70xhhOkaGJ3UrgydaG7D
   gV81+Q3oF94KDJ6UIT+HVw0oj80E6tRC+CcnN0v4ceUYNPx9sV4+Yd9ER
   FPkKJHl6+XdeqREOED2WhNzOOoRSk8bZs5A81OaNxQsCzD9kflr0FFM/Y
   Q==;
X-CSE-ConnectionGUID: AwMfypO8ThShimpgUmbR9g==
X-CSE-MsgGUID: bW0LCIsTSGqT1qhNZzFhbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56424741"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="56424741"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 22:51:25 -0700
X-CSE-ConnectionGUID: P1fUhWp4TWyOwv3encuRuA==
X-CSE-MsgGUID: ozc2xbYWRnafyO7ItTBTtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131880022"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Apr 2025 22:51:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0DU0-00007P-2R;
	Thu, 03 Apr 2025 05:51:20 +0000
Date: Thu, 3 Apr 2025 13:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:for_each_valid_pfn 2/3] mm/mm_init.c:782:2: error: use of
 undeclared identifier 'max_t'
Message-ID: <202504031347.jIh7zYLg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux for_each_valid_pfn
head:   d631358395f81d22f3df81ec055aa651c63b4e62
commit: 9b52dd6530f19b4948e6a5068c6870807349322d [2/3] mm: Implement for_each_valid_pfn() for CONFIG_FLATMEM
config: i386-buildonly-randconfig-002-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031347.jIh7zYLg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031347.jIh7zYLg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031347.jIh7zYLg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mm_init.c:782:2: error: too few arguments provided to function-like macro invocation
     782 |         for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {
         |         ^
   include/asm-generic/memory_model.h:53:60: note: expanded from macro 'for_each_valid_pfn'
      53 |         for (pfn = max_t(unsigned long  start_pfn, ARCH_PFN_OFFSET);           \
         |                                                                   ^
   include/linux/minmax.h:169:9: note: macro 'max_t' defined here
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |         ^
>> mm/mm_init.c:782:2: error: use of undeclared identifier 'max_t'
     782 |         for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {
         |         ^
   include/asm-generic/memory_model.h:53:13: note: expanded from macro 'for_each_valid_pfn'
      53 |         for (pfn = max_t(unsigned long  start_pfn, ARCH_PFN_OFFSET);           \
         |                    ^
   2 errors generated.


vim +/max_t +782 mm/mm_init.c

9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  770) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  771) /*
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  772)  * Initialised pages do not have PageReserved set. This function is
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  773)  * called for each range allocated by the bootmem allocator and
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  774)  * marks the pages PageReserved. The remaining valid pages are later
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  775)  * sent to the buddy page allocator.
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  776)  */
61167ad5fecdea Yajun Deng          2023-06-19  777  void __meminit reserve_bootmem_region(phys_addr_t start,
61167ad5fecdea Yajun Deng          2023-06-19  778  				      phys_addr_t end, int nid)
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  779) {
928aaaa953c4b3 David Woodhouse     2025-04-02  780  	unsigned long pfn;
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  781) 
928aaaa953c4b3 David Woodhouse     2025-04-02 @782  	for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {
928aaaa953c4b3 David Woodhouse     2025-04-02  783  		struct page *page = pfn_to_page(pfn);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  784) 
928aaaa953c4b3 David Woodhouse     2025-04-02  785  		init_deferred_page(pfn, nid);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  786) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  787) 		/*
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  788) 		 * no need for atomic set_bit because the struct
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  789) 		 * page is not visible yet so nobody should
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  790) 		 * access it yet.
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  791) 		 */
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  792) 		__SetPageReserved(page);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  793) 	}
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  794) }
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  795) 

:::::: The code at line 782 was first introduced by commit
:::::: 928aaaa953c4b3f31da75231989522934a140282 mm: Introduce for_each_valid_pfn() and use it from reserve_bootmem_region()

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David Woodhouse <dwmw@amazon.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
