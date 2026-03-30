Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E4E1C84A0;
	Mon, 30 Mar 2026 03:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774840526; cv=none; b=oyl36EismM7w0Deg+lGW+I1shs4aNfLGuicfnJWGALVAsuQT1OVqB8xjWVG4poX1qOft0N/2dGaeSlH2GLyv0SOCECBlyqXkjaI0JiuCyoFAjArKM8CJFWdfTsX4A0lcfJrxn0M4O4shf8IWA9cXAcnbu7cneCfiYViXA0fxt6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774840526; c=relaxed/simple;
	bh=9XXDiBBOdstSsctXLA/grLYAkXok6ua2OirS2KFL35o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aZD96w7C+Ej6tBqnzwRba7CSSd9pdHZ9dACgp+yPUIrJZxZc8szcOq2N67VGzb9DQ9Ulajn9QgEP49CcIEl3lY0DqsOV2zDsGIHnysxdmmMn6bYxtS9gITwiZZfCM6sMi7VWNCGwh/JwTRK6YUPUVGSXPjVeh/uBhY+GqaGhiRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIR/7YSL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIR/7YSL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774840523; x=1806376523;
  h=date:from:to:cc:subject:message-id;
  bh=9XXDiBBOdstSsctXLA/grLYAkXok6ua2OirS2KFL35o=;
  b=MIR/7YSLzzFsaPmFuCd5+KaEAyI/bBypsYM8Uz/MJZwTHCOpw+8hecfZ
   DRDHRsWRa7JCwYj3Z4aaF25JTI71moIFba/1xhnS9nmm1uvioCgUxa5RA
   tRG367CGiBSZ1/TyZ1cBinjtsxKqzOr689yfSUnW5Pvr8exT1ex/4ZDNS
   vIcUQE7osWDCbOq2qGnH+kM6YVbz2CEXgxnSFAe9A/1/vzczwGGXUGGks
   wc4R+DqGEq03Yjpg5t07aZY+9dhgRUCt5LoqkhM3NX2JS0hbpl5FlQ8Fm
   EeIkE1eB2w0TczmblHdXX6hXbUXhFJINf7c3enCniav8D0fY1RKXG8e6g
   g==;
X-CSE-ConnectionGUID: y3XHzn2IRli0SxpZl3Xbxg==
X-CSE-MsgGUID: +bCOR2q4RS2BqYkVRcClug==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75939816"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75939816"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 20:15:22 -0700
X-CSE-ConnectionGUID: iHbqDrBKTf+/753tAOshSA==
X-CSE-MsgGUID: dhLUaD43TyWhVWjfRtR4XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="225818161"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Mar 2026 20:15:20 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w735x-000000000bB-1IhG;
	Mon, 30 Mar 2026 03:15:17 +0000
Date: Mon, 30 Mar 2026 11:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/huge_memory.c:84:13: warning: variable
 'anon_orders_configured' set but not used
Message-ID: <202603301149.yXng4wfz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 4496e1c1354bd4837bcc1414f6e1a4d042857903 crash_dump, nvme: select CONFIGFS_FS as built-in
date:   10 months ago
config: loongarch-randconfig-002-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301149.yXng4wfz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301149.yXng4wfz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301149.yXng4wfz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/huge_memory.c:44:
   arch/loongarch/include/asm/tlb.h:142:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     142 |         struct vm_area_struct vma;
         |                               ^
   include/linux/mm_types.h:803:20: note: member 'vm_flags' declared 'const' here
     803 |                 const vm_flags_t vm_flags;
         |                                  ^
>> mm/huge_memory.c:84:13: warning: variable 'anon_orders_configured' set but not used [-Wunused-but-set-global]
      84 | static bool anon_orders_configured __initdata;
         |             ^
   2 warnings generated.
--
>> mm/ksm.c:255:22: warning: variable 'ksm_pages_scanned' set but not used [-Wunused-but-set-global]
     255 | static unsigned long ksm_pages_scanned;
         |                      ^
>> mm/ksm.c:258:22: warning: variable 'ksm_pages_shared' set but not used [-Wunused-but-set-global]
     258 | static unsigned long ksm_pages_shared;
         |                      ^
>> mm/ksm.c:261:22: warning: variable 'ksm_pages_sharing' set but not used [-Wunused-but-set-global]
     261 | static unsigned long ksm_pages_sharing;
         |                      ^
>> mm/ksm.c:264:22: warning: variable 'ksm_pages_unshared' set but not used [-Wunused-but-set-global]
     264 | static unsigned long ksm_pages_unshared;
         |                      ^
>> mm/ksm.c:270:22: warning: variable 'ksm_stable_node_chains' set but not used [-Wunused-but-set-global]
     270 | static unsigned long ksm_stable_node_chains;
         |                      ^
>> mm/ksm.c:273:22: warning: variable 'ksm_stable_node_dups' set but not used [-Wunused-but-set-global]
     273 | static unsigned long ksm_stable_node_dups;
         |                      ^
>> mm/ksm.c:301:22: warning: variable 'ksm_pages_skipped' set but not used [-Wunused-but-set-global]
     301 | static unsigned long ksm_pages_skipped;
         |                      ^
   7 warnings generated.
--
   In file included from mm/khugepaged.c:25:
   arch/loongarch/include/asm/tlb.h:142:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     142 |         struct vm_area_struct vma;
         |                               ^
   include/linux/mm_types.h:803:20: note: member 'vm_flags' declared 'const' here
     803 |                 const vm_flags_t vm_flags;
         |                                  ^
