Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8828984A35;
	Sat, 14 Feb 2026 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771083458; cv=none; b=lb03j4eiGe32hZAA2eHUuszzHdQuiW8b2uhZvZMIyUzG+uND0XgPNR2yal/tecioVHE0uvTZt3rXNtKFnoyUAvFcCVoiu9AY349bPA2ZXIHqo0YzPblosnxjlFu7YLZVqspPYg69dSVAIVU+bRo9qd6EiTIwZM37WbDZzHSCwEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771083458; c=relaxed/simple;
	bh=19Ro5BnSXFj562sQ6jj1pDK460WHV/ysLgzGDuHDTXE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PgfGEw5tiP8xSjbQJH+x3sK3MFvIqpci176KBcLfFgFmC67ShxFtIm9ZryIiW1kNAVsTfOjY03o+UHxUI0ql/pZuF8ELB099fAkXe8knxKAPMxtUpZ97Pq6pHf4YCkba5I8kYrYyPel07REPbDvZcIf1EUeP6MqKHDYv1Q12u1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBVkVbUD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBVkVbUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771083456; x=1802619456;
  h=date:from:to:cc:subject:message-id;
  bh=19Ro5BnSXFj562sQ6jj1pDK460WHV/ysLgzGDuHDTXE=;
  b=lBVkVbUD//ab+WeNKjiYI1Lo74DTZUqEhNzvo+vcCRUuthyNuCy4XI40
   eMH+sSPCvgt7Fs/wxcarKD547tQ8BAi+eF+XA7wyXVDdP5JIFKTht0jM4
   4EvMoMBaFc63HLBBOsamXplzKmw6+bkYIaHn6NMwTjuxpOH7juSCtvH4V
   Mq6O9618ZQwLCmgtGMvNvWl0g4cSAtuphFTxx76h3ay8QWjlz7S+m2pta
   PGH5ejM+MPfa4T9dBDu299YV4mGBBUYaDqvy/xfOI4UpKGEAAWJsZMu/E
   IiJLAhaOjzl4c8R730sxhTNBFeuYIYvvBmlPS7oJa4N+39jFLHtlCpxDi
   Q==;
X-CSE-ConnectionGUID: oq/med4ISLmHSJL1Qu7hIg==
X-CSE-MsgGUID: OljQFlopRumj8L3rrXoQdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="82965595"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="82965595"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 07:37:36 -0800
X-CSE-ConnectionGUID: fp27VHTsRHKUBv5vYVc3qg==
X-CSE-MsgGUID: y6JKlC8MSfu8CDJ2SmqYJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="218160550"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Feb 2026 07:37:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrHi7-00000000wfa-2o9J;
	Sat, 14 Feb 2026 15:37:31 +0000
Date: Sat, 14 Feb 2026 23:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 13/19] include/linux/mm.h:1809:35: warning:
 operator '<<' has lower precedence than '+'; '+' will be evaluated first
Message-ID: <202602142324.QVDVb48H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   c8cade07a55a710c48535164d08894878eeee29f
commit: 3f5d0ecef190d94f72a32f822ec40b4330db8dca [13/19] mm: Introduce mkpte() and folio_mkpte()
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260214/202602142324.QVDVb48H-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602142324.QVDVb48H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602142324.QVDVb48H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:10:
>> include/linux/mm.h:1809:35: warning: operator '<<' has lower precedence than '+'; '+' will be evaluated first [-Wshift-op-parentheses]
    1809 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   include/linux/mm.h:1809:35: note: place parentheses around the '+' expression to silence this warning
    1809 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:10:
   include/linux/mm.h:1828:34: warning: operator '<<' has lower precedence than '+'; '+' will be evaluated first [-Wshift-op-parentheses]
    1828 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                                     ^~~ ~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   include/linux/mm.h:1828:34: note: place parentheses around the '+' expression to silence this warning
    1828 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                                     ^~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   kernel/sched/core.c:2445:20: warning: unused function 'rq_has_pinned_tasks' [-Wunused-function]
    2445 | static inline bool rq_has_pinned_tasks(struct rq *rq)
         |                    ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5795:20: warning: unused function 'sched_tick_stop' [-Wunused-function]
    5795 | static inline void sched_tick_stop(int cpu) { }
         |                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:6514:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
    6514 | static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6515:20: warning: unused function 'sched_core_cpu_dying' [-Wunused-function]
    6515 | static inline void sched_core_cpu_dying(unsigned int cpu) {}
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:8305:20: warning: unused function 'balance_hotplug_wait' [-Wunused-function]
    8305 | static inline void balance_hotplug_wait(void)
         |                    ^~~~~~~~~~~~~~~~~~~~
   7 warnings generated.
