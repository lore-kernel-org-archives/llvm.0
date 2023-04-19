Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7DA15A8;
	Wed, 19 Apr 2023 00:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681864822; x=1713400822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xv7xq9+ZhiLjo2ODmCjD20z8I2Htku92+m8r9xet5Cc=;
  b=MBw3KiIZ+ma1uOagWoyJZlQww40gqSuSOFRzq4cwANgsXQvxPNa8YzcT
   yktDEqRmM6nSm15+sV2Tm86zlZxEglDoykQRAtoY41G3XmCeCUqVq4FUe
   sKliktSXGHPgwuFRvhM0C/MrfLrnspt/M9j7dpmSKYNkS4nrNj20+ZAqm
   +WGjPQcjUDI3SRufPr23uB44fwvclv1mQLKub6vQKKQEYL5k94zRbYc0E
   Z/0AVnsS7+qdn9cPSk2h4CNvZEK1FdLEWBvJA4G9LkrSAr2/HvIwBsljV
   EQRZVlc9AWADJKX/U/M9p8tU5eQ707g1cMAGdwxC9rLOzEcnctLsJPy/W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="325653982"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="325653982"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 17:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="641556561"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="641556561"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Apr 2023 17:40:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1povrv-000eHv-0f;
	Wed, 19 Apr 2023 00:40:19 +0000
Date: Wed, 19 Apr 2023 08:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi 1/17] include/linux/trace_events.h:799:5:
 warning: no previous prototype for function 'bpf_uprobe_multi_link_attach'
