Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8040340274;
	Wed, 21 Jan 2026 03:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768965809; cv=none; b=c5wyORcX+/2PwDH31JlQl6VOZgVbGe3jcgynFRM4D5ji6/0ed5Cz3zqOkwA8YRuazoh8vzOHw7/XA5fg0Ir/xH9kl4uokdHA0ClAuzphvl63+5obLa+7Zjg/TI0NDPqWs9a9PpP1YAxMNEYn+p1B1qjSvhRP+z9re6L+hrvM3r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768965809; c=relaxed/simple;
	bh=QMiYmjv5N7rpU5x0Xdn4caqS9huZ/8nldNkkaBlohWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YYU5BOrjl0/rhaQhvbZF3SH+IPxBlcwLI+cXkjz5o8DkzjSnaNVCtdID8EgGKQw2lEzTPKiJkTjDx38argnQXMMXff3FYH439NHeo7dwwsyE8s0cQjxM71CQNH2SoGX6vrpJn7VW2hxFFtwbOpeVAqi9XFoEt+UkkalVE1YhaqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyoZXtO5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyoZXtO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768965806; x=1800501806;
  h=date:from:to:cc:subject:message-id;
  bh=QMiYmjv5N7rpU5x0Xdn4caqS9huZ/8nldNkkaBlohWg=;
  b=FyoZXtO506QwvQyMkB9bT+UdGEpi0Nm/Oia6p8DOQ7KFqv9mrIbGXG3i
   vi+rxbqd+KAxIs2rQdR4eQoQshrw4F1FAWh+H/t+AlSYSnLjr3ryAZNEu
   zmJJ9UOsx5tnc9BgD4w85qMHNmQo9i582diQrPxkaLOOx/g0KoeubTofF
   LPKvZrDzx9lB+eAWo8gm+tgqC3XEMmhISlc7D5G2uFOQXsK3BGeWCejbR
   TgfjzqIamIvYkrFxNkJ203cchsIjTBpHIj40Bhj6angYLtns/VNT39duD
   fFMTZvtGtUaWQKCVSFzgmeQfKJMxuD5tlR9PsA9MAcpoujYKCqaDVDHIb
   w==;
X-CSE-ConnectionGUID: azcEcSYLT1+ZyEh2NGeZOw==
X-CSE-MsgGUID: vHcUoHDlR9K/3SdrSPJ/5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69204233"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="69204233"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 19:23:25 -0800
X-CSE-ConnectionGUID: ECNv+WtjRNugoxZnBolybQ==
X-CSE-MsgGUID: a2/xywbuSCWjUMJdMMxY7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210758537"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jan 2026 19:23:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viOoS-00000000Pur-23V3;
	Wed, 21 Jan 2026 03:23:20 +0000
Date: Wed, 21 Jan 2026 11:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: [tip:locking/core 20/43] include/linux/rmap.h:123:1:
 warning: rw_semaphore 'anon_vma->root->rwsem' is still held at the end of
 function
