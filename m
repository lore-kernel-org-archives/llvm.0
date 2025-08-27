Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC4B801;
	Wed, 27 Aug 2025 00:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756253520; cv=none; b=k+tZbbKcMlUSb7RLof7PGvrHvot6p+NDxwt675h0pRl3mk9wFKN8OjuB7OWeVR+UJVNa+hDooikavD6iXzFG8dA54ptS+LX0D0SfAt+MWjyoDImYqXcTAAE+ohDLqEcQSm35y3Oj7axrs1dXe9xBtP47haqR7PlowWhhvyFd1k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756253520; c=relaxed/simple;
	bh=kYq4pPZmuhx2i66OXf/o5NxlVeUf781bZNfXOPxDsUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d9U+D/dc3CamG+Jgpyg5LdLo3tRUuedLsyPHC2mCNWf3FfOTARqqQ+BLvprqOqaQrIyeENtB7XQSVkCRm8IXLQTtLHI7VtvZ2sGr7JZmWQMBPrxDdqP1wMYK+rQ742uNNrzgGzBENGjfOruQf2O283D0pAmkfFreW1sJ15dvKZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkMhd0CE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkMhd0CE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756253518; x=1787789518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kYq4pPZmuhx2i66OXf/o5NxlVeUf781bZNfXOPxDsUs=;
  b=SkMhd0CEeK/pQwgCz1gX+YsrHb2OHyVk+Zvga2MOqtcDK7LW5M109NFH
   ZGy/7AsMBUkdIdp+ppNl3Ct9Y86DlRzY3Ch6/ZS504QB6smXFJbp44Vt5
   ptg3UQ0mZoXAwMWuSsQHghzHE1xxrXpSD61Vs0XMs1ZHlUrk1bLomlJzC
   qRWqKUK7wmjV6qNGVfO6ofmThOXGwvaofqtc4b5sU2meNgwBuZuX4dPgh
   XBB5IcTzV1TDuXacS8YGn2HDICIcRpVyaUoSzoUsN9QqKhoLQRFZyVBNs
   wwSqAA2R3vd2Yddz+xVq/IUoSXjJsm0mj8IF7d5e5SlGxqQq+bdjBcX0E
   Q==;
X-CSE-ConnectionGUID: u/oVqFmSR/6EJpZFcAKbLQ==
X-CSE-MsgGUID: okftFi8fTG+0VtHwS5dX+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58567048"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58567048"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 17:11:55 -0700
X-CSE-ConnectionGUID: ZzuTzCVZSTetWv9r7QpFiw==
X-CSE-MsgGUID: d0MyrVefRTqq4JwZvhD+aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169216874"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Aug 2025 17:11:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur3lY-000SW7-03;
	Wed, 27 Aug 2025 00:11:52 +0000
Date: Wed, 27 Aug 2025 08:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-sheaves-v6r0 3/15] mm/slub.c:4622:2: error: no
 member named 'dep_map' in 'local_trylock_t'
Message-ID: <202508270822.YcObEv8L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v6r0
head:   849dd5f00d4107b14da6fdd07b026e8950a3c763
commit: af6e1c57c858adcf8b0521760981afd9149b206e [3/15] slab: add opt-in caching layer of percpu sheaves
config: i386-buildonly-randconfig-004-20250827 (https://download.01.org/0day-ci/archive/20250827/202508270822.YcObEv8L-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508270822.YcObEv8L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508270822.YcObEv8L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:4622:2: error: no member named 'dep_map' in 'local_trylock_t'
    4622 |         lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:54: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                               ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:171:25: note: expanded from macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/slub.c:5236:2: error: no member named 'dep_map' in 'local_trylock_t'
    5236 |         lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:54: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                               ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:171:25: note: expanded from macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/slub.c:5285:2: error: no member named 'dep_map' in 'local_trylock_t'
    5285 |         lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:54: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                               ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:171:25: note: expanded from macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   3 errors generated.


vim +4622 mm/slub.c

  4606	
  4607	/*
  4608	 * Replace the empty main sheaf with a (at least partially) full sheaf.
  4609	 *
  4610	 * Must be called with the cpu_sheaves local lock locked. If successful, returns
  4611	 * the pcs pointer and the local lock locked (possibly on a different cpu than
  4612	 * initially called). If not successful, returns NULL and the local lock
  4613	 * unlocked.
  4614	 */
  4615	static struct slub_percpu_sheaves *
  4616	__pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs, gfp_t gfp)
  4617	{
  4618		struct slab_sheaf *empty = NULL;
  4619		struct slab_sheaf *full;
  4620		bool can_alloc;
  4621	
> 4622		lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock));
  4623	
  4624		if (pcs->spare && pcs->spare->size > 0) {
  4625			swap(pcs->main, pcs->spare);
  4626			return pcs;
  4627		}
  4628	
  4629		full = barn_replace_empty_sheaf(pcs->barn, pcs->main);
  4630	
  4631		if (full) {
  4632			stat(s, BARN_GET);
  4633			pcs->main = full;
  4634			return pcs;
  4635		}
  4636	
  4637		stat(s, BARN_GET_FAIL);
  4638	
  4639		can_alloc = gfpflags_allow_blocking(gfp);
  4640	
  4641		if (can_alloc) {
  4642			if (pcs->spare) {
  4643				empty = pcs->spare;
  4644				pcs->spare = NULL;
  4645			} else {
  4646				empty = barn_get_empty_sheaf(pcs->barn);
  4647			}
  4648		}
  4649	
  4650		local_unlock(&s->cpu_sheaves->lock);
  4651	
  4652		if (!can_alloc)
  4653			return NULL;
  4654	
  4655		if (empty) {
  4656			if (!refill_sheaf(s, empty, gfp)) {
  4657				full = empty;
  4658			} else {
  4659				/*
  4660				 * we must be very low on memory so don't bother
  4661				 * with the barn
  4662				 */
  4663				free_empty_sheaf(s, empty);
  4664			}
  4665		} else {
  4666			full = alloc_full_sheaf(s, gfp);
  4667		}
  4668	
  4669		if (!full)
  4670			return NULL;
  4671	
  4672		/*
  4673		 * we can reach here only when gfpflags_allow_blocking
  4674		 * so this must not be an irq
  4675		 */
  4676		local_lock(&s->cpu_sheaves->lock);
  4677		pcs = this_cpu_ptr(s->cpu_sheaves);
  4678	
  4679		/*
  4680		 * If we are returning empty sheaf, we either got it from the
  4681		 * barn or had to allocate one. If we are returning a full
  4682		 * sheaf, it's due to racing or being migrated to a different
  4683		 * cpu. Breaching the barn's sheaf limits should be thus rare
  4684		 * enough so just ignore them to simplify the recovery.
  4685		 */
  4686	
  4687		if (pcs->main->size == 0) {
  4688			barn_put_empty_sheaf(pcs->barn, pcs->main);
  4689			pcs->main = full;
  4690			return pcs;
  4691		}
  4692	
  4693		if (!pcs->spare) {
  4694			pcs->spare = full;
  4695			return pcs;
  4696		}
  4697	
  4698		if (pcs->spare->size == 0) {
  4699			barn_put_empty_sheaf(pcs->barn, pcs->spare);
  4700			pcs->spare = full;
  4701			return pcs;
  4702		}
  4703	
  4704		barn_put_full_sheaf(pcs->barn, full);
  4705		stat(s, BARN_PUT);
  4706	
  4707		return pcs;
  4708	}
  4709	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
