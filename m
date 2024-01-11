Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D01170;
	Thu, 11 Jan 2024 00:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbZRcWm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704931625; x=1736467625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=no9I6RuJs5ECG7xI10w/WrJ4HmUJ1QzsShWoGCmGX1k=;
  b=kbZRcWm3u19eFxuB/kfiTwnOXwVSmQpsSplMXBW11jeW7t2yGQzh80nd
   LgeeVBEXWLI2VSZTMkqyyxritjF6a+bLUuos5f9+whC62012H68h+m8JN
   FW/CCjbUiRLPL71D2JsfgnmTNgpjRaTvMobhvgkRYodUTtxGv/nUttsb3
   +q9AXgAOz0fn0Ba0/5J2PnZyA3R2uz+sIg3kX0msTB1VCZjP44q6moZmL
   zbYmRl6PcQaAMjI9bCmd1Zwi8s0w3GmxuitMOO/xUUzzk51IcBVjChhJt
   xlioSoj8zgu0+s8FypymbyJtOnmS5liQdkryK3q/jPePTV+Z7s0aQbwim
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="398383566"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="398383566"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 16:06:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="905734085"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="905734085"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Jan 2024 16:06:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNiaz-0007c2-26;
	Thu, 11 Jan 2024 00:06:53 +0000
Date: Thu, 11 Jan 2024 08:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Haixiang <chenhaixiang3@huawei.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, hughd@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	louhongxiang@huawei.com, wangbin224@huawei.com,
	liuyuntao10@huawei.com, chenhaixiang3@huawei.com
Subject: Re: [PATCH] support tmpfs hugepage PMD is not split when COW
Message-ID: <202401110739.T5OMND7z-lkp@intel.com>
References: <20240110092028.1777-1-chenhaixiang3@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110092028.1777-1-chenhaixiang3@huawei.com>

