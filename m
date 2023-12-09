Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B653386;
	Sat,  9 Dec 2023 00:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUBhNtYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702081722; x=1733617722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AIMMAzsVLfZjPEfHy/CtLSGunxKz6D9a92siwkguhk8=;
  b=hUBhNtYYYh0L2sFvPVH25EwIZAVXbvYM8tUhqqRz4qOYtIYiXCtrzWl9
   RIEqAB7WG1n7LWZg9n21WmKNiQbp57R2Bcm1pPKi8Q7pibVHvJZN0GxX0
   4ufhucmbOOZL4aWQ/fTg4U1rJl2KWqvfoo1uvljrRY3qMz0CUXecUlsV0
   eTeTnbArE8AqeUxXnJHFyMDjQeILUnDfrfK/+wrL75O4Qhw3fnyepT8fl
   K3zNGnc/dFqFeLr+9gdNpWFrwdRYt7TbSQnfj1yzQcc5jBsnkhzl5cLcQ
   IrinpUHy1EE1w8FM4CliC6S9OqrWXjSkZoVvS9hnlawpAcG/7yD9UnJ0m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="374644637"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="374644637"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 16:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1019535231"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="1019535231"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2023 16:28:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBlCw-000EaP-0E;
	Sat, 09 Dec 2023 00:28:38 +0000
Date: Sat, 9 Dec 2023 08:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: Henry Huang <henry.hj@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2] mm: Multi-Gen LRU: fix use mm/page_idle/bitmap
Message-ID: <202312090821.bkXwE71Q-lkp@intel.com>
References: <951fb7edab535cf522def4f5f2613947ed7b7d28.1701853894.git.henry.hj@antgroup.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <951fb7edab535cf522def4f5f2613947ed7b7d28.1701853894.git.henry.hj@antgroup.com>

