Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D2F1CB310;
	Wed,  6 Nov 2024 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730899455; cv=none; b=lR+oW2Pfr66w2gU4vorFyzOBYAlGNINGIWcuYROT0PeIX80M0IssD4GDPZIYLZf5VwjUg+uPZ8glnT/q2XUAaK7/sywY5M7IfMatZppDl9qzaBq5DM+LGK70Rb+PwsjG9R74P5BVSxnw8tfKkpVM4Zte0ZAQdl3OrxUaKUc63hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730899455; c=relaxed/simple;
	bh=la4Ebtj94mOsj7g5I1iSjX2ivDJvD424D+E14m/cLoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ivtyc4sbuWOmJxvXh4jsHLBjTsH69z+3YITT4PPILbm50GwITSpaWVFBIhfGOCJWxidtC/F+NeZcVZOyOrWajqAHK6VySxinXZPrxH8q+fk3KXxX9W2vPXQ4uW0q732XYgoP04ke2IbokQ+Q+Et41hicUyxzzg8SC9CC8kXFI+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVVeVo59; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVVeVo59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730899452; x=1762435452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=la4Ebtj94mOsj7g5I1iSjX2ivDJvD424D+E14m/cLoE=;
  b=IVVeVo59JnVlCUyd/Cymr2BjqVvO3VyVXQDmnWD/ec6jfaIiwTfCpYVM
   lOfGx8oJ+GQWVWHs3/i0WZJ5V95pjiiPZdBZUFNnZiB/sOP21l34RbKds
   u3NpSPjn1zkVNtlr4qJsOZM4ADDdnyDYXUZ7wlFvXefyDbdwTfqukxXEf
   GVUkvJ7ovhWToiyty8XeigZGxtyzYzYJf21dXo20tJ0BrU8AN50N7OR6t
   U4xRcHQcX6D9HNeyufTBlp1I3tPFkgowpDqQHy38/lrtTMQpgrkqX8HoQ
   nRWHgiQ4dX8VCoZn3o9Mzhod/BQaHBvMAEesWDy4QAFWTb9Z9JwzMWCBy
   Q==;
X-CSE-ConnectionGUID: LJWYdgJYSmyjxW0nl9CBrg==
X-CSE-MsgGUID: OgYDYzelQnehjQEPalv9cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41288507"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="41288507"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:24:11 -0800
X-CSE-ConnectionGUID: kYMgqX+oT2G/Fd4wZsZiug==
X-CSE-MsgGUID: 2pUgKqRHRSWoxMfmMqnJrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="89362759"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2024 05:24:09 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8g10-000oms-30;
	Wed, 06 Nov 2024 13:24:06 +0000
Date: Wed, 6 Nov 2024 21:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <v-songbaohua@oppo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nhat Pham <nphamcs@gmail.com>
Subject: [akpm-mm:mm-unstable 27/106] mm/page_io.c:220:3: error: call to
 undeclared function 'count_objcg_events'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202411062130.JXvq8Cjt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   7994b7ea6ac880efd0c38fedfbffd5ab8b1b7b2b
commit: c10966f19a878a66206327ebe3b85500f59f47e2 [27/106] mm: count zeromap read and set for swapout and swapin
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241106/202411062130.JXvq8Cjt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411062130.JXvq8Cjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411062130.JXvq8Cjt-lkp@intel.com/

Note: the akpm-mm/mm-unstable HEAD 7994b7ea6ac880efd0c38fedfbffd5ab8b1b7b2b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from mm/page_io.c:14:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> mm/page_io.c:220:3: error: call to undeclared function 'count_objcg_events'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     220 |                 count_objcg_events(objcg, SWPOUT_ZERO, nr_pages);
         |                 ^
   mm/page_io.c:220:3: note: did you mean 'count_objcg_event'?
   include/linux/memcontrol.h:1763:20: note: 'count_objcg_event' declared here
    1763 | static inline void count_objcg_event(struct obj_cgroup *objcg,
         |                    ^
   mm/page_io.c:532:3: error: call to undeclared function 'count_objcg_events'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     532 |                 count_objcg_events(objcg, SWPIN_ZERO, nr_pages);
         |                 ^
   4 warnings and 2 errors generated.


vim +/count_objcg_events +220 mm/page_io.c

   204	
   205	static void swap_zeromap_folio_set(struct folio *folio)
   206	{
   207		struct obj_cgroup *objcg = get_obj_cgroup_from_folio(folio);
   208		struct swap_info_struct *sis = swp_swap_info(folio->swap);
   209		int nr_pages = folio_nr_pages(folio);
   210		swp_entry_t entry;
   211		unsigned int i;
   212	
   213		for (i = 0; i < folio_nr_pages(folio); i++) {
   214			entry = page_swap_entry(folio_page(folio, i));
   215			set_bit(swp_offset(entry), sis->zeromap);
   216		}
   217	
   218		count_vm_events(SWPOUT_ZERO, nr_pages);
   219		if (objcg) {
 > 220			count_objcg_events(objcg, SWPOUT_ZERO, nr_pages);
   221			obj_cgroup_put(objcg);
   222		}
   223	}
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
