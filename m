Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BDA1D515D;
	Mon, 13 Jan 2025 21:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803619; cv=none; b=ca+YFHBIZqGKrmOwgRoJCZeMTl5txNPbgNLdXQl4mjxEYqWMXk24X7vK6Dvxbb88YmvwJ0bnSMgme6yYXr4QPUkYs/S6ZJiBOX1nv7qHTqE/Y76apBc1wzc8BY8purxJ982xzdg9wkxEh94TXeNTY9U0DpdOG+51XdGQltg7aT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803619; c=relaxed/simple;
	bh=9mr3XXOyLgccC0KolBoH+iTWqMFaJxK4A3Azefxmml8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CU0Zq69B7vtHD7ZfmABnS07c5W2gzS5Q0/P+9BvOy660Wo9EIE9GA330DTNhVksFwChDprbHDKYGZYYLOIF2mMKY434rzW/OVXtu8Y74JdDPtZ7x2wCC3Pe9CyIFA9qw/qz8OpQf3uQIXIUT8xTpJWU4O/z6ce4FeWEXQ3ekzzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nehL3i3u; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nehL3i3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736803618; x=1768339618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9mr3XXOyLgccC0KolBoH+iTWqMFaJxK4A3Azefxmml8=;
  b=nehL3i3uiUbUQWTuKpTWK1SvOpy++r3v31jrhX/wjLph5eesqNHyZBUn
   FyTs+iQrt2TVuq6rUguE+1iZc5q4UgEblR5q5V0uddeNBGuielt4RagOr
   7hXDBAoZwFz8ORXRFMWkwIhCyM9j0bR20s07+BFcqPy7PC0Up5epC7QYV
   jR5Yr0GngbyO/mSFI6O3yP2fOUUJHp0AGeYd0w9ZpquZWTZ7Y8ClAA5z0
   er+dG0ZTjjctH2lpHx/eAg3PyiFsB/jIR2PGi30zuH+bUVf93n8islWAR
   9ml2iyiqhyKA7LovzP/ZH9XHO+rPLnG61SLFRLIw+0VtfNiZw8vhzb7hP
   g==;
X-CSE-ConnectionGUID: 9TG6YaMgQQqm/Wvqvkao3Q==
X-CSE-MsgGUID: eam3GDzyR/G/T6Ovvptopg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47749176"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="47749176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 13:26:54 -0800
X-CSE-ConnectionGUID: vhgJPyhwSWGFiAOKClTH6Q==
X-CSE-MsgGUID: tJw2YQUdTy62QCIiUzoB6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141879606"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jan 2025 13:26:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXRxS-000Ngx-1f;
	Mon, 13 Jan 2025 21:26:50 +0000
Date: Tue, 14 Jan 2025 05:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:trylock 23/29] mm/page_alloc.c:7079:46: error: use of
 undeclared identifier 'zone'
Message-ID: <202501140513.Ic3GEBrJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   1b2329dd88553224f4ef9a26e1b22cea83b071a5
commit: da4b036e3dc46bc8ab5add0a7d4944de54182afe [23/29] mm, bpf: Introduce try_alloc_pages() for opportunistic page allocation
config: x86_64-buildonly-randconfig-001-20250114 (https://download.01.org/0day-ci/archive/20250114/202501140513.Ic3GEBrJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501140513.Ic3GEBrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501140513.Ic3GEBrJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_alloc.c:19:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page_alloc.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/page_alloc.c:2938:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2938 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:3055:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3055 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:4698:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4698 |         __count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
>> mm/page_alloc.c:7079:46: error: use of undeclared identifier 'zone'
    7079 |         if (has_unaccepted_memory() && !list_empty(&zone->unaccepted_pages))
         |                                                     ^
   6 warnings and 1 error generated.


vim +/zone +7079 mm/page_alloc.c

  7035	
  7036	struct page *try_alloc_pages_noprof(int nid, unsigned int order)
  7037	{
  7038		/*
  7039		 * Do not specify __GFP_DIRECT_RECLAIM, since direct claim is not allowed.
  7040		 * Do not specify __GFP_KSWAPD_RECLAIM either, since wake up of kswapd
  7041		 * is not safe in arbitrary context.
  7042		 *
  7043		 * These two are the conditions for gfpflags_allow_spinning() being true.
  7044		 *
  7045		 * Specify __GFP_NOWARN since failing try_alloc_pages() is not a reason
  7046		 * to warn. Also warn would trigger printk() which is unsafe from
  7047		 * various contexts. We cannot use printk_deferred_enter() to mitigate,
  7048		 * since the running context is unknown.
  7049		 *
  7050		 * Specify __GFP_ZERO to make sure that call to kmsan_alloc_page() below
  7051		 * is safe in any context. Also zeroing the page is mandatory for
  7052		 * BPF use cases.
  7053		 *
  7054		 * Though __GFP_NOMEMALLOC is not checked in the code path below,
  7055		 * specify it here to highlight that try_alloc_pages()
  7056		 * doesn't want to deplete reserves.
  7057		 */
  7058		gfp_t alloc_gfp = __GFP_NOWARN | __GFP_ZERO | __GFP_NOMEMALLOC;
  7059		unsigned int alloc_flags = ALLOC_TRYLOCK;
  7060		struct alloc_context ac = { };
  7061		struct page *page;
  7062	
  7063		/*
  7064		 * In RT spin_trylock() may call raw_spin_lock() which is unsafe in NMI.
  7065		 * If spin_trylock() is called from hard IRQ the current task may be
  7066		 * waiting for one rt_spin_lock, but rt_spin_trylock() will mark the
  7067		 * task as the owner of another rt_spin_lock which will confuse PI
  7068		 * logic, so return immediately if called form hard IRQ or NMI.
  7069		 *
  7070		 * Note, irqs_disabled() case is ok. This function can be called
  7071		 * from raw_spin_lock_irqsave region.
  7072		 */
  7073		if (IS_ENABLED(CONFIG_PREEMPT_RT) && (in_nmi() || in_hardirq()))
  7074			return NULL;
  7075		if (!pcp_allowed_order(order))
  7076			return NULL;
  7077	
  7078	#ifdef CONFIG_UNACCEPTED_MEMORY
> 7079		if (has_unaccepted_memory() && !list_empty(&zone->unaccepted_pages))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
