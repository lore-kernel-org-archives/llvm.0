Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915B9274FDC;
	Tue, 11 Nov 2025 14:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871386; cv=none; b=nupzvgE5yN8fMEzm233QASOkaRc+j+rlRnFYjWa8CasOj6uvp/Rmxzrr0P402Sl4NaZMWN6eDKZsITBQPWHQprBqIFJteQctpzC/gmXyLEDkfYjq3X6d0RkEABT0GYNV+HyLN3DTZZbmpLObMiYosCd8J3jgNfqduEHv1UDdw/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871386; c=relaxed/simple;
	bh=dQdc5lkChETm5mS6bGw4LxgMvCyocfkrTPE4kb3Fumw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gjZ3IK/peMDbfdfgqhpBaPul1LLWVcT9ziHMzNrUiLoRj2CA461rTBCFcJ+4zROqDbY11rdRiRjevXFN2fKgznOu+PTMh70xP7Av6WmKqtEBeSWGwvz8h3sfV1Csawo8PU2nljssM8s8UgEGPiJFvhfW80EwrNDP0h7GQFlyaS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6dV0xGJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6dV0xGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762871385; x=1794407385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dQdc5lkChETm5mS6bGw4LxgMvCyocfkrTPE4kb3Fumw=;
  b=A6dV0xGJJM1ptywckGn/GEiL5N+vGuLm5jLnwIyr6ZM8oh/2XVKQ6XP0
   TIB+X20PRAoftK6hk+mrklm4vC1RuomOtB9H2HeZJILONvsEadF1ua4pt
   Uj38Qpmh8cbuoK4M+3qiobJHdNXf8Rg7HWwnle2CwaKe6UtQuiGt31Sm/
   VRH3+NMA+NKW8HXopFP6xzr5rxdlHB7M4s1HhJIGOuouZoLqUbBCfSdiu
   XzhjURnwiwG0FVTDv/9+EU5eidB+smV3jGvw4gXtfINLAKtr15LH8PnIN
   r3J7GPPULEShtXYsG2M01oAYKnG9i/TvJQAWru+KO6QFpqiw0kEpEGGar
   Q==;
X-CSE-ConnectionGUID: qJSjsOqTQOezgPiz9fEyVw==
X-CSE-MsgGUID: o5ee+ju9RH+LO2AJbblPbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64851005"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64851005"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 06:29:44 -0800
X-CSE-ConnectionGUID: WSYI8NpuTSez1498J8sAAQ==
X-CSE-MsgGUID: dYuWJk7KQs6Xk8G/u4UpPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="188288859"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Nov 2025 06:29:43 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIpNM-0003Ed-1Q;
	Tue, 11 Nov 2025 14:29:40 +0000
Date: Tue, 11 Nov 2025 22:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 6/10]
 kernel/cgroup/cpuset.c:4339:13: warning: variable 'allowed' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202511112256.k3RvmZ7Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/linus
head:   c74a85115777a0e4ff7ba671c4631adb4ba32ecc
commit: 81b4628c13856d1bc84678ed6655180ca0554688 [6/10] cpuset: introduce cpuset.mems.default
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251111/202511112256.k3RvmZ7Q-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511112256.k3RvmZ7Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511112256.k3RvmZ7Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:4339:13: warning: variable 'allowed' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    4339 |         } else if (node_isset(node, current->mems_default))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:149:36: note: expanded from macro 'node_isset'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:60:29: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:2: note: expanded from macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      47 |          const##op(nr, addr) : op(nr, addr))
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4342:6: note: uninitialized use occurs here
    4342 |         if (allowed)
         |             ^~~~~~~
   kernel/cgroup/cpuset.c:4339:9: note: remove the 'if' if its condition is always true
    4339 |         } else if (node_isset(node, current->mems_default))
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4340 |                 allowed = true;
   kernel/cgroup/cpuset.c:4327:14: note: initialize the variable 'allowed' to silence this warning
    4327 |         bool allowed;                   /* is allocation in zone z allowed? */
         |                     ^
         |                      = 0
   1 warning generated.


