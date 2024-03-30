Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9861C0DEA;
	Sat, 30 Mar 2024 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711786588; cv=none; b=MqEa/t5LMtDEEHH1kNi05jSjxQLd3M+iqN8gsLOyT5nT8qXjoNTDRHgi06OmGS/X3Mf8m9HjFYsrtRJaOgobCmQXm/XqZqYKw5Gn4TkuKCbURlIOQYZHM6SLemlbLDIe/oC6UsJAcl7pw6bKJ5bVpAIrZh7xB6Z9PJhgHXxtEiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711786588; c=relaxed/simple;
	bh=E5Ix7lgKsNqt9+1qfYXO6q4YUdDLu8t847RN4aXEa4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXKc8axBv//E66qolTuRIVO+2t0b9sI6JiFQ0O3BXDQDycSBpcquVVdwhiN9onulUnSIh7UCYb7TAZpCG4Q9SF9bXVb5Oh4IV7C8/yM+ZfXFOZgDPRu3qpVSBcSjcDnVq4Gdf4EXM008kNp1uVM5tIgNzZpHJU9nKOTeVJ2Zwak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxJOZxPS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxJOZxPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711786586; x=1743322586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E5Ix7lgKsNqt9+1qfYXO6q4YUdDLu8t847RN4aXEa4M=;
  b=DxJOZxPSlKtxGzppdmUK8pwe1NaofGdjWO4fCg8hD1U6yvImT4QOe4vA
   fG0SCLCbNArJ4AslLrZvxHCazlVqbEDTE/acnVPCChotDD9+YeQ+LGFAl
   Bx7jqNYdLHRmJK/pDw8u2rBF1kzOAPctzLAiitp8T++Rhto95wPjgtICh
   PX2W9H6SMaAuLru6eG9+o4g6TWm3yhKpTaoT4Qv8h2NssqT2e8v/R5XBu
   KFucXlFhQa6CuaIGGd2m/JUIkPnRlZOhzit5hcz/zo4/mt60BVAjXEBy2
   rMK1WVXMia1kqGZTTMwb07Bj7pNUS4V9F2SvRwZo9+bis8I60ZFDBhM4A
   Q==;
X-CSE-ConnectionGUID: 8jp/l6vMSwKvthP4fWIpOg==
X-CSE-MsgGUID: kmEBFdDhRDGxiATt/uyruQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="9920092"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="9920092"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 01:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17259534"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2024 01:16:24 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqTt0-00044g-0Y;
	Sat, 30 Mar 2024 08:16:22 +0000
Date: Sat, 30 Mar 2024 16:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yuanchu Xie <yuanchu@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 2/8] mm: aggregate working set information into
 histograms
Message-ID: <202403301646.6FJ4eUMp-lkp@intel.com>
References: <20240327213108.2384666-3-yuanchu@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327213108.2384666-3-yuanchu@google.com>

Hi Yuanchu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.8]
[cannot apply to akpm-mm/mm-everything driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.9-rc1 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanchu-Xie/mm-multi-gen-LRU-ignore-non-leaf-pmd_young-for-force_scan-true/20240328-053344
base:   v6.8
patch link:    https://lore.kernel.org/r/20240327213108.2384666-3-yuanchu%40google.com
patch subject: [RFC PATCH v3 2/8] mm: aggregate working set information into histograms
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240330/202403301646.6FJ4eUMp-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 79ba323bdd0843275019e16b6e9b35133677c514)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403301646.6FJ4eUMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403301646.6FJ4eUMp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmscan.c:15:
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
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:376:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     376 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1688:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1688 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2194:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2194 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2195:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2195 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
>> mm/vmscan.c:3819:6: warning: no previous prototype for function 'try_to_inc_max_seq' [-Wmissing-prototypes]
    3819 | bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
         |      ^
   mm/vmscan.c:3819:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3819 | bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
         | ^
         | static 
   mm/vmscan.c:4375:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4375 |                         __count_zid_vm_events(PGSCAN_SKIP, zone, skipped_zone);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:6231:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6231 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   14 warnings generated.


vim +/try_to_inc_max_seq +3819 mm/vmscan.c

  3818	
> 3819	bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
  3820				       struct scan_control *sc, bool can_swap, bool force_scan)
  3821	{
  3822		bool success;
  3823		struct lru_gen_mm_walk *walk;
  3824		struct mm_struct *mm = NULL;
  3825		struct lru_gen_folio *lrugen = &lruvec->lrugen;
  3826		struct lru_gen_mm_state *mm_state = get_mm_state(lruvec);
  3827	
  3828		VM_WARN_ON_ONCE(max_seq > READ_ONCE(lrugen->max_seq));
  3829	
  3830		if (!mm_state)
  3831			return inc_max_seq(lruvec, max_seq, can_swap, force_scan);
  3832	
  3833		/* see the comment in iterate_mm_list() */
  3834		if (max_seq <= READ_ONCE(mm_state->seq))
  3835			return false;
  3836	
  3837		/*
  3838		 * If the hardware doesn't automatically set the accessed bit, fallback
  3839		 * to lru_gen_look_around(), which only clears the accessed bit in a
  3840		 * handful of PTEs. Spreading the work out over a period of time usually
  3841		 * is less efficient, but it avoids bursty page faults.
  3842		 */
  3843		if (!should_walk_mmu()) {
  3844			success = iterate_mm_list_nowalk(lruvec, max_seq);
  3845			goto done;
  3846		}
  3847	
  3848		walk = set_mm_walk(NULL, true);
  3849		if (!walk) {
  3850			success = iterate_mm_list_nowalk(lruvec, max_seq);
  3851			goto done;
  3852		}
  3853	
  3854		walk->lruvec = lruvec;
  3855		walk->max_seq = max_seq;
  3856		walk->can_swap = can_swap;
  3857		walk->force_scan = force_scan;
  3858	
  3859		do {
  3860			success = iterate_mm_list(lruvec, walk, &mm);
  3861			if (mm)
  3862				walk_mm(lruvec, mm, walk);
  3863		} while (mm);
  3864	done:
  3865		if (success) {
  3866			success = inc_max_seq(lruvec, max_seq, can_swap, force_scan);
  3867			WARN_ON_ONCE(!success);
  3868		}
  3869	
  3870		return success;
  3871	}
  3872	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
