Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF87027978C;
	Tue, 18 Nov 2025 01:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763430382; cv=none; b=uiniEQJ6vblcOKzu9JgBN4eQWWPJyrxWhmmSDCtR6GiVsXNerYyYVp3df8DGt0I6ULO8hIzNvaTpeQqFu/rFS/Bpv+bQ5x4//uK88jgd3/hHXD/bH7X15z/skXQcQbTHM3ay0Y/onQUrrYxZWhdNfqfDeqIEIOnvkjF4jaSrWD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763430382; c=relaxed/simple;
	bh=TqWCRMS2GM0j0BDVO9YWflwsDojtHYPkC0rKz0Lx+Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvCclipze0/xuRJ6/KfSaBMUBAHAfiXEGrKr11b2AmM3YVSy/pjUqRKOP1Y8T/QXEh794GMVehodst68MWknM1gMYLsX8si8wy/WK2bx8EZpXHXIKaU1CTG4W+ytYOdco98IX/gRXAD6i1TPvOcB7ORJDmGCoTk3pVjwkHY6HlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zw7uG/HL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zw7uG/HL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763430380; x=1794966380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TqWCRMS2GM0j0BDVO9YWflwsDojtHYPkC0rKz0Lx+Ng=;
  b=Zw7uG/HLyRFGIomOYGrE4O5VrGQLtallbzJuXr+5lKwv7B+qiHJUG3PD
   hjBQjIDm7FOQ4sS6rRfcyppc7zh+I6RCgpHTKME25jUAolvnxn9+pHVrA
   RcMjwIGXJWnA6DG1NxzkDiEhthse0kIxZPquRFPlvDehP4v0/lclkgQCc
   eI3WiIHaZxHZANPKMlAzFiiGWpI79sFScizSbX2qDrLYsDb3NLmK5wTFX
   nQ/8oKJVzOt0Myhdqs1cVRJiyPem/BCGY1RmzrNA/3105pWab5xK7vBzl
   oABsy819vZP5CZKhOTWNMMwZzNk7KHiH0imrPajQ6gc0JgXcWeHZu9/i4
   Q==;
X-CSE-ConnectionGUID: UhmBj4fMQ6SwyFxaCyazLw==
X-CSE-MsgGUID: 6IuDcWZNTtixj5KUkMzMTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65597301"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="65597301"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 17:46:16 -0800
X-CSE-ConnectionGUID: iUTn0HfHSH+9QLdbilzE9g==
X-CSE-MsgGUID: ejHM5zlVS1qUcLwrRFZ2RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="190848721"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2025 17:46:15 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLAnN-0001EL-2F;
	Tue, 18 Nov 2025 01:46:13 +0000
Date: Tue, 18 Nov 2025 09:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/5] sched/core: Track blocked tasks retained on rq
 for proxy
Message-ID: <202511180828.6BVP2q32-lkp@intel.com>
References: <20251117185550.365156-4-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117185550.365156-4-kprateek.nayak@amd.com>

Hi Prateek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 33cf66d88306663d16e4759e9d24766b0aaa2e17]

url:    https://github.com/intel-lab-lkp/linux/commits/K-Prateek-Nayak/sched-psi-Make-psi-stubs-consistent-for-CONFIG_PSI/20251118-030832
base:   33cf66d88306663d16e4759e9d24766b0aaa2e17
patch link:    https://lore.kernel.org/r/20251117185550.365156-4-kprateek.nayak%40amd.com
patch subject: [RFC PATCH 3/5] sched/core: Track blocked tasks retained on rq for proxy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251118/202511180828.6BVP2q32-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180828.6BVP2q32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180828.6BVP2q32-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:6681:37: error: parameter 'p' was not declared, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    6681 | static inline void clear_task_proxy(p) { }
         |                                     ^
>> kernel/sched/core.c:6681:20: error: a function definition without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
    6681 | static inline void clear_task_proxy(p) { }
         |                    ^
>> kernel/sched/core.c:6681:20: error: conflicting types for 'clear_task_proxy'
   kernel/sched/core.c:3663:20: note: previous declaration is here
    3663 | static inline void clear_task_proxy(struct task_struct *p);
         |                    ^
