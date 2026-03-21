Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D413C07A;
	Sat, 21 Mar 2026 01:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774057073; cv=none; b=m/GKqtD4Y7yb3Qcy5ruDVBrpz5XPiCctdhp21TtpeTQWbQ2QPBuzvLzOVy/UmkEcOA2JrjxmGuyJ/x04HVj1AjupQ5YFWEddCBXWw1amq4flTuvh2Cmv5r/1412PWwqaBIB4AH0oYVBF0nkvFFaqGGlxpEBC1HQSPYAv7+PXy2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774057073; c=relaxed/simple;
	bh=kFf2xXac4jtnZUGMCF5lL1p37LiWFeFO44FGnWlwWi4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pAyPKMldAwt938gDKb6u5liYH2G6QsikY62Z2LiiS5QKOCTQasofusL7fKFA5WME4RbzoSmfrIs/SeUWfsPHTHleWKkNLaqoP18/BbIMAVKQfLTfcyXmXovaxRErgM779a2mfv+DhEIFXnFNJ0qN3luJn0x6ogFKRPlUct4sc+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gv7Rpa+P; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gv7Rpa+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774057071; x=1805593071;
  h=date:from:to:cc:subject:message-id;
  bh=kFf2xXac4jtnZUGMCF5lL1p37LiWFeFO44FGnWlwWi4=;
  b=gv7Rpa+P+dwHpth8xbOz1QoQcGTyUmWtEvFK0l1QTfS7TRhjJBixWFzh
   jZFR9WCg1JIDvWendf1viSa4UhSK+DdgPxxHFuFucd3QvWF2bAkwk/iDx
   LpYUXdO9htAEux5bBtHVDOj2Plpid2D/jqrQJ+/opx0QOaVZJgtm0ZOxD
   br3itp+PALZvZ4dU6YKccNQCiXSbGFx1uGrfBMX/YdnYxRbkaET7gGdvf
   ywp/qjCbiUZtrxMP5cDNUq39aZRUqpEm7bG/s7/RannwggoRXe+tsGvHk
   Q7dKg4ItJ7+fg9aQxDM+Lr7heD1FoaIZpVIWVdSdXSon5ee5bRZoMP1p7
   A==;
X-CSE-ConnectionGUID: JcB+kywZR+C25fq3GLeofA==
X-CSE-MsgGUID: tXiRMvAFSReD+k2Qxsh7Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="97769537"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="97769537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 18:37:51 -0700
X-CSE-ConnectionGUID: R3AdhkxTTfWMDHomLjlcCg==
X-CSE-MsgGUID: HTKWUOErSXusi2JUfQUjiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="253938587"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2026 18:37:48 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3lHb-000000000AT-2j22;
	Sat, 21 Mar 2026 01:37:44 +0000
Date: Sat, 21 Mar 2026 09:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrea Righi <arighi@nvidia.com>
Subject: [linux-next:master 5440/7971] kernel/sched/ext.c:6517:2:
 error: call to undeclared function 'cgroup_put'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202603210903.IrKhPd6k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
