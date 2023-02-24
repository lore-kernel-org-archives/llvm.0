Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10B195;
	Fri, 24 Feb 2023 02:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677207397; x=1708743397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YBa/WdqcjBtMPhGcfy5P2E5pLM1T8hbtlnoXprZDgRM=;
  b=grJ/H67Z7aAjtMVkCqP/OfJQyxfIVBJ2GA6/21/qmv5StqEhglxI3M3y
   6lKZkwAzTqlcbSgol4dF2zr9wObH1xWnIK+cA8+k2p6uOHPLqpruaCzB9
   p0yIawUkMzDtJhu1N7pU6OmYWNhYA/nSYlZ5c5Hy1MAIZcJ4ohoZO55Rf
   kKYHq3/PuS1VsI52fB8tTWPca2Su1YvnQxGjZ92NwpbUTTOo6kuQ7pQPz
   jCdGPMi2bLiO63Iex12El73osvaN6fCqpMtby8cEaehtRyaJHBZafNGGR
   1LCaIk4dMKypm+OogvNvnCFhPpM2izguAKCqtHXW6/YGnHHrIwqOhZRdS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360885151"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="360885151"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 18:56:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="650211784"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="650211784"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Feb 2023 18:56:34 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVOG9-000247-2h;
	Fri, 24 Feb 2023 02:56:33 +0000
Date: Fri, 24 Feb 2023 10:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:parallel-6.2-rc8-part1 9/12] init/init_task.c:115:13: error:
 use of undeclared identifier 'PTREGS_SIZE'
Message-ID: <202302241042.o2K2EE8i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc8-part1
head:   e0efec029d0e793ae4cb53cabbe1392869354a0a
commit: ed1b5345aeb7e1fc3d492521fef15797fe0ae3f7 [9/12] x86/smpboot: Remove initial_stack on 64-bit
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230224/202302241042.o2K2EE8i-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc8-part1
        git checkout ed1b5345aeb7e1fc3d492521fef15797fe0ae3f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302241042.o2K2EE8i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> init/init_task.c:115:13: error: use of undeclared identifier 'PTREGS_SIZE'
           .thread         = INIT_THREAD,
                             ^
   arch/x86/include/asm/processor.h:654:42: note: expanded from macro 'INIT_THREAD'
           .sp     = (unsigned long)&__end_init_task - PTREGS_SIZE,        \
                                                       ^
   1 error generated.


vim +/PTREGS_SIZE +115 init/init_task.c

