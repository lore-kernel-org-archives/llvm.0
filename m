Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF73D285061;
	Fri,  1 May 2026 22:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777673042; cv=none; b=e6iw3m5n/v93uhoem6NTDhwA/gAj+wtLZiVWVn+94tPDq2nxBOlVhNzhElo9r9f6277ulwiouG6Sn6YOC0onP1+Ll9Qw9cTAm2v1opWoT/f6lHAQY4O61N7m9xDU9tf+0oCZKcsPGNvFAn8MWChxOP2A1hwhfIKyzA9XDkALqlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777673042; c=relaxed/simple;
	bh=e57VWQdL28s6g6Hu5dkatYf13Qy3QYbNlwOFL5uURz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgUaugyLWkfYd+lHEcbry/mNYJnPQPE3b5JMBNMD9znCd6FTN+JAOan/hDLDBCtqjgH187+WI9g4tV4CPiD2IoDmj/SkXlwMaq8Y47RfUHz6nHHPcQUD6U2JTjPJSw3c9axhLKh+5WQ4yFc3xaFMM4cgOa/rVK56p5X3bpw7Jmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYgQ2G8Y; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYgQ2G8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777673039; x=1809209039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e57VWQdL28s6g6Hu5dkatYf13Qy3QYbNlwOFL5uURz8=;
  b=SYgQ2G8YlOjHsEpZZLkjg9AFWMKgMacq5gk+MJc9asmbWWmI4rcvPh9b
   TqdEGeNpq9ZxZOt6HLPOjgcvC1k7ellBJ8OJCU/KnsXJRFghftAPMcEQ2
   /gFGP7mt4aVZL6ijF8USffG3lOVDuTEQ8OyDzJiCMTB/r5E8uHLeZAGav
   LmCra2HaWOzBTkrM27EezzPs2rGdLRkKjrE1+xPwyXj07bGsEwLdeD1GW
   yWHT0ZMxQA/CkuSgr8wGfdrVpEqMuXC5cnoGDz6y0ew8e44vkaXMVtsHz
   C0uitLRzmlJOdkXLpR+YVqTj8uBKMYxLThNWBrEhUS1axpU43GK6GjjvI
   w==;
X-CSE-ConnectionGUID: 4pH7/2emT8q7S6EOOGCvyQ==
X-CSE-MsgGUID: 7UKC8DSVTfqwrJuRzkzZCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="82487370"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="82487370"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 15:03:58 -0700
X-CSE-ConnectionGUID: jb/xX6iSSp+A0vdniWMIJA==
X-CSE-MsgGUID: iIvzikc3QZixcLyyKOp1jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="234860131"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 May 2026 15:03:57 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIvxi-000000000tJ-1KfF;
	Fri, 01 May 2026 22:03:54 +0000
Date: Sat, 2 May 2026 06:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mingyu Wang <25181214217@stu.xidian.edu.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm/hugetlb: fix resv_map memory leak in
 __mmap_region error path
Message-ID: <202605020650.VNBzVdYb-lkp@intel.com>
References: <20260425070700.562229-1-25181214217@stu.xidian.edu.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425070700.562229-1-25181214217@stu.xidian.edu.cn>

Hi Mingyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingyu-Wang/mm-hugetlb-fix-resv_map-memory-leak-in-__mmap_region-error-path/20260425-203812
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260425070700.562229-1-25181214217%40stu.xidian.edu.cn
patch subject: [RFC PATCH] mm/hugetlb: fix resv_map memory leak in __mmap_region error path
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260502/202605020650.VNBzVdYb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020650.VNBzVdYb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020650.VNBzVdYb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:865:28: warning: declaration of 'struct vm_area_desc' will not be visible outside of this function [-Wvisibility]
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^
   1 warning generated.
--
   In file included from kernel/fork.c:16:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:865:28: warning: declaration of 'struct vm_area_desc' will not be visible outside of this function [-Wvisibility]
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:521:45: error: use of undeclared identifier 'PMD_SHIFT'
     521 |         return mapping_max_folio_order(mapping) >= PMD_ORDER;
         |                                                    ^~~~~~~~~
   include/linux/pgtable.h:8:20: note: expanded from macro 'PMD_ORDER'
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   In file included from kernel/fork.c:42:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.
--
   In file included from kernel/cpu.c:5:
   In file included from include/linux/sched/mm.h:8:
