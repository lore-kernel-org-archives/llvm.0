Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9021F1E8855;
	Wed, 19 Mar 2025 19:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742413601; cv=none; b=q1yrBr26ijkjcJ9AyB6xZjmEWFCF0c9FY6T49wj9H00g1sVG2kK/gh/DN5NLiG7MhPxSNPFC487t2+FhNoJe0x2/01m+7W9EJUeoUKjuXrFKy3k66Kcr8aWeBYlv4RN4bbfZ+ZTedbDYFlx7+M/DzvYkOTh+e40hJFA1tXwCrQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742413601; c=relaxed/simple;
	bh=zIt/briI7E62awuOuyb144yVJIHIoHC1WqOOgCWLKH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k665/jiy5tPB5UbcQKR4WNlHKZOda4LWpQOEfWwbtdFa0MX0EZeQr4kyrnu2yuAD/UAKXZ+SpN6Etl4RY4G4W2d+IfcY7w8PDcgGXQR16UGjA+Ap9UXFw7R6KYkOtQy2aHQxVyd8GlUgG4zSAaCEzxkxbDFVCQgPk33I1Sofouc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ao73Ao3r; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ao73Ao3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742413600; x=1773949600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zIt/briI7E62awuOuyb144yVJIHIoHC1WqOOgCWLKH8=;
  b=ao73Ao3r4LLO+gjeUY+MGdqbEXJ7q+7Se3s6ecITiazubAlDq5NBK5SA
   9+/ANtUopBtNZ6DR6cEzQqgT/ZqmDcGv168PbyixxjwNTYyMJf6D6SpMV
   MGYyVvqa6LRNpN8fAzOTYnFajlOgBrmEbk7HbAu0FDaOeT4s/D4lKEeX6
   zcruwuDQc35mdV6zx9Le/UbN0zKJ50RVdnsin0BnomftBe4VKkLqYKXRy
   R67ciNuPmL9sgoBXmvvsEsLZVieGOoLTUyFHUF7xBFkf5WpzFdbEGVItr
   s1cKD6BSouxL2iHCqwFxHHQ2NXe8UI7iKScKCXTll5RQYj8XMv2YNYAwc
   Q==;
X-CSE-ConnectionGUID: 9lJbOoulSJeOBVwrs/uDCQ==
X-CSE-MsgGUID: Sc/1ItKSTKSvGqFN4JcDqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="42795755"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="42795755"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 12:46:39 -0700
X-CSE-ConnectionGUID: 9FGf09eYQTm50QkbpA2xTw==
X-CSE-MsgGUID: 7pVZh02WT9C9rkKczWyMkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="145968012"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Mar 2025 12:46:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuzN4-000Fda-1E;
	Wed, 19 Mar 2025 19:46:34 +0000
Date: Thu, 20 Mar 2025 03:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/3] x86/fred: Allow variable-sized event frame
Message-ID: <202503200325.iKcHqUsb-lkp@intel.com>
References: <20250319071009.1390984-2-xin@zytor.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319071009.1390984-2-xin@zytor.com>

Hi Xin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 60c162a51180cb2b05d7505a565ab079bfa9cf12]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Li-Intel/x86-fred-Allow-variable-sized-event-frame/20250319-151307
base:   60c162a51180cb2b05d7505a565ab079bfa9cf12
patch link:    https://lore.kernel.org/r/20250319071009.1390984-2-xin%40zytor.com
patch subject: [PATCH v3 1/3] x86/fred: Allow variable-sized event frame
config: i386-buildonly-randconfig-003-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200325.iKcHqUsb-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200325.iKcHqUsb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200325.iKcHqUsb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> init/init_task.c:68:17: error: use of undeclared identifier '__top_init_kernel_stack'
      68 |         .thread_info    = INIT_THREAD_INFO(init_task),
         |                           ^
   arch/x86/include/asm/thread_info.h:76:36: note: expanded from macro 'INIT_THREAD_INFO'
      76 |         .user_pt_regs   = (struct pt_regs *)__top_init_kernel_stack,    \
         |                                             ^
   1 error generated.


vim +/__top_init_kernel_stack +68 init/init_task.c

