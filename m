Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DAD33A717;
	Wed, 21 Jan 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005666; cv=none; b=OeHlzoykwvKxKIdAF+APmexbgCIqMT0ti4srbPvzvsLrw8l9LIiX7qcyivxgexACveZ1xj35Ssod6LkGmkBonNwo+m/3E9NdrJnCenvsJRmo6fV31wxrkkiTJi0W3PhXoRGxrgoKSHDycDBdyj2cK36wb222DO22rpnuxh1vnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005666; c=relaxed/simple;
	bh=nReW8jrnNQaRjDPEsyZiztzrnQIWtlhkvQW4uOz0wJM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bhady2V9/EjOh947KisMgOnm0bL3tsYNxgyq4/nzEG74vrpdzgPAJsU341I7OXGsx7g43hc9WiVeJSPrtKvYc5f/kcn21ETD691rOxVsc/sJSeoKZWGqDeCMgYqGc4PMquBewyhy1rgKrsJGC0MkjFNGA2EMdKu071ZB4UocBJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZH5N/SYr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZH5N/SYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769005664; x=1800541664;
  h=date:from:to:cc:subject:message-id;
  bh=nReW8jrnNQaRjDPEsyZiztzrnQIWtlhkvQW4uOz0wJM=;
  b=ZH5N/SYrbkuFNzetYHsUA5thYaD9G36xW4BBls6z8NoRAC2VF3derrpX
   Ze7tC8oK1mugpFIvR7BOWfcRHt5YAqIpWPi1MfyZhEUtk6rBQyqVH7+tH
   7Ronc785524ekkALMLF4eVw9bg+DwTvbAJADkmVT56dU9guV/SBYtcrgx
   vJxoMzkg6mCLvv983k/aHZdCh/mgld+CO4IsqGwzg0yMLfEvS/TDKD8yE
   vq929XstZ5UWhD++2H0bidIf91jgjeq7wgsFizybvY00e1PtyIxIf/5i5
   DFGN1pmRoPU+cOePmTq8JlDmO+m7oWJWu7iyQ+1Ucb6udmDhTEm51BNTM
   w==;
X-CSE-ConnectionGUID: SSoR8cwuRtyAjB/DSJjMzw==
X-CSE-MsgGUID: BYL6vaj/TT+rBNX9KbMaMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69250452"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="69250452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 06:27:44 -0800
X-CSE-ConnectionGUID: TJhBog0qT9K2LafhDMZUkA==
X-CSE-MsgGUID: lng8el1DRi6Tsz+zDvsQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206888106"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Jan 2026 06:27:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viZBJ-00000000RIl-30Dm;
	Wed, 21 Jan 2026 14:27:37 +0000
Date: Wed, 21 Jan 2026 22:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Bart Van Assche <bvanassche@acm.org>
Subject: [tip:locking/core 24/43] mm/huge_memory.c:4055:8: warning:
 spinlock 'xas.xa->xa_lock' is not held on every path through here
