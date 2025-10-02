Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36B21804A;
	Thu,  2 Oct 2025 04:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759378164; cv=none; b=hsuCphyQzSD03vzTOFEcMeLX64CPwrSyvUf7JQqtolugx5oq0XfLL0/gs+Lrbu1FFO4WWDps4zP01KrIfO19BpGXeHu9OgY6sEaHh4KHE5MIT2jIo2PeQMOWhh0J5RlYrc9JsFon2sOi3ZaZlbpgcs1P84KcRqYT/t98fJbfE4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759378164; c=relaxed/simple;
	bh=I3cv7aIailEmD1ebkm9z/DgMt1/FP6/LqApArC5tm0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLpGQpvtllY2LOn1CSXHUwJc8vyYqHR2++FTSwjVT6JpFF0n09ZRAcEcQAW8UngcHl6qN4MScM0jc6LDHfMGmEGOV6hVAFEuIPZ0IQn9qBwcISo3d+Mk8yuC3WgkS7a1VLfWu6l9GVWwf26XF9q74fA+dSUVM5wv10mZctgXL+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=db+pp+R5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="db+pp+R5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759378162; x=1790914162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I3cv7aIailEmD1ebkm9z/DgMt1/FP6/LqApArC5tm0E=;
  b=db+pp+R53xJo+GFLSVNZ3X3lqZjJ04vkX50XF2xPU4WrCkfMVjbLf2lQ
   1QN9/vxB3BjChPhOFoE5cubad8sE1N28cCLndk0jcftBHuC/ONHUvwXl+
   PDYBIbUNCXtjUbK6ETv3UPbv6EB/3JEjun4EacvYAzedl757HXx2OZCHW
   sMmPtUH9/zkgdVgZD5iFwHoy2Rtm3Fadb8wgDO4714RJbBWlt+Tq+n7Hh
   a56JHs35kmo7HBHRpUK/m1qAHLieBv2EsCP4If8mFxNCeZcxcvQPKMMBC
   /jiwHDKDo9/Oxt+FAybGV12ZwlZKWUPnMtNUa57/FHefyVrYxdenB1Gxj
   w==;
X-CSE-ConnectionGUID: WeoN+Ja6QaavE5nUCCP+CQ==
X-CSE-MsgGUID: 3kBQoY4yTNuKSu6AfmnbBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72770911"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="72770911"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 21:09:21 -0700
X-CSE-ConnectionGUID: aoMSvLQeQLWNhzyMZ5tPRg==
X-CSE-MsgGUID: NmiDu7tRSe2SjzR/t3Y80g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="179395036"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Oct 2025 21:09:20 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4Ad3-0003YX-1i;
	Thu, 02 Oct 2025 04:09:17 +0000
Date: Thu, 2 Oct 2025 12:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/cid 48/48] kernel/fork.c:2452:3: error: call to
 undeclared function 'sched_mm_cid_exit'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202510021256.Kwu6qUNw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/cid
head:   abd407e145f2ae53d2ab326c4f7a10b0bfa79daa
commit: abd407e145f2ae53d2ab326c4f7a10b0bfa79daa [48/48] sched: More CID hackery
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251002/202510021256.Kwu6qUNw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510021256.Kwu6qUNw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510021256.Kwu6qUNw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/fork.c:2452:3: error: call to undeclared function 'sched_mm_cid_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2452 |                 sched_mm_cid_exit(p);
         |                 ^
   kernel/fork.c:2452:3: note: did you mean 'sched_mm_cid_fork'?
   include/linux/sched.h:2308:20: note: 'sched_mm_cid_fork' declared here
    2308 | static inline void sched_mm_cid_fork(struct task_struct *t) { }
         |                    ^
   1 error generated.
--
>> kernel/signal.c:3128:3: error: call to undeclared function 'sched_mm_cid_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3128 |                 sched_mm_cid_exit(tsk);
         |                 ^
   kernel/signal.c:3128:3: note: did you mean 'sched_mm_cid_fork'?
   include/linux/sched.h:2308:20: note: 'sched_mm_cid_fork' declared here
    2308 | static inline void sched_mm_cid_fork(struct task_struct *t) { }
         |                    ^
   kernel/signal.c:3139:2: error: call to undeclared function 'sched_mm_cid_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3139 |         sched_mm_cid_exit(tsk);
         |         ^
   2 errors generated.


