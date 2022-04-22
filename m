Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005E1290F
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650646493; x=1682182493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0nHNIRUCvg3Lnz7SEhxGX69cAsxmqxM8wlalKSlzkj8=;
  b=V2Fp2Da0vNen3tYob6j6qnFvKX5UeX6PaI1CMBoRKhCjjG80TszcnpwI
   fbBI58F/C2KXTW5uP2yDNzt4n0KeScVlZhH15P3/Nbavh+xnU8g2yjrNU
   u6i6J2EiWSADWanvmCwsIroolUftdz5l+1foXxBTc08b9YXvvO5/5D/zM
   KzdzvDu6xqBBQXle7OMeF/IrRIBPvue/IWzgYyba+JJn4OFfmyrMjXDG/
   b3x2FgEkv7hlLA3FIKlBmfQ1iR1dQPqR/0JCJ7CtdnlByeCvHb7T7BD3S
   Nc+YQe2697OZJasknclp5pOhhcat2y6WfwcQYwQ9cjSxQxqz9sQYqRR3Z
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="246633175"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="246633175"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 09:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="648694920"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2022 09:54:50 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhwYT-000AMQ-RV;
	Fri, 22 Apr 2022 16:54:49 +0000
Date: Sat, 23 Apr 2022 00:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2] tick/sched: Ensure quiet_vmstat() is called when
 the idle tick was stopped too
Message-ID: <202204230047.FesC3TWd-lkp@intel.com>
References: <20220422112053.3695526-1-atomlin@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422112053.3695526-1-atomlin@redhat.com>

Hi Aaron,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on v5.18-rc3]
[also build test ERROR on next-20220422]
[cannot apply to tip/timers/nohz]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/tick-sched-Ensure-quiet_vmstat-is-called-when-the-idle-tick-was-stopped-too/20220422-192320
base:    b2d229d4ddb17db541098b83524d901257e93845
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220423/202204230047.FesC3TWd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0be2b64445273bddc478567c0846c1046f28995a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Aaron-Tomlin/tick-sched-Ensure-quiet_vmstat-is-called-when-the-idle-tick-was-stopped-too/20220422-192320
        git checkout 0be2b64445273bddc478567c0846c1046f28995a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/i2c/ kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/cpu.c:13:
   In file included from include/linux/sched/isolation.h:6:
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                                      ^
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:6: error: assigning to 'struct tick_sched *' from incompatible type 'void'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tick.h:315:9: error: incomplete definition of type 'struct tick_sched'
                   if (ts->tick_stopped)
                       ~~^
   include/linux/tick.h:310:9: note: forward declaration of 'struct tick_sched'
           struct tick_sched *ts;
                  ^
>> include/linux/tick.h:316:4: error: call to undeclared function 'quiet_vmstat'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           quiet_vmstat();
                           ^
   In file included from kernel/cpu.c:18:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:1719:
>> include/linux/vmstat.h:299:6: error: conflicting types for 'quiet_vmstat'
   void quiet_vmstat(void);
        ^
   include/linux/tick.h:316:4: note: previous implicit declaration is here
                           quiet_vmstat();
                           ^
   7 errors generated.
--
   In file included from kernel/softirq.c:27:
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                                      ^
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:6: error: assigning to 'struct tick_sched *' from incompatible type 'void'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tick.h:315:9: error: incomplete definition of type 'struct tick_sched'
                   if (ts->tick_stopped)
                       ~~^
   include/linux/tick.h:310:9: note: forward declaration of 'struct tick_sched'
           struct tick_sched *ts;
                  ^
   5 errors generated.
--
   In file included from kernel/irq_work.c:17:
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                                      ^
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:6: error: assigning to 'struct tick_sched *' from incompatible type 'void'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tick.h:315:9: error: incomplete definition of type 'struct tick_sched'
                   if (ts->tick_stopped)
                       ~~^
   include/linux/tick.h:310:9: note: forward declaration of 'struct tick_sched'
           struct tick_sched *ts;
                  ^
>> include/linux/tick.h:316:4: error: call to undeclared function 'quiet_vmstat'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           quiet_vmstat();
                           ^
   6 errors generated.
