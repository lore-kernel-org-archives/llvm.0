Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9148713A258;
	Sat, 10 Oct 2026 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652494; cv=none; b=S+IumixpbHIuUtDZCPc4jQCfMMVEiaH1IXezIi1ogWbjTTZTnPsUUkoOydbbjYk38k8/fK5meDTRtlbYfafTjjplTZqcVB/khNTlvNYPScgva6ZOWs3wXggrJH7KskaRThn7vtQjqunmjzSsDpUT0FL84P9K4OeIFTjMhAb5mvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652494; c=relaxed/simple;
	bh=Xju8/M6E2whzp9BF6dkJEwRtyRY4J70IeGaP64oTfx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISvrK6OG1aoaxHSGTSpl0+2Ue1Ycs/NgNzxMcBIk393ieLnmS+KikyS9J/5iVpGxRMjz5GEPxCQXZwcbfAew8dHFuxQLqYHvQ/BJK6vP+SwVdZNuBlONObfBxmScaOMyvK44U6wbV6qkcs3AxYY1v9NYSD0mvvB0qKQEIwWi4BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXWSmZGN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXWSmZGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791652492; x=1823188492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xju8/M6E2whzp9BF6dkJEwRtyRY4J70IeGaP64oTfx8=;
  b=RXWSmZGNrYGs1JK4Ig58Yiaflj+43can+bi8VFa3jHB/4U0TUgqodJ/V
   fT9U8TamM5ML3PmtqqfJisxa9Chu10oFUzVrvgXQdebI8PFAuKqcRxrPd
   QlPuo7tY7j+bYWvlUl5CXypIICRhkXDX5u4J0uWSsfN21ls1WPUGBb4bc
   afZHuLzvv2RsK2pUuz+HrbmWYX9DXPO3UygzPB6w1oGFnexk+pSgMjuwv
   fIPG3YJhWiLs3eBm65wlQSg6g0vMIcb6vvpugLaVWtX2lUMk1E+0CJ1Em
   tQtSGl4uAPPgqXy6Yv61GivuZnd8L6fFj1w0r/m87btUBO4sKAh7BDF2R
   Q==;
X-CSE-ConnectionGUID: DT/TB5bfQ+6m4WUsGf+gvQ==
X-CSE-MsgGUID: CxOUCB0TQ7K+Hjve5EmKzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="323097"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="323097"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 10:14:51 -0700
X-CSE-ConnectionGUID: JhwBzl5sRoSQGsmKQEW8JQ==
X-CSE-MsgGUID: Lkd9rOJQQHa8Ec6MP39bbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="485437"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Oct 2026 10:14:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFaem-000000009xE-1KRs;
	Sat, 10 Oct 2026 17:14:48 +0000
Date: Sun, 11 Oct 2026 01:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/5] mm/page_alloc: convert any movable pageblock on
 a non-movable allocation
Message-ID: <202610110115.cCikSIza-lkp@intel.com>
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
config: x86_64-randconfig-1006-20261010 (https://download.01.org/0day-ci/archive/20261011/202610110115.cCikSIza-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610110115.cCikSIza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610110115.cCikSIza-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1237:24: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
    1237 |         unsigned long start = pageblock_start_pfn(pfn);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:78:52: note: expanded from macro 'pageblock_start_pfn'
      78 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   include/linux/mmzone.h:1240:17: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
    1240 |                start + pageblock_nr_pages <= zone_end_pfn(zone);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   include/linux/mmzone.h:1240:17: error: use of undeclared identifier 'HPAGE_PMD_ORDER'
    1240 |                start + pageblock_nr_pages <= zone_end_pfn(zone);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:75:36: note: expanded from macro 'pageblock_nr_pages'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:46: note: expanded from macro 'pageblock_order'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:


vim +/HPAGE_PMD_ORDER +1237 include/linux/mmzone.h

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
