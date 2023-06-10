Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64277C2E6;
	Sat, 10 Jun 2023 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686395553; x=1717931553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pf7/McJhbL/163MYUPHbW0LK47faUt40Z5w2ExzAwsU=;
  b=jnSNLPciLsLF5P9aT225Bv4qCOnmtDkUWDs+LeUin8tQDqd0Kt8MNOQq
   TYSjAATE7rA3oMP8OOeBq/DpMG/gJMhF81mBrz1YHqGNDQsWCIZ/AehoU
   D8agVrduYsFk/ImzPJQep8kndVxGbbOR84AE+03RMPwytHIQSvJf9d1TT
   tpVGx22LsTRlZDlPDxR2415LEOKyYtDsfTUc8JpIKQVC0fw8tTBIPiAyw
   zpdMLBw4b08HoHU0JEEd2vEWrX9a9UaZ9assGvmk1HeA7LURo1wiwWk+I
   /SESh8G7gTNbrW86c3sMKs9FHhyTOtxnwrzpZvzFsarbDgopLpsJQtZor
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361117763"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="361117763"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 04:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="688044840"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="688044840"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Jun 2023 04:12:31 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7wWE-000A2f-2c;
	Sat, 10 Jun 2023 11:12:30 +0000
Date: Sat, 10 Jun 2023 19:11:37 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards2 12/58] kernel/sched/core.c:5667:7: error:
 call to undeclared function 'cpu_is_online'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202306101919.Z26XbX9g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards2
head:   7e38bc75e33efb3722a7bfeb15207e61819ca3c8
commit: b8629ae9c880d8e19621e5c7866d217d98fc5288 [12/58] sched: Simplify sched_tick_remote()
config: arm-randconfig-r046-20230610 (https://download.01.org/0day-ci/archive/20230610/202306101919.Z26XbX9g-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=b8629ae9c880d8e19621e5c7866d217d98fc5288
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards2
        git checkout b8629ae9c880d8e19621e5c7866d217d98fc5288
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/sched/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101919.Z26XbX9g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:5667:7: error: call to undeclared function 'cpu_is_online'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   if (cpu_is_online(cpu)) {
                       ^
   kernel/sched/core.c:5667:7: note: did you mean 'cpu_online'?
   include/linux/cpumask.h:1080:20: note: 'cpu_online' declared here
   static inline bool cpu_online(unsigned int cpu)
                      ^
   kernel/sched/core.c:6741:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
   asmlinkage __visible void __sched schedule_user(void)
                                     ^
   kernel/sched/core.c:6741:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage __visible void __sched schedule_user(void)
                        ^
                        static 
   1 warning and 1 error generated.


vim +/cpu_is_online +5667 kernel/sched/core.c

  5647	
  5648	static void sched_tick_remote(struct work_struct *work)
  5649	{
  5650		struct delayed_work *dwork = to_delayed_work(work);
  5651		struct tick_work *twork = container_of(dwork, struct tick_work, work);
  5652		int cpu = twork->cpu;
  5653		struct rq *rq = cpu_rq(cpu);
  5654		int os;
  5655	
  5656		/*
  5657		 * Handle the tick only if it appears the remote CPU is running in full
  5658		 * dynticks mode. The check is racy by nature, but missing a tick or
  5659		 * having one too much is no big deal because the scheduler tick updates
  5660		 * statistics and checks timeslices in a time-independent way, regardless
  5661		 * of when exactly it is running.
  5662		 */
  5663		if (tick_nohz_tick_stopped_cpu(cpu)) {
  5664			guard(rq_lock_irq)(rq);
  5665			struct task_struct *curr = rq->curr;
  5666	
> 5667			if (cpu_is_online(cpu)) {
  5668				update_rq_clock(rq);
  5669	
  5670				if (!is_idle_task(curr)) {
  5671					/*
  5672					 * Make sure the next tick runs within a
  5673					 * reasonable amount of time.
  5674					 */
  5675					u64 delta = rq_clock_task(rq) - curr->se.exec_start;
  5676					WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 3);
  5677				}
  5678				curr->sched_class->task_tick(rq, curr, 0);
  5679	
  5680				calc_load_nohz_remote(rq);
  5681			}
  5682		}
  5683	
  5684		/*
  5685		 * Run the remote tick once per second (1Hz). This arbitrary
  5686		 * frequency is large enough to avoid overload but short enough
  5687		 * to keep scheduler internal stats reasonably up to date.  But
  5688		 * first update state to reflect hotplug activity if required.
  5689		 */
  5690		os = atomic_fetch_add_unless(&twork->state, -1, TICK_SCHED_REMOTE_RUNNING);
  5691		WARN_ON_ONCE(os == TICK_SCHED_REMOTE_OFFLINE);
  5692		if (os == TICK_SCHED_REMOTE_RUNNING)
  5693			queue_delayed_work(system_unbound_wq, dwork, HZ);
  5694	}
  5695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