d08b9f0ca6605e Sami Tolvanen             2020-04-27   61  
d11ed3ab3166a2 David Howells             2018-01-02   62  /*
d11ed3ab3166a2 David Howells             2018-01-02   63   * Set up the first task table, touch at your own risk!. Base=0,
d11ed3ab3166a2 David Howells             2018-01-02   64   * limit=0x1fffff (=2MB)
d11ed3ab3166a2 David Howells             2018-01-02   65   */
0eb5085c38749f Heiko Carstens            2023-11-16   66  struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
4e7e3adbba5224 David Howells             2018-01-02   67  #ifdef CONFIG_THREAD_INFO_IN_TASK
4e7e3adbba5224 David Howells             2018-01-02  @68  	.thread_info	= INIT_THREAD_INFO(init_task),
f0b89d3958d73c Elena Reshetova           2019-01-18   69  	.stack_refcount	= REFCOUNT_INIT(1),
4e7e3adbba5224 David Howells             2018-01-02   70  #endif
2f064a59a11ff9 Peter Zijlstra            2021-06-11   71  	.__state	= 0,
d11ed3ab3166a2 David Howells             2018-01-02   72  	.stack		= init_stack,
ec1d281923cf81 Elena Reshetova           2019-01-18   73  	.usage		= REFCOUNT_INIT(2),
d11ed3ab3166a2 David Howells             2018-01-02   74  	.flags		= PF_KTHREAD,
d11ed3ab3166a2 David Howells             2018-01-02   75  	.prio		= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells             2018-01-02   76  	.static_prio	= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells             2018-01-02   77  	.normal_prio	= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells             2018-01-02   78  	.policy		= SCHED_NORMAL,
3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23   79  	.cpus_ptr	= &init_task.cpus_mask,
b90ca8badbd114 Will Deacon               2021-07-30   80  	.user_cpus_ptr	= NULL,
3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23   81  	.cpus_mask	= CPU_MASK_ALL,
22d5607400c62c Qais Yousef               2024-03-24   82  	.max_allowed_capacity	= SCHED_CAPACITY_SCALE,
d11ed3ab3166a2 David Howells             2018-01-02   83  	.nr_cpus_allowed= NR_CPUS,
d11ed3ab3166a2 David Howells             2018-01-02   84  	.mm		= NULL,
d11ed3ab3166a2 David Howells             2018-01-02   85  	.active_mm	= &init_mm,
2b69987be575b9 Kent Overstreet           2019-10-16   86  	.faults_disabled_mapping = NULL,
d11ed3ab3166a2 David Howells             2018-01-02   87  	.restart_block	= {
d11ed3ab3166a2 David Howells             2018-01-02   88  		.fn = do_no_restart_syscall,
d11ed3ab3166a2 David Howells             2018-01-02   89  	},
d11ed3ab3166a2 David Howells             2018-01-02   90  	.se		= {
d11ed3ab3166a2 David Howells             2018-01-02   91  		.group_node 	= LIST_HEAD_INIT(init_task.se.group_node),
d11ed3ab3166a2 David Howells             2018-01-02   92  	},
d11ed3ab3166a2 David Howells             2018-01-02   93  	.rt		= {
d11ed3ab3166a2 David Howells             2018-01-02   94  		.run_list	= LIST_HEAD_INIT(init_task.rt.run_list),
d11ed3ab3166a2 David Howells             2018-01-02   95  		.time_slice	= RR_TIMESLICE,
d11ed3ab3166a2 David Howells             2018-01-02   96  	},
d11ed3ab3166a2 David Howells             2018-01-02   97  	.tasks		= LIST_HEAD_INIT(init_task.tasks),
4e7e3adbba5224 David Howells             2018-01-02   98  #ifdef CONFIG_SMP
4e7e3adbba5224 David Howells             2018-01-02   99  	.pushable_tasks	= PLIST_NODE_INIT(init_task.pushable_tasks, MAX_PRIO),
4e7e3adbba5224 David Howells             2018-01-02  100  #endif
4e7e3adbba5224 David Howells             2018-01-02  101  #ifdef CONFIG_CGROUP_SCHED
4e7e3adbba5224 David Howells             2018-01-02  102  	.sched_task_group = &root_task_group,
f0e1a0643a59bf Tejun Heo                 2024-06-18  103  #endif
f0e1a0643a59bf Tejun Heo                 2024-06-18  104  #ifdef CONFIG_SCHED_CLASS_EXT
f0e1a0643a59bf Tejun Heo                 2024-06-18  105  	.scx		= {
d4af01c3731ff9 Tejun Heo                 2024-07-08  106  		.dsq_list.node	= LIST_HEAD_INIT(init_task.scx.dsq_list.node),
f0e1a0643a59bf Tejun Heo                 2024-06-18  107  		.sticky_cpu	= -1,
f0e1a0643a59bf Tejun Heo                 2024-06-18  108  		.holding_cpu	= -1,
f0e1a0643a59bf Tejun Heo                 2024-06-18  109  		.runnable_node	= LIST_HEAD_INIT(init_task.scx.runnable_node),
8a010b81b3a50b David Vernet              2024-06-18  110  		.runnable_at	= INITIAL_JIFFIES,
f0e1a0643a59bf Tejun Heo                 2024-06-18  111  		.ddsp_dsq_id	= SCX_DSQ_INVALID,
f0e1a0643a59bf Tejun Heo                 2024-06-18  112  		.slice		= SCX_SLICE_DFL,
f0e1a0643a59bf Tejun Heo                 2024-06-18  113  	},
4e7e3adbba5224 David Howells             2018-01-02  114  #endif
d11ed3ab3166a2 David Howells             2018-01-02  115  	.ptraced	= LIST_HEAD_INIT(init_task.ptraced),
d11ed3ab3166a2 David Howells             2018-01-02  116  	.ptrace_entry	= LIST_HEAD_INIT(init_task.ptrace_entry),
d11ed3ab3166a2 David Howells             2018-01-02  117  	.real_parent	= &init_task,
d11ed3ab3166a2 David Howells             2018-01-02  118  	.parent		= &init_task,
d11ed3ab3166a2 David Howells             2018-01-02  119  	.children	= LIST_HEAD_INIT(init_task.children),
d11ed3ab3166a2 David Howells             2018-01-02  120  	.sibling	= LIST_HEAD_INIT(init_task.sibling),
d11ed3ab3166a2 David Howells             2018-01-02  121  	.group_leader	= &init_task,
d11ed3ab3166a2 David Howells             2018-01-02  122  	RCU_POINTER_INITIALIZER(real_cred, &init_cred),
d11ed3ab3166a2 David Howells             2018-01-02  123  	RCU_POINTER_INITIALIZER(cred, &init_cred),
d11ed3ab3166a2 David Howells             2018-01-02  124  	.comm		= INIT_TASK_COMM,
d11ed3ab3166a2 David Howells             2018-01-02  125  	.thread		= INIT_THREAD,
d11ed3ab3166a2 David Howells             2018-01-02  126  	.fs		= &init_fs,
d11ed3ab3166a2 David Howells             2018-01-02  127  	.files		= &init_files,
0f2122045b9462 Jens Axboe                2020-09-13  128  #ifdef CONFIG_IO_URING
0f2122045b9462 Jens Axboe                2020-09-13  129  	.io_uring	= NULL,
0f2122045b9462 Jens Axboe                2020-09-13  130  #endif
d11ed3ab3166a2 David Howells             2018-01-02  131  	.signal		= &init_signals,
d11ed3ab3166a2 David Howells             2018-01-02  132  	.sighand	= &init_sighand,
d11ed3ab3166a2 David Howells             2018-01-02  133  	.nsproxy	= &init_nsproxy,
d11ed3ab3166a2 David Howells             2018-01-02  134  	.pending	= {
d11ed3ab3166a2 David Howells             2018-01-02  135  		.list = LIST_HEAD_INIT(init_task.pending.list),
d11ed3ab3166a2 David Howells             2018-01-02  136  		.signal = {{0}}
d11ed3ab3166a2 David Howells             2018-01-02  137  	},
d11ed3ab3166a2 David Howells             2018-01-02  138  	.blocked	= {{0}},
d11ed3ab3166a2 David Howells             2018-01-02  139  	.alloc_lock	= __SPIN_LOCK_UNLOCKED(init_task.alloc_lock),
d11ed3ab3166a2 David Howells             2018-01-02  140  	.journal_info	= NULL,
d11ed3ab3166a2 David Howells             2018-01-02  141  	INIT_CPU_TIMERS(init_task)
d11ed3ab3166a2 David Howells             2018-01-02  142  	.pi_lock	= __RAW_SPIN_LOCK_UNLOCKED(init_task.pi_lock),
d11ed3ab3166a2 David Howells             2018-01-02  143  	.timer_slack_ns = 50000, /* 50 usec default slack */
2c4704756cab7c Eric W. Biederman         2017-09-26  144  	.thread_pid	= &init_struct_pid,
d11ed3ab3166a2 David Howells             2018-01-02  145  	.thread_node	= LIST_HEAD_INIT(init_signals.thread_head),
4b7d248b3a1de4 Richard Guy Briggs        2019-01-22  146  #ifdef CONFIG_AUDIT
4e7e3adbba5224 David Howells             2018-01-02  147  	.loginuid	= INVALID_UID,
f0b752168d7091 Richard Guy Briggs        2018-05-12  148  	.sessionid	= AUDIT_SID_UNSET,
4e7e3adbba5224 David Howells             2018-01-02  149  #endif
4e7e3adbba5224 David Howells             2018-01-02  150  #ifdef CONFIG_PERF_EVENTS
4e7e3adbba5224 David Howells             2018-01-02  151  	.perf_event_mutex = __MUTEX_INITIALIZER(init_task.perf_event_mutex),
4e7e3adbba5224 David Howells             2018-01-02  152  	.perf_event_list = LIST_HEAD_INIT(init_task.perf_event_list),
4e7e3adbba5224 David Howells             2018-01-02  153  #endif
4e7e3adbba5224 David Howells             2018-01-02  154  #ifdef CONFIG_PREEMPT_RCU
4e7e3adbba5224 David Howells             2018-01-02  155  	.rcu_read_lock_nesting = 0,
4e7e3adbba5224 David Howells             2018-01-02  156  	.rcu_read_unlock_special.s = 0,
4e7e3adbba5224 David Howells             2018-01-02  157  	.rcu_node_entry = LIST_HEAD_INIT(init_task.rcu_node_entry),
4e7e3adbba5224 David Howells             2018-01-02  158  	.rcu_blocked_node = NULL,
4e7e3adbba5224 David Howells             2018-01-02  159  #endif
4e7e3adbba5224 David Howells             2018-01-02  160  #ifdef CONFIG_TASKS_RCU
4e7e3adbba5224 David Howells             2018-01-02  161  	.rcu_tasks_holdout = false,
4e7e3adbba5224 David Howells             2018-01-02  162  	.rcu_tasks_holdout_list = LIST_HEAD_INIT(init_task.rcu_tasks_holdout_list),
4e7e3adbba5224 David Howells             2018-01-02  163  	.rcu_tasks_idle_cpu = -1,
46faf9d8e1d52e Paul E. McKenney          2024-02-05  164  	.rcu_tasks_exit_list = LIST_HEAD_INIT(init_task.rcu_tasks_exit_list),
4e7e3adbba5224 David Howells             2018-01-02  165  #endif
d5f177d35c2442 Paul E. McKenney          2020-03-09  166  #ifdef CONFIG_TASKS_TRACE_RCU
d5f177d35c2442 Paul E. McKenney          2020-03-09  167  	.trc_reader_nesting = 0,
276c410448dbca Paul E. McKenney          2020-03-17  168  	.trc_reader_special.s = 0,
d5f177d35c2442 Paul E. McKenney          2020-03-09  169  	.trc_holdout_list = LIST_HEAD_INIT(init_task.trc_holdout_list),
434c9eefb959c3 Paul E. McKenney          2022-05-16  170  	.trc_blkd_node = LIST_HEAD_INIT(init_task.trc_blkd_node),
d5f177d35c2442 Paul E. McKenney          2020-03-09  171  #endif
4e7e3adbba5224 David Howells             2018-01-02  172  #ifdef CONFIG_CPUSETS
b75058614fdd31 Ahmed S. Darwish          2020-07-20  173  	.mems_allowed_seq = SEQCNT_SPINLOCK_ZERO(init_task.mems_allowed_seq,
b75058614fdd31 Ahmed S. Darwish          2020-07-20  174  						 &init_task.alloc_lock),
4e7e3adbba5224 David Howells             2018-01-02  175  #endif
4e7e3adbba5224 David Howells             2018-01-02  176  #ifdef CONFIG_RT_MUTEXES
4e7e3adbba5224 David Howells             2018-01-02  177  	.pi_waiters	= RB_ROOT_CACHED,
4e7e3adbba5224 David Howells             2018-01-02  178  	.pi_top_task	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  179  #endif
d11ed3ab3166a2 David Howells             2018-01-02  180  	INIT_PREV_CPUTIME(init_task)
4e7e3adbba5224 David Howells             2018-01-02  181  #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
4e7e3adbba5224 David Howells             2018-01-02  182  	.vtime.seqcount	= SEQCNT_ZERO(init_task.vtime_seqcount),
4e7e3adbba5224 David Howells             2018-01-02  183  	.vtime.starttime = 0,
4e7e3adbba5224 David Howells             2018-01-02  184  	.vtime.state	= VTIME_SYS,
4e7e3adbba5224 David Howells             2018-01-02  185  #endif
4e7e3adbba5224 David Howells             2018-01-02  186  #ifdef CONFIG_NUMA_BALANCING
98fa15f34cb379 Anshuman Khandual         2019-03-05  187  	.numa_preferred_nid = NUMA_NO_NODE,
4e7e3adbba5224 David Howells             2018-01-02  188  	.numa_group	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  189  	.numa_faults	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  190  #endif
d73b49365ee65a Andrey Konovalov          2020-12-22  191  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
4e7e3adbba5224 David Howells             2018-01-02  192  	.kasan_depth	= 1,
4e7e3adbba5224 David Howells             2018-01-02  193  #endif
dfd402a4c4baae Marco Elver               2019-11-14  194  #ifdef CONFIG_KCSAN
dfd402a4c4baae Marco Elver               2019-11-14  195  	.kcsan_ctx = {
757a4cefde7669 Marco Elver               2020-03-25  196  		.scoped_accesses	= {LIST_POISON1, NULL},
dfd402a4c4baae Marco Elver               2019-11-14  197  	},
dfd402a4c4baae Marco Elver               2019-11-14  198  #endif
4e7e3adbba5224 David Howells             2018-01-02  199  #ifdef CONFIG_TRACE_IRQFLAGS
4e7e3adbba5224 David Howells             2018-01-02  200  	.softirqs_enabled = 1,
4e7e3adbba5224 David Howells             2018-01-02  201  #endif
4e7e3adbba5224 David Howells             2018-01-02  202  #ifdef CONFIG_LOCKDEP
e196e479a3b844 Yuyang Du                 2019-05-06  203  	.lockdep_depth = 0, /* no locks held yet */
f6ec8829ac9d59 Yuyang Du                 2019-05-06  204  	.curr_chain_key = INITIAL_CHAIN_KEY,
4e7e3adbba5224 David Howells             2018-01-02  205  	.lockdep_recursion = 0,
4e7e3adbba5224 David Howells             2018-01-02  206  #endif
4e7e3adbba5224 David Howells             2018-01-02  207  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
4e7e3adbba5224 David Howells             2018-01-02  208  	.ret_stack		= NULL,
7e0a9220467dbc Steven Rostedt (VMware    2021-01-29  209) 	.tracing_graph_pause	= ATOMIC_INIT(0),
4e7e3adbba5224 David Howells             2018-01-02  210  #endif
c1a280b68d4e6b Thomas Gleixner           2019-07-26  211  #if defined(CONFIG_TRACING) && defined(CONFIG_PREEMPTION)
4e7e3adbba5224 David Howells             2018-01-02  212  	.trace_recursion = 0,
4e7e3adbba5224 David Howells             2018-01-02  213  #endif
4e7e3adbba5224 David Howells             2018-01-02  214  #ifdef CONFIG_LIVEPATCH
d927752f287fe1 Wardenjohn                2024-05-07  215  	.patch_state	= KLP_TRANSITION_IDLE,
4e7e3adbba5224 David Howells             2018-01-02  216  #endif
4e7e3adbba5224 David Howells             2018-01-02  217  #ifdef CONFIG_SECURITY
4e7e3adbba5224 David Howells             2018-01-02  218  	.security	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  219  #endif
64bdc0244054f7 Kenta.Tada@sony.com       2021-03-21  220  #ifdef CONFIG_SECCOMP_FILTER
c818c03b661cd7 Kees Cook                 2020-05-13  221  	.seccomp	= { .filter_count = ATOMIC_INIT(0) },
c818c03b661cd7 Kees Cook                 2020-05-13  222  #endif
d11ed3ab3166a2 David Howells             2018-01-02  223  };
a4a2eb490e38aa Thomas Gleixner           2012-05-03  224  EXPORT_SYMBOL(init_task);
a4a2eb490e38aa Thomas Gleixner           2012-05-03  225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
