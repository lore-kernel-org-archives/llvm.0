Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE53E4A3D41;
	Fri, 11 Sep 2026 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144184; cv=none; b=mXzVw4EPlGiy5XnnGQZ/DrkgwYFEPU781C91uzRSV1yYA5nIoRo/12PWVH/vAOw7Qy+imoGlMi4tLhTfhXea9YFa2IacXyhrb55ILjPECC+HPCvv79PMomTb63Oh+1B/3XkD3ubK3w77pe9WRwirBuzsPuD4LBsFy0pUzPMUbsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144184; c=relaxed/simple;
	bh=IzSavGhwVfrkaJsa+XKo6C76BJCqUzWGsnV1JIL5bM4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DnvPWkshhraGzah5/cEGCcbVlyjoauxk+b/rsS9fKhwrkv8Y+TgBVFuygNV1Lzvq5xmYdr1z8lbZZB8eps1z7uNek0qaBzdFAyxqvyKW1J09EeGRsSOUzZ0o/u+CAW5vxF+P5qRF5dTAbHoZrGlW5kJDEUxLFLuCE/NDzM8kWqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7CsvqtR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7CsvqtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789144183; x=1820680183;
  h=date:from:to:cc:subject:message-id;
  bh=IzSavGhwVfrkaJsa+XKo6C76BJCqUzWGsnV1JIL5bM4=;
  b=k7CsvqtRPo6bLdux7L5BzGNz9Mp89u3w/PNrOnxXUiym5hXURWFcEPH4
   PexeUbpb2bWqXo/ubRYFLWBsidUNSpsEAti32DLXdMBdEG53k8CEnvqk2
   Iq4aPDOoaHsc7tVC5wqQBK0JXbfoRoLX0qCc01JPs/Wiy6hhFE8zPRTye
   an7/qGBb8Bx+uYUsGSS/JTshKOK8JyXUcaQVGa+WSCEeBHzanJBwzCz2w
   C/JwQJ7ajemFvVGsS/Y5usbAQLgCt78E9nm/jDLqyM4jB24LoLzllQqWg
   cNhAuasiCvPpHgcFbdzPtCEtcK1MbyQKoRfcKBMQokD9HPnXnuvT196vV
   w==;
X-CSE-ConnectionGUID: 4qg6atVUS4KGIJN32vUfXw==
X-CSE-MsgGUID: GgHW/EXrS8yUq/+ZLNVWtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89621796"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89621796"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 09:29:42 -0700
X-CSE-ConnectionGUID: oVjNRNaAQRKODXvoQtwmFg==
X-CSE-MsgGUID: hbIPUMcJSH2OIlApr1SQYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="346499"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa013.fm.intel.com with ESMTP; 11 Sep 2026 09:29:40 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5480-000000001n3-2WNX;
	Fri, 11 Sep 2026 16:29:30 +0000
Date: Sat, 12 Sep 2026 00:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2026.09.09a 42/56]
 kernel/rcu/tree_stall.h:332:48: warning: comparison between pointer and
 integer ('int' and 'struct task_struct *')
Message-ID: <202609120047.u7Af769s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev.2026.09.09a
head:   d61d9b5dd56c6cf72b70bb5fb52b213ead9f7765
commit: e33488c41be623f7c7ef5b8763e20c45f1364d1c [42/56] rcu: Add running and boosted indications to RCU task stall dump
config: powerpc-tqm8xx_defconfig (https://download.01.org/0day-ci/archive/20260912/202609120047.u7Af769s-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120047.u7Af769s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120047.u7Af769s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:5112:
   kernel/rcu/tree_stall.h:332:8: error: call to undeclared function 'rt_mutex_owner'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
         |                             ^
>> kernel/rcu/tree_stall.h:332:48: warning: comparison between pointer and integer ('int' and 'struct task_struct *') [-Wpointer-integer-compare]
     332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~
   In file included from kernel/rcu/tree.c:5115:
   In file included from kernel/rcu/tree_plugin.h:14:
   kernel/rcu/../locking/rtmutex_common.h:231:35: error: conflicting types for 'rt_mutex_owner'
     231 | static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
         |                                   ^
   kernel/rcu/tree_stall.h:332:8: note: previous implicit declaration is here
     332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
         |                             ^
   1 warning and 2 errors generated.


vim +332 kernel/rcu/tree_stall.h

   311	
   312	/*
   313	 * Report out the state of a not-running task that is stalling the
   314	 * current RCU grace period.
   315	 */
   316	static int check_slow_task(struct task_struct *t, void *arg)
   317	{
   318		struct rcu_node *rnp;
   319		struct rcu_stall_chk_rdr *rscrp = arg;
   320	
   321		if (task_curr(t))
   322			return -EBUSY; // It is running, so decline to inspect it.
   323		rscrp->nesting = t->rcu_read_lock_nesting;
   324		rscrp->rs = t->rcu_read_unlock_special;
   325		rscrp->on_blkd_list = !list_empty(&t->rcu_node_entry);
   326		rscrp->rcu_rdr_running = task_curr(t);
   327		rscrp->rcu_rdr_boosted = 0;
   328		if (rscrp->on_blkd_list) {
   329			rnp = READ_ONCE(t->rcu_blocked_node);
   330			raw_spin_lock_rcu_node(rnp); /* irqs already disabled. */
   331			if (rnp == READ_ONCE(t->rcu_blocked_node)) {
 > 332				if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
   333					rscrp->rcu_rdr_boosted = 1;
   334			} else {
   335				rscrp->rcu_rdr_boosted = 2;
   336			}
   337			raw_spin_unlock_rcu_node(rnp); /* irqs remain disabled. */
   338		}
   339		return 0;
   340	}
   341	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