>> kernel/sched/core.c:6681:20: error: a function definition without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
    6681 | static inline void clear_task_proxy(p) { }
         |                    ^
   kernel/sched/core.c:7764:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7764 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7739:1: note: array 'preempt_modes' declared here
    7739 | const char *preempt_modes[] = {
         | ^
   1 warning and 4 errors generated.


vim +6681 kernel/sched/core.c

  6557	
  6558	/*
  6559	 * Find runnable lock owner to proxy for mutex blocked donor
  6560	 *
  6561	 * Follow the blocked-on relation:
  6562	 *   task->blocked_on -> mutex->owner -> task...
  6563	 *
  6564	 * Lock order:
  6565	 *
  6566	 *   p->pi_lock
  6567	 *     rq->lock
  6568	 *       mutex->wait_lock
  6569	 *
  6570	 * Returns the task that is going to be used as execution context (the one
  6571	 * that is actually going to be run on cpu_of(rq)).
  6572	 */
  6573	static struct task_struct *
  6574	find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
  6575	{
  6576		struct task_struct *owner = NULL;
  6577		int this_cpu = cpu_of(rq);
  6578		struct task_struct *p;
  6579		struct mutex *mutex;
  6580	
  6581		/* Follow blocked_on chain. */
  6582		for (p = donor; task_is_blocked(p); p = owner) {
  6583			mutex = p->blocked_on;
  6584			/* Something changed in the chain, so pick again */
  6585			if (!mutex)
  6586				return NULL;
  6587			/*
  6588			 * By taking mutex->wait_lock we hold off concurrent mutex_unlock()
  6589			 * and ensure @owner sticks around.
  6590			 */
  6591			guard(raw_spinlock)(&mutex->wait_lock);
  6592	
  6593			/* Check again that p is blocked with wait_lock held */
  6594			if (mutex != __get_task_blocked_on(p)) {
  6595				/*
  6596				 * Something changed in the blocked_on chain and
  6597				 * we don't know if only at this level. So, let's
  6598				 * just bail out completely and let __schedule()
  6599				 * figure things out (pick_again loop).
  6600				 */
  6601				return NULL;
  6602			}
  6603	
  6604			owner = __mutex_owner(mutex);
  6605			if (!owner) {
  6606				__clear_task_blocked_on(p, mutex);
  6607				return p;
  6608			}
  6609	
  6610			if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed) {
  6611				/* XXX Don't handle blocked owners/delayed dequeue yet */
  6612				return proxy_deactivate(rq, donor);
  6613			}
  6614	
  6615			if (task_cpu(owner) != this_cpu) {
  6616				/* XXX Don't handle migrations yet */
  6617				return proxy_deactivate(rq, donor);
  6618			}
  6619	
  6620			if (task_on_rq_migrating(owner)) {
  6621				/*
  6622				 * One of the chain of mutex owners is currently migrating to this
  6623				 * CPU, but has not yet been enqueued because we are holding the
  6624				 * rq lock. As a simple solution, just schedule rq->idle to give
  6625				 * the migration a chance to complete. Much like the migrate_task
  6626				 * case we should end up back in find_proxy_task(), this time
  6627				 * hopefully with all relevant tasks already enqueued.
  6628				 */
  6629				return proxy_resched_idle(rq);
  6630			}
  6631	
  6632			/*
  6633			 * Its possible to race where after we check owner->on_rq
  6634			 * but before we check (owner_cpu != this_cpu) that the
  6635			 * task on another cpu was migrated back to this cpu. In
  6636			 * that case it could slip by our  checks. So double check
  6637			 * we are still on this cpu and not migrating. If we get
  6638			 * inconsistent results, try again.
  6639			 */
  6640			if (!task_on_rq_queued(owner) || task_cpu(owner) != this_cpu)
  6641				return NULL;
  6642	
  6643			if (owner == p) {
  6644				/*
  6645				 * It's possible we interleave with mutex_unlock like:
  6646				 *
  6647				 *				lock(&rq->lock);
  6648				 *				  find_proxy_task()
  6649				 * mutex_unlock()
  6650				 *   lock(&wait_lock);
  6651				 *   donor(owner) = current->blocked_donor;
  6652				 *   unlock(&wait_lock);
  6653				 *
  6654				 *   wake_up_q();
  6655				 *     ...
  6656				 *       ttwu_runnable()
  6657				 *         __task_rq_lock()
  6658				 *				  lock(&wait_lock);
  6659				 *				  owner == p
  6660				 *
  6661				 * Which leaves us to finish the ttwu_runnable() and make it go.
  6662				 *
  6663				 * So schedule rq->idle so that ttwu_runnable() can get the rq
  6664				 * lock and mark owner as running.
  6665				 */
  6666				return proxy_resched_idle(rq);
  6667			}
  6668			/*
  6669			 * OK, now we're absolutely sure @owner is on this
  6670			 * rq, therefore holding @rq->lock is sufficient to
  6671			 * guarantee its existence, as per ttwu_remote().
  6672			 */
  6673		}
  6674	
  6675		WARN_ON_ONCE(owner && !owner->on_rq);
  6676		return owner;
  6677	}
  6678	#else /* SCHED_PROXY_EXEC */
  6679	bool is_proxy_task(struct task_struct *p) { return false; }
  6680	static inline void set_task_proxy(struct task_struct *p) { }
> 6681	static inline void clear_task_proxy(p) { }
  6682	static struct task_struct *
  6683	find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
  6684	{
  6685		WARN_ONCE(1, "This should never be called in the !SCHED_PROXY_EXEC case\n");
  6686		return donor;
  6687	}
  6688	#endif /* SCHED_PROXY_EXEC */
  6689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
