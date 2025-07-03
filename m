Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408A32F0C41;
	Thu,  3 Jul 2025 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555976; cv=none; b=NyTJ4PVUZQRroD9Z71EOfFOQ5aTcmuSXTYiApBAg1z0vqPtkSbN2wYBQ1Hf5DG+BJ2TsJw1EvR/Tpk+sBAuo0KTZ2vfNXmW9DdJrWMXhX9J55NyLKKrU1Tp1NcZZ3P/gUyKd3+SSyxhWiFvEwhBXRQCHtTpJTulgVHOViCWU0QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555976; c=relaxed/simple;
	bh=sw4+2hXohvY5N5XpItwbgYmFAm7/pFfXl0ro/uaTOsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpFNc4ws90busLRkuXosuXOglFdfLhc8cacsH8R2isdb1lvKZXs//a4ziPsZoWsVXBWyRpM7ToF7agldYAXYDT5R3k3/T28MmeC6yob9EaDTl8XaBSTEIQXp1dHU/WFMbxqnchcCnXQlpRzxmTnU3tdY5mPkV0brE8b8e0j+7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzAnZDa+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzAnZDa+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751555974; x=1783091974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sw4+2hXohvY5N5XpItwbgYmFAm7/pFfXl0ro/uaTOsQ=;
  b=XzAnZDa+wMt2fC+19dnXNUJHQgTFp4YvoWuqsKe9G9tHRMFUX5CnVJpe
   smUhIA7vLyk90pvfODXQuR60A/jejinO93ZMpBISfrFMwjZuVrhqtGN25
   0XetcfbZHiA3DhH8AkJ2VjVOCfRSLsUshGFZ0zZmqXs/aXocd4dokbPQr
   ijxWL8VgpviP6jj2BNDL6qwX/Asnwi8xYJcnYZqAHIVghJSS/lItOdB2u
   4FnUC/JcQkxm7EottqSESOJqfRlJGS8v4NvTtgpUaR9j4J4x5sTgW29N9
   snIaf83evS0pxPf347eecq7QfetGtEBAe32xyExqDn3ysVQ+3a1bdLewC
   Q==;
X-CSE-ConnectionGUID: pobJYo0AShe5cRQD2fUA0A==
X-CSE-MsgGUID: /QcCFS4tQKaPFmfoCNhYig==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79326824"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="79326824"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 08:19:34 -0700
X-CSE-ConnectionGUID: js1SwdZiQu+/VPvNbv9kEg==
X-CSE-MsgGUID: LYHXMwTPTZ6PQWemHuJWYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="191575596"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Jul 2025 08:19:33 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXLik-0002VD-09;
	Thu, 03 Jul 2025 15:19:30 +0000
Date: Thu, 3 Jul 2025 23:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/irq-exit-v2 4/4] kernel/rcu/tree_exp.h:738:24: error: too
 many arguments to function call, expected 0, have 1
