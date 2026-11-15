Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794756566;
	b=cWgYrxYBAqXHnQQiQfcfuFEjTjQlbrrD94003xspjuO5T9bk3BWcvgjMMbNG39mBBLSB
	 as0k9V22+f5m+WJoBhGHXheKzHBUo0NAjylW7wdy7tZlcjvRnMTTqdr7LPF7DwAh4il/d
	 Yo2BoCXOHxpJRvSBTCRpb7mP7pWWX/tV6IKLguPTss4yihY3SjBq2bIL+iZO90Jse+NiL
	 /g0sEveRoRrYk59kMNuv0wI5hXenWZYz40PYPAc0ChxJI5Caa10ZVMOLTN0QCxgoHSHcB
	 DHNI/do4EWSayuCZ8bW9yddETAzv2ZzXqcmKap9ANNWq/03Wb8QUh34WlYYalUY84SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756566;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Yb/rW1NOmAiEOX8njX27I+yC9sCUQ2ioynhsTqMUeEU=;
	b=WBi+mndNG2sD2B6WkzwolVEKRTJlRc040yy/UsO/iaiARcAlvAYGMNn/SxJGjc4xdlHV
	 b/zAS9yJhOHyT6zy6R3JhFI4Iz3UjoWJiz2iV6SULpQZbRBDbDpwGXwoyNlsqC53NUkBj
	 JGw/tjo2fqlBSCrbPGm2GTA/s3v5SbFkOhE0tGjq5TLgBAYI73KhWS01UQtyFoS/1joKG
	 ZTdx5T9Z5ljwg1+FFiGy1glrC8+XzOqfBTSLVYUrt9xKMSkeoMQYd0aGcXoYP8UFpT0gY
	 ZwdZ9lqt0Vi8wf35zMsKTbgLM0NmDs6fcQ24X2gbFRSpsH7+hoArgSBdbOYDAqfPzDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=in3oqOzp;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF46606A31E;
	Sun, 15 Nov 2026 15:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF46606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=in3oqOzp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794756566; x=1826292566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z+Gdrxc3ydTyR+6uvWLKyFCQ1TI3j9Fxfs4TZg3tGNY=;
  b=in3oqOzpSVOujUmPwk4QNFONNuyBcEEpBEypABMzkikEC6CuC88be3DM
   agZoaW2a74DnSmr1TPqKhh7Prewb0kmiP1YXCcpqwMoHiKZvGxKHy52Ce
   8+hWmjQfF4Wve2knTWSRdltGDkfEgkNfLsdluNMeh97l8t1nubiiobcto
   58qq1lZh4SovnkGSiS+YeGkC3cDG6NqKXq/rhyeMhOU8jkUv+QJe76rTO
   CHv7hRUhXBaeZ7AkbhucADDx2QZfM1c7CiTk8irjkG/m0B2/FZe6N3pHl
   B9zqxExEqKOTCr/UToN/StYlFc5gPG7q6JvgmpC7EOb57pXsIBi2HCO4K
   Q==;
X-CSE-ConnectionGUID: URmtrDgWQdmdBmbGuh5Dyw==
X-CSE-MsgGUID: f9HYkYgSTEqVg1sFX3T44w==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3579334"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3579334"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 07:29:25 -0800
X-CSE-ConnectionGUID: uHGKMeRrTCafyscBwkhRzQ==
X-CSE-MsgGUID: 71k7X6P9QdSw6nMHEdQ/kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9597153"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2026 07:29:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xScAS-000000016zE-3MLt;
	Sun, 15 Nov 2026 15:29:20 +0000
Date: Sun, 15 Nov 2026 23:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org
Subject: Re: [PATCH v2 2/2] mm/ksm: add initialization helpers for
 scan_get_next_rmap_item()
Message-ID: <202611152302.OUfZlgfW-lkp@intel.com>
References: <20261115080049.132515-1-xu.xin@linux.dev>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115080049.132515-1-xu.xin@linux.dev>

