Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8714314278;
	Mon, 10 Jul 2023 17:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689011365; x=1720547365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1rnjq52rMilUdCQE77lTXTRetTq1hKAQtjh2X2VtSlk=;
  b=fOMDsA1zrQnCfUjMdGAkzEots0ryoOTEkjjpTtCOUY5ZP5h8j0L31fF2
   geObCginW84/i9cSQmDokqGhGcjzw44U5ITK8m5j6q0GFdZUY3RO6QIK1
   WS712vqVQH+0rH7LlT5r55h/uzFxW6JckSKpEl3047BPI7LZW5/lKjsOu
   ypdBL09Oo7790WqY9kwbDTGsOx3GqMUnhpbPcKts/SCae1atnrwEwAhLG
   FA1fDEUFqHF6XTapGi7gno0qhijCzqIraz4c6BU339ZN+r2CGARL0BaEm
   e5YdQvzrNOkn0eTGv1xcZ0LIk67mB+az9DYbBS1YMmEk2ytsTnCyCGEY/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430494908"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="430494908"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 10:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724104418"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="724104418"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Jul 2023 10:49:22 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIv0k-0003ra-09;
	Mon, 10 Jul 2023 17:49:22 +0000
Date: Tue, 11 Jul 2023 01:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Wander Lairson Costa <wander@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/maybe 1/14] ERROR: modpost: vmlinux: local
 symbol '__put_task_struct_rcu_cb' was exported