Message-ID: <202507032358.ObihHOzZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/irq-exit-v2
head:   2d2b43727789cf79a5fc38149bd16cc1b90513cc
commit: 2d2b43727789cf79a5fc38149bd16cc1b90513cc [4/4] rcu: Convert cpu_no_qs flag setting to use helpers
config: s390-randconfig-002-20250703 (https://download.01.org/0day-ci/archive/20250703/202507032358.ObihHOzZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f1a4bb62452d88a0edd9340b3ca7c9b11ad9193f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507032358.ObihHOzZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507032358.ObihHOzZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/tree.c:734:6: error: conflicting types for 'rcu_set_exp_qs_needed'
     734 | void rcu_set_exp_qs_needed(bool value)
         |      ^
   kernel/rcu/tree.h:551:6: note: previous declaration is here
     551 | void rcu_set_exp_qs_needed(void);
         |      ^
   kernel/rcu/tree.c:745:6: error: conflicting types for 'rcu_set_exp_qs_needed_cpu'
     745 | void rcu_set_exp_qs_needed_cpu(struct rcu_data *rdp, bool value)
         |      ^
   kernel/rcu/tree.h:552:6: note: previous declaration is here
     552 | void rcu_set_exp_qs_needed_cpu(struct rcu_data *rdp);
         |      ^
   In file included from kernel/rcu/tree.c:4905:
>> kernel/rcu/tree_exp.h:738:24: error: too many arguments to function call, expected 0, have 1
     738 |         rcu_set_exp_qs_needed(true);
         |         ~~~~~~~~~~~~~~~~~~~~~ ^~~~
   kernel/rcu/tree.h:551:6: note: 'rcu_set_exp_qs_needed' declared here
     551 | void rcu_set_exp_qs_needed(void);
         |      ^
   In file included from kernel/rcu/tree.c:4905:
>> kernel/rcu/tree_exp.h:800:35: error: too many arguments to function call, expected single argument 'rdp', have 2 arguments
     800 |                         rcu_set_exp_qs_needed_cpu(rdp, true);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~      ^~~~
   kernel/rcu/tree.h:552:6: note: 'rcu_set_exp_qs_needed_cpu' declared here
     552 | void rcu_set_exp_qs_needed_cpu(struct rcu_data *rdp);
         |      ^                         ~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +738 kernel/rcu/tree_exp.h

   733	
   734	/* Request an expedited quiescent state. */
   735	static void rcu_exp_need_qs(void)
   736	{
   737		lockdep_assert_irqs_disabled();
 > 738		rcu_set_exp_qs_needed(true);
   739		/* Store .exp before .rcu_urgent_qs. */
   740		smp_store_release(this_cpu_ptr(&rcu_data.rcu_urgent_qs), true);
   741		set_tsk_need_resched(current);
   742		set_preempt_need_resched();
   743	}
   744	
   745	#ifdef CONFIG_PREEMPT_RCU
   746	
   747	/*
   748	 * Remote handler for smp_call_function_single().  If there is an
   749	 * RCU read-side critical section in effect, request that the
   750	 * next rcu_read_unlock() record the quiescent state up the
   751	 * ->expmask fields in the rcu_node tree.  Otherwise, immediately
   752	 * report the quiescent state.
   753	 */
   754	static void rcu_exp_handler(void *unused)
   755	{
   756		int depth = rcu_preempt_depth();
   757		unsigned long flags;
   758		struct rcu_data *rdp = this_cpu_ptr(&rcu_data);
   759		struct rcu_node *rnp = rdp->mynode;
   760		struct task_struct *t = current;
   761	
   762		/*
   763		 * WARN if the CPU is unexpectedly already looking for a
   764		 * QS or has already reported one.
   765		 */
   766		ASSERT_EXCLUSIVE_WRITER_SCOPED(rdp->cpu_no_qs.b.exp);
   767		if (WARN_ON_ONCE(!(READ_ONCE(rnp->expmask) & rdp->grpmask) ||
   768				 READ_ONCE(rdp->cpu_no_qs.b.exp)))
   769			return;
   770	
   771		/*
   772		 * Second, the common case of not being in an RCU read-side
   773		 * critical section.  If also enabled or idle, immediately
   774		 * report the quiescent state, otherwise defer.
   775		 */
   776		if (!depth) {
   777			if (!(preempt_count() & (PREEMPT_MASK | SOFTIRQ_MASK)) ||
   778			    rcu_is_cpu_rrupt_from_idle())
   779				rcu_report_exp_rdp(rdp);
   780			else
   781				rcu_exp_need_qs();
   782			return;
   783		}
   784	
   785		/*
   786		 * Third, the less-common case of being in an RCU read-side
   787		 * critical section.  In this case we can count on a future
   788		 * rcu_read_unlock().  However, this rcu_read_unlock() might
   789		 * execute on some other CPU, but in that case there will be
   790		 * a future context switch.  Either way, if the expedited
   791		 * grace period is still waiting on this CPU, set ->deferred_qs
   792		 * so that the eventual quiescent state will be reported.
   793		 * Note that there is a large group of race conditions that
   794		 * can have caused this quiescent state to already have been
   795		 * reported, so we really do need to check ->expmask.
   796		 */
   797		if (depth > 0) {
   798			raw_spin_lock_irqsave_rcu_node(rnp, flags);
   799			if (rnp->expmask & rdp->grpmask) {
 > 800				rcu_set_exp_qs_needed_cpu(rdp, true);
   801				t->rcu_read_unlock_special.b.exp_hint = true;
   802			}
   803			raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
   804			return;
   805		}
   806	
   807		// Fourth and finally, negative nesting depth should not happen.
   808		WARN_ON_ONCE(1);
   809	}
   810	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