Message-ID: <202601211136.rAqSN4rF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   ccf9e070116a81d29aae30db501d562c8efd1ed8
commit: e4fd3be884cf33a42c5bcde087b0722a5b8f25ca [20/43] locking/rwsem: Support Clang's context analysis
config: s390-randconfig-002-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211136.rAqSN4rF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211136.rAqSN4rF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211136.rAqSN4rF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/fs.h:1083:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
    1083 | }
         | ^
   include/linux/fs.h:1082:2: note: rw_semaphore acquired here
    1082 |         down_write(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:1087:2: warning: releasing rw_semaphore 'mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
    1087 |         up_write(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:1093:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
    1093 | }
         | ^
   include/linux/fs.h:1092:2: note: rw_semaphore acquired here
    1092 |         down_read(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:1104:2: warning: releasing rw_semaphore 'mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
    1104 |         up_read(&mapping->invalidate_lock);
         |         ^
   In file included from mm/pagewalk.c:2:
   In file included from include/linux/pagewalk.h:5:
   include/linux/mm.h:3436:1: warning: spinlock 'pmd_lockptr(mm, pmd)' is still held at the end of function [-Wthread-safety-analysis]
    3436 | }
         | ^
   include/linux/mm.h:3434:2: note: spinlock acquired here
    3434 |         spin_lock(ptl);
         |         ^
   include/linux/mm.h:3465:1: warning: spinlock 'pud_lockptr(mm, pud)' is still held at the end of function [-Wthread-safety-analysis]
    3465 | }
         | ^
   include/linux/mm.h:3463:2: note: spinlock acquired here
    3463 |         spin_lock(ptl);
         |         ^
   In file included from mm/pagewalk.c:5:
   include/linux/hugetlb.h:1316:1: warning: spinlock 'huge_pte_lockptr(h, mm, pte)' is still held at the end of function [-Wthread-safety-analysis]
    1316 | }
         | ^
   include/linux/hugetlb.h:1314:2: note: spinlock acquired here
    1314 |         spin_lock(ptl);
         |         ^
   In file included from mm/pagewalk.c:7:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
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
   In file included from mm/pagewalk.c:7:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   include/linux/device.h:910:2: warning: releasing mutex 'dev->mutex' that was not held [-Wthread-safety-analysis]
     910 |         mutex_unlock(&dev->mutex);
         |         ^
   In file included from mm/pagewalk.c:7:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:1243:1: warning: spinlock 'folio_pgdat(folio).__lruvec.lru_lock' is still held at the end of function [-Wthread-safety-analysis]
    1243 | }
         | ^
   include/linux/memcontrol.h:1241:2: note: spinlock acquired here
    1241 |         spin_lock(&pgdat->__lruvec.lru_lock);
         |         ^
   include/linux/memcontrol.h:1251:1: warning: spinlock 'folio_pgdat(folio).__lruvec.lru_lock' is still held at the end of function [-Wthread-safety-analysis]
    1251 | }
         | ^
   include/linux/memcontrol.h:1249:2: note: spinlock acquired here
    1249 |         spin_lock_irq(&pgdat->__lruvec.lru_lock);
         |         ^
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
   In file included from mm/pagewalk.c:7:
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
   In file included from mm/pagewalk.c:12:
   In file included from mm/internal.h:16:
>> include/linux/rmap.h:123:1: warning: rw_semaphore 'anon_vma->root->rwsem' is still held at the end of function [-Wthread-safety-analysis]
     123 | }
         | ^
   include/linux/rmap.h:122:2: note: rw_semaphore acquired here
     122 |         down_write(&anon_vma->root->rwsem);
         |         ^
