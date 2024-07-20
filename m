Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A33882B;
	Sat, 20 Jul 2024 02:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721441938; cv=none; b=D8wrs85rYf0orWELIJ4j6VF3dyJObt9Dh8Nnx2vxzTkF2h7rzAY6pwSToxn0g/oFrRNvFu4ZpYVj4lxANKYX7wR0fc+vMOBPOq6FN1E60j2MfniGbF+GDfR20wLnQHDaTjbUaZHTMbOHPFMK2coKddzwb8ivcgd5UB5VsqhM0rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721441938; c=relaxed/simple;
	bh=HtlleoCLYz+r4Cu0aVEGpj8zywppZOU8fkg2opVgAtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EoTjgUs6+yAhkHJUwwlOdBN+gPv6bzlOoYE+7RYYKuWEMLRkrj7g59YZ3yZKXBvgYK34QlYHZfd9+IAlvMnRB6jQrmEL0zrDahbEbow0smeb5FELi0sp0yBk8Xzh6eRxB79feV++3Yi+hkbbRotk+xiPIiC5qGQ1cKWvMl5k6uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYvc+WNG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYvc+WNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721441937; x=1752977937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HtlleoCLYz+r4Cu0aVEGpj8zywppZOU8fkg2opVgAtY=;
  b=dYvc+WNGFXQ+kjRMCwISqyK7XmfETFLPBRU2rkR/hvN/jD1MWF1U/mvR
   q9W6e7JAES9F7yB5OVymUcaKLov9b8eQJNN5mxp9VJSdCrCkU+Zredd6k
   +hnGV8RCFbVQQxKAwOXULKlw2+6H2EtKCgd7/a316OTSVy3MV5JbSifGd
   +FHs+xcmvfNarF+HIx63/BxqS+QJZjGKY/AGnbeGiHE4b51TLVr7NuiUd
   TnlbN2F0FdoD63Nj4DHBKEAVS+/uvbyqPLd8qnsPOUNcMi5Bg13gcWSlL
   8ulqfbfoji1MJhl2YNWML+qxRrS0rZyY+uchFC6hznIyqPr6sV5eKg0G0
   g==;
X-CSE-ConnectionGUID: r+mJQlfjQbSsNqJYP1vJ+w==
X-CSE-MsgGUID: +667PzjWS1+XBaRCTM7Wtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29662847"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="29662847"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 19:18:56 -0700
X-CSE-ConnectionGUID: PRQQvqRVTxicX+mPJ3oL9A==
X-CSE-MsgGUID: ccAMMFBETiKGowX6lf10Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="51923041"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jul 2024 19:18:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUzgR-000ily-2o;
	Sat, 20 Jul 2024 02:18:51 +0000
Date: Sat, 20 Jul 2024 10:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable3 32/35] mm/memory.c:5199:19: error: controlling
 expression type 'pgtable_t' (aka 'pte_t *') not compatible with any generic
 association type
Message-ID: <202407201053.i5RweqDL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable3
head:   3fb6eb9b0272c82ed231fdf2a20f6b6d265c4259
commit: af61d3794790e45fe26bdc10599fd86281d03fd3 [32/35] mm/pgtable: return ptdesc in pte_free
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407201053.i5RweqDL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407201053.i5RweqDL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407201053.i5RweqDL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:44:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:45:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   mm/memory.c:448:17: error: incompatible pointer types initializing 'struct ptdesc *' with an expression of type 'pte_t *' [-Werror,-Wincompatible-pointer-types]
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                        ^        ~~~~~~~~~~~~~~~~~
   mm/memory.c:4650:35: error: controlling expression type 'pte_t *' not compatible with any generic association type
    4650 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                     ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgalloc.h:140:28: note: expanded from macro 'pte_alloc_one'
     140 | #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
         |                            ^
   include/linux/mm_types.h:502:38: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                    ^~
   mm/memory.c:5013:35: error: controlling expression type 'pte_t *' not compatible with any generic association type
    5013 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                     ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgalloc.h:140:28: note: expanded from macro 'pte_alloc_one'
     140 | #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
         |                            ^
   include/linux/mm_types.h:502:38: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                    ^~
>> mm/memory.c:5199:19: error: controlling expression type 'pgtable_t' (aka 'pte_t *') not compatible with any generic association type
    5199 |                 pte_free(vm_mm, page_ptdesc(vmf->prealloc_pte));
         |                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:510:36: note: expanded from macro 'page_ptdesc'
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   arch/s390/include/asm/pgalloc.h:143:65: note: expanded from macro 'pte_free'
     143 | #define pte_free(mm, pte) page_table_free(mm, (unsigned long *) pte)
         |                                                                 ^~~
   15 warnings and 4 errors generated.


