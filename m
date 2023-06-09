Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C995415AA;
	Fri,  9 Jun 2023 06:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686291519; x=1717827519;
  h=date:from:cc:subject:message-id:mime-version;
  bh=VvvT2Itrh3ju2vMkCadzJ2n9W0xnCee9rPAtaj9v6pM=;
  b=WCsiygmiXQhkeCp0GBzwGMPM4XZLbYNb1B3KDACOUuddxA5jztCjdC7U
   SvNtsU9YZacADMnRKI4GttrGjPgSJ/0xf2k6vF4882+b0JK50zrsIPvQP
   NRQUOlEMrOFL78XF+QQA5pWqQZxw6oFfkVRVniZeA5G3hYAmWouX6YArQ
   6AjzhoVSZEwF12zOM+D3Ujyo6q2ME+8CM6wJimwA4i+aYPT6T1dKeAzaU
   G3Buc7lLNWE3Or9k/Ze4o3k27D+Sn4QZX8X9LtzzUuLJwXkapa+do7IT5
   oDnymwIWZBLSWh8nBbhbgGhREFamr8LkgqLsIM0lCO3uTgy0NwFhUVhdL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="360883745"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="360883745"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 23:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="687632736"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="687632736"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jun 2023 23:18:37 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7VSG-0008j2-27;
	Fri, 09 Jun 2023 06:18:36 +0000
Date: Fri, 9 Jun 2023 14:17:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:master 7/20] vmlinux.o: warning: objtool: sched_clock+0x1a:
 preempt_schedule_notrace_thunk() is missing a __noreturn annotation
