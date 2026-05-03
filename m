Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656051DED5B;
	Sun,  3 May 2026 04:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777780925; cv=none; b=XAeJAAEJmGzk0xdATr5GNeolAIKsN1WclsaJPZVRnvdpubYdvPMDw7iEELStKE4verMeerBLJObn3SaKU+6NH3tGaypw7HlTET0toZY1mli/9fQn5TFS6OKxX2ePeZSIgt/wzkN7h5+LseSub+h61cCzhwKKbQPymcdxbFhWMtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777780925; c=relaxed/simple;
	bh=V8BFo/STHphKDHAiodU1HAXwdGZ2n3XWigYoUumSYYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iMQkqwZtoLumN5Y0XsLwVmRiVNdh56GUtogpJGZ7ECsnwpP2seVAUfiNeMO4DwmMgs0dlJ+goGyxromsuaAgNSiZS44O9b5ccegWJaj3XF2/MI7tzeQenJFqKc8+ylTG0hK0fclQ7lsHCy2bNk1urzWCLN/FuM5+sv2lQVdgAm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMzBwT1s; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMzBwT1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777780923; x=1809316923;
  h=date:from:to:cc:subject:message-id;
  bh=V8BFo/STHphKDHAiodU1HAXwdGZ2n3XWigYoUumSYYE=;
  b=KMzBwT1s5fQ29BA0A8dNAHsBAnrJmBGNzy4Manalsa9irxQ+gOTsX0Rb
   mg+HTeOkVd3NeHDWlnXz/76oYivRjIvJ+Qflh0k8Y/9MP+OK0XW9qftrH
   cjLHcJS9HiKlmS4xIkeG6OsJc8z8B2gPouLno5Jlh47lKnc33hGuXcq6z
   +MkOxNBLJJcrPVF8qb6/JVlsk7Vpna8FepVKGi330nwAFYZGysN83zgDC
   8X2DwUBqU4ZcFlDUXHXeqyemQmorUUjF2mERxC/Yra38Kww+2TicFKaxW
   LG56kCvMxWDOPIgmXxv6YpEpco+GlAgpXvBfGLfjNfYtGM52ykLys1RSj
   w==;
X-CSE-ConnectionGUID: DlyoNTKrQkiQbA0DQAk5CQ==
X-CSE-MsgGUID: A8Ktyk28T+S9P4rMd5iZsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82535878"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="82535878"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 21:02:02 -0700
X-CSE-ConnectionGUID: CWWNLjB5RwWiXzz5dfi54Q==
X-CSE-MsgGUID: mcG6j/+oT3KOs9UnpqjH7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="230845359"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2026 21:02:01 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJO1m-0000000027p-44Bt;
	Sun, 03 May 2026 04:01:58 +0000
Date: Sun, 03 May 2026 12:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [harry:kvfree-rcu-improvements-rfc-v2r1-wip 4/9]
 mm/slab_common.c:1352:16: error: call to undeclared function 'IRQ_WORK_INIT';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202605031137.1PajP3OI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kvfree-rcu-improvements-rfc-v2r1-wip
head:   1e4fd024c798fbeff0b5a3c5f55cdcf710367c59
commit: 56d22ff0926080094a3df57e64b2aa87c9e1433d [4/9] mm/slab: introduce kfree_rcu_nolock()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031137.1PajP3OI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031137.1PajP3OI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031137.1PajP3OI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/slab_common.c:1352:16: error: call to undeclared function 'IRQ_WORK_INIT'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1352 |         .defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
         |                       ^
>> mm/slab_common.c:1354:3: error: call to undeclared function 'IRQ_WORK_INIT_LAZY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1354 |                 IRQ_WORK_INIT_LAZY(sched_delayed_monitor_irq_work_fn),
         |                 ^
>> mm/slab_common.c:1352:16: error: incompatible integer to pointer conversion initializing 'struct llist_node *' with an expression of type 'int' [-Wint-conversion]
    1352 |         .defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1352:16: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1352 |         .defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       {                                         }