Message-ID: <202307110147.tDoRemZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/maybe
head:   69ff1e365682e2d516364c010b51f8a95140cd94
commit: eb15cb094ddb0227c9dfe5eb836d1a4357f070fd [1/14] kernel/fork: beware of __put_task_struct calling context
config: riscv-randconfig-r042-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110147.tDoRemZ7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110147.tDoRemZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110147.tDoRemZ7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: fprop_new_period+0x5f0 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fprop_new_period+0x618 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fprop_new_period+0x62c (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fprop_new_period+0x640 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fprop_new_period+0x654 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fprop_new_period+0x662 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0xa6 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0xb0 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0xbc (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0xde (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0xf2 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0x102 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0x106 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0x11a (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0x12e (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0x13e (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0x152 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0x164 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0x16a (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0x178 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_sparse_area+0x17e (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x2068 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x206c (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x2070 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x2082 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x2086 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x2094 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x2098 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x20aa (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x20ae (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x20f4 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x2156 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x215a (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x2178 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x217c (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x219a (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x219e (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x21bc (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x21c0 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x21e4 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x21e8 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x2202 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x2206 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_modify+0x24cc (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: time64_str+0x5a (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x24 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x30 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x44 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x50 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x5c (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x6e (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x7a (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x86 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x25e (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x272 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x28a (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x2a0 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x2b4 (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x2da (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x2ee (section: .text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x302 (section: .text) -> set_reset_devices (section: .init.text)
ERROR: modpost: vmlinux: local symbol 'system_state' was exported
ERROR: modpost: vmlinux: local symbol 'static_key_initialized' was exported
ERROR: modpost: vmlinux: local symbol 'reset_devices' was exported
ERROR: modpost: vmlinux: local symbol 'loops_per_jiffy' was exported
ERROR: modpost: vmlinux: local symbol 'init_uts_ns' was exported
ERROR: modpost: vmlinux: local symbol 'init_task' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_cached_mvendorid' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_cached_marchid' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_cached_mimpid' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_isa_extension_base' was exported
ERROR: modpost: vmlinux: local symbol '__riscv_isa_extension_available' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_get_intc_hwnode' was exported
ERROR: modpost: vmlinux: local symbol '__stack_chk_guard' was exported
ERROR: modpost: vmlinux: local symbol 'pm_power_off' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_timebase' was exported
ERROR: modpost: vmlinux: local symbol 'memset' was exported
ERROR: modpost: vmlinux: local symbol 'memcpy' was exported
ERROR: modpost: vmlinux: local symbol 'memmove' was exported
ERROR: modpost: vmlinux: local symbol 'strcmp' was exported
ERROR: modpost: vmlinux: local symbol 'strlen' was exported
ERROR: modpost: vmlinux: local symbol 'strncmp' was exported
ERROR: modpost: vmlinux: local symbol '__memset' was exported
ERROR: modpost: vmlinux: local symbol '__memcpy' was exported
ERROR: modpost: vmlinux: local symbol '__memmove' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_set_cacheinfo_ops' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_map' was exported
ERROR: modpost: vmlinux: local symbol 'satp_mode' was exported
ERROR: modpost: vmlinux: local symbol 'pgtable_l4_enabled' was exported
ERROR: modpost: vmlinux: local symbol 'pgtable_l5_enabled' was exported
ERROR: modpost: vmlinux: local symbol 'phys_ram_base' was exported
ERROR: modpost: vmlinux: local symbol 'empty_zero_page' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_cbom_block_size' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_cboz_block_size' was exported
ERROR: modpost: vmlinux: local symbol 'arch_wb_cache_pmem' was exported
ERROR: modpost: vmlinux: local symbol 'arch_invalidate_pmem' was exported
ERROR: modpost: vmlinux: local symbol 'lockdep_tasklist_lock_is_held' was exported
ERROR: modpost: vmlinux: local symbol 'free_task' was exported
ERROR: modpost: vmlinux: local symbol '__mmdrop' was exported
ERROR: modpost: vmlinux: local symbol '__put_task_struct' was exported
>> ERROR: modpost: vmlinux: local symbol '__put_task_struct_rcu_cb' was exported
ERROR: modpost: vmlinux: local symbol 'mmput' was exported
ERROR: modpost: vmlinux: local symbol 'get_task_mm' was exported
ERROR: modpost: vmlinux: local symbol 'panic_timeout' was exported
ERROR: modpost: vmlinux: local symbol 'panic_notifier_list' was exported
ERROR: modpost: vmlinux: local symbol 'panic_blink' was exported
ERROR: modpost: vmlinux: local symbol 'nmi_panic' was exported
ERROR: modpost: vmlinux: local symbol 'panic' was exported
ERROR: modpost: vmlinux: local symbol 'test_taint' was exported
ERROR: modpost: vmlinux: local symbol 'add_taint' was exported
ERROR: modpost: vmlinux: local symbol '__stack_chk_fail' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_state_add_instance' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_setup_state_cpuslocked' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_setup_state' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_state_remove_instance' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_remove_state_cpuslocked' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_remove_state' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_bit_bitmap' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_all_bits' was exported
ERROR: modpost: vmlinux: local symbol '__cpu_possible_mask' was exported
ERROR: modpost: vmlinux: local symbol '__cpu_online_mask' was exported
ERROR: modpost: vmlinux: local symbol '__cpu_present_mask' was exported
ERROR: modpost: vmlinux: local symbol '__cpu_active_mask' was exported
ERROR: modpost: vmlinux: local symbol '__cpu_dying_mask' was exported
ERROR: modpost: vmlinux: local symbol '__num_online_cpus' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_mitigations_off' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_mitigations_auto_nosmt' was exported
ERROR: modpost: vmlinux: local symbol 'rcuwait_wake_up' was exported
ERROR: modpost: vmlinux: local symbol 'thread_group_exited' was exported
ERROR: modpost: vmlinux: local symbol 'abort' was exported
ERROR: modpost: vmlinux: local symbol 'irq_stat' was exported
ERROR: modpost: vmlinux: local symbol 'hardirqs_enabled' was exported
ERROR: modpost: vmlinux: local symbol 'hardirq_context' was exported
ERROR: modpost: vmlinux: local symbol '__local_bh_disable_ip' was exported
ERROR: modpost: vmlinux: local symbol '_local_bh_enable' was exported
ERROR: modpost: vmlinux: local symbol '__local_bh_enable_ip' was exported
ERROR: modpost: vmlinux: local symbol '__tasklet_schedule' was exported
ERROR: modpost: vmlinux: local symbol '__tasklet_hi_schedule' was exported
ERROR: modpost: vmlinux: local symbol 'tasklet_setup' was exported
ERROR: modpost: vmlinux: local symbol 'tasklet_init' was exported
ERROR: modpost: vmlinux: local symbol 'tasklet_kill' was exported
ERROR: modpost: vmlinux: local symbol 'ioport_resource' was exported
ERROR: modpost: vmlinux: local symbol 'iomem_resource' was exported
ERROR: modpost: vmlinux: local symbol 'request_resource' was exported
ERROR: modpost: vmlinux: local symbol 'release_resource' was exported
ERROR: modpost: vmlinux: local symbol 'walk_iomem_res_desc' was exported
ERROR: modpost: vmlinux: local symbol 'page_is_ram' was exported
ERROR: modpost: vmlinux: local symbol 'region_intersects' was exported
ERROR: modpost: vmlinux: local symbol 'allocate_resource' was exported
ERROR: modpost: vmlinux: local symbol 'insert_resource' was exported
ERROR: modpost: vmlinux: local symbol 'insert_resource_expand_to_fit' was exported
ERROR: modpost: vmlinux: local symbol 'remove_resource' was exported
ERROR: modpost: vmlinux: local symbol 'adjust_resource' was exported
ERROR: modpost: vmlinux: local symbol '__request_region' was exported
ERROR: modpost: vmlinux: local symbol '__release_region' was exported
ERROR: modpost: vmlinux: local symbol 'devm_request_resource' was exported
ERROR: modpost: vmlinux: local symbol 'devm_release_resource' was exported
ERROR: modpost: vmlinux: local symbol '__devm_request_region' was exported
ERROR: modpost: vmlinux: local symbol '__devm_release_region' was exported
ERROR: modpost: vmlinux: local symbol 'resource_list_create_entry' was exported
ERROR: modpost: vmlinux: local symbol 'resource_list_free' was exported
ERROR: modpost: vmlinux: local symbol 'sysctl_vals' was exported
ERROR: modpost: vmlinux: local symbol 'sysctl_long_vals' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dobool' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dointvec' was exported
ERROR: modpost: vmlinux: local symbol 'proc_douintvec' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dointvec_jiffies' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dointvec_minmax' was exported
ERROR: modpost: vmlinux: local symbol 'proc_douintvec_minmax' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dointvec_userhz_jiffies' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dointvec_ms_jiffies' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dostring' was exported
ERROR: modpost: vmlinux: local symbol 'proc_doulongvec_minmax' was exported
ERROR: modpost: vmlinux: local symbol 'proc_doulongvec_ms_jiffies_minmax' was exported
ERROR: modpost: vmlinux: local symbol 'proc_do_large_bitmap' was exported
ERROR: modpost: vmlinux: local symbol 'has_capability' was exported
ERROR: modpost: vmlinux: local symbol 'has_capability_noaudit' was exported
ERROR: modpost: vmlinux: local symbol 'ns_capable' was exported
ERROR: modpost: vmlinux: local symbol 'ns_capable_noaudit' was exported
ERROR: modpost: vmlinux: local symbol 'ns_capable_setid' was exported
ERROR: modpost: vmlinux: local symbol 'capable' was exported
ERROR: modpost: vmlinux: local symbol 'file_ns_capable' was exported
ERROR: modpost: vmlinux: local symbol 'capable_wrt_inode_uidgid' was exported
ERROR: modpost: vmlinux: local symbol 'task_user_regset_view' was exported
ERROR: modpost: vmlinux: local symbol 'init_user_ns' was exported
ERROR: modpost: vmlinux: local symbol 'free_uid' was exported
ERROR: modpost: vmlinux: local symbol 'recalc_sigpending' was exported
ERROR: modpost: vmlinux: local symbol 'flush_signals' was exported
ERROR: modpost: vmlinux: local symbol 'dequeue_signal' was exported
ERROR: modpost: vmlinux: local symbol 'kill_pid_usb_asyncio' was exported
ERROR: modpost: vmlinux: local symbol 'send_sig_info' was exported
ERROR: modpost: vmlinux: local symbol 'send_sig' was exported
ERROR: modpost: vmlinux: local symbol 'force_sig' was exported
ERROR: modpost: vmlinux: local symbol 'send_sig_mceerr' was exported
ERROR: modpost: vmlinux: local symbol 'kill_pgrp' was exported
ERROR: modpost: vmlinux: local symbol 'kill_pid' was exported
ERROR: modpost: vmlinux: local symbol 'sigprocmask' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_sigaction' was exported
ERROR: modpost: vmlinux: local symbol 'overflowuid' was exported
ERROR: modpost: vmlinux: local symbol 'overflowgid' was exported
ERROR: modpost: vmlinux: local symbol 'fs_overflowuid' was exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
