Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA51E4B9;
	Wed, 29 Nov 2023 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiRV1CF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701265322; x=1732801322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61ZB83b2A7RpRcEVNxAByX7887YRtGAbLaPvEFN+FJQ=;
  b=RiRV1CF896lbTyAm/wMg/5/5uuW3ewww/UHmKqKHSR9AOXtPqGsyMWpm
   JfrDE4+b/icRFeW/OzELl8hDtkbK6ViorkPS6X67Z5vSSZp1SeLeVkLTJ
   L8g1d0dngwayg8Ir+ae/RWbBhk6Ak7kKL1YDF4G2ksd0ytLXw3LEwDPyt
   WqHXGAy3krJQo6iwrYv+FIFASihx3zHZCHm0FIneIAxx+hi1MGUviiI6d
   Xcv4hPRmI1roEIUhcc05XnCWSbbUbOyEOFQlilckHW7hmeLjIgz0jOpGs
   B72T6Wl8uzKQkBlCJ17S98XNFogsoqzwCdjpT2ohsZ0f6eiMuaEdN7/SR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11867339"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="11867339"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892454968"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="892454968"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2023 05:41:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Kok-0000I0-1Z;
	Wed, 29 Nov 2023 13:41:34 +0000
Date: Wed, 29 Nov 2023 21:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 9/11]
 kernel/sched/core.c:1410:1: error: type specifier missing, defaults to
 'int'; ISO C99 and later do not support implicit int
Message-ID: <202311292106.24uQ9OWs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   eb0c51750b3bf5ac41d3f628fd05e22a5426a759
commit: 1184db07bd011cf19005485e643f767d12c33184 [9/11] sched/uclamp: Remove rq max aggregation
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231129/202311292106.24uQ9OWs-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311292106.24uQ9OWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311292106.24uQ9OWs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:1410:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
   ^
   int
>> kernel/sched/core.c:1413:16: error: passing 'struct uclamp_se' to parameter of incompatible type 'struct uclamp_se *'; take the address with &
           uclamp_se_set(p->uclamp_req[clamp_id], value, user_defined);
                         ^~~~~~~~~~~~~~~~~~~~~~~
                         &
   kernel/sched/core.c:1402:52: note: passing argument to parameter 'uc_se' here
   static inline void uclamp_se_set(struct uclamp_se *uc_se,
                                                      ^
>> kernel/sched/core.c:1414:37: error: call to undeclared function 'uclamp_eff_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
                                              ^
   kernel/sched/core.c:1414:37: note: did you mean 'uclamp_se_set'?
   kernel/sched/core.c:1402:20: note: 'uclamp_se_set' declared here
   static inline void uclamp_se_set(struct uclamp_se *uc_se,
                      ^
   kernel/sched/core.c:1414:16: error: passing 'struct uclamp_se' to parameter of incompatible type 'struct uclamp_se *'; take the address with &
           uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
                         ^~~~~~~~~~~~~~~~~~~
                         &
   kernel/sched/core.c:1402:52: note: passing argument to parameter 'uc_se' here
   static inline void uclamp_se_set(struct uclamp_se *uc_se,
                                                      ^
   kernel/sched/core.c:1410:1: warning: no previous prototype for function 'update_uclamp_req' [-Wmissing-prototypes]
   update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
   ^
   kernel/sched/core.c:1410:18: note: declare 'static' if the function is not intended to be used outside of this translation unit
   update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
                    ^
                    static 
>> kernel/sched/core.c:1480:1: error: static declaration of 'uclamp_eff_get' follows non-static declaration
   uclamp_eff_get(struct task_struct *p, enum uclamp_id clamp_id)
   ^
   kernel/sched/core.c:1414:37: note: previous implicit declaration is here
           uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
                                              ^
   1 warning and 5 errors generated.


vim +/int +1410 kernel/sched/core.c

  1408	
  1409	/* Update p->uclamp_req and effective p->uclamp in one go */
> 1410	update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
  1411			  unsigned int value, bool user_defined)
  1412	{
> 1413		uclamp_se_set(p->uclamp_req[clamp_id], value, user_defined);
> 1414		uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
  1415	}
  1416	
  1417	static void __uclamp_update_util_min_rt_default(struct task_struct *p)
  1418	{
  1419		unsigned int default_util_min;
  1420		struct uclamp_se *uc_se;
  1421	
  1422		lockdep_assert_held(&p->pi_lock);
  1423	
  1424		uc_se = &p->uclamp_req[UCLAMP_MIN];
  1425	
  1426		/* Only sync if user didn't override the default */
  1427		if (uc_se->user_defined)
  1428			return;
  1429	
  1430		default_util_min = sysctl_sched_uclamp_util_min_rt_default;
  1431		uclamp_se_set(uc_se, default_util_min, false);
  1432	}
  1433	
  1434	static void uclamp_update_util_min_rt_default(struct task_struct *p)
  1435	{
  1436		if (!rt_task(p))
  1437			return;
  1438	
  1439		/* Protect updates to p->uclamp_* */
  1440		guard(task_rq_lock)(p);
  1441		__uclamp_update_util_min_rt_default(p);
  1442	}
  1443	
  1444	static inline struct uclamp_se
  1445	uclamp_tg_restrict(struct task_struct *p, enum uclamp_id clamp_id)
  1446	{
  1447		/* Copy by value as we could modify it */
  1448		struct uclamp_se uc_req = p->uclamp_req[clamp_id];
  1449	#ifdef CONFIG_UCLAMP_TASK_GROUP
  1450		unsigned int tg_min, tg_max, value;
  1451	
  1452		/*
  1453		 * Tasks in autogroups or root task group will be
  1454		 * restricted by system defaults.
  1455		 */
  1456		if (task_group_is_autogroup(task_group(p)))
  1457			return uc_req;
  1458		if (task_group(p) == &root_task_group)
  1459			return uc_req;
  1460	
  1461		tg_min = task_group(p)->uclamp[UCLAMP_MIN].value;
  1462		tg_max = task_group(p)->uclamp[UCLAMP_MAX].value;
  1463		value = uc_req.value;
  1464		value = clamp(value, tg_min, tg_max);
  1465		uclamp_se_set(&uc_req, value, false);
  1466	#endif
  1467	
  1468		return uc_req;
  1469	}
  1470	
  1471	/*
  1472	 * The effective clamp bucket index of a task depends on, by increasing
  1473	 * priority:
  1474	 * - the task specific clamp value, when explicitly requested from userspace
  1475	 * - the task group effective clamp value, for tasks not either in the root
  1476	 *   group or in an autogroup
  1477	 * - the system default clamp value, defined by the sysadmin
  1478	 */
  1479	static inline unsigned long
> 1480	uclamp_eff_get(struct task_struct *p, enum uclamp_id clamp_id)
  1481	{
  1482		struct uclamp_se uc_req = uclamp_tg_restrict(p, clamp_id);
  1483		struct uclamp_se uc_max = uclamp_default[clamp_id];
  1484	
  1485		/* System default restrictions always apply */
  1486		if (unlikely(uc_req.value > uc_max.value))
  1487			return uc_max.value;
  1488	
  1489		return uc_req.value;
  1490	}
  1491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