vim +4339 kernel/cgroup/cpuset.c

  4282	
  4283	/*
  4284	 * cpuset_current_node_allowed - Can current task allocate on a memory node?
  4285	 * @node: is this an allowed node?
  4286	 * @gfp_mask: memory allocation flags
  4287	 *
  4288	 * If we're in interrupt, yes, we can always allocate.  If @node is set in
  4289	 * current's mems_default, yes.  If it's not a __GFP_HARDWALL request and this
  4290	 * node is set in the nearest hardwalled cpuset ancestor to current's cpuset,
  4291	 * yes.  If current has access to memory reserves as an oom victim, yes.
  4292	 * Otherwise, no.
  4293	 *
  4294	 * GFP_USER allocations are marked with the __GFP_HARDWALL bit,
  4295	 * and do not allow allocations outside the current tasks cpuset
  4296	 * unless the task has been OOM killed.
  4297	 * GFP_KERNEL allocations are not so marked, so can escape to the
  4298	 * nearest enclosing hardwalled ancestor cpuset.
  4299	 *
  4300	 * Scanning up parent cpusets requires callback_lock.  The
  4301	 * __alloc_pages() routine only calls here with __GFP_HARDWALL bit
  4302	 * _not_ set if it's a GFP_KERNEL allocation, and all nodes in the
  4303	 * current tasks mems_default came up empty on the first pass over
  4304	 * the zonelist.  So only GFP_KERNEL allocations, if all nodes in the
  4305	 * cpuset are short of memory, might require taking the callback_lock.
  4306	 *
  4307	 * The first call here from mm/page_alloc:get_page_from_freelist()
  4308	 * has __GFP_HARDWALL set in gfp_mask, enforcing hardwall cpusets,
  4309	 * so no allocation on a node outside the cpuset is allowed (unless
  4310	 * in interrupt, of course).
  4311	 *
  4312	 * The second pass through get_page_from_freelist() doesn't even call
  4313	 * here for GFP_ATOMIC calls.  For those calls, the __alloc_pages()
  4314	 * variable 'wait' is not set, and the bit ALLOC_CPUSET is not set
  4315	 * in alloc_flags.  That logic and the checks below have the combined
  4316	 * affect that:
  4317	 *	in_interrupt - any node ok (current task context irrelevant)
  4318	 *	GFP_ATOMIC   - any node ok
  4319	 *	tsk_is_oom_victim   - any node ok
  4320	 *	GFP_KERNEL   - any node in enclosing hardwalled cpuset ok
  4321	 *	GFP_USER     - only nodes in current tasks mems allowed ok.
  4322	 *	GFP_PROTECTED - allow non-sysram nodes in mems_allowed
  4323	 */
  4324	bool cpuset_current_node_allowed(int node, gfp_t gfp_mask)
  4325	{
  4326		struct cpuset *cs;		/* current cpuset ancestors */
  4327		bool allowed;			/* is allocation in zone z allowed? */
  4328		unsigned long flags;
  4329		bool protected_node = gfp_mask & __GFP_PROTECTED;
  4330	
  4331		if (in_interrupt())
  4332			return true;
  4333	
  4334		if (protected_node) {
  4335			rcu_read_lock();
  4336			cs = task_cs(current);
  4337			allowed = node_isset(node, cs->mems_allowed);
  4338			rcu_read_unlock();
> 4339		} else if (node_isset(node, current->mems_default))
  4340			allowed = true;
  4341	
  4342		if (allowed)
  4343			return allowed;
  4344	
  4345		/*
  4346		 * Allow tasks that have access to memory reserves because they have
  4347		 * been OOM killed to get memory anywhere.
  4348		 */
  4349		if (unlikely(tsk_is_oom_victim(current)))
  4350			return true;
  4351		if (gfp_mask & __GFP_HARDWALL)	/* If hardwall request, stop here */
  4352			return false;
  4353	
  4354		if (current->flags & PF_EXITING) /* Let dying task have memory */
  4355			return true;
  4356	
  4357		/* Not hardwall and node outside mems_allowed: scan up cpusets */
  4358		spin_lock_irqsave(&callback_lock, flags);
  4359	
  4360		cs = nearest_hardwall_ancestor(task_cs(current));
  4361		allowed = node_isset(node, cs->mems_allowed); /* include protected */
  4362		if (!protected_node && !nodes_empty(mt_sysram_nodelist))
  4363			allowed &= node_isset(node, mt_sysram_nodelist);
  4364	
  4365		spin_unlock_irqrestore(&callback_lock, flags);
  4366		return allowed;
  4367	}
  4368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
