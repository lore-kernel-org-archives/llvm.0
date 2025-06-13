Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD9C1E1E1F;
	Fri, 13 Jun 2025 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826801; cv=none; b=WKKeQu3XcBguLd/3DsIPxmAUx91BtU84qvmkbMe+reDrrs7nEctQfxVthG4RFvlC5Fp+2IRPLOlAWrmEmmmWCHN7hxjgBoHwz974VEOeVgzau2n5KocS90BPMgQZcNi/R3B4Cdm0QAhMc8WhtASjPHi1XwCBmZobIns/LqNlhNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826801; c=relaxed/simple;
	bh=O7y2sLzDnmhlXUTNDk76iKCJpXYhQERAHF6YUKOWvOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fPaLWlo/pEJZ8MwENXJs3tKfn1Xkaa4Fiy9I53y+s2lUHs/AmiX6KuojlwDNvY9FRW2GdbsGoxJmxkfusj65LmBsqtMW8q80lXxS7t5WnOGrXzIVc0I6c7FTYramE/wOUnQWrxJvrbsPHEXLZeFWE4ZvKmFsAAgRzcmmryW7tEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 64A78140714;
	Fri, 13 Jun 2025 14:59:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id D0E0320012;
	Fri, 13 Jun 2025 14:59:42 +0000 (UTC)
Date: Fri, 13 Jun 2025 10:59:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/5] tracing: sorttable: Add a tracepoint
 verification check at build time
Message-ID: <20250613105941.214bb5ac@batman.local.home>
In-Reply-To: <202506132216.L4D2C3vJ-lkp@intel.com>
References: <20250613000328.791312828@goodmis.org>
	<202506132216.L4D2C3vJ-lkp@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D0E0320012
X-Stat-Signature: ybpriq4r4h4tiu8irnat7mi8obd47yu3
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19wSSAPWyojh5eBXsF32hw58TJuxhpV87w=
X-HE-Tag: 1749826782-801453
X-HE-Meta: U2FsdGVkX19OMMUXkUbjKVL2Fj4ZSgRhQF/SPUI+THlx2xxK7ZvScc2cn55XnzNaA7lGj24uXknH/cFdVlI5Bpn5nSdrLmaMmgAkTcaJIKJiLq+6iYUVH03y1jseghSDribDdYqbUBdkgJP63h4NN22yfirvvt2MVkbxCcrQ6B2b74vNC9fo6uIY3XF2avLbMLjTOxqeX42Nj9yrZr3tIwoXp5NO+pK0U69U8AS89S/9c202U6AvJ/3p/j7jAlce3KAb+cmt629QZhrC5NHFmSBbclUtwA5f8ggnZlTbINmORkFLtEdJIlKfCrQJ7wOjBC3N7P6rRFj4LWwtXBuK1vLB+Q+7pNeBo/2gG92CfENAq28YWFJJU3b94vJJzpXUGtHjsx0UYADfxk+o8is/TOomnkbmA3q3dfVlVrAdk1r6EqhQAS+0kPCY37pzimF4ExBVHgDiDM2g4y8LBgI5aOCAAoHF4vj0lc0tQ4aSVD7rWbiy+u5F5ffziX18N0Zkz5M0X2qqLkRMACFBymzK9g==

On Fri, 13 Jun 2025 22:50:49 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Steven,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on trace/for-next]
> [also build test WARNING on arnd-asm-generic/master masahiroy-kbuild/for-next masahiroy-kbuild/fixes linus/master v6.16-rc1 next-20250613]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracepoints-Add-verifier-that-makes-sure-all-defined-tracepoints-are-used/20250613-080344
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
> patch link:    https://lore.kernel.org/r/20250613000328.791312828%40goodmis.org
> patch subject: [PATCH v2 2/5] tracing: sorttable: Add a tracepoint verification check at build time
> config: x86_64-buildonly-randconfig-001-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132216.L4D2C3vJ-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506132216.L4D2C3vJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506132216.L4D2C3vJ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> warning: tracepoint 'xen_mc_batch' is unused.
> >> warning: tracepoint 'xen_mc_issue' is unused.
> >> warning: tracepoint 'xen_mc_entry' is unused.
> >> warning: tracepoint 'xen_mc_entry_alloc' is unused.
> >> warning: tracepoint 'xen_mc_callback' is unused.
> >> warning: tracepoint 'xen_mc_flush_reason' is unused.
> >> warning: tracepoint 'xen_mc_flush' is unused.
> >> warning: tracepoint 'xen_mc_extend_args' is unused.
> >> warning: tracepoint 'xen_mmu_set_pte' is unused.
> >> warning: tracepoint 'xen_mmu_set_pmd' is unused.
> >> warning: tracepoint 'xen_mmu_set_pud' is unused.
> >> warning: tracepoint 'xen_mmu_set_p4d' is unused.
> >> warning: tracepoint 'xen_mmu_ptep_modify_prot_start' is unused.
> >> warning: tracepoint 'xen_mmu_ptep_modify_prot_commit' is unused.
> >> warning: tracepoint 'xen_mmu_alloc_ptpage' is unused.
> >> warning: tracepoint 'xen_mmu_release_ptpage' is unused.
> >> warning: tracepoint 'xen_mmu_pgd_pin' is unused.
> >> warning: tracepoint 'xen_mmu_pgd_unpin' is unused.
> >> warning: tracepoint 'xen_mmu_flush_tlb_one_user' is unused.
> >> warning: tracepoint 'xen_mmu_flush_tlb_multi' is unused.  

As the patch set adds these warnings, this shows that it works! ;-)

-- Steve

