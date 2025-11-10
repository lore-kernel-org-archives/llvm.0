Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BAF2E63C;
	Mon, 10 Nov 2025 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772818; cv=none; b=lTIiD7oUWJcZQlcu/L7wVec+tiZXPG/hP78Q7aBH8i18oCyuCIwOQzUSrPorsvXaUv6Y8UfPX6R3Bn9Kcltqvz8r3tJTRU87874kRG1PuKKZb0keN7Jr9vE3CUHoO9p1VJQiLBGFSpJGCpxcCdKXxXdv0HrYVNIwRr9Ys9qGPQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772818; c=relaxed/simple;
	bh=3dtrJOLt4pVzfd0aiHNwJw0gh3JQvmfB8Y8YnOteeXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6ETlq3HF5OWoq8cKjmITac7bD6vYZgh7Q2R1XiDVgk3uXIrjfJHOVrCPG8tW12CXPAQNKXzYTxuyajWoyjGPA5n1MaY5ZCvFVZBdgJ2BVqK288+eCA2mw5L5xBPFIxI6jw3SiE4PmC6LFUojejsHTVcinFcrWlKB+X9ZX85wWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXj0XeXR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXj0XeXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762772816; x=1794308816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3dtrJOLt4pVzfd0aiHNwJw0gh3JQvmfB8Y8YnOteeXc=;
  b=aXj0XeXRN1xvh0D/WQkhB8p1NL8fIulF2u0QEH2YW/WZqGbbvQJM6ouh
   mts82UeVXFoYBXVQbCsD4BtlOKRuw6ohsqqqwQASQRiewPfI4FX0ztpNs
   jEZQu36WCEzCjlbBCIfDjD3mYrBl9CkuS+SiVIp7qpxZh5xS6dPCEHwGR
   7AjC4zalDZP8Svm6TfQxpTWi6Q3sEtgH0LqWsExCWASfZc8Xhzk3QfwAj
   jhqi//Svehm7a549aDlx1eLPdY/JNCE1EiTIVYmF0ixEelASw3ZyJWfNV
   ROHCVaSQA4LLwlo9Gjs2cnG2pOzcEp2mP5Ab3TY2NpwZNVIePiQvdo+Y4
   w==;
X-CSE-ConnectionGUID: Gv7kOa68Ssq3HeRxmyq1Og==
X-CSE-MsgGUID: yZBlQNW1TmKVN75BbdWufg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="76271823"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="76271823"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 03:06:56 -0800
X-CSE-ConnectionGUID: 4JlmjJsZQRKY8NXQ6qpTJg==
X-CSE-MsgGUID: yR3RTmWeQvuZhVoUUogRjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="187899859"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 10 Nov 2025 03:06:55 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vIPjY-0000000040q-3NiP;
	Mon, 10 Nov 2025 11:06:52 +0000
Date: Mon, 10 Nov 2025 12:06:42 +0100
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 7/11]
 kernel/cgroup/cpuset.c:4352:13: warning: variable 'allowed' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202511101223.U1RZPX3x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/linus
head:   67062e895b94cd27af5fa58d8a567086a53d0914
commit: 2c5eedd6cd1524843e21a0e1ec1d1c8d9fd78e14 [7/11] cpuset: introduce cpuset.mems.default
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251110/202511101223.U1RZPX3x-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511101223.U1RZPX3x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511101223.U1RZPX3x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:4352:13: warning: variable 'allowed' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    4352 |         } else if (node_isset(node, current->mems_default))
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
   kernel/cgroup/cpuset.c:4355:6: note: uninitialized use occurs here
    4355 |         if (allowed)
         |             ^~~~~~~
   kernel/cgroup/cpuset.c:4352:9: note: remove the 'if' if its condition is always true
    4352 |         } else if (node_isset(node, current->mems_default))
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4353 |                 allowed = true;
   kernel/cgroup/cpuset.c:4340:14: note: initialize the variable 'allowed' to silence this warning
    4340 |         bool allowed;                   /* is allocation in zone z allowed? */
         |                     ^
         |                      = 0
   1 warning generated.


