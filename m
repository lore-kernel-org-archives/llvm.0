Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010AB2A1D3;
	Tue,  6 Aug 2024 18:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722967841; cv=none; b=JyVRCsdxTPNuTc3tKkhKpLHkaNIRObCEvFnBP7V826MFbPImw9rKJklcm/RejcG8b6ksm93LuvqcfqhYrFVm0zrWOctPlTvrhyhXoCfVNmhQd/68Crng3iBB2ZBa98s9WYZa4kI5O0ZFrkhCtQgqhrBxmEaqDv28knuWJx5HHMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722967841; c=relaxed/simple;
	bh=n3qSCY97fuStq5rUwdGQepUAPXAa9GPFw6oPjEn8IPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PN6K0a6aYTuBNgU5p4aH2C13lrxwZxBppYWwzjf2giotYsTEXnu+flPouxUBTD3oMjrgq2e4IvMELV49YRgz4vvSJGs54gPh4ks+fE1O+14BgZG/Ju3MVFcbGmztGfztw/bDX+1SXeMNb6OVQdibgXWoeWP6JADNTUU5f1BTBLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A61xz6O+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A61xz6O+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722967839; x=1754503839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n3qSCY97fuStq5rUwdGQepUAPXAa9GPFw6oPjEn8IPQ=;
  b=A61xz6O+zRyfNfDeQk9RsskwBqsUmAA1uejnmbKHUpRGX++0MyLkOUnQ
   OHhKBmpxVelginnagrMciW9Yo19c4sJcnNtfbSPmKOSU6xWIIjj2t6+S+
   yYqD9E1zTCVbdafm/pEe9/FHBVMx3Q0l2sPfLuSnbpNfd3Lc3AOoJ5GUj
   EJe+GU3e2TEnxyfl7Hn1M6oVkc1/brTp8x3vo1YSeiFigAp/7eKkVs1Vj
   0jrogtuF5UH3DkChkvCISkHswdpcPrfkVh6vjc/xzbu9khSc1Dy/8hePG
   Fnm7AIztZ0EOfT2LPgG7QNHCMEi12mB6wNiL/be0LBhbVax0PkuCmHQY3
   Q==;
X-CSE-ConnectionGUID: Re/AoUMPQCuqrPA3H0nJoQ==
X-CSE-MsgGUID: 6AhLwYCySZeCL6iR7fU+iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20858987"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="20858987"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 11:10:39 -0700
X-CSE-ConnectionGUID: DY7RGTnPQo6SKMx5wvQMZQ==
X-CSE-MsgGUID: y30MWUcLS+qhbIk0ri7m5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="56811505"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Aug 2024 11:10:36 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbOdm-0004ja-1a;
	Tue, 06 Aug 2024 18:10:34 +0000
Date: Wed, 7 Aug 2024 02:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-min-wait 3/4] io_uring/io_uring.c:2519:36:
 error: too few arguments to function call, expected 3, have 2
Message-ID: <202408070214.vdTccUPg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-min-wait
head:   c3512266fa88d12a5817a20097a95b194d634732
commit: 53a25b7e9412de949d8f4a6d869afddf3c31189d [3/4] io_uring: add support for batch wait timeout
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240807/202408070214.vdTccUPg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070214.vdTccUPg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408070214.vdTccUPg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:21:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> io_uring/io_uring.c:2519:36: error: too few arguments to function call, expected 3, have 2
    2519 |                 io_napi_adjust_timeout(ctx, &iowq);
         |                 ~~~~~~~~~~~~~~~~~~~~~~           ^
   io_uring/napi.h:88:20: note: 'io_napi_adjust_timeout' declared here
      88 | static inline void io_napi_adjust_timeout(struct io_ring_ctx *ctx,
         |                    ^                      ~~~~~~~~~~~~~~~~~~~~~~~~
      89 |                                           struct io_wait_queue *iowq,
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~
      90 |                                           ktime_t to_wait)
         |                                           ~~~~~~~~~~~~~~~
   13 warnings and 1 error generated.


