Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E3C158851;
	Mon,  9 Dec 2024 04:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718559; cv=none; b=hgDfbqFRIGcMXL4QPXSN59CwaUkPrbZbmIlfLpTk9ev6lg9xk5FCnkjwKdvegMHY39gJTAumS9LwrTt84uvc8+Id8WWrdYa4M2f2W3Uoj91/nEzluC9jCIGoUQ26BXjWABVFv1FVGEek/b9C3XZbgBwT7Wj0CGzUWBDRrDEOH5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718559; c=relaxed/simple;
	bh=IO0rT1xld62E75FNfEmFBg3jopkHcF4MSJaFI19UOwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRoLx75witIXl9z/TExOBG5z3r4gAeCjQn+aCZBBF7z8lFMVzyVWF/nJuNqhLpuDyHPSwoRsIjSXYpZGxoZRKXNgC2r+XHAveQogzpk/IkH8kXDJ6yEsEsOAmu+GovvVxmoUvxj1R57SD9iZQYya49WW+yo2mQFGFMm6dU5RLF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpTqUcHD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpTqUcHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718557; x=1765254557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IO0rT1xld62E75FNfEmFBg3jopkHcF4MSJaFI19UOwk=;
  b=GpTqUcHDxTEWk85Zt2pqCkSBscKZ9YHxp8gmvAkPhOmq2JDUHwmqGMHk
   ms5laMWbRRCoMgP4hIA8g7ryz90VJ9FRlQdBpe9mX3UKV/V0wUZkskkC+
   alYTtfsZGLIePf7SeF0buKYK5H6clXYTynqGuHoXD8rsP0RhNkI357ShQ
   7WE+uzqMwpQAjEX2Itn1xgSyl5cKjCm4CnyF4nSpfuUyGypKRdghcJS9m
   xjfz8VoM6vhEQwurpiUghVzOxTruXf7n+Sda422cVqSBgZVRYHbwUWrze
   VJhFjbbuhDVurigcHe7SNiSNYHuhHOB5FA4x1EVHJT+yz0K9QTwBqWPYD
   g==;
X-CSE-ConnectionGUID: cIVcX0SbQ+icYYRR7zksrQ==
X-CSE-MsgGUID: 8XD8Mk7TRVy/yOPPq6wnLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34122906"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34122906"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:29:16 -0800
X-CSE-ConnectionGUID: QFcs3nwpRjuYy0aiyOnlmg==
X-CSE-MsgGUID: vbAasVTdQ1+jJjN6jafamA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99404807"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2024 20:29:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVOS-0003rB-32;
	Mon, 09 Dec 2024 04:29:12 +0000
Date: Mon, 9 Dec 2024 12:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/6] mm: move per-vma lock into vm_area_struct
Message-ID: <202412080413.gMTEz8lE-lkp@intel.com>
References: <20241206225204.4008261-3-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206225204.4008261-3-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-introduce-vma_start_read_locked-_nested-helpers/20241207-065517
base:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
patch link:    https://lore.kernel.org/r/20241206225204.4008261-3-surenb%40google.com
patch subject: [PATCH v5 2/6] mm: move per-vma lock into vm_area_struct
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241208/202412080413.gMTEz8lE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080413.gMTEz8lE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080413.gMTEz8lE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/damon/vaddr.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2251:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/damon/vaddr.c:736:
>> mm/damon/tests/vaddr-kunit.h:66:13: warning: stack frame size (2552) exceeds limit (2048) in 'damon_test_three_regions_in_vmas' [-Wframe-larger-than]
      66 | static void damon_test_three_regions_in_vmas(struct kunit *test)
         |             ^
   5 warnings generated.


vim +/damon_test_three_regions_in_vmas +66 mm/damon/tests/vaddr-kunit.h

