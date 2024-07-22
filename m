Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964BD23DE;
	Mon, 22 Jul 2024 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721644599; cv=none; b=T6sha2ioDsU0Q4KmTYUED1wnojVFOACWvWH2Ry1BAyXkc2E6yy97ot/pMC1W2Z8xJCceENQC7bNfIQUSPLVuaTYkW+QkLyQbOBp5f5Q9VAxG6l/mTvKiWTFUvORxd+NnmPIjwnwKHOwRVOnR6l9TLPRFxmgdsLZ1wP7Jr0kvUME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721644599; c=relaxed/simple;
	bh=Oh+jtlSVhnDKVBl2HjHqYGGWpEQ9xxK4N1+y0Q/udtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NcHl0qpsJJBLzPioEgfkHh0FPmYCmRKnvkzJOq/tTBgoGlUqlZdB4/cI9ZDVrWiSg4LLiA4cR+wvvMOKeXzgWiE9tq2qnj77ae5qchRNa5sNsxt95oI9b7mOS3szTduG0citqmTmTSloo+SJqWut2mah0JHBv/ut1l0EF3E4OUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIn3CkP0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIn3CkP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721644598; x=1753180598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oh+jtlSVhnDKVBl2HjHqYGGWpEQ9xxK4N1+y0Q/udtM=;
  b=bIn3CkP0VEh3uZHwrRJcTPC6pXgdVTXeNBP+b8rl/x17WGzErLVweI3r
   7p4tHaA+BWL21dduGb/8pEAq+qaWpk28VrauVWFDHeejmsq5/S6/2fPo/
   FXhNMYem2YLJ059gNPfebBQUPeq8kPCbTc5z4lgTeJCntfHrNOW14ZUk9
   P+fdAYTX6tPy0/IBu1oF6OTnQYmxjiz5BA/SHPQpkMZANXcaTIDBsjkhu
   shExBzDpa8Azhsi6AieQgYB2x8a69B0MpVPuZrtZDeb7J92sUKJjYhIgG
   ge9EcgDdJq+pJrfLgqURYWuZj2keJ0QaE8ToKyWahB6BW+7uwZKRWClsH
   Q==;
X-CSE-ConnectionGUID: 4NbTGt6KRYWcoJlBoo1M7g==
X-CSE-MsgGUID: CFJMxi4NSf2zlNl4mfT9sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22106989"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="22106989"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 03:36:37 -0700
X-CSE-ConnectionGUID: We9uKRg2SwCAkKR9UCsB5g==
X-CSE-MsgGUID: BXMEuXRqTCCasGdPaY1tKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="52103115"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jul 2024 03:36:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVqPA-000l5Q-0v;
	Mon, 22 Jul 2024 10:36:32 +0000
Date: Mon, 22 Jul 2024 18:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 42/42] include/linux/mm.h:3025:9: warning: cast
 to 'const struct ptdesc *' from smaller integer type 'int'
Message-ID: <202407221807.2NfUdP7W-lkp@intel.com>
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
config: riscv-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240722/202407221807.2NfUdP7W-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221807.2NfUdP7W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407221807.2NfUdP7W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   include/linux/mm.h:3025:21: error: call to undeclared function 'pmd_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3025 |         return page_ptdesc(pmd_page(*pmd));
         |                            ^
>> include/linux/mm.h:3025:9: warning: cast to 'const struct ptdesc *' from smaller integer type 'int' [-Wint-to-pointer-cast]
    3025 |         return page_ptdesc(pmd_page(*pmd));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:511:24: note: expanded from macro 'page_ptdesc'
     511 |         const struct page *:            (const struct ptdesc *)(p),     \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:10:
>> include/linux/mm.h:3025:9: warning: cast to 'struct ptdesc *' from smaller integer type 'int' [-Wint-to-pointer-cast]
    3025 |         return page_ptdesc(pmd_page(*pmd));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:512:19: note: expanded from macro 'page_ptdesc'
     512 |         struct page *:                  (struct ptdesc *)(p)))
         |                                         ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   include/linux/mm.h:3025:21: error: controlling expression type 'int' not compatible with any generic association type
    3025 |         return page_ptdesc(pmd_page(*pmd));
         |                            ^~~~~~~~~~~~~~
   include/linux/mm_types.h:510:37: note: expanded from macro 'page_ptdesc'
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                    ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:744:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     744 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:752:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     752 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:760:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     760 |         insl(addr, buffer, count);


vim +3025 include/linux/mm.h

  3022	
  3023	static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
  3024	{
> 3025		return page_ptdesc(pmd_page(*pmd));
  3026	}
  3027	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