Hi Chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.7 next-20240110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Haixiang/support-tmpfs-hugepage-PMD-is-not-split-when-COW/20240110-172314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240110092028.1777-1-chenhaixiang3%40huawei.com
patch subject: [PATCH] support tmpfs hugepage PMD is not split when COW
config: arm-mmp2_defconfig (https://download.01.org/0day-ci/archive/20240111/202401110739.T5OMND7z-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401110739.T5OMND7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401110739.T5OMND7z-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/shmem.c:2278:18: error: use of undeclared identifier 'THP_FAULT_FALLBACK'; did you mean 'VM_FAULT_FALLBACK'?
                   count_vm_event(THP_FAULT_FALLBACK);
                                  ^~~~~~~~~~~~~~~~~~
                                  VM_FAULT_FALLBACK
   include/linux/mm_types.h:1219:2: note: 'VM_FAULT_FALLBACK' declared here
           VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
           ^
   mm/shmem.c:2278:18: warning: implicit conversion from enumeration type 'enum vm_fault_reason' to different enumeration type 'enum vm_event_item' [-Wenum-conversion]
                   count_vm_event(THP_FAULT_FALLBACK);
                   ~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~~~
>> mm/shmem.c:2283:2: error: call to undeclared function 'page_remove_rmap'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           page_remove_rmap(&old_folio->page, vma, true);
           ^
   mm/shmem.c:2283:2: note: did you mean 'hugetlb_remove_rmap'?
   include/linux/rmap.h:311:20: note: 'hugetlb_remove_rmap' declared here
   static inline void hugetlb_remove_rmap(struct folio *folio)
                      ^
>> mm/shmem.c:2291:10: error: call to undeclared function 'mk_huge_pmd'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           entry = mk_huge_pmd(&new_folio->page, vma->vm_page_prot);
                   ^
>> mm/shmem.c:2292:28: error: call to undeclared function 'pmd_mkdirty'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
                                     ^
>> mm/shmem.c:2294:2: error: call to undeclared function 'page_add_file_rmap'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           page_add_file_rmap(&new_folio->page, vma, true);
           ^
   mm/shmem.c:2294:2: note: did you mean 'hugetlb_add_file_rmap'?
   include/linux/rmap.h:303:20: note: 'hugetlb_add_file_rmap' declared here
   static inline void hugetlb_add_file_rmap(struct folio *folio)
                      ^
>> mm/shmem.c:2295:2: error: call to undeclared function 'set_pmd_at'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           set_pmd_at(vma->vm_mm, haddr, vmf->pmd, entry);
           ^
>> mm/shmem.c:2301:2: error: call to undeclared function 'copy_user_large_folio'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           copy_user_large_folio(new_folio, old_folio, haddr, vma);
           ^
   1 warning and 7 errors generated.


vim +/page_remove_rmap +2283 mm/shmem.c

  2239	
  2240	static vm_fault_t shmem_huge_fault(struct vm_fault *vmf, pmd_t orig_pmd)
  2241	{
  2242		vm_fault_t ret = VM_FAULT_FALLBACK;
  2243		unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
  2244		struct folio *old_folio, *new_folio;
  2245		pmd_t entry;
  2246		int gfp_flags = GFP_HIGHUSER_MOVABLE | __GFP_COMP;
  2247		struct vm_area_struct *vma = vmf->vma;
  2248		struct shmem_sb_info *sbinfo = NULL;
  2249		struct inode *inode = file_inode(vma->vm_file);
  2250		struct shmem_inode_info *info = SHMEM_I(inode);
  2251	
  2252		sbinfo = SHMEM_SB(info->vfs_inode.i_sb);
  2253	
  2254		if (sbinfo->no_split == 0)
  2255			return VM_FAULT_FALLBACK;
  2256	
  2257		/* ShmemPmdMapped in tmpfs will not split huge pmd */
  2258		if (!(vmf->flags & FAULT_FLAG_WRITE)
  2259				|| (vma->vm_flags & VM_SHARED))
  2260			return VM_FAULT_FALLBACK;
  2261	
  2262		new_folio = vma_alloc_folio(gfp_flags, HPAGE_PMD_ORDER,
  2263				vmf->vma, haddr, true);
  2264		if (!new_folio)
  2265			ret = VM_FAULT_FALLBACK;
  2266	
  2267		vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
  2268		if (pmd_none(*vmf->pmd)) {
  2269			ret = VM_FAULT_FALLBACK;
  2270			goto out;
  2271		}
  2272		if (!pmd_same(*vmf->pmd, orig_pmd)) {
  2273			ret = 0;
  2274			goto out;
  2275		}
  2276	
  2277		if (!new_folio) {
> 2278			count_vm_event(THP_FAULT_FALLBACK);
  2279			ret = VM_FAULT_FALLBACK;
  2280			goto out;
  2281		}
  2282		old_folio = page_folio(pmd_page(*vmf->pmd));
> 2283		page_remove_rmap(&old_folio->page, vma, true);
  2284		pmdp_huge_clear_flush(vma, haddr, vmf->pmd);
  2285	
  2286		__folio_set_locked(new_folio);
  2287		__folio_set_swapbacked(new_folio);
  2288		__folio_mark_uptodate(new_folio);
  2289	
  2290		flush_icache_pages(vma, &new_folio->page, HPAGE_PMD_NR);
> 2291		entry = mk_huge_pmd(&new_folio->page, vma->vm_page_prot);
> 2292		entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
  2293	
> 2294		page_add_file_rmap(&new_folio->page, vma, true);
> 2295		set_pmd_at(vma->vm_mm, haddr, vmf->pmd, entry);
  2296		update_mmu_cache_pmd(vma, haddr, vmf->pmd);
  2297		count_vm_event(THP_FILE_MAPPED);
  2298	
  2299		folio_unlock(new_folio);
  2300		spin_unlock(vmf->ptl);
> 2301		copy_user_large_folio(new_folio, old_folio, haddr, vma);
  2302		folio_put(old_folio);
  2303		ret = 0;
  2304		return ret;
  2305	
  2306	out:
  2307		if (new_folio)
  2308			folio_put(new_folio);
  2309		spin_unlock(vmf->ptl);
  2310		return ret;
  2311	}
  2312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
