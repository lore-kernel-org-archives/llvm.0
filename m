Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2291392C32;
	Tue, 20 Jan 2026 23:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952408; cv=none; b=ZiOkERuH0rtfT5lR/liDQ+v0fwldAc7OSpSCEt8kIPRUTvJ4A3xUJzCS570gvtBYPm0D4yrZhIwTi/p7ZP8EbIl0v8HOhwzdIS1iXHWRUL1QZxc1QxXuyIPZ0y4DI56Y+7ytrZMjnrQmjU0roxPANxYs/HGXm1yQDa7Vfbi8RwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952408; c=relaxed/simple;
	bh=MOVeSmBleL0JD7K8jNS/IJ/VEd669+tsiX6XKwiaArE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fB+dBfkdqInIa8L7hWvL2uihMMbqc02Y3D/98TrqxPnPXERIhN7KLgkC35Sej8KJqKeRK1PDZRt55byF4fVuHgDwNgB3h7sIjjZ/Us1tRk9cxDTVHAH0STkqgXwg7lXYccjJKF+Gr9vdVsIGHiDrYVwpgRndbFhLtPdhoZdGyHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5AxzxFf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5AxzxFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768952406; x=1800488406;
  h=date:from:to:cc:subject:message-id;
  bh=MOVeSmBleL0JD7K8jNS/IJ/VEd669+tsiX6XKwiaArE=;
  b=C5AxzxFf95fGZ/5c1es9g6UuUMg+fRCoLL4ZKhLssVZO02y3z/9Vrw0M
   x9B0CS6lMzit3A7XNy9t4sZEVwa0dcr4yVENDwZc19yKvgdXrfVEWtR76
   hIvsoqty2Z0/5+LgH8ItmAEt9iAjf8aRODmMO8JcUag12jbUKSsUFfPgr
   RGsAy5tWq2coH3zfa155RkhtBxEzm/a6RkWmeNg9Nmi5FTp2Yi+kyV5GP
   SFEVI12AkcLCpNRWQb/EzRYsOxgiyrMwFIp5NbXG5o4/9Jtrt+B+d05yK
   bYA2UGufAfEaNb4SAdIVAMo22nnBxLKpEHGkVXfXuUz+moFblht0z92qN
   w==;
X-CSE-ConnectionGUID: 6SXLoZt6SNKKvXECeIYzzQ==
X-CSE-MsgGUID: 5yffMTCDRpmdu/DgDS3Wlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81282526"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="81282526"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:40:05 -0800
X-CSE-ConnectionGUID: LviS6cDZTLmqqk6+UaKzGw==
X-CSE-MsgGUID: clpg0VifTAe85SCokzq56g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jan 2026 15:40:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viLKK-00000000PhN-2d4z;
	Tue, 20 Jan 2026 23:40:00 +0000
Date: Wed, 21 Jan 2026 07:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 8238/8302] mm/memory.c:1844:12: warning:
 spinlock 'pmd_lockptr(mm, pmd)' is not held on every path through here