Message-ID: <202306091418.NP0D86rG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   6d8416140118c362e07507057d329da03310e989
commit: f0b9651adff498934f18c27aa140b66b0d37cb99 [7/20] Merge branch into tip/master: 'sched/core'
config: x86_64-randconfig-x065-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091418.NP0D86rG-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=f0b9651adff498934f18c27aa140b66b0d37cb99
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip master
        git checkout f0b9651adff498934f18c27aa140b66b0d37cb99
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091418.NP0D86rG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: exc_page_fault+0x125: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x104: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: syscall_exit_to_user_mode+0x159: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: do_pre_smp_initcalls+0x7c: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: do_initcall_level+0x149: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: amd_ibs_init+0x108: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: print_local_APICs+0x39: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: console_init+0xa4: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: pcpu_setup_first_chunk+0x703: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: do_xor_speed+0xce: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: clk_disable_unused_subtree+0x13a: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: clk_unprepare_unused_subtree+0x100: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: do_one_initcall+0x24d: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: emulate_vsyscall+0x30c: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: arch_perf_update_userpage+0xcf: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: ibs_eilvt_setup+0x1fd: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: ds_clear_cea+0x77: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: ds_update_cea+0x7c: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: p4_hw_config+0x135: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: do_arch_prctl_64+0x16d: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __switch_to+0x3ab: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __sysvec_x86_platform_ipi+0x8f: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __sysvec_thermal+0x83: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: task_update_io_bitmap+0x48: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: nmi_handle+0x179: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __sysvec_irq_work+0x7b: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __set_cyc2ns_scale+0x15b: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: cyc2ns_read_end+0xf: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: native_sched_clock_from_tsc+0x7f: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
>> vmlinux.o: warning: objtool: sched_clock+0x1a: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: disable_TSC+0x8f: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: set_tsc_mode+0xb0: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: enable_cpuid+0x3a: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: speculation_ctrl_update_current+0x39: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: do_arch_prctl_common+0x9b: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: kernel_fpu_end+0x28: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: fpu_sync_fpstate+0x74: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: fpu_clone+0x19d: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: fpregs_restore_userregs+0x95: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: fpu__drop+0x62: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: fpregs_mark_activate+0x5e: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: copy_fpstate_to_sigframe+0x1e8: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: fpu__restore_sig+0x513: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __xfd_enable_feature+0x2da: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: set_tls_desc+0x1a5: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: split_lock_warn+0xda: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: free_rmid+0x1da: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: measure_cycles_lat_fn+0xc9: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: measure_l2_residency+0xc7: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: measure_l3_residency+0xd8: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __sysvec_apic_timer_interrupt+0xb8: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: handle_spurious_interrupt+0xbe: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __sysvec_error_interrupt+0x14f: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: x86_vector_alloc_irqs+0x2bb: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: x86_vector_free_irqs+0x127: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: x86_vector_activate+0x23d: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: x86_vector_deactivate+0xe3: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: clear_irq_vector+0x18a: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: reserve_irq_vector_locked+0x95: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: apic_update_irq_cfg+0xac: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: apic_update_vector+0x17f: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: assign_vector_locked+0x129: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: optimized_callback+0xc1: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: kvm_clock_read+0x21: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: kvm_get_wallclock+0x6f: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: paravirt_flush_lazy_mmu+0x38: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: unwind_next_frame+0x7bb: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: switch_mm_irqs_off+0x364: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: native_flush_tlb_multi+0x8e: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: flush_tlb_func+0x262: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: flush_tlb_mm_range+0x127: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: flush_tlb_kernel_range+0xac: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: arch_tlbbatch_flush+0xb2: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: kernel_clone+0x30d: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: trace_task_newtask+0x3f: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __warn_printk+0xfe: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __warn+0x143: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: cpuhp_issue_call+0x1b6: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: do_wait+0x27a: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: delayed_put_task_struct+0xae: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: do_exit+0x9b1: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __raise_softirq_irqoff+0x90: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __do_softirq+0x1e6: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: tasklet_action_common+0x13c: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __send_signal_locked+0x604: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: send_sigqueue+0x2c0: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: get_signal+0x426: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: exit_signals+0x155: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: cgroup_threadgroup_change_end+0xa3: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: pwq_activate_inactive_work+0x91: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __queue_work+0x3dd: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: process_one_work+0x3e7: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: wq_worker_running+0x5b: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: workqueue_congested+0x115: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: alloc_pid+0x1ce: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: kthread_worker_fn+0x1b2: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: kthread_stop+0x17b: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: kthread_insert_work+0xad: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __kthread_parkme+0x80: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: kthread+0x12a: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: notifier_call_chain+0x91: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: notifier_chain_unregister+0x70: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: notifier_chain_register+0x96: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: smpboot_thread_fn+0x1bb: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __schedule+0x731: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __mutex_lock_common+0x3b4: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __down_common+0x72: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rwsem_down_write_slowpath+0x460: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_write_killable_nested+0xea: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_write_killable+0xe6: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_write+0xac: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rwsem_down_read_slowpath+0x3f5: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_read+0x114: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_read_interruptible+0x145: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_read_killable+0x145: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __percpu_down_read+0x6d: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: percpu_down_write+0xfd: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __rt_mutex_slowlock+0x143: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rt_mutex_unlock+0x9f: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rt_mutex_postunlock+0x26: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __sched_setscheduler+0x686: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: try_to_wake_up+0x25e: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: raw_spin_rq_trylock+0x3e: preempt_schedule_thunk() is missing a __noreturn annotation
>> vmlinux.o: warning: objtool: wait_task_inactive+0x15e: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: wake_up_new_task+0xdf: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: schedule_tail+0x64: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rt_mutex_setprio+0x353: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: call_trace_sched_update_nr_running+0x43: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: update_curr+0x234: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: sched_dl_global_validate+0x13c: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: sched_dl_do_global+0x130: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: trace_cpu_idle+0x3d: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: play_idle_precise+0x1e7: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: update_curr_rt+0x2f4: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: update_curr_dl+0x288: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: local_clock+0x1a: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __sched_clock_work+0x90: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: sched_clock_cpu+0x139: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __update_stats_wait_end+0xce: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __update_stats_enqueue_sleeper+0x26d: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: up_write+0xf4: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __up_read+0x101: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: downgrade_write+0xef: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_write_trylock+0xd5: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_write_nested+0xb0: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_read_trylock+0xe6: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_read_nested+0x113: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_read_killable_nested+0x147: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: _down_write_nest_lock+0xb3: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: down_read_non_owner+0x100: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __percpu_rwsem_trylock+0x35: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: lockdep_rcu_suspicious+0x124: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: lock_release+0x1f1: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: lock_acquire+0x1b0: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: _raw_write_unlock_irqrestore+0x70: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: _raw_write_unlock_irq+0x3c: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: _raw_write_unlock+0x36: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: _raw_spin_unlock_irqrestore+0x70: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: _raw_spin_unlock_irq+0x3c: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: _raw_spin_unlock+0x36: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: _raw_spin_trylock+0x69: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: _raw_read_unlock_irqrestore+0x81: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: _raw_read_unlock_irq+0x4d: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: _raw_read_unlock+0x47: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: cpu_latency_qos_update_request+0x86: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: pm_qos_update_target+0x110: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: cpu_latency_qos_remove_request+0x9b: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: cpu_latency_qos_add_request+0x88: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: pm_qos_update_flags+0x11b: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: thaw_processes+0x17a: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: create_image+0x1db: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: printk_sprint+0xfa: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: vprintk_emit+0x19e: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __wake_up_klogd+0x5c: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __handle_irq_event_percpu+0x15a: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: handle_fasteoi_nmi+0x96: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: handle_percpu_devid_irq+0x132: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: handle_percpu_devid_fasteoi_nmi+0x96: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_matrix_online+0x6f: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_matrix_offline+0x4c: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_matrix_assign_system+0x81: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_matrix_reserve_managed+0x81: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_matrix_remove_managed+0x103: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_matrix_alloc_managed+0x12b: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_matrix_assign+0x6a: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_matrix_reserve+0x5f: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_matrix_remove_reserved+0x3f: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_matrix_alloc+0xcc: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: irq_matrix_free+0x8d: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rcu_exp_sel_wait_wake+0x77c: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: sync_rcu_exp_select_node_cpus+0x28e: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rcu_is_watching+0x21: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rcu_cpu_kthread+0x144: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rcu_core+0x73e: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rcu_sched_clock_irq+0x759: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: print_other_cpu_stall+0x827: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rcu_fwd_progress_check+0x64: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: rcu_note_context_switch+0x48b: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: swiotlb_map+0x1e8: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_work+0xf1: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: syscall_exit_to_user_mode_work+0x13e: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: trace_module_load+0x3c: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: do_init_module+0x43b: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __symbol_get+0x99: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: search_module_extables+0x5b: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: is_module_address+0x3b: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: is_module_text_address+0x3b: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: print_modules+0x100: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __request_module+0x292: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: module_address_lookup+0xa0: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: lookup_module_symbol_name+0xf7: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: lookup_module_symbol_attrs+0x14f: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: module_get_kallsym+0xc5: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: module_kallsyms_lookup_name+0xb0: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: find_kallsyms_symbol_value+0x42: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: module_kallsyms_on_each_symbol+0x166: preempt_schedule_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: detach_if_pending+0xeb: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: init_timer_key+0x87: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: enqueue_timer+0x9c: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: __run_timers+0x236: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: call_timer_fn+0x131: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: hrtimer_start_range_ns+0x1b1: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: hrtimer_try_to_cancel+0xbf: preempt_schedule_notrace_thunk() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: enqueue_hrtimer+0x9f: preempt_schedule_notrace_thunk() is missing a __noreturn annotation