vim +4352 kernel/cgroup/cpuset.c

  4295	
  4296	/*
  4297	 * cpuset_current_node_allowed - Can current task allocate on a memory node?
  4298	 * @node: is this an allowed node?
  4299	 * @gfp_mask: memory allocation flags
  4300	 *
  4301	 * If we're in interrupt, yes, we can always allocate.  If @node is set in
  4302	 * current's mems_default, yes.  If it's not a __GFP_HARDWALL request and this
  4303	 * node is set in the nearest hardwalled cpuset ancestor to current's cpuset,
  4304	 * yes.  If current has access to memory reserves as an oom victim, yes.
  4305	 * Otherwise, no.
  4306	 *
  4307	 * GFP_USER allocations are marked with the __GFP_HARDWALL bit,
  4308	 * and do not allow allocations outside the current tasks cpuset
  4309	 * unless the task has been OOM killed.
  4310	 * GFP_KERNEL allocations are not so marked, so can escape to the
  4311	 * nearest enclosing hardwalled ancestor cpuset.
  4312	 *
  4313	 * Scanning up parent cpusets requires callback_lock.  The
  4314	 * __alloc_pages() routine only calls here with __GFP_HARDWALL bit
  4315	 * _not_ set if it's a GFP_KERNEL allocation, and all nodes in the
  4316	 * current tasks mems_default came up empty on the first pass over
  4317	 * the zonelist.  So only GFP_KERNEL allocations, if all nodes in the
  4318	 * cpuset are short of memory, might require taking the callback_lock.
  4319	 *
  4320	 * The first call here from mm/page_alloc:get_page_from_freelist()
  4321	 * has __GFP_HARDWALL set in gfp_mask, enforcing hardwall cpusets,
  4322	 * so no allocation on a node outside the cpuset is allowed (unless
  4323	 * in interrupt, of course).
  4324	 *
  4325	 * The second pass through get_page_from_freelist() doesn't even call
  4326	 * here for GFP_ATOMIC calls.  For those calls, the __alloc_pages()
  4327	 * variable 'wait' is not set, and the bit ALLOC_CPUSET is not set
  4328	 * in alloc_flags.  That logic and the checks below have the combined
  4329	 * affect that:
  4330	 *	in_interrupt - any node ok (current task context irrelevant)
  4331	 *	GFP_ATOMIC   - any node ok
  4332	 *	tsk_is_oom_victim   - any node ok
  4333	 *	GFP_KERNEL   - any node in enclosing hardwalled cpuset ok
  4334	 *	GFP_USER     - only nodes in current tasks mems allowed ok.
  4335	 *	GFP_PROTECTED - allow non-sysram nodes in mems_allowed
  4336	 */
  4337	bool cpuset_current_node_allowed(int node, gfp_t gfp_mask)
  4338	{
  4339		struct cpuset *cs;		/* current cpuset ancestors */
  4340		bool allowed;			/* is allocation in zone z allowed? */
  4341		unsigned long flags;
  4342		bool protected_node = gfp_mask & __GFP_PROTECTED;
  4343	
  4344		if (in_interrupt())
  4345			return true;
  4346	
  4347		if (protected_node) {
  4348			rcu_read_lock();
  4349			cs = task_cs(current);
  4350			allowed = node_isset(node, cs->mems_allowed);
  4351			rcu_read_unlock();
> 4352		} else if (node_isset(node, current->mems_default))
  4353			allowed = true;
  4354	
  4355		if (allowed)
  4356			return allowed;
  4357	
  4358		/*
  4359		 * Allow tasks that have access to memory reserves because they have
  4360		 * been OOM killed to get memory anywhere.
  4361		 */
  4362		if (unlikely(tsk_is_oom_victim(current)))
  4363			return true;
  4364		if (gfp_mask & __GFP_HARDWALL)	/* If hardwall request, stop here */
  4365			return false;
  4366	
  4367		if (current->flags & PF_EXITING) /* Let dying task have memory */
  4368			return true;
  4369	
  4370		/* Not hardwall and node outside mems_allowed: scan up cpusets */
  4371		spin_lock_irqsave(&callback_lock, flags);
  4372	
  4373		cs = nearest_hardwall_ancestor(task_cs(current));
  4374		allowed = node_isset(node, cs->mems_allowed); /* include protected */
  4375		if (!protected_node && !nodes_empty(default_sysram_nodelist))
  4376			allowed &= node_isset(node, default_sysram_nodelist);
  4377	
  4378		spin_unlock_irqrestore(&callback_lock, flags);
  4379		return allowed;
  4380	}
  4381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
