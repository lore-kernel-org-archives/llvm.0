Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4849A55;
	Thu, 19 Oct 2023 04:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P065AZ+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697691472; x=1729227472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ux2UBrmaO4aBdjzEUNYXa5A1buzRwAplwG9Bno7s2SM=;
  b=P065AZ+htzMKx7nKYB+SsojOUYOy9OXw9+nRvmT/jmaganipf1zg5IMF
   pU7/uFT/XxqFom6KDSWEsYVCSjoJCRcuZsr0lKVv6Gmd/7fCj6z8tsLcc
   vLT0pNFZ3hKD7cvjDVljbI7G+wfFBrGi6rD0MqP5wcS+VX7wlrBxJWSKc
   Bip3POCnBu6pKpSb3JYY5C0dKV5pmT97B08otYfwj7TJ4E1CiyWvZSfEW
   jGVyFni1MFuSxnlgtwFz82G/9n8Om9vgLdP988inginwhlE6ziWLu1AWW
   J2x7hSU74aoFCBOzC2IYvqjzUBONtgvENOmbHhW3tv0LqIdBux0lCor1N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="4764271"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4764271"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 21:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="847536491"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="847536491"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Oct 2023 21:57:49 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtL6R-0001da-0p;
	Thu, 19 Oct 2023 04:57:47 +0000
Date: Thu, 19 Oct 2023 12:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] mm: only use old generation and stable tier for
 madv_pageout
Message-ID: <202310191251.5rT7xgZU-lkp@intel.com>
References: <20231013113028.2720996-1-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013113028.2720996-1-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/mm-only-use-old-generation-and-stable-tier-for-madv_pageout/20231017-121940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231013113028.2720996-1-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH 1/1] mm: only use old generation and stable tier for madv_pageout
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231019/202310191251.5rT7xgZU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191251.5rT7xgZU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191251.5rT7xgZU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/madvise.c:10:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/madvise.c:10:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/madvise.c:10:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> mm/madvise.c:449:14: error: call to undeclared function 'folio_lru_gen'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     449 |                         int gen = folio_lru_gen(folio);
         |                                   ^
>> mm/madvise.c:452:15: error: call to undeclared function 'folio_lru_refs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     452 |                         int refs = folio_lru_refs(folio);
         |                                    ^
>> mm/madvise.c:453:15: error: call to undeclared function 'lru_tier_from_refs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     453 |                         int tier = lru_tier_from_refs(refs);
         |                                    ^
>> mm/madvise.c:456:14: error: call to undeclared function 'lru_gen_from_seq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     456 |                         if (gen > lru_gen_from_seq(lruvec->lrugen.min_seq[type]) + 1
         |                                   ^