vim +5199 mm/memory.c

  4974	
  4975	/*
  4976	 * do_fault_around() tries to map few pages around the fault address. The hope
  4977	 * is that the pages will be needed soon and this will lower the number of
  4978	 * faults to handle.
  4979	 *
  4980	 * It uses vm_ops->map_pages() to map the pages, which skips the page if it's
  4981	 * not ready to be mapped: not up-to-date, locked, etc.
  4982	 *
  4983	 * This function doesn't cross VMA or page table boundaries, in order to call
  4984	 * map_pages() and acquire a PTE lock only once.
  4985	 *
  4986	 * fault_around_pages defines how many pages we'll try to map.
  4987	 * do_fault_around() expects it to be set to a power of two less than or equal
  4988	 * to PTRS_PER_PTE.
  4989	 *
  4990	 * The virtual address of the area that we map is naturally aligned to
  4991	 * fault_around_pages * PAGE_SIZE rounded down to the machine page size
  4992	 * (and therefore to page order).  This way it's easier to guarantee
  4993	 * that we don't cross page table boundaries.
  4994	 */
  4995	static vm_fault_t do_fault_around(struct vm_fault *vmf)
  4996	{
  4997		pgoff_t nr_pages = READ_ONCE(fault_around_pages);
  4998		pgoff_t pte_off = pte_index(vmf->address);
  4999		/* The page offset of vmf->address within the VMA. */
  5000		pgoff_t vma_off = vmf->pgoff - vmf->vma->vm_pgoff;
  5001		pgoff_t from_pte, to_pte;
  5002		vm_fault_t ret;
  5003	
  5004		/* The PTE offset of the start address, clamped to the VMA. */
  5005		from_pte = max(ALIGN_DOWN(pte_off, nr_pages),
  5006			       pte_off - min(pte_off, vma_off));
  5007	
  5008		/* The PTE offset of the end address, clamped to the VMA and PTE. */
  5009		to_pte = min3(from_pte + nr_pages, (pgoff_t)PTRS_PER_PTE,
  5010			      pte_off + vma_pages(vmf->vma) - vma_off) - 1;
  5011	
  5012		if (pmd_none(*vmf->pmd)) {
> 5013			vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
  5014			if (!vmf->prealloc_pte)
  5015				return VM_FAULT_OOM;
  5016		}
  5017	
  5018		rcu_read_lock();
  5019		ret = vmf->vma->vm_ops->map_pages(vmf,
  5020				vmf->pgoff + from_pte - pte_off,
  5021				vmf->pgoff + to_pte - pte_off);
  5022		rcu_read_unlock();
  5023	
  5024		return ret;
  5025	}
  5026	
  5027	/* Return true if we should do read fault-around, false otherwise */
  5028	static inline bool should_fault_around(struct vm_fault *vmf)
  5029	{
  5030		/* No ->map_pages?  No way to fault around... */
  5031		if (!vmf->vma->vm_ops->map_pages)
  5032			return false;
  5033	
  5034		if (uffd_disable_fault_around(vmf->vma))
  5035			return false;
  5036	
  5037		/* A single page implies no faulting 'around' at all. */
  5038		return fault_around_pages > 1;
  5039	}
  5040	
  5041	static vm_fault_t do_read_fault(struct vm_fault *vmf)
  5042	{
  5043		vm_fault_t ret = 0;
  5044		struct folio *folio;
  5045	
  5046		/*
  5047		 * Let's call ->map_pages() first and use ->fault() as fallback
  5048		 * if page by the offset is not ready to be mapped (cold cache or
  5049		 * something).
  5050		 */
  5051		if (should_fault_around(vmf)) {
  5052			ret = do_fault_around(vmf);
  5053			if (ret)
  5054				return ret;
  5055		}
  5056	
  5057		ret = vmf_can_call_fault(vmf);
  5058		if (ret)
  5059			return ret;
  5060	
  5061		ret = __do_fault(vmf);
  5062		if (unlikely(ret & (VM_FAULT_ERROR | VM_FAULT_NOPAGE | VM_FAULT_RETRY)))
  5063			return ret;
  5064	
  5065		ret |= finish_fault(vmf);
  5066		folio = page_folio(vmf->page);
  5067		folio_unlock(folio);
  5068		if (unlikely(ret & (VM_FAULT_ERROR | VM_FAULT_NOPAGE | VM_FAULT_RETRY)))
  5069			folio_put(folio);
  5070		return ret;
  5071	}
  5072	
  5073	static vm_fault_t do_cow_fault(struct vm_fault *vmf)
  5074	{
  5075		struct vm_area_struct *vma = vmf->vma;
  5076		struct folio *folio;
  5077		vm_fault_t ret;
  5078	
  5079		ret = vmf_can_call_fault(vmf);
  5080		if (!ret)
  5081			ret = vmf_anon_prepare(vmf);
  5082		if (ret)
  5083			return ret;
  5084	
  5085		folio = folio_prealloc(vma->vm_mm, vma, vmf->address, false);
  5086		if (!folio)
  5087			return VM_FAULT_OOM;
  5088	
  5089		vmf->cow_page = &folio->page;
  5090	
  5091		ret = __do_fault(vmf);
  5092		if (unlikely(ret & (VM_FAULT_ERROR | VM_FAULT_NOPAGE | VM_FAULT_RETRY)))
  5093			goto uncharge_out;
  5094		if (ret & VM_FAULT_DONE_COW)
  5095			return ret;
  5096	
  5097		copy_user_highpage(vmf->cow_page, vmf->page, vmf->address, vma);
  5098		__folio_mark_uptodate(folio);
  5099	
  5100		ret |= finish_fault(vmf);
  5101		unlock_page(vmf->page);
  5102		put_page(vmf->page);
  5103		if (unlikely(ret & (VM_FAULT_ERROR | VM_FAULT_NOPAGE | VM_FAULT_RETRY)))
  5104			goto uncharge_out;
  5105		return ret;
  5106	uncharge_out:
  5107		folio_put(folio);
  5108		return ret;
  5109	}
  5110	
  5111	static vm_fault_t do_shared_fault(struct vm_fault *vmf)
  5112	{
  5113		struct vm_area_struct *vma = vmf->vma;
  5114		vm_fault_t ret, tmp;
  5115		struct folio *folio;
  5116	
  5117		ret = vmf_can_call_fault(vmf);
  5118		if (ret)
  5119			return ret;
  5120	
  5121		ret = __do_fault(vmf);
  5122		if (unlikely(ret & (VM_FAULT_ERROR | VM_FAULT_NOPAGE | VM_FAULT_RETRY)))
  5123			return ret;
  5124	
  5125		folio = page_folio(vmf->page);
  5126	
  5127		/*
  5128		 * Check if the backing address space wants to know that the page is
  5129		 * about to become writable
  5130		 */
  5131		if (vma->vm_ops->page_mkwrite) {
  5132			folio_unlock(folio);
  5133			tmp = do_page_mkwrite(vmf, folio);
  5134			if (unlikely(!tmp ||
  5135					(tmp & (VM_FAULT_ERROR | VM_FAULT_NOPAGE)))) {
  5136				folio_put(folio);
  5137				return tmp;
  5138			}
  5139		}
  5140	
  5141		ret |= finish_fault(vmf);
  5142		if (unlikely(ret & (VM_FAULT_ERROR | VM_FAULT_NOPAGE |
  5143						VM_FAULT_RETRY))) {
  5144			folio_unlock(folio);
  5145			folio_put(folio);
  5146			return ret;
  5147		}
  5148	
  5149		ret |= fault_dirty_shared_page(vmf);
  5150		return ret;
  5151	}
  5152	
  5153	/*
  5154	 * We enter with non-exclusive mmap_lock (to exclude vma changes,
  5155	 * but allow concurrent faults).
  5156	 * The mmap_lock may have been released depending on flags and our
  5157	 * return value.  See filemap_fault() and __folio_lock_or_retry().
  5158	 * If mmap_lock is released, vma may become invalid (for example
  5159	 * by other thread calling munmap()).
  5160	 */
  5161	static vm_fault_t do_fault(struct vm_fault *vmf)
  5162	{
  5163		struct vm_area_struct *vma = vmf->vma;
  5164		struct mm_struct *vm_mm = vma->vm_mm;
  5165		vm_fault_t ret;
  5166	
  5167		/*
  5168		 * The VMA was not fully populated on mmap() or missing VM_DONTEXPAND
  5169		 */
  5170		if (!vma->vm_ops->fault) {
  5171			vmf->pte = pte_offset_map_lock(vmf->vma->vm_mm, vmf->pmd,
  5172						       vmf->address, &vmf->ptl);
  5173			if (unlikely(!vmf->pte))
  5174				ret = VM_FAULT_SIGBUS;
  5175			else {
  5176				/*
  5177				 * Make sure this is not a temporary clearing of pte
  5178				 * by holding ptl and checking again. A R/M/W update
  5179				 * of pte involves: take ptl, clearing the pte so that
  5180				 * we don't have concurrent modification by hardware
  5181				 * followed by an update.
  5182				 */
  5183				if (unlikely(pte_none(ptep_get(vmf->pte))))
  5184					ret = VM_FAULT_SIGBUS;
  5185				else
  5186					ret = VM_FAULT_NOPAGE;
  5187	
  5188				pte_unmap_unlock(vmf->pte, vmf->ptl);
  5189			}
  5190		} else if (!(vmf->flags & FAULT_FLAG_WRITE))
  5191			ret = do_read_fault(vmf);
  5192		else if (!(vma->vm_flags & VM_SHARED))
  5193			ret = do_cow_fault(vmf);
  5194		else
  5195			ret = do_shared_fault(vmf);
  5196	
  5197		/* preallocated pagetable is unused: free it */
  5198		if (vmf->prealloc_pte) {
> 5199			pte_free(vm_mm, page_ptdesc(vmf->prealloc_pte));
  5200			vmf->prealloc_pte = NULL;
  5201		}
  5202		return ret;
  5203	}
  5204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
