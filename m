Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E7425F780;
	Tue,  8 Apr 2025 00:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744073942; cv=none; b=nhNKCkbvNpjRr72xZLzMRP/hjD+I48U80d0ofR2cFyI792RLh7A44crxtxudw2VRUsIEzkYSd4PUapLpPvZVyAg3gHlv+u5/P37LWk/YzR3knu+pAv+lrGzeJq1sP94VDtppNe3kEJL/xb+OR0yiTLA+l/HA40khppJ9PyEw2W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744073942; c=relaxed/simple;
	bh=rqEJ5fKEinlaSiR936my10vBP8sHMud48ymlL9JoqFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KDvUibIo0p5njRUALOCYeD5FRdJVp8LLWaRGuxMq9t6CB4ynUoas57b3NS/qdmShdIa/bY6S/CHIq02rhV9d+NEn6foc/ORC6bREWmCZTRcZQSFmrn1jsF4fCLDANKYIZDwBOWwK6tnukTng7qjWlVDH69GL04KnexYd6Ctbpck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LC5xfHrz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LC5xfHrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744073940; x=1775609940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rqEJ5fKEinlaSiR936my10vBP8sHMud48ymlL9JoqFs=;
  b=LC5xfHrzq3zPTpc1f8/ic4d//mufPTWNNnBmLJeYJTuPnJhscvWEK/bc
   vdZEmJMgrjDjOfy7zt28LQdjVCjW28wvKaKKj1pTrosF43J0rU1/frmv4
   fR2vWQLVi/2MEB/fSMQa03J0ZoFtiyTKx0JlwT+tbm1ThzaJTZzeukbnT
   neV0UcyHQe+7VeztnoUnZ63LS7ejtJ09bfZ9sr8R3gfg8cZ45IC68KgSG
   qILZp2kGiNh+lzE95HndbKJy9rdTTXE0e8mX3TyMmChLzgWe0Rc4SJ0g3
   jt/D33nMrB/acHqpnUz/ve4bsUo2U5gKSjMH2P/IHpu0ir5s8wInN7/cQ
   g==;
X-CSE-ConnectionGUID: rMRdPFgbTymj2IluO2ryKA==
X-CSE-MsgGUID: IahXDA+tQbqPZuPpEmFxaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="70863793"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="70863793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 17:58:59 -0700
X-CSE-ConnectionGUID: vDuSEtFQQJaWkTKSiIV/OA==
X-CSE-MsgGUID: PdpP0RB+SUq15mXeXwedLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="128969784"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 17:58:58 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1xIl-0003x1-2d;
	Tue, 08 Apr 2025 00:58:55 +0000
Date: Tue, 8 Apr 2025 08:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:futex_local_v11 19/19] kernel/sys.c:2825:40: error:
 too many arguments to function call, expected 2, have 3
