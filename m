Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B492A19BD0;
	Sat, 11 Nov 2023 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDNDiMU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699721767; x=1731257767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A0IzYF/EcnYAJfkHnnWJB4eW3ubB9ZyiM2DgeChIMYc=;
  b=mDNDiMU9ovNkSDNTPd/JXl2+QeuTLzLjqRcQ5fDWlZLDZZ08TFFtzaMw
   fUxJiPhawXcNc/v5rRGgtOV2vW06+40qZ4yyAdZIV/59YxfZHqb4pLOCy
   jO3hoMYrw6BwG6+odQNBx/grYh/3i3CsxYMxmy5HlzHLHohAVJ2e06ywT
   OJnM9+4yO9tEco4xUdHdIjC2RzllU6Ip4x0jnG/GESGsTJtu5M8kJD2sM
   OxJZvytQrz3UC/pjWGZbzquCDIw3BUfRvzWW5WMplWiro7h7sWOA3L79G
   IlicgvdY+/H8syuSep64ytzKxfVe0roVR/GptfvcvJSxLGqEQhP6R0RpY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="380674563"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="380674563"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 08:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="5091503"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Nov 2023 08:56:05 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1rH9-000Ad8-1h;
	Sat, 11 Nov 2023 16:56:03 +0000
Date: Sun, 12 Nov 2023 00:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id_old 12/19] mm/memory.c:3417:60: warning:
 variable 'i' is uninitialized when used here
Message-ID: <202311120052.vIhAgYJe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id_old
head:   1210309577278957a807962756909d776d781227
commit: 1f88dc1d6d5f944bf066f25c90cc0820873fb6b8 [12/19] mm/memory: COW reuse support for PTE-mapped THP with rmap IDs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231112/202311120052.vIhAgYJe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120052.vIhAgYJe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120052.vIhAgYJe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:3417:60: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    3417 |                         unsigned int mapcount = page_mapcount(folio_page(folio, i));
         |                                                                                 ^
   include/linux/page-flags.h:282:55: note: expanded from macro 'folio_page'
     282 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                                          ^
   include/linux/mm.h:216:37: note: expanded from macro 'nth_page'
     216 | #define nth_page(page,n) ((page) + (n))
         |                                     ^
   mm/memory.c:3367:18: note: initialize the variable 'i' to silence this warning
    3367 |                 int mapcount, i;
         |                                ^
         |                                 = 0
   1 warning generated.


