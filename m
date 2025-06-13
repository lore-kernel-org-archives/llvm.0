Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7777192B84;
	Fri, 13 Jun 2025 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826311; cv=none; b=SusJs6W+XPGjLQoe2MWXEbwBPcvIUevOIYsh7a58PcAAg+2h15k+S0EPbpZQWZL9pxRUDwFXib+9UykfFmmobaQD+lf9oN34U739WGmVebNWUfj3HrpBzVHZHAWnpXCAj64tWfkMWPXBCiVyU48OrcpN1uxE0wPD0haiCoOdnKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826311; c=relaxed/simple;
	bh=Abdf97gk6JtFb5ymzJH+IQqTC7DCOnkjdL/qy9oTuZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xy52otJaxIJXlATSL55kZQwwgE74j3gAcNZBcERWEHoArgFqAr/V7St5DFcyMZiJweZdKChm5ZrmhvKziM341s3ZCetIqxt/fRp6wY/WtM1yskVP/WYxppQ35VpsdDFh8PqrZiN7UEzLMe/5yKwTJGuDCLvtkfJ2PdNxkgJ9yH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M87y1N6B; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M87y1N6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749826310; x=1781362310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Abdf97gk6JtFb5ymzJH+IQqTC7DCOnkjdL/qy9oTuZU=;
  b=M87y1N6BRfEnbuGVF+ySZI7XC9voP90QKkbN2E+Nauw2gD/Oh68+56ZO
   eyxKfdonvn2qV/0PMtg1FzvBdq+Sn+KngBEy4JyYWMSFHXkY6L9Z4g66r
   g8gxqBYDYziRMBWpChWfbRn7uMWXI3rwmqoLBdYh5dlzFnXvT7vPwbcpF
   gDtflF4q0uwU+PcW7xkm94puSSIqTNjN/IK3jqdIgeUnR9GnQfXKJMWT6
   d+ljaYDt7AosbN8g3MQN86sGgn6cPr8iMhRvAE4JUUrrU/FFETBMMKZ7L
   EhMoUGNQF/DMJInJ78sRq5mWECFq49DwBexmcG4WpuC/XdoPTZbXAMTru
   A==;
X-CSE-ConnectionGUID: RF1feGc6SiisqeLaqXzl5Q==
X-CSE-MsgGUID: /6m83iyITsec6pHxsWp4RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52192230"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="52192230"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 07:51:47 -0700
X-CSE-ConnectionGUID: NebCQx4VSsG4I0ntruAmYg==
X-CSE-MsgGUID: RVaeQwGDTM6JL4Dj7q6BXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148392186"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2025 07:51:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ5kt-000CiY-1V;
	Fri, 13 Jun 2025 14:51:43 +0000
Date: Fri, 13 Jun 2025 22:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/5] tracing: sorttable: Add a tracepoint verification
 check at build time