--
   In file included from kernel/sched/fair.c:27:
   In file included from include/linux/mm_api.h:1:
>> include/linux/mm.h:1809:35: warning: operator '<<' has lower precedence than '+'; '+' will be evaluated first [-Wshift-op-parentheses]
    1809 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   include/linux/mm.h:1809:35: note: place parentheses around the '+' expression to silence this warning
    1809 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   In file included from kernel/sched/fair.c:27:
   In file included from include/linux/mm_api.h:1:
   include/linux/mm.h:1828:34: warning: operator '<<' has lower precedence than '+'; '+' will be evaluated first [-Wshift-op-parentheses]
    1828 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                                     ^~~ ~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   include/linux/mm.h:1828:34: note: place parentheses around the '+' expression to silence this warning
    1828 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                                     ^~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   kernel/sched/fair.c:482:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
     482 | static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:503:19: warning: unused function 'tg_is_idle' [-Wunused-function]
     503 | static inline int tg_is_idle(struct task_group *tg)
         |                   ^~~~~~~~~~
   kernel/sched/fair.c:3997:20: warning: unused function 'load_avg_is_decayed' [-Wunused-function]
    3997 | static inline bool load_avg_is_decayed(struct sched_avg *sa)
         |                    ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6640:20: warning: unused function 'sync_throttle' [-Wunused-function]
    6640 | static inline void sync_throttle(struct task_group *tg, int cpu) {}
         |                    ^~~~~~~~~~~~~
   kernel/sched/fair.c:6664:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
    6664 | static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
         |                                     ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6668:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
    6668 | static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9986:20: warning: unused function 'check_misfit_status' [-Wunused-function]
     9986 | static inline bool check_misfit_status(struct rq *rq)
          |                    ^~~~~~~~~~~~~~~~~~~
   9 warnings generated.
--
   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:17:
>> include/linux/mm.h:1809:35: warning: operator '<<' has lower precedence than '+'; '+' will be evaluated first [-Wshift-op-parentheses]
    1809 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   include/linux/mm.h:1809:35: note: place parentheses around the '+' expression to silence this warning
    1809 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:17:
   include/linux/mm.h:1828:34: warning: operator '<<' has lower precedence than '+'; '+' will be evaluated first [-Wshift-op-parentheses]
    1828 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                                     ^~~ ~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   include/linux/mm.h:1828:34: note: place parentheses around the '+' expression to silence this warning
    1828 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/hexagon/include/asm/pgtable.h:340:37: note: expanded from macro 'pfn_pte'
     340 | #define pfn_pte(pfn, pgprot) __pte((pfn << PAGE_SHIFT) | pgprot_val(pgprot))
         |                                     ^~~
   arch/hexagon/include/asm/page.h:71:36: note: expanded from macro '__pte'
      71 | #define __pte(x)       ((pte_t) { (x) })
         |                                    ^
   2 warnings generated.


vim +1809 include/linux/mm.h

  1803	
  1804	#ifdef CONFIG_MMU
  1805	static inline pte_t mkpte(struct page *page, unsigned long pteoff, pgprot_t pgprot)
  1806	{
  1807		unsigned long off = pteoff & ((1UL << (PG_SHIFT - PTE_SHIFT)) - 1);
  1808	
> 1809		return pfn_pte(page_to_pfn(page) + off, pgprot);
  1810	}
  1811	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