commit: 618a9db0158b1c51fd33822cf804f5a09f829837 [5440/7971] sched_ext: Use kobject_put() for kobject_init_and_add() failure in scx_alloc_and_add_sched()
config: x86_64-buildonly-randconfig-004-20260321 (https://download.01.org/0day-ci/archive/20260321/202603210903.IrKhPd6k-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210903.IrKhPd6k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210903.IrKhPd6k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:62:
>> kernel/sched/ext.c:6517:2: error: call to undeclared function 'cgroup_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6517 |         cgroup_put(cgrp);
         |         ^
   kernel/sched/ext.c:6497:1: warning: unused label 'err_stop_helper' [-Wunused-label]
    6497 | err_stop_helper:
         | ^~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:6606:2: error: call to undeclared function 'cgroup_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6606 |         cgroup_get(cgrp);
         |         ^
   1 warning and 2 errors generated.


vim +/cgroup_put +6517 kernel/sched/ext.c

  6355	
  6356	/*
  6357	 * Allocate and initialize a new scx_sched. @cgrp's reference is always
  6358	 * consumed whether the function succeeds or fails.
  6359	 */
  6360	static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops,
  6361							 struct cgroup *cgrp,
  6362							 struct scx_sched *parent)
  6363	{
  6364		struct scx_sched *sch;
  6365		s32 level = parent ? parent->level + 1 : 0;
  6366		s32 node, cpu, ret, bypass_fail_cpu = nr_cpu_ids;
  6367	
  6368		sch = kzalloc_flex(*sch, ancestors, level);
  6369		if (!sch) {
  6370			ret = -ENOMEM;
  6371			goto err_put_cgrp;
  6372		}
  6373	
  6374		sch->exit_info = alloc_exit_info(ops->exit_dump_len);
  6375		if (!sch->exit_info) {
  6376			ret = -ENOMEM;
  6377			goto err_free_sch;
  6378		}
  6379	
  6380		ret = rhashtable_init(&sch->dsq_hash, &dsq_hash_params);
  6381		if (ret < 0)
  6382			goto err_free_ei;
  6383	
  6384		sch->pnode = kzalloc_objs(sch->pnode[0], nr_node_ids);
  6385		if (!sch->pnode) {
  6386			ret = -ENOMEM;
  6387			goto err_free_hash;
  6388		}
  6389	
  6390		for_each_node_state(node, N_POSSIBLE) {
  6391			sch->pnode[node] = alloc_pnode(sch, node);
  6392			if (!sch->pnode[node]) {
  6393				ret = -ENOMEM;
  6394				goto err_free_pnode;
  6395			}
  6396		}
  6397	
  6398		sch->dsp_max_batch = ops->dispatch_max_batch ?: SCX_DSP_DFL_MAX_BATCH;
  6399		sch->pcpu = __alloc_percpu(struct_size_t(struct scx_sched_pcpu,
  6400							 dsp_ctx.buf, sch->dsp_max_batch),
  6401					   __alignof__(struct scx_sched_pcpu));
  6402		if (!sch->pcpu) {
  6403			ret = -ENOMEM;
  6404			goto err_free_pnode;
  6405		}
  6406	
  6407		for_each_possible_cpu(cpu) {
  6408			ret = init_dsq(bypass_dsq(sch, cpu), SCX_DSQ_BYPASS, sch);
  6409			if (ret) {
  6410				bypass_fail_cpu = cpu;
  6411				goto err_free_pcpu;
  6412			}
  6413		}
  6414	
  6415		for_each_possible_cpu(cpu) {
  6416			struct scx_sched_pcpu *pcpu = per_cpu_ptr(sch->pcpu, cpu);
  6417	
  6418			pcpu->sch = sch;
  6419			INIT_LIST_HEAD(&pcpu->deferred_reenq_local.node);
  6420		}
  6421	
  6422		sch->helper = kthread_run_worker(0, "sched_ext_helper");
  6423		if (IS_ERR(sch->helper)) {
  6424			ret = PTR_ERR(sch->helper);
  6425			goto err_free_pcpu;
  6426		}
  6427	
  6428		sched_set_fifo(sch->helper->task);
  6429	
  6430		if (parent)
  6431			memcpy(sch->ancestors, parent->ancestors,
  6432			       level * sizeof(parent->ancestors[0]));
  6433		sch->ancestors[level] = sch;
  6434		sch->level = level;
  6435	
  6436		if (ops->timeout_ms)
  6437			sch->watchdog_timeout = msecs_to_jiffies(ops->timeout_ms);
  6438		else
  6439			sch->watchdog_timeout = SCX_WATCHDOG_MAX_TIMEOUT;
  6440	
  6441		sch->slice_dfl = SCX_SLICE_DFL;
  6442		atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
  6443		init_irq_work(&sch->disable_irq_work, scx_disable_irq_workfn);
  6444		kthread_init_work(&sch->disable_work, scx_disable_workfn);
  6445		timer_setup(&sch->bypass_lb_timer, scx_bypass_lb_timerfn, 0);
  6446		sch->ops = *ops;
  6447		rcu_assign_pointer(ops->priv, sch);
  6448	
  6449		sch->kobj.kset = scx_kset;
  6450	
  6451	#ifdef CONFIG_EXT_SUB_SCHED
  6452		char *buf = kzalloc(PATH_MAX, GFP_KERNEL);
  6453		if (!buf) {
  6454			ret = -ENOMEM;
  6455			goto err_stop_helper;
  6456		}
  6457		cgroup_path(cgrp, buf, PATH_MAX);
  6458		sch->cgrp_path = kstrdup(buf, GFP_KERNEL);
  6459		kfree(buf);
  6460		if (!sch->cgrp_path) {
  6461			ret = -ENOMEM;
  6462			goto err_stop_helper;
  6463		}
  6464	
  6465		sch->cgrp = cgrp;
  6466		INIT_LIST_HEAD(&sch->children);
  6467		INIT_LIST_HEAD(&sch->sibling);
  6468	
  6469		if (parent)
  6470			ret = kobject_init_and_add(&sch->kobj, &scx_ktype,
  6471						   &parent->sub_kset->kobj,
  6472						   "sub-%llu", cgroup_id(cgrp));
  6473		else
  6474			ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
  6475	
  6476		if (ret < 0) {
  6477			kobject_put(&sch->kobj);
  6478			return ERR_PTR(ret);
  6479		}
  6480	
  6481		if (ops->sub_attach) {
  6482			sch->sub_kset = kset_create_and_add("sub", NULL, &sch->kobj);
  6483			if (!sch->sub_kset) {
  6484				kobject_put(&sch->kobj);
  6485				return ERR_PTR(-ENOMEM);
  6486			}
  6487		}
  6488	#else	/* CONFIG_EXT_SUB_SCHED */
  6489		ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
  6490		if (ret < 0) {
  6491			kobject_put(&sch->kobj);
  6492			return ERR_PTR(ret);
  6493		}
  6494	#endif	/* CONFIG_EXT_SUB_SCHED */
  6495		return sch;
  6496	
  6497	err_stop_helper:
  6498		kthread_destroy_worker(sch->helper);
  6499	err_free_pcpu:
  6500		for_each_possible_cpu(cpu) {
  6501			if (cpu == bypass_fail_cpu)
  6502				break;
  6503			exit_dsq(bypass_dsq(sch, cpu));
  6504		}
  6505		free_percpu(sch->pcpu);
  6506	err_free_pnode:
  6507		for_each_node_state(node, N_POSSIBLE)
  6508			free_pnode(sch->pnode[node]);
  6509		kfree(sch->pnode);
  6510	err_free_hash:
  6511		rhashtable_free_and_destroy(&sch->dsq_hash, NULL, NULL);
  6512	err_free_ei:
  6513		free_exit_info(sch->exit_info);
  6514	err_free_sch:
  6515		kfree(sch);
  6516	err_put_cgrp:
> 6517		cgroup_put(cgrp);
  6518		return ERR_PTR(ret);
  6519	}
  6520	
  6521	static int check_hotplug_seq(struct scx_sched *sch,
  6522				      const struct sched_ext_ops *ops)
  6523	{
  6524		unsigned long long global_hotplug_seq;
  6525	
  6526		/*
  6527		 * If a hotplug event has occurred between when a scheduler was
  6528		 * initialized, and when we were able to attach, exit and notify user
  6529		 * space about it.
  6530		 */
  6531		if (ops->hotplug_seq) {
  6532			global_hotplug_seq = atomic_long_read(&scx_hotplug_seq);
  6533			if (ops->hotplug_seq != global_hotplug_seq) {
  6534				scx_exit(sch, SCX_EXIT_UNREG_KERN,
  6535					 SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
  6536					 "expected hotplug seq %llu did not match actual %llu",
  6537					 ops->hotplug_seq, global_hotplug_seq);
  6538				return -EBUSY;
  6539			}
  6540		}
  6541	
  6542		return 0;
  6543	}
  6544	
  6545	static int validate_ops(struct scx_sched *sch, const struct sched_ext_ops *ops)
  6546	{
  6547		/*
  6548		 * It doesn't make sense to specify the SCX_OPS_ENQ_LAST flag if the
  6549		 * ops.enqueue() callback isn't implemented.
  6550		 */
  6551		if ((ops->flags & SCX_OPS_ENQ_LAST) && !ops->enqueue) {
  6552			scx_error(sch, "SCX_OPS_ENQ_LAST requires ops.enqueue() to be implemented");
  6553			return -EINVAL;
  6554		}
  6555	
  6556		/*
  6557		 * SCX_OPS_BUILTIN_IDLE_PER_NODE requires built-in CPU idle
  6558		 * selection policy to be enabled.
  6559		 */
  6560		if ((ops->flags & SCX_OPS_BUILTIN_IDLE_PER_NODE) &&
  6561		    (ops->update_idle && !(ops->flags & SCX_OPS_KEEP_BUILTIN_IDLE))) {
  6562			scx_error(sch, "SCX_OPS_BUILTIN_IDLE_PER_NODE requires CPU idle selection enabled");
  6563			return -EINVAL;
  6564		}
  6565	
  6566		if (ops->cpu_acquire || ops->cpu_release)
  6567			pr_warn("ops->cpu_acquire/release() are deprecated, use sched_switch TP instead\n");
  6568	
  6569		return 0;
  6570	}
  6571	
  6572	/*
  6573	 * scx_enable() is offloaded to a dedicated system-wide RT kthread to avoid
  6574	 * starvation. During the READY -> ENABLED task switching loop, the calling
  6575	 * thread's sched_class gets switched from fair to ext. As fair has higher
  6576	 * priority than ext, the calling thread can be indefinitely starved under
  6577	 * fair-class saturation, leading to a system hang.
  6578	 */
  6579	struct scx_enable_cmd {
  6580		struct kthread_work	work;
  6581		struct sched_ext_ops	*ops;
  6582		int			ret;
  6583	};
  6584	
  6585	static void scx_root_enable_workfn(struct kthread_work *work)
  6586	{
  6587		struct scx_enable_cmd *cmd = container_of(work, struct scx_enable_cmd, work);
  6588		struct sched_ext_ops *ops = cmd->ops;
  6589		struct cgroup *cgrp = root_cgroup();
  6590		struct scx_sched *sch;
  6591		struct scx_task_iter sti;
  6592		struct task_struct *p;
  6593		int i, cpu, ret;
  6594	
  6595		mutex_lock(&scx_enable_mutex);
  6596	
  6597		if (scx_enable_state() != SCX_DISABLED) {
  6598			ret = -EBUSY;
  6599			goto err_unlock;
  6600		}
  6601	
  6602		ret = alloc_kick_syncs();
  6603		if (ret)
  6604			goto err_unlock;
  6605	
> 6606		cgroup_get(cgrp);
  6607		sch = scx_alloc_and_add_sched(ops, cgrp, NULL);
  6608		if (IS_ERR(sch)) {
  6609			ret = PTR_ERR(sch);
  6610			goto err_free_ksyncs;
  6611		}
  6612	
  6613		/*
  6614		 * Transition to ENABLING and clear exit info to arm the disable path.
  6615		 * Failure triggers full disabling from here on.
  6616		 */
  6617		WARN_ON_ONCE(scx_set_enable_state(SCX_ENABLING) != SCX_DISABLED);
  6618		WARN_ON_ONCE(scx_root);
  6619	
  6620		atomic_long_set(&scx_nr_rejected, 0);
  6621	
  6622		for_each_possible_cpu(cpu) {
  6623			struct rq *rq = cpu_rq(cpu);
  6624	
  6625			rq->scx.local_dsq.sched = sch;
  6626			rq->scx.cpuperf_target = SCX_CPUPERF_ONE;
  6627		}
  6628	
  6629		/*
  6630		 * Keep CPUs stable during enable so that the BPF scheduler can track
  6631		 * online CPUs by watching ->on/offline_cpu() after ->init().
  6632		 */
  6633		cpus_read_lock();
  6634	
  6635		/*
  6636		 * Make the scheduler instance visible. Must be inside cpus_read_lock().
  6637		 * See handle_hotplug().
  6638		 */
  6639		rcu_assign_pointer(scx_root, sch);
  6640	
  6641		ret = scx_link_sched(sch);
  6642		if (ret)
  6643			goto err_disable;
  6644	
  6645		scx_idle_enable(ops);
  6646	
  6647		if (sch->ops.init) {
  6648			ret = SCX_CALL_OP_RET(sch, SCX_KF_UNLOCKED, init, NULL);
  6649			if (ret) {
  6650				ret = ops_sanitize_err(sch, "init", ret);
  6651				cpus_read_unlock();
  6652				scx_error(sch, "ops.init() failed (%d)", ret);
  6653				goto err_disable;
  6654			}
  6655			sch->exit_info->flags |= SCX_EFLAG_INITIALIZED;
  6656		}
  6657	
  6658		for (i = SCX_OPI_CPU_HOTPLUG_BEGIN; i < SCX_OPI_CPU_HOTPLUG_END; i++)
  6659			if (((void (**)(void))ops)[i])
  6660				set_bit(i, sch->has_op);
  6661	
  6662		ret = check_hotplug_seq(sch, ops);
  6663		if (ret) {
  6664			cpus_read_unlock();
  6665			goto err_disable;
  6666		}
  6667		scx_idle_update_selcpu_topology(ops);
  6668	
  6669		cpus_read_unlock();
  6670	
  6671		ret = validate_ops(sch, ops);
  6672		if (ret)
  6673			goto err_disable;
  6674	
  6675		/*
  6676		 * Once __scx_enabled is set, %current can be switched to SCX anytime.
  6677		 * This can lead to stalls as some BPF schedulers (e.g. userspace
  6678		 * scheduling) may not function correctly before all tasks are switched.
  6679		 * Init in bypass mode to guarantee forward progress.
  6680		 */
  6681		scx_bypass(sch, true);
  6682	
  6683		for (i = SCX_OPI_NORMAL_BEGIN; i < SCX_OPI_NORMAL_END; i++)
  6684			if (((void (**)(void))ops)[i])
  6685				set_bit(i, sch->has_op);
  6686	
  6687		if (sch->ops.cpu_acquire || sch->ops.cpu_release)
  6688			sch->ops.flags |= SCX_OPS_HAS_CPU_PREEMPT;
  6689	
  6690		/*
  6691		 * Lock out forks, cgroup on/offlining and moves before opening the
  6692		 * floodgate so that they don't wander into the operations prematurely.
  6693		 */
  6694		percpu_down_write(&scx_fork_rwsem);
  6695	
  6696		WARN_ON_ONCE(scx_init_task_enabled);
  6697		scx_init_task_enabled = true;
  6698	
  6699		/*
  6700		 * Enable ops for every task. Fork is excluded by scx_fork_rwsem
  6701		 * preventing new tasks from being added. No need to exclude tasks
  6702		 * leaving as sched_ext_free() can handle both prepped and enabled
  6703		 * tasks. Prep all tasks first and then enable them with preemption
  6704		 * disabled.
  6705		 *
  6706		 * All cgroups should be initialized before scx_init_task() so that the
  6707		 * BPF scheduler can reliably track each task's cgroup membership from
  6708		 * scx_init_task(). Lock out cgroup on/offlining and task migrations
  6709		 * while tasks are being initialized so that scx_cgroup_can_attach()
  6710		 * never sees uninitialized tasks.
  6711		 */
  6712		scx_cgroup_lock();
  6713		set_cgroup_sched(sch_cgroup(sch), sch);
  6714		ret = scx_cgroup_init(sch);
  6715		if (ret)
  6716			goto err_disable_unlock_all;
  6717	
  6718		scx_task_iter_start(&sti, NULL);
  6719		while ((p = scx_task_iter_next_locked(&sti))) {
  6720			/*
  6721			 * @p may already be dead, have lost all its usages counts and
  6722			 * be waiting for RCU grace period before being freed. @p can't
  6723			 * be initialized for SCX in such cases and should be ignored.
  6724			 */
  6725			if (!tryget_task_struct(p))
  6726				continue;
  6727	
  6728			scx_task_iter_unlock(&sti);
  6729	
  6730			ret = scx_init_task(sch, p, false);
  6731			if (ret) {
  6732				put_task_struct(p);
  6733				scx_task_iter_stop(&sti);
  6734				scx_error(sch, "ops.init_task() failed (%d) for %s[%d]",
  6735					  ret, p->comm, p->pid);
  6736				goto err_disable_unlock_all;
  6737			}
  6738	
  6739			scx_set_task_sched(p, sch);
  6740			scx_set_task_state(p, SCX_TASK_READY);
  6741	
  6742			put_task_struct(p);
  6743		}
  6744		scx_task_iter_stop(&sti);
  6745		scx_cgroup_unlock();
  6746		percpu_up_write(&scx_fork_rwsem);
  6747	
  6748		/*
  6749		 * All tasks are READY. It's safe to turn on scx_enabled() and switch
  6750		 * all eligible tasks.
  6751		 */
  6752		WRITE_ONCE(scx_switching_all, !(ops->flags & SCX_OPS_SWITCH_PARTIAL));
  6753		static_branch_enable(&__scx_enabled);
  6754	
  6755		/*
  6756		 * We're fully committed and can't fail. The task READY -> ENABLED
  6757		 * transitions here are synchronized against sched_ext_free() through
  6758		 * scx_tasks_lock.
  6759		 */
  6760		percpu_down_write(&scx_fork_rwsem);
  6761		scx_task_iter_start(&sti, NULL);
  6762		while ((p = scx_task_iter_next_locked(&sti))) {
  6763			unsigned int queue_flags = DEQUEUE_SAVE | DEQUEUE_MOVE;
  6764			const struct sched_class *old_class = p->sched_class;
  6765			const struct sched_class *new_class = scx_setscheduler_class(p);
  6766	
  6767			if (scx_get_task_state(p) != SCX_TASK_READY)
  6768				continue;
  6769	
  6770			if (old_class != new_class)
  6771				queue_flags |= DEQUEUE_CLASS;
  6772	
  6773			scoped_guard (sched_change, p, queue_flags) {
  6774				p->scx.slice = READ_ONCE(sch->slice_dfl);
  6775				p->sched_class = new_class;
  6776			}
  6777		}
  6778		scx_task_iter_stop(&sti);
  6779		percpu_up_write(&scx_fork_rwsem);
  6780	
  6781		scx_bypass(sch, false);
  6782	
  6783		if (!scx_tryset_enable_state(SCX_ENABLED, SCX_ENABLING)) {
  6784			WARN_ON_ONCE(atomic_read(&sch->exit_kind) == SCX_EXIT_NONE);
  6785			goto err_disable;
  6786		}
  6787	
  6788		if (!(ops->flags & SCX_OPS_SWITCH_PARTIAL))
  6789			static_branch_enable(&__scx_switched_all);
  6790	
  6791		pr_info("sched_ext: BPF scheduler \"%s\" enabled%s\n",
  6792			sch->ops.name, scx_switched_all() ? "" : " (partial)");
  6793		kobject_uevent(&sch->kobj, KOBJ_ADD);
  6794		mutex_unlock(&scx_enable_mutex);
  6795	
  6796		atomic_long_inc(&scx_enable_seq);
  6797	
  6798		cmd->ret = 0;
  6799		return;
  6800	
  6801	err_free_ksyncs:
  6802		free_kick_syncs();
  6803	err_unlock:
  6804		mutex_unlock(&scx_enable_mutex);
  6805		cmd->ret = ret;
  6806		return;
  6807	
  6808	err_disable_unlock_all:
  6809		scx_cgroup_unlock();
  6810		percpu_up_write(&scx_fork_rwsem);
  6811		/* we'll soon enter disable path, keep bypass on */
  6812	err_disable:
  6813		mutex_unlock(&scx_enable_mutex);
  6814		/*
  6815		 * Returning an error code here would not pass all the error information
  6816		 * to userspace. Record errno using scx_error() for cases scx_error()
  6817		 * wasn't already invoked and exit indicating success so that the error
  6818		 * is notified through ops.exit() with all the details.
  6819		 *
  6820		 * Flush scx_disable_work to ensure that error is reported before init
  6821		 * completion. sch's base reference will be put by bpf_scx_unreg().
  6822		 */
  6823		scx_error(sch, "scx_root_enable() failed (%d)", ret);
  6824		kthread_flush_work(&sch->disable_work);
  6825		cmd->ret = 0;
  6826	}
  6827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