Message-ID: <202504080812.CaCiBBKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v11
head:   718b1e59c2f066b2850f9b206763569e7cc361e5
commit: 718b1e59c2f066b2850f9b206763569e7cc361e5 [19/19] futex: Allow to make the private hash immutable.
config: arm-randconfig-001-20250408 (https://download.01.org/0day-ci/archive/20250408/202504080812.CaCiBBKS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080812.CaCiBBKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080812.CaCiBBKS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sys.c:2825:40: error: too many arguments to function call, expected 2, have 3
    2825 |                 error = futex_hash_prctl(arg2, arg3, arg4);
         |                         ~~~~~~~~~~~~~~~~             ^~~~
   include/linux/futex.h:112:19: note: 'futex_hash_prctl' declared here
     112 | static inline int futex_hash_prctl(unsigned long arg2, unsigned long arg3)
         |                   ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +2825 kernel/sys.c

  2473	
  2474	SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
  2475			unsigned long, arg4, unsigned long, arg5)
  2476	{
  2477		struct task_struct *me = current;
  2478		unsigned char comm[sizeof(me->comm)];
  2479		long error;
  2480	
  2481		error = security_task_prctl(option, arg2, arg3, arg4, arg5);
  2482		if (error != -ENOSYS)
  2483			return error;
  2484	
  2485		error = 0;
  2486		switch (option) {
  2487		case PR_SET_PDEATHSIG:
  2488			if (!valid_signal(arg2)) {
  2489				error = -EINVAL;
  2490				break;
  2491			}
  2492			me->pdeath_signal = arg2;
  2493			break;
  2494		case PR_GET_PDEATHSIG:
  2495			error = put_user(me->pdeath_signal, (int __user *)arg2);
  2496			break;
  2497		case PR_GET_DUMPABLE:
  2498			error = get_dumpable(me->mm);
  2499			break;
  2500		case PR_SET_DUMPABLE:
  2501			if (arg2 != SUID_DUMP_DISABLE && arg2 != SUID_DUMP_USER) {
  2502				error = -EINVAL;
  2503				break;
  2504			}
  2505			set_dumpable(me->mm, arg2);
  2506			break;
  2507	
  2508		case PR_SET_UNALIGN:
  2509			error = SET_UNALIGN_CTL(me, arg2);
  2510			break;
  2511		case PR_GET_UNALIGN:
  2512			error = GET_UNALIGN_CTL(me, arg2);
  2513			break;
  2514		case PR_SET_FPEMU:
  2515			error = SET_FPEMU_CTL(me, arg2);
  2516			break;
  2517		case PR_GET_FPEMU:
  2518			error = GET_FPEMU_CTL(me, arg2);
  2519			break;
  2520		case PR_SET_FPEXC:
  2521			error = SET_FPEXC_CTL(me, arg2);
  2522			break;
  2523		case PR_GET_FPEXC:
  2524			error = GET_FPEXC_CTL(me, arg2);
  2525			break;
  2526		case PR_GET_TIMING:
  2527			error = PR_TIMING_STATISTICAL;
  2528			break;
  2529		case PR_SET_TIMING:
  2530			if (arg2 != PR_TIMING_STATISTICAL)
  2531				error = -EINVAL;
  2532			break;
  2533		case PR_SET_NAME:
  2534			comm[sizeof(me->comm) - 1] = 0;
  2535			if (strncpy_from_user(comm, (char __user *)arg2,
  2536					      sizeof(me->comm) - 1) < 0)
  2537				return -EFAULT;
  2538			set_task_comm(me, comm);
  2539			proc_comm_connector(me);
  2540			break;
  2541		case PR_GET_NAME:
  2542			get_task_comm(comm, me);
  2543			if (copy_to_user((char __user *)arg2, comm, sizeof(comm)))
  2544				return -EFAULT;
  2545			break;
  2546		case PR_GET_ENDIAN:
  2547			error = GET_ENDIAN(me, arg2);
  2548			break;
  2549		case PR_SET_ENDIAN:
  2550			error = SET_ENDIAN(me, arg2);
  2551			break;
  2552		case PR_GET_SECCOMP:
  2553			error = prctl_get_seccomp();
  2554			break;
  2555		case PR_SET_SECCOMP:
  2556			error = prctl_set_seccomp(arg2, (char __user *)arg3);
  2557			break;
  2558		case PR_GET_TSC:
  2559			error = GET_TSC_CTL(arg2);
  2560			break;
  2561		case PR_SET_TSC:
  2562			error = SET_TSC_CTL(arg2);
  2563			break;
  2564		case PR_TASK_PERF_EVENTS_DISABLE:
  2565			error = perf_event_task_disable();
  2566			break;
  2567		case PR_TASK_PERF_EVENTS_ENABLE:
  2568			error = perf_event_task_enable();
  2569			break;
  2570		case PR_GET_TIMERSLACK:
  2571			if (current->timer_slack_ns > ULONG_MAX)
  2572				error = ULONG_MAX;
  2573			else
  2574				error = current->timer_slack_ns;
  2575			break;
  2576		case PR_SET_TIMERSLACK:
  2577			if (rt_or_dl_task_policy(current))
  2578				break;
  2579			if (arg2 <= 0)
  2580				current->timer_slack_ns =
  2581						current->default_timer_slack_ns;
  2582			else
  2583				current->timer_slack_ns = arg2;
  2584			break;
  2585		case PR_MCE_KILL:
  2586			if (arg4 | arg5)
  2587				return -EINVAL;
  2588			switch (arg2) {
  2589			case PR_MCE_KILL_CLEAR:
  2590				if (arg3 != 0)
  2591					return -EINVAL;
  2592				current->flags &= ~PF_MCE_PROCESS;
  2593				break;
  2594			case PR_MCE_KILL_SET:
  2595				current->flags |= PF_MCE_PROCESS;
  2596				if (arg3 == PR_MCE_KILL_EARLY)
  2597					current->flags |= PF_MCE_EARLY;
  2598				else if (arg3 == PR_MCE_KILL_LATE)
  2599					current->flags &= ~PF_MCE_EARLY;
  2600				else if (arg3 == PR_MCE_KILL_DEFAULT)
  2601					current->flags &=
  2602							~(PF_MCE_EARLY|PF_MCE_PROCESS);
  2603				else
  2604					return -EINVAL;
  2605				break;
  2606			default:
  2607				return -EINVAL;
  2608			}
  2609			break;
  2610		case PR_MCE_KILL_GET:
  2611			if (arg2 | arg3 | arg4 | arg5)
  2612				return -EINVAL;
  2613			if (current->flags & PF_MCE_PROCESS)
  2614				error = (current->flags & PF_MCE_EARLY) ?
  2615					PR_MCE_KILL_EARLY : PR_MCE_KILL_LATE;
  2616			else
  2617				error = PR_MCE_KILL_DEFAULT;
  2618			break;
  2619		case PR_SET_MM:
  2620			error = prctl_set_mm(arg2, arg3, arg4, arg5);
  2621			break;
  2622		case PR_GET_TID_ADDRESS:
  2623			error = prctl_get_tid_address(me, (int __user * __user *)arg2);
  2624			break;
  2625		case PR_SET_CHILD_SUBREAPER:
  2626			me->signal->is_child_subreaper = !!arg2;
  2627			if (!arg2)
  2628				break;
  2629	
  2630			walk_process_tree(me, propagate_has_child_subreaper, NULL);
  2631			break;
  2632		case PR_GET_CHILD_SUBREAPER:
  2633			error = put_user(me->signal->is_child_subreaper,
  2634					 (int __user *)arg2);
  2635			break;
  2636		case PR_SET_NO_NEW_PRIVS:
  2637			if (arg2 != 1 || arg3 || arg4 || arg5)
  2638				return -EINVAL;
  2639	
  2640			task_set_no_new_privs(current);
  2641			break;
  2642		case PR_GET_NO_NEW_PRIVS:
  2643			if (arg2 || arg3 || arg4 || arg5)
  2644				return -EINVAL;
  2645			return task_no_new_privs(current) ? 1 : 0;
  2646		case PR_GET_THP_DISABLE:
  2647			if (arg2 || arg3 || arg4 || arg5)
  2648				return -EINVAL;
  2649			error = !!test_bit(MMF_DISABLE_THP, &me->mm->flags);
  2650			break;
  2651		case PR_SET_THP_DISABLE:
  2652			if (arg3 || arg4 || arg5)
  2653				return -EINVAL;
  2654			if (mmap_write_lock_killable(me->mm))
  2655				return -EINTR;
  2656			if (arg2)
  2657				set_bit(MMF_DISABLE_THP, &me->mm->flags);
  2658			else
  2659				clear_bit(MMF_DISABLE_THP, &me->mm->flags);
  2660			mmap_write_unlock(me->mm);
  2661			break;
  2662		case PR_MPX_ENABLE_MANAGEMENT:
  2663		case PR_MPX_DISABLE_MANAGEMENT:
  2664			/* No longer implemented: */
  2665			return -EINVAL;
  2666		case PR_SET_FP_MODE:
  2667			error = SET_FP_MODE(me, arg2);
  2668			break;
  2669		case PR_GET_FP_MODE:
  2670			error = GET_FP_MODE(me);
  2671			break;
  2672		case PR_SVE_SET_VL:
  2673			error = SVE_SET_VL(arg2);
  2674			break;
  2675		case PR_SVE_GET_VL:
  2676			error = SVE_GET_VL();
  2677			break;
  2678		case PR_SME_SET_VL:
  2679			error = SME_SET_VL(arg2);
  2680			break;
  2681		case PR_SME_GET_VL:
  2682			error = SME_GET_VL();
  2683			break;
  2684		case PR_GET_SPECULATION_CTRL:
  2685			if (arg3 || arg4 || arg5)
  2686				return -EINVAL;
  2687			error = arch_prctl_spec_ctrl_get(me, arg2);
  2688			break;
  2689		case PR_SET_SPECULATION_CTRL:
  2690			if (arg4 || arg5)
  2691				return -EINVAL;
  2692			error = arch_prctl_spec_ctrl_set(me, arg2, arg3);
  2693			break;
  2694		case PR_PAC_RESET_KEYS:
  2695			if (arg3 || arg4 || arg5)
  2696				return -EINVAL;
  2697			error = PAC_RESET_KEYS(me, arg2);
  2698			break;
  2699		case PR_PAC_SET_ENABLED_KEYS:
  2700			if (arg4 || arg5)
  2701				return -EINVAL;
  2702			error = PAC_SET_ENABLED_KEYS(me, arg2, arg3);
  2703			break;
  2704		case PR_PAC_GET_ENABLED_KEYS:
  2705			if (arg2 || arg3 || arg4 || arg5)
  2706				return -EINVAL;
  2707			error = PAC_GET_ENABLED_KEYS(me);
  2708			break;
  2709		case PR_SET_TAGGED_ADDR_CTRL:
  2710			if (arg3 || arg4 || arg5)
  2711				return -EINVAL;
  2712			error = SET_TAGGED_ADDR_CTRL(arg2);
  2713			break;
  2714		case PR_GET_TAGGED_ADDR_CTRL:
  2715			if (arg2 || arg3 || arg4 || arg5)
  2716				return -EINVAL;
  2717			error = GET_TAGGED_ADDR_CTRL();
  2718			break;
  2719		case PR_SET_IO_FLUSHER:
  2720			if (!capable(CAP_SYS_RESOURCE))
  2721				return -EPERM;
  2722	
  2723			if (arg3 || arg4 || arg5)
  2724				return -EINVAL;
  2725	
  2726			if (arg2 == 1)
  2727				current->flags |= PR_IO_FLUSHER;
  2728			else if (!arg2)
  2729				current->flags &= ~PR_IO_FLUSHER;
  2730			else
  2731				return -EINVAL;
  2732			break;
  2733		case PR_GET_IO_FLUSHER:
  2734			if (!capable(CAP_SYS_RESOURCE))
  2735				return -EPERM;
  2736	
  2737			if (arg2 || arg3 || arg4 || arg5)
  2738				return -EINVAL;
  2739	
  2740			error = (current->flags & PR_IO_FLUSHER) == PR_IO_FLUSHER;
  2741			break;
  2742		case PR_SET_SYSCALL_USER_DISPATCH:
  2743			error = set_syscall_user_dispatch(arg2, arg3, arg4,
  2744							  (char __user *) arg5);
  2745			break;
  2746	#ifdef CONFIG_SCHED_CORE
  2747		case PR_SCHED_CORE:
  2748			error = sched_core_share_pid(arg2, arg3, arg4, arg5);
  2749			break;
  2750	#endif
  2751		case PR_SET_MDWE:
  2752			error = prctl_set_mdwe(arg2, arg3, arg4, arg5);
  2753			break;
  2754		case PR_GET_MDWE:
  2755			error = prctl_get_mdwe(arg2, arg3, arg4, arg5);
  2756			break;
  2757		case PR_PPC_GET_DEXCR:
  2758			if (arg3 || arg4 || arg5)
  2759				return -EINVAL;
  2760			error = PPC_GET_DEXCR_ASPECT(me, arg2);
  2761			break;
  2762		case PR_PPC_SET_DEXCR:
  2763			if (arg4 || arg5)
  2764				return -EINVAL;
  2765			error = PPC_SET_DEXCR_ASPECT(me, arg2, arg3);
  2766			break;
  2767		case PR_SET_VMA:
  2768			error = prctl_set_vma(arg2, arg3, arg4, arg5);
  2769			break;
  2770		case PR_GET_AUXV:
  2771			if (arg4 || arg5)
  2772				return -EINVAL;
  2773			error = prctl_get_auxv((void __user *)arg2, arg3);
  2774			break;
  2775	#ifdef CONFIG_KSM
  2776		case PR_SET_MEMORY_MERGE:
  2777			if (arg3 || arg4 || arg5)
  2778				return -EINVAL;
  2779			if (mmap_write_lock_killable(me->mm))
  2780				return -EINTR;
  2781	
  2782			if (arg2)
  2783				error = ksm_enable_merge_any(me->mm);
  2784			else
  2785				error = ksm_disable_merge_any(me->mm);
  2786			mmap_write_unlock(me->mm);
  2787			break;
  2788		case PR_GET_MEMORY_MERGE:
  2789			if (arg2 || arg3 || arg4 || arg5)
  2790				return -EINVAL;
  2791	
  2792			error = !!test_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
  2793			break;
  2794	#endif
  2795		case PR_RISCV_V_SET_CONTROL:
  2796			error = RISCV_V_SET_CONTROL(arg2);
  2797			break;
  2798		case PR_RISCV_V_GET_CONTROL:
  2799			error = RISCV_V_GET_CONTROL();
  2800			break;
  2801		case PR_RISCV_SET_ICACHE_FLUSH_CTX:
  2802			error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
  2803			break;
  2804		case PR_GET_SHADOW_STACK_STATUS:
  2805			if (arg3 || arg4 || arg5)
  2806				return -EINVAL;
  2807			error = arch_get_shadow_stack_status(me, (unsigned long __user *) arg2);
  2808			break;
  2809		case PR_SET_SHADOW_STACK_STATUS:
  2810			if (arg3 || arg4 || arg5)
  2811				return -EINVAL;
  2812			error = arch_set_shadow_stack_status(me, arg2);
  2813			break;
  2814		case PR_LOCK_SHADOW_STACK_STATUS:
  2815			if (arg3 || arg4 || arg5)
  2816				return -EINVAL;
  2817			error = arch_lock_shadow_stack_status(me, arg2);
  2818			break;
  2819		case PR_TIMER_CREATE_RESTORE_IDS:
  2820			if (arg3 || arg4 || arg5)
  2821				return -EINVAL;
  2822			error = posixtimer_create_prctl(arg2);
  2823			break;
  2824		case PR_FUTEX_HASH:
> 2825			error = futex_hash_prctl(arg2, arg3, arg4);
  2826			break;
  2827		default:
  2828			trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);
  2829			error = -EINVAL;
  2830			break;
  2831		}
  2832		return error;
  2833	}
  2834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
