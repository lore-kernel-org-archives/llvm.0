Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C241481A3;
	Fri,  7 Jun 2024 18:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717784610; cv=none; b=R6W9yg09y3eDS9RqjoGcEpl7SqaSCZnP2YfPDZSC4m2JdzbzriiJoD/ZkV+MeSurEqoDLuyhsTOEfP4nCHE67tWxjueQx1x6K0d5mJMFD8abUOOLcGpWlHDs9p3jVRz0VOflm4Jsb+91zn66f3yLYcOyKTn0qp8yLi+PWJ1NfSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717784610; c=relaxed/simple;
	bh=r7it1Nhm4Xa5OudgScFRq1V92a6iJJ3RWB4T78iHLTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qnm/VmcQo6buOy7Bd31Yjc9L7oaRqf3CWFd7FXpkh8nNBDAuWQu86xPmNLDZR3A5fzrEYugoKzhF+vZB23q649z0emYFCklZRhMhLhOCTFapPJYhQfnZWEqhLrog0DQLpBW1gFc/YlwpVqNRrqavOhopEPQmAdghud/weR8dLLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqzjMvOu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqzjMvOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717784609; x=1749320609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r7it1Nhm4Xa5OudgScFRq1V92a6iJJ3RWB4T78iHLTk=;
  b=XqzjMvOuCebQG7m9rLYTaAOWEERmWM5ORDHkqsLH7qhfeWW/Jh5t1v4g
   /DjlJcMgimDRKsfKoRYCCF4uqW5Elh4+EBKhFuoiwHD2ea9bx47eLLSKL
   aap7QzS5DgZNM11mbv4PwXnMbi9Kf6Opeh+yITycBkcqn/HAumOJoskiC
   nB9OFZGKhouUtKOq3/pGsETSHSTk3Sm1HaEuTImiKjZ1ee75d6ou+sFK3
   er+RDdt0vOEAcW7JNnCPRu23JRlNzCp396wPKRpwKGU/TKM3C7i0sRK32
   di391IXHw717qLmRz/zivOaD20ZTY6Iht0mbsjXzL/agCVvt+faJx+PS4
   Q==;
X-CSE-ConnectionGUID: xO81MQliQkS++RwNBfTG2g==
X-CSE-MsgGUID: vBkE6VB2SbmfZWrE5v4TXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="39920001"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="39920001"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 11:23:29 -0700
X-CSE-ConnectionGUID: 4us/eIeMR9235hlzpVrw3w==
X-CSE-MsgGUID: oSkRWImTQbCn59YOhIb4PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38845579"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jun 2024 11:23:27 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFeFJ-0000FE-0d;
	Fri, 07 Jun 2024 18:23:25 +0000
Date: Sat, 8 Jun 2024 02:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-pg-offline 3/5] mm/mm_init.c:1931:41:
 error: too few arguments to function call, expected 3, have 2
Message-ID: <202406080225.uUQhY6iZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux virtio-mem-pg-offline
head:   f7b71869d1528420a6ea7ffc91c517468e2fff28
commit: fca42afb2bf8c447b2998db6fa994a438d2ae7b8 [3/5] mm: pass meminit_context to __free_pages_core()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240608/202406080225.uUQhY6iZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080225.uUQhY6iZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080225.uUQhY6iZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mm_init.c:1931:41: error: too few arguments to function call, expected 3, have 2
    1931 |                 __free_pages_core(page, MAX_PAGE_ORDER);
         |                 ~~~~~~~~~~~~~~~~~                     ^
   mm/internal.h:607:13: note: '__free_pages_core' declared here
     607 | extern void __free_pages_core(struct page *page, unsigned int order,
         |             ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     608 |                 enum meminit_context);
         |                 ~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1931 mm/mm_init.c

9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1914) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1915) #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1916) static void __init deferred_free_range(unsigned long pfn,
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1917) 				       unsigned long nr_pages)
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1918) {
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1919) 	struct page *page;
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1920) 	unsigned long i;
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1921) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1922) 	if (!nr_pages)
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1923) 		return;
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1924) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1925) 	page = pfn_to_page(pfn);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1926) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1927) 	/* Free a large naturally-aligned chunk if possible */
3f6dac0fd1b831 Kirill A. Shutemov  2023-03-21  1928  	if (nr_pages == MAX_ORDER_NR_PAGES && IS_MAX_ORDER_ALIGNED(pfn)) {
3f6dac0fd1b831 Kirill A. Shutemov  2023-03-21  1929  		for (i = 0; i < nr_pages; i += pageblock_nr_pages)
3f6dac0fd1b831 Kirill A. Shutemov  2023-03-21  1930  			set_pageblock_migratetype(page + i, MIGRATE_MOVABLE);
5e0a760b44417f Kirill A. Shutemov  2023-12-28 @1931  		__free_pages_core(page, MAX_PAGE_ORDER);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1932) 		return;
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1933) 	}
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1934) 
5e0a760b44417f Kirill A. Shutemov  2023-12-28  1935  	/* Accept chunks smaller than MAX_PAGE_ORDER upfront */
dcdfdd40fa82b6 Kirill A. Shutemov  2023-06-06  1936  	accept_memory(PFN_PHYS(pfn), PFN_PHYS(pfn + nr_pages));
dcdfdd40fa82b6 Kirill A. Shutemov  2023-06-06  1937  
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1938) 	for (i = 0; i < nr_pages; i++, page++, pfn++) {
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1939) 		if (pageblock_aligned(pfn))
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1940) 			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
fca42afb2bf8c4 David Hildenbrand   2024-04-17  1941  		__free_pages_core(page, 0, MEMINIT_EARLY);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1942) 	}
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1943) }
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1944) 

:::::: The code at line 1931 was first introduced by commit
:::::: 5e0a760b44417f7cadd79de2204d6247109558a0 mm, treewide: rename MAX_ORDER to MAX_PAGE_ORDER

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