vim +/i +3417 mm/memory.c

  3359	
  3360	static bool wp_can_reuse_anon_folio(struct folio *folio,
  3361					    struct vm_area_struct *vma)
  3362	{
  3363	#ifdef CONFIG_RMAP_ID
  3364		if (folio_test_large(folio)) {
  3365			bool retried = false;
  3366			unsigned long start;
  3367			int mapcount, i;
  3368	
  3369			/*
  3370			 * The assumption for anonymous folios is that each page can
  3371			 * only get mapped once into a MM.  This also holds for
  3372			 * small folios -- except when KSM is involved. KSM does
  3373			 * currently not apply to large folios.
  3374			 *
  3375			 * Further, each taken mapcount must be paired with exactly one
  3376			 * taken reference, whereby references must be incremented
  3377			 * before the mapcount when mapping a page, and references must
  3378			 * be decremented after the mapcount when unmapping a page.
  3379			 *
  3380			 * So if all references to a folio are from mappings, and all
  3381			 * mappings are due to our (MM) page tables, and there was no
  3382			 * concurrent (un)mapping, this folio is certainly exclusive.
  3383			 *
  3384			 * We currently don't optimize for:
  3385			 * (a) folio is mapped into multiple page tables in this
  3386			 *     MM (e.g., mremap) and other page tables are
  3387			 *     concurrently (un)mapping the folio.
  3388			 * (b) the folio is in the swapcache. Likely the other PTEs
  3389			 *     are still swap entries and folio_free_swap() woukd fail.
  3390			 * (c) the folio is in the LRU cache.
  3391			 */
  3392	retry:
  3393			start = raw_read_atomic_seqcount(&folio->_rmap_atomic_seqcount);
  3394			if (start & ATOMIC_SEQCOUNT_WRITERS_MASK)
  3395				return false;
  3396			mapcount = folio_mapcount(folio);
  3397	
  3398			/* Is this folio possibly exclusive ... */
  3399			if (mapcount > folio_nr_pages(folio) || folio_entire_mapcount(folio))
  3400				return false;
  3401	
  3402			/* ... and are all references from mappings ... */
  3403			if (folio_ref_count(folio) != mapcount)
  3404				return false;
  3405	
  3406			/* ... and do all mappings belong to us ... */
  3407			if (!__folio_large_has_matching_rmap_val(folio, mapcount, vma->vm_mm))
  3408				return false;
  3409	
  3410			/* ... and was there no concurrent (un)mapping ? */
  3411			if (raw_read_atomic_seqcount_retry(&folio->_rmap_atomic_seqcount,
  3412							   start))
  3413				return false;
  3414	
  3415			/* Safety checks we might want to drop in the future. */
  3416			if (IS_ENABLED(CONFIG_DEBUG_VM)) {
> 3417				unsigned int mapcount = page_mapcount(folio_page(folio, i));
  3418	
  3419				if (WARN_ON_ONCE(folio_test_ksm(folio)))
  3420					return false;
  3421				/*
  3422				 * We might have raced against swapout code adding
  3423				 * the folio to the swapcache (which, by itself, is not
  3424				 * problematic). Let's simply check again if we would
  3425				 * properly detect the additional reference now and
  3426				 * properly fail.
  3427				 */
  3428				if (unlikely(folio_test_swapcache(folio))) {
  3429					if (WARN_ON_ONCE(retried))
  3430						return false;
  3431					retried = true;
  3432					goto retry;
  3433				}
  3434				for (i = 0; i < folio_nr_pages(folio); i++)
  3435					if (WARN_ON_ONCE(mapcount > 1))
  3436						return false;
  3437			}
  3438	
  3439			/*
  3440			 * This folio is exclusive to us. Do we need the page lock?
  3441			 * Likely not, and a trylock would be unfortunate if this
  3442			 * folio is mapped into multiple page tables and we get
  3443			 * concurrent page faults. If there would be references from
  3444			 * page migration/swapout/swapcache, we would have detected
  3445			 * an additional reference and never ended up here.
  3446			 */
  3447			return true;
  3448		}
  3449	#endif /* CONFIG_RMAP_ID */
  3450		/*
  3451		 * We have to verify under folio lock: these early checks are
  3452		 * just an optimization to avoid locking the folio and freeing
  3453		 * the swapcache if there is little hope that we can reuse.
  3454		 *
  3455		 * KSM doesn't necessarily raise the folio refcount.
  3456		 */
  3457		if (folio_test_ksm(folio) || folio_ref_count(folio) > 3)
  3458			return false;
  3459		if (!folio_test_lru(folio))
  3460			/*
  3461			 * We cannot easily detect+handle references from
  3462			 * remote LRU caches or references to LRU folios.
  3463			 */
  3464			lru_add_drain();
  3465		if (folio_ref_count(folio) > 1 + folio_test_swapcache(folio))
  3466			return false;
  3467		if (!folio_trylock(folio))
  3468			return false;
  3469		if (folio_test_swapcache(folio))
  3470			folio_free_swap(folio);
  3471		if (folio_test_ksm(folio) || folio_ref_count(folio) != 1) {
  3472			folio_unlock(folio);
  3473			return false;
  3474		}
  3475		/*
  3476		 * Ok, we've got the only folio reference from our mapping
  3477		 * and the folio is locked, it's dark out, and we're wearing
  3478		 * sunglasses. Hit it.
  3479		 */
  3480		folio_move_anon_rmap(folio, vma);
  3481		folio_unlock(folio);
  3482		return true;
  3483	}
  3484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
