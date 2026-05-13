Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5D339A06F;
	Wed, 13 May 2026 23:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715352; cv=none; b=OpC+JTFS1mujkPO8wFYS/9y7kjGJ9PuThBnKokf0KbGtA2HUEtm1TAwfVel6SllNs+Qb4+sTsDZQQIfqNt/w9jP2KHJpbX2qsgvBwp5Q1Z/j2moZHnf/TOsIyXZjwdLTr1r7lGbya9RzAMPPOhmsxnEr6kQL8DsNOI260YSh3hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715352; c=relaxed/simple;
	bh=6atrTD/UD4LJOhqOtZZV+u1Ar8uPxAS1vm238vBxB5Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FzAR4GmXB3/n3TgHvPOfQEW+mLk9scRu7N2NP1d7B8RExfn4AnYorHsZlfzyGiaxoEBUJdwZkfEtU9jojIGodZPi1cxDNn6Ga1Sj5cblS13LhBpDXYGVDxSl1jbhDNkQCbVGiLXfy/XAYxExcMUw5/BeQjKp883CsW3V50NWn/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJnjgOtO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJnjgOtO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778715351; x=1810251351;
  h=date:from:to:cc:subject:message-id;
  bh=6atrTD/UD4LJOhqOtZZV+u1Ar8uPxAS1vm238vBxB5Y=;
  b=FJnjgOtO3Ez/tmhipzaZ+nc8/xniD/2Sbo6s6aL0RqagI3VolRk8Ov2y
   Ri8APjv3xT1khKQcAaecH+MfkV0Oyt7AJmDw46WQmnBekGF8BIrOPtODM
   rJz8nI1xKVCutFQfc6gk6jDSB3EkcL459xR8uA5PupSnimBFvFNi7+52T
   V8XKICSvKMPu9hiqOCuB2HRy3PhyeUB+0pktdFnGeYw6r/2CWe2wW1Ach
   kF5v0yvHqbec42o7IqoWk4N3d+XQaQ3QB1YhRSmQBnGg1CWUgigC0cIRJ
   DcIcaPVtFWWie4v7YTo6PV2j+6B0zWkVXjU/QKikwsTh1WoTGDB6boU77
   A==;
X-CSE-ConnectionGUID: Cd200HFNTyWuImqzQR+riA==
X-CSE-MsgGUID: 1C/IcdPlS+mLg03yv7aCiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78679632"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="78679632"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 16:35:50 -0700
X-CSE-ConnectionGUID: gdbUZdDvSXmHJAJgmmWy4Q==
X-CSE-MsgGUID: tx3+M8spRDOVJrhKP5oLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238111162"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2026 16:35:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNJ7C-000000008fR-2RuM;
	Wed, 13 May 2026 23:35:46 +0000
Date: Thu, 14 May 2026 01:34:57 +0200
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/cgroup/cpuset.c:3604:1: warning: unused label
 'out_unlock_reset'
Message-ID: <202605140153.PDd3Fv0U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/cgroup-cpuset-Fix-deadline-bandwidth-leak-in-cpuset_can_attach/20260513-233840
head:   6b7a0366d38d3efa80d721b02d588f3f519aa8b3
commit: 6c37dfa9b4198303c230c525e0796e883dde1624 cgroup/cpuset: Fix deadline bandwidth leak in cpuset_can_attach()
date:   8 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260514/202605140153.PDd3Fv0U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140153.PDd3Fv0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140153.PDd3Fv0U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/cgroup/cpuset.c:3032:9: error: use of undeclared label 'out_unlock_reset'
    3032 |                         goto out_unlock_reset;
         |                              ^
>> kernel/cgroup/cpuset.c:3604:1: warning: unused label 'out_unlock_reset' [-Wunused-label]
    3604 | out_unlock_reset:
         | ^~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/out_unlock_reset +3604 kernel/cgroup/cpuset.c

  3563	
  3564	/*
  3565	 * In case the child is cloned into a cpuset different from its parent,
  3566	 * additional checks are done to see if the move is allowed.
  3567	 */
  3568	static int cpuset_can_fork(struct task_struct *task, struct css_set *cset)
  3569	{
  3570		struct cpuset *cs = css_cs(cset->subsys[cpuset_cgrp_id]);
  3571		bool same_cs;
  3572		int ret;
  3573	
  3574		rcu_read_lock();
  3575		same_cs = (cs == task_cs(current));
  3576		rcu_read_unlock();
  3577	
  3578		if (same_cs)
  3579			return 0;
  3580	
  3581		lockdep_assert_held(&cgroup_mutex);
  3582		mutex_lock(&cpuset_mutex);
  3583	
  3584		/* Check to see if task is allowed in the cpuset */
  3585		ret = cpuset_can_attach_check(cs);
  3586		if (ret)
  3587			goto out_unlock;
  3588	
  3589		ret = task_can_attach(task);
  3590		if (ret)
  3591			goto out_unlock;
  3592	
  3593		ret = security_task_setscheduler(task);
  3594		if (ret)
  3595			goto out_unlock;
  3596	
  3597		/*
  3598		 * Mark attach is in progress.  This makes validate_change() fail
  3599		 * changes which zero cpus/mems_allowed.
  3600		 */
  3601		cs->attach_in_progress++;
  3602		goto out_unlock;
  3603	
> 3604	out_unlock_reset:
  3605		if (cs->nr_migrate_dl_tasks)
  3606			reset_migrate_dl_data(cs);
  3607	out_unlock:
  3608		mutex_unlock(&cpuset_mutex);
  3609		return ret;
  3610	}
  3611	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