vim +/sched_mm_cid_exit +2452 kernel/fork.c

  2266	
  2267		/*
  2268		 * Ensure that the cgroup subsystem policies allow the new process to be
  2269		 * forked. It should be noted that the new process's css_set can be changed
  2270		 * between here and cgroup_post_fork() if an organisation operation is in
  2271		 * progress.
  2272		 */
  2273		retval = cgroup_can_fork(p, args);
  2274		if (retval)
  2275			goto bad_fork_put_pidfd;
  2276	
  2277		/*
  2278		 * Now that the cgroups are pinned, re-clone the parent cgroup and put
  2279		 * the new task on the correct runqueue. All this *before* the task
  2280		 * becomes visible.
  2281		 *
  2282		 * This isn't part of ->can_fork() because while the re-cloning is
  2283		 * cgroup specific, it unconditionally needs to place the task on a
  2284		 * runqueue.
  2285		 */
  2286		retval = sched_cgroup_fork(p, args);
  2287		if (retval)
  2288			goto bad_fork_cancel_cgroup;
  2289	
  2290		/*
  2291		 * Allocate a default futex hash for the user process once the first
  2292		 * thread spawns.
  2293		 */
  2294		if (need_futex_hash_allocate_default(clone_flags)) {
  2295			retval = futex_hash_allocate_default();
  2296			if (retval)
  2297				goto bad_fork_core_free;
  2298			/*
  2299			 * If we fail beyond this point we don't free the allocated
  2300			 * futex hash map. We assume that another thread will be created
  2301			 * and makes use of it. The hash map will be freed once the main
  2302			 * thread terminates.
  2303			 */
  2304		}
  2305		/*
  2306		 * From this point on we must avoid any synchronous user-space
  2307		 * communication until we take the tasklist-lock. In particular, we do
  2308		 * not want user-space to be able to predict the process start-time by
  2309		 * stalling fork(2) after we recorded the start_time but before it is
  2310		 * visible to the system.
  2311		 */
  2312	
  2313		p->start_time = ktime_get_ns();
  2314		p->start_boottime = ktime_get_boottime_ns();
  2315	
  2316		/*
  2317		 * Make it visible to the rest of the system, but dont wake it up yet.
  2318		 * Need tasklist lock for parent etc handling!
  2319		 */
  2320		write_lock_irq(&tasklist_lock);
  2321	
  2322		/* CLONE_PARENT re-uses the old parent */
  2323		if (clone_flags & (CLONE_PARENT|CLONE_THREAD)) {
  2324			p->real_parent = current->real_parent;
  2325			p->parent_exec_id = current->parent_exec_id;
  2326			if (clone_flags & CLONE_THREAD)
  2327				p->exit_signal = -1;
  2328			else
  2329				p->exit_signal = current->group_leader->exit_signal;
  2330		} else {
  2331			p->real_parent = current;
  2332			p->parent_exec_id = current->self_exec_id;
  2333			p->exit_signal = args->exit_signal;
  2334		}
  2335	
  2336		klp_copy_process(p);
  2337	
  2338		sched_core_fork(p);
  2339	
  2340		spin_lock(&current->sighand->siglock);
  2341	
  2342		rv_task_fork(p);
  2343	
  2344		rseq_fork(p, clone_flags);
  2345	
  2346		/* Don't start children in a dying pid namespace */
  2347		if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
  2348			retval = -ENOMEM;
  2349			goto bad_fork_core_free;
  2350		}
  2351	
  2352		/* Let kill terminate clone/fork in the middle */
  2353		if (fatal_signal_pending(current)) {
  2354			retval = -EINTR;
  2355			goto bad_fork_core_free;
  2356		}
  2357	
  2358		/* No more failure paths after this point. */
  2359	
  2360		/*
  2361		 * Copy seccomp details explicitly here, in case they were changed
  2362		 * before holding sighand lock.
  2363		 */
  2364		copy_seccomp(p);
  2365	
  2366		init_task_pid_links(p);
  2367		if (likely(p->pid)) {
  2368			ptrace_init_task(p, (clone_flags & CLONE_PTRACE) || trace);
  2369	
  2370			init_task_pid(p, PIDTYPE_PID, pid);
  2371			if (thread_group_leader(p)) {
  2372				init_task_pid(p, PIDTYPE_TGID, pid);
  2373				init_task_pid(p, PIDTYPE_PGID, task_pgrp(current));
  2374				init_task_pid(p, PIDTYPE_SID, task_session(current));
  2375	
  2376				if (is_child_reaper(pid)) {
  2377					ns_of_pid(pid)->child_reaper = p;
  2378					p->signal->flags |= SIGNAL_UNKILLABLE;
  2379				}
  2380				p->signal->shared_pending.signal = delayed.signal;
  2381				p->signal->tty = tty_kref_get(current->signal->tty);
  2382				/*
  2383				 * Inherit has_child_subreaper flag under the same
  2384				 * tasklist_lock with adding child to the process tree
  2385				 * for propagate_has_child_subreaper optimization.
  2386				 */
  2387				p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
  2388								 p->real_parent->signal->is_child_subreaper;
  2389				list_add_tail(&p->sibling, &p->real_parent->children);
  2390				list_add_tail_rcu(&p->tasks, &init_task.tasks);
  2391				attach_pid(p, PIDTYPE_TGID);
  2392				attach_pid(p, PIDTYPE_PGID);
  2393				attach_pid(p, PIDTYPE_SID);
  2394				__this_cpu_inc(process_counts);
  2395			} else {
  2396				current->signal->nr_threads++;
  2397				current->signal->quick_threads++;
  2398				atomic_inc(&current->signal->live);
  2399				refcount_inc(&current->signal->sigcnt);
  2400				task_join_group_stop(p);
  2401				list_add_tail_rcu(&p->thread_node,
  2402						  &p->signal->thread_head);
  2403			}
  2404			attach_pid(p, PIDTYPE_PID);
  2405			nr_threads++;
  2406		}
  2407		total_forks++;
  2408		hlist_del_init(&delayed.node);
  2409		spin_unlock(&current->sighand->siglock);
  2410		syscall_tracepoint_update(p);
  2411		write_unlock_irq(&tasklist_lock);
  2412	
  2413		if (pidfile)
  2414			fd_install(pidfd, pidfile);
  2415	
  2416		proc_fork_connector(p);
  2417		sched_post_fork(p);
  2418		cgroup_post_fork(p, args);
  2419		perf_event_fork(p);
  2420	
  2421		trace_task_newtask(p, clone_flags);
  2422		uprobe_copy_process(p, clone_flags);
  2423		user_events_fork(p, clone_flags);
  2424	
  2425		copy_oom_score_adj(clone_flags, p);
  2426	
  2427		return p;
  2428	
  2429	bad_fork_core_free:
  2430		sched_core_free(p);
  2431		spin_unlock(&current->sighand->siglock);
  2432		write_unlock_irq(&tasklist_lock);
  2433	bad_fork_cancel_cgroup:
  2434		cgroup_cancel_fork(p, args);
  2435	bad_fork_put_pidfd:
  2436		if (clone_flags & CLONE_PIDFD) {
  2437			fput(pidfile);
  2438			put_unused_fd(pidfd);
  2439		}
  2440	bad_fork_free_pid:
  2441		if (pid != &init_struct_pid)
  2442			free_pid(pid);
  2443	bad_fork_cleanup_thread:
  2444		exit_thread(p);
  2445	bad_fork_cleanup_io:
  2446		if (p->io_context)
  2447			exit_io_context(p);
  2448	bad_fork_cleanup_namespaces:
  2449		exit_task_namespaces(p);
  2450	bad_fork_cleanup_mm:
  2451		if (p->mm) {
> 2452			sched_mm_cid_exit(p);
  2453			mm_clear_owner(p->mm, p);
  2454			mmput(p->mm);
  2455		}
  2456	bad_fork_cleanup_signal:
  2457		if (!(clone_flags & CLONE_THREAD))
  2458			free_signal_struct(p->signal);
  2459	bad_fork_cleanup_sighand:
  2460		__cleanup_sighand(p->sighand);
  2461	bad_fork_cleanup_fs:
  2462		exit_fs(p); /* blocking */
  2463	bad_fork_cleanup_files:
  2464		exit_files(p); /* blocking */
  2465	bad_fork_cleanup_semundo:
  2466		exit_sem(p);
  2467	bad_fork_cleanup_security:
  2468		security_task_free(p);
  2469	bad_fork_cleanup_audit:
  2470		audit_free(p);
  2471	bad_fork_cleanup_perf:
  2472		perf_event_free_task(p);
  2473	bad_fork_sched_cancel_fork:
  2474		sched_cancel_fork(p);
  2475	bad_fork_cleanup_policy:
  2476		lockdep_free_task(p);
  2477	#ifdef CONFIG_NUMA
  2478		mpol_put(p->mempolicy);
  2479	#endif
  2480	bad_fork_cleanup_delayacct:
  2481		delayacct_tsk_free(p);
  2482	bad_fork_cleanup_count:
  2483		dec_rlimit_ucounts(task_ucounts(p), UCOUNT_RLIMIT_NPROC, 1);
  2484		exit_creds(p);
  2485	bad_fork_free:
  2486		WRITE_ONCE(p->__state, TASK_DEAD);
  2487		exit_task_stack_account(p);
  2488		put_task_stack(p);
  2489		delayed_free_task(p);
  2490	fork_out:
  2491		spin_lock_irq(&current->sighand->siglock);
  2492		hlist_del_init(&delayed.node);
  2493		spin_unlock_irq(&current->sighand->siglock);
  2494		return ERR_PTR(retval);
  2495	}
  2496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
