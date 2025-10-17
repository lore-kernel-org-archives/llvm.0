Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ACA2288EE;
	Fri, 17 Oct 2025 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760687517; cv=none; b=rO+atCvH73WyuSBq/+jIDyDsfe8xoqon3yKwwVZdRARZt5Oy+TXTH7DTUbRZDw8A4jCy2shL3npFkJIwkn/+QxkSdBK85aEx5VYBO82cnEBZ18h4M2YgdJSjOrfByLwO1VCJW6mhQXiSpq2VusGyDZSiRJyYvjCYmSKBCx7OLz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760687517; c=relaxed/simple;
	bh=0XjByiMndIMECq9IqiuEurEth0Fm6ncAzJpIvoERRHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBZhzPslSUylVS3MR0uaKqwgeiP1gNrEonSca7cxliuVH9bWgXaq4d51eVLU+GxhG2Raut55Flhpa/p6LafyQE0xGFbpOvuYtIxgOc9bQl/SaAH7Fkq8SOojRHqoj4L0Li4LFvcimcg3lmkcs7j6HSovbe4qnbGo5UEtcfZs0Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBviigA2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBviigA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760687514; x=1792223514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0XjByiMndIMECq9IqiuEurEth0Fm6ncAzJpIvoERRHs=;
  b=YBviigA2aUt35x317SQKQ+1bpsIs1OiPH1AgvFL7ajHdETTezrz4sbhE
   vVt/Nd1nCv5go2BW3FGOy5A3d7BF5BEd4otWAp9A4iBn7PG974ER/C0LC
   wMgc/7bpkB6jrlJFOxTSITz5mfj0Iuo9iOwofZr6Pi0wkN3peFVZe2t/N
   sTRrmlWpXrz3sxbfwZ4uph2eDcnAxTEnUnNWW3D3WKTqzJdHK9df9uZz4
   J+H8bEIDvfmcEzYvug8QTtWDGLiHdrorh1H+5MOJBh8zpn5h9CPIyBS0g
   2ABKBD7UrOS2m8n85qHfHXJQlCudLri7+a7zXK7MuBhwA8WXxYuzP9AZp
   w==;
X-CSE-ConnectionGUID: +x8002rWQmaTQCz35t3Ulw==
X-CSE-MsgGUID: 4JHIhqZMQni6dJ6Q28FZ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="80525869"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="80525869"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 00:51:54 -0700
X-CSE-ConnectionGUID: tarscHEbS7OVF16jiEUY/w==
X-CSE-MsgGUID: Ntu8zNcrSoWkpIrAKQZU/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213642008"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2025 00:51:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9fFZ-0005iJ-0K;
	Fri, 17 Oct 2025 07:51:46 +0000
Date: Fri, 17 Oct 2025 15:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yin Tirui <yintirui@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] mm: add PMD-level huge page support for
 remap_pfn_range()
Message-ID: <202510171503.prs14p8V-lkp@intel.com>
References: <20251016112704.179280-3-yintirui@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016112704.179280-3-yintirui@huawei.com>

Hi Yin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Yin-Tirui/pgtable-add-pte_clrhuge-implementation-for-arm64-and-riscv/20251016-193454
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251016112704.179280-3-yintirui%40huawei.com
patch subject: [PATCH RFC 2/2] mm: add PMD-level huge page support for remap_pfn_range()
config: loongarch-randconfig-002-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171503.prs14p8V-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171503.prs14p8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171503.prs14p8V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/huge_memory.c:2992:12: error: call to undeclared function 'pte_clrhuge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2992 |                         entry = pte_clrhuge(pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd)));
         |                                 ^