Message-ID: <202304190821.LhAbwJXK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi
head:   663cc4c067c5af744475e3a7573e3cd5b4647ef3
commit: fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95 [1/17] bpf: Add multi uprobe link
config: arm-buildonly-randconfig-r002-20230418 (https://download.01.org/0day-ci/archive/20230419/202304190821.LhAbwJXK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi
        git checkout fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190821.LhAbwJXK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/main.c:21:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for function 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
       ^
   include/linux/trace_events.h:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   ^
   static 
   init/main.c:779:20: warning: no previous prototype for function 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
   void __init __weak arch_post_acpi_subsys_init(void) { }
                      ^
   init/main.c:779:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak arch_post_acpi_subsys_init(void) { }
   ^
   static 
   init/main.c:791:20: warning: no previous prototype for function 'mem_encrypt_init' [-Wmissing-prototypes]
   void __init __weak mem_encrypt_init(void) { }
                      ^
   init/main.c:791:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak mem_encrypt_init(void) { }
   ^
   static 
   init/main.c:793:20: warning: no previous prototype for function 'poking_init' [-Wmissing-prototypes]
   void __init __weak poking_init(void) { }
                      ^
   init/main.c:793:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak poking_init(void) { }
   ^
   static 
   4 warnings generated.
--
   In file included from init/do_mounts.c:28:
   In file included from init/do_mounts.h:5:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for function 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
       ^
   include/linux/trace_events.h:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   ^
   static 
   1 warning generated.
--
   In file included from kernel/fork.c:55:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for function 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
       ^
   include/linux/trace_events.h:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   ^
   static 
   kernel/fork.c:162:13: warning: no previous prototype for function 'arch_release_task_struct' [-Wmissing-prototypes]
   void __weak arch_release_task_struct(struct task_struct *tsk)
               ^
   kernel/fork.c:162:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_release_task_struct(struct task_struct *tsk)
   ^
   static 
   kernel/fork.c:857:20: warning: no previous prototype for function 'arch_task_cache_init' [-Wmissing-prototypes]
   void __init __weak arch_task_cache_init(void) { }
                      ^
   kernel/fork.c:857:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak arch_task_cache_init(void) { }
   ^
   static 
   kernel/fork.c:952:12: warning: no previous prototype for function 'arch_dup_task_struct' [-Wmissing-prototypes]
   int __weak arch_dup_task_struct(struct task_struct *dst,
              ^
   kernel/fork.c:952:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_dup_task_struct(struct task_struct *dst,
   ^
   static 
   4 warnings generated.
--
   In file included from kernel/cpu.c:40:
   In file included from include/trace/events/power.h:12:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for function 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
       ^
   include/linux/trace_events.h:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   ^
   static 
   kernel/cpu.c:110:20: warning: unused function 'cpuhp_lock_acquire' [-Wunused-function]
   static inline void cpuhp_lock_acquire(bool bringup) { }
                      ^
   kernel/cpu.c:111:20: warning: unused function 'cpuhp_lock_release' [-Wunused-function]
   static inline void cpuhp_lock_release(bool bringup) { }
                      ^
   3 warnings generated.
--
   In file included from fs/d_path.c:2:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for function 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
       ^
   include/linux/trace_events.h:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   ^
   static 
   fs/d_path.c:317:7: warning: no previous prototype for function 'simple_dname' [-Wmissing-prototypes]
   char *simple_dname(struct dentry *dentry, char *buffer, int buflen)
         ^
   fs/d_path.c:317:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   char *simple_dname(struct dentry *dentry, char *buffer, int buflen)
   ^
   static 
   2 warnings generated.
--
   In file included from arch/arm/kernel/signal.c:14:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for function 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
       ^
   include/linux/trace_events.h:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   ^
   static 
   arch/arm/kernel/signal.c:142:15: warning: variable 'aux' set but not used [-Wunused-but-set-variable]
           char __user *aux;
                        ^
   arch/arm/kernel/signal.c:186:16: warning: no previous prototype for function 'sys_sigreturn' [-Wmissing-prototypes]
   asmlinkage int sys_sigreturn(struct pt_regs *regs)
                  ^
   arch/arm/kernel/signal.c:186:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage int sys_sigreturn(struct pt_regs *regs)
              ^
              static 
   arch/arm/kernel/signal.c:216:16: warning: no previous prototype for function 'sys_rt_sigreturn' [-Wmissing-prototypes]
   asmlinkage int sys_rt_sigreturn(struct pt_regs *regs)
                  ^
   arch/arm/kernel/signal.c:216:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage int sys_rt_sigreturn(struct pt_regs *regs)
              ^
              static 
   arch/arm/kernel/signal.c:601:1: warning: no previous prototype for function 'do_work_pending' [-Wmissing-prototypes]
   do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
   ^
   arch/arm/kernel/signal.c:600:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage int
              ^
              static 
   5 warnings generated.
--
   In file included from arch/arm/kernel/sys_arm.c:20:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for function 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
       ^
   include/linux/trace_events.h:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   ^
   static 
   arch/arm/kernel/sys_arm.c:32:17: warning: no previous prototype for function 'sys_arm_fadvise64_64' [-Wmissing-prototypes]
   asmlinkage long sys_arm_fadvise64_64(int fd, int advice,
                   ^
   arch/arm/kernel/sys_arm.c:32:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage long sys_arm_fadvise64_64(int fd, int advice,
              ^
              static 
   2 warnings generated.
--
   In file included from kernel/sched/core.c:13:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for function 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
       ^
   include/linux/trace_events.h:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   ^
   static 
   kernel/sched/core.c:3631:20: warning: unused function 'rq_has_pinned_tasks' [-Wunused-function]
   static inline bool rq_has_pinned_tasks(struct rq *rq)
                      ^
   kernel/sched/core.c:5743:20: warning: unused function 'sched_tick_start' [-Wunused-function]
   static inline void sched_tick_start(int cpu) { }
                      ^
   kernel/sched/core.c:5744:20: warning: unused function 'sched_tick_stop' [-Wunused-function]
   static inline void sched_tick_stop(int cpu) { }
                      ^
   kernel/sched/core.c:6437:20: warning: unused function 'sched_core_cpu_starting' [-Wunused-function]
   static inline void sched_core_cpu_starting(unsigned int cpu) {}
                      ^
   kernel/sched/core.c:6438:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
   static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
                      ^
   kernel/sched/core.c:6439:20: warning: unused function 'sched_core_cpu_dying' [-Wunused-function]
   static inline void sched_core_cpu_dying(unsigned int cpu) {}
                      ^
   7 warnings generated.
--
   In file included from kernel/sched/fair.c:55:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for function 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
       ^
   include/linux/trace_events.h:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   ^
   static 
   kernel/sched/fair.c:688:5: warning: no previous prototype for function 'sched_update_scaling' [-Wmissing-prototypes]
   int sched_update_scaling(void)
       ^
   kernel/sched/fair.c:688:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_update_scaling(void)
   ^
   static 
   kernel/sched/fair.c:3200:20: warning: unused function 'account_numa_enqueue' [-Wunused-function]
   static inline void account_numa_enqueue(struct rq *rq, struct task_struct *p)
                      ^
   kernel/sched/fair.c:3204:20: warning: unused function 'account_numa_dequeue' [-Wunused-function]
   static inline void account_numa_dequeue(struct rq *rq, struct task_struct *p)
                      ^
   kernel/sched/fair.c:3208:20: warning: unused function 'update_scan_period' [-Wunused-function]
   static inline void update_scan_period(struct task_struct *p, int new_cpu)
                      ^
   kernel/sched/fair.c:4598:20: warning: unused function 'cfs_rq_is_decayed' [-Wunused-function]
   static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
                      ^
   kernel/sched/fair.c:6083:20: warning: unused function 'cfs_bandwidth_used' [-Wunused-function]
   static inline bool cfs_bandwidth_used(void)
                      ^
   kernel/sched/fair.c:6104:19: warning: unused function 'throttled_lb_pair' [-Wunused-function]
   static inline int throttled_lb_pair(struct task_group *tg,
                     ^
   kernel/sched/fair.c:6121:20: warning: unused function 'update_runtime_enabled' [-Wunused-function]
   static inline void update_runtime_enabled(struct rq *rq) {}
                      ^
   kernel/sched/fair.c:6122:20: warning: unused function 'unthrottle_offline_cfs_rqs' [-Wunused-function]
   static inline void unthrottle_offline_cfs_rqs(struct rq *rq) {}
                      ^
   10 warnings generated.
--
   In file included from kernel/time/hrtimer.c:30:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
>> include/linux/trace_events.h:799:5: warning: no previous prototype for function 'bpf_uprobe_multi_link_attach' [-Wmissing-prototypes]
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
       ^
   include/linux/trace_events.h:799:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   ^
   static 
   kernel/time/hrtimer.c:120:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_TAI]             = HRTIMER_BASE_TAI,
                                     ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:1648:7: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
           bool expires_in_hardirq;
                ^
   kernel/time/hrtimer.c:276:20: warning: unused function 'is_migration_base' [-Wunused-function]
   static inline bool is_migration_base(struct hrtimer_clock_base *base)
                      ^
   kernel/time/hrtimer.c:1873:20: warning: unused function '__hrtimer_peek_ahead_timers' [-Wunused-function]
   static inline void __hrtimer_peek_ahead_timers(void)
                      ^
   8 warnings generated.


vim +/bpf_uprobe_multi_link_attach +799 include/linux/trace_events.h

   766	
   767	static inline int
   768	perf_event_query_prog_array(struct perf_event *event, void __user *info)
   769	{
   770		return -EOPNOTSUPP;
   771	}
   772	static inline int bpf_probe_register(struct bpf_raw_event_map *btp, struct bpf_prog *p)
   773	{
   774		return -EOPNOTSUPP;
   775	}
   776	static inline int bpf_probe_unregister(struct bpf_raw_event_map *btp, struct bpf_prog *p)
   777	{
   778		return -EOPNOTSUPP;
   779	}
   780	static inline struct bpf_raw_event_map *bpf_get_raw_tracepoint(const char *name)
   781	{
   782		return NULL;
   783	}
   784	static inline void bpf_put_raw_tracepoint(struct bpf_raw_event_map *btp)
   785	{
   786	}
   787	static inline int bpf_get_perf_event_info(const struct perf_event *event,
   788						  u32 *prog_id, u32 *fd_type,
   789						  const char **buf, u64 *probe_offset,
   790						  u64 *probe_addr)
   791	{
   792		return -EOPNOTSUPP;
   793	}
   794	static inline int
   795	bpf_kprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   796	{
   797		return -EOPNOTSUPP;
   798	}
 > 799	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   800	{
   801		return -EOPNOTSUPP;
   802	}
   803	#endif
   804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