d08b9f0ca6605e Sami Tolvanen             2020-04-27   59  
d11ed3ab3166a2 David Howells             2018-01-02   60  /*
d11ed3ab3166a2 David Howells             2018-01-02   61   * Set up the first task table, touch at your own risk!. Base=0,
d11ed3ab3166a2 David Howells             2018-01-02   62   * limit=0x1fffff (=2MB)
d11ed3ab3166a2 David Howells             2018-01-02   63   */
0500871f21b237 David Howells             2018-01-02   64  struct task_struct init_task
0500871f21b237 David Howells             2018-01-02   65  #ifdef CONFIG_ARCH_TASK_STRUCT_ON_STACK
0500871f21b237 David Howells             2018-01-02   66  	__init_task_data
0500871f21b237 David Howells             2018-01-02   67  #endif
d0b7213f895cd0 Stafford Horne            2020-06-26   68  	__aligned(L1_CACHE_BYTES)
d11ed3ab3166a2 David Howells             2018-01-02   69  = {
4e7e3adbba5224 David Howells             2018-01-02   70  #ifdef CONFIG_THREAD_INFO_IN_TASK
4e7e3adbba5224 David Howells             2018-01-02   71  	.thread_info	= INIT_THREAD_INFO(init_task),
f0b89d3958d73c Elena Reshetova           2019-01-18   72  	.stack_refcount	= REFCOUNT_INIT(1),
4e7e3adbba5224 David Howells             2018-01-02   73  #endif
2f064a59a11ff9 Peter Zijlstra            2021-06-11   74  	.__state	= 0,
d11ed3ab3166a2 David Howells             2018-01-02   75  	.stack		= init_stack,
ec1d281923cf81 Elena Reshetova           2019-01-18   76  	.usage		= REFCOUNT_INIT(2),
d11ed3ab3166a2 David Howells             2018-01-02   77  	.flags		= PF_KTHREAD,
d11ed3ab3166a2 David Howells             2018-01-02   78  	.prio		= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells             2018-01-02   79  	.static_prio	= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells             2018-01-02   80  	.normal_prio	= MAX_PRIO - 20,
d11ed3ab3166a2 David Howells             2018-01-02   81  	.policy		= SCHED_NORMAL,
3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23   82  	.cpus_ptr	= &init_task.cpus_mask,
b90ca8badbd114 Will Deacon               2021-07-30   83  	.user_cpus_ptr	= NULL,
3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23   84  	.cpus_mask	= CPU_MASK_ALL,
d11ed3ab3166a2 David Howells             2018-01-02   85  	.nr_cpus_allowed= NR_CPUS,
d11ed3ab3166a2 David Howells             2018-01-02   86  	.mm		= NULL,
d11ed3ab3166a2 David Howells             2018-01-02   87  	.active_mm	= &init_mm,
d11ed3ab3166a2 David Howells             2018-01-02   88  	.restart_block	= {
d11ed3ab3166a2 David Howells             2018-01-02   89  		.fn = do_no_restart_syscall,
d11ed3ab3166a2 David Howells             2018-01-02   90  	},
d11ed3ab3166a2 David Howells             2018-01-02   91  	.se		= {
d11ed3ab3166a2 David Howells             2018-01-02   92  		.group_node 	= LIST_HEAD_INIT(init_task.se.group_node),
d11ed3ab3166a2 David Howells             2018-01-02   93  	},
d11ed3ab3166a2 David Howells             2018-01-02   94  	.rt		= {
d11ed3ab3166a2 David Howells             2018-01-02   95  		.run_list	= LIST_HEAD_INIT(init_task.rt.run_list),
d11ed3ab3166a2 David Howells             2018-01-02   96  		.time_slice	= RR_TIMESLICE,
d11ed3ab3166a2 David Howells             2018-01-02   97  	},
d11ed3ab3166a2 David Howells             2018-01-02   98  	.tasks		= LIST_HEAD_INIT(init_task.tasks),
4e7e3adbba5224 David Howells             2018-01-02   99  #ifdef CONFIG_SMP
4e7e3adbba5224 David Howells             2018-01-02  100  	.pushable_tasks	= PLIST_NODE_INIT(init_task.pushable_tasks, MAX_PRIO),
4e7e3adbba5224 David Howells             2018-01-02  101  #endif
4e7e3adbba5224 David Howells             2018-01-02  102  #ifdef CONFIG_CGROUP_SCHED
4e7e3adbba5224 David Howells             2018-01-02  103  	.sched_task_group = &root_task_group,
4e7e3adbba5224 David Howells             2018-01-02  104  #endif
d11ed3ab3166a2 David Howells             2018-01-02  105  	.ptraced	= LIST_HEAD_INIT(init_task.ptraced),
d11ed3ab3166a2 David Howells             2018-01-02  106  	.ptrace_entry	= LIST_HEAD_INIT(init_task.ptrace_entry),
d11ed3ab3166a2 David Howells             2018-01-02  107  	.real_parent	= &init_task,
d11ed3ab3166a2 David Howells             2018-01-02  108  	.parent		= &init_task,
d11ed3ab3166a2 David Howells             2018-01-02  109  	.children	= LIST_HEAD_INIT(init_task.children),
d11ed3ab3166a2 David Howells             2018-01-02  110  	.sibling	= LIST_HEAD_INIT(init_task.sibling),
d11ed3ab3166a2 David Howells             2018-01-02  111  	.group_leader	= &init_task,
d11ed3ab3166a2 David Howells             2018-01-02  112  	RCU_POINTER_INITIALIZER(real_cred, &init_cred),
d11ed3ab3166a2 David Howells             2018-01-02  113  	RCU_POINTER_INITIALIZER(cred, &init_cred),
d11ed3ab3166a2 David Howells             2018-01-02  114  	.comm		= INIT_TASK_COMM,
d11ed3ab3166a2 David Howells             2018-01-02 @115  	.thread		= INIT_THREAD,
d11ed3ab3166a2 David Howells             2018-01-02  116  	.fs		= &init_fs,
d11ed3ab3166a2 David Howells             2018-01-02  117  	.files		= &init_files,
0f2122045b9462 Jens Axboe                2020-09-13  118  #ifdef CONFIG_IO_URING
0f2122045b9462 Jens Axboe                2020-09-13  119  	.io_uring	= NULL,
0f2122045b9462 Jens Axboe                2020-09-13  120  #endif
d11ed3ab3166a2 David Howells             2018-01-02  121  	.signal		= &init_signals,
d11ed3ab3166a2 David Howells             2018-01-02  122  	.sighand	= &init_sighand,
d11ed3ab3166a2 David Howells             2018-01-02  123  	.nsproxy	= &init_nsproxy,
d11ed3ab3166a2 David Howells             2018-01-02  124  	.pending	= {
d11ed3ab3166a2 David Howells             2018-01-02  125  		.list = LIST_HEAD_INIT(init_task.pending.list),
d11ed3ab3166a2 David Howells             2018-01-02  126  		.signal = {{0}}
d11ed3ab3166a2 David Howells             2018-01-02  127  	},
d11ed3ab3166a2 David Howells             2018-01-02  128  	.blocked	= {{0}},
d11ed3ab3166a2 David Howells             2018-01-02  129  	.alloc_lock	= __SPIN_LOCK_UNLOCKED(init_task.alloc_lock),
d11ed3ab3166a2 David Howells             2018-01-02  130  	.journal_info	= NULL,
d11ed3ab3166a2 David Howells             2018-01-02  131  	INIT_CPU_TIMERS(init_task)
d11ed3ab3166a2 David Howells             2018-01-02  132  	.pi_lock	= __RAW_SPIN_LOCK_UNLOCKED(init_task.pi_lock),
d11ed3ab3166a2 David Howells             2018-01-02  133  	.timer_slack_ns = 50000, /* 50 usec default slack */
2c4704756cab7c Eric W. Biederman         2017-09-26  134  	.thread_pid	= &init_struct_pid,
d11ed3ab3166a2 David Howells             2018-01-02  135  	.thread_group	= LIST_HEAD_INIT(init_task.thread_group),
d11ed3ab3166a2 David Howells             2018-01-02  136  	.thread_node	= LIST_HEAD_INIT(init_signals.thread_head),
4b7d248b3a1de4 Richard Guy Briggs        2019-01-22  137  #ifdef CONFIG_AUDIT
4e7e3adbba5224 David Howells             2018-01-02  138  	.loginuid	= INVALID_UID,
f0b752168d7091 Richard Guy Briggs        2018-05-12  139  	.sessionid	= AUDIT_SID_UNSET,
4e7e3adbba5224 David Howells             2018-01-02  140  #endif
4e7e3adbba5224 David Howells             2018-01-02  141  #ifdef CONFIG_PERF_EVENTS
4e7e3adbba5224 David Howells             2018-01-02  142  	.perf_event_mutex = __MUTEX_INITIALIZER(init_task.perf_event_mutex),
4e7e3adbba5224 David Howells             2018-01-02  143  	.perf_event_list = LIST_HEAD_INIT(init_task.perf_event_list),
4e7e3adbba5224 David Howells             2018-01-02  144  #endif
4e7e3adbba5224 David Howells             2018-01-02  145  #ifdef CONFIG_PREEMPT_RCU
4e7e3adbba5224 David Howells             2018-01-02  146  	.rcu_read_lock_nesting = 0,
4e7e3adbba5224 David Howells             2018-01-02  147  	.rcu_read_unlock_special.s = 0,
4e7e3adbba5224 David Howells             2018-01-02  148  	.rcu_node_entry = LIST_HEAD_INIT(init_task.rcu_node_entry),
4e7e3adbba5224 David Howells             2018-01-02  149  	.rcu_blocked_node = NULL,
4e7e3adbba5224 David Howells             2018-01-02  150  #endif
4e7e3adbba5224 David Howells             2018-01-02  151  #ifdef CONFIG_TASKS_RCU
4e7e3adbba5224 David Howells             2018-01-02  152  	.rcu_tasks_holdout = false,
4e7e3adbba5224 David Howells             2018-01-02  153  	.rcu_tasks_holdout_list = LIST_HEAD_INIT(init_task.rcu_tasks_holdout_list),
4e7e3adbba5224 David Howells             2018-01-02  154  	.rcu_tasks_idle_cpu = -1,
4e7e3adbba5224 David Howells             2018-01-02  155  #endif
d5f177d35c2442 Paul E. McKenney          2020-03-09  156  #ifdef CONFIG_TASKS_TRACE_RCU
d5f177d35c2442 Paul E. McKenney          2020-03-09  157  	.trc_reader_nesting = 0,
276c410448dbca Paul E. McKenney          2020-03-17  158  	.trc_reader_special.s = 0,
d5f177d35c2442 Paul E. McKenney          2020-03-09  159  	.trc_holdout_list = LIST_HEAD_INIT(init_task.trc_holdout_list),
434c9eefb959c3 Paul E. McKenney          2022-05-16  160  	.trc_blkd_node = LIST_HEAD_INIT(init_task.trc_blkd_node),
d5f177d35c2442 Paul E. McKenney          2020-03-09  161  #endif
4e7e3adbba5224 David Howells             2018-01-02  162  #ifdef CONFIG_CPUSETS
b75058614fdd31 Ahmed S. Darwish          2020-07-20  163  	.mems_allowed_seq = SEQCNT_SPINLOCK_ZERO(init_task.mems_allowed_seq,
b75058614fdd31 Ahmed S. Darwish          2020-07-20  164  						 &init_task.alloc_lock),
4e7e3adbba5224 David Howells             2018-01-02  165  #endif
4e7e3adbba5224 David Howells             2018-01-02  166  #ifdef CONFIG_RT_MUTEXES
4e7e3adbba5224 David Howells             2018-01-02  167  	.pi_waiters	= RB_ROOT_CACHED,
4e7e3adbba5224 David Howells             2018-01-02  168  	.pi_top_task	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  169  #endif
d11ed3ab3166a2 David Howells             2018-01-02  170  	INIT_PREV_CPUTIME(init_task)
4e7e3adbba5224 David Howells             2018-01-02  171  #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
4e7e3adbba5224 David Howells             2018-01-02  172  	.vtime.seqcount	= SEQCNT_ZERO(init_task.vtime_seqcount),
4e7e3adbba5224 David Howells             2018-01-02  173  	.vtime.starttime = 0,
4e7e3adbba5224 David Howells             2018-01-02  174  	.vtime.state	= VTIME_SYS,
4e7e3adbba5224 David Howells             2018-01-02  175  #endif
4e7e3adbba5224 David Howells             2018-01-02  176  #ifdef CONFIG_NUMA_BALANCING
98fa15f34cb379 Anshuman Khandual         2019-03-05  177  	.numa_preferred_nid = NUMA_NO_NODE,
4e7e3adbba5224 David Howells             2018-01-02  178  	.numa_group	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  179  	.numa_faults	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  180  #endif
d73b49365ee65a Andrey Konovalov          2020-12-22  181  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
4e7e3adbba5224 David Howells             2018-01-02  182  	.kasan_depth	= 1,
4e7e3adbba5224 David Howells             2018-01-02  183  #endif
dfd402a4c4baae Marco Elver               2019-11-14  184  #ifdef CONFIG_KCSAN
dfd402a4c4baae Marco Elver               2019-11-14  185  	.kcsan_ctx = {
757a4cefde7669 Marco Elver               2020-03-25  186  		.scoped_accesses	= {LIST_POISON1, NULL},
dfd402a4c4baae Marco Elver               2019-11-14  187  	},
dfd402a4c4baae Marco Elver               2019-11-14  188  #endif
4e7e3adbba5224 David Howells             2018-01-02  189  #ifdef CONFIG_TRACE_IRQFLAGS
4e7e3adbba5224 David Howells             2018-01-02  190  	.softirqs_enabled = 1,
4e7e3adbba5224 David Howells             2018-01-02  191  #endif
4e7e3adbba5224 David Howells             2018-01-02  192  #ifdef CONFIG_LOCKDEP
e196e479a3b844 Yuyang Du                 2019-05-06  193  	.lockdep_depth = 0, /* no locks held yet */
f6ec8829ac9d59 Yuyang Du                 2019-05-06  194  	.curr_chain_key = INITIAL_CHAIN_KEY,
4e7e3adbba5224 David Howells             2018-01-02  195  	.lockdep_recursion = 0,
4e7e3adbba5224 David Howells             2018-01-02  196  #endif
4e7e3adbba5224 David Howells             2018-01-02  197  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
4e7e3adbba5224 David Howells             2018-01-02  198  	.ret_stack		= NULL,
7e0a9220467dbc Steven Rostedt (VMware    2021-01-29  199) 	.tracing_graph_pause	= ATOMIC_INIT(0),
4e7e3adbba5224 David Howells             2018-01-02  200  #endif
c1a280b68d4e6b Thomas Gleixner           2019-07-26  201  #if defined(CONFIG_TRACING) && defined(CONFIG_PREEMPTION)
4e7e3adbba5224 David Howells             2018-01-02  202  	.trace_recursion = 0,
4e7e3adbba5224 David Howells             2018-01-02  203  #endif
4e7e3adbba5224 David Howells             2018-01-02  204  #ifdef CONFIG_LIVEPATCH
4e7e3adbba5224 David Howells             2018-01-02  205  	.patch_state	= KLP_UNDEFINED,
4e7e3adbba5224 David Howells             2018-01-02  206  #endif
4e7e3adbba5224 David Howells             2018-01-02  207  #ifdef CONFIG_SECURITY
4e7e3adbba5224 David Howells             2018-01-02  208  	.security	= NULL,
4e7e3adbba5224 David Howells             2018-01-02  209  #endif
64bdc0244054f7 Kenta.Tada@sony.com       2021-03-21  210  #ifdef CONFIG_SECCOMP_FILTER
c818c03b661cd7 Kees Cook                 2020-05-13  211  	.seccomp	= { .filter_count = ATOMIC_INIT(0) },
c818c03b661cd7 Kees Cook                 2020-05-13  212  #endif
d11ed3ab3166a2 David Howells             2018-01-02  213  };
a4a2eb490e38aa Thomas Gleixner           2012-05-03  214  EXPORT_SYMBOL(init_task);
a4a2eb490e38aa Thomas Gleixner           2012-05-03  215  

:::::: The code at line 115 was first introduced by commit
:::::: d11ed3ab3166a2bfad60681aebf3e13e1c3408a9 Expand INIT_TASK() in init/init_task.c and remove

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
