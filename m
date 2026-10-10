Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716FF19DF6A;
	Sat, 10 Oct 2026 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791647451; cv=none; b=dTIr9tyB97xGRa/sWtOW8IkL+YbMEBE/cHJNfknlkylbZfhwZ0qAAKuegMGzClUiYbwAS6MQrETzoomLMKBe2mt/T3vI1554ThqoSP9gKR45NbmFyJi7lPm/k357r2GESdTTyeX9KNsDsjLgw8MKSA3YzMb5tyYVBFJjhzDt06s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791647451; c=relaxed/simple;
	bh=nevj+sDEz0p5goBQsD7JHc1XWG/qRy1oRXhZ6oT9PzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyrvM+Kz1xvZJ+TzVr2rdtzaw9VayIE859ccvWlv8S54IH1VMZN7QtCOz0czkT1kwpNTkj3PWO2Hky6pqvYHbXmBrJYfb6zyMCSFMiHrRJu1schhhLlxSX45pSqwYMT/1Y+Vnp+ZN9CgzD5nOKhpL1KRiRIBG14F/A1Y5Cgsa80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsE4qiqM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsE4qiqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791647448; x=1823183448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nevj+sDEz0p5goBQsD7JHc1XWG/qRy1oRXhZ6oT9PzM=;
  b=fsE4qiqMccMawcQLVeQa3QxcRTniX7f2CUnT59T5JJwM65zHkhKP1rWk
   z5QQTtKq3Zbva571OJFgvdJLhTxEVVSIDHTrH6qSiVD8q+SZ+eQSIWkst
   irKol4riDgV11CIBL2+1PzLOqTfgsSB16yuogEX4kHINJcaoj5m6FJSA1
   90mE+eOeNnn3kiogPdqJu377WEyAjgHXD0jpC9dsymRowJvukYMZ2S8hs
   l+8f11fFy/h/X4NKup9iCXSTLUiYhZjldUV8BL0vs2B0R5her2WwQlp6U
   9a4D+46v0oboo58uTFBS9Xu7Y4TXOnx6jOiKC4J4L+Azvyp6SqhgNLuio
   g==;
X-CSE-ConnectionGUID: AG0lOanuQZucEIRb7gQQJg==
X-CSE-MsgGUID: HeE25md9T/etWZ4ViuKs2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="428067"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="428067"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 08:50:47 -0700
X-CSE-ConnectionGUID: fu+59eeVSfepHp2XwHVlXA==
X-CSE-MsgGUID: hMnnbOjlR8ClA3wYq+0xDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="510155"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2026 08:50:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFZLO-000000009tE-46XU;
	Sat, 10 Oct 2026 15:50:42 +0000
Date: Sat, 10 Oct 2026 23:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/5] mm/page_alloc: convert any movable pageblock on
 a non-movable allocation
Message-ID: <202610102333.1wHL7KPQ-lkp@intel.com>
References: <20261007021250.1665929-4-riel@surriel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007021250.1665929-4-riel@surriel.com>

Hi Rik,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 67f0943b394d920b6c142aad8c6af94340342ae7]

