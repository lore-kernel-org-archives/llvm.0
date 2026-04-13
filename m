Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50893612EE;
	Mon, 13 Apr 2026 19:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776108352; cv=none; b=gHah/KxXYuGgLnnW7Jtwg/9JaTAkTrreKOkAkjKy94eAR5XSHD+u37NU6Va0sahnGMxAMAXSH9vcJKtJbECEcf1qo3w7i7JWV8Tzw7Gi+cVTOp3fUroZIo2wdc9OfDhkzSuF4BSLNStC/UY+xzEPlDNNA/rDMjHwa5ZyvwSwLFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776108352; c=relaxed/simple;
	bh=1d/k8sSVUb2XFFg/TCA2ozMs9Hh0g0decK8/VA83QQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gi2aNqjE3OhTN9fPyfuan2YauJxs1LaTf7mCyY81gDM3TEtbe9eut6T5UyyPZ6jMteJtpj6o6X806iGBX8XmDDNHloVF3k6lnIjk3LpbjSaf1JxAvUJS/8Wk0Aek/zAqFhzKkShdJ8AB8k1a20W6mi9523o/4BfY9gR33EFRH4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNqu6OXn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNqu6OXn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776108351; x=1807644351;
  h=date:from:to:cc:subject:message-id;
  bh=1d/k8sSVUb2XFFg/TCA2ozMs9Hh0g0decK8/VA83QQs=;
  b=VNqu6OXnUZuYi16paSJeeUmwWPpbwvEuDOZBKi8wsEw1RqZAYBKRmr6w
   BkoZcIuen76pNWnktgJfhvsUhJrTRgpytnaJTEd50p1xtV5nqSMDqnhL/
   CBcM/Yh8v8OWgBOHPYvIrPc20B+Fm3pKT/tQg/poSizs71EFdmhEBwRMR
   VAKiglKEnUQiL5Yn46Rgam+XGCSpXCR62BIlnHI0iHY8XzqVab16VewMH
   /peOQsfo40wOY/WIIhlqJCvSPgZP2cPF3QXB5cwYn5/RRouBTBVZyACMQ
   /znVFsS+NyEYprRHUnmvR6ILMTR+cLKD6AZZlHgOhfZdFID4ki2/Mr5AB
   A==;
X-CSE-ConnectionGUID: K3q6Azx8S6GvEcDL9Afpdw==
X-CSE-MsgGUID: V8mBM6rkTda90I1wSCoY8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102510320"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="102510320"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:25:50 -0700
X-CSE-ConnectionGUID: 6tkEdooPQRu21ejykO9PLg==
X-CSE-MsgGUID: 6elYWfchRgyYwu/DfJ9Faw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="228834307"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 Apr 2026 12:25:48 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCMuo-0000000008r-0kcu;
	Mon, 13 Apr 2026 19:25:46 +0000
Date: Mon, 13 Apr 2026 21:25:44 +0200
From: kernel test robot <lkp@intel.com>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/cgroup/cgroup.c:2985:3: error: call to undeclared
 function 'proc_cgroup_migrate_connector'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202604132122.t9CkPsUA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Prakash-Sangappa/netlink-Add-Netlink-process-event-for-cgroup-migration/20260413-212045
head:   819518d4c1d85b9d68bd1935a28a3a3ee9c46f8d
commit: 819518d4c1d85b9d68bd1935a28a3a3ee9c46f8d netlink: Add Netlink process event for cgroup migration
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260413/202604132122.t9CkPsUA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604132122.t9CkPsUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604132122.t9CkPsUA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:2985:3: error: call to undeclared function 'proc_cgroup_migrate_connector'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2985 |                 proc_cgroup_migrate_connector(leader, dst_cgrp);
         |                 ^
   kernel/cgroup/cgroup.c:2985:3: note: did you mean 'proc_cgrp_migrate_connector'?
   include/linux/cn_proc.h:58:20: note: 'proc_cgrp_migrate_connector' declared here
      58 | static inline void proc_cgrp_migrate_connector(struct task_struct *task)
         |                    ^
   1 error generated.
--
>> kernel/cgroup/cgroup-v1.c:153:5: error: call to undeclared function 'proc_cgroup_migrate_connector'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     153 |                                 proc_cgroup_migrate_connector(task, to);
         |                                 ^
   kernel/cgroup/cgroup-v1.c:153:5: note: did you mean 'proc_cgrp_migrate_connector'?
   include/linux/cn_proc.h:58:20: note: 'proc_cgrp_migrate_connector' declared here
      58 | static inline void proc_cgrp_migrate_connector(struct task_struct *task)
         |                    ^
   1 error generated.


vim +/proc_cgroup_migrate_connector +2985 kernel/cgroup/cgroup.c

  2951	
  2952	/**
  2953	 * cgroup_attach_task - attach a task or a whole threadgroup to a cgroup
  2954	 * @dst_cgrp: the cgroup to attach to
  2955	 * @leader: the task or the leader of the threadgroup to be attached
  2956	 * @threadgroup: attach the whole threadgroup?
  2957	 *
  2958	 * Call holding cgroup_mutex and cgroup_threadgroup_rwsem.
  2959	 */
  2960	int cgroup_attach_task(struct cgroup *dst_cgrp, struct task_struct *leader,
  2961			       bool threadgroup)
  2962	{
  2963		DEFINE_CGROUP_MGCTX(mgctx);
  2964		struct task_struct *task;
  2965		int ret = 0;
  2966	
  2967		/* look up all src csets */
  2968		spin_lock_irq(&css_set_lock);
  2969		task = leader;
  2970		do {
  2971			cgroup_migrate_add_src(task_css_set(task), dst_cgrp, &mgctx);
  2972			if (!threadgroup)
  2973				break;
  2974		} while_each_thread(leader, task);
  2975		spin_unlock_irq(&css_set_lock);
  2976	
  2977		/* prepare dst csets and commit */
  2978		ret = cgroup_migrate_prepare_dst(&mgctx);
  2979		if (!ret)
  2980			ret = cgroup_migrate(leader, threadgroup, &mgctx);
  2981	
  2982		cgroup_migrate_finish(&mgctx);
  2983	
  2984		if (!ret) {
> 2985			proc_cgroup_migrate_connector(leader, dst_cgrp);
  2986			TRACE_CGROUP_PATH(attach_task, dst_cgrp, leader, threadgroup);
  2987		}
  2988	
  2989		return ret;
  2990	}
  2991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
