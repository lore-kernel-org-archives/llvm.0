Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDF32E3715;
	Wed, 16 Jul 2025 04:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752640316; cv=none; b=JYuVDZUCH7lHGJxt2tkQacc+oBC7dIed1kuLmZzxoObTRbizb10BA2ynupHruGtf5LEOLvcT7RK7j4mtoyDJG6S5jNnMjtRekeppGAJ2d1cStVDQyBIGqiKPv2WyKq0UTgNxvpRNEqiEe35IjdwTHrrdTvEXBooNHGbwD95s7/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752640316; c=relaxed/simple;
	bh=Ln4J5E/BeZw9HE/lQlDMc6lM4tzcm7ldrBdzWyUyjD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VWNKtrwEARy+jbRJspip79jqPIevJd50TGSr1nFwXn6TrYhzfIW7dOtv0l6rHSmfjOwSVLV34GhA7fdaMOWvNvSxZvXkNHeINWVtoWMWaqkBN+cHCvVGbOn2ix4+fruU2k6k/WaWYsHGAewCgoGbOrA4e9Fb18ZUklmMF9WGAm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRFapip3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRFapip3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752640315; x=1784176315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ln4J5E/BeZw9HE/lQlDMc6lM4tzcm7ldrBdzWyUyjD4=;
  b=aRFapip3utyOSCGVfPPeZlKo4IHyfyRqkEBEAWtZadd2rOJsBIPhcbRG
   CmILOuk+6pSoHnlDoZB4YxVl5itur02e+2CZFERlZ7EAwcqlaGso9L77K
   0shi4vtHuoglsQA5OiuQwpdKH9KPv9JZi56R+5vlkSOeI3wizlgX98vYJ
   H08zDgikNsyszpKk7osguN9cfJRffeMbO+OC7qKYPelGdoMh+/dV2eyfn
   lS19ZmBL/jxYG/UTlDjyp0M0Go3cYgCgicUQMp3vC1uhRT7MBvqB01z5Z
   Kck1aIDAJdQ7Q8QhPgwE1xYgh62Pu1chjUYEu+W38bbJRex8wKhBAxAIg
   w==;
X-CSE-ConnectionGUID: oI8Sz99cTfadWy8mIq8NcQ==
X-CSE-MsgGUID: R3i+1cECSIyaNPMYKseaKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54730213"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="54730213"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 21:31:21 -0700
X-CSE-ConnectionGUID: 7ZEdwqn8RaiPPWKvQ2zxag==
X-CSE-MsgGUID: IibrcPq9TLGQHWK8zfQr7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="161423008"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jul 2025 21:31:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubtnY-000Bsl-3A;
	Wed, 16 Jul 2025 04:31:16 +0000
Date: Wed, 16 Jul 2025 12:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:kmalloc_nolock 5/7] mm/slub.c:3810:2: error: call to
 undeclared function 'local_lock_cpu_slab'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202507161241.yjwptcLV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git kmalloc_nolock
head:   412a51611b2bfab5078bbb42e31a8a6fd8825d26
commit: 6597426343b43014fa731a8fac79f7b7da7d691a [5/7] slab: Introduce kmalloc_nolock() and kfree_nolock().
config: i386-buildonly-randconfig-002-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161241.yjwptcLV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161241.yjwptcLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161241.yjwptcLV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:3810:2: error: call to undeclared function 'local_lock_cpu_slab'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3810 |         local_lock_cpu_slab(s, &flags);
         |         ^
>> mm/slub.c:3813:3: error: call to undeclared function 'local_unlock_cpu_slab'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3813 |                 local_unlock_cpu_slab(s, &flags);
         |                 ^
   mm/slub.c:3825:3: error: call to undeclared function 'local_unlock_cpu_slab'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3825 |                 local_unlock_cpu_slab(s, &flags);
         |                 ^
   mm/slub.c:3844:2: error: call to undeclared function 'local_unlock_cpu_slab'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3844 |         local_unlock_cpu_slab(s, &flags);
         |         ^
   mm/slub.c:4917:3: error: call to undeclared function 'local_lock_cpu_slab'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4917 |                 local_lock_cpu_slab(s, &flags);
         |                 ^
   mm/slub.c:4930:3: error: call to undeclared function 'local_unlock_cpu_slab'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4930 |                 local_unlock_cpu_slab(s, &flags);
         |                 ^
   6 errors generated.