vim +2519 io_uring/io_uring.c

  2476	
  2477	/*
  2478	 * Wait until events become available, if we don't already have some. The
  2479	 * application must reap them itself, as they reside on the shared cq ring.
  2480	 */
  2481	static int io_cqring_wait(struct io_ring_ctx *ctx, int min_events,
  2482				  const sigset_t __user *sig, size_t sigsz,
  2483				  struct __kernel_timespec __user *uts)
  2484	{
  2485		struct io_wait_queue iowq;
  2486		struct io_rings *rings = ctx->rings;
  2487		ktime_t start_time;
  2488		int ret;
  2489	
  2490		if (!io_allowed_run_tw(ctx))
  2491			return -EEXIST;
  2492		if (!llist_empty(&ctx->work_llist))
  2493			io_run_local_work(ctx, min_events);
  2494		io_run_task_work();
  2495	
  2496		if (unlikely(test_bit(IO_CHECK_CQ_OVERFLOW_BIT, &ctx->check_cq)))
  2497			io_cqring_do_overflow_flush(ctx);
  2498		if (__io_cqring_events_user(ctx) >= min_events)
  2499			return 0;
  2500	
  2501		init_waitqueue_func_entry(&iowq.wq, io_wake_function);
  2502		iowq.wq.private = current;
  2503		INIT_LIST_HEAD(&iowq.wq.entry);
  2504		iowq.ctx = ctx;
  2505		iowq.nr_timeouts = atomic_read(&ctx->cq_timeouts);
  2506		iowq.cq_min_tail = READ_ONCE(ctx->rings->cq.tail);
  2507		iowq.cq_tail = READ_ONCE(ctx->rings->cq.head) + min_events;
  2508		iowq.min_timeout = KTIME_MAX;
  2509		iowq.timeout = KTIME_MAX;
  2510		start_time = ktime_get_ns();
  2511	
  2512		if (uts) {
  2513			struct timespec64 ts;
  2514	
  2515			if (get_timespec64(&ts, uts))
  2516				return -EFAULT;
  2517	
  2518			iowq.timeout = timespec64_to_ktime(ts);
> 2519			io_napi_adjust_timeout(ctx, &iowq);
  2520		}
  2521	
  2522		if (sig) {
  2523	#ifdef CONFIG_COMPAT
  2524			if (in_compat_syscall())
  2525				ret = set_compat_user_sigmask((const compat_sigset_t __user *)sig,
  2526							      sigsz);
  2527			else
  2528	#endif
  2529				ret = set_user_sigmask(sig, sigsz);
  2530	
  2531			if (ret)
  2532				return ret;
  2533		}
  2534	
  2535		io_napi_busy_loop(ctx, &iowq);
  2536	
  2537		trace_io_uring_cqring_wait(ctx, min_events);
  2538		do {
  2539			int nr_wait = (int) iowq.cq_tail - READ_ONCE(ctx->rings->cq.tail);
  2540			unsigned long check_cq;
  2541	
  2542			if (ctx->flags & IORING_SETUP_DEFER_TASKRUN) {
  2543				atomic_set(&ctx->cq_wait_nr, nr_wait);
  2544				set_current_state(TASK_INTERRUPTIBLE);
  2545			} else {
  2546				prepare_to_wait_exclusive(&ctx->cq_wait, &iowq.wq,
  2547								TASK_INTERRUPTIBLE);
  2548			}
  2549	
  2550			ret = io_cqring_wait_schedule(ctx, &iowq, start_time);
  2551			__set_current_state(TASK_RUNNING);
  2552			atomic_set(&ctx->cq_wait_nr, IO_CQ_WAKE_INIT);
  2553	
  2554			/*
  2555			 * Run task_work after scheduling and before io_should_wake().
  2556			 * If we got woken because of task_work being processed, run it
  2557			 * now rather than let the caller do another wait loop.
  2558			 */
  2559			io_run_task_work();
  2560			if (!llist_empty(&ctx->work_llist))
  2561				io_run_local_work(ctx, nr_wait);
  2562	
  2563			/*
  2564			 * Non-local task_work will be run on exit to userspace, but
  2565			 * if we're using DEFER_TASKRUN, then we could have waited
  2566			 * with a timeout for a number of requests. If the timeout
  2567			 * hits, we could have some requests ready to process. Ensure
  2568			 * this break is _after_ we have run task_work, to avoid
  2569			 * deferring running potentially pending requests until the
  2570			 * next time we wait for events.
  2571			 */
  2572			if (ret < 0)
  2573				break;
  2574	
  2575			check_cq = READ_ONCE(ctx->check_cq);
  2576			if (unlikely(check_cq)) {
  2577				/* let the caller flush overflows, retry */
  2578				if (check_cq & BIT(IO_CHECK_CQ_OVERFLOW_BIT))
  2579					io_cqring_do_overflow_flush(ctx);
  2580				if (check_cq & BIT(IO_CHECK_CQ_DROPPED_BIT)) {
  2581					ret = -EBADR;
  2582					break;
  2583				}
  2584			}
  2585	
  2586			if (io_should_wake(&iowq)) {
  2587				ret = 0;
  2588				break;
  2589			}
  2590			cond_resched();
  2591		} while (1);
  2592	
  2593		if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN))
  2594			finish_wait(&ctx->cq_wait, &iowq.wq);
  2595		restore_saved_sigmask_unless(ret == -EINTR);
  2596	
  2597		return READ_ONCE(rings->cq.head) == READ_ONCE(rings->cq.tail) ? ret : 0;
  2598	}
  2599	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
