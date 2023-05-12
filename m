Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD58B7F5;
	Fri, 12 May 2023 04:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683867039; x=1715403039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QH/urnJ+mn207PQi+G6deLTski9otRQHT1pdwMS3ViY=;
  b=XHSTmfXuipX0zpGBLycCkzcyRojqa6Wof8FuvclMPetbFbkDLrfRW6hW
   t0XFexSfM/kNjFCjoPSCqFxN4DyiCQ+GhBdcTm+DD/acPTONsbbw5FX92
   C5FORP874NSTVrFztqn8dN+Qimibmrhu/yDegBhSDswGr/VewUA4/yyyx
   r03yGrR6GidQGIQnLsv9OY2guqHvWSC10Nxikm9gtq46y8ym4zI3wbK26
   sntaKoVZa8hJpiisq2/2lcbqUl+8GWte5oSxesrBZeoKi9UUZGTMXbt8Y
   g8z1nlscPjltccc2VOs+WhI7egl0x7jcXpBBt6HZXdomhwQC8XCucc/Kd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353831794"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353831794"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 21:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="650496016"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="650496016"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 May 2023 21:50:37 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxKjk-0004XG-1e;
	Fri, 12 May 2023 04:50:36 +0000
Date: Fri, 12 May 2023 12:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [palmer:for-next 20/25] kernel/sys.c:2718:11: error: implicit
 declaration of function 'RISCV_V_SET_CONTROL' is invalid in C99
Message-ID: <202305121217.u10yyElB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   aab772f330541c3876484bcff439bb39b2784cf7
commit: 7db8448c2fd659bda9cc990b1427312e9a6b6d92 [20/25] riscv: Add prctl controls for userspace vector management
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230512/202305121217.u10yyElB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?id=7db8448c2fd659bda9cc990b1427312e9a6b6d92
        git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
        git fetch --no-tags palmer for-next
        git checkout 7db8448c2fd659bda9cc990b1427312e9a6b6d92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121217.u10yyElB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sys.c:2718:11: error: implicit declaration of function 'RISCV_V_SET_CONTROL' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   error = RISCV_V_SET_CONTROL(arg2);
                           ^
>> kernel/sys.c:2721:11: error: implicit declaration of function 'RISCV_V_GET_CONTROL' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   error = RISCV_V_GET_CONTROL();
                           ^
   kernel/sys.c:2721:11: note: did you mean 'RISCV_V_SET_CONTROL'?
   kernel/sys.c:2718:11: note: 'RISCV_V_SET_CONTROL' declared here
                   error = RISCV_V_SET_CONTROL(arg2);
                           ^
   2 errors generated.