17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  38  
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  39  /*
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  40   * Test __damon_va_three_regions() function
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  41   *
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  42   * In case of virtual memory address spaces monitoring, DAMON converts the
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  43   * complex and dynamic memory mappings of each target task to three
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  44   * discontiguous regions which cover every mapped areas.  However, the three
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  45   * regions should not include the two biggest unmapped areas in the original
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  46   * mapping, because the two biggest areas are normally the areas between 1)
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  47   * heap and the mmap()-ed regions, and 2) the mmap()-ed regions and stack.
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  48   * Because these two unmapped areas are very huge but obviously never accessed,
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  49   * covering the region is just a waste.
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  50   *
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  51   * '__damon_va_three_regions() receives an address space of a process.  It
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  52   * first identifies the start of mappings, end of mappings, and the two biggest
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  53   * unmapped areas.  After that, based on the information, it constructs the
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  54   * three regions and returns.  For more detail, refer to the comment of
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  55   * 'damon_init_regions_of()' function definition in 'mm/damon.c' file.
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  56   *
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  57   * For example, suppose virtual address ranges of 10-20, 20-25, 200-210,
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  58   * 210-220, 300-305, and 307-330 (Other comments represent this mappings in
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  59   * more short form: 10-20-25, 200-210-220, 300-305, 307-330) of a process are
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  60   * mapped.  To cover every mappings, the three regions should start with 10,
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  61   * and end with 305.  The process also has three unmapped areas, 25-200,
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  62   * 220-300, and 305-307.  Among those, 25-200 and 220-300 are the biggest two
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  63   * unmapped areas, and thus it should be converted to three regions of 10-25,
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  64   * 200-220, and 300-330.
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  65   */
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07 @66  static void damon_test_three_regions_in_vmas(struct kunit *test)
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  67  {
d0cf3dd47f0d5d mm/damon/vaddr-test.h        Liam R. Howlett 2022-09-06  68  	static struct mm_struct mm;
ba7196e566516f mm/damon/tests/vaddr-kunit.h Leo Stone       2024-09-22  69  	struct damon_addr_range regions[3] = {0};
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  70  	/* 10-20-25, 200-210-220, 300-305, 307-330 */
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  71  	struct vm_area_struct vmas[] = {
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  72  		(struct vm_area_struct) {.vm_start = 10, .vm_end = 20},
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  73  		(struct vm_area_struct) {.vm_start = 20, .vm_end = 25},
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  74  		(struct vm_area_struct) {.vm_start = 200, .vm_end = 210},
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  75  		(struct vm_area_struct) {.vm_start = 210, .vm_end = 220},
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  76  		(struct vm_area_struct) {.vm_start = 300, .vm_end = 305},
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  77  		(struct vm_area_struct) {.vm_start = 307, .vm_end = 330},
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  78  	};
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  79  
f0679f9e6d88ae mm/damon/tests/vaddr-kunit.h SeongJae Park   2024-09-04  80  	mt_init_flags(&mm.mm_mt, MT_FLAGS_ALLOC_RANGE | MT_FLAGS_USE_RCU);
34403fa579514a mm/damon/vaddr-test.h        Liam R. Howlett 2023-01-20  81  	if (__link_vmas(&mm.mm_mt, vmas, ARRAY_SIZE(vmas)))
34403fa579514a mm/damon/vaddr-test.h        Liam R. Howlett 2023-01-20  82  		kunit_skip(test, "Failed to create VMA tree");
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  83  
d0cf3dd47f0d5d mm/damon/vaddr-test.h        Liam R. Howlett 2022-09-06  84  	__damon_va_three_regions(&mm, regions);
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  85  
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  86  	KUNIT_EXPECT_EQ(test, 10ul, regions[0].start);
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  87  	KUNIT_EXPECT_EQ(test, 25ul, regions[0].end);
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  88  	KUNIT_EXPECT_EQ(test, 200ul, regions[1].start);
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  89  	KUNIT_EXPECT_EQ(test, 220ul, regions[1].end);
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  90  	KUNIT_EXPECT_EQ(test, 300ul, regions[2].start);
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  91  	KUNIT_EXPECT_EQ(test, 330ul, regions[2].end);
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  92  }
17ccae8bb5c928 mm/damon/vaddr-test.h        SeongJae Park   2021-09-07  93  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
