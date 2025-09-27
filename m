Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7572E29BDBC;
	Sat, 27 Sep 2025 07:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758959833; cv=none; b=bmeGVHCEhbvwkBy8yIafZHRYs22P8DytvvKjoF2LwDur9BQ6IyHnO1K8pRukqEdrnb1oCsxlamD6YbMHUYJ0QFJNhIfXJFdcnPCk0iH7iaDl4hGyEiYU68bQmkBC7bPB0t/u+z30B/ZzIyx8UfsxG1ZQmNIOverx5cBDq5jwLpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758959833; c=relaxed/simple;
	bh=3kN1snQSfXQgSzhlScazdwzv5am8mNjFcM/6vLXUSkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGJ/XiuhaK9gbBSk3qYXXyhGeTAwakHYwr/0RpXJoAaDdxhHcCMy8btqfqVg3YcDMABcM0JDX2h4K4Ufzo8YXhyO0Y45Il4ymSmfTumboHHstgo3DfpzbDiKgtC6BWrhMXlK8OWEfBp1XwQXE+cnlrQbtOSqFellQ2Om3F8WDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsB4X9fE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsB4X9fE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758959831; x=1790495831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3kN1snQSfXQgSzhlScazdwzv5am8mNjFcM/6vLXUSkQ=;
  b=hsB4X9fEq4sOJVA5GNf5WpRMybmHBoGo68U5Z+O87PKk7IX049BaTj3f
   QSA2I0OZMxk7vabipKK1KHaf+LAdX+4Xp3M+q0yDa3WDuy8fowMNf5iaa
   hG2jX3BwZiQI5TaL13h/omAJSPeigbNWQltvQ0VlgH8bdjAD+b2Z7B27F
   3Z6DP99jLdKKvnWSNBifQejxDA7c2Qkp+spM0rg8Z2WNiwj6oAepYpUQJ
   iyAcCzyuy2VIfV4nAp1f9HlXJMKmB4QxDgRRW+jvFNBnSHNshXYaZrdY3
   l2jXq+rIBZgHXqzQN4pEqdU+qp51Ohcm6WeOZrsSpownhpRuGImPrTyzr
   Q==;
X-CSE-ConnectionGUID: AW13T51FSsiA6JhHbLJbfA==
X-CSE-MsgGUID: sP3yR30xSo2JeJj+QcUbdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="48843021"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="48843021"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 00:57:10 -0700
X-CSE-ConnectionGUID: dYD6ObKjT7m1hTj/oazEBA==
X-CSE-MsgGUID: Dr+/R4KpT+CgVTC63ou3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="201474063"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Sep 2025 00:57:04 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Pni-0006tb-2b;
	Sat, 27 Sep 2025 07:57:02 +0000
Date: Sat, 27 Sep 2025 15:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	youngjun.park@lge.com, aaron.lu@intel.com, baohua@kernel.org,
	shikemeng@huaweicloud.com, nphamcs@gmail.com,
	Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 1/1] mm/swapfile.c: select the swap device with
 default priority round robin
