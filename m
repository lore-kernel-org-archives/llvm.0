Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0548518C31;
	Fri, 10 Jan 2025 01:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736474166; cv=none; b=polaB+xTm85w/gAgA1ekOQb8aACmmz4W+q3H2WUvzpzKP7rOkw1ONLyV9Qnm/WSEv9jTtNcF28sz036FeH+EJBCiQc3XCkfemW39f9cMqP5f7xq2oMdiI+X6U9GytpeaHQRjoQ0FbX6OKDfZYJbM4T9E64XkYNoE6kc1cyCF3eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736474166; c=relaxed/simple;
	bh=/vhXZxXTzvPd+Wg0OLOvoeaTcUTggp5+NH1URcQG+xU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsb+A3PC3zpHGtYcR57yIMlr4jF48w4N3oxfhFBu6GCH1gC48RJikB2WQhEojwQ+oyoDb147qPk2aDhD+K2jdF3Pw/A6o/FMZyz1r/IuF5PXBcPPBVw8MEFQdj90+8II2HllNxw0T+3oAWOG2NwVIK/W3rYKIzDu0BJ3nRjwxko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIICz/0U; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIICz/0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736474164; x=1768010164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/vhXZxXTzvPd+Wg0OLOvoeaTcUTggp5+NH1URcQG+xU=;
  b=MIICz/0UCSHkKYU1EcEFuxIb7W1SEN+/Y4TQVtw81vGV6iaHvej372vx
   edlLJR0yERZGb5wsH/vR3IxgpT4GNoo9MWwMVujZET9l8DoTipQT/D+CB
   XKp78VXCVAgFqSnSHFjrlIwSC/g5eZFDA3mI99n/FhDU/KyMvqjnywnrf
   MNgCZnfxcwwY3fJ05WvWFZvuMCZvMQM0otXlqBGpngqhXCGwus7ouhVFX
   R9ZP5NFbpEsjl2f7S4jrGcwYjCMrfFEmdp1EGrPGvzKxen2SE4Zpmc7Ha
   wIQB3FAChCweUIHpB8gs8cgR2goV2tO00TDtvujFdhB8X+3PkIoJHmmWp
   A==;
X-CSE-ConnectionGUID: ltognxQSRb2VekcqEKtG7A==
X-CSE-MsgGUID: m0MVqyqkTP2M7F5jx/AZTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="62131481"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="62131481"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 17:56:03 -0800
X-CSE-ConnectionGUID: QMd4Ov4gRQKmgyoN7MHtLQ==
X-CSE-MsgGUID: I6S3i7unR5iZ3auqRmGeZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108691728"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jan 2025 17:56:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW4Fj-000IPP-1e;
	Fri, 10 Jan 2025 01:55:59 +0000
Date: Fri, 10 Jan 2025 09:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:sframe/josh 1/1] kernel/trace/trace.c:9729:2: error:
 call to undeclared function 'unwind_user_register'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202501100952.PrN7aQmE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git sframe/josh
