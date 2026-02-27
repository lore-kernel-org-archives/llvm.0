Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B6F3EFD0A;
	Fri, 27 Feb 2026 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192623; cv=none; b=VU0bgWPYS/rkUFw67R8sulUtGvtm6TTQFl+qYyryqrzMF/IVv95mLOoslB6yezDvd+eWXt5MWxsjXlyDxpEBa4XAJUk/5++haTs9zIcX+596YtU5j20kGM0a7edI1Ye515xhEIg+nBui2nnsFEy7ZdrpjaWvsrfmlzPKeK+CdpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192623; c=relaxed/simple;
	bh=k71+5wpnY+R4W/nYkxbAc1A91ldRLf5J5npGg7ll4SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LsNYfxf/T2312Dn8X25Ed32G9WvvKjUHjNABG8QnbW9mrEH8/iIcXKSkbCyJY4OSYpl64sYauJ48Udwj6oh9dJeHh5U5ynPx43zjM5tpEgFqboRIWdddqiaAhRdqrWM5OD8QXKyldlJvEZKREgN3jDVdCUqIlK4FybUnGhpKcNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZfSI2v0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZfSI2v0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772192621; x=1803728621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k71+5wpnY+R4W/nYkxbAc1A91ldRLf5J5npGg7ll4SY=;
  b=kZfSI2v0p1kfKlVCug9VP6eIqp6jtMFjs90m/F2jJMe9gWwB5+ucVypo
   NFKaoEc0DwH9vOjbPRVOKu9jhtndFecUMNFbekoL0i+tGz5n02hJgzQyS
   KRH3MwBtKwjPbuo3oLoY7F0w+uoCENSwS+5riqlBMyGexoUz0Y+WCu7eH
   wnlgqdkZFc/5RK826NhG/6pS7zaMcOrtSzmAx2DHIZSxNxKOEBTGmExOx
   hJucsfUiaiCk81L/WTtzQkUSMw/9a2EQXZ91WPJukIpT8jruJgVUmie3x
   JkO8dg0JYzYtoMTn9DqjJwhFS9eJBp2szaBwcNSSrn3TbMioUyfm65t/a
   w==;
X-CSE-ConnectionGUID: MwNHadp1T5+Gzrjn2cIGjg==
X-CSE-MsgGUID: ckl9K/9RRAG3Yl5rNrsg2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73144985"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73144985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:43:40 -0800
X-CSE-ConnectionGUID: DI7r2TWIREOtq5yOW4njRw==
X-CSE-MsgGUID: ZqsTWKdpQzSKdW0ZLZsWeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="216984966"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 27 Feb 2026 03:43:38 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvwFJ-00000000AX1-2Vfa;
	Fri, 27 Feb 2026 11:43:09 +0000
Date: Fri, 27 Feb 2026 19:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yu Zhao <yuzhao@google.com>, linux-kernel@vger.kernel.org,
	Zhaoyang Huang <huangzhaoyang@gmail.com>, steve.kang@unisoc.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH] mm: bail out when the PMD has been set in bloom filter
Message-ID: <202602271916.OBNa34QU-lkp@intel.com>
References: <20260227075250.1128175-1-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227075250.1128175-1-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/mm-bail-out-when-the-PMD-has-been-set-in-bloom-filter/20260227-155729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260227075250.1128175-1-zhaoyang.huang%40unisoc.com
patch subject: [PATCH] mm: bail out when the PMD has been set in bloom filter
config: sparc64-randconfig-002-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271916.OBNa34QU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271916.OBNa34QU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271916.OBNa34QU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:4206:24: warning: variable 'mm_state' is uninitialized when used here [-Wuninitialized]
    4206 |         if (test_bloom_filter(mm_state, max_seq, pvmw->pmd))
         |                               ^~~~~~~~
   mm/vmscan.c:4185:35: note: initialize the variable 'mm_state' to silence this warning
    4185 |         struct lru_gen_mm_state *mm_state;
         |                                          ^
         |                                           = NULL
>> mm/vmscan.c:4206:34: warning: variable 'max_seq' is uninitialized when used here [-Wuninitialized]
    4206 |         if (test_bloom_filter(mm_state, max_seq, pvmw->pmd))
         |                                         ^~~~~~~
   mm/vmscan.c:4186:23: note: initialize the variable 'max_seq' to silence this warning
    4186 |         unsigned long max_seq;
         |                              ^
         |                               = 0
   2 warnings generated.


