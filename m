Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A92F3C28;
	Fri, 14 Nov 2025 06:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102827; cv=none; b=G0I2L/WZL7AWxaVXJr8nQGIcLWoMKXMpM1wJ8P1bxaUf8/3iHxDHQTmOdhKqDHYnb3gAY53kdhhjYL6yoea6o9pXyQDz9EvRh7ykQT+V4uhebRM321ccZ5JG8NRKlIzkYery7FaYza7qwYXhZ+7AgxoYQg4QGKyfTmH51/xlUkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102827; c=relaxed/simple;
	bh=c63TyLXwQfY+sk3K1HPrm/PP9kevMhREC0lGp84f11I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lf8p26kcWRcZUNhrGwFwHx12MmWTbgL1sIL3E6+sytgp9k5Icuvv9208rJybcavPYohNpwHXEHogH4+3Eqad/pxZr6GEksGsJFpWwui0x3z7LPAXnZzdlsnQ1Gau8E2aRfTvVwaYaMy95KYxad8yXavhdHgerxOt870dGhGa520=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEExM848; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEExM848"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102825; x=1794638825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c63TyLXwQfY+sk3K1HPrm/PP9kevMhREC0lGp84f11I=;
  b=BEExM848P01XdoJfVaw0JoZyqUwXuGvRBPQGYnfC02pELURJS52qfML3
   tUj5P6cjT4pEXlfhqroFMquk/xwKTSFujxuFxrWgBWY/gzw8yzjgTR6TG
   wihtJLLKtgBM37KR120gMLnmcm8etWFVQrZego6vBoTyZ1fjAY+ndTCdu
   VJ5MtaI8qNKttRVKGSQLoNWqHgzG6vaYsPDQT4s7IgpGvRzJNnKCydg7O
   eY4x22aW1f2y/gYroHyXoi4UuaFd1VPGOL6Qzjq60N/RtqMWW0bRIvpRu
   2ezem1oi826YG52nhB9bee8wyL+fcMsT9B9M8CG11CixRBP9cUWGVDel7
   w==;
X-CSE-ConnectionGUID: GRZElhKmTvig+3y8BWlt4g==
X-CSE-MsgGUID: yWLpRjNISm6TBgnzHax2UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64400133"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="64400133"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:47:01 -0800
X-CSE-ConnectionGUID: WqtCRE61R5m5ri9oFThYRQ==
X-CSE-MsgGUID: 4GiGKfxxRvGpKJkyaAKSTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="220359548"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2025 22:46:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnaD-0006FB-0j;
	Fri, 14 Nov 2025 06:46:57 +0000
Date: Fri, 14 Nov 2025 14:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 36/283] mm/hugetlb.c:4753:18: warning: implicit
 conversion from 'unsigned long long' to 'unsigned long' changes value from
 17179869184 to 0
Message-ID: <202511141140.LrrRrtIv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   1c571d1c4c7e042c3c313d1a2058a17848ccebac
commit: 2f6ff71280ffddb27ad7174d24f573e2683870cd [36/283] mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb
config: powerpc-randconfig-002-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141140.LrrRrtIv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141140.LrrRrtIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141140.LrrRrtIv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hugetlb.c:4753:18: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 17179869184 to 0 [-Wconstant-conversion]
    4753 |         WARN_ON(order > MAX_FOLIO_ORDER);
         |                         ^~~~~~~~~~~~~~~
   include/linux/mm.h:2095:36: note: expanded from macro 'MAX_FOLIO_ORDER'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                 ~~~~~~~~~ ^~~~~~
   include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:85:1: note: expanded from here
      85 | 0x400000000ULL
         | ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning generated.
--
>> mm/page_alloc.c:6910:54: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 17179869184 to 0 [-Wconstant-conversion]
    6910 |         if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_ORDER))
         |                                                             ^~~~~~~~~~~~~~~
   include/linux/mm.h:2095:36: note: expanded from macro 'MAX_FOLIO_ORDER'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                 ~~~~~~~~~ ^~~~~~
   include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:106:1: note: expanded from here
     106 | 0x400000000ULL
         | ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   1 warning generated.
--
>> mm/util.c:1263:16: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 17179869184 to 0 [-Wconstant-conversion]
    1263 |         if (ps->idx < MAX_FOLIO_NR_PAGES) {
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2104:36: note: expanded from macro 'MAX_FOLIO_NR_PAGES'
    2104 | #define MAX_FOLIO_NR_PAGES      (1UL << MAX_FOLIO_ORDER)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/mm.h:2095:36: note: expanded from macro 'MAX_FOLIO_ORDER'
    2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
         |                                 ~~~~~~~~~ ^~~~~~
   include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:39:1: note: expanded from here
      39 | 0x400000000ULL
         | ^~~~~~~~~~~~~~
   1 warning generated.


vim +4753 mm/hugetlb.c

9fee021d15ddd8 Vaishali Thakkar     2016-05-19  4742  
d00181b96eb86c Kirill A. Shutemov   2015-11-06  4743  void __init hugetlb_add_hstate(unsigned int order)
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4744  {
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4745  	struct hstate *h;
8faa8b077b2cdc Andi Kleen           2008-07-23  4746  	unsigned long i;
8faa8b077b2cdc Andi Kleen           2008-07-23  4747  
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4748  	if (size_to_hstate(PAGE_SIZE << order)) {
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4749  		return;
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4750  	}
47d38344abd0c7 Aneesh Kumar K.V     2012-07-31  4751  	BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
59838b2566f6d0 Frank van der Linden 2023-10-04  4752  	BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
7b4f21f5e0386d David Hildenbrand    2025-09-01 @4753  	WARN_ON(order > MAX_FOLIO_ORDER);
47d38344abd0c7 Aneesh Kumar K.V     2012-07-31  4754  	h = &hstates[hugetlb_max_hstate++];
667574e873b5f7 Miaohe Lin           2024-07-12  4755  	__mutex_init(&h->resize_lock, "resize mutex", &h->resize_key);
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4756  	h->order = order;
aca78307bfdaf3 Miaohe Lin           2021-02-24  4757  	h->mask = ~(huge_page_size(h) - 1);
8faa8b077b2cdc Andi Kleen           2008-07-23  4758  	for (i = 0; i < MAX_NUMNODES; ++i)
8faa8b077b2cdc Andi Kleen           2008-07-23  4759  		INIT_LIST_HEAD(&h->hugepage_freelists[i]);
0edaecfab218d7 Aneesh Kumar K.V     2012-07-31  4760  	INIT_LIST_HEAD(&h->hugepage_activelist);
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4761  	snprintf(h->name, HSTATE_NAME_LEN, "hugepages-%lukB",
c2c3a60a857bfe Miaohe Lin           2022-09-01  4762  					huge_page_size(h)/SZ_1K);
8faa8b077b2cdc Andi Kleen           2008-07-23  4763  
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4764  	parsed_hstate = h;
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4765  }
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4766  

:::::: The code at line 4753 was first introduced by commit
:::::: 7b4f21f5e0386dfe02c68c009294d8f26e3c1bad mm/hugetlb: check for unreasonable folio sizes when registering hstate

:::::: TO: David Hildenbrand <david@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
