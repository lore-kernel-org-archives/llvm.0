Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B98E3093B6;
	Mon, 15 Dec 2025 21:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765835216; cv=none; b=aDcMRtTWfdVZ22gw7HzQYmdAjcPNgBOd/gV3m7SvcP4oW9XmTozOsoLP6KE5WsDx05uGjiVkhV33OTJjlwvdO8hsfwPl2j3UdPfrYYmrHcIXQS84e6KvnDp+hSgOGp6CcueVViEGFgRHj1J668Dc9WlXM8X+uDWGfkvvpdFuYCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765835216; c=relaxed/simple;
	bh=trM+M4QWlPMwrIRXs3ufU2ehi6OBpE+fjV0e0JqogMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXGjpHEYuq0n/0tcHqgw1BEySIppbY7w38896OpA2rvuzXJAnFH2FLq5GvAMxqMDGmKsiVTgdW4mYcQx0wh/CUtt6AQNnbnJLnbEyvdY0DLpT/hISFLiqZtwO5Hj9oO1aJYE5AFsiBfWqtcrJt3rdvxAAb5C7LlCxYBAEUS1weE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2wGJnNU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2wGJnNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765835214; x=1797371214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=trM+M4QWlPMwrIRXs3ufU2ehi6OBpE+fjV0e0JqogMA=;
  b=F2wGJnNUNQV8pCAqX2NO5Gr33vyR7ajkn/ZaZeBxQWanaGaRzcj9dl0S
   Kpm1i2ZSHTdFYJfCogIysWhFWYfZqKba/TIKzHh7arvbxokxTb77Qq3H+
   yozFdmSA/dF1/yLgLaW6iuJhEEoGnNf5Z06cq7K12X+/aBcDVjyD4RkTw
   ZfJ7Fytn+JfSnpWMvP3uCfVaA8+8GocQIXW/w/uwhrTXAdxEyLVIHa43y
   dF5+Zs/weKkj7+1AhPhFco3qz4ZnIyDlgd6cUs6iprQctD9DGgdZag0xy
   6SnJZxsPYLc4Lc5DzDMDhP9RfrSUGLZh+sG+fv2sGsfRzqygCU7bDkpaB
   g==;
X-CSE-ConnectionGUID: NseGkldxR7GosjK03USGTw==
X-CSE-MsgGUID: IJVhp658TWi30xmTXwPFAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71604151"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="71604151"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 13:46:54 -0800
X-CSE-ConnectionGUID: UQpqC+doQ0e58cbkNCB9AQ==
X-CSE-MsgGUID: 8CyXTd/xTyq7QaZHIpvB4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="235238849"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Dec 2025 13:46:50 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVGOd-000000000qT-3rAg;
	Mon, 15 Dec 2025 21:46:35 +0000
Date: Tue, 16 Dec 2025 05:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Vernon Yang <vernon2gm@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, lorenzo.stoakes@oracle.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ziy@nvidia.com,
	npache@redhat.com, baohua@kernel.org, lance.yang@linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Vernon Yang <yanglincheng@kylinos.cn>
Subject: Re: [PATCH 2/4] mm: khugepaged: remove mm when all memory has been
 collapsed
Message-ID: <202512160533.KuHwyJTP-lkp@intel.com>
References: <20251215090419.174418-3-yanglincheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215090419.174418-3-yanglincheng@kylinos.cn>

Hi Vernon,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.19-rc1 next-20251215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/mm-khugepaged-add-trace_mm_khugepaged_scan-event/20251215-171046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251215090419.174418-3-yanglincheng%40kylinos.cn
patch subject: [PATCH 2/4] mm: khugepaged: remove mm when all memory has been collapsed
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251216/202512160533.KuHwyJTP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160533.KuHwyJTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160533.KuHwyJTP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/khugepaged.c:2490:9: error: use of undeclared identifier 'SCAN_PMD_NULL'; did you mean 'SCAN_VMA_NULL'?
    2490 |                         case SCAN_PMD_NULL:
         |                              ^~~~~~~~~~~~~
         |                              SCAN_VMA_NULL
   mm/khugepaged.c:50:2: note: 'SCAN_VMA_NULL' declared here
      50 |         SCAN_VMA_NULL,
         |         ^
>> mm/khugepaged.c:2491:9: error: use of undeclared identifier 'SCAN_PMD_NONE'
    2491 |                         case SCAN_PMD_NONE:
         |                              ^
   2 errors generated.


