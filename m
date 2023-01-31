Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318758F4B;
	Tue, 31 Jan 2023 17:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675185969; x=1706721969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uRBLpzx0E9m0xMnCdpOBvHXWh8lf/kuFyC9J6dSreM=;
  b=VtNT4Xi0W1UaPq/2YxfzbmAtWinyRDpaG9a1eZUrm+DiVU7TICQRsaG2
   aU7aCQ7/IRF0C7EfHQ56Z6i5yWlHdM4nNPFzjbQOT4gS3cT64CjUGJ/PJ
   yUWk4F+ojRuY9bH6DiQD9+tUS9iFHrJyE1meV2OqvMljSHXzIN6QL0clC
   APexVinXbMuPhuYk9SiJ1y0KAtzasID28xnqnmA83wH2btUKQa1faGBo0
   YtHRH91gVdjocrVWGy4ZzPUhmO+ykS0nLSbUStiT1X9uw3HodXyC6A4kc
   f6EpW3Z8w3mRA8sBA5wVZOl4LVGdyny6gjitVWOccatJD1KVqDGvWgECB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="311521219"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="311521219"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 09:26:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="807209055"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="807209055"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2023 09:26:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMuOU-0004aI-0J;
	Tue, 31 Jan 2023 17:26:06 +0000
Date: Wed, 1 Feb 2023 01:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/urgent 1/1] kernel/cgroup/cpuset.c:3749:1:
 error: expected 'while' in do/while loop
