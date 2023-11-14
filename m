Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298271FD8;
	Tue, 14 Nov 2023 02:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyw9neIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699928869; x=1731464869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IakLzGE/OsSGt0YXMWmldaKPKb2Tj3baWc5bVSNI2e8=;
  b=cyw9neIMwvNvXgum8aXbaHQlkxP21XrfpHaDWhHVj0t/olrdSXxrGRnG
   7ek24OBB+j5Kg4qX4uiVoCH+L0hjQhOEj/1PEKwYeingyZmwjW8UWMwGl
   U0Dnccx4kQPigXVsS/ctjxx7zVqrJwfldeme86ubE01Ksl6VFDEVR7pN4
   pR3RQzVtnXQy4rK17ahYTU6MeXJd0hS/k4ExFXoSikgzbrfK4T4Q48Oly
   bEGiliEOpD56lUZDSgRMSuytUDa1hUBM1QA/BQF7cRF7yXmthU9N64nIk
   HFzKWpzXaGUOuHgl2FX/0MDHritQiRn4Nv/plRwjnEzKZDLRr2wtUCzep
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375590630"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="375590630"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 18:27:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="768111053"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="768111053"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Nov 2023 18:26:29 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2j8F-000Ck9-2D;
	Tue, 14 Nov 2023 02:26:27 +0000
Date: Tue, 14 Nov 2023 10:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next-maybe2 1/1] kernel/sys.c:2704:4: error: use
 of undeclared identifier 'errir'; did you mean 'error'?
Message-ID: <202311141014.HCAk0zYQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next-maybe2
head:   339b41ec357c24c02ed4aed6267dbfd443ee1e8e
commit: 339b41ec357c24c02ed4aed6267dbfd443ee1e8e [1/1] prctl: Temporarily disable prctl(PR_SET_MDWE) on parisc
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231114/202311141014.HCAk0zYQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311141014.HCAk0zYQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311141014.HCAk0zYQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sys.c:10:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/sys.c:10:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/sys.c:10:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> kernel/sys.c:2704:4: error: use of undeclared identifier 'errir'; did you mean 'error'?
    2704 |                         errir = -ENODEV;
         |                         ^~~~~
         |                         error
   kernel/sys.c:2432:7: note: 'error' declared here
    2432 |         long error;
         |              ^
   kernel/sys.c:2710:4: error: use of undeclared identifier 'errir'; did you mean 'error'?
    2710 |                         errir = -ENODEV;
         |                         ^~~~~
         |                         error
   kernel/sys.c:2432:7: note: 'error' declared here
    2432 |         long error;
         |              ^
   12 warnings and 2 errors generated.


