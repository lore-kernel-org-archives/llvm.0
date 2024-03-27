Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B2C12F5A2;
	Wed, 27 Mar 2024 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711554575; cv=none; b=ogNUGfeW0eD5PGcmZfmjsj+cEbHDz7Ih2TGab4yARXWC0Z7DlYv3SanLkv/22/XktxzFrqKvD+rfq0wjlopTNmrH9dQ+4IQm44G1pkGXoBedoDURDr/yqDL2vmYoTGKSbhjNXbFvhAXgrhNOOpeQt9qFcIeNeQkPq2qYYNZRaNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711554575; c=relaxed/simple;
	bh=3+3rTIZLMNVq2DIz0U63cFFM57ZBq6Ems6cu0JDFuNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIlzyIPrZPmAq6Auf3b3nTII/JKBLerzRwtiNecxd1o+Hbl0U5K0tFteJc0E9jZ2inZ2cLYIUubiJOGat2YsopEa7i76gj/U3WSHJRsCIHmE66fa/amevD98piDQRbnPtydApq7BmquYNwiw+OC/vCh9LirM2DxzW89JZxikps8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5nkkfTb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5nkkfTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711554573; x=1743090573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3+3rTIZLMNVq2DIz0U63cFFM57ZBq6Ems6cu0JDFuNI=;
  b=b5nkkfTbCsfFnEhT9OVcrYw5g/ggvi7InCZYwve2k3D8PboDi4heKtKJ
   y8pA2+p7q4P7YsVxXWhOxekcUhw8gl4W/oGfmy45fM0rY7i978d46GU7S
   nBxRSGqNnC/7VRVhDcHwMFDwdpUDzQYKTqHgW+aG4Q7dzuASPu7kmiOV3
   5rT4GOsv+qCk3575OKiu05VoPtwc6F3y+fQhh+yw+xVkGGJY90DdQ623z
   EPEtsMiyG6Q+16LxlutCZOFQBze763VDZ6sn/o7HL5wCfKRULdyPYaKva
   znIHTLzZqDECUw5DQ8fYbpYIiV+Tp5P7YnpRBraFs+N3uJr30Nrq1yh/l
   w==;
X-CSE-ConnectionGUID: SLcyJTYhR/aGIKiwKy5vsQ==
X-CSE-MsgGUID: 3YtfvuPrTreaBTM8AfUK+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17215011"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17215011"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 08:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="47545707"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Mar 2024 08:49:30 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpVWp-0001By-1W;
	Wed, 27 Mar 2024 15:49:27 +0000
Date: Wed, 27 Mar 2024 23:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH 07/10] mm: Convert arch_clear_hugepage_flags to take a
 folio
Message-ID: <202403272336.lPdKvPYd-lkp@intel.com>
References: <20240326171045.410737-8-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326171045.410737-8-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20240327]
[cannot apply to jcmvbkbc-xtensa/xtensa-for-next arm64/for-next/core s390/features tj-cgroup/for-next linus/master vbabka-slab/for-next v6.9-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/sh-Remove-use-of-PG_arch_1-on-individual-pages/20240327-011221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240326171045.410737-8-willy%40infradead.org
patch subject: [PATCH 07/10] mm: Convert arch_clear_hugepage_flags to take a folio
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240327/202403272336.lPdKvPYd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403272336.lPdKvPYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403272336.lPdKvPYd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/mm/init.c:10:
   In file included from include/linux/mm.h:2239:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/riscv/mm/init.c:22:
   include/linux/hugetlb.h:840:20: error: redefinition of 'arch_clear_hugetlb_flags'
     840 | static inline void arch_clear_hugetlb_flags(struct folio *folio) { }
         |                    ^
   arch/riscv/include/asm/hugetlb.h:12:34: note: expanded from macro 'arch_clear_hugetlb_flags'
      12 | #define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
         |                                  ^
   arch/riscv/include/asm/hugetlb.h:8:20: note: previous definition is here
       8 | static inline void arch_clear_hugetlb_flags(struct folio *folio)
         |                    ^
>> arch/riscv/mm/init.c:112:22: warning: implicit conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from 1099511627776 to 0 [-Wconstant-conversion]
     112 |                    (((t) - (b)) >> LOG2_SZ_1T));
         |                                    ^~~~~~~~~~
   include/linux/printk.h:520:36: note: expanded from macro 'pr_notice'
     520 |         printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
         |                                           ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
     457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:5:1: note: expanded from here
       5 | 0x10000000000ULL
         | ^~~~~~~~~~~~~~~~
   include/linux/log2.h:162:14: note: expanded from macro 'ilog2'
     162 |         __ilog2_u32(n) :                \
         |         ~~~~~~~~~~~ ^
   arch/riscv/mm/init.c:122:43: warning: implicit conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from 1099511627776 to 0 [-Wconstant-conversion]
     122 |         if (IS_ENABLED(CONFIG_64BIT) && (diff >> LOG2_SZ_1T) >= 10)
         |                                                  ^~~~~~~~~~
   arch/riscv/mm/init.c:88:27: note: expanded from macro 'LOG2_SZ_1T'
      88 | #define LOG2_SZ_1T  ilog2(SZ_1T)
         |                     ~~~~~~^~~~~~
   include/linux/sizes.h:55:18: note: expanded from macro 'SZ_1T'
      55 | #define SZ_1T                           _AC(0x10000000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:10:1: note: expanded from here
      10 | 0x10000000000ULL
         | ^~~~~~~~~~~~~~~~
   include/linux/log2.h:162:14: note: expanded from macro 'ilog2'
     162 |         __ilog2_u32(n) :                \
         |         ~~~~~~~~~~~ ^
   3 warnings and 1 error generated.


vim +112 arch/riscv/mm/init.c

26b8f69edda85a Alexandre Ghiti 2021-12-06  107  
26b8f69edda85a Alexandre Ghiti 2021-12-06  108  #ifdef CONFIG_64BIT
26b8f69edda85a Alexandre Ghiti 2021-12-06  109  static inline void print_mlt(char *name, unsigned long b, unsigned long t)
26b8f69edda85a Alexandre Ghiti 2021-12-06  110  {
26b8f69edda85a Alexandre Ghiti 2021-12-06  111  	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld TB)\n", name, b, t,
26b8f69edda85a Alexandre Ghiti 2021-12-06 @112  		   (((t) - (b)) >> LOG2_SZ_1T));
26b8f69edda85a Alexandre Ghiti 2021-12-06  113  }
26b8f69edda85a Alexandre Ghiti 2021-12-06  114  #else
26b8f69edda85a Alexandre Ghiti 2021-12-06  115  #define print_mlt(n, b, t) do {} while (0)
26b8f69edda85a Alexandre Ghiti 2021-12-06  116  #endif
26b8f69edda85a Alexandre Ghiti 2021-12-06  117  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
