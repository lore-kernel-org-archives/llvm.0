Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF4D1E32CF;
	Sun,  7 Dec 2025 21:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765143876; cv=none; b=Nz2rrKhiQKngM9kXwp9tbC788N7EITkagj7g8Gnli+mywGgK+XTaCLZEixFpiAZdUetXNq3NKcUcFDEqCHtYHFK+ycZ435i1Rfrn4O3pKR1Lk65JYZek/Gt+UE+xickYcwNZWQs1MBPvejBYgBVm78tXu/0MxQazId+DVODmqFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765143876; c=relaxed/simple;
	bh=JvyZtEKoSI6CE8USEiD9CU9o6P3cr8k3Y2BPcGj9LzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpoXYrd+o+G25l9o9a8UgqDyhVYgt+pqJG95w5aJTSCOqDKyKFtdu4gjTUJb+zo4tvz2059UhBcF1IeP9VsejgG5p4Na/CDLCWQ2ubw6CGfHH4P6yayQySFtufLI43IHD2+w+Aeyz3KETxcikvZ9B1hm2Ip6UftB/8EztmT9j1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EF9x45i1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EF9x45i1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765143875; x=1796679875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JvyZtEKoSI6CE8USEiD9CU9o6P3cr8k3Y2BPcGj9LzI=;
  b=EF9x45i1wdCvVCKfr79TDMzbKGvpHcA4czCJHGySrK2akPhE9+lF1osx
   JH4Ap4m8njO66YfWnRzBvzE2Ugzk1EWnI295TEbkBv9UhoztEH7X410sA
   B+kTOd9zuDY+NEiaSVnvilGyOheLl2HIwMP8y6kkQnwrNNECzJ25Jq9ar
   pBkA2/Kx2idVwOY1VCa658XtdlL4oHMKy46Cbj4OrNLxb2i5He1ok6gFe
   KtDhP7AYOJwDFnRH2Qp5HzvqpibsWIdlgWs6TOx04ZcsmecxVqxTH5ZZ8
   ptBsL/+fz3OdSQOSYpUrWP4p2SmGIZurUg0NjMP8pMa1gcxWVffdqQ2ve
   w==;
X-CSE-ConnectionGUID: JNY+1Y8zSqWshb5u6ph4XA==
X-CSE-MsgGUID: X5RtnejbSw2DIqRHqtkJoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66987553"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="66987553"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 13:44:32 -0800
X-CSE-ConnectionGUID: SHEEhTe6RM6LwDiAZFu1tw==
X-CSE-MsgGUID: ab4RQSsuSfKPlK69J086tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="195682180"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Dec 2025 13:44:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSMYO-00000000Jf9-43ai;
	Sun, 07 Dec 2025 21:44:28 +0000
Date: Mon, 8 Dec 2025 05:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:alternative-macro 3/8] include/linux/gfp.h:450:6: error:
 expected ')'
Message-ID: <202512080500.2s1wXYcK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git alternative-macro
head:   161065454fa1b06980ecf2610f26819235eb6ffa
commit: a1a0378deeaf70bc733141e6decd369495938079 [3/8] objtool: Rename C ANNOTATE_REACHABLE to ANNOTATE_REACHABLE_LABEL
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20251208/202512080500.2s1wXYcK-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080500.2s1wXYcK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080500.2s1wXYcK-lkp@intel.com/

All errors (new ones prefixed by >>):

     312 |         WARN_ON_ONCE(IS_ENABLED(CONFIG_PROVE_RCU) && in_nmi());
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1538:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:374:2: error: expected ')'
     374 |         WARN_ON_ONCE(in_nmi());
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1538:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:389:2: error: expected ')'
     389 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1538:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:433:2: error: expected ')'
     433 |         WARN_ON_ONCE(IS_ENABLED(CONFIG_PROVE_RCU) && in_nmi());
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1538:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:449:2: error: expected ')'
     449 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1538:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:474:2: error: expected ')'
     474 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1538:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:475:2: error: expected ')'
     475 |         WARN_ON_ONCE(in_nmi());
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
>> include/linux/gfp.h:450:6: error: expected ')'
     450 |         if (WARN_ON(!order || !(gfp & __GFP_COMP)))
         |             ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
   make[3]: *** [scripts/Makefile.build:182: arch/loongarch/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1283: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +450 include/linux/gfp.h

041d3a8cdc18dc3 Michal Nazarewicz 2011-12-29  443  
e98337d11bbdfa3 Yu Zhao           2024-08-13  444  #ifdef CONFIG_CONTIG_ALLOC
e98337d11bbdfa3 Yu Zhao           2024-08-13  445  static inline struct folio *folio_alloc_gigantic_noprof(int order, gfp_t gfp,
e98337d11bbdfa3 Yu Zhao           2024-08-13  446  							int nid, nodemask_t *node)
e98337d11bbdfa3 Yu Zhao           2024-08-13  447  {
e98337d11bbdfa3 Yu Zhao           2024-08-13  448  	struct page *page;
e98337d11bbdfa3 Yu Zhao           2024-08-13  449  
e98337d11bbdfa3 Yu Zhao           2024-08-13 @450  	if (WARN_ON(!order || !(gfp & __GFP_COMP)))
e98337d11bbdfa3 Yu Zhao           2024-08-13  451  		return NULL;
e98337d11bbdfa3 Yu Zhao           2024-08-13  452  
e98337d11bbdfa3 Yu Zhao           2024-08-13  453  	page = alloc_contig_pages_noprof(1 << order, gfp, nid, node);
e98337d11bbdfa3 Yu Zhao           2024-08-13  454  
e98337d11bbdfa3 Yu Zhao           2024-08-13  455  	return page ? page_folio(page) : NULL;
e98337d11bbdfa3 Yu Zhao           2024-08-13  456  }
e98337d11bbdfa3 Yu Zhao           2024-08-13  457  #else
e98337d11bbdfa3 Yu Zhao           2024-08-13  458  static inline struct folio *folio_alloc_gigantic_noprof(int order, gfp_t gfp,
e98337d11bbdfa3 Yu Zhao           2024-08-13  459  							int nid, nodemask_t *node)
e98337d11bbdfa3 Yu Zhao           2024-08-13  460  {
e98337d11bbdfa3 Yu Zhao           2024-08-13  461  	return NULL;
e98337d11bbdfa3 Yu Zhao           2024-08-13  462  }
e98337d11bbdfa3 Yu Zhao           2024-08-13  463  #endif
e98337d11bbdfa3 Yu Zhao           2024-08-13  464  /* This should be paired with folio_put() rather than free_contig_range(). */
e98337d11bbdfa3 Yu Zhao           2024-08-13  465  #define folio_alloc_gigantic(...) alloc_hooks(folio_alloc_gigantic_noprof(__VA_ARGS__))
e98337d11bbdfa3 Yu Zhao           2024-08-13  466  

:::::: The code at line 450 was first introduced by commit
:::::: e98337d11bbdfa3e3f0fb99aa93e40f97549e0cd mm/contig_alloc: support __GFP_COMP

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