>> mm/madvise.c:456:39: error: no member named 'lrugen' in 'struct lruvec'
     456 |                         if (gen > lru_gen_from_seq(lruvec->lrugen.min_seq[type]) + 1
         |                                                    ~~~~~~  ^
   12 warnings and 5 errors generated.


vim +/folio_lru_gen +449 mm/madvise.c

   323	
   324	static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
   325					unsigned long addr, unsigned long end,
   326					struct mm_walk *walk)
   327	{
   328		struct madvise_walk_private *private = walk->private;
   329		struct mmu_gather *tlb = private->tlb;
   330		bool pageout = private->pageout;
   331		struct mm_struct *mm = tlb->mm;
   332		struct vm_area_struct *vma = walk->vma;
   333		pte_t *start_pte, *pte, ptent;
   334		spinlock_t *ptl;
   335		struct folio *folio = NULL;
   336		LIST_HEAD(folio_list);
   337		bool pageout_anon_only_filter;
   338		unsigned int batch_count = 0;
   339	
   340		if (fatal_signal_pending(current))
   341			return -EINTR;
   342	
   343		pageout_anon_only_filter = pageout && !vma_is_anonymous(vma) &&
   344						!can_do_file_pageout(vma);
   345	
   346	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
   347		if (pmd_trans_huge(*pmd)) {
   348			pmd_t orig_pmd;
   349			unsigned long next = pmd_addr_end(addr, end);
   350	
   351			tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
   352			ptl = pmd_trans_huge_lock(pmd, vma);
   353			if (!ptl)
   354				return 0;
   355	
   356			orig_pmd = *pmd;
   357			if (is_huge_zero_pmd(orig_pmd))
   358				goto huge_unlock;
   359	
   360			if (unlikely(!pmd_present(orig_pmd))) {
   361				VM_BUG_ON(thp_migration_supported() &&
   362						!is_pmd_migration_entry(orig_pmd));
   363				goto huge_unlock;
   364			}
   365	
   366			folio = pfn_folio(pmd_pfn(orig_pmd));
   367	
   368			/* Do not interfere with other mappings of this folio */
   369			if (folio_estimated_sharers(folio) != 1)
   370				goto huge_unlock;
   371	
   372			if (pageout_anon_only_filter && !folio_test_anon(folio))
   373				goto huge_unlock;
   374	
   375			if (next - addr != HPAGE_PMD_SIZE) {
   376				int err;
   377	
   378				folio_get(folio);
   379				spin_unlock(ptl);
   380				folio_lock(folio);
   381				err = split_folio(folio);
   382				folio_unlock(folio);
   383				folio_put(folio);
   384				if (!err)
   385					goto regular_folio;
   386				return 0;
   387			}
   388	
   389			if (pmd_young(orig_pmd)) {
   390				pmdp_invalidate(vma, addr, pmd);
   391				orig_pmd = pmd_mkold(orig_pmd);
   392	
   393				set_pmd_at(mm, addr, pmd, orig_pmd);
   394				tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
   395			}
   396	
   397			folio_clear_referenced(folio);
   398			folio_test_clear_young(folio);
   399			if (folio_test_active(folio))
   400				folio_set_workingset(folio);
   401			if (pageout) {
   402				if (folio_isolate_lru(folio)) {
   403					if (folio_test_unevictable(folio))
   404						folio_putback_lru(folio);
   405					else
   406						list_add(&folio->lru, &folio_list);
   407				}
   408			} else
   409				folio_deactivate(folio);
   410	huge_unlock:
   411			spin_unlock(ptl);
   412			if (pageout)
   413				reclaim_pages(&folio_list);
   414			return 0;
   415		}
   416	
   417	regular_folio:
   418	#endif
   419		tlb_change_page_size(tlb, PAGE_SIZE);
   420	restart:
   421		start_pte = pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
   422		if (!start_pte)
   423			return 0;
   424		flush_tlb_batched_pending(mm);
   425		arch_enter_lazy_mmu_mode();
   426		for (; addr < end; pte++, addr += PAGE_SIZE) {
   427			ptent = ptep_get(pte);
   428	
   429			if (++batch_count == SWAP_CLUSTER_MAX) {
   430				batch_count = 0;
   431				if (need_resched()) {
   432					pte_unmap_unlock(start_pte, ptl);
   433					cond_resched();
   434					goto restart;
   435				}
   436			}
   437	
   438			if (pte_none(ptent))
   439				continue;
   440	
   441			if (!pte_present(ptent))
   442				continue;
   443	
   444			folio = vm_normal_folio(vma, addr, ptent);
   445			if (!folio || folio_is_zone_device(folio))
   446				continue;
   447	
   448			if (lru_gen_enabled() && pageout) {
 > 449				int gen = folio_lru_gen(folio);
   450				struct lruvec *lruvec = folio_lruvec(folio);
   451				int type = folio_is_file_lru(folio);
 > 452				int refs = folio_lru_refs(folio);
 > 453				int tier = lru_tier_from_refs(refs);
   454				int tier_st = get_tier_idx(lruvec, type);
   455	
 > 456				if (gen > lru_gen_from_seq(lruvec->lrugen.min_seq[type]) + 1
   457					|| tier > tier_st)
   458					continue;
   459			}
   460			/*
   461			 * Creating a THP page is expensive so split it only if we
   462			 * are sure it's worth. Split it if we are only owner.
   463			 */
   464			if (folio_test_large(folio)) {
   465				int err;
   466	
   467				if (folio_estimated_sharers(folio) != 1)
   468					break;
   469				if (pageout_anon_only_filter && !folio_test_anon(folio))
   470					break;
   471				if (!folio_trylock(folio))
   472					break;
   473				folio_get(folio);
   474				arch_leave_lazy_mmu_mode();
   475				pte_unmap_unlock(start_pte, ptl);
   476				start_pte = NULL;
   477				err = split_folio(folio);
   478				folio_unlock(folio);
   479				folio_put(folio);
   480				if (err)
   481					break;
   482				start_pte = pte =
   483					pte_offset_map_lock(mm, pmd, addr, &ptl);
   484				if (!start_pte)
   485					break;
   486				arch_enter_lazy_mmu_mode();
   487				pte--;
   488				addr -= PAGE_SIZE;
   489				continue;
   490			}
   491	
   492			/*
   493			 * Do not interfere with other mappings of this folio and
   494			 * non-LRU folio.
   495			 */
   496			if (!folio_test_lru(folio) || folio_mapcount(folio) != 1)
   497				continue;
   498	
   499			if (pageout_anon_only_filter && !folio_test_anon(folio))
   500				continue;
   501	
   502			VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
   503	
   504			if (pte_young(ptent)) {
   505				ptent = ptep_get_and_clear_full(mm, addr, pte,
   506								tlb->fullmm);
   507				ptent = pte_mkold(ptent);
   508				set_pte_at(mm, addr, pte, ptent);
   509				tlb_remove_tlb_entry(tlb, pte, addr);
   510			}
   511	
   512			/*
   513			 * We are deactivating a folio for accelerating reclaiming.
   514			 * VM couldn't reclaim the folio unless we clear PG_young.
   515			 * As a side effect, it makes confuse idle-page tracking
   516			 * because they will miss recent referenced history.
   517			 */
   518			folio_clear_referenced(folio);
   519			folio_test_clear_young(folio);
   520			if (folio_test_active(folio))
   521				folio_set_workingset(folio);
   522			if (pageout) {
   523				if (folio_isolate_lru(folio)) {
   524					if (folio_test_unevictable(folio))
   525						folio_putback_lru(folio);
   526					else
   527						list_add(&folio->lru, &folio_list);
   528				}
   529			} else
   530				folio_deactivate(folio);
   531		}
   532	
   533		if (start_pte) {
   534			arch_leave_lazy_mmu_mode();
   535			pte_unmap_unlock(start_pte, ptl);
   536		}
   537		if (pageout)
   538			reclaim_pages(&folio_list);
   539		cond_resched();
   540	
   541		return 0;
   542	}
   543	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
