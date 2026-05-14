Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E132722083;
	Thu, 14 May 2026 00:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778719675; cv=none; b=lrrsYmxJKnBSN/UdJuZ7D65ffySt+o2R32cd7ZZFDp/qTBx1mo8JEnU+nGOkexGECYY8VclC5ucvsOx8rclG0tkf6ARz9Iz0whaMwfIKhQ8/Jnuk7nWd5WqNcitCLpUGs5teQdrwekImBtpotH7A+pJfjaieochuRckN/8bVnR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778719675; c=relaxed/simple;
	bh=x9RVhSdcBorh/KZqhHpKXyM9kyoZNRtrbRCtVcQSthw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X+vd0BERqlvLmc8tGkueIYjRvVue4WKFXKMjB+YG6B2HpUkj2/8aLIQnIHit3XmqG+zAqiQe/lo+DqgNgUKrfIwVSv90oP3/UIJt9FSaSj5uze/hPMlD1xE6RfY+NtRz8StaBL+Qy3vfu6uMrDajThxDpUw/7eI3DSIJREMYkyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kl8t/VtG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kl8t/VtG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778719674; x=1810255674;
  h=date:from:to:cc:subject:message-id;
  bh=x9RVhSdcBorh/KZqhHpKXyM9kyoZNRtrbRCtVcQSthw=;
  b=Kl8t/VtGYEABwRB1AcV6eEjNlSBD3HZVuCSq1eOxarW5CXweposM80dW
   RkOezrrUVa1ZIDptolgy8z0T5wgDF9TyICvLJ88WLwhsWZ9wEb3VJrk2u
   CKrw6qNNtc8JCOzSllFnj7myGMpXDosh7jQv2NVPTF/MXW+hlJ3C/bRgW
   cualtpGUw5vRD//9RYJBVnWotKaxmsgASCl3c54QQVAK8AZzzG7jlobUc
   FSNoWo1PH3l37p7WHAyCHMGyD55viHUq/0CUsG7hVHtlIPxjqb5R4Trww
   ch4h4+ZfWh8i/+/nFIpcF0tpz1tKeSpm8TXcuJSDmE9/WU92QQZxUMIdG
   Q==;
X-CSE-ConnectionGUID: DX7JtM5aQpWVgjuGBTYGzA==
X-CSE-MsgGUID: tM/JadNQTBKK9Q4fR53nuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97228089"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="97228089"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 17:47:53 -0700
X-CSE-ConnectionGUID: zi5lD1StTSu/AskuC0Ub4g==
X-CSE-MsgGUID: HywraJWvRqSz3nCwzd6KoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="242571708"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 13 May 2026 17:47:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNKEu-000000008hp-3jo6;
	Thu, 14 May 2026 00:47:48 +0000
Date: Thu, 14 May 2026 02:46:49 +0200
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/cgroup/cpuset.c:3032:9: error: use of undeclared
 label 'out_unlock_reset'
Message-ID: <202605140212.cspkpyDl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/cgroup-cpuset-Fix-deadline-bandwidth-leak-in-cpuset_can_attach/20260513-233840
head:   6b7a0366d38d3efa80d721b02d588f3f519aa8b3
commit: 6c37dfa9b4198303c230c525e0796e883dde1624 cgroup/cpuset: Fix deadline bandwidth leak in cpuset_can_attach()
date:   9 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260514/202605140212.cspkpyDl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140212.cspkpyDl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140212.cspkpyDl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:3032:9: error: use of undeclared label 'out_unlock_reset'
    3032 |                         goto out_unlock_reset;
         |                              ^
   kernel/cgroup/cpuset.c:3604:1: warning: unused label 'out_unlock_reset' [-Wunused-label]
    3604 | out_unlock_reset:
         | ^~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/out_unlock_reset +3032 kernel/cgroup/cpuset.c

  2988	
  2989	/* Called by cgroups to determine if a cpuset is usable; cpuset_mutex held */
  2990	static int cpuset_can_attach(struct cgroup_taskset *tset)
  2991	{
  2992		struct cgroup_subsys_state *css;
  2993		struct cpuset *cs, *oldcs;
  2994		struct task_struct *task;
  2995		bool setsched_check;
  2996		int cpu, ret;
  2997	
  2998		/* used later by cpuset_attach() */
  2999		cpuset_attach_old_cs = task_cs(cgroup_taskset_first(tset, &css));
  3000		oldcs = cpuset_attach_old_cs;
  3001		cs = css_cs(css);
  3002	
  3003		mutex_lock(&cpuset_mutex);
  3004	
  3005		/* Check to see if task is allowed in the cpuset */
  3006		ret = cpuset_can_attach_check(cs);
  3007		if (ret)
  3008			goto out_unlock;
  3009	
  3010		/*
  3011		 * Skip rights over task setsched check in v2 when nothing changes,
  3012		 * migration permission derives from hierarchy ownership in
  3013		 * cgroup_procs_write_permission()).
  3014		 */
  3015		setsched_check = !cpuset_v2() ||
  3016			!cpumask_equal(cs->effective_cpus, oldcs->effective_cpus) ||
  3017			!nodes_equal(cs->effective_mems, oldcs->effective_mems);
  3018	
  3019		/*
  3020		 * A v1 cpuset with tasks will have no CPU left only when CPU hotplug
  3021		 * brings the last online CPU offline as users are not allowed to empty
  3022		 * cpuset.cpus when there are active tasks inside. When that happens,
  3023		 * we should allow tasks to migrate out without security check to make
  3024		 * sure they will be able to run after migration.
  3025		 */
  3026		if (!is_in_v2_mode() && cpumask_empty(oldcs->effective_cpus))
  3027			setsched_check = false;
  3028	
  3029		cgroup_taskset_for_each(task, css, tset) {
  3030			ret = task_can_attach(task);
  3031			if (ret)
> 3032				goto out_unlock_reset;
  3033	
  3034			if (setsched_check) {
  3035				ret = security_task_setscheduler(task);
  3036				if (ret)
  3037					goto out_unlock_reset;
  3038			}
  3039	
  3040			if (dl_task(task)) {
  3041				/*
  3042				 * Count all migrating DL tasks for cpuset task accounting.
  3043				 * Only tasks that need a root-domain bandwidth move
  3044				 * contribute to sum_migrate_dl_bw.
  3045				 */
  3046				cs->nr_migrate_dl_tasks++;
  3047				if (dl_task_needs_bw_move(task, cs->effective_cpus))
  3048					cs->sum_migrate_dl_bw += task->dl.dl_bw;
  3049			}
  3050		}
  3051	
  3052		if (!cs->sum_migrate_dl_bw)
  3053			goto out_success;
  3054	
  3055		cpu = cpumask_any_and(cpu_active_mask, cs->effective_cpus);
  3056		if (unlikely(cpu >= nr_cpu_ids)) {
  3057			ret = -EINVAL;
  3058			goto out_unlock;
  3059		}
  3060	
  3061		ret = dl_bw_alloc(cpu, cs->sum_migrate_dl_bw);
  3062		if (ret)
  3063			goto out_unlock;
  3064	
  3065		cs->dl_bw_cpu = cpu;
  3066	
  3067	out_success:
  3068		/*
  3069		 * Mark attach is in progress.  This makes validate_change() fail
  3070		 * changes which zero cpus/mems_allowed.
  3071		 */
  3072		cs->attach_in_progress++;
  3073	
  3074	out_unlock:
  3075		if (ret)
  3076			reset_migrate_dl_data(cs);
  3077		mutex_unlock(&cpuset_mutex);
  3078		return ret;
  3079	}
  3080	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