vim +/mm_state +4206 mm/vmscan.c

  4157	
  4158	/******************************************************************************
  4159	 *                          rmap/PT walk feedback
  4160	 ******************************************************************************/
  4161	
  4162	/*
  4163	 * This function exploits spatial locality when shrink_folio_list() walks the
  4164	 * rmap. It scans the adjacent PTEs of a young PTE and promotes hot pages. If
  4165	 * the scan was done cacheline efficiently, it adds the PMD entry pointing to
  4166	 * the PTE table to the Bloom filter. This forms a feedback loop between the
  4167	 * eviction and the aging.
  4168	 */
  4169	bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
  4170	{
  4171		int i;
  4172		bool dirty;
  4173		unsigned long start;
  4174		unsigned long end;
  4175		struct lru_gen_mm_walk *walk;
  4176		struct folio *last = NULL;
  4177		int young = 1;
  4178		pte_t *pte = pvmw->pte;
  4179		unsigned long addr = pvmw->address;
  4180		struct vm_area_struct *vma = pvmw->vma;
  4181		struct folio *folio = pfn_folio(pvmw->pfn);
  4182		struct mem_cgroup *memcg;
  4183		struct pglist_data *pgdat = folio_pgdat(folio);
  4184		struct lruvec *lruvec;
  4185		struct lru_gen_mm_state *mm_state;
  4186		unsigned long max_seq;
  4187		int gen;
  4188	
  4189		lockdep_assert_held(pvmw->ptl);
  4190		VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
  4191	
  4192		if (!ptep_clear_young_notify(vma, addr, pte))
  4193			return false;
  4194	
  4195		if (spin_is_contended(pvmw->ptl))
  4196			return true;
  4197	
  4198		/* exclude special VMAs containing anon pages from COW */
  4199		if (vma->vm_flags & VM_SPECIAL)
  4200			return true;
  4201	
  4202		/* avoid taking the LRU lock under the PTL when possible */
  4203		walk = current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
  4204	
  4205		/* may the pmd has been set in bloom filter */
> 4206		if (test_bloom_filter(mm_state, max_seq, pvmw->pmd))
  4207			return true;
  4208	
  4209		start = max(addr & PMD_MASK, vma->vm_start);
  4210		end = min(addr | ~PMD_MASK, vma->vm_end - 1) + 1;
  4211	
  4212		if (end - start == PAGE_SIZE)
  4213			return true;
  4214	
  4215		if (end - start > MIN_LRU_BATCH * PAGE_SIZE) {
  4216			if (addr - start < MIN_LRU_BATCH * PAGE_SIZE / 2)
  4217				end = start + MIN_LRU_BATCH * PAGE_SIZE;
  4218			else if (end - addr < MIN_LRU_BATCH * PAGE_SIZE / 2)
  4219				start = end - MIN_LRU_BATCH * PAGE_SIZE;
  4220			else {
  4221				start = addr - MIN_LRU_BATCH * PAGE_SIZE / 2;
  4222				end = addr + MIN_LRU_BATCH * PAGE_SIZE / 2;
  4223			}
  4224		}
  4225	
  4226		memcg = get_mem_cgroup_from_folio(folio);
  4227		lruvec = mem_cgroup_lruvec(memcg, pgdat);
  4228		max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
  4229		gen = lru_gen_from_seq(max_seq);
  4230		mm_state = get_mm_state(lruvec);
  4231	
  4232		lazy_mmu_mode_enable();
  4233	
  4234		pte -= (addr - start) / PAGE_SIZE;
  4235	
  4236		for (i = 0, addr = start; addr != end; i++, addr += PAGE_SIZE) {
  4237			unsigned long pfn;
  4238			pte_t ptent = ptep_get(pte + i);
  4239	
  4240			pfn = get_pte_pfn(ptent, vma, addr, pgdat);
  4241			if (pfn == -1)
  4242				continue;
  4243	
  4244			folio = get_pfn_folio(pfn, memcg, pgdat);
  4245			if (!folio)
  4246				continue;
  4247	
  4248			if (!ptep_clear_young_notify(vma, addr, pte + i))
  4249				continue;
  4250	
  4251			if (last != folio) {
  4252				walk_update_folio(walk, last, gen, dirty);
  4253	
  4254				last = folio;
  4255				dirty = false;
  4256			}
  4257	
  4258			if (pte_dirty(ptent))
  4259				dirty = true;
  4260	
  4261			young++;
  4262		}
  4263	
  4264		walk_update_folio(walk, last, gen, dirty);
  4265	
  4266		lazy_mmu_mode_disable();
  4267	
  4268		/* feedback from rmap walkers to page table walkers */
  4269		if (mm_state && suitable_to_scan(i, young))
  4270			update_bloom_filter(mm_state, max_seq, pvmw->pmd);
  4271	
  4272		mem_cgroup_put(memcg);
  4273	
  4274		return true;
  4275	}
  4276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
