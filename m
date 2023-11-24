Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AC42FE13;
	Fri, 24 Nov 2023 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKOjBVyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840491; x=1732376491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=my4N8oTXd+C+izc0Z92jstTR37DP2e+ap4K/1rU0Ddc=;
  b=bKOjBVyIhokUhTcClje3fpzc3ZosXUh3Lmou4yR9KHhDGlcQQdM4cMVh
   8yxgGBT4I7NDkIJAboRmfBW+LPLEb/Q+iVfLfq803du15BlhlAanEk371
   K4dTNCwNnTgHOkOjwTFpM4zie775+DVPCwy2zFakafk1Mq3+XaMuGphnQ
   CXn58Vv1/QcJrbfnDjMnN1sO+kf6/QFnl6JSGkBuFQttFnyHLbMw2jF0/
   9l/pwKrgOjTnPNF5eRY8voSJDwmyhvbhWRUzAnI2XIHFqrdjk0t+BWzd6
   3GSA/8T97CR4Kjg6+2UBKl6H3KKeyXRjQP7nkw9FravqzPLs3MF6Blclw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="423577109"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="423577109"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="833714371"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="833714371"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2023 07:41:23 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YIz-0002y4-2E;
	Fri, 24 Nov 2023 15:41:21 +0000
Date: Fri, 24 Nov 2023 23:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/5] uapi: prctl: Add new prctl call to set/get the
 memory consistency model
Message-ID: <202311241858.ujajxgyN-lkp@intel.com>
References: <20231124072142.2786653-4-christoph.muellner@vrull.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124072142.2786653-4-christoph.muellner@vrull.eu>

Hi Christoph,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Muellner/RISC-V-Add-basic-Ssdtso-support/20231124-153009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20231124072142.2786653-4-christoph.muellner%40vrull.eu
patch subject: [RFC PATCH 3/5] uapi: prctl: Add new prctl call to set/get the memory consistency model
config: x86_64-buildonly-randconfig-002-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241858.ujajxgyN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241858.ujajxgyN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241858.ujajxgyN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sys.c:2749:39: error: called object type 'int' is not a function or function pointer
                   error = SET_MEMORY_CONSISTENCY_MODEL(arg2);
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   kernel/sys.c:2752:39: error: called object type 'int' is not a function or function pointer
                   error = GET_MEMORY_CONSISTENCY_MODEL();
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   2 errors generated.