>> mm/khugepaged.c:73:21: warning: variable 'khugepaged_pages_collapsed' set but not used [-Wunused-but-set-global]
      73 | static unsigned int khugepaged_pages_collapsed;
         |                     ^
>> mm/khugepaged.c:74:21: warning: variable 'khugepaged_full_scans' set but not used [-Wunused-but-set-global]
      74 | static unsigned int khugepaged_full_scans;
         |                     ^
   3 warnings generated.
--
>> drivers/of/fdt.c:463:12: warning: variable 'of_fdt_crc32' set but not used [-Wunused-but-set-global]
     463 | static u32 of_fdt_crc32;
         |            ^
   1 warning generated.


vim +/anon_orders_configured +84 mm/huge_memory.c

97ae17497e996f Kirill A. Shutemov      2012-12-12  43  
71e3aac0724ffe Andrea Arcangeli        2011-01-13 @44  #include <asm/tlb.h>
71e3aac0724ffe Andrea Arcangeli        2011-01-13  45  #include <asm/pgalloc.h>
71e3aac0724ffe Andrea Arcangeli        2011-01-13  46  #include "internal.h"
014bb1de4fc17d NeilBrown               2022-05-09  47  #include "swap.h"
71e3aac0724ffe Andrea Arcangeli        2011-01-13  48  
283fd6fe0528ae Anshuman Khandual       2022-03-24  49  #define CREATE_TRACE_POINTS
283fd6fe0528ae Anshuman Khandual       2022-03-24  50  #include <trace/events/thp.h>
283fd6fe0528ae Anshuman Khandual       2022-03-24  51  
ba76149f47d8c9 Andrea Arcangeli        2011-01-13  52  /*
b14d595aa29923 Michael DeGuzis         2017-05-17  53   * By default, transparent hugepage support is disabled in order to avoid
b14d595aa29923 Michael DeGuzis         2017-05-17  54   * risking an increased memory footprint for applications that are not
b14d595aa29923 Michael DeGuzis         2017-05-17  55   * guaranteed to benefit from it. When transparent hugepage support is
b14d595aa29923 Michael DeGuzis         2017-05-17  56   * enabled, it is for all mappings, and khugepaged scans all mappings.
8bfa3f9a012c40 Jianguo Wu              2013-11-12  57   * Defrag is invoked by khugepaged hugepage allocations and by page faults
8bfa3f9a012c40 Jianguo Wu              2013-11-12  58   * for all hugepage allocations.
ba76149f47d8c9 Andrea Arcangeli        2011-01-13  59   */
71e3aac0724ffe Andrea Arcangeli        2011-01-13  60  unsigned long transparent_hugepage_flags __read_mostly =
13ece886d99cd6 Andrea Arcangeli        2011-01-13  61  #ifdef CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS
ba76149f47d8c9 Andrea Arcangeli        2011-01-13  62  	(1<<TRANSPARENT_HUGEPAGE_FLAG)|
13ece886d99cd6 Andrea Arcangeli        2011-01-13  63  #endif
13ece886d99cd6 Andrea Arcangeli        2011-01-13  64  #ifdef CONFIG_TRANSPARENT_HUGEPAGE_MADVISE
13ece886d99cd6 Andrea Arcangeli        2011-01-13  65  	(1<<TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG)|
13ece886d99cd6 Andrea Arcangeli        2011-01-13  66  #endif
444eb2a449ef36 Mel Gorman              2016-03-17  67  	(1<<TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG)|
79da5407eeadc7 Kirill A. Shutemov      2012-12-12  68  	(1<<TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG)|
79da5407eeadc7 Kirill A. Shutemov      2012-12-12  69  	(1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
ba76149f47d8c9 Andrea Arcangeli        2011-01-13  70  
54d917295b8366 Qi Zheng                2023-09-11  71  static struct shrinker *deferred_split_shrinker;
54d917295b8366 Qi Zheng                2023-09-11  72  static unsigned long deferred_split_count(struct shrinker *shrink,
54d917295b8366 Qi Zheng                2023-09-11  73  					  struct shrink_control *sc);
54d917295b8366 Qi Zheng                2023-09-11  74  static unsigned long deferred_split_scan(struct shrinker *shrink,
54d917295b8366 Qi Zheng                2023-09-11  75  					 struct shrink_control *sc);
81d3ff3c6f7630 Usama Arif              2024-08-30  76  static bool split_underused_thp = true;
f000565adb770b Andrea Arcangeli        2011-01-13  77  
97ae17497e996f Kirill A. Shutemov      2012-12-12  78  static atomic_t huge_zero_refcount;
5691753d73a233 Matthew Wilcox (Oracle  2024-03-26  79) struct folio *huge_zero_folio __read_mostly;
3b77e8c8cde581 Hugh Dickins            2021-06-15  80  unsigned long huge_zero_pfn __read_mostly = ~0UL;
3485b88390b0af Ryan Roberts            2023-12-07  81  unsigned long huge_anon_orders_always __read_mostly;
3485b88390b0af Ryan Roberts            2023-12-07  82  unsigned long huge_anon_orders_madvise __read_mostly;
3485b88390b0af Ryan Roberts            2023-12-07  83  unsigned long huge_anon_orders_inherit __read_mostly;
dd4d30d1cdbe82 Ryan Roberts            2024-08-14 @84  static bool anon_orders_configured __initdata;
3485b88390b0af Ryan Roberts            2023-12-07  85  

:::::: The code at line 84 was first introduced by commit
:::::: dd4d30d1cdbe826e6569b44453c2d9bb9424d234 mm: override mTHP "enabled" defaults at kernel cmdline

:::::: TO: Ryan Roberts <ryan.roberts@arm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
