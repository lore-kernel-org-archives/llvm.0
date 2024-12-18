Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BEE198822;
	Wed, 18 Dec 2024 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734529494; cv=none; b=QGsItSOn8L9onpBUH+JauMdwuoz3wjhuuOL52IpA43JZ2AOAWzNPumTFsXjo+qXpABTNXphj40o6a0kM1W4A9qxkKr7KPweVGNt4fKZGrF15JesAfTd9l2SWY+Ytt8+nQjj4j4BzH0Z5yrnWSE+pu9ntvYYb8e+Dw7+cNa/fmXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734529494; c=relaxed/simple;
	bh=2+8e2uGJV7n4ELIODnRgsi5WEYrNxzCgKspiysr8tM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NlfnOHBmIzI6JxQha1KdF4f+ugER1+obSdtD5bjbXjeDYyVh+8qEeriAv0K8MuUG9FxpWTziX4/sDCrTeFHWYJiurRPlMlGdhNc2mcz1k4GvWwnyzXhyFHxk6ZyPnwEAo9Q27Sa34PLrPOuJx/R6XTuANBH2913adXNnCMmki/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OC525DOw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OC525DOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734529492; x=1766065492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2+8e2uGJV7n4ELIODnRgsi5WEYrNxzCgKspiysr8tM0=;
  b=OC525DOwqrKe6cEYLV2tvDngoTpI8TljGZmXpq28WC9SIsclYRQbJRcY
   cyGkDnvXpY/NOLERE1DKPDCWWYojWOcbYQNQCK/tjQsDv1KPClaTEYpVJ
   ZIuPb//W+T9OryJBtznu4SDEyY6i5qwdq1/lW7WGaEr7qn/bZH8LxcBU2
   TMzsTj0fZCI9Lj3CacpRvOpSSmnLEKhEQUpiZqlpoM/d8jd8nkkWw/v2B
   JQXHk7nPDwXB9eCYA5IpcVu6cF6/UBHxnbPkez6nobqWbScAVqwj5cG7U
   jB6xh/LUKlFepwqX5u+k3XzfQIe9UCddBYU/UBLWaGu6F9K4MG9B/aR+D
   Q==;
X-CSE-ConnectionGUID: q4LmhbU+TNCTGC6WBdb4yQ==
X-CSE-MsgGUID: Z2Hg889BSOOQ1tu28U8pIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35154279"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="35154279"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 05:44:52 -0800
X-CSE-ConnectionGUID: h1yCpvHhSFCKD1Fq3U22mw==
X-CSE-MsgGUID: N3YLnnMaQy21FK0EJpowRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128849514"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Dec 2024 05:44:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNuM4-000GMs-0H;
	Wed, 18 Dec 2024 13:44:48 +0000
Date: Wed, 18 Dec 2024 21:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:p4d_pgd_cdtor 10/10]
 arch/s390/include/asm/pgalloc.h:129:9: error: incompatible pointer types
 initializing 'pgd_t *' with an expression of type 'unsigned long *'
Message-ID: <202412182149.jj21x6Bc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git p4d_pgd_cdtor
head:   5453d8f69ac04a3a31ea973f98de9e0c58248a42
commit: 5453d8f69ac04a3a31ea973f98de9e0c58248a42 [10/10] mm: Introduce ctor/dtor at PGD level
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241218/202412182149.jj21x6Bc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412182149.jj21x6Bc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412182149.jj21x6Bc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
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
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
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
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:591:
   In file included from arch/s390/include/asm/hw_irq.h:6:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   arch/s390/include/asm/pgalloc.h:67:36: error: use of undeclared identifier 'table'
      67 |         pagetable_p4d_dtor(virt_to_ptdesc(table));
         |                                           ^
>> arch/s390/include/asm/pgalloc.h:129:9: error: incompatible pointer types initializing 'pgd_t *' with an expression of type 'unsigned long *' [-Werror,-Wincompatible-pointer-types]
     129 |         pgd_t *table = crst_table_alloc(mm);
         |                ^       ~~~~~~~~~~~~~~~~~~~~
   16 warnings and 2 errors generated.
   make[3]: *** [scripts/Makefile.build:102: arch/s390/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +129 arch/s390/include/asm/pgalloc.h

    62	
    63	static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
    64	{
    65		if (mm_p4d_folded(mm))
    66			return;
  > 67		pagetable_p4d_dtor(virt_to_ptdesc(table));
    68		crst_table_free(mm, (unsigned long *) p4d);
    69	}
    70	
    71	static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
    72	{
    73		unsigned long *table = crst_table_alloc(mm);
    74	
    75		if (!table)
    76			return NULL;
    77		crst_table_init(table, _REGION3_ENTRY_EMPTY);
    78		pagetable_pud_ctor(virt_to_ptdesc(table));
    79		return (pud_t *) table;
    80	}
    81	
    82	static inline void pud_free(struct mm_struct *mm, pud_t *pud)
    83	{
    84		if (mm_pud_folded(mm))
    85			return;
    86		pagetable_pud_dtor(virt_to_ptdesc(pud));
    87		crst_table_free(mm, (unsigned long *) pud);
    88	}
    89	
    90	static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long vmaddr)
    91	{
    92		unsigned long *table = crst_table_alloc(mm);
    93	
    94		if (!table)
    95			return NULL;
    96		crst_table_init(table, _SEGMENT_ENTRY_EMPTY);
    97		if (!pagetable_pmd_ctor(virt_to_ptdesc(table))) {
    98			crst_table_free(mm, table);
    99			return NULL;
   100		}
   101		return (pmd_t *) table;
   102	}
   103	
   104	static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
   105	{
   106		if (mm_pmd_folded(mm))
   107			return;
   108		pagetable_pmd_dtor(virt_to_ptdesc(pmd));
   109		crst_table_free(mm, (unsigned long *) pmd);
   110	}
   111	
   112	static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
   113	{
   114		set_pgd(pgd, __pgd(_REGION1_ENTRY | __pa(p4d)));
   115	}
   116	
   117	static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
   118	{
   119		set_p4d(p4d, __p4d(_REGION2_ENTRY | __pa(pud)));
   120	}
   121	
   122	static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
   123	{
   124		set_pud(pud, __pud(_REGION3_ENTRY | __pa(pmd)));
   125	}
   126	
   127	static inline pgd_t *pgd_alloc(struct mm_struct *mm)
   128	{
 > 129		pgd_t *table = crst_table_alloc(mm);
   130	
   131		if (!table)
   132			return NULL;
   133		pagetable_pgd_ctor(virt_to_ptdesc(table));
   134		return table;
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