head:   098b2bb73e6a68bb68bcae4bd2df7880860634aa
commit: 098b2bb73e6a68bb68bcae4bd2df7880860634aa [1/1] tracing: POC on top of sframe
config: um-randconfig-001-20250110 (https://download.01.org/0day-ci/archive/20250110/202501100952.PrN7aQmE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100952.PrN7aQmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100952.PrN7aQmE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/trace.c:15:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/trace/trace.c:9729:2: error: call to undeclared function 'unwind_user_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    9729 |         unwind_user_register(&tr->unwinder, trace_user_unwind_callback);
         |         ^
>> kernel/trace/trace.c:9729:38: error: use of undeclared identifier 'trace_user_unwind_callback'
    9729 |         unwind_user_register(&tr->unwinder, trace_user_unwind_callback);
         |                                             ^
>> kernel/trace/trace.c:9850:2: error: call to undeclared function 'unwind_user_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    9850 |         unwind_user_unregister(&tr->unwinder);
         |         ^
   kernel/trace/trace.c:9850:2: note: did you mean 'unwind_user_next'?
   include/linux/unwind_user.h:8:5: note: 'unwind_user_next' declared here
       8 | int unwind_user_next(struct unwind_user_state *state);
         |     ^
   kernel/trace/trace.c:10889:2: error: call to undeclared function 'unwind_user_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    10889 |         unwind_user_register(&global_trace.unwinder, trace_user_unwind_callback);
          |         ^
   kernel/trace/trace.c:10889:47: error: use of undeclared identifier 'trace_user_unwind_callback'
    10889 |         unwind_user_register(&global_trace.unwinder, trace_user_unwind_callback);
          |                                                      ^
   1 warning and 5 errors generated.


vim +/unwind_user_register +9729 kernel/trace/trace.c

  9656	
  9657	static struct trace_array *
  9658	trace_array_create_systems(const char *name, const char *systems,
  9659				   unsigned long range_addr_start,
  9660				   unsigned long range_addr_size)
  9661	{
  9662		struct trace_array *tr;
  9663		int ret;
  9664	
  9665		ret = -ENOMEM;
  9666		tr = kzalloc(sizeof(*tr), GFP_KERNEL);
  9667		if (!tr)
  9668			return ERR_PTR(ret);
  9669	
  9670		tr->name = kstrdup(name, GFP_KERNEL);
  9671		if (!tr->name)
  9672			goto out_free_tr;
  9673	
  9674		if (!alloc_cpumask_var(&tr->tracing_cpumask, GFP_KERNEL))
  9675			goto out_free_tr;
  9676	
  9677		if (!zalloc_cpumask_var(&tr->pipe_cpumask, GFP_KERNEL))
  9678			goto out_free_tr;
  9679	
  9680		if (systems) {
  9681			tr->system_names = kstrdup_const(systems, GFP_KERNEL);
  9682			if (!tr->system_names)
  9683				goto out_free_tr;
  9684		}
  9685	
  9686		/* Only for boot up memory mapped ring buffers */
  9687		tr->range_addr_start = range_addr_start;
  9688		tr->range_addr_size = range_addr_size;
  9689	
  9690		tr->trace_flags = global_trace.trace_flags & ~ZEROED_TRACE_FLAGS;
  9691	
  9692		cpumask_copy(tr->tracing_cpumask, cpu_all_mask);
  9693	
  9694		raw_spin_lock_init(&tr->start_lock);
  9695	
  9696		tr->max_lock = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
  9697	#ifdef CONFIG_TRACER_MAX_TRACE
  9698		spin_lock_init(&tr->snapshot_trigger_lock);
  9699	#endif
  9700		tr->current_trace = &nop_trace;
  9701	
  9702		INIT_LIST_HEAD(&tr->systems);
  9703		INIT_LIST_HEAD(&tr->events);
  9704		INIT_LIST_HEAD(&tr->hist_vars);
  9705		INIT_LIST_HEAD(&tr->err_log);
  9706	
  9707		if (allocate_trace_buffers(tr, trace_buf_size) < 0)
  9708			goto out_free_tr;
  9709	
  9710		/* The ring buffer is defaultly expanded */
  9711		trace_set_ring_buffer_expanded(tr);
  9712	
  9713		if (ftrace_allocate_ftrace_ops(tr) < 0)
  9714			goto out_free_tr;
  9715	
  9716		ftrace_init_trace_array(tr);
  9717	
  9718		init_trace_flags_index(tr);
  9719	
  9720		if (trace_instance_dir) {
  9721			ret = trace_array_create_dir(tr);
  9722			if (ret)
  9723				goto out_free_tr;
  9724		} else
  9725			__trace_early_add_events(tr);
  9726	
  9727		list_add(&tr->list, &ftrace_trace_arrays);
  9728	
> 9729		unwind_user_register(&tr->unwinder, trace_user_unwind_callback);
  9730	
  9731		tr->ref++;
  9732	
  9733		return tr;
  9734	
  9735	 out_free_tr:
  9736		ftrace_free_ftrace_ops(tr);
  9737		free_trace_buffers(tr);
  9738		free_cpumask_var(tr->pipe_cpumask);
  9739		free_cpumask_var(tr->tracing_cpumask);
  9740		kfree_const(tr->system_names);
  9741		kfree(tr->name);
  9742		kfree(tr);
  9743	
  9744		return ERR_PTR(ret);
  9745	}
  9746	
  9747	static struct trace_array *trace_array_create(const char *name)
  9748	{
  9749		return trace_array_create_systems(name, NULL, 0, 0);
  9750	}
  9751	
  9752	static int instance_mkdir(const char *name)
  9753	{
  9754		struct trace_array *tr;
  9755		int ret;
  9756	
  9757		mutex_lock(&event_mutex);
  9758		mutex_lock(&trace_types_lock);
  9759	
  9760		ret = -EEXIST;
  9761		if (trace_array_find(name))
  9762			goto out_unlock;
  9763	
  9764		tr = trace_array_create(name);
  9765	
  9766		ret = PTR_ERR_OR_ZERO(tr);
  9767	
  9768	out_unlock:
  9769		mutex_unlock(&trace_types_lock);
  9770		mutex_unlock(&event_mutex);
  9771		return ret;
  9772	}
  9773	
  9774	static u64 map_pages(u64 start, u64 size)
  9775	{
  9776		struct page **pages;
  9777		phys_addr_t page_start;
  9778		unsigned int page_count;
  9779		unsigned int i;
  9780		void *vaddr;
  9781	
  9782		page_count = DIV_ROUND_UP(size, PAGE_SIZE);
  9783	
  9784		page_start = start;
  9785		pages = kmalloc_array(page_count, sizeof(struct page *), GFP_KERNEL);
  9786		if (!pages)
  9787			return 0;
  9788	
  9789		for (i = 0; i < page_count; i++) {
  9790			phys_addr_t addr = page_start + i * PAGE_SIZE;
  9791			pages[i] = pfn_to_page(addr >> PAGE_SHIFT);
  9792		}
  9793		vaddr = vmap(pages, page_count, VM_MAP, PAGE_KERNEL);
  9794		kfree(pages);
  9795	
  9796		return (u64)(unsigned long)vaddr;
  9797	}
  9798	
  9799	/**
  9800	 * trace_array_get_by_name - Create/Lookup a trace array, given its name.
  9801	 * @name: The name of the trace array to be looked up/created.
  9802	 * @systems: A list of systems to create event directories for (NULL for all)
  9803	 *
  9804	 * Returns pointer to trace array with given name.
  9805	 * NULL, if it cannot be created.
  9806	 *
  9807	 * NOTE: This function increments the reference counter associated with the
  9808	 * trace array returned. This makes sure it cannot be freed while in use.
  9809	 * Use trace_array_put() once the trace array is no longer needed.
  9810	 * If the trace_array is to be freed, trace_array_destroy() needs to
  9811	 * be called after the trace_array_put(), or simply let user space delete
  9812	 * it from the tracefs instances directory. But until the
  9813	 * trace_array_put() is called, user space can not delete it.
  9814	 *
  9815	 */
  9816	struct trace_array *trace_array_get_by_name(const char *name, const char *systems)
  9817	{
  9818		struct trace_array *tr;
  9819	
  9820		mutex_lock(&event_mutex);
  9821		mutex_lock(&trace_types_lock);
  9822	
  9823		list_for_each_entry(tr, &ftrace_trace_arrays, list) {
  9824			if (tr->name && strcmp(tr->name, name) == 0)
  9825				goto out_unlock;
  9826		}
  9827	
  9828		tr = trace_array_create_systems(name, systems, 0, 0);
  9829	
  9830		if (IS_ERR(tr))
  9831			tr = NULL;
  9832	out_unlock:
  9833		if (tr)
  9834			tr->ref++;
  9835	
  9836		mutex_unlock(&trace_types_lock);
  9837		mutex_unlock(&event_mutex);
  9838		return tr;
  9839	}
  9840	EXPORT_SYMBOL_GPL(trace_array_get_by_name);
  9841	
  9842	static int __remove_instance(struct trace_array *tr)
  9843	{
  9844		int i;
  9845	
  9846		/* Reference counter for a newly created trace array = 1. */
  9847		if (tr->ref > 1 || (tr->current_trace && tr->trace_ref))
  9848			return -EBUSY;
  9849	
> 9850		unwind_user_unregister(&tr->unwinder);
  9851	
  9852		list_del(&tr->list);
  9853	
  9854		/* Disable all the flags that were enabled coming in */
  9855		for (i = 0; i < TRACE_FLAGS_MAX_SIZE; i++) {
  9856			if ((1 << i) & ZEROED_TRACE_FLAGS)
  9857				set_tracer_flag(tr, 1 << i, 0);
  9858		}
  9859	
  9860		if (printk_trace == tr)
  9861			update_printk_trace(&global_trace);
  9862	
  9863		tracing_set_nop(tr);
  9864		clear_ftrace_function_probes(tr);
  9865		event_trace_del_tracer(tr);
  9866		ftrace_clear_pids(tr);
  9867		ftrace_destroy_function_files(tr);
  9868		tracefs_remove(tr->dir);
  9869		free_percpu(tr->last_func_repeats);
  9870		free_trace_buffers(tr);
  9871		clear_tracing_err_log(tr);
  9872	
  9873		for (i = 0; i < tr->nr_topts; i++) {
  9874			kfree(tr->topts[i].topts);
  9875		}
  9876		kfree(tr->topts);
  9877	
  9878		free_cpumask_var(tr->pipe_cpumask);
  9879		free_cpumask_var(tr->tracing_cpumask);
  9880		kfree_const(tr->system_names);
  9881		kfree(tr->name);
  9882		kfree(tr);
  9883	
  9884		return 0;
  9885	}
  9886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
