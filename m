Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49981C14;
	Sat, 20 Jul 2024 01:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721438096; cv=none; b=fiY4CBGTtjr2XOXST6+TNsJuilz3VO7qH4X0Ma5kSLCINsui6HS8zFqWKkZXXq9TrZLMSNaD2cVgWFtzPtZZDB12dk9pYVMnt9t4MBsjqA9YoIKfd9fbfUby+mfVBU06eYuVG8CnVsLn4BcAQaKP4evggFUKrEtF+Bkye+Q5CuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721438096; c=relaxed/simple;
	bh=hwXF/5k8OeRNyc0rZWwKr9PGGqPQR/ZeyO8RhBInTas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PzcW+ElITjyGXwDfxzhsLKgPh7sTkU9MzeaFKFV4Ch24OS52iINiE/vlGNokkqN+BBC5MZXj1XgIxaEefGVwKZtwHO9KUUNR6aUVG5XheClIzvsNamPvj0WHnb2kHhvKrznfnjBB4Ogjq3IbtN6XNMp0Tv1krBMCswhB1i+uMCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gj3Hsfl1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gj3Hsfl1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721438095; x=1752974095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hwXF/5k8OeRNyc0rZWwKr9PGGqPQR/ZeyO8RhBInTas=;
  b=Gj3Hsfl1aJv9gfnlOedLjGaX5fDb/hiweLSLVGe5M/rhE/Bh5grKyL3t
   bS9gbaQicGKx+H1L6MQhXhT+0YpJgLLPaC6TmjiJWQBtq1pvxqBFv38XC
   +OrUvuKN0r3ilEX/1V3lzVmVfV4LDyt41muehAEpJzg8qy94InS1KKUAs
   LpV2YLQkohwQWUPtS03sB0qsXQ19a05r43xC+AKaHACx1WiaXH/6fhtnY
   vT8kGBCfmCgWe8cbVvM8urK7ZZ7bf1BRhZ0lIVQmQQDMsg4b+CzfbXQIg
   ajqeBPyLKvPvgycwWg9JbG70L4Jys2BRWmgxpnRG9owtEeG6Ialow9Nj7
   A==;
X-CSE-ConnectionGUID: hECcsCUES4uH1KkvKXWxFA==
X-CSE-MsgGUID: SSsMbf/FTrG3p4Ha7ErgSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29695489"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="29695489"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 18:14:54 -0700
X-CSE-ConnectionGUID: GLkBSJVOR9GtTB+9ldW30g==
X-CSE-MsgGUID: Y1I9Wp6qTfmGv1Pdybg6Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="51555263"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jul 2024 18:14:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUygU-000ijA-1M;
	Sat, 20 Jul 2024 01:14:50 +0000
Date: Sat, 20 Jul 2024 09:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable3 31/35] mm/memory.c:448:17: error: incompatible
 pointer types initializing 'struct ptdesc *' with an expression of type
 'pte_t *'
Message-ID: <202407200919.wQ4E9oZg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable3
head:   3fb6eb9b0272c82ed231fdf2a20f6b6d265c4259
commit: 91edffa2a9b88000a9aa062ec72e804f3d35cd8a [31/35] pgtable: fully use ptdesc in pte_alloc_one series functions
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407200919.wQ4E9oZg-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200919.wQ4E9oZg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200919.wQ4E9oZg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:44:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:45:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> mm/memory.c:448:17: error: incompatible pointer types initializing 'struct ptdesc *' with an expression of type 'pte_t *' [-Werror,-Wincompatible-pointer-types]
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                        ^        ~~~~~~~~~~~~~~~~~
   mm/memory.c:4650:35: error: controlling expression type 'pte_t *' not compatible with any generic association type
    4650 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                     ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgalloc.h:140:28: note: expanded from macro 'pte_alloc_one'
     140 | #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
         |                            ^
   include/linux/mm_types.h:502:38: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                    ^~
   mm/memory.c:5013:35: error: controlling expression type 'pte_t *' not compatible with any generic association type
    5013 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                     ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgalloc.h:140:28: note: expanded from macro 'pte_alloc_one'
     140 | #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
         |                            ^
   include/linux/mm_types.h:502:38: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                    ^~
   15 warnings and 3 errors generated.


vim +448 mm/memory.c

   445	
   446	int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
   447	{
 > 448		struct ptdesc *ptdesc = pte_alloc_one(mm);
   449		if (!ptdesc)
   450			return -ENOMEM;
   451	
   452		pmd_install(mm, pmd, (pgtable_t *)ptdesc);
   453		if (ptdesc)
   454			pte_free(mm, ptdesc_page(ptdesc));
   455		return 0;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