Hi Henry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Henry-Huang/mm-Multi-Gen-LRU-fix-use-mm-page_idle-bitmap/20231206-205133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/951fb7edab535cf522def4f5f2613947ed7b7d28.1701853894.git.henry.hj%40antgroup.com
patch subject: [RFC v2] mm: Multi-Gen LRU: fix use mm/page_idle/bitmap
config: i386-randconfig-013-20231209 (https://download.01.org/0day-ci/archive/20231209/202312090821.bkXwE71Q-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312090821.bkXwE71Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090821.bkXwE71Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:3310:20: error: call to undeclared function 'folio_test_idle'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (clear_idle && folio_test_idle(folio))
                             ^
>> mm/vmscan.c:3311:3: error: call to undeclared function 'folio_clear_idle'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   folio_clear_idle(folio);
                   ^
>> mm/vmscan.c:3379:8: error: call to undeclared function 'folio_test_clear_young'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   if (!folio_test_clear_young(folio) && !is_pte_young) {
                        ^
   mm/vmscan.c:3379:8: note: did you mean 'folio_test_clear_lru'?
   include/linux/page-flags.h:476:2: note: 'folio_test_clear_lru' declared here
           TESTCLEARFLAG(LRU, lru, PF_HEAD)
           ^
   include/linux/page-flags.h:416:6: note: expanded from macro 'TESTCLEARFLAG'
   bool folio_test_clear_##lname(struct folio *folio)                      \
        ^
   <scratch space>:139:1: note: expanded from here
   folio_test_clear_lru
   ^
   mm/vmscan.c:4053:8: error: call to undeclared function 'folio_test_clear_young'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   if (!folio_test_clear_young(folio) && !is_pte_young)
                        ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +/folio_test_idle +3310 mm/vmscan.c

  3298	
  3299	static struct folio *get_pfn_folio(unsigned long pfn, struct mem_cgroup *memcg,
  3300					   struct pglist_data *pgdat, bool can_swap, bool clear_idle)
  3301	{
  3302		struct folio *folio;
  3303	
  3304		/* try to avoid unnecessary memory loads */
  3305		if (pfn < pgdat->node_start_pfn || pfn >= pgdat_end_pfn(pgdat))
  3306			return NULL;
  3307	
  3308		folio = pfn_folio(pfn);
  3309	
> 3310		if (clear_idle && folio_test_idle(folio))
> 3311			folio_clear_idle(folio);
  3312	
  3313		if (folio_nid(folio) != pgdat->node_id)
  3314			return NULL;
  3315	
  3316		if (folio_memcg_rcu(folio) != memcg)
  3317			return NULL;
  3318	
  3319		/* file VMAs can contain anon pages from COW */
  3320		if (!folio_is_file_lru(folio) && !can_swap)
  3321			return NULL;
  3322	
  3323		return folio;
  3324	}
  3325	
  3326	static bool suitable_to_scan(int total, int young)
  3327	{
  3328		int n = clamp_t(int, cache_line_size() / sizeof(pte_t), 2, 8);
  3329	
  3330		/* suitable if the average number of young PTEs per cacheline is >=1 */
  3331		return young * n >= total;
  3332	}
  3333	
  3334	static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
  3335				   struct mm_walk *args)
  3336	{
  3337		int i;
  3338		pte_t *pte;
  3339		spinlock_t *ptl;
  3340		unsigned long addr;
  3341		int total = 0;
  3342		int young = 0;
  3343		struct lru_gen_mm_walk *walk = args->private;
  3344		struct mem_cgroup *memcg = lruvec_memcg(walk->lruvec);
  3345		struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
  3346		int old_gen, new_gen = lru_gen_from_seq(walk->max_seq);
  3347	
  3348		pte = pte_offset_map_nolock(args->mm, pmd, start & PMD_MASK, &ptl);
  3349		if (!pte)
  3350			return false;
  3351		if (!spin_trylock(ptl)) {
  3352			pte_unmap(pte);
  3353			return false;
  3354		}
  3355	
  3356		arch_enter_lazy_mmu_mode();
  3357	restart:
  3358		for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
  3359			unsigned long pfn;
  3360			struct folio *folio;
  3361			pte_t ptent = ptep_get(pte + i);
  3362			bool is_pte_young;
  3363	
  3364			total++;
  3365			walk->mm_stats[MM_LEAF_TOTAL]++;
  3366	
  3367			pfn = get_pte_pfn(ptent, args->vma, addr);
  3368			if (pfn == -1)
  3369				continue;
  3370	
  3371			is_pte_young = !!pte_young(ptent);
  3372			folio = get_pfn_folio(pfn, memcg, pgdat, walk->can_swap, is_pte_young);
  3373			if (!folio) {
  3374				if (!is_pte_young)
  3375					walk->mm_stats[MM_LEAF_OLD]++;
  3376				continue;
  3377			}
  3378	
> 3379			if (!folio_test_clear_young(folio) && !is_pte_young) {
  3380				walk->mm_stats[MM_LEAF_OLD]++;
  3381				continue;
  3382			}
  3383	
  3384			if (is_pte_young && !ptep_test_and_clear_young(args->vma, addr, pte + i))
  3385				VM_WARN_ON_ONCE(true);
  3386	
  3387			young++;
  3388			walk->mm_stats[MM_LEAF_YOUNG]++;
  3389	
  3390			if (pte_dirty(ptent) && !folio_test_dirty(folio) &&
  3391			    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
  3392			      !folio_test_swapcache(folio)))
  3393				folio_mark_dirty(folio);
  3394	
  3395			old_gen = folio_update_gen(folio, new_gen);
  3396			if (old_gen >= 0 && old_gen != new_gen)
  3397				update_batch_size(walk, folio, old_gen, new_gen);
  3398		}
  3399	
  3400		if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &end))
  3401			goto restart;
  3402	
  3403		arch_leave_lazy_mmu_mode();
  3404		pte_unmap_unlock(pte, ptl);
  3405	
  3406		return suitable_to_scan(total, young);
  3407	}
  3408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
