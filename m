Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F90A36494C;
	Thu, 16 Apr 2026 20:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776372585; cv=none; b=Eo890/tee9V6piLQxdy0/mQJjAfuzG7/vOlJruCEynQGYASpUhA1M8MUe7YI2WDurhdu5KKMJkAT3boZWXfmag3vT5KEvXILGMvAse4CVW5/JcSNowutBS19TBUVI8Q7Q2fq4VJhATOoMcDIfO9ZBTnnHbXMGjAz+/MTAK7QpjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776372585; c=relaxed/simple;
	bh=stH/brX79a1vg/cpHFV2z9/Y/HKboNd6d+XsyrNhea0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TvuuaL0QU376+98gJgbe5mavqBPhRAjvZ1YEgHLskl91DP5L0cGznI4nyCp15lRWX8+lH3XhXtaoZEN6wIDEkD2MRAMXpMWBfzfMuAlshkdmKGuMTfCW6o15ge1bHiwuWth77v9CRQlCU6t6hxlOALS+gmv4Pa9Lyq15Gng42fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMsHNwAu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMsHNwAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776372584; x=1807908584;
  h=date:from:to:cc:subject:message-id;
  bh=stH/brX79a1vg/cpHFV2z9/Y/HKboNd6d+XsyrNhea0=;
  b=AMsHNwAuMYRoJWPaCazmINs8uuxWg4qwAl4pFlGjIcffquHU9ui5aiJW
   NkbH9+72zk6mTqnuuhHN4LkNclI5oAJMNZT/DLKgSIllOXdzWv+yAQ9nw
   XHtHSP9YCR0YdP/beCka7RM6zA6Orb6Yh2S39/wqFzfUizrB5x0kLh6T1
   bjAbiXD8K2WqGByCvcAPwpEIfaz8soZOEKNapbCxNBMJO6/upDbah0pho
   TfMFOWwSKXmL27WcLue5kPGaSe3+xymRmVEOX8rVetqiski2keNsJ7OjJ
   dA40OHIZYfVe23awy64zknq8bIeRQIQvjXRksnrYrHJwV6GKYCw1gEzp1
   A==;
X-CSE-ConnectionGUID: O5/sdBmJQ6OCP+1wOQyZvQ==
X-CSE-MsgGUID: R8EZ/ZWfTSaaOuxpu3qKXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="64926310"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="64926310"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 13:49:43 -0700
X-CSE-ConnectionGUID: DDzY/OEGR3WyhQiUNhXb4w==
X-CSE-MsgGUID: oGVUB51CSN2LebjvDMjlkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="228170418"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2026 13:49:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDTed-0000000016n-3CVy;
	Thu, 16 Apr 2026 20:49:39 +0000
Date: Thu, 16 Apr 2026 22:49:39 +0200
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: fs/proc/task_mmu.c:2517:5: error: call to undeclared
 function 'make_uffd_wp_pud'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202604162242.51z63ao3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/mm-Add-softleaf_from_pud/20260416-123625
head:   258d05b2de477745977b64b126df65257709931d
commit: 258d05b2de477745977b64b126df65257709931d mm: Make /proc/pid/pagemap use the new generic pagewalk API
date:   16 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260416/202604162242.51z63ao3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604162242.51z63ao3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604162242.51z63ao3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/task_mmu.c:2517:5: error: call to undeclared function 'make_uffd_wp_pud'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2517 |                                 make_uffd_wp_pud(ptw.vma, curr_addr, ptw.pudp);
         |                                 ^
   fs/proc/task_mmu.c:2517:5: note: did you mean 'make_uffd_wp_pmd'?
   fs/proc/task_mmu.c:2054:13: note: 'make_uffd_wp_pmd' declared here
    2054 | static void make_uffd_wp_pmd(struct vm_area_struct *vma,
         |             ^
   1 error generated.


vim +/make_uffd_wp_pud +2517 fs/proc/task_mmu.c

  2467	
  2468	static int pagemap_scan_walk(struct vm_area_struct *vma, struct pagemap_scan_private *p,
  2469				      unsigned long addr)
  2470	{
  2471		int ret = 0;
  2472		struct pt_range_walk ptw = {
  2473			.mm = vma->vm_mm
  2474		};
  2475		enum pt_range_walk_type type;
  2476		pt_type_flags_t flags = PT_TYPE_ALL;
  2477	
  2478	keep_walking:
  2479		type = pt_range_walk_start(&ptw, vma, addr, vma->vm_end, flags);
  2480		while (type != PTW_DONE) {
  2481			unsigned long categories = p->cur_vma_category |
  2482						   pagemap_set_category(p, &ptw, type);
  2483			unsigned long curr_addr = ptw.curr_addr;
  2484	
  2485			if (pagemap_scan_is_interesting_page(categories, p)) {
  2486				unsigned long end;
  2487	
  2488				end = ptw.next_addr;
  2489	
  2490				if (~p->arg.flags & PM_SCAN_WP_MATCHING)
  2491					goto keep_walking;
  2492				if (~categories & PAGE_IS_WRITTEN)
  2493					goto keep_walking;
  2494	
  2495				ret = pagemap_scan_output(categories, p, curr_addr, &end);
  2496				if (curr_addr == end)
  2497					goto out;
  2498	
  2499				if (end != curr_addr + HPAGE_SIZE) {
  2500					if (is_vm_hugetlb_page(ptw.vma)) {
  2501						/* Partial HugeTLB page WP isn't possible. */
  2502						pagemap_scan_backout_range(p, curr_addr, end);
  2503						p->arg.walk_end = curr_addr;
  2504						ret = 0;
  2505						goto keep_walking;
  2506					}
  2507					if (ptw.level == PTW_PMD_LEVEL) {
  2508						pt_range_walk_done(&ptw);
  2509						split_huge_pmd(ptw.vma, ptw.pmdp, curr_addr);
  2510						pagemap_scan_backout_range(p, curr_addr, end);
  2511						/* Relaunch now that we split the pmd */
  2512						goto keep_walking;
  2513					}
  2514				}
  2515	
  2516				if (ptw.level == PTW_PUD_LEVEL)
> 2517					make_uffd_wp_pud(ptw.vma, curr_addr, ptw.pudp);
  2518				if (ptw.level == PTW_PMD_LEVEL)
  2519					make_uffd_wp_pmd(ptw.vma, curr_addr, ptw.pmdp);
  2520				if (ptw.level == PTW_PTE_LEVEL)
  2521					make_uffd_wp_pte(ptw.vma, curr_addr, ptw.ptep, ptw.pte);
  2522			}
  2523			type = pt_range_walk_next(&ptw, vma, vma->vm_start, vma->vm_end, flags);
  2524		}
  2525	out:
  2526		pt_range_walk_done(&ptw);
  2527		return ret;
  2528	}
  2529	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
