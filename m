Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364D51FBA;
	Sun, 21 Jul 2024 03:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721531526; cv=none; b=qlCEV1zkeeuDXof3UwzjRZ1SEUNDcCdSytSO3JaE0y2kDBOzGRnmUN1fI+TsPFLjHmSBXYHmmtK4bmxmEP7wQPB6B/1IvBephzMD7VyjdkyLyLRf/IDTB5PYsP/vIZ0IIsRiL+auxxoyiTUnoSxnGJ9Pv7drMg0WO374SQMPJiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721531526; c=relaxed/simple;
	bh=DrcG4EfjiprZ0Ro8B+MClcxnkv3XxACOBd5+lbUXQ+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbeODDQEIYQmS+8EYFZBOXeKb+GyealQLG8ssqJfO4CM9aqEUiIXSJZfx9L1VYnLSaKyBn0DFqhC0fZbQxBu76cdLhszvQyJtTJalbf+MqsWRmnsDjuWRiE61Tdi3MbJebswZ+ycrIOfsnfKZjWfHl4x9FC4YziQ8oTcS/UY3/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DemX8wmy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DemX8wmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721531524; x=1753067524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DrcG4EfjiprZ0Ro8B+MClcxnkv3XxACOBd5+lbUXQ+g=;
  b=DemX8wmyICfWVy7HNJaK0MH7XSq3ofvpTDfgLNSSOFIPVrHfcX+tWJze
   +jnOvDO9iRBfqPRz6OtQSKzUxN7FDH7kZnE7vtbhyg8bHyYDhf2kjLBCt
   0enoZsduei7oseWW6THlQiLMkf1Jb6ObQi8dj3Ocrud8QwhmycqPuFUpE
   UyZpyWsAqpKLRH/XvR3RnZy2B4Hb1oisougMcRYt7HjTEENY2zcRVLn3w
   A88CrnHK8J16m6H+DDMvrxRSb3pIzI4VHe+6hme0Pz3QTNqrRwFjexogB
   +v9Hc4iKsISFGaO1OOgtTfw5Tq5fmjf2E9ELJ8nJ8jMQge+2S2SqRvD36
   Q==;
X-CSE-ConnectionGUID: XOsOqDBKRta3JXngdHIoJQ==
X-CSE-MsgGUID: xfwiDw2sTQ2XTwsH7TRClA==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="22987056"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="22987056"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 20:12:03 -0700
X-CSE-ConnectionGUID: MDUcQSnJR5yw8CEWu2HQ/w==
X-CSE-MsgGUID: BylfqjUHTpew8AywuHzLJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51402851"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jul 2024 20:12:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVMzQ-000jsu-1R;
	Sun, 21 Jul 2024 03:12:00 +0000
Date: Sun, 21 Jul 2024 11:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 36/43] include/linux/mm.h:3005:25: error: use of
 undeclared identifier 'PTRS_PER_PMD'
Message-ID: <202407211101.xBeq33Ev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   6c298a18633e397b8be4d6f48fc8cd1f860dd896
commit: e85f4771561b1e804a7ae4d386e81bc9545bd47d [36/43] mm/pgtable: define pmd_ptdesc() helper out of USE_SPLIT_PMD_PTLOCKS
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240721/202407211101.xBeq33Ev-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211101.xBeq33Ev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211101.xBeq33Ev-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/arm/kernel/asm-offsets.c:12:
>> include/linux/mm.h:3005:25: error: use of undeclared identifier 'PTRS_PER_PMD'
    3005 |         unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
         |                                ^
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:117: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/PTRS_PER_PMD +3005 include/linux/mm.h

3ed3a4f0ddffec Kirill A. Shutemov      2016-03-17  2991  
3ed3a4f0ddffec Kirill A. Shutemov      2016-03-17  2992  #define pte_alloc_map(mm, pmd, address)			\
4cf58924951ef8 Joel Fernandes (Google  2019-01-03  2993) 	(pte_alloc(mm, pmd) ? NULL : pte_offset_map(pmd, address))
1bb3630e89cb8a Hugh Dickins            2005-10-29  2994  
c74df32c724a16 Hugh Dickins            2005-10-29  2995  #define pte_alloc_map_lock(mm, pmd, address, ptlp)	\
4cf58924951ef8 Joel Fernandes (Google  2019-01-03  2996) 	(pte_alloc(mm, pmd) ?			\
c74df32c724a16 Hugh Dickins            2005-10-29  2997  		 NULL : pte_offset_map_lock(mm, pmd, address, ptlp))
c74df32c724a16 Hugh Dickins            2005-10-29  2998  
1bb3630e89cb8a Hugh Dickins            2005-10-29  2999  #define pte_alloc_kernel(pmd, address)			\
4cf58924951ef8 Joel Fernandes (Google  2019-01-03  3000) 	((unlikely(pmd_none(*(pmd))) && __pte_alloc_kernel(pmd))? \
1bb3630e89cb8a Hugh Dickins            2005-10-29  3001  		NULL: pte_offset_kernel(pmd, address))
^1da177e4c3f41 Linus Torvalds          2005-04-16  3002  
7e25de77bc5ea5 Anshuman Khandual       2022-11-25  3003  static inline struct page *pmd_pgtable_page(pmd_t *pmd)
634391ace193d0 Martin Schwidefsky      2014-02-13  3004  {
634391ace193d0 Martin Schwidefsky      2014-02-13 @3005  	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
634391ace193d0 Martin Schwidefsky      2014-02-13  3006  	return virt_to_page((void *)((unsigned long) pmd & mask));
634391ace193d0 Martin Schwidefsky      2014-02-13  3007  }
634391ace193d0 Martin Schwidefsky      2014-02-13  3008  

:::::: The code at line 3005 was first introduced by commit
:::::: 634391ace193d00c59a691e9fc227b0f8942bad7 mm: mask bits from pmd in pmd_lockptr/pmd_huge_pte

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