Message-ID: <202509271545.8d7xtJIA-lkp@intel.com>
References: <20250926155504.5122-2-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926155504.5122-2-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.17-rc7 next-20250926]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-swapfile-c-select-the-swap-device-with-default-priority-round-robin/20250926-235740
base:   linus/master
patch link:    https://lore.kernel.org/r/20250926155504.5122-2-bhe%40redhat.com
patch subject: [PATCH v2 1/1] mm/swapfile.c: select the swap device with default priority round robin
config: x86_64-buildonly-randconfig-002-20250927 (https://download.01.org/0day-ci/archive/20250927/202509271545.8d7xtJIA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509271545.8d7xtJIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509271545.8d7xtJIA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/swapfile.c:2550:24: error: use of undeclared identifier 'swap_active_head'; did you mean 'swap_avail_head'?
    2550 |         plist_add(&si->list, &swap_active_head);
         |                               ^~~~~~~~~~~~~~~~
         |                               swap_avail_head
   mm/swapfile.c:99:19: note: 'swap_avail_head' declared here
      99 | static PLIST_HEAD(swap_avail_head);
         |                   ^
   mm/swapfile.c:2655:27: error: use of undeclared identifier 'swap_active_head'; did you mean 'swap_avail_head'?
    2655 |         plist_for_each_entry(p, &swap_active_head, list) {
         |                                  ^~~~~~~~~~~~~~~~
         |                                  swap_avail_head
   include/linux/plist.h:173:30: note: expanded from macro 'plist_for_each_entry'
     173 |          list_for_each_entry(pos, &(head)->node_list, mem.node_list)
         |                                     ^
   include/linux/list.h:770:30: note: expanded from macro 'list_for_each_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^
   include/linux/container_of.h:20:26: note: expanded from macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^
   mm/swapfile.c:99:19: note: 'swap_avail_head' declared here
      99 | static PLIST_HEAD(swap_avail_head);
         |                   ^
   mm/swapfile.c:2655:27: error: use of undeclared identifier 'swap_active_head'; did you mean 'swap_avail_head'?
    2655 |         plist_for_each_entry(p, &swap_active_head, list) {
         |                                  ^~~~~~~~~~~~~~~~
         |                                  swap_avail_head
   include/linux/plist.h:173:30: note: expanded from macro 'plist_for_each_entry'
     173 |          list_for_each_entry(pos, &(head)->node_list, mem.node_list)
         |                                     ^
   include/linux/list.h:770:30: note: expanded from macro 'list_for_each_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:507:63: note: expanded from macro '__same_type'
     507 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^
   mm/swapfile.c:99:19: note: 'swap_avail_head' declared here
      99 | static PLIST_HEAD(swap_avail_head);
         |                   ^
   mm/swapfile.c:2655:27: error: use of undeclared identifier 'swap_active_head'; did you mean 'swap_avail_head'?
    2655 |         plist_for_each_entry(p, &swap_active_head, list) {
         |                                  ^~~~~~~~~~~~~~~~
         |                                  swap_avail_head
   include/linux/plist.h:173:30: note: expanded from macro 'plist_for_each_entry'
     173 |          list_for_each_entry(pos, &(head)->node_list, mem.node_list)
         |                                     ^
   include/linux/list.h:770:30: note: expanded from macro 'list_for_each_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:507:63: note: expanded from macro '__same_type'
     507 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^
   mm/swapfile.c:99:19: note: 'swap_avail_head' declared here
      99 | static PLIST_HEAD(swap_avail_head);
         |                   ^
   mm/swapfile.c:2655:27: error: use of undeclared identifier 'swap_active_head'; did you mean 'swap_avail_head'?
    2655 |         plist_for_each_entry(p, &swap_active_head, list) {
         |                                  ^~~~~~~~~~~~~~~~
         |                                  swap_avail_head
   include/linux/plist.h:173:30: note: expanded from macro 'plist_for_each_entry'
     173 |          list_for_each_entry(pos, &(head)->node_list, mem.node_list)
         |                                     ^
   include/linux/list.h:771:32: note: expanded from macro 'list_for_each_entry'
     771 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^
   include/linux/list.h:761:30: note: expanded from macro 'list_entry_is_head'
     761 |         list_is_head(&pos->member, (head))
         |                                     ^
   mm/swapfile.c:99:19: note: 'swap_avail_head' declared here
      99 | static PLIST_HEAD(swap_avail_head);
         |                   ^
   mm/swapfile.c:2677:23: error: use of undeclared identifier 'swap_active_head'; did you mean 'swap_avail_head'?
    2677 |         plist_del(&p->list, &swap_active_head);
         |                              ^~~~~~~~~~~~~~~~
         |                              swap_avail_head


vim +2550 mm/swapfile.c

eb085574a7526c Ying Huang           2019-07-11  2542  
b85508d7de901c Barry Song           2024-08-08  2543  static void _enable_swap_info(struct swap_info_struct *si)
eb085574a7526c Ying Huang           2019-07-11  2544  {
b85508d7de901c Barry Song           2024-08-08  2545  	atomic_long_add(si->pages, &nr_swap_pages);
b85508d7de901c Barry Song           2024-08-08  2546  	total_swap_pages += si->pages;
40531542e28324 Cesar Eduardo Barros 2011-03-22  2547  
adfab836f4908d Dan Streetman        2014-06-04  2548  	assert_spin_locked(&swap_lock);
5b648db56b50e1 Baoquan He           2025-09-26  2549  
b85508d7de901c Barry Song           2024-08-08 @2550  	plist_add(&si->list, &swap_active_head);
c70699e555537b Ma Wupeng            2023-06-27  2551  
b228386cf237e6 Kairui Song          2025-01-14  2552  	/* Add back to available list */
b228386cf237e6 Kairui Song          2025-01-14  2553  	add_to_avail_list(si, true);
cf0cac0a093415 Cesar Eduardo Barros 2012-12-11  2554  }
cf0cac0a093415 Cesar Eduardo Barros 2012-12-11  2555  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
