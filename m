Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138939C621;
	Wed, 24 Jun 2026 21:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782337072; cv=none; b=CuaQ+CUwectuhBWRFuaQ2N1aBATMz2owiUxz+9Nk5/+mT9abzg54iFI535bMGtjw4bNPuKeb7NzbQTQViy4LvEQXmYWQNFMMfV/n9xHjs3t1exC+afH/eYf1mQvISXtpgDZXxvoglaGSOND/vJRhmjllzdcGPRm+R06A3zkG/SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782337072; c=relaxed/simple;
	bh=T3FrKV07tCX7yz8VAwu5JGuVKVZxSQui/7vqA2rKHGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J6oONsmuDvcaAx57QYytSgAFPkIFuy6260AWwTeDzNopZH5CXD1NxcjJfkVYcOprFWQ76X1R/Dz4O2KXleeHYsRyfJPw25Sow49+nvacvAMJIMYv0pxEs1FZENh0nOTX2ymQf/siX+ROxz9/gjaYFdpHJHkeYzxNvTt2309rW4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJqB0BBO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJqB0BBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782337071; x=1813873071;
  h=date:from:to:cc:subject:message-id;
  bh=T3FrKV07tCX7yz8VAwu5JGuVKVZxSQui/7vqA2rKHGk=;
  b=VJqB0BBO2UGCr1rsa5RsQBM99qObNgTJQwksAHNDiU5NsvbG4+E4I8+X
   U/tuWq/J2rEbzwX1KIeSWHPaemqqVsIh/jKwBaEPfAav5VftMLdzZS/By
   B3hqM3ns1s+pLhmZ93NWzPahJjbEzr+rItT0rc4wNbAhUEFvBGSZaQRDs
   jQ5Eui2YHxEVSEVjt6n2XC3SarHINpYbyutlJi6ayZyZAMPFsTh8dyhpR
   6rERIbRu6PZ4z5ajkbaH0jerhKdwG3w3te1m485LvrX6hPAkPnms5u+Hj
   xy5Ec0/g4jHwUrN+EZ9qQP/q5zMhfBltw4iYU9AZrta5tgkb/aR6+Qr9X
   A==;
X-CSE-ConnectionGUID: Oi4RTC9sROiPOnhDaYL3PA==
X-CSE-MsgGUID: gFcDO5p1RiqGk/HAiqT8fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83113469"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83113469"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 14:37:49 -0700
X-CSE-ConnectionGUID: OrjIVUYQRRmv5xzfCUX7fQ==
X-CSE-MsgGUID: Ts6uzsUZSGC4C8SIIXbtGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="254962503"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Jun 2026 14:37:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcVI1-000000003gQ-1jjT;
	Wed, 24 Jun 2026 21:37:45 +0000
Date: Thu, 25 Jun 2026 05:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:puranjay.2026.06.24a 54/65]
 kernel/rcu/tree.h:498:12: warning: function
 'rcu_preempt_blocked_readers_cgp_ndqs' has internal linkage but is not
 defined
Message-ID: <202606250529.ZnQlmwsD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux puranjay.2026.06.24a
head:   9f9e05ef4454de1724d65dcc1d45018d0457bd7c
commit: ab15f8d23a687736b674b3b8669a744dd709d97f [54/65] rcu: Make rcu_gp_cleanup() account for ->dqs_blkd_tasks
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260625/202606250529.ZnQlmwsD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250529.ZnQlmwsD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250529.ZnQlmwsD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:69:
>> kernel/rcu/tree.h:498:12: warning: function 'rcu_preempt_blocked_readers_cgp_ndqs' has internal linkage but is not defined [-Wundefined-internal]
     498 | static int rcu_preempt_blocked_readers_cgp_ndqs(struct rcu_node *rnp);
         |            ^
   kernel/rcu/tree.c:2223:20: note: used here
    2223 |                 if (WARN_ON_ONCE(rcu_preempt_blocked_readers_cgp_ndqs(rnp)))
         |                                  ^
   1 warning generated.


vim +/rcu_preempt_blocked_readers_cgp_ndqs +498 kernel/rcu/tree.h

   493	
   494	/* Forward declarations for tree_plugin.h */
   495	static void rcu_bootup_announce(void);
   496	static void rcu_qs(void);
   497	static int rcu_preempt_blocked_readers_cgp(struct rcu_node *rnp);
 > 498	static int rcu_preempt_blocked_readers_cgp_ndqs(struct rcu_node *rnp);
   499	static int rcu_print_task_exp_stall(struct rcu_node *rnp);
   500	static void rcu_preempt_check_blocked_tasks(struct rcu_node *rnp);
   501	static void rcu_flavor_sched_clock_irq(int user);
   502	static void dump_blkd_tasks(struct rcu_node *rnp, int ncheck);
   503	static void rcu_preempt_deferred_qs_init(struct rcu_data *rdp);
   504	static void rcu_initiate_boost(struct rcu_node *rnp, unsigned long flags);
   505	static void rcu_preempt_boost_start_gp(struct rcu_node *rnp);
   506	static bool rcu_is_callbacks_kthread(struct rcu_data *rdp);
   507	static void rcu_cpu_kthread_setup(unsigned int cpu);
   508	static void rcu_spawn_one_boost_kthread(struct rcu_node *rnp);
   509	static bool rcu_preempt_has_tasks(struct rcu_node *rnp);
   510	static bool rcu_preempt_has_tasks_ndqs(struct rcu_node *rnp);
   511	static bool rcu_preempt_need_deferred_qs(struct task_struct *t);
   512	static void zero_cpu_stall_ticks(struct rcu_data *rdp);
   513	static struct swait_queue_head *rcu_nocb_gp_get(struct rcu_node *rnp);
   514	static void rcu_nocb_gp_cleanup(struct swait_queue_head *sq);
   515	static void rcu_init_one_nocb(struct rcu_node *rnp);
   516	static bool wake_nocb_gp(struct rcu_data *rdp);
   517	static bool rcu_nocb_flush_bypass(struct rcu_data *rdp, struct rcu_head *rhp,
   518					  unsigned long j, bool lazy);
   519	static void call_rcu_nocb(struct rcu_data *rdp, struct rcu_head *head,
   520				  rcu_callback_t func, unsigned long flags, bool lazy);
   521	static void __maybe_unused __call_rcu_nocb_wake(struct rcu_data *rdp, bool was_empty,
   522							unsigned long flags);
   523	static int rcu_nocb_need_deferred_wakeup(struct rcu_data *rdp, int level);
   524	static bool do_nocb_deferred_wakeup(struct rcu_data *rdp);
   525	static void rcu_boot_init_nocb_percpu_data(struct rcu_data *rdp);
   526	static void rcu_spawn_cpu_nocb_kthread(int cpu);
   527	static void show_rcu_nocb_state(struct rcu_data *rdp);
   528	static void rcu_nocb_lock(struct rcu_data *rdp);
   529	static void rcu_nocb_unlock(struct rcu_data *rdp);
   530	static void rcu_nocb_unlock_irqrestore(struct rcu_data *rdp,
   531					       unsigned long flags);
   532	static void rcu_lockdep_assert_cblist_protected(struct rcu_data *rdp);
   533	#ifdef CONFIG_RCU_NOCB_CPU
   534	static void __init rcu_organize_nocb_kthreads(void);
   535	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
