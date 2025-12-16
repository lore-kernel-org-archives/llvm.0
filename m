Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181AF34214F
	for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866640; cv=none; b=GtRBwyZPbGL+KZAdlrKdFoGVG84I3wFZVJUO1BV00YdEHeb+RJFy10qltXjLqRH42lVRPUgTFEV5DdMG4e2xqI+CYbSbppzj8FMMzbl+6ktL5gANyWIqYtrbNueek215Qy/IyD7nd7qVpUCdiBz30HNlYiNBxTnDFDZlv4c1/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866640; c=relaxed/simple;
	bh=fGQwug9YnJ/Gu+o7PSDdPRDh/jVcUbblX5xsVg8Qm58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXihS2IsFximn8es+isbzDSzGzIZcxlfRKcxu3RyGp4/WMG685QKVNZc8db00GsGeLbZIketWanMBxw5HV8IO6oZOVKp0QTn9hcYIpZ18dFSi2Hp5Y3gMbAuSZ1ekk4lTqCi1qfDf6Q8lypRs1qBhYQsk4tyagMkPetNnaKtn64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERXMPNQv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERXMPNQv"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0a95200e8so21769755ad.0
        for <llvm@lists.linux.dev>; Mon, 15 Dec 2025 22:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765866630; x=1766471430; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6hz9jdXtFMh2qAHrt6NkjlTikBzsrAftSe+xfn1Yjs=;
        b=ERXMPNQvm0IkSHzI+VVKa9oSxppU3szCEZDzHxiTons53rBCBYXA11GIryTLRA6Vds
         6NfAyH3Qr3SswNngarscoNUiZyHqaHl0Q6G0LLSd07LuMO3zhE+1Sob3C1K8L34vaeZP
         ysjEGPNjJdHYlH9a4OIWis9RbkvE5Jo7rFDe8YvBC+GZXXfeId2zpjnqufr01hE7uE2p
         MoLEE8WyjDFMmI2/tNsMWLTQW9R0Ha1XUhRk30gfYyp5HrGOwTmAmtrj4Bn7Ss9bev3w
         SGocMDD8CDnUI36GZvRq2eFmJpMujxK4R5nOrrxpOZFi6BywaWLjJUNGy+Vi23tWFXi7
         Q31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765866630; x=1766471430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6hz9jdXtFMh2qAHrt6NkjlTikBzsrAftSe+xfn1Yjs=;
        b=Cl60qw9xabm5A+TnGHZ/jtmXIs9EoAkfN5dg3EIiqTqQkVDqg2Uo4oFxexxnioKFF7
         mjEyWANXoAEwkkXvrzYpACqQR2y10WORdKWMCp/ImxZKM9O43B8w7JY14+QOm1Ev1HOU
         +JgJdv45S3OxJyaltyVj7kMCKP18KcbV99LnI0jiAH3GltR5drdx40p6SjjdHG+vwJvN
         TpMWYs4BGOuPtPMojXrYikPPLXmFzqlCHAG4Gxj6Qxevut/Ctts6/o49MImy+Wf1f5r5
         AAZGHe8T0zq+885gvv2qv3KLSk84zHFF0YPlLB+pcUaGpWr9t/EVK394Idw3wmqvx9IK
         4M1w==
X-Forwarded-Encrypted: i=1; AJvYcCW8pm9pnCywBBJT/i3ufflM6JdRvmleoxsiwN+q/+gFg5doFPM+QK31gyDJ/3Bdbimstm9m@lists.linux.dev
X-Gm-Message-State: AOJu0YzLh51sWAXuzL3KxX60psJwF++RrJtnBPgxQaAeV8ZBjqjqCVJS
	JnWKMJR+jse2p9wHZKY2ZKevff2XG1YYscDg3ZsdKAd5IklmlHKDPI3R
X-Gm-Gg: AY/fxX7d1POigSCuhHjFta2grU0+DXlO7iTHrSzISFzTmXvkeRXrqOZKkqvXW+IRkvi
	Bmks01XqeY+aFyYdOUYdTKApnFX+civCjzKYGQZKT6HeGhraySKY5YnqDkuH2EL0fG9YnMyH/5q
	IusrHONUuM9zCb2J0Km41M89QPS2TJG0eyyY78ikYJD4CRO7t2bZCfwJ/HOtMpi71qc5p48b5fU
	WDnY+cepZoop/YMnjrZq5l6wjxzdXzhkD3n9JB7oVLjAbjEmSBxLDknsQiY76+aY3BAhlm9OtyA
	J2SvGOy8zQK+MbYCi2UFGrZsDz3g6UJlT4u0rL52aupZudpRCLgMKIVrcxY4VQYgzcO/2+pBbEe
	HL3N6Jbek/o9VJHsIBACKLM7GsAjeFA67vFoh7dBT5jRmIIqnQgg8cqa6znDqrgH5E/cz2jyIMf
	BnmX7JeGqX7wTiBkZZJYpbc5AA