vim +/int +2749 kernel/sys.c

  2432	
  2433	SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
  2434			unsigned long, arg4, unsigned long, arg5)
  2435	{
  2436		struct task_struct *me = current;
  2437		unsigned char comm[sizeof(me->comm)];
  2438		long error;
  2439	
  2440		error = security_task_prctl(option, arg2, arg3, arg4, arg5);
  2441		if (error != -ENOSYS)
  2442			return error;
  2443	
  2444		error = 0;
  2445		switch (option) {
  2446		case PR_SET_PDEATHSIG:
  2447			if (!valid_signal(arg2)) {
  2448				error = -EINVAL;
  2449				break;
  2450			}
  2451			me->pdeath_signal = arg2;
  2452			break;
  2453		case PR_GET_PDEATHSIG:
  2454			error = put_user(me->pdeath_signal, (int __user *)arg2);
  2455			break;
  2456		case PR_GET_DUMPABLE:
  2457			error = get_dumpable(me->mm);
  2458			break;
  2459		case PR_SET_DUMPABLE:
  2460			if (arg2 != SUID_DUMP_DISABLE && arg2 != SUID_DUMP_USER) {
  2461				error = -EINVAL;
  2462				break;
  2463			}
  2464			set_dumpable(me->mm, arg2);
  2465			break;
  2466	
  2467		case PR_SET_UNALIGN:
  2468			error = SET_UNALIGN_CTL(me, arg2);
  2469			break;
  2470		case PR_GET_UNALIGN:
  2471			error = GET_UNALIGN_CTL(me, arg2);
  2472			break;
  2473		case PR_SET_FPEMU:
  2474			error = SET_FPEMU_CTL(me, arg2);
  2475			break;
  2476		case PR_GET_FPEMU:
  2477			error = GET_FPEMU_CTL(me, arg2);
  2478			break;
  2479		case PR_SET_FPEXC:
  2480			error = SET_FPEXC_CTL(me, arg2);
  2481			break;
  2482		case PR_GET_FPEXC:
  2483			error = GET_FPEXC_CTL(me, arg2);
  2484			break;
  2485		case PR_GET_TIMING:
  2486			error = PR_TIMING_STATISTICAL;
  2487			break;
  2488		case PR_SET_TIMING:
  2489			if (arg2 != PR_TIMING_STATISTICAL)
  2490				error = -EINVAL;
  2491			break;
  2492		case PR_SET_NAME:
  2493			comm[sizeof(me->comm) - 1] = 0;
  2494			if (strncpy_from_user(comm, (char __user *)arg2,
  2495					      sizeof(me->comm) - 1) < 0)
  2496				return -EFAULT;
  2497			set_task_comm(me, comm);
  2498			proc_comm_connector(me);
  2499			break;
  2500		case PR_GET_NAME:
  2501			get_task_comm(comm, me);
  2502			if (copy_to_user((char __user *)arg2, comm, sizeof(comm)))
  2503				return -EFAULT;
  2504			break;
  2505		case PR_GET_ENDIAN:
  2506			error = GET_ENDIAN(me, arg2);
  2507			break;
  2508		case PR_SET_ENDIAN:
  2509			error = SET_ENDIAN(me, arg2);
  2510			break;
  2511		case PR_GET_SECCOMP:
  2512			error = prctl_get_seccomp();
  2513			break;
  2514		case PR_SET_SECCOMP:
  2515			error = prctl_set_seccomp(arg2, (char __user *)arg3);
  2516			break;
  2517		case PR_GET_TSC:
  2518			error = GET_TSC_CTL(arg2);
  2519			break;
  2520		case PR_SET_TSC:
  2521			error = SET_TSC_CTL(arg2);
  2522			break;
  2523		case PR_TASK_PERF_EVENTS_DISABLE:
  2524			error = perf_event_task_disable();
  2525			break;
  2526		case PR_TASK_PERF_EVENTS_ENABLE:
  2527			error = perf_event_task_enable();
  2528			break;
  2529		case PR_GET_TIMERSLACK:
  2530			if (current->timer_slack_ns > ULONG_MAX)
  2531				error = ULONG_MAX;
  2532			else
  2533				error = current->timer_slack_ns;
  2534			break;
  2535		case PR_SET_TIMERSLACK:
  2536			if (arg2 <= 0)
  2537				current->timer_slack_ns =
  2538						current->default_timer_slack_ns;
  2539			else
  2540				current->timer_slack_ns = arg2;
  2541			break;
  2542		case PR_MCE_KILL:
  2543			if (arg4 | arg5)
  2544				return -EINVAL;
  2545			switch (arg2) {
  2546			case PR_MCE_KILL_CLEAR:
  2547				if (arg3 != 0)
  2548					return -EINVAL;
  2549				current->flags &= ~PF_MCE_PROCESS;
  2550				break;
  2551			case PR_MCE_KILL_SET:
  2552				current->flags |= PF_MCE_PROCESS;
  2553				if (arg3 == PR_MCE_KILL_EARLY)
  2554					current->flags |= PF_MCE_EARLY;
  2555				else if (arg3 == PR_MCE_KILL_LATE)
  2556					current->flags &= ~PF_MCE_EARLY;
  2557				else if (arg3 == PR_MCE_KILL_DEFAULT)
  2558					current->flags &=
  2559							~(PF_MCE_EARLY|PF_MCE_PROCESS);
  2560				else
  2561					return -EINVAL;
  2562				break;
  2563			default:
  2564				return -EINVAL;
  2565			}
  2566			break;
  2567		case PR_MCE_KILL_GET:
  2568			if (arg2 | arg3 | arg4 | arg5)
  2569				return -EINVAL;
  2570			if (current->flags & PF_MCE_PROCESS)
  2571				error = (current->flags & PF_MCE_EARLY) ?
  2572					PR_MCE_KILL_EARLY : PR_MCE_KILL_LATE;
  2573			else
  2574				error = PR_MCE_KILL_DEFAULT;
  2575			break;
  2576		case PR_SET_MM:
  2577			error = prctl_set_mm(arg2, arg3, arg4, arg5);
  2578			break;
  2579		case PR_GET_TID_ADDRESS:
  2580			error = prctl_get_tid_address(me, (int __user * __user *)arg2);
  2581			break;
  2582		case PR_SET_CHILD_SUBREAPER:
  2583			me->signal->is_child_subreaper = !!arg2;
  2584			if (!arg2)
  2585				break;
  2586	
  2587			walk_process_tree(me, propagate_has_child_subreaper, NULL);
  2588			break;
  2589		case PR_GET_CHILD_SUBREAPER:
  2590			error = put_user(me->signal->is_child_subreaper,
  2591					 (int __user *)arg2);
  2592			break;
  2593		case PR_SET_NO_NEW_PRIVS:
  2594			if (arg2 != 1 || arg3 || arg4 || arg5)
  2595				return -EINVAL;
  2596	
  2597			task_set_no_new_privs(current);
  2598			break;
  2599		case PR_GET_NO_NEW_PRIVS:
  2600			if (arg2 || arg3 || arg4 || arg5)
  2601				return -EINVAL;
  2602			return task_no_new_privs(current) ? 1 : 0;
  2603		case PR_GET_THP_DISABLE:
  2604			if (arg2 || arg3 || arg4 || arg5)
  2605				return -EINVAL;
  2606			error = !!test_bit(MMF_DISABLE_THP, &me->mm->flags);
  2607			break;
  2608		case PR_SET_THP_DISABLE:
  2609			if (arg3 || arg4 || arg5)
  2610				return -EINVAL;
  2611			if (mmap_write_lock_killable(me->mm))
  2612				return -EINTR;
  2613			if (arg2)
  2614				set_bit(MMF_DISABLE_THP, &me->mm->flags);
  2615			else
  2616				clear_bit(MMF_DISABLE_THP, &me->mm->flags);
  2617			mmap_write_unlock(me->mm);
  2618			break;
  2619		case PR_MPX_ENABLE_MANAGEMENT:
  2620		case PR_MPX_DISABLE_MANAGEMENT:
  2621			/* No longer implemented: */
  2622			return -EINVAL;
  2623		case PR_SET_FP_MODE:
  2624			error = SET_FP_MODE(me, arg2);
  2625			break;
  2626		case PR_GET_FP_MODE:
  2627			error = GET_FP_MODE(me);
  2628			break;
  2629		case PR_SVE_SET_VL:
  2630			error = SVE_SET_VL(arg2);
  2631			break;
  2632		case PR_SVE_GET_VL:
  2633			error = SVE_GET_VL();
  2634			break;
  2635		case PR_SME_SET_VL:
  2636			error = SME_SET_VL(arg2);
  2637			break;
  2638		case PR_SME_GET_VL:
  2639			error = SME_GET_VL();
  2640			break;
  2641		case PR_GET_SPECULATION_CTRL:
  2642			if (arg3 || arg4 || arg5)
  2643				return -EINVAL;
  2644			error = arch_prctl_spec_ctrl_get(me, arg2);
  2645			break;
  2646		case PR_SET_SPECULATION_CTRL:
  2647			if (arg4 || arg5)
  2648				return -EINVAL;
  2649			error = arch_prctl_spec_ctrl_set(me, arg2, arg3);
  2650			break;
  2651		case PR_PAC_RESET_KEYS:
  2652			if (arg3 || arg4 || arg5)
  2653				return -EINVAL;
  2654			error = PAC_RESET_KEYS(me, arg2);
  2655			break;
  2656		case PR_PAC_SET_ENABLED_KEYS:
  2657			if (arg4 || arg5)
  2658				return -EINVAL;
  2659			error = PAC_SET_ENABLED_KEYS(me, arg2, arg3);
  2660			break;
  2661		case PR_PAC_GET_ENABLED_KEYS:
  2662			if (arg2 || arg3 || arg4 || arg5)
  2663				return -EINVAL;
  2664			error = PAC_GET_ENABLED_KEYS(me);
  2665			break;
  2666		case PR_SET_TAGGED_ADDR_CTRL:
  2667			if (arg3 || arg4 || arg5)
  2668				return -EINVAL;
  2669			error = SET_TAGGED_ADDR_CTRL(arg2);
  2670			break;
  2671		case PR_GET_TAGGED_ADDR_CTRL:
  2672			if (arg2 || arg3 || arg4 || arg5)
  2673				return -EINVAL;
  2674			error = GET_TAGGED_ADDR_CTRL();
  2675			break;
  2676		case PR_SET_IO_FLUSHER:
  2677			if (!capable(CAP_SYS_RESOURCE))
  2678				return -EPERM;
  2679	
  2680			if (arg3 || arg4 || arg5)
  2681				return -EINVAL;
  2682	
  2683			if (arg2 == 1)
  2684				current->flags |= PR_IO_FLUSHER;
  2685			else if (!arg2)
  2686				current->flags &= ~PR_IO_FLUSHER;
  2687			else
  2688				return -EINVAL;
  2689			break;
  2690		case PR_GET_IO_FLUSHER:
  2691			if (!capable(CAP_SYS_RESOURCE))
  2692				return -EPERM;
  2693	
  2694			if (arg2 || arg3 || arg4 || arg5)
  2695				return -EINVAL;
  2696	
  2697			error = (current->flags & PR_IO_FLUSHER) == PR_IO_FLUSHER;
  2698			break;
  2699		case PR_SET_SYSCALL_USER_DISPATCH:
  2700			error = set_syscall_user_dispatch(arg2, arg3, arg4,
  2701							  (char __user *) arg5);
  2702			break;
  2703	#ifdef CONFIG_SCHED_CORE
  2704		case PR_SCHED_CORE:
  2705			error = sched_core_share_pid(arg2, arg3, arg4, arg5);
  2706			break;
  2707	#endif
  2708		case PR_SET_MDWE:
  2709			error = prctl_set_mdwe(arg2, arg3, arg4, arg5);
  2710			break;
  2711		case PR_GET_MDWE:
  2712			error = prctl_get_mdwe(arg2, arg3, arg4, arg5);
  2713			break;
  2714		case PR_SET_VMA:
  2715			error = prctl_set_vma(arg2, arg3, arg4, arg5);
  2716			break;
  2717		case PR_GET_AUXV:
  2718			if (arg4 || arg5)
  2719				return -EINVAL;
  2720			error = prctl_get_auxv((void __user *)arg2, arg3);
  2721			break;
  2722	#ifdef CONFIG_KSM
  2723		case PR_SET_MEMORY_MERGE:
  2724			if (arg3 || arg4 || arg5)
  2725				return -EINVAL;
  2726			if (mmap_write_lock_killable(me->mm))
  2727				return -EINTR;
  2728	
  2729			if (arg2)
  2730				error = ksm_enable_merge_any(me->mm);
  2731			else
  2732				error = ksm_disable_merge_any(me->mm);
  2733			mmap_write_unlock(me->mm);
  2734			break;
  2735		case PR_GET_MEMORY_MERGE:
  2736			if (arg2 || arg3 || arg4 || arg5)
  2737				return -EINVAL;
  2738	
  2739			error = !!test_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
  2740			break;
  2741	#endif
  2742		case PR_RISCV_V_SET_CONTROL:
  2743			error = RISCV_V_SET_CONTROL(arg2);
  2744			break;
  2745		case PR_RISCV_V_GET_CONTROL:
  2746			error = RISCV_V_GET_CONTROL();
  2747			break;
  2748		case PR_SET_MEMORY_CONSISTENCY_MODEL:
> 2749			error = SET_MEMORY_CONSISTENCY_MODEL(arg2);
  2750			break;
  2751		case PR_GET_MEMORY_CONSISTENCY_MODEL:
  2752			error = GET_MEMORY_CONSISTENCY_MODEL();
  2753			break;
  2754		default:
  2755			error = -EINVAL;
  2756			break;
  2757		}
  2758		return error;
  2759	}
  2760	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