vim +2704 kernel/sys.c

  2426	
  2427	SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
  2428			unsigned long, arg4, unsigned long, arg5)
  2429	{
  2430		struct task_struct *me = current;
  2431		unsigned char comm[sizeof(me->comm)];
  2432		long error;
  2433	
  2434		error = security_task_prctl(option, arg2, arg3, arg4, arg5);
  2435		if (error != -ENOSYS)
  2436			return error;
  2437	
  2438		error = 0;
  2439		switch (option) {
  2440		case PR_SET_PDEATHSIG:
  2441			if (!valid_signal(arg2)) {
  2442				error = -EINVAL;
  2443				break;
  2444			}
  2445			me->pdeath_signal = arg2;
  2446			break;
  2447		case PR_GET_PDEATHSIG:
  2448			error = put_user(me->pdeath_signal, (int __user *)arg2);
  2449			break;
  2450		case PR_GET_DUMPABLE:
  2451			error = get_dumpable(me->mm);
  2452			break;
  2453		case PR_SET_DUMPABLE:
  2454			if (arg2 != SUID_DUMP_DISABLE && arg2 != SUID_DUMP_USER) {
  2455				error = -EINVAL;
  2456				break;
  2457			}
  2458			set_dumpable(me->mm, arg2);
  2459			break;
  2460	
  2461		case PR_SET_UNALIGN:
  2462			error = SET_UNALIGN_CTL(me, arg2);
  2463			break;
  2464		case PR_GET_UNALIGN:
  2465			error = GET_UNALIGN_CTL(me, arg2);
  2466			break;
  2467		case PR_SET_FPEMU:
  2468			error = SET_FPEMU_CTL(me, arg2);
  2469			break;
  2470		case PR_GET_FPEMU:
  2471			error = GET_FPEMU_CTL(me, arg2);
  2472			break;
  2473		case PR_SET_FPEXC:
  2474			error = SET_FPEXC_CTL(me, arg2);
  2475			break;
  2476		case PR_GET_FPEXC:
  2477			error = GET_FPEXC_CTL(me, arg2);
  2478			break;
  2479		case PR_GET_TIMING:
  2480			error = PR_TIMING_STATISTICAL;
  2481			break;
  2482		case PR_SET_TIMING:
  2483			if (arg2 != PR_TIMING_STATISTICAL)
  2484				error = -EINVAL;
  2485			break;
  2486		case PR_SET_NAME:
  2487			comm[sizeof(me->comm) - 1] = 0;
  2488			if (strncpy_from_user(comm, (char __user *)arg2,
  2489					      sizeof(me->comm) - 1) < 0)
  2490				return -EFAULT;
  2491			set_task_comm(me, comm);
  2492			proc_comm_connector(me);
  2493			break;
  2494		case PR_GET_NAME:
  2495			get_task_comm(comm, me);
  2496			if (copy_to_user((char __user *)arg2, comm, sizeof(comm)))
  2497				return -EFAULT;
  2498			break;
  2499		case PR_GET_ENDIAN:
  2500			error = GET_ENDIAN(me, arg2);
  2501			break;
  2502		case PR_SET_ENDIAN:
  2503			error = SET_ENDIAN(me, arg2);
  2504			break;
  2505		case PR_GET_SECCOMP:
  2506			error = prctl_get_seccomp();
  2507			break;
  2508		case PR_SET_SECCOMP:
  2509			error = prctl_set_seccomp(arg2, (char __user *)arg3);
  2510			break;
  2511		case PR_GET_TSC:
  2512			error = GET_TSC_CTL(arg2);
  2513			break;
  2514		case PR_SET_TSC:
  2515			error = SET_TSC_CTL(arg2);
  2516			break;
  2517		case PR_TASK_PERF_EVENTS_DISABLE:
  2518			error = perf_event_task_disable();
  2519			break;
  2520		case PR_TASK_PERF_EVENTS_ENABLE:
  2521			error = perf_event_task_enable();
  2522			break;
  2523		case PR_GET_TIMERSLACK:
  2524			if (current->timer_slack_ns > ULONG_MAX)
  2525				error = ULONG_MAX;
  2526			else
  2527				error = current->timer_slack_ns;
  2528			break;
  2529		case PR_SET_TIMERSLACK:
  2530			if (arg2 <= 0)
  2531				current->timer_slack_ns =
  2532						current->default_timer_slack_ns;
  2533			else
  2534				current->timer_slack_ns = arg2;
  2535			break;
  2536		case PR_MCE_KILL:
  2537			if (arg4 | arg5)
  2538				return -EINVAL;
  2539			switch (arg2) {
  2540			case PR_MCE_KILL_CLEAR:
  2541				if (arg3 != 0)
  2542					return -EINVAL;
  2543				current->flags &= ~PF_MCE_PROCESS;
  2544				break;
  2545			case PR_MCE_KILL_SET:
  2546				current->flags |= PF_MCE_PROCESS;
  2547				if (arg3 == PR_MCE_KILL_EARLY)
  2548					current->flags |= PF_MCE_EARLY;
  2549				else if (arg3 == PR_MCE_KILL_LATE)
  2550					current->flags &= ~PF_MCE_EARLY;
  2551				else if (arg3 == PR_MCE_KILL_DEFAULT)
  2552					current->flags &=
  2553							~(PF_MCE_EARLY|PF_MCE_PROCESS);
  2554				else
  2555					return -EINVAL;
  2556				break;
  2557			default:
  2558				return -EINVAL;
  2559			}
  2560			break;
  2561		case PR_MCE_KILL_GET:
  2562			if (arg2 | arg3 | arg4 | arg5)
  2563				return -EINVAL;
  2564			if (current->flags & PF_MCE_PROCESS)
  2565				error = (current->flags & PF_MCE_EARLY) ?
  2566					PR_MCE_KILL_EARLY : PR_MCE_KILL_LATE;
  2567			else
  2568				error = PR_MCE_KILL_DEFAULT;
  2569			break;
  2570		case PR_SET_MM:
  2571			error = prctl_set_mm(arg2, arg3, arg4, arg5);
  2572			break;
  2573		case PR_GET_TID_ADDRESS:
  2574			error = prctl_get_tid_address(me, (int __user * __user *)arg2);
  2575			break;
  2576		case PR_SET_CHILD_SUBREAPER:
  2577			me->signal->is_child_subreaper = !!arg2;
  2578			if (!arg2)
  2579				break;
  2580	
  2581			walk_process_tree(me, propagate_has_child_subreaper, NULL);
  2582			break;
  2583		case PR_GET_CHILD_SUBREAPER:
  2584			error = put_user(me->signal->is_child_subreaper,
  2585					 (int __user *)arg2);
  2586			break;
  2587		case PR_SET_NO_NEW_PRIVS:
  2588			if (arg2 != 1 || arg3 || arg4 || arg5)
  2589				return -EINVAL;
  2590	
  2591			task_set_no_new_privs(current);
  2592			break;
  2593		case PR_GET_NO_NEW_PRIVS:
  2594			if (arg2 || arg3 || arg4 || arg5)
  2595				return -EINVAL;
  2596			return task_no_new_privs(current) ? 1 : 0;
  2597		case PR_GET_THP_DISABLE:
  2598			if (arg2 || arg3 || arg4 || arg5)
  2599				return -EINVAL;
  2600			error = !!test_bit(MMF_DISABLE_THP, &me->mm->flags);
  2601			break;
  2602		case PR_SET_THP_DISABLE:
  2603			if (arg3 || arg4 || arg5)
  2604				return -EINVAL;
  2605			if (mmap_write_lock_killable(me->mm))
  2606				return -EINTR;
  2607			if (arg2)
  2608				set_bit(MMF_DISABLE_THP, &me->mm->flags);
  2609			else
  2610				clear_bit(MMF_DISABLE_THP, &me->mm->flags);
  2611			mmap_write_unlock(me->mm);
  2612			break;
  2613		case PR_MPX_ENABLE_MANAGEMENT:
  2614		case PR_MPX_DISABLE_MANAGEMENT:
  2615			/* No longer implemented: */
  2616			return -EINVAL;
  2617		case PR_SET_FP_MODE:
  2618			error = SET_FP_MODE(me, arg2);
  2619			break;
  2620		case PR_GET_FP_MODE:
  2621			error = GET_FP_MODE(me);
  2622			break;
  2623		case PR_SVE_SET_VL:
  2624			error = SVE_SET_VL(arg2);
  2625			break;
  2626		case PR_SVE_GET_VL:
  2627			error = SVE_GET_VL();
  2628			break;
  2629		case PR_SME_SET_VL:
  2630			error = SME_SET_VL(arg2);
  2631			break;
  2632		case PR_SME_GET_VL:
  2633			error = SME_GET_VL();
  2634			break;
  2635		case PR_GET_SPECULATION_CTRL:
  2636			if (arg3 || arg4 || arg5)
  2637				return -EINVAL;
  2638			error = arch_prctl_spec_ctrl_get(me, arg2);
  2639			break;
  2640		case PR_SET_SPECULATION_CTRL:
  2641			if (arg4 || arg5)
  2642				return -EINVAL;
  2643			error = arch_prctl_spec_ctrl_set(me, arg2, arg3);
  2644			break;
  2645		case PR_PAC_RESET_KEYS:
  2646			if (arg3 || arg4 || arg5)
  2647				return -EINVAL;
  2648			error = PAC_RESET_KEYS(me, arg2);
  2649			break;
  2650		case PR_PAC_SET_ENABLED_KEYS:
  2651			if (arg4 || arg5)
  2652				return -EINVAL;
  2653			error = PAC_SET_ENABLED_KEYS(me, arg2, arg3);
  2654			break;
  2655		case PR_PAC_GET_ENABLED_KEYS:
  2656			if (arg2 || arg3 || arg4 || arg5)
  2657				return -EINVAL;
  2658			error = PAC_GET_ENABLED_KEYS(me);
  2659			break;
  2660		case PR_SET_TAGGED_ADDR_CTRL:
  2661			if (arg3 || arg4 || arg5)
  2662				return -EINVAL;
  2663			error = SET_TAGGED_ADDR_CTRL(arg2);
  2664			break;
  2665		case PR_GET_TAGGED_ADDR_CTRL:
  2666			if (arg2 || arg3 || arg4 || arg5)
  2667				return -EINVAL;
  2668			error = GET_TAGGED_ADDR_CTRL();
  2669			break;
  2670		case PR_SET_IO_FLUSHER:
  2671			if (!capable(CAP_SYS_RESOURCE))
  2672				return -EPERM;
  2673	
  2674			if (arg3 || arg4 || arg5)
  2675				return -EINVAL;
  2676	
  2677			if (arg2 == 1)
  2678				current->flags |= PR_IO_FLUSHER;
  2679			else if (!arg2)
  2680				current->flags &= ~PR_IO_FLUSHER;
  2681			else
  2682				return -EINVAL;
  2683			break;
  2684		case PR_GET_IO_FLUSHER:
  2685			if (!capable(CAP_SYS_RESOURCE))
  2686				return -EPERM;
  2687	
  2688			if (arg2 || arg3 || arg4 || arg5)
  2689				return -EINVAL;
  2690	
  2691			error = (current->flags & PR_IO_FLUSHER) == PR_IO_FLUSHER;
  2692			break;
  2693		case PR_SET_SYSCALL_USER_DISPATCH:
  2694			error = set_syscall_user_dispatch(arg2, arg3, arg4,
  2695							  (char __user *) arg5);
  2696			break;
  2697	#ifdef CONFIG_SCHED_CORE
  2698		case PR_SCHED_CORE:
  2699			error = sched_core_share_pid(arg2, arg3, arg4, arg5);
  2700			break;
  2701	#endif
  2702		case PR_SET_MDWE:
  2703			if (IS_ENABLED(CONFIG_PARISC))
> 2704				errir = -ENODEV;
  2705			else
  2706				error = prctl_set_mdwe(arg2, arg3, arg4, arg5);
  2707			break;
  2708		case PR_GET_MDWE:
  2709			if (IS_ENABLED(CONFIG_PARISC))
  2710				errir = -ENODEV;
  2711			else
  2712				error = prctl_get_mdwe(arg2, arg3, arg4, arg5);
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
  2748		default:
  2749			error = -EINVAL;
  2750			break;
  2751		}
  2752		return error;
  2753	}
  2754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