X-Google-Smtp-Source: AGHT+IEolo+n77ASckTX3/EY5JIe/RABcbNjmNYeXvNzTrdbM79wggS/bRbZ+AJ+1vYZfzhSRF9log==
X-Received: by 2002:a17:903:f90:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-29f23c7ba77mr135454575ad.37.1765866629767;
        Mon, 15 Dec 2025 22:30:29 -0800 (PST)
Received: from localhost.localdomain ([114.231.217.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d38b98sm154247525ad.34.2025.12.15.22.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:30:29 -0800 (PST)
Date: Tue, 16 Dec 2025 14:30:20 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, david@kernel.org, 
	lorenzo.stoakes@oracle.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	ziy@nvidia.com, baohua@kernel.org, lance.yang@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vernon Yang <yanglincheng@kylinos.cn>
Subject: Re: [PATCH 2/4] mm: khugepaged: remove mm when all memory has been
 collapsed
Message-ID: <x2675vjrcxax375coeazrvfegtxasr74saf44mrb4npf5cgdr2@cg7gajuen7ni>
References: <20251215090419.174418-3-yanglincheng@kylinos.cn>
 <202512160533.KuHwyJTP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512160533.KuHwyJTP-lkp@intel.com>

On Tue, Dec 16, 2025 at 05:45:31AM +0800, kernel test robot wrote:
> Hi Vernon,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on linus/master v6.19-rc1 next-20251215]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/mm-khugepaged-add-trace_mm_khugepaged_scan-event/20251215-171046
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20251215090419.174418-3-yanglincheng%40kylinos.cn
> patch subject: [PATCH 2/4] mm: khugepaged: remove mm when all memory has been collapsed
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251216/202512160533.KuHwyJTP-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160533.KuHwyJTP-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512160533.KuHwyJTP-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/khugepaged.c:2490:9: error: use of undeclared identifier 'SCAN_PMD_NULL'; did you mean 'SCAN_VMA_NULL'?
>     2490 |                         case SCAN_PMD_NULL:
>          |                              ^~~~~~~~~~~~~
>          |                              SCAN_VMA_NULL
>    mm/khugepaged.c:50:2: note: 'SCAN_VMA_NULL' declared here
>       50 |         SCAN_VMA_NULL,
>          |         ^
> >> mm/khugepaged.c:2491:9: error: use of undeclared identifier 'SCAN_PMD_NONE'
>     2491 |                         case SCAN_PMD_NONE:
>          |                              ^
>    2 errors generated.

This series is based on Linux v6.18, due to the v6.19-rc1 add "mm/khugepaged:
unify SCAN_PMD_NONE and SCAN_PMD_NULL into SCAN_NO_PTE_TABLE"[1], trigger this
build errors. I'll fix it in the next version, Thanks!

[1] https://lkml.kernel.org/r/20251114030028.7035-4-richard.weiyang@gmail.com

>
> vim +2490 mm/khugepaged.c
>
>   2392
>   2393	static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
>   2394						    struct collapse_control *cc)
>   2395		__releases(&khugepaged_mm_lock)
>   2396		__acquires(&khugepaged_mm_lock)
>   2397	{
>   2398		struct vma_iterator vmi;
>   2399		struct mm_slot *slot;
>   2400		struct mm_struct *mm;
>   2401		struct vm_area_struct *vma;
>   2402		int progress = 0;
>   2403
>   2404		VM_BUG_ON(!pages);
>   2405		lockdep_assert_held(&khugepaged_mm_lock);
>   2406		*result = SCAN_FAIL;
>   2407
>   2408		if (khugepaged_scan.mm_slot) {
>   2409			slot = khugepaged_scan.mm_slot;
>   2410		} else {
>   2411			slot = list_first_entry(&khugepaged_scan.mm_head,
>   2412					     struct mm_slot, mm_node);
>   2413			khugepaged_scan.address = 0;
>   2414			khugepaged_scan.mm_slot = slot;
>   2415			khugepaged_scan.maybe_collapse = false;
>   2416		}
>   2417		spin_unlock(&khugepaged_mm_lock);
>   2418
>   2419		mm = slot->mm;
>   2420		/*
>   2421		 * Don't wait for semaphore (to avoid long wait times).  Just move to
>   2422		 * the next mm on the list.
>   2423		 */
>   2424		vma = NULL;
>   2425		if (unlikely(!mmap_read_trylock(mm)))
>   2426			goto breakouterloop_mmap_lock;
>   2427
>   2428		progress++;
>   2429		if (unlikely(hpage_collapse_test_exit_or_disable(mm)))
>   2430			goto breakouterloop;
>   2431
>   2432		vma_iter_init(&vmi, mm, khugepaged_scan.address);
>   2433		for_each_vma(vmi, vma) {
>   2434			unsigned long hstart, hend;
>   2435
>   2436			cond_resched();
>   2437			if (unlikely(hpage_collapse_test_exit_or_disable(mm))) {
>   2438				progress++;
>   2439				break;
>   2440			}
>   2441			if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_KHUGEPAGED, PMD_ORDER)) {
>   2442	skip:
>   2443				progress++;
>   2444				continue;
>   2445			}
>   2446			hstart = round_up(vma->vm_start, HPAGE_PMD_SIZE);
>   2447			hend = round_down(vma->vm_end, HPAGE_PMD_SIZE);
>   2448			if (khugepaged_scan.address > hend)
>   2449				goto skip;
>   2450			if (khugepaged_scan.address < hstart)
>   2451				khugepaged_scan.address = hstart;
>   2452			VM_BUG_ON(khugepaged_scan.address & ~HPAGE_PMD_MASK);
>   2453
>   2454			while (khugepaged_scan.address < hend) {
>   2455				bool mmap_locked = true;
>   2456
>   2457				cond_resched();
>   2458				if (unlikely(hpage_collapse_test_exit_or_disable(mm)))
>   2459					goto breakouterloop;
>   2460
>   2461				VM_BUG_ON(khugepaged_scan.address < hstart ||
>   2462					  khugepaged_scan.address + HPAGE_PMD_SIZE >
>   2463					  hend);
>   2464				if (!vma_is_anonymous(vma)) {
>   2465					struct file *file = get_file(vma->vm_file);
>   2466					pgoff_t pgoff = linear_page_index(vma,
>   2467							khugepaged_scan.address);
>   2468
>   2469					mmap_read_unlock(mm);
>   2470					mmap_locked = false;
>   2471					*result = hpage_collapse_scan_file(mm,
>   2472						khugepaged_scan.address, file, pgoff, cc);
>   2473					fput(file);
>   2474					if (*result == SCAN_PTE_MAPPED_HUGEPAGE) {
>   2475						mmap_read_lock(mm);
>   2476						if (hpage_collapse_test_exit_or_disable(mm))
>   2477							goto breakouterloop;
>   2478						*result = collapse_pte_mapped_thp(mm,
>   2479							khugepaged_scan.address, false);
>   2480						if (*result == SCAN_PMD_MAPPED)
>   2481							*result = SCAN_SUCCEED;
>   2482						mmap_read_unlock(mm);
>   2483					}
>   2484				} else {
>   2485					*result = hpage_collapse_scan_pmd(mm, vma,
>   2486						khugepaged_scan.address, &mmap_locked, cc);
>   2487				}
>   2488
>   2489				switch (*result) {
> > 2490				case SCAN_PMD_NULL:
> > 2491				case SCAN_PMD_NONE:
>   2492				case SCAN_PMD_MAPPED:
>   2493				case SCAN_PTE_MAPPED_HUGEPAGE:
>   2494					break;
>   2495				case SCAN_SUCCEED:
>   2496					++khugepaged_pages_collapsed;
>   2497					fallthrough;
>   2498				default:
>   2499					khugepaged_scan.maybe_collapse = true;
>   2500				}
>   2501
>   2502				/* move to next address */
>   2503				khugepaged_scan.address += HPAGE_PMD_SIZE;
>   2504				progress += HPAGE_PMD_NR;
>   2505				if (!mmap_locked)
>   2506					/*
>   2507					 * We released mmap_lock so break loop.  Note
>   2508					 * that we drop mmap_lock before all hugepage
>   2509					 * allocations, so if allocation fails, we are
>   2510					 * guaranteed to break here and report the
>   2511					 * correct result back to caller.
>   2512					 */
>   2513					goto breakouterloop_mmap_lock;
>   2514				if (progress >= pages)
>   2515					goto breakouterloop;
>   2516			}
>   2517		}
>   2518	breakouterloop:
>   2519		mmap_read_unlock(mm); /* exit_mmap will destroy ptes after this */
>   2520	breakouterloop_mmap_lock:
>   2521
>   2522		spin_lock(&khugepaged_mm_lock);
>   2523		VM_BUG_ON(khugepaged_scan.mm_slot != slot);
>   2524		/*
>   2525		 * Release the current mm_slot if this mm is about to die, or
>   2526		 * if we scanned all vmas of this mm.
>   2527		 */
>   2528		if (hpage_collapse_test_exit(mm) || !vma) {
>   2529			bool maybe_collapse = khugepaged_scan.maybe_collapse;
>   2530
>   2531			if (mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm))
>   2532				maybe_collapse = true;
>   2533
>   2534			/*
>   2535			 * Make sure that if mm_users is reaching zero while
>   2536			 * khugepaged runs here, khugepaged_exit will find
>   2537			 * mm_slot not pointing to the exiting mm.
>   2538			 */
>   2539			if (!list_is_last(&slot->mm_node, &khugepaged_scan.mm_head)) {
>   2540				khugepaged_scan.mm_slot = list_next_entry(slot, mm_node);
>   2541				khugepaged_scan.address = 0;
>   2542				khugepaged_scan.maybe_collapse = false;
>   2543			} else {
>   2544				khugepaged_scan.mm_slot = NULL;
>   2545				khugepaged_full_scans++;
>   2546			}
>   2547
>   2548			collect_mm_slot(slot, maybe_collapse);
>   2549		}
>   2550
>   2551		trace_mm_khugepaged_scan(mm, progress, khugepaged_scan.mm_slot == NULL);
>   2552
>   2553		return progress;
>   2554	}
>   2555
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--
Thanks,
Vernon
