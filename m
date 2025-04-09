Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CDD261581;
	Wed,  9 Apr 2025 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203241; cv=none; b=Fn9DFjiQHvhovJuqB1hUft95Qt1ytQgl3pzyoC4g2K0MCAF9eG9yFoVLqGgkV/ixtYAtF2IY4vRKR9t5mXrHnhXDONLSFha7vSHi712gzzOxbmnqQchhlOykLKAE422HuvdGVkxRgroX6gi+r/gkKowh7VrIkjMy8xKtHUy9Orw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203241; c=relaxed/simple;
	bh=ypksjqm+QzQfj7CuKb6/FMj77al+HdwGkfKJTOLPGTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yte6+7gTNH1Xrlf9nI/1MhdyNNY5z39V307iKu1pjNe31z6zs4TKydJDPCSIgRgXXvhaG5yprboOPfXDauq5wT9UEQKSpe1F5DKBSlZwu5YlG5OLic9cdE5Y0As3G/CjHQI+rJ1g9bwNmkmydfkFlChd7kMzxmspA8bdDc0Q7X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9kV88W1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9kV88W1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744203240; x=1775739240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ypksjqm+QzQfj7CuKb6/FMj77al+HdwGkfKJTOLPGTU=;
  b=d9kV88W1D4uOddKMCd+QWq/rFWASVAcdB+EmrPDm80dK5FLlElLf/D0H
   dX+nrQ3nSAurNL+pP9ZErLWhQxPVo9fzQpuP3XFl5SbqdIjMpDvF4p2pF
   4BqSAEa0ZZwkDZBs+dPIUSpbAszlVj4tcspniLgdvNDLJnSocBxYwSKFj
   lMx3tzsiebHppYGmWKlp5Cp+z6OLJ1efhno00VhtMjhe5JqBya7nFeGAv
   Hd8Xtv1ZuPVwHdN7JWSwPXfTLPcGhoCPTbv0SyMZbHpK4BPQ7JiVYpweB
   NFc6JkKAHEb1LoWV2EcptHPLTliab4YAdJ0aG6rVbJK78HSIk8p8yFfpG
   w==;
X-CSE-ConnectionGUID: p8+Bh1IeTrK00BYM3E6UJQ==
X-CSE-MsgGUID: WMbVwIL4RkSf8lYY0hxZHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="57046448"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="57046448"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 05:53:56 -0700
X-CSE-ConnectionGUID: 0PBpHnfPQRKtM5VnI5Uajw==
X-CSE-MsgGUID: BXJCWsa+QAaLVGHXMEkeBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129095068"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2025 05:53:55 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2UwD-0008rJ-1n;
	Wed, 09 Apr 2025 12:53:53 +0000
Date: Wed, 9 Apr 2025 20:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:trylock 7/7] mm/slub.c:4678:7: warning: variable 'cnt' set
 but not used
Message-ID: <202504092003.65HDGAwY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   b334401991656ee5bb5bc3c042e35cef5820252f
commit: b334401991656ee5bb5bc3c042e35cef5820252f [7/7] slab: Introduce try_kmalloc() and kfree_nolock().
config: riscv-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504092003.65HDGAwY-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504092003.65HDGAwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504092003.65HDGAwY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.c:4678:7: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
    4678 |         long cnt = 0;
         |              ^
   1 warning generated.