url:    https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/mm-page_alloc-count-guard-pages-as-free-again-when-their-buddy-merges/20261006-221246
base:   67f0943b394d920b6c142aad8c6af94340342ae7
patch link:    https://lore.kernel.org/r/20261007021250.1665929-4-riel%40surriel.com
patch subject: [RFC PATCH 3/5] mm/page_alloc: convert any movable pageblock on a non-movable allocation
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20261010/202610102333.1wHL7KPQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51b433b4f56c531c0d95ba15e1a15e06c399d552)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610102333.1wHL7KPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610102333.1wHL7KPQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'PMD_SHIFT'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:60:46: note: expanded from macro 'pageblock_order'
      60 | #define pageblock_order         MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:20:34: note: expanded from macro 'HUGETLB_PAGE_ORDER'
      20 | #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   arch/riscv/include/asm/page.h:17:22: note: expanded from macro 'HPAGE_SHIFT'
      17 | #define HPAGE_SHIFT             PMD_SHIFT
         |                                 ^~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'PMD_SHIFT'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:60:46: note: expanded from macro 'pageblock_order'
      60 | #define pageblock_order         MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:20:34: note: expanded from macro 'HUGETLB_PAGE_ORDER'
      20 | #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   arch/riscv/include/asm/page.h:17:22: note: expanded from macro 'HPAGE_SHIFT'
      17 | #define HPAGE_SHIFT             PMD_SHIFT
         |                                 ^~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'PMD_SHIFT'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:60:46: note: expanded from macro 'pageblock_order'
      60 | #define pageblock_order         MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:20:34: note: expanded from macro 'HUGETLB_PAGE_ORDER'
      20 | #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   arch/riscv/include/asm/page.h:17:22: note: expanded from macro 'HPAGE_SHIFT'
      17 | #define HPAGE_SHIFT             PMD_SHIFT
         |                                 ^~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'PMD_SHIFT'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:60:46: note: expanded from macro 'pageblock_order'
      60 | #define pageblock_order         MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:20:34: note: expanded from macro 'HUGETLB_PAGE_ORDER'
      20 | #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   arch/riscv/include/asm/page.h:17:22: note: expanded from macro 'HPAGE_SHIFT'
      17 | #define HPAGE_SHIFT             PMD_SHIFT
         |                                 ^~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'PMD_SHIFT'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:60:46: note: expanded from macro 'pageblock_order'
      60 | #define pageblock_order         MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:20:34: note: expanded from macro 'HUGETLB_PAGE_ORDER'
      20 | #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   arch/riscv/include/asm/page.h:17:22: note: expanded from macro 'HPAGE_SHIFT'
      17 | #define HPAGE_SHIFT             PMD_SHIFT
         |                                 ^~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'PMD_SHIFT'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:60:46: note: expanded from macro 'pageblock_order'
      60 | #define pageblock_order         MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:20:34: note: expanded from macro 'HUGETLB_PAGE_ORDER'
      20 | #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   arch/riscv/include/asm/page.h:17:22: note: expanded from macro 'HPAGE_SHIFT'
      17 | #define HPAGE_SHIFT             PMD_SHIFT
         |                                 ^~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
   include/linux/mmzone.h:1240:17: error: use of undeclared identifier 'PMD_SHIFT'
    1240 |                start + pageblock_nr_pages <= zone_end_pfn(zone);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:60:46: note: expanded from macro 'pageblock_order'
      60 | #define pageblock_order         MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:20:34: note: expanded from macro 'HUGETLB_PAGE_ORDER'
      20 | #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   arch/riscv/include/asm/page.h:17:22: note: expanded from macro 'HPAGE_SHIFT'
      17 | #define HPAGE_SHIFT             PMD_SHIFT
         |                                 ^~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
   include/linux/mmzone.h:1240:17: error: use of undeclared identifier 'PMD_SHIFT'
    1240 |                start + pageblock_nr_pages <= zone_end_pfn(zone);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:60:46: note: expanded from macro 'pageblock_order'
      60 | #define pageblock_order         MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:20:34: note: expanded from macro 'HUGETLB_PAGE_ORDER'
      20 | #define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
         |                                  ^~~~~~~~~~~
   arch/riscv/include/asm/page.h:17:22: note: expanded from macro 'HPAGE_SHIFT'
      17 | #define HPAGE_SHIFT             PMD_SHIFT
         |                                 ^~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~


vim +/PMD_SHIFT +1237 include/linux/mmzone.h

  1229	
  1230	/*
  1231	 * Whether the pageblock holding @pfn lies wholly inside @zone. Zone
  1232	 * spans are not pageblock-aligned, so the edge pageblocks of a zone
  1233	 * can straddle into the next zone; those never change type.
  1234	 */
  1235	static inline bool zone_spans_pageblock(const struct zone *zone, unsigned long pfn)
  1236	{
> 1237		unsigned long start = pageblock_start_pfn(pfn);
  1238	
  1239		return zone->zone_start_pfn <= start &&
  1240		       start + pageblock_nr_pages <= zone_end_pfn(zone);
  1241	}
  1242	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