>> include/linux/rmap.h:132:2: warning: releasing rw_semaphore 'anon_vma->root->rwsem' that was not held [-Wthread-safety-analysis]
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
   mm/pagewalk.c:89:4: warning: releasing spinlock 'ptl' that was not held [-Wthread-safety-analysis]
      89 |                         pte_unmap_unlock(pte, ptl);
         |                         ^
   include/linux/mm.h:3373:2: note: expanded from macro 'pte_unmap_unlock'
    3373 |         spin_unlock(ptl);                               \
         |         ^
   mm/pagewalk.c:925:4: warning: releasing spinlock 'pud_lock(vma->vm_mm, pud_offset(p4d_offset(pgd_offset_raw(vma->vm_mm->.pgd, addr), addr), addr))' that was not held [-Wthread-safety-analysis]
     925 |                         spin_unlock(ptl);
         |                         ^
   mm/pagewalk.c:928:4: warning: releasing spinlock 'pud_lock(vma->vm_mm, pud_offset(p4d_offset(pgd_offset_raw(vma->vm_mm->.pgd, addr), addr), addr))' that was not held [-Wthread-safety-analysis]
     928 |                         spin_unlock(ptl);
         |                         ^
   mm/pagewalk.c:939:3: warning: releasing spinlock 'pud_lock(vma->vm_mm, pud_offset(p4d_offset(pgd_offset_raw(vma->vm_mm->.pgd, addr), addr), addr))' that was not held [-Wthread-safety-analysis]
     939 |                 spin_unlock(ptl);
         |                 ^
   mm/pagewalk.c:960:4: warning: releasing spinlock 'pmd_lock(vma->vm_mm, pmd_offset(pud_offset(p4d_offset(pgd_offset_raw(vma->vm_mm->.pgd, addr), addr), addr), addr))' that was not held [-Wthread-safety-analysis]
     960 |                         spin_unlock(ptl);
         |                         ^
   mm/pagewalk.c:963:4: warning: releasing spinlock 'pmd_lock(vma->vm_mm, pmd_offset(pud_offset(p4d_offset(pgd_offset_raw(vma->vm_mm->.pgd, addr), addr), addr), addr))' that was not held [-Wthread-safety-analysis]
     963 |                         spin_unlock(ptl);
         |                         ^
   mm/pagewalk.c:983:3: warning: releasing spinlock 'pmd_lock(vma->vm_mm, pmd_offset(pud_offset(p4d_offset(pgd_offset_raw(vma->vm_mm->.pgd, addr), addr), addr), addr))' that was not held [-Wthread-safety-analysis]
     983 |                 spin_unlock(ptl);
         |                 ^
   mm/pagewalk.c:1018:2: warning: releasing spinlock 'ptl' that was not held [-Wthread-safety-analysis]
    1018 |         pte_unmap_unlock(ptep, ptl);
         |         ^
   include/linux/mm.h:3373:2: note: expanded from macro 'pte_unmap_unlock'
    3373 |         spin_unlock(ptl);                               \
         |         ^
   56 warnings generated.
--
         |         ^
   include/linux/fs.h:1093:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
    1093 | }
         | ^
   include/linux/fs.h:1092:2: note: rw_semaphore acquired here
    1092 |         down_read(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:1104:2: warning: releasing rw_semaphore 'mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
    1104 |         up_read(&mapping->invalidate_lock);
         |         ^
   In file included from mm/sparse-vmemmap.c:21:
   include/linux/mm.h:3436:1: warning: spinlock 'pmd_lockptr(mm, pmd)' is still held at the end of function [-Wthread-safety-analysis]
    3436 | }
         | ^
   include/linux/mm.h:3434:2: note: spinlock acquired here
    3434 |         spin_lock(ptl);
         |         ^
   include/linux/mm.h:3465:1: warning: spinlock 'pud_lockptr(mm, pud)' is still held at the end of function [-Wthread-safety-analysis]
    3465 | }
         | ^
   include/linux/mm.h:3463:2: note: spinlock acquired here
    3463 |         spin_lock(ptl);
         |         ^
   In file included from mm/sparse-vmemmap.c:35:
   In file included from mm/hugetlb_vmemmap.h:11:
   include/linux/hugetlb.h:1316:1: warning: spinlock 'huge_pte_lockptr(h, mm, pte)' is still held at the end of function [-Wthread-safety-analysis]
    1316 | }
         | ^
   include/linux/hugetlb.h:1314:2: note: spinlock acquired here
    1314 |         spin_lock(ptl);
         |         ^
   In file included from mm/sparse-vmemmap.c:43:
   In file included from mm/internal.h:13:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
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
   In file included from mm/sparse-vmemmap.c:43:
   In file included from mm/internal.h:13:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   include/linux/device.h:910:2: warning: releasing mutex 'dev->mutex' that was not held [-Wthread-safety-analysis]
     910 |         mutex_unlock(&dev->mutex);
         |         ^
   In file included from mm/sparse-vmemmap.c:43:
   In file included from mm/internal.h:13:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:1243:1: warning: spinlock 'folio_pgdat(folio).__lruvec.lru_lock' is still held at the end of function [-Wthread-safety-analysis]
    1243 | }
         | ^
   include/linux/memcontrol.h:1241:2: note: spinlock acquired here
    1241 |         spin_lock(&pgdat->__lruvec.lru_lock);
         |         ^
   include/linux/memcontrol.h:1251:1: warning: spinlock 'folio_pgdat(folio).__lruvec.lru_lock' is still held at the end of function [-Wthread-safety-analysis]
    1251 | }
         | ^
   include/linux/memcontrol.h:1249:2: note: spinlock acquired here
    1249 |         spin_lock_irq(&pgdat->__lruvec.lru_lock);
         |         ^
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
   In file included from mm/sparse-vmemmap.c:43:
   In file included from mm/internal.h:13:
   In file included from include/linux/mm_inline.h:8:
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
   In file included from mm/sparse-vmemmap.c:43:
   In file included from mm/internal.h:16:
