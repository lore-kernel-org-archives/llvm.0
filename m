Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB58F611E;
	Fri, 31 Oct 2025 04:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761886048; cv=none; b=RryTYZk6zJreeeAXvWFiF0yZoV7bBu3bsXdARBWk5A3qQuTTS8XTo16W0/2JwZWudzTfi/boT7OyreRabtR100etltcs1VvcWwk9DiICPmaE+yl5JLkUdDAfV3LBIDyq0ox+eWMn8ewlPyAEKSY+DRXQLOW9KBcfRjKCmvDdAyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761886048; c=relaxed/simple;
	bh=PzE7KeAqgfKugyYxm/djtYvuFFyf7E5abLaQIMmVHDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZAxEVD+p+yitwezptHZKIwjulRHqO33EviIx9lBj1LOlKoqAP3AFGFjh0IWTxK65DnQiFfWhvjYZ4sH0WsMqvaUJ6S0X1uABqRC4lWRplO5tVtk84B4gHDYhgPt8hpG4f+jpCkA+TpqY6kbCQQ29kJakaABSYCKjRyRpS3OYM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBWD4htJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBWD4htJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761886046; x=1793422046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PzE7KeAqgfKugyYxm/djtYvuFFyf7E5abLaQIMmVHDA=;
  b=bBWD4htJM+mYzp549mL523dk2uQyTl/WXcAa6dfvGrSm/SRZPxNeJzRO
   FMUcsvENrRZxRIq84X++/fxN5ZZEmvEVZ6jHDAZbnfdMMgA0l5oOPa5jc
   deLaw0ixTQFxTH5A5lpVGDTLOURHeUglR1Ur7FHeVXhdcdzYQA5EOrLP7
   U+YV+gWeLAOAaNOSg0DD19JgXYbZZWMTEGY+f6idr+pIzKXu5zWqAf0Lp
   lTmFysLwloR9jew35EeZbFrr62Bb/L9Dbt2h7j+YcqqFz4zeGg1Z4qKjC
   XFSyWD5wf3tNQfG3XzoT7BsKZdQZNVY+iKIkIEE8OBfxTqOhKkP62+MVh
   Q==;
X-CSE-ConnectionGUID: e+SOquMtRtGqOg02N53E6w==
X-CSE-MsgGUID: C1KSFcz1QyehdLEdDFZIMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75389638"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="75389638"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 21:47:26 -0700
X-CSE-ConnectionGUID: BKM6gTJGTeGUhoi8XHJKjQ==
X-CSE-MsgGUID: xeZjyYKmRAORTRTjKrkI0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="190214659"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Oct 2025 21:47:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEh2m-000MmU-1E;
	Fri, 31 Oct 2025 04:47:21 +0000
Date: Fri, 31 Oct 2025 12:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:next.2025.10.30c 17/43] kernel/rcu/rcutorture.c:1139:17:
 error: use of undeclared identifier 'rcu_tasks_trace_expedite_current'; did
 you mean 'srcu_torture_expedite_current'?
Message-ID: <202510311200.9qgdI1m8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux next.2025.10.30c
head:   1eee41590d30805ec4f5b4e96c615603b0d058d9
commit: f7cd407d56a0baf6fc9fe3e093253f6e30d61a95 [17/43] rcutorture: Test rcu_tasks_trace_expedite_current()
config: s390-randconfig-001-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311200.9qgdI1m8-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311200.9qgdI1m8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311200.9qgdI1m8-lkp@intel.com/

Note: the paulmckrcu/next.2025.10.30c HEAD 1eee41590d30805ec4f5b4e96c615603b0d058d9 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/rcu/rcutorture.c:1139:17: error: use of undeclared identifier 'rcu_tasks_trace_expedite_current'; did you mean 'srcu_torture_expedite_current'?
           .exp_current    = rcu_tasks_trace_expedite_current,
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                             srcu_torture_expedite_current
   kernel/rcu/rcutorture.c:861:13: note: 'srcu_torture_expedite_current' declared here
   static void srcu_torture_expedite_current(void)
               ^
   1 error generated.


vim +1139 kernel/rcu/rcutorture.c

  1127	
  1128	static struct rcu_torture_ops tasks_tracing_ops = {
  1129		.ttype		= RCU_TASKS_TRACING_FLAVOR,
  1130		.init		= rcu_sync_torture_init,
  1131		.readlock	= tasks_tracing_torture_read_lock,
  1132		.read_delay	= srcu_read_delay,  /* just reuse srcu's version. */
  1133		.readunlock	= tasks_tracing_torture_read_unlock,
  1134		.readlock_held	= rcu_read_lock_trace_held,
  1135		.get_gp_seq	= rcu_no_completed,
  1136		.deferred_free	= rcu_tasks_tracing_torture_deferred_free,
  1137		.sync		= synchronize_rcu_tasks_trace,
  1138		.exp_sync	= synchronize_rcu_tasks_trace,
> 1139		.exp_current	= rcu_tasks_trace_expedite_current,
  1140		.call		= call_rcu_tasks_trace,
  1141		.cb_barrier	= rcu_barrier_tasks_trace,
  1142		.gp_kthread_dbg	= show_rcu_tasks_trace_gp_kthread,
  1143		.get_gp_data    = rcu_tasks_trace_get_gp_data,
  1144		.cbflood_max	= 50000,
  1145		.irq_capable	= 1,
  1146		.slow_gps	= 1,
  1147		.name		= "tasks-tracing"
  1148	};
  1149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