Hi Xu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Xin-vivo/mm-ksm-extract-helper-functions-for-scan-cycle-cleanup/20261115-160032
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261115080049.132515-1-xu.xin%40linux.dev
patch subject: [PATCH v2 2/2] mm/ksm: add initialization helpers for scan_get_next_rmap_item()
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261115/202611152302.OUfZlgfW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ca14e3d05c4e63d6e8103945c86b958ed2f55d5f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611152302.OUfZlgfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611152302.OUfZlgfW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/ksm.c:2693:6: warning: variable 'mm_slot' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2693 |         if (scan_should_start_new_cycle()) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/ksm.c:2720:10: note: uninitialized use occurs here
    2720 |         slot = &mm_slot->slot;
         |                 ^~~~~~~
   mm/ksm.c:2693:2: note: remove the 'if' if its condition is always true
    2693 |         if (scan_should_start_new_cycle()) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/ksm.c:2684:29: note: initialize the variable 'mm_slot' to silence this warning
    2684 |         struct ksm_mm_slot *mm_slot;
         |                                    ^
         |                                     = NULL
   1 warning generated.


vim +2693 mm/ksm.c

  2680	
  2681	static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
  2682	{
  2683		struct mm_struct *mm;
  2684		struct ksm_mm_slot *mm_slot;
  2685		struct mm_slot *slot;
  2686		struct vm_area_struct *vma;
  2687		struct ksm_rmap_item *rmap_item;
  2688		struct vma_iterator vmi;
  2689	
  2690		if (list_empty(&ksm_mm_head.slot.mm_node))
  2691			return NULL;
  2692	
> 2693		if (scan_should_start_new_cycle()) {
  2694			advisor_start_scan();
  2695			trace_ksm_start_scan(ksm_scan.seqnr, ksm_rmap_items);
  2696	
  2697			/*
  2698			 * A number of pages can hang around indefinitely in per-cpu
  2699			 * LRU cache, raised page count preventing write_protect_page
  2700			 * from merging them.  Though it doesn't really matter much,
  2701			 * it is puzzling to see some stuck in pages_volatile until
  2702			 * other activity jostles them out, and they also prevented
  2703			 * LTP's KSM test from succeeding deterministically; so drain
  2704			 * them here (here rather than on entry to ksm_do_scan(),
  2705			 * so we don't IPI too often when pages_to_scan is set low).
  2706			 */
  2707			lru_add_drain_all();
  2708	
  2709			ksm_prune_migrate_nodes();
  2710			ksm_reset_unstable_trees();
  2711	
  2712			mm_slot = scan_get_first_mm();
  2713			if (!mm_slot)
  2714				return NULL;
  2715	next_mm:
  2716			ksm_scan.address = 0;
  2717			ksm_scan.rmap_list = &mm_slot->rmap_list;
  2718		}
  2719	
  2720		slot = &mm_slot->slot;
  2721		mm = slot->mm;
  2722		vma_iter_init(&vmi, mm, ksm_scan.address);
  2723	
  2724		mmap_read_lock(mm);
  2725		if (ksm_test_exit(mm))
  2726			goto no_vmas;
  2727	
  2728		for_each_vma(vmi, vma) {
  2729			if (!(vma->vm_flags & VM_MERGEABLE))
  2730				continue;
  2731			if (ksm_scan.address < vma->vm_start)
  2732				ksm_scan.address = vma->vm_start;
  2733			if (!vma_has_anon_rmap(vma))
  2734				ksm_scan.address = vma->vm_end;
  2735	
  2736			while (ksm_scan.address < vma->vm_end) {
  2737				struct ksm_next_page_arg ksm_next_page_arg;
  2738				struct page *tmp_page = NULL;
  2739				struct folio *folio;
  2740	
  2741				if (ksm_test_exit(mm))
  2742					goto no_vmas;
  2743	
  2744				int found;
  2745	
  2746				found = walk_page_range_vma(vma, ksm_scan.address,
  2747							    vma->vm_end,
  2748							    &ksm_next_page_ops,
  2749							    &ksm_next_page_arg);
  2750	
  2751				if (found > 0) {
  2752					folio = ksm_next_page_arg.folio;
  2753					tmp_page = ksm_next_page_arg.page;
  2754					ksm_scan.address = ksm_next_page_arg.addr;
  2755				} else {
  2756					VM_WARN_ON_ONCE(found < 0);
  2757					ksm_scan.address = vma->vm_end - PAGE_SIZE;
  2758				}
  2759	
  2760				if (tmp_page) {
  2761					flush_anon_page(vma, tmp_page, ksm_scan.address);
  2762					flush_dcache_page(tmp_page);
  2763					rmap_item = get_next_rmap_item(mm_slot,
  2764						ksm_scan.rmap_list, ksm_scan.address);
  2765					if (rmap_item) {
  2766						ksm_scan.rmap_list =
  2767								&rmap_item->rmap_list;
  2768	
  2769						if (should_skip_rmap_item(folio, rmap_item)) {
  2770							folio_put(folio);
  2771							goto next_page;
  2772						}
  2773	
  2774						ksm_scan.address += PAGE_SIZE;
  2775						*page = tmp_page;
  2776					} else {
  2777						folio_put(folio);
  2778					}
  2779					mmap_read_unlock(mm);
  2780					return rmap_item;
  2781				}
  2782	next_page:
  2783				ksm_scan.address += PAGE_SIZE;
  2784				cond_resched();
  2785			}
  2786		}
  2787	
  2788		if (ksm_test_exit(mm)) {
  2789	no_vmas:
  2790			ksm_scan.address = 0;
  2791			ksm_scan.rmap_list = &mm_slot->rmap_list;
  2792		}
  2793		/*
  2794		 * Nuke all the rmap_items that are above this current rmap:
  2795		 * because there were no VM_MERGEABLE vmas with such addresses.
  2796		 */
  2797		remove_trailing_rmap_items(ksm_scan.rmap_list);
  2798	
  2799		spin_lock(&ksm_mmlist_lock);
  2800		slot = list_entry(mm_slot->slot.mm_node.next,
  2801				  struct mm_slot, mm_node);
  2802		ksm_scan.mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
  2803		if (ksm_scan.address == 0) {
  2804			/*
  2805			 * We've completed a full scan of all vmas, holding mmap_lock
  2806			 * throughout, and found no VM_MERGEABLE: so do the same as
  2807			 * __ksm_exit does to remove this mm from all our lists now.
  2808			 * This applies either when cleaning up after __ksm_exit
  2809			 * (but beware: we can reach here even before __ksm_exit),
  2810			 * or when all VM_MERGEABLE areas have been unmapped (and
  2811			 * mmap_lock then protects against race with MADV_MERGEABLE).
  2812			 */
  2813			mm_slot_remove(&mm_slot->slot);
  2814			spin_unlock(&ksm_mmlist_lock);
  2815	
  2816			mm_slot_free(mm_slot_cache, mm_slot);
  2817			/*
  2818			 * Only clear MMF_VM_MERGEABLE. We must not clear
  2819			 * MMF_VM_MERGE_ANY, because for those MMF_VM_MERGE_ANY process,
  2820			 * perhaps their mm_struct has just been added to ksm_mm_slot
  2821			 * list, and its process has not yet officially started running
  2822			 * or has not yet performed mmap/brk to allocate anonymous VMAS.
  2823			 */
  2824			mm_flags_clear(MMF_VM_MERGEABLE, mm);
  2825			mmap_read_unlock(mm);
  2826			mmdrop(mm);
  2827		} else {
  2828			mmap_read_unlock(mm);
  2829			/*
  2830			 * mmap_read_unlock(mm) first because after
  2831			 * spin_unlock(&ksm_mmlist_lock) run, the "mm" may
  2832			 * already have been freed under us by __ksm_exit()
  2833			 * because the "mm_slot" is still hashed and
  2834			 * ksm_scan.mm_slot doesn't point to it anymore.
  2835			 */
  2836			spin_unlock(&ksm_mmlist_lock);
  2837		}
  2838	
  2839		/* Repeat until we've completed scanning the whole list */
  2840		mm_slot = ksm_scan.mm_slot;
  2841		if (mm_slot != &ksm_mm_head)
  2842			goto next_mm;
  2843	
  2844		advisor_stop_scan();
  2845	
  2846		trace_ksm_stop_scan(ksm_scan.seqnr, ksm_rmap_items);
  2847		ksm_scan.seqnr++;
  2848		return NULL;
  2849	}
  2850	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