Message-ID: <202601212251.RuHvsKd5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   ccf9e070116a81d29aae30db501d562c8efd1ed8
commit: 6e530e2e31191d88f692e6c8d3bd245e43416e4f [24/43] debugfs: Make debugfs_cancellation a context lock struct
config: s390-randconfig-002-20260121 (https://download.01.org/0day-ci/archive/20260121/202601212251.RuHvsKd5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601212251.RuHvsKd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212251.RuHvsKd5-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                 ^
   mm/huge_memory.c:1404:3: warning: releasing spinlock 'pmd_lock(vmf->.vma->vm_mm, vmf->pmd)' that was not held [-Wthread-safety-analysis]
    1404 |                 spin_unlock(ptl);
         |                 ^
   mm/huge_memory.c:1492:5: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    1492 |                                 spin_unlock(vmf->ptl);
         |                                 ^
   mm/huge_memory.c:1495:5: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    1495 |                                 spin_unlock(vmf->ptl);
         |                                 ^
   mm/huge_memory.c:1503:5: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    1503 |                                 spin_unlock(vmf->ptl);
         |                                 ^
   mm/huge_memory.c:1506:4: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    1506 |                         spin_unlock(vmf->ptl);
         |                         ^
   mm/huge_memory.c:1588:2: warning: releasing spinlock 'pmd_lock(vma->vm_mm, pmd)' that was not held [-Wthread-safety-analysis]
    1588 |         spin_unlock(ptl);
         |         ^
   mm/huge_memory.c:1928:3: warning: releasing spinlock 'pmd_lock(dst_mm, dst_pmd)' that was not held [-Wthread-safety-analysis]
    1928 |                 spin_unlock(dst_ptl);
         |                 ^
   mm/huge_memory.c:1946:2: warning: releasing spinlock 'src_ptl' that was not held [-Wthread-safety-analysis]
    1946 |         spin_unlock(src_ptl);
         |         ^
   mm/huge_memory.c:1947:2: warning: releasing spinlock 'dst_ptl' that was not held [-Wthread-safety-analysis]
    1947 |         spin_unlock(dst_ptl);
         |         ^
   mm/huge_memory.c:1949:9: warning: spinlock 'pmd_lockptr(src_mm, src_pmd)' is not held on every path through here [-Wthread-safety-analysis]
    1949 |         return ret;
         |                ^
   mm/huge_memory.c:1886:2: note: spinlock acquired here
    1886 |         spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
         |         ^
   include/linux/spinlock.h:373:35: note: expanded from macro 'spin_lock_nested'
     373 |         __release(spinlock_check(lock)); __acquire(lock);       \
         |                                          ^
   include/linux/compiler-context-analysis.h:360:24: note: expanded from macro '__acquire'
     360 | # define __acquire(x)           __acquire_ctx_lock(x)
         |                                 ^
   mm/huge_memory.c:2052:2: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    2052 |         spin_unlock(vmf->ptl);
         |         ^
   mm/huge_memory.c:2197:3: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    2197 |                 spin_unlock(vmf->ptl);
         |                 ^
   mm/huge_memory.c:2227:2: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    2227 |         spin_unlock(vmf->ptl);
         |         ^
   mm/huge_memory.c:2240:3: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    2240 |                 spin_unlock(vmf->ptl);
         |                 ^
   mm/huge_memory.c:2251:2: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    2251 |         spin_unlock(vmf->ptl);
         |         ^
   mm/huge_memory.c:2304:3: warning: releasing spinlock 'pmd_trans_huge_lock(pmd, vma)' that was not held [-Wthread-safety-analysis]
    2304 |                 spin_unlock(ptl);
         |                 ^
   mm/huge_memory.c:2327:2: warning: releasing spinlock 'pmd_trans_huge_lock(pmd, vma)' that was not held [-Wthread-safety-analysis]
    2327 |         spin_unlock(ptl);
         |         ^
   mm/huge_memory.c:2365:3: warning: releasing spinlock '__pmd_trans_huge_lock(pmd, vma)' that was not held [-Wthread-safety-analysis]
    2365 |                 spin_unlock(ptl);
         |                 ^
   mm/huge_memory.c:2369:3: warning: releasing spinlock '__pmd_trans_huge_lock(pmd, vma)' that was not held [-Wthread-safety-analysis]
    2369 |                 spin_unlock(ptl);
         |                 ^
   mm/huge_memory.c:2415:3: warning: releasing spinlock '__pmd_trans_huge_lock(pmd, vma)' that was not held [-Wthread-safety-analysis]
    2415 |                 spin_unlock(ptl);
         |                 ^
   mm/huge_memory.c:2488:9: warning: spinlock 'pmd_lockptr(vma->vm_mm, new_pmd)' is not held on every path through here [-Wthread-safety-analysis]
    2488 |                 pmd = pmdp_huge_get_and_clear(mm, old_addr, old_pmd);
         |                       ^
   mm/huge_memory.c:2487:4: note: spinlock acquired here
    2487 |                         spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
         |                         ^
   include/linux/spinlock.h:373:35: note: expanded from macro 'spin_lock_nested'
     373 |         __release(spinlock_check(lock)); __acquire(lock);       \
         |                                          ^
   include/linux/compiler-context-analysis.h:360:24: note: expanded from macro '__acquire'
     360 | # define __acquire(x)           __acquire_ctx_lock(x)
         |                                 ^
   mm/huge_memory.c:2505:4: warning: releasing spinlock 'pmd_lockptr(vma->vm_mm, new_pmd)' that was not held [-Wthread-safety-analysis]
    2505 |                         spin_unlock(new_ptl);
         |                         ^
   mm/huge_memory.c:2506:3: warning: releasing spinlock '__pmd_trans_huge_lock(old_pmd, vma)' that was not held [-Wthread-safety-analysis]
    2506 |                 spin_unlock(old_ptl);
         |                 ^
   mm/huge_memory.c:2644:2: warning: releasing spinlock '__pmd_trans_huge_lock(pmd, vma)' that was not held [-Wthread-safety-analysis]
    2644 |         spin_unlock(ptl);
         |         ^
   mm/huge_memory.c:2828:2: warning: releasing spinlock 'pmd_lock(vma->vm_mm, pmd)' that was not held [-Wthread-safety-analysis]
    2828 |         spin_unlock(ptl);
         |         ^
   mm/huge_memory.c:2845:2: warning: releasing spinlock 'pud_lock(vma->vm_mm, pud)' that was not held [-Wthread-safety-analysis]
    2845 |         spin_unlock(ptl);
         |         ^
   mm/huge_memory.c:3285:2: warning: releasing spinlock 'pmd_lock(vma->vm_mm, pmd)' that was not held [-Wthread-safety-analysis]
    3285 |         spin_unlock(ptl);
         |         ^
>> mm/huge_memory.c:4055:8: warning: spinlock 'xas.xa->xa_lock' is not held on every path through here [-Wthread-safety-analysis]
    4055 |         ret = __folio_freeze_and_split_unmapped(folio, new_order, split_at, &xas, mapping,
         |               ^
   mm/huge_memory.c:4047:3: note: spinlock acquired here
    4047 |                 xas_lock(&xas);
         |                 ^
   include/linux/xarray.h:1418:24: note: expanded from macro 'xas_lock'
    1418 | #define xas_lock(xas)           xa_lock((xas)->xa)
         |                                 ^
   include/linux/xarray.h:536:22: note: expanded from macro 'xa_lock'
     536 | #define xa_lock(xa)             spin_lock(&(xa)->xa_lock)
         |                                 ^
   mm/huge_memory.c:4058:6: warning: spinlock 'xas.xa->xa_lock' is not held on every path through here [-Wthread-safety-analysis]
    4058 |         if (mapping)
         |             ^
   mm/huge_memory.c:4047:3: note: spinlock acquired here
    4047 |                 xas_lock(&xas);
         |                 ^
   include/linux/xarray.h:1418:24: note: expanded from macro 'xas_lock'
    1418 | #define xas_lock(xas)           xa_lock((xas)->xa)
         |                                 ^
   include/linux/xarray.h:536:22: note: expanded from macro 'xa_lock'
     536 | #define xa_lock(xa)             spin_lock(&(xa)->xa_lock)
         |                                 ^
   mm/huge_memory.c:4059:3: warning: releasing spinlock 'xas.xa->xa_lock' that was not held [-Wthread-safety-analysis]
    4059 |                 xas_unlock(&xas);
         |                 ^
   include/linux/xarray.h:1419:26: note: expanded from macro 'xas_unlock'
    1419 | #define xas_unlock(xas)         xa_unlock((xas)->xa)
         |                                 ^
   include/linux/xarray.h:537:24: note: expanded from macro 'xa_unlock'
     537 | #define xa_unlock(xa)           spin_unlock(&(xa)->xa_lock)
         |                                 ^
   mm/huge_memory.c:4655:3: warning: releasing spinlock 'fw.ptl' that was not held [-Wthread-safety-analysis]
    4655 |                 folio_walk_end(&fw, vma);
         |                 ^
   include/linux/pagewalk.h:201:2: note: expanded from macro 'folio_walk_end'
     201 |         spin_unlock((__fw)->ptl); \
         |         ^
   mm/huge_memory.c:4679:3: warning: releasing spinlock 'fw.ptl' that was not held [-Wthread-safety-analysis]
    4679 |                 folio_walk_end(&fw, vma);
         |                 ^
   include/linux/pagewalk.h:201:2: note: expanded from macro 'folio_walk_end'
     201 |         spin_unlock((__fw)->ptl); \
         |         ^
   96 warnings generated.
--
   include/linux/memcontrol.h:1260:1: warning: spinlock 'folio_pgdat(folio).__lruvec.lru_lock' is still held at the end of function [-Wthread-safety-analysis]
    1260 | }
         | ^
   include/linux/memcontrol.h:1258:2: note: spinlock acquired here
    1258 |         spin_lock_irqsave(&pgdat->__lruvec.lru_lock, *flagsp);
         |         ^
   include/linux/spinlock.h:391:35: note: expanded from macro 'spin_lock_irqsave'
     391 |         __release(spinlock_check(lock)); __acquire(lock);       \
         |                                          ^
   include/linux/compiler-context-analysis.h:360:24: note: expanded from macro '__acquire'
     360 | # define __acquire(x)           __acquire_ctx_lock(x)
         |                                 ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:1470:2: warning: releasing spinlock 'lruvec->lru_lock' that was not held [-Wthread-safety-analysis]
    1470 |         spin_unlock(&lruvec->lru_lock);
         |         ^
   include/linux/memcontrol.h:1475:2: warning: releasing spinlock 'lruvec->lru_lock' that was not held [-Wthread-safety-analysis]
    1475 |         spin_unlock_irq(&lruvec->lru_lock);
         |         ^
   include/linux/memcontrol.h:1481:2: warning: releasing spinlock 'lruvec->lru_lock' that was not held [-Wthread-safety-analysis]
    1481 |         spin_unlock_irqrestore(&lruvec->lru_lock, flags);
         |         ^
   In file included from mm/slub.c:52:
   In file included from mm/internal.h:16:
   include/linux/rmap.h:123:1: warning: rw_semaphore 'anon_vma->root->rwsem' is still held at the end of function [-Wthread-safety-analysis]
     123 | }
         | ^
   include/linux/rmap.h:122:2: note: rw_semaphore acquired here
     122 |         down_write(&anon_vma->root->rwsem);
         |         ^
   include/linux/rmap.h:132:2: warning: releasing rw_semaphore 'anon_vma->root->rwsem' that was not held [-Wthread-safety-analysis]
     132 |         up_write(&anon_vma->root->rwsem);
         |         ^
   include/linux/rmap.h:138:1: warning: rw_semaphore 'anon_vma->root->rwsem' is still held at the end of function [-Wthread-safety-analysis]
     138 | }
         | ^
   include/linux/rmap.h:137:2: note: rw_semaphore acquired here
     137 |         down_read(&anon_vma->root->rwsem);
         |         ^
   include/linux/rmap.h:147:2: warning: releasing rw_semaphore 'anon_vma->root->rwsem' that was not held [-Wthread-safety-analysis]
     147 |         up_read(&anon_vma->root->rwsem);
         |         ^
   include/linux/rmap.h:181:1: warning: __context_bitlock '((#undefined * 8) - 1) + folio->....._mm_ids' is still held at the end of function [-Wthread-safety-analysis]
     181 | }
         | ^
   include/linux/rmap.h:180:2: note: __context_bitlock acquired here
     180 |         bit_spin_lock(FOLIO_MM_IDS_LOCK_BITNUM, &folio->_mm_ids);
         |         ^
   include/linux/rmap.h:185:2: warning: releasing __context_bitlock '((#undefined * 8) - 1) + folio->....._mm_ids' that was not held [-Wthread-safety-analysis]
     185 |         __bit_spin_unlock(FOLIO_MM_IDS_LOCK_BITNUM, &folio->_mm_ids);
         |         ^
   include/linux/rmap.h:958:3: warning: releasing spinlock 'pvmw->ptl' that was not held [-Wthread-safety-analysis]
     958 |                 spin_unlock(pvmw->ptl);
         |                 ^
   include/linux/rmap.h:976:3: warning: releasing spinlock 'pvmw->ptl' that was not held [-Wthread-safety-analysis]
     976 |                 spin_unlock(pvmw->ptl);
         |                 ^
   mm/slub.c:755:1: warning: __context_bitlock 'SL_locked + slab->flags.f' is still held at the end of function [-Wthread-safety-analysis]
     755 | }
         | ^
   mm/slub.c:754:2: note: __context_bitlock acquired here
     754 |         bit_spin_lock(SL_locked, &slab->flags.f);
         |         ^
   mm/slub.c:759:2: warning: releasing __context_bitlock 'SL_locked + slab->flags.f' that was not held [-Wthread-safety-analysis]
     759 |         bit_spin_unlock(SL_locked, &slab->flags.f);
         |         ^
   mm/slub.c:3455:11: warning: spinlock 'get_node(s, nid).list_lock' is not held on every path through here [-Wthread-safety-analysis]
    3455 |         object = slab->freelist;
         |                  ^
   mm/slub.c:3449:22: note: spinlock acquired here
    3449 |         if (!allow_spin && !spin_trylock_irqsave(&n->list_lock, flags)) {
         |                             ^
   include/linux/spinlock.h:437:2: note: expanded from macro 'spin_trylock_irqsave'
     437 |         __cond_lock(lock, raw_spin_trylock_irqsave(spinlock_check(lock), flags))
         |         ^
   include/linux/compiler-context-analysis.h:386:28: note: expanded from macro '__cond_lock'
     386 | # define __cond_lock(x, c)      __try_acquire_ctx_lock(x, c)
         |                                 ^
   mm/slub.c:3467:4: warning: releasing spinlock 'get_node(s, nid).list_lock' that was not held [-Wthread-safety-analysis]
    3467 |                         spin_unlock_irqrestore(&n->list_lock, flags);
         |                         ^
   mm/slub.c:3474:6: warning: spinlock 'get_node(s, nid).list_lock' is not held on every path through here [-Wthread-safety-analysis]
    3474 |         if (slab->inuse == slab->objects)
         |             ^
   mm/slub.c:3472:3: note: spinlock acquired here
    3472 |                 spin_lock_irqsave(&n->list_lock, flags);
         |                 ^
   include/linux/spinlock.h:391:35: note: expanded from macro 'spin_lock_irqsave'
     391 |         __release(spinlock_check(lock)); __acquire(lock);       \
         |                                          ^
   include/linux/compiler-context-analysis.h:360:24: note: expanded from macro '__acquire'
     360 | # define __acquire(x)           __acquire_ctx_lock(x)
         |                                 ^
   mm/slub.c:3480:2: warning: releasing spinlock 'get_node(s, nid).list_lock' that was not held [-Wthread-safety-analysis]
    3480 |         spin_unlock_irqrestore(&n->list_lock, flags);
         |         ^
   mm/slub.c:3863:5: warning: releasing spinlock 'n->list_lock' that was not held [-Wthread-safety-analysis]
    3863 |                                 spin_unlock_irqrestore(&n->list_lock, flags);
         |                                 ^
>> mm/slub.c:3869:7: warning: spinlock 'get_node(s, slab_nid(partial_slab)).list_lock' is not held on every path through here [-Wthread-safety-analysis]
    3869 |                 if (unlikely(!slab->inuse && n->nr_partial >= s->min_partial)) {
         |                     ^
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^
   mm/slub.c:3866:4: note: spinlock acquired here
    3866 |                         spin_lock_irqsave(&n->list_lock, flags);
         |                         ^
   include/linux/spinlock.h:391:35: note: expanded from macro 'spin_lock_irqsave'
     391 |         __release(spinlock_check(lock)); __acquire(lock);       \
         |                                          ^
   include/linux/compiler-context-analysis.h:360:24: note: expanded from macro '__acquire'
     360 | # define __acquire(x)           __acquire_ctx_lock(x)
         |                                 ^
   mm/slub.c:3879:3: warning: releasing spinlock 'n->list_lock' that was not held [-Wthread-safety-analysis]
    3879 |                 spin_unlock_irqrestore(&n->list_lock, flags);
         |                 ^
>> mm/slub.c:3933:2: warning: local_trylock 's->cpu_slab->lock' is not held on every path through here [-Wthread-safety-analysis]
    3933 |         local_lock_cpu_slab(s, flags);
         |         ^
   mm/slub.c:3842:3: note: expanded from macro 'local_lock_cpu_slab'
    3842 |                 lockdep_assert(__l);                                           \
         |                 ^
   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:114:2: note: expanded from macro 'WARN_ON'
     114 |         unlikely(__ret_warn_on);                                        \
         |         ^
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^
   mm/slub.c:3933:2: note: local_trylock acquired here
   mm/slub.c:3841:14: note: expanded from macro 'local_lock_cpu_slab'
    3841 |                 bool __l = local_trylock_irqsave(&(s)->cpu_slab->lock, flags); \
         |                            ^
   include/linux/local_lock.h:84:2: note: expanded from macro 'local_trylock_irqsave'
      84 |         __local_trylock_irqsave(__this_cpu_local_lock(lock), flags)
         |         ^
   include/linux/local_lock_internal.h:165:2: note: expanded from macro '__local_trylock_irqsave'
     165 |         __try_acquire_ctx_lock(lock, ({                         \
         |         ^
>> mm/slub.c:3958:2: warning: releasing local_trylock 's->cpu_slab->lock' that was not held [-Wthread-safety-analysis]
    3958 |         local_unlock_cpu_slab(s, flags);
         |         ^
   mm/slub.c:3847:2: note: expanded from macro 'local_unlock_cpu_slab'
    3847 |         local_unlock_irqrestore(&(s)->cpu_slab->lock, flags)
         |         ^
   include/linux/local_lock.h:53:2: note: expanded from macro 'local_unlock_irqrestore'
      53 |         __local_unlock_irqrestore(__this_cpu_local_lock(lock), flags)
         |         ^
   include/linux/local_lock_internal.h:216:3: note: expanded from macro '__local_unlock_irqrestore'
     216 |                 __release(lock);                                \
         |                 ^
   include/linux/compiler-context-analysis.h:368:24: note: expanded from macro '__release'
     368 | # define __release(x)           __release_ctx_lock(x)
         |                                 ^
   mm/slub.c:4521:2: warning: local_trylock 's->cpu_slab->lock' is not held on every path through here [-Wthread-safety-analysis]
    4521 |         local_lock_cpu_slab(s, flags);
         |         ^
   mm/slub.c:3842:3: note: expanded from macro 'local_lock_cpu_slab'
    3842 |                 lockdep_assert(__l);                                           \
         |                 ^
   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:114:2: note: expanded from macro 'WARN_ON'
     114 |         unlikely(__ret_warn_on);                                        \
         |         ^
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^
   mm/slub.c:4521:2: note: local_trylock acquired here
   mm/slub.c:3841:14: note: expanded from macro 'local_lock_cpu_slab'
    3841 |                 bool __l = local_trylock_irqsave(&(s)->cpu_slab->lock, flags); \
         |                            ^
   include/linux/local_lock.h:84:2: note: expanded from macro 'local_trylock_irqsave'
      84 |         __local_trylock_irqsave(__this_cpu_local_lock(lock), flags)
         |         ^
   include/linux/local_lock_internal.h:165:2: note: expanded from macro '__local_trylock_irqsave'
     165 |         __try_acquire_ctx_lock(lock, ({                         \
         |         ^
   mm/slub.c:4524:3: warning: releasing local_trylock 's->cpu_slab->lock' that was not held [-Wthread-safety-analysis]
    4524 |                 local_unlock_cpu_slab(s, flags);
         |                 ^
   mm/slub.c:3847:2: note: expanded from macro 'local_unlock_cpu_slab'
    3847 |         local_unlock_irqrestore(&(s)->cpu_slab->lock, flags)
         |         ^
   include/linux/local_lock.h:53:2: note: expanded from macro 'local_unlock_irqrestore'
      53 |         __local_unlock_irqrestore(__this_cpu_local_lock(lock), flags)
         |         ^
   include/linux/local_lock_internal.h:216:3: note: expanded from macro '__local_unlock_irqrestore'
     216 |                 __release(lock);                                \
         |                 ^
   include/linux/compiler-context-analysis.h:368:24: note: expanded from macro '__release'
     368 | # define __release(x)           __release_ctx_lock(x)
         |                                 ^
   mm/slub.c:4536:3: warning: releasing local_trylock 's->cpu_slab->lock' that was not held [-Wthread-safety-analysis]
    4536 |                 local_unlock_cpu_slab(s, flags);
         |                 ^
   mm/slub.c:3847:2: note: expanded from macro 'local_unlock_cpu_slab'
    3847 |         local_unlock_irqrestore(&(s)->cpu_slab->lock, flags)
         |         ^
   include/linux/local_lock.h:53:2: note: expanded from macro 'local_unlock_irqrestore'
      53 |         __local_unlock_irqrestore(__this_cpu_local_lock(lock), flags)
         |         ^
   include/linux/local_lock_internal.h:216:3: note: expanded from macro '__local_unlock_irqrestore'
     216 |                 __release(lock);                                \
         |                 ^
   include/linux/compiler-context-analysis.h:368:24: note: expanded from macro '__release'
     368 | # define __release(x)           __release_ctx_lock(x)
         |                                 ^
   mm/slub.c:4555:2: warning: releasing local_trylock 's->cpu_slab->lock' that was not held [-Wthread-safety-analysis]
    4555 |         local_unlock_cpu_slab(s, flags);
         |         ^
   mm/slub.c:3847:2: note: expanded from macro 'local_unlock_cpu_slab'
    3847 |         local_unlock_irqrestore(&(s)->cpu_slab->lock, flags)
         |         ^
   include/linux/local_lock.h:53:2: note: expanded from macro 'local_unlock_irqrestore'
      53 |         __local_unlock_irqrestore(__this_cpu_local_lock(lock), flags)
         |         ^
   include/linux/local_lock_internal.h:216:3: note: expanded from macro '__local_unlock_irqrestore'
     216 |                 __release(lock);                                \
         |                 ^
   include/linux/compiler-context-analysis.h:368:24: note: expanded from macro '__release'
     368 | # define __release(x)           __release_ctx_lock(x)
         |                                 ^
   mm/slub.c:4560:2: warning: local_trylock 's->cpu_slab->lock' is not held on every path through here [-Wthread-safety-analysis]
    4560 |         local_lock_cpu_slab(s, flags);
         |         ^
   mm/slub.c:3842:3: note: expanded from macro 'local_lock_cpu_slab'
    3842 |                 lockdep_assert(__l);                                           \
         |                 ^
   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:114:2: note: expanded from macro 'WARN_ON'
     114 |         unlikely(__ret_warn_on);                                        \
         |         ^
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^
   mm/slub.c:4560:2: note: local_trylock acquired here


vim +4055 mm/huge_memory.c

cab812d9c9642e Balbir Singh            2025-11-14  3913  
50d0598cf2c9d3 Zi Yan                  2025-10-31  3914  /**
50d0598cf2c9d3 Zi Yan                  2025-10-31  3915   * __folio_split() - split a folio at @split_at to a @new_order folio
58729c04cf1092 Zi Yan                  2025-03-07  3916   * @folio: folio to split
58729c04cf1092 Zi Yan                  2025-03-07  3917   * @new_order: the order of the new folio
58729c04cf1092 Zi Yan                  2025-03-07  3918   * @split_at: a page within the new folio
58729c04cf1092 Zi Yan                  2025-03-07  3919   * @lock_at: a page within @folio to be left locked to caller
58729c04cf1092 Zi Yan                  2025-03-07  3920   * @list: after-split folios will be put on it if non NULL
c467061fbb6eb4 Wei Yang                2025-11-06  3921   * @split_type: perform uniform split or not (non-uniform split)
58729c04cf1092 Zi Yan                  2025-03-07  3922   *
58729c04cf1092 Zi Yan                  2025-03-07  3923   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
58729c04cf1092 Zi Yan                  2025-03-07  3924   * It is in charge of checking whether the split is supported or not and
58729c04cf1092 Zi Yan                  2025-03-07  3925   * preparing @folio for __split_unmapped_folio().
58729c04cf1092 Zi Yan                  2025-03-07  3926   *
6c7de9c83be68b Zi Yan                  2025-07-18  3927   * After splitting, the after-split folio containing @lock_at remains locked
6c7de9c83be68b Zi Yan                  2025-07-18  3928   * and others are unlocked:
6c7de9c83be68b Zi Yan                  2025-07-18  3929   * 1. for uniform split, @lock_at points to one of @folio's subpages;
6c7de9c83be68b Zi Yan                  2025-07-18  3930   * 2. for buddy allocator like (non-uniform) split, @lock_at points to @folio.
6c7de9c83be68b Zi Yan                  2025-07-18  3931   *
50d0598cf2c9d3 Zi Yan                  2025-10-31  3932   * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @folio might be
58729c04cf1092 Zi Yan                  2025-03-07  3933   * split but not to @new_order, the caller needs to check)
58729c04cf1092 Zi Yan                  2025-03-07  3934   */
6384dd1d18de7b Zi Yan                  2025-03-07  3935  static int __folio_split(struct folio *folio, unsigned int new_order,
58729c04cf1092 Zi Yan                  2025-03-07  3936  		struct page *split_at, struct page *lock_at,
cab812d9c9642e Balbir Singh            2025-11-14  3937  		struct list_head *list, enum split_type split_type)
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  3938  {
58729c04cf1092 Zi Yan                  2025-03-07  3939  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
6c7de9c83be68b Zi Yan                  2025-07-18  3940  	struct folio *end_folio = folio_next(folio);
5d65c8d758f259 Barry Song              2024-08-24  3941  	bool is_anon = folio_test_anon(folio);
baa355fd331424 Kiryl Shutsemau         2016-07-26  3942  	struct address_space *mapping = NULL;
5d65c8d758f259 Barry Song              2024-08-24  3943  	struct anon_vma *anon_vma = NULL;
d87f4a8f19668c Wei Yang                2025-10-10  3944  	int old_order = folio_order(folio);
6c7de9c83be68b Zi Yan                  2025-07-18  3945  	struct folio *new_folio, *next;
391dc7f40590d7 Zi Yan                  2025-07-18  3946  	int nr_shmem_dropped = 0;
391dc7f40590d7 Zi Yan                  2025-07-18  3947  	int remap_flags = 0;
5842bcbfc31673 Zi Yan                  2025-11-26  3948  	int ret;
cab812d9c9642e Balbir Singh            2025-11-14  3949  	pgoff_t end = 0;
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  3950  
714b056c832106 Zi Yan                  2025-07-17  3951  	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
714b056c832106 Zi Yan                  2025-07-17  3952  	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  3953  
9dcdc0c207fe32 Zi Yan                  2025-11-26  3954  	if (folio != page_folio(split_at) || folio != page_folio(lock_at)) {
9dcdc0c207fe32 Zi Yan                  2025-11-26  3955  		ret = -EINVAL;
9dcdc0c207fe32 Zi Yan                  2025-11-26  3956  		goto out;
9dcdc0c207fe32 Zi Yan                  2025-11-26  3957  	}
c010d47f107f60 Zi Yan                  2024-02-26  3958  
9dcdc0c207fe32 Zi Yan                  2025-11-26  3959  	if (new_order >= old_order) {
9dcdc0c207fe32 Zi Yan                  2025-11-26  3960  		ret = -EINVAL;
9dcdc0c207fe32 Zi Yan                  2025-11-26  3961  		goto out;
4737edbbdd4958 Naoya Horiguchi         2023-04-06  3962  	}
478d134e9506c7 Xu Yu                   2022-04-28  3963  
bdd0d69a32c2aa Zi Yan                  2025-11-26  3964  	ret = folio_check_splittable(folio, new_order, split_type);
bdd0d69a32c2aa Zi Yan                  2025-11-26  3965  	if (ret) {
bdd0d69a32c2aa Zi Yan                  2025-11-26  3966  		VM_WARN_ONCE(ret == -EINVAL, "Tried to split an unsplittable folio");
9dcdc0c207fe32 Zi Yan                  2025-11-26  3967  		goto out;
4737edbbdd4958 Naoya Horiguchi         2023-04-06  3968  	}
59807685a7e77e Ying Huang              2017-09-06  3969  
5d65c8d758f259 Barry Song              2024-08-24  3970  	if (is_anon) {
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  3971  		/*
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  3972  		 * The caller does not necessarily hold an mmap_lock that would
baa355fd331424 Kiryl Shutsemau         2016-07-26  3973  		 * prevent the anon_vma disappearing so we first we take a
baa355fd331424 Kiryl Shutsemau         2016-07-26  3974  		 * reference to it and then lock the anon_vma for write. This
2f031c6f042cb8 Matthew Wilcox (Oracle  2022-01-29  3975) 		 * is similar to folio_lock_anon_vma_read except the write lock
baa355fd331424 Kiryl Shutsemau         2016-07-26  3976  		 * is taken to serialise against parallel split or collapse
baa355fd331424 Kiryl Shutsemau         2016-07-26  3977  		 * operations.
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  3978  		 */
29eea9b5a9c9ec Matthew Wilcox (Oracle  2022-09-02  3979) 		anon_vma = folio_get_anon_vma(folio);
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  3980  		if (!anon_vma) {
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  3981  			ret = -EBUSY;
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  3982  			goto out;
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  3983  		}
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  3984  		anon_vma_lock_write(anon_vma);
4265d67e405a41 Balbir Singh            2025-10-01  3985  		mapping = NULL;
baa355fd331424 Kiryl Shutsemau         2016-07-26  3986  	} else {
e220917fa50774 Luis Chamberlain        2024-08-22  3987  		unsigned int min_order;
6a3edd29395631 Yin Fengwei             2022-08-10  3988  		gfp_t gfp;
6a3edd29395631 Yin Fengwei             2022-08-10  3989  
3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  3990) 		mapping = folio->mapping;
e220917fa50774 Luis Chamberlain        2024-08-22  3991  		min_order = mapping_min_folio_order(folio->mapping);
e220917fa50774 Luis Chamberlain        2024-08-22  3992  		if (new_order < min_order) {
e220917fa50774 Luis Chamberlain        2024-08-22  3993  			ret = -EINVAL;
e220917fa50774 Luis Chamberlain        2024-08-22  3994  			goto out;
e220917fa50774 Luis Chamberlain        2024-08-22  3995  		}
e220917fa50774 Luis Chamberlain        2024-08-22  3996  
6a3edd29395631 Yin Fengwei             2022-08-10  3997  		gfp = current_gfp_context(mapping_gfp_mask(mapping) &
6a3edd29395631 Yin Fengwei             2022-08-10  3998  							GFP_RECLAIM_MASK);
6a3edd29395631 Yin Fengwei             2022-08-10  3999  
0201ebf274a306 David Howells           2023-06-28  4000  		if (!filemap_release_folio(folio, gfp)) {
6a3edd29395631 Yin Fengwei             2022-08-10  4001  			ret = -EBUSY;
6a3edd29395631 Yin Fengwei             2022-08-10  4002  			goto out;
6a3edd29395631 Yin Fengwei             2022-08-10  4003  		}
6a3edd29395631 Yin Fengwei             2022-08-10  4004  
c467061fbb6eb4 Wei Yang                2025-11-06  4005  		if (split_type == SPLIT_TYPE_UNIFORM) {
58729c04cf1092 Zi Yan                  2025-03-07  4006  			xas_set_order(&xas, folio->index, new_order);
d87f4a8f19668c Wei Yang                2025-10-10  4007  			xas_split_alloc(&xas, folio, old_order, gfp);
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4008) 			if (xas_error(&xas)) {
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4009) 				ret = xas_error(&xas);
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4010) 				goto out;
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4011) 			}
58729c04cf1092 Zi Yan                  2025-03-07  4012  		}
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4013) 
baa355fd331424 Kiryl Shutsemau         2016-07-26  4014  		anon_vma = NULL;
baa355fd331424 Kiryl Shutsemau         2016-07-26  4015  		i_mmap_lock_read(mapping);
006d3ff27e884f Hugh Dickins            2018-11-30  4016  
006d3ff27e884f Hugh Dickins            2018-11-30  4017  		/*
58729c04cf1092 Zi Yan                  2025-03-07  4018  		 *__split_unmapped_folio() may need to trim off pages beyond
58729c04cf1092 Zi Yan                  2025-03-07  4019  		 * EOF: but on 32-bit, i_size_read() takes an irq-unsafe
58729c04cf1092 Zi Yan                  2025-03-07  4020  		 * seqlock, which cannot be nested inside the page tree lock.
58729c04cf1092 Zi Yan                  2025-03-07  4021  		 * So note end now: i_size itself may be changed at any moment,
58729c04cf1092 Zi Yan                  2025-03-07  4022  		 * but folio lock is good enough to serialize the trimming.
006d3ff27e884f Hugh Dickins            2018-11-30  4023  		 */
006d3ff27e884f Hugh Dickins            2018-11-30  4024  		end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
d144bf6205342a Hugh Dickins            2021-09-02  4025  		if (shmem_mapping(mapping))
d144bf6205342a Hugh Dickins            2021-09-02  4026  			end = shmem_fallocend(mapping->host, end);
baa355fd331424 Kiryl Shutsemau         2016-07-26  4027  	}
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4028  
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4029  	/*
684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4030) 	 * Racy check if we can split the page, before unmap_folio() will
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4031  	 * split PMDs
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4032  	 */
5842bcbfc31673 Zi Yan                  2025-11-26  4033  	if (folio_expected_ref_count(folio) != folio_ref_count(folio) - 1) {
fd4a7ac32918d3 Baolin Wang             2022-10-24  4034  		ret = -EAGAIN;
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4035  		goto out_unlock;
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4036  	}
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4037  
684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4038) 	unmap_folio(folio);
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4039  
b6769834aac1d4 Alex Shi                2020-12-15  4040  	/* block interrupt reentry in xa_lock and spinlock */
b6769834aac1d4 Alex Shi                2020-12-15  4041  	local_irq_disable();
baa355fd331424 Kiryl Shutsemau         2016-07-26  4042  	if (mapping) {
baa355fd331424 Kiryl Shutsemau         2016-07-26  4043  		/*
3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4044) 		 * Check if the folio is present in page cache.
3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4045) 		 * We assume all tail are present too, if folio is there.
baa355fd331424 Kiryl Shutsemau         2016-07-26  4046  		 */
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4047) 		xas_lock(&xas);
6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4048) 		xas_reset(&xas);
391dc7f40590d7 Zi Yan                  2025-07-18  4049  		if (xas_load(&xas) != folio) {
391dc7f40590d7 Zi Yan                  2025-07-18  4050  			ret = -EAGAIN;
baa355fd331424 Kiryl Shutsemau         2016-07-26  4051  			goto fail;
baa355fd331424 Kiryl Shutsemau         2016-07-26  4052  		}
391dc7f40590d7 Zi Yan                  2025-07-18  4053  	}
baa355fd331424 Kiryl Shutsemau         2016-07-26  4054  
cab812d9c9642e Balbir Singh            2025-11-14 @4055  	ret = __folio_freeze_and_split_unmapped(folio, new_order, split_at, &xas, mapping,
5842bcbfc31673 Zi Yan                  2025-11-26  4056  						true, list, split_type, end, &nr_shmem_dropped);
391dc7f40590d7 Zi Yan                  2025-07-18  4057  fail:
6c7de9c83be68b Zi Yan                  2025-07-18  4058  	if (mapping)
6c7de9c83be68b Zi Yan                  2025-07-18  4059  		xas_unlock(&xas);
6c7de9c83be68b Zi Yan                  2025-07-18  4060  
6c7de9c83be68b Zi Yan                  2025-07-18  4061  	local_irq_enable();
6c7de9c83be68b Zi Yan                  2025-07-18  4062  
391dc7f40590d7 Zi Yan                  2025-07-18  4063  	if (nr_shmem_dropped)
391dc7f40590d7 Zi Yan                  2025-07-18  4064  		shmem_uncharge(mapping->host, nr_shmem_dropped);
6c7de9c83be68b Zi Yan                  2025-07-18  4065  
1462872900233e Balbir Singh            2025-10-01  4066  	if (!ret && is_anon && !folio_is_device_private(folio))
391dc7f40590d7 Zi Yan                  2025-07-18  4067  		remap_flags = RMP_USE_SHARED_ZEROPAGE;
1462872900233e Balbir Singh            2025-10-01  4068  
d87f4a8f19668c Wei Yang                2025-10-10  4069  	remap_page(folio, 1 << old_order, remap_flags);
6c7de9c83be68b Zi Yan                  2025-07-18  4070  
6c7de9c83be68b Zi Yan                  2025-07-18  4071  	/*
6c7de9c83be68b Zi Yan                  2025-07-18  4072  	 * Unlock all after-split folios except the one containing
6c7de9c83be68b Zi Yan                  2025-07-18  4073  	 * @lock_at page. If @folio is not split, it will be kept locked.
6c7de9c83be68b Zi Yan                  2025-07-18  4074  	 */
391dc7f40590d7 Zi Yan                  2025-07-18  4075  	for (new_folio = folio; new_folio != end_folio; new_folio = next) {
6c7de9c83be68b Zi Yan                  2025-07-18  4076  		next = folio_next(new_folio);
6c7de9c83be68b Zi Yan                  2025-07-18  4077  		if (new_folio == page_folio(lock_at))
6c7de9c83be68b Zi Yan                  2025-07-18  4078  			continue;
6c7de9c83be68b Zi Yan                  2025-07-18  4079  
6c7de9c83be68b Zi Yan                  2025-07-18  4080  		folio_unlock(new_folio);
6c7de9c83be68b Zi Yan                  2025-07-18  4081  		/*
6c7de9c83be68b Zi Yan                  2025-07-18  4082  		 * Subpages may be freed if there wasn't any mapping
6c7de9c83be68b Zi Yan                  2025-07-18  4083  		 * like if add_to_swap() is running on a lru page that
6c7de9c83be68b Zi Yan                  2025-07-18  4084  		 * had its mapping zapped. And freeing these pages
6c7de9c83be68b Zi Yan                  2025-07-18  4085  		 * requires taking the lru_lock so we do the put_page
6c7de9c83be68b Zi Yan                  2025-07-18  4086  		 * of the tail pages after the split is complete.
6c7de9c83be68b Zi Yan                  2025-07-18  4087  		 */
6c7de9c83be68b Zi Yan                  2025-07-18  4088  		free_folio_and_swap_cache(new_folio);
6c7de9c83be68b Zi Yan                  2025-07-18  4089  	}
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4090  
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4091  out_unlock:
baa355fd331424 Kiryl Shutsemau         2016-07-26  4092  	if (anon_vma) {
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4093  		anon_vma_unlock_write(anon_vma);
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4094  		put_anon_vma(anon_vma);
baa355fd331424 Kiryl Shutsemau         2016-07-26  4095  	}
baa355fd331424 Kiryl Shutsemau         2016-07-26  4096  	if (mapping)
baa355fd331424 Kiryl Shutsemau         2016-07-26  4097  		i_mmap_unlock_read(mapping);
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4098  out:
69a37a8ba1b408 Matthew Wilcox (Oracle  2022-06-08  4099) 	xas_destroy(&xas);
d87f4a8f19668c Wei Yang                2025-10-10  4100  	if (old_order == HPAGE_PMD_ORDER)
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4101  		count_vm_event(!ret ? THP_SPLIT_PAGE : THP_SPLIT_PAGE_FAILED);
d87f4a8f19668c Wei Yang                2025-10-10  4102  	count_mthp_stat(old_order, !ret ? MTHP_STAT_SPLIT : MTHP_STAT_SPLIT_FAILED);
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4103  	return ret;
e9b61f19858a5d Kiryl Shutsemau         2016-01-15  4104  }
9a982250f773cc Kiryl Shutsemau         2016-01-15  4105  

:::::: The code at line 4055 was first introduced by commit
:::::: cab812d9c9642ec11b8961b7ea994f4bd0826159 mm/huge_memory.c: introduce folio_split_unmapped

:::::: TO: Balbir Singh <balbirs@nvidia.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
