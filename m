Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE768137910;
	Wed,  3 Jul 2024 11:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720006815; cv=none; b=B6U9KX1CvozYDBBvCw7dkilnMmjHRZDGQ6O1injcioeEOnP1YUAn4V/9Qi3YYrnswMie0K2WmSjOc1iRj/JyIZ/pgW03zRcj94TbxSnMmwXG5dLnfQV9wVvyeDUsGiY6PDZcNzVmwTXsRwkYdoj7yqPSDcwecJ00uAoZsl3a2Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720006815; c=relaxed/simple;
	bh=gGzduXQsbcHDOGbCXKRFQzBo6s/46Jc9BIE/FSN493k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dxcZa02jBVrVXDec8itYWuqd/ygf0FQF4PqWP/AhfkPz2L7Cys5kzGa7A6zOKK7s7pL2Bg0r2tNdNwQ54o76nKSQGrbx6+WTnuBLbWlDN+uZgpbtAoZ3KRuEomZHXJX+bLm7N67OSL3dRDvDbadKq1h31LHTh1fBh/5BPO+mDqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQOR4v06; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQOR4v06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720006813; x=1751542813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gGzduXQsbcHDOGbCXKRFQzBo6s/46Jc9BIE/FSN493k=;
  b=XQOR4v064lbVAWVIvNamOLaLt8sYoy76WgBf7kXD6flwrt1m7to0Mh9i
   CIqZB/aVVxX3o0JGyt5E2OEjyo6TIStC+Agda7MxulK0eTNngSH/PMh+9
   WrSAIdS0y4FQkorITj+FZcuAK/UN93nfeqV6vR7yrx6fFK5FUkkIsJTUK
   Cqm2QxITnOSd7BjnRYujHXB+h0petUovYzlvWdHLWhy8Q7Ocr84haipf/
   gXFzmSX0WaCaacMG36b0gxjAwE3yAZFak7tI6+G250MsWoCl3+9D36emw
   khW43zZ12fAuga7Q4gyHbqlHPH5gH0WQ8+44npVrdpxKtQRDU0hH798uV
   w==;
X-CSE-ConnectionGUID: XsLJ8iJ/SJeh/N/AmAHucQ==
X-CSE-MsgGUID: Z+fiEW3KSLC4IiD/9EeQcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27835756"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="27835756"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 04:40:12 -0700
X-CSE-ConnectionGUID: 4KJNRBk8TaCHsfFIQTaGOw==
X-CSE-MsgGUID: rdxdzNj3Tqydy6O5puV84Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="51182641"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2024 04:40:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOyLI-000PfQ-30;
	Wed, 03 Jul 2024 11:40:08 +0000
Date: Wed, 3 Jul 2024 19:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 6/6] mm/internal.h:660:2: error: call to
 undeclared function '__folio_prep_large_mapcount_metadata'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202407031902.jUw1oJIv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   ff5e85c45e818366d70159de7e6e0d0cc781d2cb
commit: ff5e85c45e818366d70159de7e6e0d0cc781d2cb [6/6] rmap_id
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240703/202407031902.jUw1oJIv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031902.jUw1oJIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031902.jUw1oJIv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:15:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:2250:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/filemap.c:51:
>> mm/internal.h:660:2: error: call to undeclared function '__folio_prep_large_mapcount_metadata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     660 |         __folio_prep_large_mapcount_metadata(folio, order);
         |         ^
   1 warning and 1 error generated.
--
   In file included from mm/page-writeback.c:20:
   In file included from include/linux/mm.h:2250:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page-writeback.c:40:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/page-writeback.c:43:
>> mm/internal.h:660:2: error: call to undeclared function '__folio_prep_large_mapcount_metadata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     660 |         __folio_prep_large_mapcount_metadata(folio, order);
         |         ^
   3 warnings and 1 error generated.
--
   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2250:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:67:
>> mm/internal.h:660:2: error: call to undeclared function '__folio_prep_large_mapcount_metadata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     660 |         __folio_prep_large_mapcount_metadata(folio, order);
         |         ^
   mm/vmscan.c:401:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     401 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1729:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1729 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2232:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2232 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2233:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2233 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6259:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6259 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings and 1 error generated.
--
   In file included from mm/page_alloc.c:19:
   In file included from include/linux/mm.h:2250:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:59:
>> mm/internal.h:660:2: error: call to undeclared function '__folio_prep_large_mapcount_metadata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     660 |         __folio_prep_large_mapcount_metadata(folio, order);
         |         ^
>> mm/page_alloc.c:1079:4: error: call to undeclared function '__folio_undo_large_mapcount_metadata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1079 |                         __folio_undo_large_mapcount_metadata(page_folio(page),
         |                         ^
   mm/page_alloc.c:2939:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2939 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:3056:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3056 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:4697:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4697 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   6 warnings and 2 errors generated.


vim +/__folio_prep_large_mapcount_metadata +660 mm/internal.h

   650	
   651	static inline void prep_compound_head(struct page *page, unsigned int order)
   652	{
   653		struct folio *folio = (struct folio *)page;
   654	
   655		folio_set_order(folio, order);
   656		atomic_set(&folio->_large_mapcount, -1);
   657		atomic_set(&folio->_entire_mapcount, -1);
   658		atomic_set(&folio->_nr_pages_mapped, 0);
   659		atomic_set(&folio->_pincount, 0);
 > 660		__folio_prep_large_mapcount_metadata(folio, order);
   661		if (order > 1)
   662			INIT_LIST_HEAD(&folio->_deferred_list);
   663	}
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
