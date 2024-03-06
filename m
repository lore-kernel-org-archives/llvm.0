Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8668911CAB;
	Wed,  6 Mar 2024 04:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709700794; cv=none; b=MAz+8GtaXZRQyGgBYkb1xdU6CO0PBbXQRpl/5YPJPTjBt3qn+TorLGF+7NucnXc4sohXenqmDWrDekS9YBxlaXs98KYBdc2v74aGfNGlfpNU8c5MVtfzCHJfyE4xvvrcOOfdnKXJ/v3lM/rD0mmjOlXZnc/HytNimdyelvnoIpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709700794; c=relaxed/simple;
	bh=o9nZuPPfrCvcN8hxg7uxH33NZEXb0OTzk2Zk0RDgkgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8EqH3pGovoUlPU3mFZwJmHw91dK3GeXDlhXsDeEjCZwvx2WxiT/bNkSskPufLocVltcq0Ass0KHmtT5T1XPQktqZXX6NJm/1x7PifiuG62AF7VAV291HTRLqY8Vp8WgU3P73CaxSysCSBylPRqHfFyPtgrh/pofqxHMT/vUfr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtEe2Vvb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtEe2Vvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709700791; x=1741236791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o9nZuPPfrCvcN8hxg7uxH33NZEXb0OTzk2Zk0RDgkgs=;
  b=CtEe2VvbSqVxN6cauXIcnd2pU3ZQjlUpptvF4HD+cSEdFhmnJZcIN0jv
   LdUp3ig5hmP1DB7XvMAAiJvnZLq3EuthXEj/T+NmoHYWuTomFdPEPCDkk
   KNZ9S2B4e4Jgcyb6svVEhJ4rGWOXDshqu3sZoTsGSCgNttudHV4qRs8Aq
   MdncCMGiaZei2OhjvogoNa04hzFBS2DWf8/B+jPpvPNg3CXi4/CAtDE8R
   9K0Qn+SeFshUJlhWOJgHXTf9vqJDz+vIqoise5ANfQCqJSNUUOTG4F3WW
   zmqEwlTgE0d0BOQfGKlbhPWSHs6LTszEM/DtKXf9WGbtFgNykHcCoMRI4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15013680"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="15013680"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 20:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9566093"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Mar 2024 20:53:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhjH9-0003vF-0Z;
	Wed, 06 Mar 2024 04:53:07 +0000
Date: Wed, 6 Mar 2024 12:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] s390: supplement for ptdesc conversion
Message-ID: <202403061249.4URm4Yxi-lkp@intel.com>
References: <04beaf3255056ffe131a5ea595736066c1e84756.1709541697.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04beaf3255056ffe131a5ea595736066c1e84756.1709541697.git.zhengqi.arch@bytedance.com>

Hi Qi,

kernel test robot noticed the following build errors:

[auto build test ERROR on s390/features]
[also build test ERROR on kvms390/next linus/master v6.8-rc7]
[cannot apply to akpm-mm/mm-everything next-20240305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-pgtable-correct-the-wrong-comment-about-ptdesc-__page_flags/20240304-191006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/04beaf3255056ffe131a5ea595736066c1e84756.1709541697.git.zhengqi.arch%40bytedance.com
patch subject: [PATCH 3/3] s390: supplement for ptdesc conversion
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240306/202403061249.4URm4Yxi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061249.4URm4Yxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061249.4URm4Yxi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/mm/gmap.c:12:
   In file included from include/linux/pagewalk.h:5:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/s390/mm/gmap.c:212:3: error: incompatible pointer types assigning to 'struct page *' from 'typeof (*(ptdesc)) *' (aka 'struct ptdesc *') [-Werror,-Wincompatible-pointer-types]
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:866:5: note: expanded from macro 'list_for_each_entry_safe'
     866 |                 n = list_next_entry(pos, member);                       \
         |                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/s390/mm/gmap.c:212:3: error: incompatible pointer types assigning to 'struct ptdesc *' from 'struct page *' [-Werror,-Wincompatible-pointer-types]
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^                                ~~~~
   include/linux/list.h:868:11: note: expanded from macro 'list_for_each_entry_safe'
     868 |              pos = n, n = list_next_entry(n, member))
         |                  ^ ~
