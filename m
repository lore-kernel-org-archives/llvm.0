Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD332F3632;
	Tue,  2 Jun 2026 19:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780430314; cv=none; b=P9XdzHTYLTOu+eEfM3oxBWVkwe5SnyMrkTa9g7Ld7i0od7Nsh9xOcSrwwrkw6aaM/NpFg26JpVakcMqp9Iu37krIq3eax8wPNxQlLAMhKgkxSpW9MhtDDNMpx9UzEMXssvrrrcfrKMCCVXCdLvCmkdbx4i6071YQ9Mw46yu83GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780430314; c=relaxed/simple;
	bh=Q+UFS9QH81aErMxmAFBEU3jbkmsOKiyLvdUdKhY0NuU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YL44mox8DO3qYS+TAWOaWfdAUjlf/Md3SJA9HvWG8yIP06i6VOBfLES9IISi7XL7erLq/+J9MkZUElgMivV362VWoGewrFEO5pwy1mfDfd8f1alGtjP5dXxGzDlLoY1axBF6SsvcuddMwGrc+bptQlUxgPVBM2U0MW3B6eWg1zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4D7kH8O; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4D7kH8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780430313; x=1811966313;
  h=date:from:to:cc:subject:message-id;
  bh=Q+UFS9QH81aErMxmAFBEU3jbkmsOKiyLvdUdKhY0NuU=;
  b=C4D7kH8O23nD2RESOvmvMBZq4gWRD06Ycq5qGHXXYgdW0CcxA6Tdrc7r
   hivYLtrPpeleOTrPmEZK0NN66HXr3cJ6HPf7nKscszkWRmy6ytJrB3HXk
   LnDZasJ8lLR91yRA9oCZtzFNwT1ZTsrx6yN5+3+71IX1tV1ZWdxLqJn7G
   5lMzVl2VfaTQpEE4Pn0BRa6nb4uiDue5f32SykYNw868mf/7GQtdgdJc3
   9eyhNLPy3r584F/1Qy9s+QaVLgCsRYIaBOzZunb03n8tqAXRMIAaF5SSk
   ZsC0hTMHhZu1UQB7O+J2RNH88nASlBQ/JaS6jnyCvyrzCoBKMIB8o0qWm
   w==;
X-CSE-ConnectionGUID: uBsfcCqyS1aDNARbJtr7sA==
X-CSE-MsgGUID: RuM859tpQvS0dvK8g37nWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81258231"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81258231"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 12:58:32 -0700
X-CSE-ConnectionGUID: xUHc/jqLQ9+K8FXtZlQDiw==
X-CSE-MsgGUID: JPUDR4paRwaxedkX2RXVlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="243845012"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 02 Jun 2026 12:58:31 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUVFs-000000001qn-0qpO;
	Tue, 02 Jun 2026 19:58:28 +0000
Date: Tue, 02 Jun 2026 21:58:22 +0200
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 61/61] kernel/sched/fair.c:9922:7:
 warning: variable 'cfs_rq' is uninitialized when used here
Message-ID: <202606022118.7Wo9qrgy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   a5d37500c54a90dc76e3e3e1cd3b0194b06d5461
commit: a5d37500c54a90dc76e3e3e1cd3b0194b06d5461 [61/61] sched/eevdf: Move to a single runqueue
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260602/202606022118.7Wo9qrgy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606022118.7Wo9qrgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606022118.7Wo9qrgy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:9922:7: warning: variable 'cfs_rq' is uninitialized when used here [-Wuninitialized]
    9922 |         if (!cfs_rq->h_nr_queued)
         |              ^~~~~~
   kernel/sched/fair.c:9917:23: note: initialize the variable 'cfs_rq' to silence this warning
    9917 |         struct cfs_rq *cfs_rq;
         |                              ^
         |                               = NULL
   1 warning generated.


vim +/cfs_rq +9922 kernel/sched/fair.c

  9912	
  9913	struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
  9914		__must_hold(__rq_lockp(rq))
  9915	{
  9916		struct sched_entity *se;
  9917		struct cfs_rq *cfs_rq;
  9918		struct task_struct *p;
  9919		int new_tasks;
  9920	
  9921	again:
> 9922		if (!cfs_rq->h_nr_queued)
  9923			goto idle;
  9924	
  9925		/* Might not have done put_prev_entity() */
  9926		if (cfs_rq->curr && cfs_rq->curr->on_rq)
  9927			update_curr(cfs_rq);
  9928	
  9929		se = pick_next_entity(rq, true);
  9930		if (!se)
  9931			goto again;
  9932	
  9933		p = task_of(se);
  9934		return p;
  9935	
  9936	idle:
  9937		new_tasks = sched_balance_newidle(rq, rf);
  9938		if (new_tasks < 0)
  9939			return RETRY_TASK;
  9940		if (new_tasks > 0)
  9941			goto again;
  9942		return NULL;
  9943	}
  9944	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
