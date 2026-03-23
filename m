Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6298635C19C;
	Mon, 23 Mar 2026 12:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774267335; cv=none; b=QB6oG9rn3fc4R6Ex1vdyZUEvwfaZ3ij7KHHIQIjWaoMuazfgoTi6t+ggMBrF/DGj7WYoGg7SyIrc+DBD5UViKtG7NAZaZxjghnBi/2RS948zUf6+Qldw5UqOaV6QTAzb3xmQKCnB4mxkKTQxw8g4EHKmcAQWjgxfPt+/QcwpRXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774267335; c=relaxed/simple;
	bh=DH990MAA7XqDK96wX1hSt53+bz7x8xh+FefGD2xWiVI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oqetfp0DnHfhseHUKeJSfFxceO+vdElkgMUwcWfGpJSDdNgrNax+eHENZ7m/Lj99KEnsUV82x4Hf0d2yuWBLm855FcdhRl5zfjW/e6At14D8hKnZdRo0dUYWvzl2v/6ZogTLD3tZZwWlLywmf9Bkq68wzmVybv4Pqt6ekn5syEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxDmyPUD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxDmyPUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774267333; x=1805803333;
  h=date:from:to:cc:subject:message-id;
  bh=DH990MAA7XqDK96wX1hSt53+bz7x8xh+FefGD2xWiVI=;
  b=AxDmyPUD85lGUcyH47Ujk+4r6d4XnnH20fNeG21ipd9fDszX/wHfqlkM
   UrUY7i47ZVCPFAzpwfECZK9JL3dYitwYsmQL38fV/9Hw3idLRPmJ0U/wX
   LQGoNo4JTeLsbbLRsxSehnLP0FQcy5kVsqDzLcTrdJuazZAgJLlPEcNPf
   lkxObEWmFiNVHcN9rweuognT+PdDfBQYkUkI/NF9+YABcz7Aq28NlmMwB
   Dixw3j5ABRiv/pygULpDwidjQIeBUZpv3y8iy77hIA3wL5JFiQ33/uT7K
   ekVFTdjX9wqBzoyrpN/0XJFWNk39xpupJ+i8dG4rQg0KePAOai1/+f5eZ
   g==;
X-CSE-ConnectionGUID: /kJWaBuMSpGfZPY7Ln4MrQ==
X-CSE-MsgGUID: egBwz1AQTneq/cy48OYczQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75144138"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75144138"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:02:13 -0700
X-CSE-ConnectionGUID: rc4+HHOKSwGRH2ZQvL+5jw==
X-CSE-MsgGUID: hwcc9uMwQ7euFNoeiqU2eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="225722933"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Mar 2026 05:02:11 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4dyy-000000000TV-3VtL;
	Mon, 23 Mar 2026 12:02:08 +0000
Date: Mon, 23 Mar 2026 20:01:22 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Tejun Heo <tj@kernel.org>
Subject: [tj-sched-ext:for-next 95/109]
 kernel/sched/ext_idle.c:629:25: error: call to undeclared function
 'cpu_smt_mask'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202603231900.ScD9mZNd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git for-next