Message-ID: <202601210715.vxSStJeF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: 4896ab38023ae4bb2f070083d425b3836a364b7e [8238/8302] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: s390-randconfig-002-20260121 (https://download.01.org/0day-ci/archive/20260121/202601210715.vxSStJeF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210715.vxSStJeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210715.vxSStJeF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler-context-analysis.h:334:23: note: expanded from macro '__acquire'
     334 | #define __acquire(x)            __acquire_ctx_lock(x)
         |                                 ^
   In file included from mm/memory.c:44:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:1481:2: warning: releasing spinlock 'lruvec->lru_lock' that was not held [-Wthread-safety-analysis]
    1481 |         spin_unlock(&lruvec->lru_lock);
         |         ^
   include/linux/memcontrol.h:1486:2: warning: releasing spinlock 'lruvec->lru_lock' that was not held [-Wthread-safety-analysis]
    1486 |         spin_unlock_irq(&lruvec->lru_lock);
         |         ^
   include/linux/memcontrol.h:1492:2: warning: releasing spinlock 'lruvec->lru_lock' that was not held [-Wthread-safety-analysis]
    1492 |         spin_unlock_irqrestore(&lruvec->lru_lock, flags);
         |         ^
   In file included from mm/memory.c:48:
   include/linux/hugetlb.h:1318:1: warning: spinlock 'huge_pte_lockptr(h, mm, pte)' is still held at the end of function [-Wthread-safety-analysis]
    1318 | }
         | ^
   include/linux/hugetlb.h:1316:2: note: spinlock acquired here
    1316 |         spin_lock(ptl);
         |         ^
   In file included from mm/memory.c:55:
   In file included from include/linux/ksm.h:14:
   include/linux/rmap.h:115:1: warning: __context_bitlock '((#undefined * 8) - 1) + folio->....._mm_ids' is still held at the end of function [-Wthread-safety-analysis]
     115 | }
         | ^
   include/linux/rmap.h:114:2: note: __context_bitlock acquired here
     114 |         bit_spin_lock(FOLIO_MM_IDS_LOCK_BITNUM, &folio->_mm_ids);
         |         ^
   include/linux/rmap.h:119:2: warning: releasing __context_bitlock '((#undefined * 8) - 1) + folio->....._mm_ids' that was not held [-Wthread-safety-analysis]
     119 |         __bit_spin_unlock(FOLIO_MM_IDS_LOCK_BITNUM, &folio->_mm_ids);
         |         ^
   include/linux/rmap.h:892:3: warning: releasing spinlock 'pvmw->ptl' that was not held [-Wthread-safety-analysis]
     892 |                 spin_unlock(pvmw->ptl);
         |                 ^
   include/linux/rmap.h:910:3: warning: releasing spinlock 'pvmw->ptl' that was not held [-Wthread-safety-analysis]
     910 |                 spin_unlock(pvmw->ptl);
         |                 ^
   In file included from mm/memory.c:68:
   In file included from include/linux/shmem_fs.h:11:
   In file included from include/linux/fs_parser.h:11:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   include/linux/bpf.h:2470:24: warning: __ctx_lock_RCU 'RCU' is not held on every path through here [-Wthread-safety-analysis]
    2470 |                 run_ctx.bpf_cookie = item->bpf_cookie;
         |                                      ^
   include/linux/bpf.h:2468:4: note: __ctx_lock_RCU acquired here
    2468 |                         rcu_read_lock();
         |                         ^
   include/linux/bpf.h:2475:4: warning: releasing __ctx_lock_RCU 'RCU' that was not held [-Wthread-safety-analysis]
    2475 |                         rcu_read_unlock();
         |                         ^
   In file included from mm/memory.c:90:
   mm/internal.h:221:1: warning: rw_semaphore 'anon_vma->root->rwsem' is still held at the end of function [-Wthread-safety-analysis]
     221 | }
         | ^
   mm/internal.h:220:2: note: rw_semaphore acquired here
     220 |         down_write(&anon_vma->root->rwsem);
         |         ^
   mm/internal.h:230:2: warning: releasing rw_semaphore 'anon_vma->root->rwsem' that was not held [-Wthread-safety-analysis]
     230 |         up_write(&anon_vma->root->rwsem);
         |         ^
   mm/internal.h:236:1: warning: rw_semaphore 'anon_vma->root->rwsem' is still held at the end of function [-Wthread-safety-analysis]
     236 | }
         | ^
   mm/internal.h:235:2: note: rw_semaphore acquired here
     235 |         down_read(&anon_vma->root->rwsem);
         |         ^
   mm/internal.h:245:2: warning: releasing rw_semaphore 'anon_vma->root->rwsem' that was not held [-Wthread-safety-analysis]
     245 |         up_read(&anon_vma->root->rwsem);
         |         ^
   In file included from mm/memory.c:91:
   mm/swap.h:118:1: warning: spinlock '__swap_offset_to_cluster(si, offset).lock' is still held at the end of function [-Wthread-safety-analysis]
     118 | }
         | ^
   mm/swap.h:116:3: note: spinlock acquired here
     116 |                 spin_lock(&ci->lock);
         |                 ^
   mm/swap.h:178:2: warning: releasing spinlock 'ci->lock' that was not held [-Wthread-safety-analysis]
     178 |         spin_unlock(&ci->lock);
         |         ^
   mm/swap.h:183:2: warning: releasing spinlock 'ci->lock' that was not held [-Wthread-safety-analysis]
     183 |         spin_unlock_irq(&ci->lock);
         |         ^
   mm/memory.c:463:2: warning: releasing spinlock 'pmd_lock(mm, pmd)' that was not held [-Wthread-safety-analysis]
     463 |         spin_unlock(ptl);
         |         ^
   mm/memory.c:1267:3: warning: releasing spinlock 'dst_ptl' that was not held [-Wthread-safety-analysis]
    1267 |                 pte_unmap_unlock(dst_pte, dst_ptl);
         |                 ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:1346:2: warning: releasing spinlock 'dst_ptl' that was not held [-Wthread-safety-analysis]
    1346 |         pte_unmap_unlock(orig_dst_pte, dst_ptl);
         |         ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