Message-ID: <202506132216.L4D2C3vJ-lkp@intel.com>
References: <20250613000328.791312828@goodmis.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613000328.791312828@goodmis.org>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on arnd-asm-generic/master masahiroy-kbuild/for-next masahiroy-kbuild/fixes linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracepoints-Add-verifier-that-makes-sure-all-defined-tracepoints-are-used/20250613-080344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250613000328.791312828%40goodmis.org
patch subject: [PATCH v2 2/5] tracing: sorttable: Add a tracepoint verification check at build time
config: x86_64-buildonly-randconfig-001-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132216.L4D2C3vJ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506132216.L4D2C3vJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506132216.L4D2C3vJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: tracepoint 'xen_mc_batch' is unused.
>> warning: tracepoint 'xen_mc_issue' is unused.
>> warning: tracepoint 'xen_mc_entry' is unused.
>> warning: tracepoint 'xen_mc_entry_alloc' is unused.
>> warning: tracepoint 'xen_mc_callback' is unused.
>> warning: tracepoint 'xen_mc_flush_reason' is unused.
>> warning: tracepoint 'xen_mc_flush' is unused.
>> warning: tracepoint 'xen_mc_extend_args' is unused.
>> warning: tracepoint 'xen_mmu_set_pte' is unused.
>> warning: tracepoint 'xen_mmu_set_pmd' is unused.
>> warning: tracepoint 'xen_mmu_set_pud' is unused.
>> warning: tracepoint 'xen_mmu_set_p4d' is unused.
>> warning: tracepoint 'xen_mmu_ptep_modify_prot_start' is unused.
>> warning: tracepoint 'xen_mmu_ptep_modify_prot_commit' is unused.
>> warning: tracepoint 'xen_mmu_alloc_ptpage' is unused.
>> warning: tracepoint 'xen_mmu_release_ptpage' is unused.
>> warning: tracepoint 'xen_mmu_pgd_pin' is unused.
>> warning: tracepoint 'xen_mmu_pgd_unpin' is unused.
>> warning: tracepoint 'xen_mmu_flush_tlb_one_user' is unused.
>> warning: tracepoint 'xen_mmu_flush_tlb_multi' is unused.
   warning: tracepoint 'xen_mmu_write_cr3' is unused.
   warning: tracepoint 'xen_cpu_write_ldt_entry' is unused.
   warning: tracepoint 'xen_cpu_write_idt_entry' is unused.
   warning: tracepoint 'xen_cpu_load_idt' is unused.
   warning: tracepoint 'xen_cpu_write_gdt_entry' is unused.
   warning: tracepoint 'xen_cpu_set_ldt' is unused.
   warning: tracepoint 'vector_free_moved' is unused.
   warning: tracepoint 'x86_fpu_before_restore' is unused.
   warning: tracepoint 'x86_fpu_after_restore' is unused.
   warning: tracepoint 'x86_fpu_init_state' is unused.
   warning: tracepoint 'sched_migrate_task' is unused.
   warning: tracepoint 'sched_move_numa' is unused.
   warning: tracepoint 'sched_stick_numa' is unused.
   warning: tracepoint 'sched_swap_numa' is unused.
   warning: tracepoint 'pelt_cfs_tp' is unused.
   warning: tracepoint 'pelt_rt_tp' is unused.
   warning: tracepoint 'pelt_dl_tp' is unused.
   warning: tracepoint 'pelt_hw_tp' is unused.
   warning: tracepoint 'pelt_irq_tp' is unused.
   warning: tracepoint 'pelt_se_tp' is unused.
   warning: tracepoint 'sched_cpu_capacity_tp' is unused.
   warning: tracepoint 'sched_overutilized_tp' is unused.
   warning: tracepoint 'sched_util_est_cfs_tp' is unused.
   warning: tracepoint 'sched_util_est_se_tp' is unused.
   warning: tracepoint 'sched_compute_energy_tp' is unused.
   warning: tracepoint 'ipi_raise' is unused.
   warning: tracepoint 'ipi_send_cpumask' is unused.
   warning: tracepoint 'ipi_entry' is unused.
   warning: tracepoint 'ipi_exit' is unused.
   warning: tracepoint 'console' is unused.
   warning: tracepoint 'irq_matrix_alloc_reserved' is unused.
   warning: tracepoint 'timer_base_idle' is unused.
   warning: tracepoint 'alarmtimer_suspend' is unused.
   warning: tracepoint 'ftrace_test_filter' is unused.
   warning: tracepoint 'psci_domain_idle_enter' is unused.
   warning: tracepoint 'psci_domain_idle_exit' is unused.
   warning: tracepoint 'powernv_throttle' is unused.
   warning: tracepoint 'clock_enable' is unused.
   warning: tracepoint 'clock_disable' is unused.
   warning: tracepoint 'clock_set_rate' is unused.
   warning: tracepoint 'power_domain_target' is unused.
   warning: tracepoint 'guest_halt_poll_ns' is unused.
   warning: tracepoint 'xdp_exception' is unused.
   warning: tracepoint 'xdp_bulk_tx' is unused.
   warning: tracepoint 'xdp_redirect' is unused.
   warning: tracepoint 'xdp_redirect_err' is unused.
   warning: tracepoint 'xdp_redirect_map' is unused.
   warning: tracepoint 'xdp_redirect_map_err' is unused.
   warning: tracepoint 'xdp_cpumap_kthread' is unused.
   warning: tracepoint 'xdp_cpumap_enqueue' is unused.
   warning: tracepoint 'xdp_devmap_xmit' is unused.
   warning: tracepoint 'mem_disconnect' is unused.
   warning: tracepoint 'mem_connect' is unused.
   warning: tracepoint 'mem_return_failed' is unused.
   warning: tracepoint 'bpf_xdp_link_attach_failed' is unused.
   warning: tracepoint 'oom_score_adj_update' is unused.
   warning: tracepoint 'mm_vmscan_node_reclaim_begin' is unused.
   warning: tracepoint 'mm_vmscan_node_reclaim_end' is unused.
   warning: tracepoint 'vma_mas_szero' is unused.
   warning: tracepoint 'vma_store' is unused.
   warning: tracepoint 'edma_readw' is unused.
   warning: tracepoint 'edma_readb' is unused.
   warning: tracepoint 'dma_fence_emit' is unused.
   warning: tracepoint 'xhci_dbc_handle_event' is unused.
   warning: tracepoint 'xhci_dbc_handle_transfer' is unused.
   warning: tracepoint 'xhci_dbc_gadget_ep_queue' is unused.
   warning: tracepoint 'xhci_dbc_alloc_request' is unused.
   warning: tracepoint 'xhci_dbc_free_request' is unused.
   warning: tracepoint 'xhci_dbc_queue_request' is unused.
   warning: tracepoint 'xhci_dbc_giveback_request' is unused.
   warning: tracepoint 'musb_req_gb' is unused.
   warning: tracepoint 'musb_req_tx' is unused.
   warning: tracepoint 'musb_req_rx' is unused.
   warning: tracepoint 'musb_req_alloc' is unused.
   warning: tracepoint 'musb_req_free' is unused.
   warning: tracepoint 'musb_req_start' is unused.
   warning: tracepoint 'musb_req_enq' is unused.
   warning: tracepoint 'musb_req_deq' is unused.
   warning: tracepoint 'ucsi_run_command' is unused.
   warning: tracepoint 'ucsi_reset_ppm' is unused.
   warning: tracepoint 'vb2_v4l2_buf_done' is unused.
   warning: tracepoint 'vb2_v4l2_buf_queue' is unused.
   warning: tracepoint 'vb2_v4l2_dqbuf' is unused.
   warning: tracepoint 'vb2_v4l2_qbuf' is unused.
   warning: tracepoint 'mc_event' is unused.
   warning: tracepoint 'aer_event' is unused.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
