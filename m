Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254CA2264D3;
	Sat, 11 Apr 2026 10:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775901743; cv=none; b=HjGxyB3F2deOsMDOFdQtzv8P3FjsoFdQ04n4uNxmZ5dDSXGJAkydtI0kBRzi8rBzNtw4WkKYaidtS4eBLg1E9M4DJjB0+RVK6G54tY5Qmfs3W3NWiVqJ0hIundjES0+STv8C33bq3Oz/zzaIUibhgdPLgt4fdLwx4mSYke8NSgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775901743; c=relaxed/simple;
	bh=YxrU0TywUgr37g7pBvv4CzK6fdKSERCo1/2BPUrbNk0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Guoz8y7MBQVbcRjxfqUTSUwewjRJvfSqHoFzRxFcyxDX9FOz/JXCee0+0m288NhbruboxYk5Q+mYk15d/inl26ZsH3cDqj3mOgSqAFKLMiHcQocM8oHmS05jil8KcXCGvlUEDIx4gAwyRxiZ516vZBafu7oL8NkNOidl9uDmR1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0m1jv+1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0m1jv+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775901741; x=1807437741;
  h=date:from:to:cc:subject:message-id;
  bh=YxrU0TywUgr37g7pBvv4CzK6fdKSERCo1/2BPUrbNk0=;
  b=e0m1jv+1CDQLCMohh85LapVriYUsEguvYimox1RJasE8jlz52cgxM+z2
   PZxu9VQfhlMmNTLhfxcMHDx4rYpubv40LVlSv4l3zCRvLCP6o7qUBPqrr
   73UNyxC6vWNDA42Q13cpLZkjaZDtyvE+8V1zuwx4DS0GD3qPYT8Caotze
   Nzxz2Eb0cB1rDuT6n8EURYsTLlqOTYRoZnqNEJ2D+LSrmk56bCh4aR0P6
   ca3E2D8oml0nTtRpONBxLlopZat/bw835L2ljEqSrrNFvsTYp7iTSsFnN
   WZajr8mnp1jUlEWa1MgSMAUcNUIAlZgcMyJLPliZOXyLVvRSqndRFI/PX
   g==;
X-CSE-ConnectionGUID: qD9uCGZvSbKB+ub3WG7fIQ==
X-CSE-MsgGUID: y/56mDfkS8u0VNYt4e4cyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99549246"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="99549246"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 03:02:20 -0700
X-CSE-ConnectionGUID: OZJUdruyRRKC9kUECIJfbA==
X-CSE-MsgGUID: Ikyr8iMvTEuC7OwrMxE4jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="267294492"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Apr 2026 03:02:19 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBVAP-0000000013p-0KRr;
	Sat, 11 Apr 2026 10:02:17 +0000
Date: Sat, 11 Apr 2026 18:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:b4/mapcount 13/13]
 include/linux/pgtable.h:2254:10: error: use of undeclared identifier
 'PMD_SHIFT'
Message-ID: <202604111713.HqB9L9PV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux b4/mapcount
head:   3a4632859e00ee6195ae655d0937c8afdf20096c
commit: 3a4632859e00ee6195ae655d0937c8afdf20096c [13/13] mm: support arbitrary folio mappings
config: arm-randconfig-002-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111713.HqB9L9PV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111713.HqB9L9PV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111713.HqB9L9PV-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/dtc/dtc-lexer.lex.c:641:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
     641 | static int dts_version = 1;
         |            ^
   1 warning generated.
   scripts/mod/modpost.c:59:13: warning: variable 'extra_warn' set but not used [-Wunused-but-set-global]
      59 | static bool extra_warn;
         |             ^
   1 warning generated.
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:31:
>> include/linux/pgtable.h:2254:10: error: use of undeclared identifier 'PMD_SHIFT'
    2254 |                 return PMD_ORDER;
         |                        ^~~~~~~~~
   include/linux/pgtable.h:8:20: note: expanded from macro 'PMD_ORDER'
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:8: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \


vim +/PMD_SHIFT +2254 include/linux/pgtable.h

  2247	
  2248	static inline unsigned int pgtable_level_to_order(enum pgtable_level level)
  2249	{
  2250		switch (level) {
  2251		case PGTABLE_LEVEL_PTE:
  2252			return 0;
  2253		case PGTABLE_LEVEL_PMD:
> 2254			return PMD_ORDER;
  2255		case PGTABLE_LEVEL_PUD:
  2256			return PUD_ORDER;
  2257		case PGTABLE_LEVEL_P4D:
  2258			return P4D_ORDER;
  2259		case PGTABLE_LEVEL_PGD:
  2260			return PGDIR_ORDER;
  2261		default:
  2262			VM_WARN_ON_ONCE(1);
  2263			return 0;
  2264		}
  2265	}
  2266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
