Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD717BA9;
	Mon, 22 Jul 2024 06:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721629461; cv=none; b=tPsyyDGQLLwe7fpm4U/Db/p51vw62nXM7BzOBQVzVVLYCalNYK433XMmlPKqP776/2sfuZC9bQ4saf3Rp0JzOkY7RNHy/Bdbl5OBNdkF1t5n5bYBPWT+9a4F+It16/WEu8combqInCbJrqRuX+D4chJzdNzQOnFYrVDrENYjjaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721629461; c=relaxed/simple;
	bh=ES+ggAikj14YBw2PnUheXZIDC+tt5/+lwaM7fu+umAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qGKBKniaXXZ+Co+57O/Jdy1EYSO0K7/bEoVWgQio1OQ1GbQWsja3ouDh9zJFOc6xgy406L3dfDxbZ0xB1Dp9/tmEyc0ThqGhQF/cR9OpJLQZhI6ABtVx0l8VwjoAOmzjUvqAOuFvW8BoScR/tvq46qtK0Em9vQDAoqAGX4UAp8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vcnom38O; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vcnom38O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721629459; x=1753165459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ES+ggAikj14YBw2PnUheXZIDC+tt5/+lwaM7fu+umAM=;
  b=Vcnom38O/TRLC4shad8GMmnCZsHv66dFra7x+gCFAvyQx5q5BNeBaYyr
   Tmhml9BZ6nGSBJ/qwMtYz58aqVROvOHj7bOmZMHvSN1vOAkuzr0y8SQNi
   cFv9prOhgPP/JyOxrrmCuSGIQblZbLbK+fAYet92Pe0bFURCh9dpElQ5u
   tCRJxC/psb6O8XXe0nB2QLtXZsH4524vBrgN1TSEromjkD/4VMdBwuZxY
   S0lJKekxc1o1XrsrxQCBI8GyiZ/cr1+C5N631sqv2JbiY3nWmFAhXZGxH
   K8imFY+Upuk03tYGCNm0A9oHwyZhxsJYGB/zmq3RBBl0kKYSDlvMpxICl
   A==;
X-CSE-ConnectionGUID: c0b7YJsJRPWrRlQBgTiUDA==
X-CSE-MsgGUID: qCMb6NkcTi6ufWQrghU4MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19026212"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="19026212"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 23:24:17 -0700
X-CSE-ConnectionGUID: W4Z6xxr+ReaFklNOAfmpyA==
X-CSE-MsgGUID: R1VXKjBgRNGi4Z6ATK7E9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="56618556"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jul 2024 23:24:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVmSz-000kve-2h;
	Mon, 22 Jul 2024 06:24:13 +0000
Date: Mon, 22 Jul 2024 14:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 42/42] include/linux/mm.h:3025:21: error: call
 to undeclared function 'pmd_page'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202407221405.tQX5kQ8V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   0dc6582fabc5dcd9239957e6e6501344fd99714a
commit: 0dc6582fabc5dcd9239957e6e6501344fd99714a [42/42] mm/pgtable: prepare for pte_free_defer and its caller callee
config: arm-randconfig-002-20240722 (https://download.01.org/0day-ci/archive/20240722/202407221405.tQX5kQ8V-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221405.tQX5kQ8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407221405.tQX5kQ8V-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/arm/kernel/asm-offsets.c:12:
   include/linux/mm.h:3019:25: error: use of undeclared identifier 'PTRS_PER_PMD'
    3019 |         unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
         |                                ^
>> include/linux/mm.h:3025:21: error: call to undeclared function 'pmd_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3025 |         return page_ptdesc(pmd_page(*pmd));
         |                            ^
   include/linux/mm.h:3025:21: note: did you mean 'put_page'?
   include/linux/mm.h:1541:20: note: 'put_page' declared here
    1541 | static inline void put_page(struct page *page)
         |                    ^
>> include/linux/mm.h:3025:21: error: controlling expression type 'int' not compatible with any generic association type
    3025 |         return page_ptdesc(pmd_page(*pmd));
         |                            ^~~~~~~~~~~~~~
   include/linux/mm_types.h:510:37: note: expanded from macro 'page_ptdesc'
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                    ^
   1 warning and 3 errors generated.
   make[3]: *** [scripts/Makefile.build:117: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=979059129
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2 shuffle=979059129
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=979059129
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=979059129
   make: Target 'prepare' not remade because of errors.


vim +/pmd_page +3025 include/linux/mm.h

  3022	
  3023	static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
  3024	{
> 3025		return page_ptdesc(pmd_page(*pmd));
  3026	}
  3027	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
