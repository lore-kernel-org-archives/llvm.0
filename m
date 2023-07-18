Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4EE17CE;
	Tue, 18 Jul 2023 03:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689650569; x=1721186569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aJZuOLRDoZmR5wq1avqI6S9/M+n9MFkf5qZ+Zou7bIg=;
  b=gsLSA+ihMpir6hhDuib3I/KNYR4fh352jg7guRCctB00vSoQnahGdsS/
   NN16eEHT41H8mtUHe7VBRxuxvg9j4AEwZhPJ8CRXvJjNzJjMebPPR3xG9
   u1/SaXKQa/iss00otzFBtGpoNUo4OOgjnIhjArHl/Eu4Y4h94FFyH4Wq8
   GqoPcm8DluhD//xqO4NAodlq0tlm6Txx8ZTI4pXF9xbutaRGzmNWkG5sL
   jG26IW4NQB2DSEgF89U2SWD3tP12kKCR0ID5FhciU3K18VkYqtcJPM3Yt
   6ZQefOyldhujlh2twpvZWbzU2zYWyVL4Lgx6kl6mvglIb1C0+TSDOJ+UV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="350959126"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="350959126"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 20:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="837119205"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="837119205"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2023 20:22:47 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLbIU-000097-0h;
	Tue, 18 Jul 2023 03:22:46 +0000
Date: Tue, 18 Jul 2023 11:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 49/49] mm/mmap.c:2430:46: error: scalar initializer
 cannot be empty
Message-ID: <202307181128.R3ZHQ75J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   9f224067d9c080c83f978d2f5fe805e5dd9473ef
commit: 9f224067d9c080c83f978d2f5fe805e5dd9473ef [49/49] temporal fix for f40b24c7c416 ("mm/mmap: change detached vma locking scheme")
config: mips-randconfig-r005-20230718 (https://download.01.org/0day-ci/archive/20230718/202307181128.R3ZHQ75J-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181128.R3ZHQ75J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307181128.R3ZHQ75J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mmap.c:2430:46: error: scalar initializer cannot be empty
           mt_detach.ma_external_lock = (lockdep_map_p){};
                                                       ^~
   1 error generated.


vim +2430 mm/mmap.c

  2403	
  2404	/*
  2405	 * do_vmi_align_munmap() - munmap the aligned region from @start to @end.
  2406	 * @vmi: The vma iterator
  2407	 * @vma: The starting vm_area_struct
  2408	 * @mm: The mm_struct
  2409	 * @start: The aligned start address to munmap.
  2410	 * @end: The aligned end address to munmap.
  2411	 * @uf: The userfaultfd list_head
  2412	 * @unlock: Set to true to drop the mmap_lock.  unlocking only happens on
  2413	 * success.
  2414	 *
  2415	 * Return: 0 on success and drops the lock if so directed, error and leaves the
  2416	 * lock held otherwise.
  2417	 */
  2418	static int
  2419	do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
  2420			    struct mm_struct *mm, unsigned long start,
  2421			    unsigned long end, struct list_head *uf, bool unlock)
  2422	{
  2423		struct vm_area_struct *prev, *next = NULL;
  2424		struct maple_tree mt_detach;
  2425		int count = 0;
  2426		int error = -ENOMEM;
  2427		unsigned long locked_vm = 0;
  2428		MA_STATE(mas_detach, &mt_detach, 0, 0);
  2429		mt_init_flags(&mt_detach, vmi->mas.tree->ma_flags & MT_FLAGS_LOCK_MASK);
> 2430		mt_detach.ma_external_lock = (lockdep_map_p){};
  2431	
  2432		/*
  2433		 * If we need to split any vma, do it now to save pain later.
  2434		 *
  2435		 * Note: mremap's move_vma VM_ACCOUNT handling assumes a partially
  2436		 * unmapped vm_area_struct will remain in use: so lower split_vma
  2437		 * places tmp vma above, and higher split_vma places tmp vma below.
  2438		 */
  2439	
  2440		/* Does it split the first one? */
  2441		if (start > vma->vm_start) {
  2442	
  2443			/*
  2444			 * Make sure that map_count on return from munmap() will
  2445			 * not exceed its limit; but let map_count go just above
  2446			 * its limit temporarily, to help free resources as expected.
  2447			 */
  2448			if (end < vma->vm_end && mm->map_count >= sysctl_max_map_count)
  2449				goto map_count_exceeded;
  2450	
  2451			error = __split_vma(vmi, vma, start, 0);
  2452			if (error)
  2453				goto start_split_failed;
  2454	
  2455			vma = vma_iter_load(vmi);
  2456		}
  2457	
  2458		prev = vma_prev(vmi);
  2459		if (unlikely((!prev)))
  2460			vma_iter_set(vmi, start);
  2461	
  2462		/*
  2463		 * Detach a range of VMAs from the mm. Using next as a temp variable as
  2464		 * it is always overwritten.
  2465		 */
  2466		for_each_vma_range(*vmi, next, end) {
  2467			/* Does it split the end? */
  2468			if (next->vm_end > end) {
  2469				error = __split_vma(vmi, next, end, 0);
  2470				if (error)
  2471					goto end_split_failed;
  2472			}
  2473			vma_start_write(next);
  2474			mas_set_range(&mas_detach, next->vm_start, next->vm_end - 1);
  2475			error = mas_store_gfp(&mas_detach, next, GFP_KERNEL);
  2476			if (error)
  2477				goto munmap_gather_failed;
  2478			vma_mark_detached(next, true);
  2479			if (next->vm_flags & VM_LOCKED)
  2480				locked_vm += vma_pages(next);
  2481	
  2482			count++;
  2483			if (unlikely(uf)) {
  2484				/*
  2485				 * If userfaultfd_unmap_prep returns an error the vmas
  2486				 * will remain split, but userland will get a
  2487				 * highly unexpected error anyway. This is no
  2488				 * different than the case where the first of the two
  2489				 * __split_vma fails, but we don't undo the first
  2490				 * split, despite we could. This is unlikely enough
  2491				 * failure that it's not worth optimizing it for.
  2492				 */
  2493				error = userfaultfd_unmap_prep(next, start, end, uf);
  2494	
  2495				if (error)
  2496					goto userfaultfd_error;
  2497			}
  2498	#ifdef CONFIG_DEBUG_VM_MAPLE_TREE
  2499			BUG_ON(next->vm_start < start);
  2500			BUG_ON(next->vm_start > end);
  2501	#endif
  2502		}
  2503	
  2504		if (vma_iter_end(vmi) > end)
  2505			next = vma_iter_load(vmi);
  2506	
  2507		if (!next)
  2508			next = vma_next(vmi);
  2509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