head:   c919783ddb4e64aed07a276172a6712de07fce12
commit: 2197cecdb02c57b08340059452540fcf101fa30d [95/109] sched_ext: idle: Prioritize idle SMT sibling
config: riscv-randconfig-002-20260323 (https://download.01.org/0day-ci/archive/20260323/202603231900.ScD9mZNd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 3258d361cbc5d57e5e507004706eb36acf120066)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603231900.ScD9mZNd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603231900.ScD9mZNd-lkp@intel.com/

Note: the tj-sched-ext/for-next HEAD c919783ddb4e64aed07a276172a6712de07fce12 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c:6292:49: warning: diagnostic behavior may be improved by adding the 'format(printf, 4, 0)' attribute to the declaration of 'scx_vexit' [-Wmissing-format-attribute]
     202 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |                                                        ^
   kernel/sched/ext.c:202:13: note: 'scx_vexit' declared here
     202 | static bool scx_vexit(struct scx_sched *sch, enum scx_exit_kind kind,
         |             ^
   In file included from kernel/sched/build_policy.c:63:
>> kernel/sched/ext_idle.c:629:25: error: call to undeclared function 'cpu_smt_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     629 |                 for_each_cpu_and(cpu, cpu_smt_mask(prev_cpu), allowed) {
         |                                       ^
>> kernel/sched/ext_idle.c:629:3: error: member reference type 'int' is not a pointer
     629 |                 for_each_cpu_and(cpu, cpu_smt_mask(prev_cpu), allowed) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:410:24: note: expanded from macro 'for_each_cpu_and'
     410 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask_types.h:18:39: note: expanded from macro 'cpumask_bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                       ^
   include/linux/find.h:590:34: note: expanded from macro 'for_each_and_bit'
     590 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   1 warning and 2 errors generated.


vim +/cpu_smt_mask +629 kernel/sched/ext_idle.c

   415	
   416	/*
   417	 * Built-in CPU idle selection policy:
   418	 *
   419	 * 1. Prioritize full-idle cores:
   420	 *   - always prioritize CPUs from fully idle cores (both logical CPUs are
   421	 *     idle) to avoid interference caused by SMT.
   422	 *
   423	 * 2. Reuse the same CPU:
   424	 *   - prefer the last used CPU to take advantage of cached data (L1, L2) and
   425	 *     branch prediction optimizations.
   426	 *
   427	 * 3. Prefer @prev_cpu's SMT sibling:
   428	 *   - if @prev_cpu is busy and no fully idle core is available, try to
   429	 *     place the task on an idle SMT sibling of @prev_cpu; keeping the
   430	 *     task on the same core makes migration cheaper, preserves L1 cache
   431	 *     locality and reduces wakeup latency.
   432	 *
   433	 * 4. Pick a CPU within the same LLC (Last-Level Cache):
   434	 *   - if the above conditions aren't met, pick a CPU that shares the same
   435	 *     LLC, if the LLC domain is a subset of @cpus_allowed, to maintain
   436	 *     cache locality.
   437	 *
   438	 * 5. Pick a CPU within the same NUMA node, if enabled:
   439	 *   - choose a CPU from the same NUMA node, if the node cpumask is a
   440	 *     subset of @cpus_allowed, to reduce memory access latency.
   441	 *
   442	 * 6. Pick any idle CPU within the @cpus_allowed domain.
   443	 *
   444	 * Step 4 and 5 are performed only if the system has, respectively,
   445	 * multiple LLCs / multiple NUMA nodes (see scx_selcpu_topo_llc and
   446	 * scx_selcpu_topo_numa) and they don't contain the same subset of CPUs.
   447	 *
   448	 * If %SCX_OPS_BUILTIN_IDLE_PER_NODE is enabled, the search will always
   449	 * begin in @prev_cpu's node and proceed to other nodes in order of
   450	 * increasing distance.
   451	 *
   452	 * Return the picked CPU if idle, or a negative value otherwise.
   453	 *
   454	 * NOTE: tasks that can only run on 1 CPU are excluded by this logic, because
   455	 * we never call ops.select_cpu() for them, see select_task_rq().
   456	 */
   457	s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
   458			       const struct cpumask *cpus_allowed, u64 flags)
   459	{
   460		const struct cpumask *llc_cpus = NULL, *numa_cpus = NULL;
   461		const struct cpumask *allowed = cpus_allowed ?: p->cpus_ptr;
   462		int node = scx_cpu_node_if_enabled(prev_cpu);
   463		bool is_prev_allowed;
   464		s32 cpu;
   465	
   466		preempt_disable();
   467	
   468		/*
   469		 * Check whether @prev_cpu is still within the allowed set. If not,
   470		 * we can still try selecting a nearby CPU.
   471		 */
   472		is_prev_allowed = cpumask_test_cpu(prev_cpu, allowed);
   473	
   474		/*
   475		 * Determine the subset of CPUs usable by @p within @cpus_allowed.
   476		 */
   477		if (allowed != p->cpus_ptr) {
   478			struct cpumask *local_cpus = this_cpu_cpumask_var_ptr(local_idle_cpumask);
   479	
   480			if (task_affinity_all(p)) {
   481				allowed = cpus_allowed;
   482			} else if (cpumask_and(local_cpus, cpus_allowed, p->cpus_ptr)) {
   483				allowed = local_cpus;
   484			} else {
   485				cpu = -EBUSY;
   486				goto out_enable;
   487			}
   488		}
   489	
   490		/*
   491		 * This is necessary to protect llc_cpus.
   492		 */
   493		rcu_read_lock();
   494	
   495		/*
   496		 * Determine the subset of CPUs that the task can use in its
   497		 * current LLC and node.
   498		 *
   499		 * If the task can run on all CPUs, use the node and LLC cpumasks
   500		 * directly.
   501		 */
   502		if (static_branch_maybe(CONFIG_NUMA, &scx_selcpu_topo_numa)) {
   503			struct cpumask *local_cpus = this_cpu_cpumask_var_ptr(local_numa_idle_cpumask);
   504			const struct cpumask *cpus = numa_span(prev_cpu);
   505	
   506			if (allowed == p->cpus_ptr && task_affinity_all(p))
   507				numa_cpus = cpus;
   508			else if (cpus && cpumask_and(local_cpus, allowed, cpus))
   509				numa_cpus = local_cpus;
   510		}
   511	
   512		if (static_branch_maybe(CONFIG_SCHED_MC, &scx_selcpu_topo_llc)) {
   513			struct cpumask *local_cpus = this_cpu_cpumask_var_ptr(local_llc_idle_cpumask);
   514			const struct cpumask *cpus = llc_span(prev_cpu);
   515	
   516			if (allowed == p->cpus_ptr && task_affinity_all(p))
   517				llc_cpus = cpus;
   518			else if (cpus && cpumask_and(local_cpus, allowed, cpus))
   519				llc_cpus = local_cpus;
   520		}
   521	
   522		/*
   523		 * If WAKE_SYNC, try to migrate the wakee to the waker's CPU.
   524		 */
   525		if (wake_flags & SCX_WAKE_SYNC) {
   526			int waker_node;
   527	
   528			/*
   529			 * If the waker's CPU is cache affine and prev_cpu is idle,
   530			 * then avoid a migration.
   531			 */
   532			cpu = smp_processor_id();
   533			if (is_prev_allowed && cpus_share_cache(cpu, prev_cpu) &&
   534			    scx_idle_test_and_clear_cpu(prev_cpu)) {
   535				cpu = prev_cpu;
   536				goto out_unlock;
   537			}
   538	
   539			/*
   540			 * If the waker's local DSQ is empty, and the system is under
   541			 * utilized, try to wake up @p to the local DSQ of the waker.
   542			 *
   543			 * Checking only for an empty local DSQ is insufficient as it
   544			 * could give the wakee an unfair advantage when the system is
   545			 * oversaturated.
   546			 *
   547			 * Checking only for the presence of idle CPUs is also
   548			 * insufficient as the local DSQ of the waker could have tasks
   549			 * piled up on it even if there is an idle core elsewhere on
   550			 * the system.
   551			 */
   552			waker_node = cpu_to_node(cpu);
   553			if (!(current->flags & PF_EXITING) &&
   554			    cpu_rq(cpu)->scx.local_dsq.nr == 0 &&
   555			    (!(flags & SCX_PICK_IDLE_IN_NODE) || (waker_node == node)) &&
   556			    !cpumask_empty(idle_cpumask(waker_node)->cpu)) {
   557				if (cpumask_test_cpu(cpu, allowed))
   558					goto out_unlock;
   559			}
   560		}
   561	
   562		/*
   563		 * If CPU has SMT, any wholly idle CPU is likely a better pick than
   564		 * partially idle @prev_cpu.
   565		 */
   566		if (sched_smt_active()) {
   567			/*
   568			 * Keep using @prev_cpu if it's part of a fully idle core.
   569			 */
   570			if (is_prev_allowed &&
   571			    cpumask_test_cpu(prev_cpu, idle_cpumask(node)->smt) &&
   572			    scx_idle_test_and_clear_cpu(prev_cpu)) {
   573				cpu = prev_cpu;
   574				goto out_unlock;
   575			}
   576	
   577			/*
   578			 * Search for any fully idle core in the same LLC domain.
   579			 */
   580			if (llc_cpus) {
   581				cpu = pick_idle_cpu_in_node(llc_cpus, node, SCX_PICK_IDLE_CORE);
   582				if (cpu >= 0)
   583					goto out_unlock;
   584			}
   585	
   586			/*
   587			 * Search for any fully idle core in the same NUMA node.
   588			 */
   589			if (numa_cpus) {
   590				cpu = pick_idle_cpu_in_node(numa_cpus, node, SCX_PICK_IDLE_CORE);
   591				if (cpu >= 0)
   592					goto out_unlock;
   593			}
   594	
   595			/*
   596			 * Search for any full-idle core usable by the task.
   597			 *
   598			 * If the node-aware idle CPU selection policy is enabled
   599			 * (%SCX_OPS_BUILTIN_IDLE_PER_NODE), the search will always
   600			 * begin in prev_cpu's node and proceed to other nodes in
   601			 * order of increasing distance.
   602			 */
   603			cpu = scx_pick_idle_cpu(allowed, node, flags | SCX_PICK_IDLE_CORE);
   604			if (cpu >= 0)
   605				goto out_unlock;
   606	
   607			/*
   608			 * Give up if we're strictly looking for a full-idle SMT
   609			 * core.
   610			 */
   611			if (flags & SCX_PICK_IDLE_CORE) {
   612				cpu = -EBUSY;
   613				goto out_unlock;
   614			}
   615		}
   616	
   617		/*
   618		 * Use @prev_cpu if it's idle.
   619		 */
   620		if (is_prev_allowed && scx_idle_test_and_clear_cpu(prev_cpu)) {
   621			cpu = prev_cpu;
   622			goto out_unlock;
   623		}
   624	
   625		/*
   626		 * Use @prev_cpu's sibling if it's idle.
   627		 */
   628		if (sched_smt_active()) {
 > 629			for_each_cpu_and(cpu, cpu_smt_mask(prev_cpu), allowed) {
   630				if (cpu == prev_cpu)
   631					continue;
   632				if (scx_idle_test_and_clear_cpu(cpu))
   633					goto out_unlock;
   634			}
   635		}
   636	
   637		/*
   638		 * Search for any idle CPU in the same LLC domain.
   639		 */
   640		if (llc_cpus) {
   641			cpu = pick_idle_cpu_in_node(llc_cpus, node, 0);
   642			if (cpu >= 0)
   643				goto out_unlock;
   644		}
   645	
   646		/*
   647		 * Search for any idle CPU in the same NUMA node.
   648		 */
   649		if (numa_cpus) {
   650			cpu = pick_idle_cpu_in_node(numa_cpus, node, 0);
   651			if (cpu >= 0)
   652				goto out_unlock;
   653		}
   654	
   655		/*
   656		 * Search for any idle CPU usable by the task.
   657		 *
   658		 * If the node-aware idle CPU selection policy is enabled
   659		 * (%SCX_OPS_BUILTIN_IDLE_PER_NODE), the search will always begin
   660		 * in prev_cpu's node and proceed to other nodes in order of
   661		 * increasing distance.
   662		 */
   663		cpu = scx_pick_idle_cpu(allowed, node, flags);
   664	
   665	out_unlock:
   666		rcu_read_unlock();
   667	out_enable:
   668		preempt_enable();
   669	
   670		return cpu;
   671	}
   672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