>> mm/memory.c:1844:12: warning: spinlock 'pmd_lockptr(mm, pmd)' is not held on every path through here [-Wthread-safety-analysis]
    1844 |         *pmdval = pmdp_get(pmd);
         |                   ^
   mm/memory.c:1841:21: note: spinlock acquired here
    1841 |         if (ptl != pml && !spin_trylock(pml))
         |                            ^
>> mm/memory.c:1847:3: warning: releasing spinlock 'pmd_lockptr(mm, pmd)' that was not held [-Wthread-safety-analysis]
    1847 |                 spin_unlock(pml);
         |                 ^
>> mm/memory.c:1865:11: warning: spinlock 'ptl' is not held on every path through here [-Wthread-safety-analysis]
    1865 |         for (i = 0, pte = start_pte; i < PTRS_PER_PTE; i++, pte++) {
         |                  ^
   mm/memory.c:1863:3: note: spinlock acquired here
    1863 |                 spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
         |                 ^
   include/linux/spinlock.h:362:35: note: expanded from macro 'spin_lock_nested'
     362 |         __release(spinlock_check(lock)); __acquire(lock);       \
         |                                          ^
   include/linux/compiler-context-analysis.h:334:23: note: expanded from macro '__acquire'
     334 | #define __acquire(x)            __acquire_ctx_lock(x)
         |                                 ^
   mm/memory.c:1874:3: warning: releasing spinlock 'ptl' that was not held [-Wthread-safety-analysis]
    1874 |                 spin_unlock(ptl);
         |                 ^
   mm/memory.c:1875:2: warning: releasing spinlock 'pmd_lock(mm, pmd)' that was not held [-Wthread-safety-analysis]
    1875 |         spin_unlock(pml);
         |         ^
   mm/memory.c:1879:3: warning: releasing spinlock 'ptl' that was not held [-Wthread-safety-analysis]
    1879 |                 pte_unmap_unlock(start_pte, ptl);
         |                 ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:1881:3: warning: releasing spinlock 'pmd_lock(mm, pmd)' that was not held [-Wthread-safety-analysis]
    1881 |                 spin_unlock(pml);
         |                 ^
   mm/memory.c:1949:2: warning: releasing spinlock 'ptl' that was not held [-Wthread-safety-analysis]
    1949 |         pte_unmap_unlock(start_pte, ptl);
         |         ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:2005:4: warning: releasing spinlock 'pmd_lock(tlb->mm, pmd_offset(pud, addr))' that was not held [-Wthread-safety-analysis]
    2005 |                         spin_unlock(ptl);
         |                         ^
   mm/memory.c:2388:2: warning: releasing spinlock 'ptl' that was not held [-Wthread-safety-analysis]
    2388 |         pte_unmap_unlock(pte, ptl);
         |         ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:2445:5: warning: releasing spinlock 'pte_lock' that was not held [-Wthread-safety-analysis]
    2445 |                                 pte_unmap_unlock(start_pte, pte_lock);
         |                                 ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:2453:3: warning: releasing spinlock 'pte_lock' that was not held [-Wthread-safety-analysis]
    2453 |                 pte_unmap_unlock(start_pte, pte_lock);
         |                 ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:2671:2: warning: releasing spinlock 'ptl' that was not held [-Wthread-safety-analysis]
    2671 |         pte_unmap_unlock(pte, ptl);
         |         ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:2887:2: warning: releasing spinlock 'ptl' that was not held [-Wthread-safety-analysis]
    2887 |         pte_unmap_unlock(mapped_pte, ptl);
         |         ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:3253:3: warning: releasing spinlock 'ptl' that was not held [-Wthread-safety-analysis]
    3253 |                 pte_unmap_unlock(mapped_pte, ptl);
         |                 ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:3549:3: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    3549 |                 pte_unmap_unlock(vmf->pte, vmf->ptl);
         |                 ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:3880:3: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    3880 |                 pte_unmap_unlock(vmf->pte, vmf->ptl);
         |                 ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:3883:3: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    3883 |                 pte_unmap_unlock(vmf->pte, vmf->ptl);
         |                 ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:3938:3: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    3938 |                 pte_unmap_unlock(vmf->pte, vmf->ptl);
         |                 ^
   include/linux/mm.h:3359:2: note: expanded from macro 'pte_unmap_unlock'
    3359 |         spin_unlock(ptl);                               \
         |         ^
   mm/memory.c:3941:2: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    3941 |         wp_page_reuse(vmf, folio);
         |         ^
   mm/memory.c:3956:3: warning: releasing spinlock 'vmf->ptl' that was not held [-Wthread-safety-analysis]
    3956 |                 pte_unmap_unlock(vmf->pte, vmf->ptl);
--
     398 | }
         | ^
   include/linux/mmap_lock.h:396:2: note: rw_semaphore acquired here
     396 |         down_read(&mm->mmap_lock);
         |         ^
   include/linux/mmap_lock.h:423:2: warning: releasing rw_semaphore 'mm->.mmap_lock' that was not held [-Wthread-safety-analysis]
     423 |         up_read(&mm->mmap_lock);
         |         ^
   include/linux/mmap_lock.h:432:2: warning: releasing rw_semaphore 'mm->.mmap_lock' that was not held [-Wthread-safety-analysis]
     432 |         up_read_non_owner(&mm->mmap_lock);
         |         ^
   In file included from fs/ext4/symlink.c:23:
   In file included from fs/ext4/ext4.h:22:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:1274:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   include/linux/idr.h:191:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
     191 |         local_unlock(&radix_tree_preloads.lock);
         |         ^
   include/linux/local_lock.h:38:29: note: expanded from macro 'local_unlock'
      38 | #define local_unlock(lock)              __local_unlock(__this_cpu_local_lock(lock))
         |                                         ^
   include/linux/local_lock_internal.h:202:3: note: expanded from macro '__local_unlock'
     202 |                 __release(lock);                                \
         |                 ^
   include/linux/compiler-context-analysis.h:342:23: note: expanded from macro '__release'
     342 | #define __release(x)            __release_ctx_lock(x)
         |                                 ^
   In file included from fs/ext4/symlink.c:23:
   In file included from fs/ext4/ext4.h:22:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   include/linux/mm.h:3422:1: warning: spinlock 'pmd_lockptr(mm, pmd)' is still held at the end of function [-Wthread-safety-analysis]
    3422 | }
         | ^
   include/linux/mm.h:3420:2: note: spinlock acquired here
    3420 |         spin_lock(ptl);
         |         ^
   include/linux/mm.h:3451:1: warning: spinlock 'pud_lockptr(mm, pud)' is still held at the end of function [-Wthread-safety-analysis]
    3451 | }
         | ^
   include/linux/mm.h:3449:2: note: spinlock acquired here
    3449 |         spin_lock(ptl);
         |         ^
   In file included from fs/ext4/symlink.c:23:
   In file included from fs/ext4/ext4.h:22:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:11:
   include/linux/device.h:896:1: warning: mutex 'dev->mutex' is still held at the end of function [-Wthread-safety-analysis]
     896 | }
         | ^
   include/linux/device.h:895:2: note: mutex acquired here
     895 |         mutex_lock(&dev->mutex);
         |         ^
   include/linux/mutex.h:194:26: note: expanded from macro 'mutex_lock'
     194 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                          ^
   In file included from fs/ext4/symlink.c:23:
   In file included from fs/ext4/ext4.h:22:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:11:
   include/linux/device.h:910:2: warning: releasing mutex 'dev->mutex' that was not held [-Wthread-safety-analysis]
     910 |         mutex_unlock(&dev->mutex);
         |         ^
   In file included from fs/ext4/symlink.c:23:
   In file included from fs/ext4/ext4.h:22:
   include/linux/blkdev.h:1090:1: warning: mutex 'q->limits_lock' is still held at the end of function [-Wthread-safety-analysis]
    1090 | }
         | ^
   include/linux/blkdev.h:1088:2: note: mutex acquired here
    1088 |         mutex_lock(&q->limits_lock);
         |         ^
   include/linux/mutex.h:194:26: note: expanded from macro 'mutex_lock'
     194 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                          ^
   In file included from fs/ext4/symlink.c:23:
   In file included from fs/ext4/ext4.h:22:
   include/linux/blkdev.h:1108:2: warning: releasing mutex 'q->limits_lock' that was not held [-Wthread-safety-analysis]
    1108 |         mutex_unlock(&q->limits_lock);
         |         ^
   In file included from fs/ext4/symlink.c:23:
   In file included from fs/ext4/ext4.h:24:
   include/linux/jbd2.h:344:1: warning: __context_bitlock 'BH_JournalHead + bh->b_state' is still held at the end of function [-Wthread-safety-analysis]
     344 | }
         | ^
   include/linux/jbd2.h:343:2: note: __context_bitlock acquired here
     343 |         bit_spin_lock(BH_JournalHead, &bh->b_state);
         |         ^
   include/linux/jbd2.h:348:2: warning: releasing __context_bitlock 'BH_JournalHead + bh->b_state' that was not held [-Wthread-safety-analysis]
     348 |         bit_spin_unlock(BH_JournalHead, &bh->b_state);
         |         ^
   In file included from fs/ext4/symlink.c:23:
>> fs/ext4/ext4.h:1843:1: warning: mutex 'EXT4_SB(sb).s_fc_lock' is still held at the end of function [-Wthread-safety-analysis]
    1843 | }
         | ^
   fs/ext4/ext4.h:1841:2: note: mutex acquired here
    1841 |         mutex_lock(&EXT4_SB(sb)->s_fc_lock);
         |         ^
   include/linux/mutex.h:194:26: note: expanded from macro 'mutex_lock'
     194 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                          ^
   In file included from fs/ext4/symlink.c:23:
>> fs/ext4/ext4.h:1848:2: warning: releasing mutex 'EXT4_SB(sb).s_fc_lock' that was not held [-Wthread-safety-analysis]
    1848 |         mutex_unlock(&EXT4_SB(sb)->s_fc_lock);
         |         ^
   fs/ext4/ext4.h:3589:1: warning: spinlock 'ext4_group_lock_ptr(sb, group)' is not held on every path through here [-Wthread-safety-analysis]
    3589 | }
         | ^
   fs/ext4/ext4.h:3581:7: note: spinlock acquired here
    3581 |         if (!spin_trylock(ext4_group_lock_ptr(sb, group)))
         |              ^
   fs/ext4/ext4.h:3602:1: warning: spinlock 'ext4_group_lock_ptr(sb, group)' is not held on every path through here [-Wthread-safety-analysis]
    3602 | }
         | ^
   fs/ext4/ext4.h:3600:3: note: spinlock acquired here
    3600 |                 spin_lock(ext4_group_lock_ptr(sb, group));
         |                 ^
   fs/ext4/ext4.h:3607:2: warning: releasing spinlock 'ext4_group_lock_ptr(sb, group)' that was not held [-Wthread-safety-analysis]
    3607 |         spin_unlock(ext4_group_lock_ptr(sb, group));
         |         ^
   In file included from fs/ext4/symlink.c:24:
   fs/ext4/xattr.h:160:1: warning: rw_semaphore 'EXT4_I(inode).xattr_sem' is still held at the end of function [-Wthread-safety-analysis]
     160 | }
         | ^
   fs/ext4/xattr.h:157:2: note: rw_semaphore acquired here
     157 |         down_write(&EXT4_I(inode)->xattr_sem);
         |         ^
   fs/ext4/xattr.h:169:1: warning: rw_semaphore 'EXT4_I(inode).xattr_sem' is not held on every path through here [-Wthread-safety-analysis]
     169 | }
         | ^
   fs/ext4/xattr.h:164:6: note: rw_semaphore acquired here
     164 |         if (down_write_trylock(&EXT4_I(inode)->xattr_sem) == 0)
         |             ^
   fs/ext4/xattr.h:175:2: warning: releasing rw_semaphore 'EXT4_I(inode).xattr_sem' that was not held [-Wthread-safety-analysis]
     175 |         up_write(&EXT4_I(inode)->xattr_sem);
         |         ^
   44 warnings generated.