vim +2490 mm/khugepaged.c

  2392	
  2393	static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
  2394						    struct collapse_control *cc)
  2395		__releases(&khugepaged_mm_lock)
  2396		__acquires(&khugepaged_mm_lock)
  2397	{
  2398		struct vma_iterator vmi;
  2399		struct mm_slot *slot;
  2400		struct mm_struct *mm;
  2401		struct vm_area_struct *vma;
  2402		int progress = 0;
  2403	
  2404		VM_BUG_ON(!pages);
  2405		lockdep_assert_held(&khugepaged_mm_lock);
  2406		*result = SCAN_FAIL;
  2407	
  2408		if (khugepaged_scan.mm_slot) {
  2409			slot = khugepaged_scan.mm_slot;
  2410		} else {
  2411			slot = list_first_entry(&khugepaged_scan.mm_head,
  2412					     struct mm_slot, mm_node);
  2413			khugepaged_scan.address = 0;
  2414			khugepaged_scan.mm_slot = slot;
  2415			khugepaged_scan.maybe_collapse = false;
  2416		}
  2417		spin_unlock(&khugepaged_mm_lock);
  2418	
  2419		mm = slot->mm;
  2420		/*
  2421		 * Don't wait for semaphore (to avoid long wait times).  Just move to
  2422		 * the next mm on the list.
  2423		 */
  2424		vma = NULL;
  2425		if (unlikely(!mmap_read_trylock(mm)))
  2426			goto breakouterloop_mmap_lock;
  2427	
  2428		progress++;
  2429		if (unlikely(hpage_collapse_test_exit_or_disable(mm)))
  2430			goto breakouterloop;
  2431	
  2432		vma_iter_init(&vmi, mm, khugepaged_scan.address);
  2433		for_each_vma(vmi, vma) {
  2434			unsigned long hstart, hend;
  2435	
  2436			cond_resched();
  2437			if (unlikely(hpage_collapse_test_exit_or_disable(mm))) {
  2438				progress++;
  2439				break;
  2440			}
  2441			if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_KHUGEPAGED, PMD_ORDER)) {
  2442	skip:
  2443				progress++;
  2444				continue;
  2445			}
  2446			hstart = round_up(vma->vm_start, HPAGE_PMD_SIZE);
  2447			hend = round_down(vma->vm_end, HPAGE_PMD_SIZE);
  2448			if (khugepaged_scan.address > hend)
  2449				goto skip;
  2450			if (khugepaged_scan.address < hstart)
  2451				khugepaged_scan.address = hstart;
  2452			VM_BUG_ON(khugepaged_scan.address & ~HPAGE_PMD_MASK);
  2453	
  2454			while (khugepaged_scan.address < hend) {
  2455				bool mmap_locked = true;
  2456	
  2457				cond_resched();
  2458				if (unlikely(hpage_collapse_test_exit_or_disable(mm)))
  2459					goto breakouterloop;
  2460	
  2461				VM_BUG_ON(khugepaged_scan.address < hstart ||
  2462					  khugepaged_scan.address + HPAGE_PMD_SIZE >
  2463					  hend);
  2464				if (!vma_is_anonymous(vma)) {
  2465					struct file *file = get_file(vma->vm_file);
  2466					pgoff_t pgoff = linear_page_index(vma,
  2467							khugepaged_scan.address);
  2468	
  2469					mmap_read_unlock(mm);
  2470					mmap_locked = false;
  2471					*result = hpage_collapse_scan_file(mm,
  2472						khugepaged_scan.address, file, pgoff, cc);
  2473					fput(file);
  2474					if (*result == SCAN_PTE_MAPPED_HUGEPAGE) {
  2475						mmap_read_lock(mm);
  2476						if (hpage_collapse_test_exit_or_disable(mm))
  2477							goto breakouterloop;
  2478						*result = collapse_pte_mapped_thp(mm,
  2479							khugepaged_scan.address, false);
  2480						if (*result == SCAN_PMD_MAPPED)
  2481							*result = SCAN_SUCCEED;
  2482						mmap_read_unlock(mm);
  2483					}
  2484				} else {
  2485					*result = hpage_collapse_scan_pmd(mm, vma,
  2486						khugepaged_scan.address, &mmap_locked, cc);
  2487				}
  2488	
  2489				switch (*result) {
> 2490				case SCAN_PMD_NULL:
> 2491				case SCAN_PMD_NONE:
  2492				case SCAN_PMD_MAPPED:
  2493				case SCAN_PTE_MAPPED_HUGEPAGE:
  2494					break;
  2495				case SCAN_SUCCEED:
  2496					++khugepaged_pages_collapsed;
  2497					fallthrough;
  2498				default:
  2499					khugepaged_scan.maybe_collapse = true;
  2500				}
  2501	
  2502				/* move to next address */
  2503				khugepaged_scan.address += HPAGE_PMD_SIZE;
  2504				progress += HPAGE_PMD_NR;
  2505				if (!mmap_locked)
  2506					/*
  2507					 * We released mmap_lock so break loop.  Note
  2508					 * that we drop mmap_lock before all hugepage
  2509					 * allocations, so if allocation fails, we are
  2510					 * guaranteed to break here and report the
  2511					 * correct result back to caller.
  2512					 */
  2513					goto breakouterloop_mmap_lock;
  2514				if (progress >= pages)
  2515					goto breakouterloop;
  2516			}
  2517		}
  2518	breakouterloop:
  2519		mmap_read_unlock(mm); /* exit_mmap will destroy ptes after this */
  2520	breakouterloop_mmap_lock:
  2521	
  2522		spin_lock(&khugepaged_mm_lock);
  2523		VM_BUG_ON(khugepaged_scan.mm_slot != slot);
  2524		/*
  2525		 * Release the current mm_slot if this mm is about to die, or
  2526		 * if we scanned all vmas of this mm.
  2527		 */
  2528		if (hpage_collapse_test_exit(mm) || !vma) {
  2529			bool maybe_collapse = khugepaged_scan.maybe_collapse;
  2530	
  2531			if (mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm))
  2532				maybe_collapse = true;
  2533	
  2534			/*
  2535			 * Make sure that if mm_users is reaching zero while
  2536			 * khugepaged runs here, khugepaged_exit will find
  2537			 * mm_slot not pointing to the exiting mm.
  2538			 */
  2539			if (!list_is_last(&slot->mm_node, &khugepaged_scan.mm_head)) {
  2540				khugepaged_scan.mm_slot = list_next_entry(slot, mm_node);
  2541				khugepaged_scan.address = 0;
  2542				khugepaged_scan.maybe_collapse = false;
  2543			} else {
  2544				khugepaged_scan.mm_slot = NULL;
  2545				khugepaged_full_scans++;
  2546			}
  2547	
  2548			collect_mm_slot(slot, maybe_collapse);
  2549		}
  2550	
  2551		trace_mm_khugepaged_scan(mm, progress, khugepaged_scan.mm_slot == NULL);
  2552	
  2553		return progress;
  2554	}
  2555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