>> include/linux/rmap.h:123:1: warning: rw_semaphore 'anon_vma->root->rwsem' is still held at the end of function [-Wthread-safety-analysis]
     123 | }
         | ^
   include/linux/rmap.h:122:2: note: rw_semaphore acquired here
     122 |         down_write(&anon_vma->root->rwsem);
         |         ^
>> include/linux/rmap.h:132:2: warning: releasing rw_semaphore 'anon_vma->root->rwsem' that was not held [-Wthread-safety-analysis]
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
   48 warnings generated.
--
         |         ^
   include/linux/fs.h:1078:1: warning: rw_semaphore 'inode->i_rwsem' is still held at the end of function [-Wthread-safety-analysis]
    1078 | }
         | ^
   include/linux/fs.h:1077:2: note: rw_semaphore acquired here
    1077 |         down_read_nested(&inode->i_rwsem, subclass);
         |         ^
   include/linux/fs.h:1083:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
    1083 | }
         | ^
   include/linux/fs.h:1082:2: note: rw_semaphore acquired here
    1082 |         down_write(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:1087:2: warning: releasing rw_semaphore 'mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
    1087 |         up_write(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:1093:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
    1093 | }
         | ^
   include/linux/fs.h:1092:2: note: rw_semaphore acquired here
    1092 |         down_read(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:1104:2: warning: releasing rw_semaphore 'mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
    1104 |         up_read(&mapping->invalidate_lock);
         |         ^
   In file included from mm/list_lru.c:9:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   include/linux/mm.h:3436:1: warning: spinlock 'pmd_lockptr(mm, pmd)' is still held at the end of function [-Wthread-safety-analysis]
    3436 | }
         | ^
   include/linux/mm.h:3434:2: note: spinlock acquired here
    3434 |         spin_lock(ptl);
         |         ^
   include/linux/mm.h:3465:1: warning: spinlock 'pud_lockptr(mm, pud)' is still held at the end of function [-Wthread-safety-analysis]
    3465 | }
         | ^
   include/linux/mm.h:3463:2: note: spinlock acquired here
    3463 |         spin_lock(ptl);
         |         ^
   In file included from mm/list_lru.c:14:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
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
   In file included from mm/list_lru.c:14:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   include/linux/device.h:910:2: warning: releasing mutex 'dev->mutex' that was not held [-Wthread-safety-analysis]
     910 |         mutex_unlock(&dev->mutex);
         |         ^
   In file included from mm/list_lru.c:14:
   include/linux/memcontrol.h:1243:1: warning: spinlock 'folio_pgdat(folio).__lruvec.lru_lock' is still held at the end of function [-Wthread-safety-analysis]
    1243 | }
         | ^
   include/linux/memcontrol.h:1241:2: note: spinlock acquired here
    1241 |         spin_lock(&pgdat->__lruvec.lru_lock);
         |         ^
   include/linux/memcontrol.h:1251:1: warning: spinlock 'folio_pgdat(folio).__lruvec.lru_lock' is still held at the end of function [-Wthread-safety-analysis]
    1251 | }
         | ^
   include/linux/memcontrol.h:1249:2: note: spinlock acquired here
    1249 |         spin_lock_irq(&pgdat->__lruvec.lru_lock);
         |         ^
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
   In file included from mm/list_lru.c:14:
   include/linux/memcontrol.h:1470:2: warning: releasing spinlock 'lruvec->lru_lock' that was not held [-Wthread-safety-analysis]
    1470 |         spin_unlock(&lruvec->lru_lock);
         |         ^
   include/linux/memcontrol.h:1475:2: warning: releasing spinlock 'lruvec->lru_lock' that was not held [-Wthread-safety-analysis]
    1475 |         spin_unlock_irq(&lruvec->lru_lock);
         |         ^
   include/linux/memcontrol.h:1481:2: warning: releasing spinlock 'lruvec->lru_lock' that was not held [-Wthread-safety-analysis]
    1481 |         spin_unlock_irqrestore(&lruvec->lru_lock, flags);
         |         ^
   In file included from mm/list_lru.c:16:
   In file included from mm/internal.h:16:
>> include/linux/rmap.h:123:1: warning: rw_semaphore 'anon_vma->root->rwsem' is still held at the end of function [-Wthread-safety-analysis]
     123 | }
         | ^
   include/linux/rmap.h:122:2: note: rw_semaphore acquired here
     122 |         down_write(&anon_vma->root->rwsem);
         |         ^
>> include/linux/rmap.h:132:2: warning: releasing rw_semaphore 'anon_vma->root->rwsem' that was not held [-Wthread-safety-analysis]
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
   mm/list_lru.c:149:1: warning: spinlock 'lru->node[nid].lru.lock' is still held at the end of function [-Wthread-safety-analysis]
     149 | }
         | ^
   mm/list_lru.c:146:3: note: spinlock acquired here
     146 |                 spin_lock(&l->lock);
         |                 ^
   mm/list_lru.c:154:3: warning: releasing spinlock 'l->lock' that was not held [-Wthread-safety-analysis]
     154 |                 spin_unlock_irq(&l->lock);
         |                 ^
   mm/list_lru.c:156:3: warning: releasing spinlock 'l->lock' that was not held [-Wthread-safety-analysis]
     156 |                 spin_unlock(&l->lock);
         |                 ^
   50 warnings generated.
..


vim +123 include/linux/rmap.h

^1da177e4c3f41 Linus Torvalds        2005-04-16  119  
4fc3f1d66b1ef0 Ingo Molnar           2012-12-02  120  static inline void anon_vma_lock_write(struct anon_vma *anon_vma)
cba48b98f2348c Rik van Riel          2010-08-09  121  {
5a505085f043e8 Ingo Molnar           2012-12-02  122  	down_write(&anon_vma->root->rwsem);
cba48b98f2348c Rik van Riel          2010-08-09 @123  }
cba48b98f2348c Rik van Riel          2010-08-09  124  
adef440691bab8 Andrea Arcangeli      2023-12-06  125  static inline int anon_vma_trylock_write(struct anon_vma *anon_vma)
adef440691bab8 Andrea Arcangeli      2023-12-06  126  {
adef440691bab8 Andrea Arcangeli      2023-12-06  127  	return down_write_trylock(&anon_vma->root->rwsem);
adef440691bab8 Andrea Arcangeli      2023-12-06  128  }
adef440691bab8 Andrea Arcangeli      2023-12-06  129  
08b52706d50565 Konstantin Khlebnikov 2013-02-22  130  static inline void anon_vma_unlock_write(struct anon_vma *anon_vma)
cba48b98f2348c Rik van Riel          2010-08-09  131  {
5a505085f043e8 Ingo Molnar           2012-12-02 @132  	up_write(&anon_vma->root->rwsem);
cba48b98f2348c Rik van Riel          2010-08-09  133  }
cba48b98f2348c Rik van Riel          2010-08-09  134  

:::::: The code at line 123 was first introduced by commit
:::::: cba48b98f2348c814316c4b4f411a07a0e4a2bf9 mm: change direct call of spin_lock(anon_vma->lock) to inline function

:::::: TO: Rik van Riel <riel@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