Message-ID: <202302010155.FaftGxmC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/urgent
head:   4f4d0b01796a0e1cae148d96b32520ebabb3951f
commit: 4f4d0b01796a0e1cae148d96b32520ebabb3951f [1/1] cpuset: Fix cpuset_cpus_allowed() to not filter offline CPUs
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230201/202302010155.FaftGxmC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=4f4d0b01796a0e1cae148d96b32520ebabb3951f
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/urgent
        git checkout 4f4d0b01796a0e1cae148d96b32520ebabb3951f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:3749:1: error: expected 'while' in do/while loop
   bool cpuset_cpus_allowed_fallback(struct task_struct *tsk)
   ^
   kernel/cgroup/cpuset.c:3721:2: note: to match this 'do'
           do {
           ^
>> kernel/cgroup/cpuset.c:3975:1: error: function definition is not allowed here
   {
   ^
   kernel/cgroup/cpuset.c:3986:1: error: function definition is not allowed here
   {
   ^
>> kernel/cgroup/cpuset.c:4006:36: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
   int cpuset_memory_pressure_enabled __read_mostly;
                                      ^
   arch/x86/include/asm/cache.h:11:23: note: expanded from macro '__read_mostly'
   #define __read_mostly __section(".data..read_mostly")
                         ^
   include/linux/compiler_attributes.h:316:56: note: expanded from macro '__section'
   #define __section(section)              __attribute__((__section__(section)))
                                                          ^
   kernel/cgroup/cpuset.c:4027:1: error: function definition is not allowed here
   {
   ^
   kernel/cgroup/cpuset.c:4045:1: error: function definition is not allowed here
   {
   ^
   kernel/cgroup/cpuset.c:4075:1: error: function definition is not allowed here
   {
   ^
>> kernel/cgroup/cpuset.c:4080:2: error: expected '}'
   }
    ^
   kernel/cgroup/cpuset.c:3713:1: note: to match this '{'
   {
   ^
   kernel/cgroup/cpuset.c:3960:1: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
   EXPORT_SYMBOL_GPL(cpuset_mem_spread_node);
   ^
   include/linux/export.h:151:33: note: expanded from macro 'EXPORT_SYMBOL_GPL'
   #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
                                           ^
   include/linux/export.h:147:34: note: expanded from macro '_EXPORT_SYMBOL'
   #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
                                           ^
   include/linux/export.h:140:39: note: expanded from macro '__EXPORT_SYMBOL'
   #define __EXPORT_SYMBOL(sym, sec, ns)   ___EXPORT_SYMBOL(sym, sec, ns)
                                           ^
   include/linux/export.h:88:20: note: expanded from macro '___EXPORT_SYMBOL'
           extern const char __kstrtab_##sym[];                                    \
                             ^
   <scratch space>:213:1: note: expanded from here
   __kstrtab_cpuset_mem_spread_node
   ^
   1 warning and 8 errors generated.


vim +/while +3749 kernel/cgroup/cpuset.c

^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds 2005-04-16  3734  
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3735  /**
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3736   * cpuset_cpus_allowed_fallback - final fallback before complete catastrophe.
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3737   * @tsk: pointer to task_struct with which the scheduler is struggling
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3738   *
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3739   * Description: In the case that the scheduler cannot find an allowed cpu in
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3740   * tsk->cpus_allowed, we fall back to task_cs(tsk)->cpus_allowed. In legacy
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3741   * mode however, this value is the same as task_cs(tsk)->effective_cpus,
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3742   * which will not contain a sane cpumask during cases such as cpu hotplugging.
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3743   * This is the absolute last resort for the scheduler and it is only used if
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3744   * _every_ other avenue has been traveled.
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3745   *
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3746   * Returns true if the affinity of @tsk was changed, false otherwise.
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3747   **/
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz    2019-06-12  3748  
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon    2021-07-30 @3749  bool cpuset_cpus_allowed_fallback(struct task_struct *tsk)
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3750  {
d4b96fb92ae7fe7 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3751  	const struct cpumask *possible_mask = task_cpu_possible_mask(tsk);
d4b96fb92ae7fe7 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3752  	const struct cpumask *cs_mask;
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3753  	bool changed = false;
d4b96fb92ae7fe7 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3754  
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3755  	rcu_read_lock();
d4b96fb92ae7fe7 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3756  	cs_mask = task_cs(tsk)->cpus_allowed;
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3757  	if (is_in_v2_mode() && cpumask_subset(cs_mask, possible_mask)) {
d4b96fb92ae7fe7 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3758  		do_set_cpus_allowed(tsk, cs_mask);
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3759  		changed = true;
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3760  	}
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3761  	rcu_read_unlock();
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3762  
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3763  	/*
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3764  	 * We own tsk->cpus_allowed, nobody can change it under us.
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3765  	 *
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3766  	 * But we used cs && cs->cpus_allowed lockless and thus can
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3767  	 * race with cgroup_attach_task() or update_cpumask() and get
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3768  	 * the wrong tsk->cpus_allowed. However, both cases imply the
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3769  	 * subsequent cpuset_change_cpumask()->set_cpus_allowed_ptr()
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3770  	 * which takes task_rq_lock().
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3771  	 *
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3772  	 * If we are called after it dropped the lock we must see all
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3773  	 * changes in tsk_cs()->cpus_allowed. Otherwise we can temporary
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3774  	 * set any mask even if it is not right from task_cs() pov,
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3775  	 * the pending set_cpus_allowed_ptr() will fix things.
2baab4e90495ebc kernel/cpuset.c        Peter Zijlstra 2012-03-20  3776  	 *
2baab4e90495ebc kernel/cpuset.c        Peter Zijlstra 2012-03-20  3777  	 * select_fallback_rq() will fix things ups and set cpu_possible_mask
2baab4e90495ebc kernel/cpuset.c        Peter Zijlstra 2012-03-20  3778  	 * if required.
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3779  	 */
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon    2021-07-30  3780  	return changed;
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3781  }
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov  2010-03-15  3782  

:::::: The code at line 3749 was first introduced by commit
:::::: 97c0054dbe2c3c59d1156fd233f2d44e91981c8e cpuset: Cleanup cpuset_cpus_allowed_fallback() use in select_fallback_rq()

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
