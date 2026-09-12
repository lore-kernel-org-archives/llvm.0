Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892891A3160;
	Sat, 12 Sep 2026 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789190029; cv=none; b=tDOcHalmOziHvgIBm93wFeRMwEjTZ+nUhn3gckOAIxzNRLrsrWefsqGRNAM56A1gu5w6aRZsNScBygCJT0URincoSNZd7IAONcq/9c9afQAnclxOXEpl2+GQ02ZCg6zQxmBx01iyZgYxOdTauGM05awbYKxkSrRQahxQHjsPD08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789190029; c=relaxed/simple;
	bh=OXdBdd7pW28mqvPCXxRmOCmCu0Ae0Yi1r0Kk1S+B7zI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cDQZ46HyEDeeob2DikBrDjAs9GYckn4wSRoSb4sB4ntN10Cry2xSUyWiMYOpYYLJ5428K3SUlJzRRS+ANoFo3kZamdqpcU1Xer9DqMSjkOmizLXx0sbZAZs6YoRBT/jFoVzhq84AYFMJKkGWKWjc6rXSnJA9WIZGVDZZL073k74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlN2Yoog; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlN2Yoog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789190027; x=1820726027;
  h=date:from:to:cc:subject:message-id;
  bh=OXdBdd7pW28mqvPCXxRmOCmCu0Ae0Yi1r0Kk1S+B7zI=;
  b=VlN2YooggDqt+FsqugLgk4SAAI1k7ISFf0Rsi8f7JtX2/3CO1fixBY4t
   MQUwVOuXshPuQK4Y4o6Q9yF18aXYkJf7SjaX55QHnU1d+CHZ3ScxiEPK0
   czd+6sSjfLXJ1z6UMhe9W0Lu1fY26ObLp3JxfG0Vv197nFNZBSaTVqfa/
   G+48QbC5ui/I9HEh9MbMAY1BGAP2iWesplcXQQC8wCVy8msO1p4pEGqcC
   9UvI6vJ7u9h3ymqcDiFvgbEVzpYVriH7ij8Cg2MovKG9Ivf819VqbqMdM
   22r4W2PqMAzyKyj48A/nSYaORZ2wTEHVaxjzfhGYa54oCdt3tXCG6q0//
   w==;
X-CSE-ConnectionGUID: MV87l0lGRvawh8MqnnSdow==
X-CSE-MsgGUID: roPiiLW8RLmmEXUfbsyoIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89410367"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89410367"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 22:13:46 -0700
X-CSE-ConnectionGUID: 8ANxDgfJRqq8tK0gQxsScA==
X-CSE-MsgGUID: pvT0JrmSSe6oeVb+vsm4FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="357015"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa012.fm.intel.com with ESMTP; 11 Sep 2026 22:13:45 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5G3Z-000000002gZ-3xXl;
	Sat, 12 Sep 2026 05:13:41 +0000
Date: Sat, 12 Sep 2026 13:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [clangbuiltlinux:question_mark_operator 2/5]
 kernel/cgroup/cpuset.c:3768:42: error: expected expression
Message-ID: <202609121323.tq95alRc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/ClangBuiltLinux/linux question_mark_operator
head:   532a7ac2d57bb5674f5feffb4ba378f8a32f3bcf
commit: b073116da78daa4548a491eba6508141a9b350dc [2/5] cgroup/cpuset: use guard(mutex) and try operator ('?') in cpuset_can_fork
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260912/202609121323.tq95alRc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121323.tq95alRc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121323.tq95alRc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:3768:42: error: expected expression
    3768 |         cpuset_can_attach_check(cs, NULL, NULL)?;
         |                                                 ^
>> kernel/cgroup/cpuset.c:3768:42: error: expected ':'
    3768 |         cpuset_can_attach_check(cs, NULL, NULL)?;
         |                                                 ^
         |                                                 : 
   kernel/cgroup/cpuset.c:3768:41: note: to match this '?'
    3768 |         cpuset_can_attach_check(cs, NULL, NULL)?;
         |                                                ^
>> kernel/cgroup/cpuset.c:3768:42: error: expected expression
    3768 |         cpuset_can_attach_check(cs, NULL, NULL)?;
         |                                                 ^
   kernel/cgroup/cpuset.c:3769:24: error: expected expression
    3769 |         task_can_attach(task)?;
         |                               ^
   kernel/cgroup/cpuset.c:3769:24: error: expected ':'
    3769 |         task_can_attach(task)?;
         |                               ^
         |                               : 
   kernel/cgroup/cpuset.c:3769:23: note: to match this '?'
    3769 |         task_can_attach(task)?;
         |                              ^
   kernel/cgroup/cpuset.c:3769:24: error: expected expression
    3769 |         task_can_attach(task)?;
         |                               ^
   kernel/cgroup/cpuset.c:3770:35: error: expected expression
    3770 |         security_task_setscheduler(task)?;
         |                                          ^
   kernel/cgroup/cpuset.c:3770:35: error: expected ':'
    3770 |         security_task_setscheduler(task)?;
         |                                          ^
         |                                          : 
   kernel/cgroup/cpuset.c:3770:34: note: to match this '?'
    3770 |         security_task_setscheduler(task)?;
         |                                         ^
   kernel/cgroup/cpuset.c:3770:35: error: expected expression
    3770 |         security_task_setscheduler(task)?;
         |                                          ^
   9 errors generated.


vim +3768 kernel/cgroup/cpuset.c

  3747	
  3748	/*
  3749	 * In case the child is cloned into a cpuset different from its parent,
  3750	 * additional checks are done to see if the move is allowed.
  3751	 */
  3752	static int cpuset_can_fork(struct task_struct *task, struct css_set *cset)
  3753	{
  3754		struct cpuset *cs = css_cs(cset->subsys[cpuset_cgrp_id]);
  3755		bool same_cs;
  3756	
  3757		rcu_read_lock();
  3758		same_cs = (cs == task_cs(current));
  3759		rcu_read_unlock();
  3760	
  3761		if (same_cs)
  3762			return 0;
  3763	
  3764		lockdep_assert_held(&cgroup_mutex);
  3765		guard(mutex)(&cpuset_mutex);
  3766	
  3767		/* Check to see if task is allowed in the cpuset */
> 3768		cpuset_can_attach_check(cs, NULL, NULL)?;
  3769		task_can_attach(task)?;
  3770		security_task_setscheduler(task)?;
  3771	
  3772		attach_ctx.in_progress++;
  3773		return 0;
  3774	}
  3775	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
