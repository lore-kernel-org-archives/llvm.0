Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3C46A2;
	Wed,  6 Sep 2023 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694020127; x=1725556127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Zenomr4zFyEJc1QSg9HdHCSRBWqbdVdlrLzuEGIkzs=;
  b=ehAdRS+nymzRw3ap+/KeoPu/iG6JprojM1AMfB8Rd5m0l/CRUmeoNBiu
   4w2FzHnVDS1zHWiOIs11QpKVd7dWyWlSWXE0V9tQzbmbcQsZVenFy6vcL
   UHLzWi9qlpTZW1YRieHVrJbEeV+uNRiY8jfuM8N8KfvQ2z6icPQ5G+HyH
   rsnMmlzwzsl3iZOIN4+HLfdmHQi9MysOKNQ97X44X3qr4dsY9yahdWXVB
   vD2YM39aekhjZv+oMCx4icgq6Jjq2bdjZiWDnArlu8LulMT0wfumQgAfY
   YLLlkflVztv+Zph2PVrs3QJalt3C5y+0pWTeQbeoPg1AdPDueZGU1Hr4i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="380928232"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="380928232"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072465886"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="1072465886"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Sep 2023 10:08:41 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdw19-0000Qg-1r;
	Wed, 06 Sep 2023 17:08:39 +0000
Date: Thu, 7 Sep 2023 01:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] sched: Implement adaptative rate limiting of
 task migrations
Message-ID: <202309070045.qNEIXYTZ-lkp@intel.com>
References: <20230905171105.1005672-3-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905171105.1005672-3-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master next-20230906]
[cannot apply to v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/sched-Rate-limit-migrations-to-1-per-2ms-per-task/20230906-030116
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20230905171105.1005672-3-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH 2/2] sched: Implement adaptative rate limiting of task migrations
config: s390-randconfig-r025-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070045.qNEIXYTZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070045.qNEIXYTZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070045.qNEIXYTZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:38:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from kernel/sched/fair.c:38:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from kernel/sched/fair.c:38:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   kernel/sched/fair.c:702:6: warning: no previous prototype for function 'update_entity_lag' [-Wmissing-prototypes]
     702 | void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^
   kernel/sched/fair.c:702:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     702 | void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
         | ^
         | static 
   kernel/sched/fair.c:6348:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6348 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
         |      ^
   kernel/sched/fair.c:6348:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6348 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
         | ^
         | static 
>> kernel/sched/fair.c:7956:8: error: call to undeclared function 'sched_clock_stable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7956 |                 if (!sched_clock_stable())
         |                      ^
   kernel/sched/fair.c:7956:8: note: did you mean 'sched_clock_tick'?
   include/linux/sched/clock.h:36:20: note: 'sched_clock_tick' declared here
      36 | static inline void sched_clock_tick(void)
         |                    ^
   kernel/sched/fair.c:7959:8: error: call to undeclared function 'sched_clock_stable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7959 |                 if (!sched_clock_stable())
         |                      ^
   kernel/sched/fair.c:12831:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
    12831 | void free_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:12831:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12831 | void free_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:12833:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
    12833 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          |     ^
   kernel/sched/fair.c:12833:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12833 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          | ^
          | static 
   kernel/sched/fair.c:12838:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
    12838 | void online_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:12838:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12838 | void online_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:12840:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
    12840 | void unregister_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:12840:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12840 | void unregister_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   18 warnings and 2 errors generated.


vim +/sched_clock_stable +7956 kernel/sched/fair.c

  7946	
  7947	static void migrate_task_ratelimit_fair(struct task_struct *p, int new_cpu)
  7948	{
  7949		struct sched_entity *se = &p->se;
  7950		u64 now;
  7951	
  7952		/* Rate limit task migration. */
  7953		now = sched_clock_cpu(task_cpu(p));
  7954		if (now < se->next_migration_time) {
  7955			se->nr_migrations_per_window++;
> 7956			if (!sched_clock_stable())
  7957				se->next_migration_time += sched_clock_cpu(new_cpu) - now;
  7958		} else {
  7959			if (!sched_clock_stable())
  7960				now = sched_clock_cpu(new_cpu);
  7961			se->next_migration_time = now + SCHED_MIGRATION_RATELIMIT_WINDOW;
  7962			if (se->nr_migrations_per_window >= se->quota_migrations_per_window)
  7963				se->quota_migrations_per_window = max(1, se->quota_migrations_per_window >> 1);
  7964			else
  7965				se->quota_migrations_per_window =
  7966					min(SCHED_MIGRATION_QUOTA,
  7967					    se->quota_migrations_per_window + SCHED_MIGRATION_QUOTA_REPLENISH);
  7968			se->nr_migrations_per_window = 1;
  7969		}
  7970	}
  7971	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
