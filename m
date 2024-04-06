Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C939BEEBB;
	Sat,  6 Apr 2024 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712395833; cv=none; b=GAcCfnZ1GVwFpODI7DaJe7UJm8iThUOY4ABpLie3/ve/ZeLxsOdyAWB/GOoA8kPXAl93Nz/LARkdLenPZw1xth83eFgFjMVsvo3RzyWLb7B4V735FER0hGOfUtat+0QB5WcWCqHxk5VZEcdrOftMXxhSqiQeG/Lux8czFnXChC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712395833; c=relaxed/simple;
	bh=taJ1IZL4sQ/L/mUTVEJneJ1QnpSIwDSAiY/beDRkeyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UMesJAMyJj30iB9QNhL81pcOPSO7Ox6iHStutcZ8CKRaPKuomZkem3gVdQBwWsuilif+5/eUWuLF4546rnchqbntSlBf/yPMLeeEKBj8UYrLwfOaQ+lPMwqgyjwqMpGVTYzS9BLZzmAlW9Adpuc/WeTu91GmTfpaG8AKd3S11Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Omw7hAx6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Omw7hAx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712395831; x=1743931831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=taJ1IZL4sQ/L/mUTVEJneJ1QnpSIwDSAiY/beDRkeyc=;
  b=Omw7hAx6lG23u1r8o9d2Duv7KnhYzw09SgC74nG9Xt6uqhOIxhqk8QVN
   M3TgXG6zdBnFys86isIqtI6NhtcoJGJ2nGoIckcM43gvQ0e0nMsZOcddB
   ayhFgj7sWcTFauRtI54585H602ZJVfO0LRPoZCTLUb6vHF1JLvQh0IX6u
   8+JV1Ut9mSmXcuIic4XTpxcGT0oEIKoUWtuWNoV6Lk+HpGhLl+RI5vOJY
   DVqYk1OFjArNFuwU7tyQgDPz+AnVb8N8lDUJkHSFMu79c0oMAojgwEPX2
   KGp8iAjIVBhNx385ld4FKeGCPhd+Pm7REKSzD+E+Gbh1tqRWeLnSQ3y3Y
   g==;
X-CSE-ConnectionGUID: cIEGu0mYTDKffvk6ETV+rQ==
X-CSE-MsgGUID: FHq6hgf3S62ojj2gWfdHXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7585860"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7585860"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 02:30:30 -0700
X-CSE-ConnectionGUID: vFlNZTshRVSN1bgXiDG1JQ==
X-CSE-MsgGUID: Ebc/PSASTqu3JJwr64Tc3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19326315"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2024 02:30:28 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt2NV-0003LC-2R;
	Sat, 06 Apr 2024 09:30:25 +0000
Date: Sat, 6 Apr 2024 17:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <v-songbaohua@oppo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 313/322] include/linux/huge_mm.h:274:16: error:
 fields must have a constant size: 'variable length array in structure'
 extension will never be supported
Message-ID: <202404061754.n8jmZ6s3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f43b3aae94511d62174c3b29239da0dd22d0eeb3
commit: d4358ee0a075e232114dfec0cd162860cfa2771b [313/322] mm: add per-order mTHP anon_alloc and anon_alloc_fallback counters
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240406/202404061754.n8jmZ6s3-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061754.n8jmZ6s3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061754.n8jmZ6s3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:1115:
>> include/linux/huge_mm.h:274:22: warning: variable length array used [-Wvla]
     274 |         unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
         |                             ^~~~~~~~~~~~~
   include/linux/pgtable.h:8:20: note: expanded from macro 'PMD_ORDER'
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^
   arch/powerpc/include/asm/book3s/64/pgtable.h:207:33: note: expanded from macro 'PMD_SHIFT'
     207 | #define PMD_SHIFT       (PAGE_SHIFT + PTE_INDEX_SIZE)
         |                                       ^
   arch/powerpc/include/asm/book3s/64/pgtable.h:156:25: note: expanded from macro 'PTE_INDEX_SIZE'
     156 | #define PTE_INDEX_SIZE  __pte_index_size
         |                         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:1115:
>> include/linux/huge_mm.h:274:16: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
     274 |         unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
         |                       ^
>> include/linux/huge_mm.h:283:2: error: indirection requires pointer operand ('void' invalid)
     283 |         this_cpu_inc(mthp_stats.stats[order][item]);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:501:28: note: expanded from macro 'this_cpu_inc'
     501 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:491:33: note: expanded from macro 'this_cpu_add'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:365:11: note: expanded from macro '__pcpu_size_call'
     365 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:401:34: note: expanded from macro 'this_cpu_add_1'
     401 | #define this_cpu_add_1(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:156:2: note: expanded from macro 'this_cpu_generic_to_op'
     156 |         raw_cpu_generic_to_op(pcp, val, op);                            \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:2: note: expanded from macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:1115:
>> include/linux/huge_mm.h:283:2: error: indirection requires pointer operand ('void' invalid)
     283 |         this_cpu_inc(mthp_stats.stats[order][item]);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:501:28: note: expanded from macro 'this_cpu_inc'
     501 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:491:33: note: expanded from macro 'this_cpu_add'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:366:11: note: expanded from macro '__pcpu_size_call'
     366 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:404:34: note: expanded from macro 'this_cpu_add_2'
     404 | #define this_cpu_add_2(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:156:2: note: expanded from macro 'this_cpu_generic_to_op'
     156 |         raw_cpu_generic_to_op(pcp, val, op);                            \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:2: note: expanded from macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:1115:
>> include/linux/huge_mm.h:283:2: error: indirection requires pointer operand ('void' invalid)
     283 |         this_cpu_inc(mthp_stats.stats[order][item]);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:501:28: note: expanded from macro 'this_cpu_inc'
     501 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:491:33: note: expanded from macro 'this_cpu_add'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:367:11: note: expanded from macro '__pcpu_size_call'
     367 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:407:34: note: expanded from macro 'this_cpu_add_4'
     407 | #define this_cpu_add_4(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:156:2: note: expanded from macro 'this_cpu_generic_to_op'
     156 |         raw_cpu_generic_to_op(pcp, val, op);                            \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:2: note: expanded from macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:1115:
>> include/linux/huge_mm.h:283:2: error: indirection requires pointer operand ('void' invalid)
     283 |         this_cpu_inc(mthp_stats.stats[order][item]);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:501:28: note: expanded from macro 'this_cpu_inc'
     501 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:491:33: note: expanded from macro 'this_cpu_add'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:11: note: expanded from macro '__pcpu_size_call'
     368 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:410:34: note: expanded from macro 'this_cpu_add_8'
     410 | #define this_cpu_add_8(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:156:2: note: expanded from macro 'this_cpu_generic_to_op'
     156 |         raw_cpu_generic_to_op(pcp, val, op);                            \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:2: note: expanded from macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2237:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   9 warnings and 5 errors generated.
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +274 include/linux/huge_mm.h

   272	
   273	struct mthp_stat {
 > 274		unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
   275	};
   276	
   277	DECLARE_PER_CPU(struct mthp_stat, mthp_stats);
   278	
   279	static inline void count_mthp_stat(int order, enum mthp_stat_item item)
   280	{
   281		if (unlikely(order > PMD_ORDER))
   282			return;
 > 283		this_cpu_inc(mthp_stats.stats[order][item]);
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