vim +/cnt +4678 mm/slub.c

  4673	
  4674	#ifndef CONFIG_SLUB_TINY
  4675	static void free_deferred_objects(struct llist_head *llhead)
  4676	{
  4677		struct llist_node *llnode, *pos, *t;
> 4678		long cnt = 0;
  4679	
  4680		if (likely(llist_empty(llhead)))
  4681			return;
  4682	
  4683		llnode = llist_del_all(llhead);
  4684		llist_for_each_safe(pos, t, llnode) {
  4685			kfree(pos);
  4686			cnt++;
  4687		}
  4688	}
  4689	/*
  4690	 * Fastpath with forced inlining to produce a kfree and kmem_cache_free that
  4691	 * can perform fastpath freeing without additional function calls.
  4692	 *
  4693	 * The fastpath is only possible if we are freeing to the current cpu slab
  4694	 * of this processor. This typically the case if we have just allocated
  4695	 * the item before.
  4696	 *
  4697	 * If fastpath is not possible then fall back to __slab_free where we deal
  4698	 * with all sorts of special processing.
  4699	 *
  4700	 * Bulk free of a freelist with several objects (all pointing to the
  4701	 * same slab) possible by specifying head and tail ptr, plus objects
  4702	 * count (cnt). Bulk free indicated by tail pointer being set.
  4703	 */
  4704	static __always_inline void do_slab_free(struct kmem_cache *s,
  4705					struct slab *slab, void *head, void *tail,
  4706					int cnt, unsigned long addr)
  4707	{
  4708		struct kmem_cache_cpu *c;
  4709		unsigned long tid;
  4710		void **freelist;
  4711	
  4712	redo:
  4713		/*
  4714		 * Determine the currently cpus per cpu slab.
  4715		 * The cpu may change afterward. However that does not matter since
  4716		 * data is retrieved via this pointer. If we are on the same cpu
  4717		 * during the cmpxchg then the free will succeed.
  4718		 */
  4719		c = raw_cpu_ptr(s->cpu_slab);
  4720		tid = READ_ONCE(c->tid);
  4721	
  4722		/* Same with comment on barrier() in __slab_alloc_node() */
  4723		barrier();
  4724	
  4725		if (unlikely(slab != c->slab)) {
  4726			/* cnt == 0 signals that it's called from kfree_nolock() */
  4727			if (unlikely(!cnt)) {
  4728				/*
  4729				 * Use llist in cache_node ?
  4730				 * struct kmem_cache_node *n = get_node(s, slab_nid(slab));
  4731				 */
  4732				/*
  4733				 * __slab_free() can locklessly cmpxchg16 into a slab,
  4734				 * but then it might need to take spin_lock or local_lock
  4735				 * in put_cpu_partial() for further processing.
  4736				 * Avoid the complexity and simply add to a deferred list.
  4737				 */
  4738				llist_add(head, &s->defer_free_objects);
  4739			} else {
  4740				free_deferred_objects(&s->defer_free_objects);
  4741				__slab_free(s, slab, head, tail, cnt, addr);
  4742			}
  4743			return;
  4744		}
  4745	
  4746		if (USE_LOCKLESS_FAST_PATH()) {
  4747			freelist = READ_ONCE(c->freelist);
  4748	
  4749			set_freepointer(s, tail, freelist);
  4750	
  4751			if (unlikely(!__update_cpu_freelist_fast(s, freelist, head, tid))) {
  4752				note_cmpxchg_failure("slab_free", s, tid);
  4753				goto redo;
  4754			}
  4755		} else {
  4756			/* Update the free list under the local lock */
  4757			local_lock(&s->cpu_slab->lock);
  4758			c = this_cpu_ptr(s->cpu_slab);
  4759			if (unlikely(slab != c->slab)) {
  4760				local_unlock(&s->cpu_slab->lock);
  4761				goto redo;
  4762			}
  4763			tid = c->tid;
  4764			freelist = c->freelist;
  4765	
  4766			set_freepointer(s, tail, freelist);
  4767			c->freelist = head;
  4768			c->tid = next_tid(tid);
  4769	
  4770			local_unlock(&s->cpu_slab->lock);
  4771		}
  4772		if (unlikely(!cnt))
  4773			cnt = 1;
  4774		stat_add(s, FREE_FASTPATH, cnt);
  4775	}
  4776	#else /* CONFIG_SLUB_TINY */
  4777	static void do_slab_free(struct kmem_cache *s,
  4778					struct slab *slab, void *head, void *tail,
  4779					int cnt, unsigned long addr)
  4780	{
  4781		__slab_free(s, slab, head, tail, cnt, addr);
  4782	}
  4783	#endif /* CONFIG_SLUB_TINY */
  4784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