--
   In file included from kernel/sched/core.c:30:
   In file included from include/linux/sched/isolation.h:6:
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                                      ^
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:6: error: assigning to 'struct tick_sched *' from incompatible type 'void'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tick.h:315:9: error: incomplete definition of type 'struct tick_sched'
                   if (ts->tick_stopped)
                       ~~^
   include/linux/tick.h:310:9: note: forward declaration of 'struct tick_sched'
           struct tick_sched *ts;
                  ^
   kernel/sched/core.c:3518:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
   void sched_set_stop_task(int cpu, struct task_struct *stop)
        ^
   kernel/sched/core.c:3518:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_set_stop_task(int cpu, struct task_struct *stop)
   ^
   static 
   kernel/sched/core.c:5235:20: warning: no previous prototype for function 'task_sched_runtime' [-Wmissing-prototypes]
   unsigned long long task_sched_runtime(struct task_struct *p)
                      ^
   kernel/sched/core.c:5235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long long task_sched_runtime(struct task_struct *p)
   ^
   static 
   kernel/sched/core.c:8952:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
   void idle_task_exit(void)
        ^
   kernel/sched/core.c:8952:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void idle_task_exit(void)
   ^
   static 
   kernel/sched/core.c:9187:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
   int sched_cpu_activate(unsigned int cpu)
       ^
   kernel/sched/core.c:9187:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_activate(unsigned int cpu)
   ^
   static 
   kernel/sched/core.c:9232:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
   int sched_cpu_deactivate(unsigned int cpu)
       ^
   kernel/sched/core.c:9232:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_deactivate(unsigned int cpu)
   ^
   static 
   kernel/sched/core.c:9307:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
   int sched_cpu_starting(unsigned int cpu)
       ^
   kernel/sched/core.c:9307:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_starting(unsigned int cpu)
   ^
   static 
   kernel/sched/core.c:9328:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
   int sched_cpu_wait_empty(unsigned int cpu)
       ^
   kernel/sched/core.c:9328:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_wait_empty(unsigned int cpu)
   ^
   static 
   kernel/sched/core.c:9370:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
   int sched_cpu_dying(unsigned int cpu)
       ^
   kernel/sched/core.c:9370:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_cpu_dying(unsigned int cpu)
   ^
   static 
   kernel/sched/core.c:9393:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
   void __init sched_init_smp(void)
               ^
   kernel/sched/core.c:9393:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init_smp(void)
   ^
   static 
   kernel/sched/core.c:9454:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
   void __init sched_init(void)
               ^
   kernel/sched/core.c:9454:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init sched_init(void)
   ^
   static 
   10 warnings and 5 errors generated.
--
   In file included from kernel/sched/fair.c:38:
   In file included from include/linux/sched/isolation.h:6:
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                                      ^
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:6: error: assigning to 'struct tick_sched *' from incompatible type 'void'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tick.h:315:9: error: incomplete definition of type 'struct tick_sched'
                   if (ts->tick_stopped)
                       ~~^
   include/linux/tick.h:310:9: note: forward declaration of 'struct tick_sched'
           struct tick_sched *ts;
                  ^
   kernel/sched/fair.c:11137:6: warning: no previous prototype for function 'task_vruntime_update' [-Wmissing-prototypes]
   void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
        ^
   kernel/sched/fair.c:11137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
   ^
   static 
   1 warning and 5 errors generated.
--
   In file included from kernel/sched/build_policy.c:33:
   In file included from kernel/sched/sched.h:62:
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                                      ^
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:6: error: assigning to 'struct tick_sched *' from incompatible type 'void'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tick.h:315:9: error: incomplete definition of type 'struct tick_sched'
                   if (ts->tick_stopped)
                       ~~^
   include/linux/tick.h:310:9: note: forward declaration of 'struct tick_sched'
           struct tick_sched *ts;
                  ^
   In file included from kernel/sched/build_policy.c:43:
   kernel/sched/rt.c:666:6: warning: no previous prototype for function 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
   bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
        ^
   kernel/sched/rt.c:666:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
   ^
   static 
   1 warning and 5 errors generated.
--
   In file included from kernel/irq/manage.c:21:
   In file included from include/linux/sched/isolation.h:6:
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                                      ^
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:22: error: use of undeclared identifier 'tick_cpu_sched'
>> include/linux/tick.h:313:6: error: assigning to 'struct tick_sched *' from incompatible type 'void'
                   ts = this_cpu_ptr(&tick_cpu_sched);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/tick.h:315:9: error: incomplete definition of type 'struct tick_sched'
                   if (ts->tick_stopped)
                       ~~^
   include/linux/tick.h:310:9: note: forward declaration of 'struct tick_sched'
           struct tick_sched *ts;
                  ^
>> include/linux/tick.h:316:4: error: call to undeclared function 'quiet_vmstat'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           quiet_vmstat();
                           ^
   In file included from kernel/irq/manage.c:25:
   In file included from kernel/irq/internals.h:486:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from kernel/irq/manage.c:25:
   In file included from kernel/irq/internals.h:486:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from kernel/irq/manage.c:25:
   In file included from kernel/irq/internals.h:486:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
                           set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from kernel/irq/manage.c:25:
   In file included from kernel/irq/internals.h:486:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from kernel/irq/manage.c:25:
   In file included from kernel/irq/internals.h:486:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from kernel/irq/manage.c:25:
   In file included from kernel/irq/internals.h:486:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from kernel/irq/manage.c:25:
   In file included from kernel/irq/internals.h:486:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 1 element) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from kernel/irq/manage.c:25:
   In file included from kernel/irq/internals.h:486:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
..


vim +/tick_cpu_sched +313 include/linux/tick.h

   307	
   308	static inline void tick_nohz_user_enter_prepare(void)
   309	{
   310		struct tick_sched *ts;
   311	
   312		if (tick_nohz_full_cpu(smp_processor_id())) {
 > 313			ts = this_cpu_ptr(&tick_cpu_sched);
   314	
 > 315			if (ts->tick_stopped)
 > 316				quiet_vmstat();
   317			rcu_nocb_flush_deferred_wakeup();
   318		}
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
