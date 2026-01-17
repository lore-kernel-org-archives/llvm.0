Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FE730C378;
	Sat, 17 Jan 2026 05:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768626524; cv=none; b=PWGsyv9nuJ+VbdjBkDMehQBkIVlBUKqsKRTBQsUt/GUhWwVvowS8iNW7Rkf+VVQ0jpMCnFD5p/5L7q3UhBKoZJZ0ql/CnOp+SOkquW99BlTcDIpMAIuWe6VygG5Kew5CScO4Ds24OoCLnkdQn/CXqkw83LnSvX2nB6/UJcAgkaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768626524; c=relaxed/simple;
	bh=6M0rTQg+J28b574wweKDC19aUm2m2dG1zZ4ygZ7ONKM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cEOgx5f+XfJIkr3Eaee/5aa9JM6iKzdvKltflE83TzIHFde0hQaW6rdy6DaGewyx9/x4R2k3FhIkzQKm6PkfTVJFN/hH4CPEulSizqEaWuy3d5X+hbTq/Whrb/kfFiMTLtxOqpKhDyJlNShRmjBDUN3Yr4j4S6/ESNLmtB/aDiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7iWw+eU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7iWw+eU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768626523; x=1800162523;
  h=date:from:to:cc:subject:message-id;
  bh=6M0rTQg+J28b574wweKDC19aUm2m2dG1zZ4ygZ7ONKM=;
  b=G7iWw+eU9RxVqODKsPGINSDOGlff2B7v9uN87uImRA8AP6iDLugfukhK
   1awuEMTxZYevyE1gE4uXHz58Ny4WaXKFAaFPC/VSDIgvfknNSPUhjxyZG
   0WECuhWg813rFU0nUiC0so0zO+BGFikd+/4mZCDWvHfk2Z/MF8EA0Fnch
   4ANnsOx8FOk2EPngsaoYpJMYFf9uzCWyxUkT8+xXIEVBbZWh0/t1h+eMJ
   FKWApLEl6MD6RU0ksFPFfPvkTVM6Krwu1g3r4nqUGfqY1ntHJA+Op8Z3W
   r5zybMT6z0kUpP8Th9K81gNJTjOdv719synhQfGzT2HAy+1/JkwUFwj1K
   g==;
X-CSE-ConnectionGUID: HBy+KeqUQjyvt5N6RdhqZQ==
X-CSE-MsgGUID: VjK7aV9RSXCajDSEO3jhsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="68946161"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="68946161"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 21:08:42 -0800
X-CSE-ConnectionGUID: 3R+HxOvUTcCxOWG1iw4/7g==
X-CSE-MsgGUID: WHoJQj9ARsGjORNazman5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205825122"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2026 21:08:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgyYA-00000000LaK-1POq;
	Sat, 17 Jan 2026 05:08:38 +0000
Date: Sat, 17 Jan 2026 13:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:compound_head 2/15] include/linux/sched/mm.h:316:20:
 error: static declaration of 'might_alloc' follows non-static declaration
Message-ID: <202601171340.k5KLMGYs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git compound_head
head:   b85ab3c6f9b0b85159a92143639da1947695d8da
commit: 44d8c0bdca357faa441b6a75b316a399a31b2bd1 [2/15] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260117/202601171340.k5KLMGYs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171340.k5KLMGYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171340.k5KLMGYs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:14:
   In file included from include/linux/sched/mm.h:9:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:24:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:19:
   In file included from include/linux/radix-tree.h:21:
>> include/linux/xarray.h:594:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     594 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:621:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     621 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:697:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     697 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:725:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     725 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:753:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     753 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:783:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     783 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:813:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     813 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:843:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     843 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:876:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     876 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:909:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     909 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:942:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     942 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:981:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     981 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:1020:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1020 |         might_alloc(gfp);
         |         ^
   include/linux/xarray.h:1059:2: error: call to undeclared function 'might_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1059 |         might_alloc(gfp);
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:14:
>> include/linux/sched/mm.h:316:20: error: static declaration of 'might_alloc' follows non-static declaration
     316 | static inline void might_alloc(gfp_t gfp_mask)
         |                    ^
   include/linux/xarray.h:594:2: note: previous implicit declaration is here
     594 |         might_alloc(gfp);
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:16:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:119:11: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     119 |                 return  (set1->sig[1] == set2->sig[1]) &&


vim +/might_alloc +316 include/linux/sched/mm.h

4034247a0d6ab2 NeilBrown     2022-01-14  307  
95d6c701f4ca7c Simona Vetter 2020-12-14  308  /**
95d6c701f4ca7c Simona Vetter 2020-12-14  309   * might_alloc - Mark possible allocation sites
95d6c701f4ca7c Simona Vetter 2020-12-14  310   * @gfp_mask: gfp_t flags that would be used to allocate
95d6c701f4ca7c Simona Vetter 2020-12-14  311   *
95d6c701f4ca7c Simona Vetter 2020-12-14  312   * Similar to might_sleep() and other annotations, this can be used in functions
95d6c701f4ca7c Simona Vetter 2020-12-14  313   * that might allocate, but often don't. Compiles to nothing without
95d6c701f4ca7c Simona Vetter 2020-12-14  314   * CONFIG_LOCKDEP. Includes a conditional might_sleep() if @gfp allows blocking.
95d6c701f4ca7c Simona Vetter 2020-12-14  315   */
95d6c701f4ca7c Simona Vetter 2020-12-14 @316  static inline void might_alloc(gfp_t gfp_mask)
95d6c701f4ca7c Simona Vetter 2020-12-14  317  {
95d6c701f4ca7c Simona Vetter 2020-12-14  318  	fs_reclaim_acquire(gfp_mask);
95d6c701f4ca7c Simona Vetter 2020-12-14  319  	fs_reclaim_release(gfp_mask);
95d6c701f4ca7c Simona Vetter 2020-12-14  320  
95d6c701f4ca7c Simona Vetter 2020-12-14  321  	might_sleep_if(gfpflags_allow_blocking(gfp_mask));
95d6c701f4ca7c Simona Vetter 2020-12-14  322  }
95d6c701f4ca7c Simona Vetter 2020-12-14  323  

:::::: The code at line 316 was first introduced by commit
:::::: 95d6c701f4ca7c44dc148d664f604541266a2333 mm: extract might_alloc() debug check

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
