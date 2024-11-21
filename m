Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69F113C908;
	Thu, 21 Nov 2024 02:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732157667; cv=none; b=PgEQ+3IxMByAihGVOffBPhBsL2V+WtvYtes2UcuIKBtzOduY0f7c+3XlRXIjGiUU9PPHn2B2aR66OhJ50KPGMUHQk8O6Zt4j3UTFvHsTrz5y8+Muo31r33I1LmGIjCGEzdDP2I4+0v+7dhO6T6HF2G/S7DEaWKhohblxcnZaLCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732157667; c=relaxed/simple;
	bh=PcHelDpKRxI0VAoLSztkn+DU0rzWD4LZzn5cgYG86Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gxjv16Cj0gZ+vx/Je/x8EoCHnX/y/ZEnpD/1SQJEFUdpJNP3zlRyUdDb2JjQbkdgcOhpr7oJ+/9wb71AcBf9JxGB3AFtBSjnvuXULzRyq9q5dXbpa2ZmZe/OvdfKFFkoV5tdm8haXZxgEvJm4vsfkFslg5Pn6MbTypu+98zqKxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdJPTcEz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdJPTcEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732157665; x=1763693665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PcHelDpKRxI0VAoLSztkn+DU0rzWD4LZzn5cgYG86Rg=;
  b=cdJPTcEzGGoART/MXRpMUWKIUO9Wy3g24DTqebmI2rTBIZJ0T4ao+zcS
   1rd3rjb/4qGWhVYgRBRfPaOUnwNJijez7FNloJKsr6sjfbNHrxogdMWwi
   YKovbUS5cb/M0NhbTSZZm9ymqI2cde/5z93TMRStWNpzVowRtMhOy4fhG
   kysUhxOFNsUSVNYuM6gM1/JtIyRgxVxgJMr109n2sDmAPRPslbSGmu1Qr
   tQtCewywOJxOU+9t4YFSw8PyTcmOJROxAgejQ5uRShtqyNwZATz5p/s3J
   8J29poMOlzG5/E8a3ellpHpfDIxeaz3u/mYAgJRh2XtVUIqX6xU4mu52e
   g==;
X-CSE-ConnectionGUID: vnGtGXLRRG2ZXm3RilMd0Q==
X-CSE-MsgGUID: MWlIHwZiR7GeS1DDZV5wHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32364796"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="32364796"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 18:54:24 -0800
X-CSE-ConnectionGUID: TQyIjapsThqaMrBMJ3F2xQ==
X-CSE-MsgGUID: ApdKwCh2QyahFXt+/vPOig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95180002"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2024 18:54:23 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDxKm-0001Vn-11;
	Thu, 21 Nov 2024 02:54:20 +0000
Date: Thu, 21 Nov 2024 10:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 4/4] include/linux/migrate.h:161:54:
 warning: omitting the parameter name in a function definition is a C23
 extension
Message-ID: <202411211024.kwlOVfSJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   22a918e8984faca048ec24295ed20e91b682a03e
commit: 22a918e8984faca048ec24295ed20e91b682a03e [4/4] migrate,sysfs: add pagecache promotion
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241121/202411211024.kwlOVfSJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211024.kwlOVfSJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211024.kwlOVfSJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:15:
   In file included from include/linux/dax.h:6:
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
   In file included from mm/filemap.c:45:
>> include/linux/migrate.h:161:54: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     161 | static inline void promotion_candidate(struct folio *)
         |                                                      ^
   In file included from mm/filemap.c:52:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   7 warnings generated.
--
   In file included from mm/swap.c:17:
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
   In file included from mm/swap.c:26:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/swap.c:40:
>> include/linux/migrate.h:161:54: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     161 | static inline void promotion_candidate(struct folio *)
         |                                                      ^
   7 warnings generated.
--
   In file included from mm/vmscan.c:15:
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
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:42:
>> include/linux/migrate.h:161:54: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     161 | static inline void promotion_candidate(struct folio *)
         |                                                      ^
   mm/vmscan.c:401:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     401 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1729:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1729 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2234:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2234 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2235:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2235 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6250:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6250 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   12 warnings generated.
