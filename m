Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7C216DECB;
	Mon,  9 Sep 2024 17:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725902021; cv=none; b=lK0TeN60QjPcpCMA1dPSQE7J1IsG8M15Rv8j2fnQrzmi2tPjsJScDxIuxlhaLUep2zyepjAXuxfpvZOvWZrJaye0952qMI1uqDm9awXdxElYpCxAkGsgJsOa7u7rGTKKpsQVa4/6qgLPhOs8cbAbWd7/UvqjFOw6Hf+e+y/WhYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725902021; c=relaxed/simple;
	bh=7PjCE165ShOuUBJ4o1ltgoibod5OA+0czjYZQP/tyQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TIPmhhOFq6UA4Y3+3FinC4EZC97W4vpetKig3pfOUcZk9+GXluimmCz3g17dfFKnVJ9UX9lqV0wijWT2FKX6/ULxHX6/PiIxN3PgK0j+o03s9tlDg4x3vIs3Ta8HqpTHjxcCcGt3bHYMFeEWlPLWD/DToQQP+xCWKBzlpvBqBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLwqyMtT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLwqyMtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725902020; x=1757438020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7PjCE165ShOuUBJ4o1ltgoibod5OA+0czjYZQP/tyQw=;
  b=DLwqyMtTjt1bUtCmYiCWpK7k69h6dzKZZj2lUdg2ZEW+4BY30tLqXAfL
   chchsSF3oR0zVKUvgxBTlspPGfvaSHp2nsA9R/axnliXyCDCaqVAELuo2
   qybbg5UWqeLi79yEvQusamS2HaI/WjlsDMquEu7THtvUOPotVM9816t5/
   phxA/Fu/yT+oqv4Q/YxN83uBbZ5/4gRqx/dviFPhJ9lWpeSUOLL0bcOFs
   ulzzGlBxNLuzw3WooSnBY3kgJzm72geK7qhFqVKcNnplqCXV9LnIsouWg
   BEw3GO5HDRt078hoQki+gOXSsraEBQa75PCR1H5BDpTm3+Mj+FutOJlXw
   g==;
X-CSE-ConnectionGUID: Uu85ojzwROqxMHF/T4kKbQ==
X-CSE-MsgGUID: KCIVSQ63R9ShCkDyW81PfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="50023788"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="50023788"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 10:13:39 -0700
X-CSE-ConnectionGUID: InAVpaD7QfWW/LPFHKVynQ==
X-CSE-MsgGUID: MRu8gZsaTzmdrRJhM9HFwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="70842279"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Sep 2024 10:13:38 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snhxI-000F1N-0Q;
	Mon, 09 Sep 2024 17:13:36 +0000
Date: Tue, 10 Sep 2024 01:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 249/258] mm/jitalloc.c:106:2:
 error: call to undeclared function 'text_poke_copy'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202409100156.1NPAP5yj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 0dc0c36d5a2a19098aba0639a99b1574aec0f286 [249/258] bcachefs: switch to jitalloc
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240910/202409100156.1NPAP5yj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100156.1NPAP5yj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100156.1NPAP5yj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/jitalloc.c:4:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2235:
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
   mm/jitalloc.c:46:28: error: call to undeclared function 'module_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      46 |         void *executably_mapped = module_alloc(PAGE_SIZE);
         |                                   ^
   mm/jitalloc.c:46:8: error: incompatible integer to pointer conversion initializing 'void *' with an expression of type 'int' [-Wint-conversion]
      46 |         void *executably_mapped = module_alloc(PAGE_SIZE);
         |               ^                   ~~~~~~~~~~~~~~~~~~~~~~~
>> mm/jitalloc.c:106:2: error: call to undeclared function 'text_poke_copy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     106 |         text_poke_copy(buf, new_buf, len);
         |         ^
   mm/jitalloc.c:106:2: note: did you mean 'text_poke_sync'?
   arch/s390/include/asm/text-patching.h:13:6: note: 'text_poke_sync' declared here
      13 | void text_poke_sync(void);
         |      ^
   mm/jitalloc.c:162:7: error: call to undeclared function 'module_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     162 |                 p = module_alloc(len);
         |                     ^
   mm/jitalloc.c:162:5: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     162 |                 p = module_alloc(len);
         |                   ^ ~~~~~~~~~~~~~~~~~
   5 warnings and 5 errors generated.


vim +/text_poke_copy +106 mm/jitalloc.c

7a091cbeb2d972 Kent Overstreet 2023-05-17  103  
7a091cbeb2d972 Kent Overstreet 2023-05-17  104  void jit_update(void *buf, void *new_buf, size_t len)
7a091cbeb2d972 Kent Overstreet 2023-05-17  105  {
7a091cbeb2d972 Kent Overstreet 2023-05-17 @106  	text_poke_copy(buf, new_buf, len);
7a091cbeb2d972 Kent Overstreet 2023-05-17  107  }
7a091cbeb2d972 Kent Overstreet 2023-05-17  108  EXPORT_SYMBOL_GPL(jit_update);
7a091cbeb2d972 Kent Overstreet 2023-05-17  109  

:::::: The code at line 106 was first introduced by commit
:::::: 7a091cbeb2d972e3dc4d44f00ab2828b7abbbcce mm: jit/text allocator

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
