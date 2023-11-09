Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9377620B1B;
	Thu,  9 Nov 2023 19:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9CmKn4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699556890; x=1731092890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yWTDA5OQls8cfbWPj5y2WOfn1M/AtsguX3V9MSRj6DU=;
  b=A9CmKn4U/f6//grFq48YWQp8dBg8jE4NZJONNIosyCLm7Ba5X0BEiICG
   6cvGKthN4u2e2aEB3eYLm5OQx/UEVLMoAoqp2dqA179pO2QjYWuufJF+K
   RUg8I+T9loc3KouyVyfc2fgp+qrKcxj0nitllGVqO0kiA4UEgwKH3o/W1
   LuRmamRYJJTHiHZA35RhS9GQANwhUx+PYIzFGtU7PhU6X2lkzZ9UAd4o0
   Wg8rk1GKzykKp8Gl2NLkTZtjvwuy6SHCX3I1I4+Q1pDx50E7vQg5xxUNp
   roNoNPjjn4ePBiNJEGUInYwJaMnJEpdhnWn5dF7t4Wk5mCfr/9Nou7JWQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="8710198"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="8710198"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 11:08:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="713415352"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="713415352"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Nov 2023 11:08:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ANk-00094f-2i;
	Thu, 09 Nov 2023 19:08:00 +0000
Date: Fri, 10 Nov 2023 03:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Byungchul Park <byungchul@sk.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel_team@skhynix.com, akpm@linux-foundation.org,
	ying.huang@intel.com, namit@vmware.com, xhao@linux.alibaba.com,
	mgorman@techsingularity.net, hughd@google.com, willy@infradead.org,
	david@redhat.com, peterz@infradead.org, luto@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com
Subject: Re: [v4 2/3] mm: Defer TLB flush by keeping both src and dst folios
 at migration
Message-ID: <202311100211.UAqu6dj7-lkp@intel.com>
References: <20231109045908.54996-3-byungchul@sk.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109045908.54996-3-byungchul@sk.com>

Hi Byungchul,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/x86/core tip/x86/mm v6.6]
[cannot apply to akpm-mm/mm-everything linus/master next-20231109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Byungchul-Park/mm-rmap-Recognize-read-only-TLB-entries-during-batched-TLB-flush/20231109-163706
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20231109045908.54996-3-byungchul%40sk.com
patch subject: [v4 2/3] mm: Defer TLB flush by keeping both src and dst folios at migration
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231110/202311100211.UAqu6dj7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100211.UAqu6dj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100211.UAqu6dj7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:1416:35: error: field has incomplete type 'struct arch_tlbflush_unmap_batch'
    1416 |         struct arch_tlbflush_unmap_batch arch;
         |                                          ^
   include/linux/mm_types.h:1416:9: note: forward declaration of 'struct arch_tlbflush_unmap_batch'
    1416 |         struct arch_tlbflush_unmap_batch arch;
         |                ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for function 'foo' [-Wmissing-prototypes]
       9 | void foo(void)
         |      ^
   arch/x86/um/shared/sysdep/kernel-offsets.h:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       9 | void foo(void)
         | ^
         | static 
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:116: arch/um/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1416 include/linux/mm_types.h

  1401	
  1402	struct migrc_req {
  1403		/*
  1404		 * folios pending for TLB flush
  1405		 */
  1406		struct list_head folios;
  1407	
  1408		/*
  1409		 * for hanging to the associated numa node
  1410		 */
  1411		struct llist_node llnode;
  1412	
  1413		/*
  1414		 * architecture specific data for batched TLB flush
  1415		 */
> 1416		struct arch_tlbflush_unmap_batch arch;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