>> mm/slab_common.c:1352:16: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1352 |         .defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       {                                         }
>> mm/slab_common.c:1352:16: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1352 |         .defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       {                                         }
   mm/slab_common.c:1354:3: error: incompatible integer to pointer conversion initializing 'struct llist_node *' with an expression of type 'int' [-Wint-conversion]
    1354 |                 IRQ_WORK_INIT_LAZY(sched_delayed_monitor_irq_work_fn),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1354:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1354 |                 IRQ_WORK_INIT_LAZY(sched_delayed_monitor_irq_work_fn),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {                                                    }
   mm/slab_common.c:1354:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1354 |                 IRQ_WORK_INIT_LAZY(sched_delayed_monitor_irq_work_fn),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {                                                    }
   mm/slab_common.c:1354:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1354 |                 IRQ_WORK_INIT_LAZY(sched_delayed_monitor_irq_work_fn),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {                                                    }
   mm/slab_common.c:1356:3: error: incompatible integer to pointer conversion initializing 'struct llist_node *' with an expression of type 'int' [-Wint-conversion]
    1356 |                 IRQ_WORK_INIT_LAZY(run_page_cache_worker_irq_work_fn),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1356:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1356 |                 IRQ_WORK_INIT_LAZY(run_page_cache_worker_irq_work_fn),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {                                                    }
   mm/slab_common.c:1356:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1356 |                 IRQ_WORK_INIT_LAZY(run_page_cache_worker_irq_work_fn),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {                                                    }
   mm/slab_common.c:1356:3: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1356 |                 IRQ_WORK_INIT_LAZY(run_page_cache_worker_irq_work_fn),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 {                                                    }
>> mm/slab_common.c:1352:16: error: initializer element is not a compile-time constant
    1352 |         .defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1378:3: error: call to undeclared function 'irq_work_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1378 |                 irq_work_sync(&per_cpu_ptr(&krc, cpu)->defer_free);
         |                 ^
>> mm/slab_common.c:1785:5: error: call to undeclared function 'irq_work_queue'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1785 |                                 irq_work_queue(&krcp->sched_delayed_monitor);
         |                                 ^
   mm/slab_common.c:1793:3: error: call to undeclared function 'irq_work_queue'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1793 |                 irq_work_queue(&krcp->sched_delayed_monitor);
         |                 ^
   mm/slab_common.c:2066:4: error: call to undeclared function 'irq_work_queue'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2066 |                         irq_work_queue(&krcp->run_page_cache_worker);
         |                         ^
   mm/slab_common.c:2185:3: error: call to undeclared function 'irq_work_queue'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2185 |                 irq_work_queue(&krcp->defer_free);
         |                 ^
   9 warnings and 11 errors generated.


vim +/IRQ_WORK_INIT +1352 mm/slab_common.c

  1348	
  1349	static DEFINE_PER_CPU(struct kfree_rcu_cpu, krc) = {
  1350		.lock = __RAW_SPIN_LOCK_UNLOCKED(krc.lock),
  1351		.defer_head = LLIST_HEAD_INIT(defer_head),
> 1352		.defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
  1353		.sched_delayed_monitor =
> 1354			IRQ_WORK_INIT_LAZY(sched_delayed_monitor_irq_work_fn),
  1355		.run_page_cache_worker =
  1356			IRQ_WORK_INIT_LAZY(run_page_cache_worker_irq_work_fn),
  1357	};
  1358	#else
  1359	struct kfree_rcu_cpu {
  1360		struct llist_head defer_head;
  1361		struct irq_work defer_free;
  1362	};
  1363	
  1364	static void defer_kfree_rcu_irq_work_fn(struct irq_work *work);
  1365	
  1366	static DEFINE_PER_CPU(struct kfree_rcu_cpu, krc) = {
  1367		.defer_head = LLIST_HEAD_INIT(defer_head),
  1368		.defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
  1369	};
  1370	#endif
  1371	
  1372	/* Wait for deferred work from kfree_rcu_nolock() */
  1373	void defer_kvfree_rcu_barrier(void)
  1374	{
  1375		int cpu;
  1376	
  1377		for_each_possible_cpu(cpu)
> 1378			irq_work_sync(&per_cpu_ptr(&krc, cpu)->defer_free);
  1379	}
  1380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