--
   In file included from mm/memory.c:44:
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
   In file included from mm/memory.c:45:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:48:
>> include/linux/sched/numa_balancing.h:56:5: warning: no previous prototype for function 'numa_hint_fault_latency' [-Wmissing-prototypes]
      56 | int numa_hint_fault_latency(struct folio *folio)
         |     ^
   include/linux/sched/numa_balancing.h:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | int numa_hint_fault_latency(struct folio *folio)
         | ^
         | static 
   In file included from mm/memory.c:69:
>> include/linux/migrate.h:161:54: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     161 | static inline void promotion_candidate(struct folio *)
         |                                                      ^
   mm/memory.c:5450:20: error: use of undeclared identifier 'NUMA_HINT_FAULTS'
    5450 |         int event = vmf ? NUMA_HINT_FAULTS : NUMA_HINT_PAGE_CACHE;
         |                           ^
   mm/memory.c:5450:39: error: use of undeclared identifier 'NUMA_HINT_PAGE_CACHE'
    5450 |         int event = vmf ? NUMA_HINT_FAULTS : NUMA_HINT_PAGE_CACHE;
         |                                              ^
   8 warnings and 2 errors generated.
--
   In file included from mm/page_alloc.c:19:
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
   In file included from mm/page_alloc.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:46:
>> include/linux/migrate.h:161:54: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     161 | static inline void promotion_candidate(struct folio *)
         |                                                      ^
   mm/page_alloc.c:2912:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2912 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:3029:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3029 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:4671:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4671 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   10 warnings generated.
--
   In file included from mm/mempolicy.c:80:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:8:
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
   In file included from mm/mempolicy.c:87:
>> include/linux/sched/numa_balancing.h:56:5: warning: no previous prototype for function 'numa_hint_fault_latency' [-Wmissing-prototypes]
      56 | int numa_hint_fault_latency(struct folio *folio)
         |     ^
   include/linux/sched/numa_balancing.h:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | int numa_hint_fault_latency(struct folio *folio)
         | ^
         | static 
   In file included from mm/mempolicy.c:102:
>> include/linux/migrate.h:161:54: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     161 | static inline void promotion_candidate(struct folio *)
         |                                                      ^
   In file included from mm/mempolicy.c:108:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   8 warnings generated.
--
   In file included from mm/migrate.c:16:
   In file included from include/linux/migrate.h:5:
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
   In file included from mm/migrate.c:16:
>> include/linux/migrate.h:161:54: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     161 | static inline void promotion_candidate(struct folio *)
         |                                                      ^
   In file included from mm/migrate.c:22:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/migrate.c:47:
>> include/linux/sched/numa_balancing.h:56:5: warning: no previous prototype for function 'numa_hint_fault_latency' [-Wmissing-prototypes]
      56 | int numa_hint_fault_latency(struct folio *folio)
         |     ^
   include/linux/sched/numa_balancing.h:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | int numa_hint_fault_latency(struct folio *folio)
         | ^
         | static 
   8 warnings generated.
..


vim +161 include/linux/migrate.h

   143	
   144	#ifdef CONFIG_NUMA_BALANCING
   145	int migrate_misplaced_folio_prepare(struct folio *folio,
   146			struct vm_area_struct *vma, int node);
   147	int migrate_misplaced_folio(struct folio *folio, struct vm_area_struct *vma,
   148				   int node);
   149	void promotion_candidate(struct folio *);
   150	#else
   151	static inline int migrate_misplaced_folio_prepare(struct folio *folio,
   152			struct vm_area_struct *vma, int node)
   153	{
   154		return -EAGAIN; /* can't migrate now */
   155	}
   156	static inline int migrate_misplaced_folio(struct folio *folio,
   157						 struct vm_area_struct *vma, int node)
   158	{
   159		return -EAGAIN; /* can't migrate now */
   160	}
 > 161	static inline void promotion_candidate(struct folio *)
   162	{
   163		return;
   164	}
   165	#endif /* CONFIG_NUMA_BALANCING */
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