>> arch/s390/mm/gmap.c:212:58: error: no member named 'pt_list' in 'struct page'; did you mean 'pcp_list'?
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                                                                        ^~~~~~~
         |                                                                        pcp_list
   include/linux/list.h:868:39: note: expanded from macro 'list_for_each_entry_safe'
     868 |              pos = n, n = list_next_entry(n, member))
         |                                              ^
   include/linux/list.h:645:20: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                           ^
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^
   include/linux/mm_types.h:103:22: note: 'pcp_list' declared here
     103 |                                 struct list_head pcp_list;
         |                                                  ^
>> arch/s390/mm/gmap.c:212:58: error: no member named 'pt_list' in 'struct page'; did you mean 'pcp_list'?
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                                                                        ^~~~~~~
         |                                                                        pcp_list
   include/linux/list.h:868:39: note: expanded from macro 'list_for_each_entry_safe'
     868 |              pos = n, n = list_next_entry(n, member))
         |                                              ^
   include/linux/list.h:645:20: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                           ^
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:376:63: note: expanded from macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^
   include/linux/mm_types.h:103:22: note: 'pcp_list' declared here
     103 |                                 struct list_head pcp_list;
         |                                                  ^
>> arch/s390/mm/gmap.c:212:58: error: no member named 'pt_list' in 'struct page'; did you mean 'pcp_list'?
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                                                                        ^~~~~~~
         |                                                                        pcp_list
   include/linux/list.h:868:39: note: expanded from macro 'list_for_each_entry_safe'
     868 |              pos = n, n = list_next_entry(n, member))
         |                                              ^
   include/linux/list.h:645:49: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                                        ^
   include/linux/list.h:601:26: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:376:74: note: expanded from macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^
   include/linux/mm_types.h:103:22: note: 'pcp_list' declared here
     103 |                                 struct list_head pcp_list;
         |                                                  ^
>> arch/s390/mm/gmap.c:212:58: error: no member named 'pt_list' in 'struct page'; did you mean 'pcp_list'?
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                                                                        ^~~~~~~
         |                                                                        pcp_list
   include/linux/list.h:868:39: note: expanded from macro 'list_for_each_entry_safe'
     868 |              pos = n, n = list_next_entry(n, member))
         |                                              ^
   include/linux/list.h:645:20: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                           ^
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:376:63: note: expanded from macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^
   include/linux/mm_types.h:103:22: note: 'pcp_list' declared here
     103 |                                 struct list_head pcp_list;
         |                                                  ^
>> arch/s390/mm/gmap.c:212:3: error: no member named 'pt_list' in 'page'
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^                                                      ~~~~~~~
   include/linux/list.h:868:20: note: expanded from macro 'list_for_each_entry_safe'
     868 |              pos = n, n = list_next_entry(n, member))
         |                           ^                  ~~~~~~
   include/linux/list.h:645:2: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^                                              ~~~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^                       ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> arch/s390/mm/gmap.c:212:3: error: assigning to 'struct page *' from incompatible type 'void'
     212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:868:18: note: expanded from macro 'list_for_each_entry_safe'
     868 |              pos = n, n = list_next_entry(n, member))
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings and 8 errors generated.


vim +212 arch/s390/mm/gmap.c

   187	
   188	/**
   189	 * gmap_free - free a guest address space
   190	 * @gmap: pointer to the guest address space structure
   191	 *
   192	 * No locks required. There are no references to this gmap anymore.
   193	 */
   194	static void gmap_free(struct gmap *gmap)
   195	{
   196		struct page *page, *next;
   197	
   198		/* Flush tlb of all gmaps (if not already done for shadows) */
   199		if (!(gmap_is_shadow(gmap) && gmap->removed))
   200			gmap_flush_tlb(gmap);
   201		/* Free all segment & region tables. */
   202		list_for_each_entry_safe(page, next, &gmap->crst_list, lru)
   203			__free_pages(page, CRST_ALLOC_ORDER);
   204		gmap_radix_tree_free(&gmap->guest_to_host);
   205		gmap_radix_tree_free(&gmap->host_to_guest);
   206	
   207		/* Free additional data for a shadow gmap */
   208		if (gmap_is_shadow(gmap)) {
   209			struct ptdesc *ptdesc;
   210	
   211			/* Free all page tables. */
 > 212			list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
   213				page_table_free_pgste(ptdesc);
   214			gmap_rmap_radix_tree_free(&gmap->host_to_rmap);
   215			/* Release reference to the parent */
   216			gmap_put(gmap->parent);
   217		}
   218	
   219		kfree(gmap);
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