objdump-func vmlinux.o sched_clock:
0000 00000000000021c0 <sched_clock_noinstr>:
0000     21c0:	e9 00 00 00 00       	jmp    21c5 <sched_clock_noinstr+0x5>	21c1: R_X86_64_PLT32	__SCT__pv_sched_clock-0x4
0005     21c5:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0014     21d4:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0023     21e3:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0032     21f2:	66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0000 0000000000022f40 <sched_clock_init_late>:
0000    22f40:	50                   	push   %rax
0001    22f41:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	22f44: R_X86_64_32S	.bss.sched_clock_running
0008    22f48:	e8 00 00 00 00       	call   22f4d <sched_clock_init_late+0xd>	22f49: R_X86_64_PLT32	static_key_slow_inc_cpuslocked-0x4
000d    22f4d:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 22f54 <sched_clock_init_late+0x14>	22f4f: R_X86_64_PC32	.bss.__sched_clock_stable_early-0x5
0014    22f54:	74 03                	je     22f59 <sched_clock_init_late+0x19>
0016    22f56:	58                   	pop    %rax
0017    22f57:	c3                   	ret
0018    22f58:	cc                   	int3
0019    22f59:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)
0021    22f61:	9c                   	pushf
0022    22f62:	8f 04 24             	pop    (%rsp)
0025    22f65:	8b 04 24             	mov    (%rsp),%eax
0028    22f68:	fa                   	cli
0029    22f69:	0f ba e0 09          	bt     $0x9,%eax
002d    22f6d:	73 05                	jae    22f74 <sched_clock_init_late+0x34>
002f    22f6f:	e8 00 00 00 00       	call   22f74 <sched_clock_init_late+0x34>	22f70: R_X86_64_PLT32	trace_hardirqs_off-0x4
0034    22f74:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 22f7b <sched_clock_init_late+0x3b>	22f77: R_X86_64_PC32	.data..read_mostly+0x211c
003b    22f7b:	48 03 05 00 00 00 00 	add    0x0(%rip),%rax        # 22f82 <sched_clock_init_late+0x42>	22f7e: R_X86_64_PC32	sched_clock_data+0x4
0042    22f82:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 22f89 <sched_clock_init_late+0x49>	22f85: R_X86_64_PC32	sched_clock_data-0x4
0049    22f89:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 22f90 <sched_clock_init_late+0x50>	22f8c: R_X86_64_PC32	__sched_clock_offset-0x4
0050    22f90:	e8 00 00 00 00       	call   22f95 <sched_clock_init_late+0x55>	22f91: R_X86_64_PLT32	trace_hardirqs_on-0x4
0055    22f95:	fb                   	sti
0056    22f96:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 22f9d <sched_clock_init_late+0x5d>	22f99: R_X86_64_PC32	sched_clock_data+0x4
005d    22f9d:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 22fa4 <sched_clock_init_late+0x64>	22fa0: R_X86_64_PC32	.data..read_mostly+0x211c
0064    22fa4:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 22fab <sched_clock_init_late+0x6b>	22fa7: R_X86_64_PC32	sched_clock_data-0x4
006b    22fab:	4c 8b 05 00 00 00 00 	mov    0x0(%rip),%r8        # 22fb2 <sched_clock_init_late+0x72>	22fae: R_X86_64_PC32	__sched_clock_offset-0x4
0072    22fb2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	22fb5: R_X86_64_32S	.rodata.str1.1+0x39986
0079    22fb9:	e8 00 00 00 00       	call   22fbe <sched_clock_init_late+0x7e>	22fba: R_X86_64_PLT32	_printk-0x4
007e    22fbe:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	22fc1: R_X86_64_32S	.bss.__sched_clock_stable
0085    22fc5:	e8 00 00 00 00       	call   22fca <sched_clock_init_late+0x8a>	22fc6: R_X86_64_PLT32	static_key_enable_cpuslocked-0x4
008a    22fca:	eb 8a                	jmp    22f56 <sched_clock_init_late+0x16>
008c    22fcc:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
009b    22fdb:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
00aa    22fea:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
00b9    22ff9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
0000 0000000000023000 <sched_clock_init>:
0000    23000:	50                   	push   %rax
0001    23001:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)
0009    23009:	9c                   	pushf
000a    2300a:	8f 04 24             	pop    (%rsp)
000d    2300d:	8b 04 24             	mov    (%rsp),%eax
0010    23010:	fa                   	cli
0011    23011:	0f ba e0 09          	bt     $0x9,%eax
0015    23015:	73 05                	jae    2301c <sched_clock_init+0x1c>
0017    23017:	e8 00 00 00 00       	call   2301c <sched_clock_init+0x1c>	23018: R_X86_64_PLT32	trace_hardirqs_off-0x4
001c    2301c:	e8 00 00 00 00       	call   23021 <sched_clock_init+0x21>	2301d: R_X86_64_PLT32	ktime_get-0x4
0021    23021:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 23028 <sched_clock_init+0x28>	23024: R_X86_64_PC32	sched_clock_data+0x4
0028    23028:	e8 00 00 00 00       	call   2302d <sched_clock_init+0x2d>	23029: R_X86_64_PLT32	sched_clock-0x4
002d    2302d:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 23034 <sched_clock_init+0x34>	23030: R_X86_64_PC32	sched_clock_data-0x4
0034    23034:	48 03 05 00 00 00 00 	add    0x0(%rip),%rax        # 2303b <sched_clock_init+0x3b>	23037: R_X86_64_PC32	__sched_clock_offset-0x4
003b    2303b:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 23042 <sched_clock_init+0x42>	2303e: R_X86_64_PC32	sched_clock_data+0x4
0042    23042:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 23049 <sched_clock_init+0x49>	23045: R_X86_64_PC32	.data..read_mostly+0x211c
0049    23049:	e8 00 00 00 00       	call   2304e <sched_clock_init+0x4e>	2304a: R_X86_64_PLT32	trace_hardirqs_on-0x4
004e    2304e:	fb                   	sti
004f    2304f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	23052: R_X86_64_32S	.bss.sched_clock_running
0056    23056:	e8 00 00 00 00       	call   2305b <sched_clock_init+0x5b>	23057: R_X86_64_PLT32	static_key_slow_inc_cpuslocked-0x4
005b    2305b:	58                   	pop    %rax
005c    2305c:	c3                   	ret
005d    2305d:	cc                   	int3
005e    2305e:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
006d    2306d:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
007c    2307c:	0f 1f 40 00          	nopl   0x0(%rax)
0000 0000000000000000 <sched_clock>:
0000    0:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 6 <sched_clock+0x6>	2: R_X86_64_PC32	pcpu_hot+0x4
0006    6:	e8 00 00 00 00       	call   b <sched_clock+0xb>	7: R_X86_64_PLT32	sched_clock_noinstr-0x4
000b    b:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 11 <sched_clock+0x11>	d: R_X86_64_PC32	pcpu_hot+0x4
0011   11:	74 02                	je     15 <sched_clock+0x15>
0013   13:	c3                   	ret
0014   14:	cc                   	int3
0015   15:	e8 00 00 00 00       	call   1a <sched_clock+0x1a>	16: R_X86_64_PLT32	preempt_schedule_notrace_thunk-0x4
001a   1a:	c3                   	ret
001b   1b:	cc                   	int3
0000 0000000000000000 <sched_clock_stable>:
0000    0:	b8 01 00 00 00       	mov    $0x1,%eax
0005    5:	eb 02                	jmp    9 <sched_clock_stable+0x9>
0007    7:	c3                   	ret
0008    8:	cc                   	int3
0009    9:	31 c0                	xor    %eax,%eax
000b    b:	c3                   	ret
000c    c:	cc                   	int3
0000 0000000000000000 <sched_clock_cpu>:
0000    0:	eb 14                	jmp    16 <sched_clock_cpu+0x16>
0002    2:	e8 00 00 00 00       	call   7 <sched_clock_cpu+0x7>	3: R_X86_64_PLT32	sched_clock-0x4
0007    7:	48 89 c6             	mov    %rax,%rsi
000a    a:	48 03 35 00 00 00 00 	add    0x0(%rip),%rsi        # 11 <sched_clock_cpu+0x11>	d: R_X86_64_PC32	__sched_clock_offset-0x4
0011   11:	48 89 f0             	mov    %rsi,%rax
0014   14:	c3                   	ret
0015   15:	cc                   	int3
0016   16:	e9 23 01 00 00       	jmp    13e <sched_clock_cpu+0x13e>
001b   1b:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 21 <sched_clock_cpu+0x21>	1d: R_X86_64_PC32	pcpu_hot+0x4
0021   21:	85 ff                	test   %edi,%edi
0023   23:	0f 84 8f 00 00 00    	je     b8 <sched_clock_cpu+0xb8>
0029   29:	e8 00 00 00 00       	call   2e <sched_clock_cpu+0x2e>	2a: R_X86_64_PLT32	sched_clock_noinstr-0x4
002e   2e:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 35 <sched_clock_cpu+0x35>	31: R_X86_64_PC32	sched_clock_data-0x4
0035   35:	78 63                	js     9a <sched_clock_cpu+0x9a>
0037   37:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 3e <sched_clock_cpu+0x3e>	3a: R_X86_64_PC32	sched_clock_data+0xc
003e   3e:	4c 8b 05 00 00 00 00 	mov    0x0(%rip),%r8        # 45 <sched_clock_cpu+0x45>	41: R_X86_64_PC32	sched_clock_data+0x4
0045   45:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 4c <sched_clock_cpu+0x4c>	48: R_X86_64_PC32	.data..read_mostly+0x211c
004c   4c:	4a 8d 14 06          	lea    (%rsi,%r8,1),%rdx
0050   50:	48 01 d0             	add    %rdx,%rax
0053   53:	48 89 d7             	mov    %rdx,%rdi
0056   56:	48 29 cf             	sub    %rcx,%rdi
0059   59:	48 85 ff             	test   %rdi,%rdi
005c   5c:	48 0f 4e d1          	cmovle %rcx,%rdx
0060   60:	4c 01 c6             	add    %r8,%rsi
0063   63:	48 81 c6 80 96 98 00 	add    $0x989680,%rsi
006a   6a:	48 89 cf             	mov    %rcx,%rdi
006d   6d:	48 29 f7             	sub    %rsi,%rdi
0070   70:	48 85 ff             	test   %rdi,%rdi
0073   73:	48 0f 4f f1          	cmovg  %rcx,%rsi
0077   77:	48 89 c7             	mov    %rax,%rdi
007a   7a:	48 29 d7             	sub    %rdx,%rdi
007d   7d:	48 85 ff             	test   %rdi,%rdi
0080   80:	48 0f 4f d0          	cmovg  %rax,%rdx
0084   84:	48 39 f2             	cmp    %rsi,%rdx
0087   87:	48 0f 49 d6          	cmovns %rsi,%rdx
008b   8b:	48 89 c8             	mov    %rcx,%rax
008e   8e:	48 0f b1 15 00 00 00 00 	cmpxchg %rdx,0x0(%rip)        # 96 <sched_clock_cpu+0x96>	92: R_X86_64_PC32	sched_clock_data+0xc
0096   96:	75 91                	jne    29 <sched_clock_cpu+0x29>
0098   98:	eb 04                	jmp    9e <sched_clock_cpu+0x9e>
009a   9a:	31 c0                	xor    %eax,%eax
009c   9c:	eb 99                	jmp    37 <sched_clock_cpu+0x37>
009e   9e:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # a5 <sched_clock_cpu+0xa5>	a1: R_X86_64_PC32	sched_clock_data+0xc
00a5   a5:	48 89 f0             	mov    %rsi,%rax
00a8   a8:	48 0f b1 35 00 00 00 00 	cmpxchg %rsi,0x0(%rip)        # b0 <sched_clock_cpu+0xb0>	ac: R_X86_64_PC32	sched_clock_data+0xc
00b0   b0:	75 ec                	jne    9e <sched_clock_cpu+0x9e>
00b2   b2:	eb 74                	jmp    128 <sched_clock_cpu+0x128>
00b4   b4:	31 c0                	xor    %eax,%eax
00b6   b6:	eb 0e                	jmp    c6 <sched_clock_cpu+0xc6>
00b8   b8:	e8 00 00 00 00       	call   bd <sched_clock_cpu+0xbd>	b9: R_X86_64_PLT32	sched_clock_noinstr-0x4
00bd   bd:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # c4 <sched_clock_cpu+0xc4>	c0: R_X86_64_PC32	sched_clock_data-0x4
00c4   c4:	78 ee                	js     b4 <sched_clock_cpu+0xb4>
00c6   c6:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # cd <sched_clock_cpu+0xcd>	c9: R_X86_64_PC32	sched_clock_data+0xc
00cd   cd:	4c 8b 05 00 00 00 00 	mov    0x0(%rip),%r8        # d4 <sched_clock_cpu+0xd4>	d0: R_X86_64_PC32	sched_clock_data+0x4
00d4   d4:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # db <sched_clock_cpu+0xdb>	d7: R_X86_64_PC32	.data..read_mostly+0x211c
00db   db:	4a 8d 34 07          	lea    (%rdi,%r8,1),%rsi
00df   df:	48 01 f0             	add    %rsi,%rax
00e2   e2:	48 89 f1             	mov    %rsi,%rcx
00e5   e5:	48 29 d1             	sub    %rdx,%rcx
00e8   e8:	48 85 c9             	test   %rcx,%rcx
00eb   eb:	48 0f 4e f2          	cmovle %rdx,%rsi
00ef   ef:	4a 8d 0c 07          	lea    (%rdi,%r8,1),%rcx
00f3   f3:	48 81 c1 80 96 98 00 	add    $0x989680,%rcx
00fa   fa:	48 89 d7             	mov    %rdx,%rdi
00fd   fd:	48 29 cf             	sub    %rcx,%rdi
0100  100:	48 85 ff             	test   %rdi,%rdi
0103  103:	48 0f 4f ca          	cmovg  %rdx,%rcx
0107  107:	48 89 c7             	mov    %rax,%rdi
010a  10a:	48 29 f7             	sub    %rsi,%rdi
010d  10d:	48 85 ff             	test   %rdi,%rdi
0110  110:	48 0f 4f f0          	cmovg  %rax,%rsi
0114  114:	48 39 ce             	cmp    %rcx,%rsi
0117  117:	48 0f 49 f1          	cmovns %rcx,%rsi
011b  11b:	48 89 d0             	mov    %rdx,%rax
011e  11e:	48 0f b1 35 00 00 00 00 	cmpxchg %rsi,0x0(%rip)        # 126 <sched_clock_cpu+0x126>	122: R_X86_64_PC32	sched_clock_data+0xc
0126  126:	75 90                	jne    b8 <sched_clock_cpu+0xb8>
0128  128:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 12e <sched_clock_cpu+0x12e>	12a: R_X86_64_PC32	pcpu_hot+0x4
012e  12e:	0f 85 dd fe ff ff    	jne    11 <sched_clock_cpu+0x11>
0134  134:	e8 00 00 00 00       	call   139 <sched_clock_cpu+0x139>	135: R_X86_64_PLT32	preempt_schedule_notrace_thunk-0x4
0139  139:	e9 d3 fe ff ff       	jmp    11 <sched_clock_cpu+0x11>
013e  13e:	e9 00 00 00 00       	jmp    143 <bpf_cgrp_storage_free.__warned>	13f: R_X86_64_PLT32	sched_clock-0x4
0000 0000000000000000 <sched_clock_tick>:
0000    0:	eb 02                	jmp    4 <sched_clock_tick+0x4>
0002    2:	c3                   	ret
0003    3:	cc                   	int3
0004    4:	eb fc                	jmp    2 <sched_clock_tick+0x2>
0006    6:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # d <sched_clock_tick+0xd>	8: R_X86_64_PC32	debug_locks-0x5
000d    d:	74 18                	je     27 <sched_clock_tick+0x27>
000f    f:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 15 <sched_clock_tick+0x15>	11: R_X86_64_PC32	lockdep_recursion-0x4
0015   15:	85 c0                	test   %eax,%eax
0017   17:	75 0e                	jne    27 <sched_clock_tick+0x27>
0019   19:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 1f <sched_clock_tick+0x1f>	1b: R_X86_64_PC32	hardirqs_enabled-0x4
001f   1f:	85 c0                	test   %eax,%eax
0021   21:	0f 85 90 00 00 00    	jne    b7 <sched_clock_tick+0xb7>
0027   27:	e8 00 00 00 00       	call   2c <sched_clock_tick+0x2c>	28: R_X86_64_PLT32	ktime_get-0x4
002c   2c:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 33 <sched_clock_tick+0x33>	2f: R_X86_64_PC32	sched_clock_data+0x4
0033   33:	e8 00 00 00 00       	call   38 <sched_clock_tick+0x38>	34: R_X86_64_PLT32	sched_clock-0x4
0038   38:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 3f <sched_clock_tick+0x3f>	3b: R_X86_64_PC32	sched_clock_data-0x4
003f   3f:	e8 00 00 00 00       	call   44 <sched_clock_tick+0x44>	40: R_X86_64_PLT32	sched_clock_noinstr-0x4
0044   44:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 4b <sched_clock_tick+0x4b>	47: R_X86_64_PC32	sched_clock_data-0x4
004b   4b:	78 66                	js     b3 <sched_clock_tick+0xb3>
004d   4d:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 54 <sched_clock_tick+0x54>	50: R_X86_64_PC32	sched_clock_data+0xc
0054   54:	4c 8b 05 00 00 00 00 	mov    0x0(%rip),%r8        # 5b <sched_clock_tick+0x5b>	57: R_X86_64_PC32	sched_clock_data+0x4
005b   5b:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 62 <sched_clock_tick+0x62>	5e: R_X86_64_PC32	.data..read_mostly+0x211c
0062   62:	4a 8d 14 06          	lea    (%rsi,%r8,1),%rdx
0066   66:	48 01 d0             	add    %rdx,%rax
0069   69:	48 89 d7             	mov    %rdx,%rdi
006c   6c:	48 29 cf             	sub    %rcx,%rdi
006f   6f:	48 85 ff             	test   %rdi,%rdi
0072   72:	48 0f 4e d1          	cmovle %rcx,%rdx
0076   76:	4c 01 c6             	add    %r8,%rsi
0079   79:	48 81 c6 80 96 98 00 	add    $0x989680,%rsi
0080   80:	48 89 cf             	mov    %rcx,%rdi
0083   83:	48 29 f7             	sub    %rsi,%rdi
0086   86:	48 85 ff             	test   %rdi,%rdi
0089   89:	48 0f 4f f1          	cmovg  %rcx,%rsi
008d   8d:	48 89 c7             	mov    %rax,%rdi
0090   90:	48 29 d7             	sub    %rdx,%rdi
0093   93:	48 85 ff             	test   %rdi,%rdi
0096   96:	48 0f 4f d0          	cmovg  %rax,%rdx
009a   9a:	48 39 f2             	cmp    %rsi,%rdx
009d   9d:	48 0f 49 d6          	cmovns %rsi,%rdx
00a1   a1:	48 89 c8             	mov    %rcx,%rax
00a4   a4:	48 0f b1 15 00 00 00 00 	cmpxchg %rdx,0x0(%rip)        # ac <sched_clock_tick+0xac>	a8: R_X86_64_PC32	sched_clock_data+0xc
00ac   ac:	75 91                	jne    3f <sched_clock_tick+0x3f>
00ae   ae:	e9 4f ff ff ff       	jmp    2 <sched_clock_tick+0x2>
00b3   b3:	31 c0                	xor    %eax,%eax
00b5   b5:	eb 96                	jmp    4d <sched_clock_tick+0x4d>
00b7   b7:	0f 0b                	ud2
00b9   b9:	e9 69 ff ff ff       	jmp    27 <sched_clock_tick+0x27>
0000 0000000000000000 <sched_clock_tick_stable>:
0000    0:	50                   	push   %rax
0001    1:	eb 4e                	jmp    51 <sched_clock_tick_stable+0x51>
0003    3:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)
000b    b:	9c                   	pushf
000c    c:	8f 04 24             	pop    (%rsp)
000f    f:	8b 04 24             	mov    (%rsp),%eax
0012   12:	fa                   	cli
0013   13:	0f ba e0 09          	bt     $0x9,%eax
0017   17:	73 05                	jae    1e <sched_clock_tick_stable+0x1e>
0019   19:	e8 00 00 00 00       	call   1e <sched_clock_tick_stable+0x1e>	1a: R_X86_64_PLT32	trace_hardirqs_off-0x4
001e   1e:	e8 00 00 00 00       	call   23 <sched_clock_tick_stable+0x23>	1f: R_X86_64_PLT32	ktime_get-0x4
0023   23:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 2a <sched_clock_tick_stable+0x2a>	26: R_X86_64_PC32	sched_clock_data+0x4
002a   2a:	e8 00 00 00 00       	call   2f <sched_clock_tick_stable+0x2f>	2b: R_X86_64_PLT32	sched_clock-0x4
002f   2f:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 36 <sched_clock_tick_stable+0x36>	32: R_X86_64_PC32	sched_clock_data-0x4
0036   36:	48 03 05 00 00 00 00 	add    0x0(%rip),%rax        # 3d <sched_clock_tick_stable+0x3d>	39: R_X86_64_PC32	__sched_clock_offset-0x4
003d   3d:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 44 <sched_clock_tick_stable+0x44>	40: R_X86_64_PC32	sched_clock_data+0x4
0044   44:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 4b <sched_clock_tick_stable+0x4b>	47: R_X86_64_PC32	.data..read_mostly+0x211c
004b   4b:	e8 00 00 00 00       	call   50 <sched_clock_tick_stable+0x50>	4c: R_X86_64_PLT32	trace_hardirqs_on-0x4
0050   50:	fb                   	sti
0051   51:	58                   	pop    %rax
0052   52:	c3                   	ret
0053   53:	cc                   	int3
0000 0000000000000000 <sched_clock_idle_sleep_event>:
0000    0:	31 ff                	xor    %edi,%edi
0002    2:	e9 00 00 00 00       	jmp    7 <__pcpu_unique_cpu_debug_store>	3: R_X86_64_PLT32	sched_clock_cpu-0x4
0000 0000000000000000 <sched_clock_idle_wakeup_event>:
0000    0:	53                   	push   %rbx
0001    1:	50                   	push   %rax
0002    2:	eb 07                	jmp    b <sched_clock_idle_wakeup_event+0xb>
0004    4:	48 83 c4 08          	add    $0x8,%rsp
0008    8:	5b                   	pop    %rbx
0009    9:	c3                   	ret
000a    a:	cc                   	int3
000b    b:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 12 <sched_clock_idle_wakeup_event+0x12>	d: R_X86_64_PC32	timekeeping_suspended-0x5
0012   12:	75 f0                	jne    4 <sched_clock_idle_wakeup_event+0x4>
0014   14:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)
001c   1c:	9c                   	pushf
001d   1d:	8f 04 24             	pop    (%rsp)
0020   20:	48 8b 1c 24          	mov    (%rsp),%rbx
0024   24:	fa                   	cli
0025   25:	0f ba e3 09          	bt     $0x9,%ebx
0029   29:	72 07                	jb     32 <sched_clock_idle_wakeup_event+0x32>
002b   2b:	e8 00 00 00 00       	call   30 <sched_clock_idle_wakeup_event+0x30>	2c: R_X86_64_PLT32	sched_clock_tick-0x4
0030   30:	eb 0f                	jmp    41 <sched_clock_idle_wakeup_event+0x41>
0032   32:	e8 00 00 00 00       	call   37 <sched_clock_idle_wakeup_event+0x37>	33: R_X86_64_PLT32	trace_hardirqs_off-0x4
0037   37:	e8 00 00 00 00       	call   3c <sched_clock_idle_wakeup_event+0x3c>	38: R_X86_64_PLT32	sched_clock_tick-0x4
003c   3c:	e8 00 00 00 00       	call   41 <sched_clock_idle_wakeup_event+0x41>	3d: R_X86_64_PLT32	trace_hardirqs_on-0x4
0041   41:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)
0049   49:	9c                   	pushf
004a   4a:	8f 04 24             	pop    (%rsp)
004d   4d:	0f ba 24 24 09       	btl    $0x9,(%rsp)
0052   52:	72 09                	jb     5d <sched_clock_idle_wakeup_event+0x5d>
0054   54:	0f ba e3 09          	bt     $0x9,%ebx
0058   58:	73 aa                	jae    4 <sched_clock_idle_wakeup_event+0x4>
005a   5a:	fb                   	sti
005b   5b:	eb a7                	jmp    4 <sched_clock_idle_wakeup_event+0x4>
005d   5d:	e8 00 00 00 00       	call   62 <sched_clock_idle_wakeup_event+0x62>	5e: R_X86_64_PLT32	warn_bogus_irq_restore-0x4
0062   62:	eb f0                	jmp    54 <sched_clock_idle_wakeup_event+0x54>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