>    warning: tracepoint 'xen_mmu_write_cr3' is unused.
>    warning: tracepoint 'xen_cpu_write_ldt_entry' is unused.
>    warning: tracepoint 'xen_cpu_write_idt_entry' is unused.
>    warning: tracepoint 'xen_cpu_load_idt' is unused.
>    warning: tracepoint 'xen_cpu_write_gdt_entry' is unused.
>    warning: tracepoint 'xen_cpu_set_ldt' is unused.
>    warning: tracepoint 'vector_free_moved' is unused.
>    warning: tracepoint 'x86_fpu_before_restore' is unused.
>    warning: tracepoint 'x86_fpu_after_restore' is unused.
>    warning: tracepoint 'x86_fpu_init_state' is unused.
>    warning: tracepoint 'sched_migrate_task' is unused.
>    warning: tracepoint 'sched_move_numa' is unused.
>    warning: tracepoint 'sched_stick_numa' is unused.
>    warning: tracepoint 'sched_swap_numa' is unused.
>    warning: tracepoint 'pelt_cfs_tp' is unused.
>    warning: tracepoint 'pelt_rt_tp' is unused.
>    warning: tracepoint 'pelt_dl_tp' is unused.
>    warning: tracepoint 'pelt_hw_tp' is unused.
>    warning: tracepoint 'pelt_irq_tp' is unused.
>    warning: tracepoint 'pelt_se_tp' is unused.
>    warning: tracepoint 'sched_cpu_capacity_tp' is unused.
>    warning: tracepoint 'sched_overutilized_tp' is unused.
>    warning: tracepoint 'sched_util_est_cfs_tp' is unused.
>    warning: tracepoint 'sched_util_est_se_tp' is unused.
>    warning: tracepoint 'sched_compute_energy_tp' is unused.
>    warning: tracepoint 'ipi_raise' is unused.
>    warning: tracepoint 'ipi_send_cpumask' is unused.
>    warning: tracepoint 'ipi_entry' is unused.
>    warning: tracepoint 'ipi_exit' is unused.
>    warning: tracepoint 'console' is unused.
>    warning: tracepoint 'irq_matrix_alloc_reserved' is unused.
>    warning: tracepoint 'timer_base_idle' is unused.
>    warning: tracepoint 'alarmtimer_suspend' is unused.
>    warning: tracepoint 'ftrace_test_filter' is unused.
>    warning: tracepoint 'psci_domain_idle_enter' is unused.
>    warning: tracepoint 'psci_domain_idle_exit' is unused.
>    warning: tracepoint 'powernv_throttle' is unused.
>    warning: tracepoint 'clock_enable' is unused.
>    warning: tracepoint 'clock_disable' is unused.
>    warning: tracepoint 'clock_set_rate' is unused.
>    warning: tracepoint 'power_domain_target' is unused.
>    warning: tracepoint 'guest_halt_poll_ns' is unused.
>    warning: tracepoint 'xdp_exception' is unused.
>    warning: tracepoint 'xdp_bulk_tx' is unused.
>    warning: tracepoint 'xdp_redirect' is unused.
>    warning: tracepoint 'xdp_redirect_err' is unused.
>    warning: tracepoint 'xdp_redirect_map' is unused.
>    warning: tracepoint 'xdp_redirect_map_err' is unused.
>    warning: tracepoint 'xdp_cpumap_kthread' is unused.
>    warning: tracepoint 'xdp_cpumap_enqueue' is unused.
>    warning: tracepoint 'xdp_devmap_xmit' is unused.
>    warning: tracepoint 'mem_disconnect' is unused.
>    warning: tracepoint 'mem_connect' is unused.
>    warning: tracepoint 'mem_return_failed' is unused.
>    warning: tracepoint 'bpf_xdp_link_attach_failed' is unused.
>    warning: tracepoint 'oom_score_adj_update' is unused.
>    warning: tracepoint 'mm_vmscan_node_reclaim_begin' is unused.
>    warning: tracepoint 'mm_vmscan_node_reclaim_end' is unused.
>    warning: tracepoint 'vma_mas_szero' is unused.
>    warning: tracepoint 'vma_store' is unused.
>    warning: tracepoint 'edma_readw' is unused.
>    warning: tracepoint 'edma_readb' is unused.
>    warning: tracepoint 'dma_fence_emit' is unused.
>    warning: tracepoint 'xhci_dbc_handle_event' is unused.
>    warning: tracepoint 'xhci_dbc_handle_transfer' is unused.
>    warning: tracepoint 'xhci_dbc_gadget_ep_queue' is unused.
>    warning: tracepoint 'xhci_dbc_alloc_request' is unused.
>    warning: tracepoint 'xhci_dbc_free_request' is unused.
>    warning: tracepoint 'xhci_dbc_queue_request' is unused.
>    warning: tracepoint 'xhci_dbc_giveback_request' is unused.
>    warning: tracepoint 'musb_req_gb' is unused.
>    warning: tracepoint 'musb_req_tx' is unused.
>    warning: tracepoint 'musb_req_rx' is unused.
>    warning: tracepoint 'musb_req_alloc' is unused.
>    warning: tracepoint 'musb_req_free' is unused.
>    warning: tracepoint 'musb_req_start' is unused.
>    warning: tracepoint 'musb_req_enq' is unused.
>    warning: tracepoint 'musb_req_deq' is unused.
>    warning: tracepoint 'ucsi_run_command' is unused.
>    warning: tracepoint 'ucsi_reset_ppm' is unused.
>    warning: tracepoint 'vb2_v4l2_buf_done' is unused.
>    warning: tracepoint 'vb2_v4l2_buf_queue' is unused.
>    warning: tracepoint 'vb2_v4l2_dqbuf' is unused.
>    warning: tracepoint 'vb2_v4l2_qbuf' is unused.
>    warning: tracepoint 'mc_event' is unused.
>    warning: tracepoint 'aer_event' is unused.
> 