vim +/RISCV_V_SET_CONTROL +2718 kernel/sys.c

  2407	
  2408	SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
  2409			unsigned long, arg4, unsigned long, arg5)
  2410	{
  2411		struct task_struct *me = current;
  2412		unsigned char comm[sizeof(me->comm)];
  2413		long error;
  2414	
  2415		error = security_task_prctl(option, arg2, arg3, arg4, arg5);
  2416		if (error != -ENOSYS)
  2417			return error;
  2418	
  2419		error = 0;
  2420		switch (option) {
  2421		case PR_SET_PDEATHSIG:
  2422			if (!valid_signal(arg2)) {
  2423				error = -EINVAL;
  2424				break;
  2425			}
  2426			me->pdeath_signal = arg2;
  2427			break;
  2428		case PR_GET_PDEATHSIG:
  2429			error = put_user(me->pdeath_signal, (int __user *)arg2);
  2430			break;
  2431		case PR_GET_DUMPABLE:
  2432			error = get_dumpable(me->mm);
  2433			break;
  2434		case PR_SET_DUMPABLE:
  2435			if (arg2 != SUID_DUMP_DISABLE && arg2 != SUID_DUMP_USER) {
  2436				error = -EINVAL;
  2437				break;
  2438			}
  2439			set_dumpable(me->mm, arg2);
  2440			break;
  2441	
  2442		case PR_SET_UNALIGN:
  2443			error = SET_UNALIGN_CTL(me, arg2);
  2444			break;
  2445		case PR_GET_UNALIGN:
  2446			error = GET_UNALIGN_CTL(me, arg2);
  2447			break;
  2448		case PR_SET_FPEMU:
  2449			error = SET_FPEMU_CTL(me, arg2);
  2450			break;
  2451		case PR_GET_FPEMU:
  2452			error = GET_FPEMU_CTL(me, arg2);
  2453			break;
  2454		case PR_SET_FPEXC:
  2455			error = SET_FPEXC_CTL(me, arg2);
  2456			break;
  2457		case PR_GET_FPEXC:
  2458			error = GET_FPEXC_CTL(me, arg2);
  2459			break;
  2460		case PR_GET_TIMING:
  2461			error = PR_TIMING_STATISTICAL;
  2462			break;
  2463		case PR_SET_TIMING:
  2464			if (arg2 != PR_TIMING_STATISTICAL)
  2465				error = -EINVAL;
  2466			break;
  2467		case PR_SET_NAME:
  2468			comm[sizeof(me->comm) - 1] = 0;
  2469			if (strncpy_from_user(comm, (char __user *)arg2,
  2470					      sizeof(me->comm) - 1) < 0)
  2471				return -EFAULT;
  2472			set_task_comm(me, comm);
  2473			proc_comm_connector(me);
  2474			break;
  2475		case PR_GET_NAME:
  2476			get_task_comm(comm, me);
  2477			if (copy_to_user((char __user *)arg2, comm, sizeof(comm)))
  2478				return -EFAULT;
  2479			break;
  2480		case PR_GET_ENDIAN:
  2481			error = GET_ENDIAN(me, arg2);
  2482			break;
  2483		case PR_SET_ENDIAN:
  2484			error = SET_ENDIAN(me, arg2);
  2485			break;
  2486		case PR_GET_SECCOMP:
  2487			error = prctl_get_seccomp();
  2488			break;
  2489		case PR_SET_SECCOMP:
  2490			error = prctl_set_seccomp(arg2, (char __user *)arg3);
  2491			break;
  2492		case PR_GET_TSC:
  2493			error = GET_TSC_CTL(arg2);
  2494			break;
  2495		case PR_SET_TSC:
  2496			error = SET_TSC_CTL(arg2);
  2497			break;
  2498		case PR_TASK_PERF_EVENTS_DISABLE:
  2499			error = perf_event_task_disable();
  2500			break;
  2501		case PR_TASK_PERF_EVENTS_ENABLE:
  2502			error = perf_event_task_enable();
  2503			break;
  2504		case PR_GET_TIMERSLACK:
  2505			if (current->timer_slack_ns > ULONG_MAX)
  2506				error = ULONG_MAX;
  2507			else
  2508				error = current->timer_slack_ns;
  2509			break;
  2510		case PR_SET_TIMERSLACK:
  2511			if (arg2 <= 0)
  2512				current->timer_slack_ns =
  2513						current->default_timer_slack_ns;
  2514			else
  2515				current->timer_slack_ns = arg2;
  2516			break;
  2517		case PR_MCE_KILL:
  2518			if (arg4 | arg5)
  2519				return -EINVAL;
  2520			switch (arg2) {
  2521			case PR_MCE_KILL_CLEAR:
  2522				if (arg3 != 0)
  2523					return -EINVAL;
  2524				current->flags &= ~PF_MCE_PROCESS;
  2525				break;
  2526			case PR_MCE_KILL_SET:
  2527				current->flags |= PF_MCE_PROCESS;
  2528				if (arg3 == PR_MCE_KILL_EARLY)
  2529					current->flags |= PF_MCE_EARLY;
  2530				else if (arg3 == PR_MCE_KILL_LATE)
  2531					current->flags &= ~PF_MCE_EARLY;
  2532				else if (arg3 == PR_MCE_KILL_DEFAULT)
  2533					current->flags &=
  2534							~(PF_MCE_EARLY|PF_MCE_PROCESS);
  2535				else
  2536					return -EINVAL;
  2537				break;
  2538		case PR_GET_AUXV:
  2539			if (arg4 || arg5)
  2540				return -EINVAL;
  2541			error = prctl_get_auxv((void __user *)arg2, arg3);
  2542			break;
  2543			default:
  2544				return -EINVAL;
  2545			}
  2546			break;
  2547		case PR_MCE_KILL_GET:
  2548			if (arg2 | arg3 | arg4 | arg5)
  2549				return -EINVAL;
  2550			if (current->flags & PF_MCE_PROCESS)
  2551				error = (current->flags & PF_MCE_EARLY) ?
  2552					PR_MCE_KILL_EARLY : PR_MCE_KILL_LATE;
  2553			else
  2554				error = PR_MCE_KILL_DEFAULT;
  2555			break;
  2556		case PR_SET_MM:
  2557			error = prctl_set_mm(arg2, arg3, arg4, arg5);
  2558			break;
  2559		case PR_GET_TID_ADDRESS:
  2560			error = prctl_get_tid_address(me, (int __user * __user *)arg2);
  2561			break;
  2562		case PR_SET_CHILD_SUBREAPER:
  2563			me->signal->is_child_subreaper = !!arg2;
  2564			if (!arg2)
  2565				break;
  2566	
  2567			walk_process_tree(me, propagate_has_child_subreaper, NULL);
  2568			break;
  2569		case PR_GET_CHILD_SUBREAPER:
  2570			error = put_user(me->signal->is_child_subreaper,
  2571					 (int __user *)arg2);
  2572			break;
  2573		case PR_SET_NO_NEW_PRIVS:
  2574			if (arg2 != 1 || arg3 || arg4 || arg5)
  2575				return -EINVAL;
  2576	
  2577			task_set_no_new_privs(current);
  2578			break;
  2579		case PR_GET_NO_NEW_PRIVS:
  2580			if (arg2 || arg3 || arg4 || arg5)
  2581				return -EINVAL;
  2582			return task_no_new_privs(current) ? 1 : 0;
  2583		case PR_GET_THP_DISABLE:
  2584			if (arg2 || arg3 || arg4 || arg5)
  2585				return -EINVAL;
  2586			error = !!test_bit(MMF_DISABLE_THP, &me->mm->flags);
  2587			break;
  2588		case PR_SET_THP_DISABLE:
  2589			if (arg3 || arg4 || arg5)
  2590				return -EINVAL;
  2591			if (mmap_write_lock_killable(me->mm))
  2592				return -EINTR;
  2593			if (arg2)
  2594				set_bit(MMF_DISABLE_THP, &me->mm->flags);
  2595			else
  2596				clear_bit(MMF_DISABLE_THP, &me->mm->flags);
  2597			mmap_write_unlock(me->mm);
  2598			break;
  2599		case PR_MPX_ENABLE_MANAGEMENT:
  2600		case PR_MPX_DISABLE_MANAGEMENT:
  2601			/* No longer implemented: */
  2602			return -EINVAL;
  2603		case PR_SET_FP_MODE:
  2604			error = SET_FP_MODE(me, arg2);
  2605			break;
  2606		case PR_GET_FP_MODE:
  2607			error = GET_FP_MODE(me);
  2608			break;
  2609		case PR_SVE_SET_VL:
  2610			error = SVE_SET_VL(arg2);
  2611			break;
  2612		case PR_SVE_GET_VL:
  2613			error = SVE_GET_VL();
  2614			break;
  2615		case PR_SME_SET_VL:
  2616			error = SME_SET_VL(arg2);
  2617			break;
  2618		case PR_SME_GET_VL:
  2619			error = SME_GET_VL();
  2620			break;
  2621		case PR_GET_SPECULATION_CTRL:
  2622			if (arg3 || arg4 || arg5)
  2623				return -EINVAL;
  2624			error = arch_prctl_spec_ctrl_get(me, arg2);
  2625			break;
  2626		case PR_SET_SPECULATION_CTRL:
  2627			if (arg4 || arg5)
  2628				return -EINVAL;
  2629			error = arch_prctl_spec_ctrl_set(me, arg2, arg3);
  2630			break;
  2631		case PR_PAC_RESET_KEYS:
  2632			if (arg3 || arg4 || arg5)
  2633				return -EINVAL;
  2634			error = PAC_RESET_KEYS(me, arg2);
  2635			break;
  2636		case PR_PAC_SET_ENABLED_KEYS:
  2637			if (arg4 || arg5)
  2638				return -EINVAL;
  2639			error = PAC_SET_ENABLED_KEYS(me, arg2, arg3);
  2640			break;
  2641		case PR_PAC_GET_ENABLED_KEYS:
  2642			if (arg2 || arg3 || arg4 || arg5)
  2643				return -EINVAL;
  2644			error = PAC_GET_ENABLED_KEYS(me);
  2645			break;
  2646		case PR_SET_TAGGED_ADDR_CTRL:
  2647			if (arg3 || arg4 || arg5)
  2648				return -EINVAL;
  2649			error = SET_TAGGED_ADDR_CTRL(arg2);
  2650			break;
  2651		case PR_GET_TAGGED_ADDR_CTRL:
  2652			if (arg2 || arg3 || arg4 || arg5)
  2653				return -EINVAL;
  2654			error = GET_TAGGED_ADDR_CTRL();
  2655			break;
  2656		case PR_SET_IO_FLUSHER:
  2657			if (!capable(CAP_SYS_RESOURCE))
  2658				return -EPERM;
  2659	
  2660			if (arg3 || arg4 || arg5)
  2661				return -EINVAL;
  2662	
  2663			if (arg2 == 1)
  2664				current->flags |= PR_IO_FLUSHER;
  2665			else if (!arg2)
  2666				current->flags &= ~PR_IO_FLUSHER;
  2667			else
  2668				return -EINVAL;
  2669			break;
  2670		case PR_GET_IO_FLUSHER:
  2671			if (!capable(CAP_SYS_RESOURCE))
  2672				return -EPERM;
  2673	
  2674			if (arg2 || arg3 || arg4 || arg5)
  2675				return -EINVAL;
  2676	
  2677			error = (current->flags & PR_IO_FLUSHER) == PR_IO_FLUSHER;
  2678			break;
  2679		case PR_SET_SYSCALL_USER_DISPATCH:
  2680			error = set_syscall_user_dispatch(arg2, arg3, arg4,
  2681							  (char __user *) arg5);
  2682			break;
  2683	#ifdef CONFIG_SCHED_CORE
  2684		case PR_SCHED_CORE:
  2685			error = sched_core_share_pid(arg2, arg3, arg4, arg5);
  2686			break;
  2687	#endif
  2688		case PR_SET_MDWE:
  2689			error = prctl_set_mdwe(arg2, arg3, arg4, arg5);
  2690			break;
  2691		case PR_GET_MDWE:
  2692			error = prctl_get_mdwe(arg2, arg3, arg4, arg5);
  2693			break;
  2694		case PR_SET_VMA:
  2695			error = prctl_set_vma(arg2, arg3, arg4, arg5);
  2696			break;
  2697	#ifdef CONFIG_KSM
  2698		case PR_SET_MEMORY_MERGE:
  2699			if (arg3 || arg4 || arg5)
  2700				return -EINVAL;
  2701			if (mmap_write_lock_killable(me->mm))
  2702				return -EINTR;
  2703	
  2704			if (arg2)
  2705				error = ksm_enable_merge_any(me->mm);
  2706			else
  2707				error = ksm_disable_merge_any(me->mm);
  2708			mmap_write_unlock(me->mm);
  2709			break;
  2710		case PR_GET_MEMORY_MERGE:
  2711			if (arg2 || arg3 || arg4 || arg5)
  2712				return -EINVAL;
  2713	
  2714			error = !!test_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
  2715			break;
  2716	#endif
  2717		case PR_RISCV_V_SET_CONTROL:
> 2718			error = RISCV_V_SET_CONTROL(arg2);
  2719			break;
  2720		case PR_RISCV_V_GET_CONTROL:
> 2721			error = RISCV_V_GET_CONTROL();
  2722			break;
  2723		default:
  2724			error = -EINVAL;
  2725			break;
  2726		}
  2727		return error;
  2728	}
  2729	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