vim +/local_lock_cpu_slab +3810 mm/slub.c

  3738	
  3739	/*
  3740	 * Slow path. The lockless freelist is empty or we need to perform
  3741	 * debugging duties.
  3742	 *
  3743	 * Processing is still very fast if new objects have been freed to the
  3744	 * regular freelist. In that case we simply take over the regular freelist
  3745	 * as the lockless freelist and zap the regular freelist.
  3746	 *
  3747	 * If that is not working then we fall back to the partial lists. We take the
  3748	 * first element of the freelist as the object to allocate now and move the
  3749	 * rest of the freelist to the lockless freelist.
  3750	 *
  3751	 * And if we were unable to get a new slab from the partial slab lists then
  3752	 * we need to allocate a new slab. This is the slowest path since it involves
  3753	 * a call to the page allocator and the setup of a new slab.
  3754	 *
  3755	 * Version of __slab_alloc to use when we know that preemption is
  3756	 * already disabled (which is the case for bulk allocation).
  3757	 */
  3758	static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
  3759				  unsigned long addr, struct kmem_cache_cpu *c, unsigned int orig_size)
  3760	{
  3761		bool allow_spin = gfpflags_allow_spinning(gfpflags);
  3762		void *freelist;
  3763		struct slab *slab;
  3764		unsigned long flags;
  3765		struct partial_context pc;
  3766		bool try_thisnode = true;
  3767	
  3768		stat(s, ALLOC_SLOWPATH);
  3769	
  3770	reread_slab:
  3771	
  3772		slab = READ_ONCE(c->slab);
  3773		if (!slab) {
  3774			/*
  3775			 * if the node is not online or has no normal memory, just
  3776			 * ignore the node constraint
  3777			 */
  3778			if (unlikely(node != NUMA_NO_NODE &&
  3779				     !node_isset(node, slab_nodes)))
  3780				node = NUMA_NO_NODE;
  3781			goto new_slab;
  3782		}
  3783	
  3784		if (unlikely(!node_match(slab, node))) {
  3785			/*
  3786			 * same as above but node_match() being false already
  3787			 * implies node != NUMA_NO_NODE.
  3788			 * Reentrant slub cannot take locks necessary to
  3789			 * deactivate_slab, hence ignore node preference.
  3790			 * kmalloc_nolock() doesn't allow __GFP_THISNODE.
  3791			 */
  3792			if (!node_isset(node, slab_nodes) ||
  3793			    !allow_spin) {
  3794				node = NUMA_NO_NODE;
  3795			} else {
  3796				stat(s, ALLOC_NODE_MISMATCH);
  3797				goto deactivate_slab;
  3798			}
  3799		}
  3800	
  3801		/*
  3802		 * By rights, we should be searching for a slab page that was
  3803		 * PFMEMALLOC but right now, we are losing the pfmemalloc
  3804		 * information when the page leaves the per-cpu allocator
  3805		 */
  3806		if (unlikely(!pfmemalloc_match(slab, gfpflags) && allow_spin))
  3807			goto deactivate_slab;
  3808	
  3809		/* must check again c->slab in case we got preempted and it changed */
> 3810		local_lock_cpu_slab(s, &flags);
  3811	
  3812		if (unlikely(slab != c->slab)) {
> 3813			local_unlock_cpu_slab(s, &flags);
  3814			goto reread_slab;
  3815		}
  3816		freelist = c->freelist;
  3817		if (freelist)
  3818			goto load_freelist;
  3819	
  3820		freelist = get_freelist(s, slab);
  3821	
  3822		if (!freelist) {
  3823			c->slab = NULL;
  3824			c->tid = next_tid(c->tid);
  3825			local_unlock_cpu_slab(s, &flags);
  3826			stat(s, DEACTIVATE_BYPASS);
  3827			goto new_slab;
  3828		}
  3829	
  3830		stat(s, ALLOC_REFILL);
  3831	
  3832	load_freelist:
  3833	
  3834		lockdep_assert_held(this_cpu_ptr(&s->cpu_slab->lock));
  3835	
  3836		/*
  3837		 * freelist is pointing to the list of objects to be used.
  3838		 * slab is pointing to the slab from which the objects are obtained.
  3839		 * That slab must be frozen for per cpu allocations to work.
  3840		 */
  3841		VM_BUG_ON(!c->slab->frozen);
  3842		c->freelist = get_freepointer(s, freelist);
  3843		c->tid = next_tid(c->tid);
  3844		local_unlock_cpu_slab(s, &flags);
  3845		return freelist;
  3846	
  3847	deactivate_slab:
  3848	
  3849		local_lock_cpu_slab(s, &flags);
  3850		if (slab != c->slab) {
  3851			local_unlock_cpu_slab(s, &flags);
  3852			goto reread_slab;
  3853		}
  3854		freelist = c->freelist;
  3855		c->slab = NULL;
  3856		c->freelist = NULL;
  3857		c->tid = next_tid(c->tid);
  3858		local_unlock_cpu_slab(s, &flags);
  3859		deactivate_slab(s, slab, freelist);
  3860	
  3861	new_slab:
  3862	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