..


vim +1844 mm/memory.c

ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1835) 
1355b4064623472 David Hildenbrand (Red Hat  2026-01-19  1836) static bool zap_empty_pte_table(struct mm_struct *mm, pmd_t *pmd,
1355b4064623472 David Hildenbrand (Red Hat  2026-01-19  1837) 		spinlock_t *ptl, pmd_t *pmdval)
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1838) {
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1839) 	spinlock_t *pml = pmd_lockptr(mm, pmd);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1840) 
1355b4064623472 David Hildenbrand (Red Hat  2026-01-19  1841) 	if (ptl != pml && !spin_trylock(pml))
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1842) 		return false;
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1843) 
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19 @1844) 	*pmdval = pmdp_get(pmd);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1845) 	pmd_clear(pmd);
1355b4064623472 David Hildenbrand (Red Hat  2026-01-19  1846) 	if (ptl != pml)
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19 @1847) 		spin_unlock(pml);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1848) 	return true;
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1849) }
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1850) 
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1851) static bool zap_pte_table_if_empty(struct mm_struct *mm, pmd_t *pmd,
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1852) 		unsigned long addr, pmd_t *pmdval)
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1853) {
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1854) 	spinlock_t *pml, *ptl = NULL;
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1855) 	pte_t *start_pte, *pte;
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1856) 	int i;
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1857) 
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1858) 	pml = pmd_lock(mm, pmd);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1859) 	start_pte = pte_offset_map_rw_nolock(mm, pmd, addr, pmdval, &ptl);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1860) 	if (!start_pte)
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1861) 		goto out_ptl;
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1862) 	if (ptl != pml)
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1863) 		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1864) 
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19 @1865) 	for (i = 0, pte = start_pte; i < PTRS_PER_PTE; i++, pte++) {
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1866) 		if (!pte_none(ptep_get(pte)))
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1867) 			goto out_ptl;
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1868) 	}
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1869) 	pte_unmap(start_pte);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1870) 
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1871) 	pmd_clear(pmd);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1872) 
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1873) 	if (ptl != pml)
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1874) 		spin_unlock(ptl);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1875) 	spin_unlock(pml);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1876) 	return true;
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1877) out_ptl:
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1878) 	if (start_pte)
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1879) 		pte_unmap_unlock(start_pte, ptl);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1880) 	if (ptl != pml)
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1881) 		spin_unlock(pml);
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1882) 	return false;
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1883) }
ba40d7ff6ac6527 David Hildenbrand (Red Hat  2026-01-19  1884) 

:::::: The code at line 1844 was first introduced by commit
:::::: ba40d7ff6ac6527ccd84ebc327f2f1879b6f8bc5 mm: move pte table reclaim code to memory.c

:::::: TO: David Hildenbrand (Red Hat) <david@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