>> include/linux/mm_types.h:865:28: warning: declaration of 'struct vm_area_desc' will not be visible outside of this function [-Wvisibility]
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^
   In file included from kernel/cpu.c:26:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:13:
   include/linux/pagemap.h:521:45: error: use of undeclared identifier 'PMD_SHIFT'
     521 |         return mapping_max_folio_order(mapping) >= PMD_ORDER;
         |                                                    ^~~~~~~~~
   include/linux/pgtable.h:8:20: note: expanded from macro 'PMD_ORDER'
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   1 warning and 1 error generated.
--
   In file included from kernel/sched/core.c:12:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:865:28: warning: declaration of 'struct vm_area_desc' will not be visible outside of this function [-Wvisibility]
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^
   In file included from kernel/sched/core.c:83:
   In file included from arch/arm/include/asm/tlb.h:21:
   include/linux/pagemap.h:521:45: error: use of undeclared identifier 'PMD_SHIFT'
     521 |         return mapping_max_folio_order(mapping) >= PMD_ORDER;
         |                                                    ^~~~~~~~~
   include/linux/pgtable.h:8:20: note: expanded from macro 'PMD_ORDER'
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   kernel/sched/core.c:8053:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    8053 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:8028:1: note: array 'preempt_modes' declared here
    8028 | const char *preempt_modes[] = {
         | ^
   2 warnings and 1 error generated.
--
   In file included from kernel/time/timekeeping.c:6:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/arm/include/asm/uaccess.h:17:
   In file included from arch/arm/include/asm/pgtable.h:16:
   In file included from arch/arm/include/asm/pgtable-nommu.h:13:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:865:28: warning: declaration of 'struct vm_area_desc' will not be visible outside of this function [-Wvisibility]
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^
   kernel/time/timekeeping.c:1948:13: warning: variable 'suspend_timing_needed' set but not used [-Wunused-but-set-global]
    1948 | static bool suspend_timing_needed;
         |             ^
   2 warnings generated.
--
   In file included from kernel/time/alarmtimer.c:18:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm/include/asm/hardirq.h:10:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:19:
   In file included from include/linux/topology.h:34:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:865:28: warning: declaration of 'struct vm_area_desc' will not be visible outside of this function [-Wvisibility]
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^
   kernel/time/alarmtimer.c:54:29: warning: variable 'freezer_alarmtype' set but not used [-Wunused-but-set-global]
      54 | static enum alarmtimer_type freezer_alarmtype;
         |                             ^
   kernel/time/alarmtimer.c:55:16: warning: variable 'freezer_expires' set but not used [-Wunused-but-set-global]
      55 | static ktime_t freezer_expires;
         |                ^
   3 warnings generated.
--
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:865:28: warning: declaration of 'struct vm_area_desc' will not be visible outside of this function [-Wvisibility]
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^
   1 warning generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:15:
   In file included from include/linux/sched/mm.h:8:
>> include/linux/mm_types.h:865:28: warning: declaration of 'struct vm_area_desc' will not be visible outside of this function [-Wvisibility]
     865 |         void (*abort_hook)(struct vm_area_desc *desc);
         |                                   ^
   1 warning generated.


vim +865 include/linux/mm_types.h

   820	
   821	/*
   822	 * Describes an action an mmap_prepare hook can instruct to be taken to complete
   823	 * the mapping of a VMA. Specified in vm_area_desc.
   824	 */
   825	struct mmap_action {
   826		union {
   827			struct {
   828				unsigned long start;
   829				unsigned long start_pfn;
   830				unsigned long size;
   831				pgprot_t pgprot;
   832			} remap;
   833			struct {
   834				phys_addr_t start_phys_addr;
   835				unsigned long size;
   836			} simple_ioremap;
   837			struct {
   838				unsigned long start;
   839				struct page **pages;
   840				unsigned long nr_pages;
   841				pgoff_t pgoff;
   842			} map_kernel;
   843		};
   844		enum mmap_action_type type;
   845	
   846		/*
   847		 * If specified, this hook is invoked after the selected action has been
   848		 * successfully completed. Note that the VMA write lock still held.
   849		 *
   850		 * The absolute minimum ought to be done here.
   851		 *
   852		 * Returns 0 on success, or an error code.
   853		 */
   854		int (*success_hook)(const struct vm_area_struct *vma);
   855	
   856		/*
   857		 * If specified, this hook is invoked when an error occurred when
   858		 * attempting the selected action.
   859		 *
   860		 * The hook can return an error code in order to filter the error, but
   861		 * it is not valid to clear the error here.
   862		 */
   863		int (*error_hook)(int err);
   864		
 > 865		void (*abort_hook)(struct vm_area_desc *desc);
   866	
   867		/*
   868		 * This should be set in rare instances where the operation required
   869		 * that the rmap should not be able to access the VMA until
   870		 * completely set up.
   871		 */
   872		bool hide_from_rmap_until_complete :1;
   873	};
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