>> mm/huge_memory.c:2992:10: error: assigning to 'pte_t' from incompatible type 'int'
    2992 |                         entry = pte_clrhuge(pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd)));
         |                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/pte_clrhuge +2992 mm/huge_memory.c

  2958	
  2959	static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
  2960			unsigned long haddr, bool freeze)
  2961	{
  2962		struct mm_struct *mm = vma->vm_mm;
  2963		struct folio *folio;
  2964		struct page *page;
  2965		pgtable_t pgtable;
  2966		pmd_t old_pmd, _pmd;
  2967		bool soft_dirty, uffd_wp = false, young = false, write = false;
  2968		bool anon_exclusive = false, dirty = false;
  2969		unsigned long addr;
  2970		pte_t *pte;
  2971		int i;
  2972		swp_entry_t entry;
  2973	
  2974		VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
  2975		VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
  2976		VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
  2977	
  2978		VM_WARN_ON(!is_pmd_non_present_folio_entry(*pmd) && !pmd_trans_huge(*pmd));
  2979	
  2980		count_vm_event(THP_SPLIT_PMD);
  2981	
  2982		if (!vma_is_anonymous(vma)) {
  2983			old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
  2984			if (!vma_is_dax(vma) && vma_is_special_huge(vma)) {
  2985				pte_t entry;
  2986	
  2987				pgtable = pgtable_trans_huge_withdraw(mm, pmd);
  2988				if (unlikely(!pgtable))
  2989					return;
  2990				pmd_populate(mm, &_pmd, pgtable);
  2991				pte = pte_offset_map(&_pmd, haddr);
> 2992				entry = pte_clrhuge(pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd)));
  2993				set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
  2994				pte_unmap(pte);
  2995	
  2996				smp_wmb(); /* make pte visible before pmd */
  2997				pmd_populate(mm, pmd, pgtable);
  2998				return;
  2999			} else if (arch_needs_pgtable_deposit()) {
  3000				/* Zap for the non-special mappings. */
  3001				zap_deposited_table(mm, pmd);
  3002			}
  3003	
  3004			if (unlikely(is_pmd_migration_entry(old_pmd))) {
  3005				swp_entry_t entry;
  3006	
  3007				entry = pmd_to_swp_entry(old_pmd);
  3008				folio = pfn_swap_entry_folio(entry);
  3009			} else if (is_huge_zero_pmd(old_pmd)) {
  3010				return;
  3011			} else {
  3012				page = pmd_page(old_pmd);
  3013				folio = page_folio(page);
  3014				if (!folio_test_dirty(folio) && pmd_dirty(old_pmd))
  3015					folio_mark_dirty(folio);
  3016				if (!folio_test_referenced(folio) && pmd_young(old_pmd))
  3017					folio_set_referenced(folio);
  3018				folio_remove_rmap_pmd(folio, page, vma);
  3019				folio_put(folio);
  3020			}
  3021			add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
  3022			return;
  3023		}
  3024	
  3025		if (is_huge_zero_pmd(*pmd)) {
  3026			/*
  3027			 * FIXME: Do we want to invalidate secondary mmu by calling
  3028			 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
  3029			 * inside __split_huge_pmd() ?
  3030			 *
  3031			 * We are going from a zero huge page write protected to zero
  3032			 * small page also write protected so it does not seems useful
  3033			 * to invalidate secondary mmu at this time.
  3034			 */
  3035			return __split_huge_zero_page_pmd(vma, haddr, pmd);
  3036		}
  3037	
  3038	
  3039		if (is_pmd_migration_entry(*pmd)) {
  3040			old_pmd = *pmd;
  3041			entry = pmd_to_swp_entry(old_pmd);
  3042			page = pfn_swap_entry_to_page(entry);
  3043			folio = page_folio(page);
  3044	
  3045			soft_dirty = pmd_swp_soft_dirty(old_pmd);
  3046			uffd_wp = pmd_swp_uffd_wp(old_pmd);
  3047	
  3048			write = is_writable_migration_entry(entry);
  3049			if (PageAnon(page))
  3050				anon_exclusive = is_readable_exclusive_migration_entry(entry);
  3051			young = is_migration_entry_young(entry);
  3052			dirty = is_migration_entry_dirty(entry);
  3053		} else if (is_pmd_device_private_entry(*pmd)) {
  3054			old_pmd = *pmd;
  3055			entry = pmd_to_swp_entry(old_pmd);
  3056			page = pfn_swap_entry_to_page(entry);
  3057			folio = page_folio(page);
  3058	
  3059			soft_dirty = pmd_swp_soft_dirty(old_pmd);
  3060			uffd_wp = pmd_swp_uffd_wp(old_pmd);
  3061	
  3062			write = is_writable_device_private_entry(entry);
  3063			anon_exclusive = PageAnonExclusive(page);
  3064	
  3065			/*
  3066			 * Device private THP should be treated the same as regular
  3067			 * folios w.r.t anon exclusive handling. See the comments for
  3068			 * folio handling and anon_exclusive below.
  3069			 */
  3070			if (freeze && anon_exclusive &&
  3071			    folio_try_share_anon_rmap_pmd(folio, page))
  3072				freeze = false;
  3073			if (!freeze) {
  3074				rmap_t rmap_flags = RMAP_NONE;
  3075	
  3076				folio_ref_add(folio, HPAGE_PMD_NR - 1);
  3077				if (anon_exclusive)
  3078					rmap_flags |= RMAP_EXCLUSIVE;
  3079	
  3080				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
  3081							 vma, haddr, rmap_flags);
  3082			}
  3083		} else {
  3084			/*
  3085			 * Up to this point the pmd is present and huge and userland has
  3086			 * the whole access to the hugepage during the split (which
  3087			 * happens in place). If we overwrite the pmd with the not-huge
  3088			 * version pointing to the pte here (which of course we could if
  3089			 * all CPUs were bug free), userland could trigger a small page
  3090			 * size TLB miss on the small sized TLB while the hugepage TLB
  3091			 * entry is still established in the huge TLB. Some CPU doesn't
  3092			 * like that. See
  3093			 * http://support.amd.com/TechDocs/41322_10h_Rev_Gd.pdf, Erratum
  3094			 * 383 on page 105. Intel should be safe but is also warns that
  3095			 * it's only safe if the permission and cache attributes of the
  3096			 * two entries loaded in the two TLB is identical (which should
  3097			 * be the case here). But it is generally safer to never allow
  3098			 * small and huge TLB entries for the same virtual address to be
  3099			 * loaded simultaneously. So instead of doing "pmd_populate();
  3100			 * flush_pmd_tlb_range();" we first mark the current pmd
  3101			 * notpresent (atomically because here the pmd_trans_huge must
  3102			 * remain set at all times on the pmd until the split is
  3103			 * complete for this pmd), then we flush the SMP TLB and finally
  3104			 * we write the non-huge version of the pmd entry with
  3105			 * pmd_populate.
  3106			 */
  3107			old_pmd = pmdp_invalidate(vma, haddr, pmd);
  3108			page = pmd_page(old_pmd);
  3109			folio = page_folio(page);
  3110			if (pmd_dirty(old_pmd)) {
  3111				dirty = true;
  3112				folio_set_dirty(folio);
  3113			}
  3114			write = pmd_write(old_pmd);
  3115			young = pmd_young(old_pmd);
  3116			soft_dirty = pmd_soft_dirty(old_pmd);
  3117			uffd_wp = pmd_uffd_wp(old_pmd);
  3118	
  3119			VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
  3120			VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
  3121	
  3122			/*
  3123			 * Without "freeze", we'll simply split the PMD, propagating the
  3124			 * PageAnonExclusive() flag for each PTE by setting it for
  3125			 * each subpage -- no need to (temporarily) clear.
  3126			 *
  3127			 * With "freeze" we want to replace mapped pages by
  3128			 * migration entries right away. This is only possible if we
  3129			 * managed to clear PageAnonExclusive() -- see
  3130			 * set_pmd_migration_entry().
  3131			 *
  3132			 * In case we cannot clear PageAnonExclusive(), split the PMD
  3133			 * only and let try_to_migrate_one() fail later.
  3134			 *
  3135			 * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
  3136			 */
  3137			anon_exclusive = PageAnonExclusive(page);
  3138			if (freeze && anon_exclusive &&
  3139			    folio_try_share_anon_rmap_pmd(folio, page))
  3140				freeze = false;
  3141			if (!freeze) {
  3142				rmap_t rmap_flags = RMAP_NONE;
  3143	
  3144				folio_ref_add(folio, HPAGE_PMD_NR - 1);
  3145				if (anon_exclusive)
  3146					rmap_flags |= RMAP_EXCLUSIVE;
  3147				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
  3148							 vma, haddr, rmap_flags);
  3149			}
  3150		}
  3151	
  3152		/*
  3153		 * Withdraw the table only after we mark the pmd entry invalid.
  3154		 * This's critical for some architectures (Power).
  3155		 */
  3156		pgtable = pgtable_trans_huge_withdraw(mm, pmd);
  3157		pmd_populate(mm, &_pmd, pgtable);
  3158	
  3159		pte = pte_offset_map(&_pmd, haddr);
  3160		VM_BUG_ON(!pte);
  3161	
  3162		/*
  3163		 * Note that NUMA hinting access restrictions are not transferred to
  3164		 * avoid any possibility of altering permissions across VMAs.
  3165		 */
  3166		if (freeze || is_pmd_migration_entry(old_pmd)) {
  3167			pte_t entry;
  3168			swp_entry_t swp_entry;
  3169	
  3170			for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
  3171				if (write)
  3172					swp_entry = make_writable_migration_entry(
  3173								page_to_pfn(page + i));
  3174				else if (anon_exclusive)
  3175					swp_entry = make_readable_exclusive_migration_entry(
  3176								page_to_pfn(page + i));
  3177				else
  3178					swp_entry = make_readable_migration_entry(
  3179								page_to_pfn(page + i));
  3180				if (young)
  3181					swp_entry = make_migration_entry_young(swp_entry);
  3182				if (dirty)
  3183					swp_entry = make_migration_entry_dirty(swp_entry);
  3184				entry = swp_entry_to_pte(swp_entry);
  3185				if (soft_dirty)
  3186					entry = pte_swp_mksoft_dirty(entry);
  3187				if (uffd_wp)
  3188					entry = pte_swp_mkuffd_wp(entry);
  3189				VM_WARN_ON(!pte_none(ptep_get(pte + i)));
  3190				set_pte_at(mm, addr, pte + i, entry);
  3191			}
  3192		} else if (is_pmd_device_private_entry(old_pmd)) {
  3193			pte_t entry;
  3194			swp_entry_t swp_entry;
  3195	
  3196			for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
  3197				/*
  3198				 * anon_exclusive was already propagated to the relevant
  3199				 * pages corresponding to the pte entries when freeze
  3200				 * is false.
  3201				 */
  3202				if (write)
  3203					swp_entry = make_writable_device_private_entry(
  3204								page_to_pfn(page + i));
  3205				else
  3206					swp_entry = make_readable_device_private_entry(
  3207								page_to_pfn(page + i));
  3208				/*
  3209				 * Young and dirty bits are not progated via swp_entry
  3210				 */
  3211				entry = swp_entry_to_pte(swp_entry);
  3212				if (soft_dirty)
  3213					entry = pte_swp_mksoft_dirty(entry);
  3214				if (uffd_wp)
  3215					entry = pte_swp_mkuffd_wp(entry);
  3216				VM_WARN_ON(!pte_none(ptep_get(pte + i)));
  3217				set_pte_at(mm, addr, pte + i, entry);
  3218			}
  3219		} else {
  3220			pte_t entry;
  3221	
  3222			entry = mk_pte(page, READ_ONCE(vma->vm_page_prot));
  3223			if (write)
  3224				entry = pte_mkwrite(entry, vma);
  3225			if (!young)
  3226				entry = pte_mkold(entry);
  3227			/* NOTE: this may set soft-dirty too on some archs */
  3228			if (dirty)
  3229				entry = pte_mkdirty(entry);
  3230			if (soft_dirty)
  3231				entry = pte_mksoft_dirty(entry);
  3232			if (uffd_wp)
  3233				entry = pte_mkuffd_wp(entry);
  3234	
  3235			for (i = 0; i < HPAGE_PMD_NR; i++)
  3236				VM_WARN_ON(!pte_none(ptep_get(pte + i)));
  3237	
  3238			set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
  3239		}
  3240		pte_unmap(pte);
  3241	
  3242		if (!is_pmd_migration_entry(*pmd))
  3243			folio_remove_rmap_pmd(folio, page, vma);
  3244		if (freeze)
  3245			put_page(page);
  3246	
  3247		smp_wmb(); /* make pte visible before pmd */
  3248		pmd_populate(mm, pmd, pgtable);
  3249	}
  3250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
