Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3914C587;
	Thu, 11 Jul 2024 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720703610; cv=none; b=bkprN3NynjEw3AOCL1EhQsuRYpIeXM8muWvguT6O41rH1VLHJlaaB9ErNC99IwruPVa8Nxl9lpXB94i5jLTqpajOvuJH5bnWQaS0NlbsfxnQP683ZiAqrnzRHGRlswiHcHOWByXyKaeHJDrDIbD1MYHaNkSstt2MbVZtXpsqQR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720703610; c=relaxed/simple;
	bh=ngipTUguYfkkyt8J0LQJ84EIFYyCBJF0hAHu/s5Tgbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tRsJbXguWTR7EXWyVtjiMoEuaPUyBSeiM+Zgrlm5maxjYSLguQyGDjilesNhvCHEMWH07+UQ58eXhj+D6XiEQg4totGDWvyIFU9l4Z7Wv9oVovCi31/DJDFJkETL23jGkQJQMtEjaqEYXgMxD4UihyNfgagSoMiYwhL/Fg89foM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4cnYZ5T; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4cnYZ5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720703608; x=1752239608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ngipTUguYfkkyt8J0LQJ84EIFYyCBJF0hAHu/s5Tgbk=;
  b=Y4cnYZ5TeadSXvIi1Kezm/M4/vgW8JtnjYZgWQ8+C20SEEAwBNIVMJYd
   tFol7gpJjXdrQanMiSp+cOT9TfL4AdCih/+E70Y6TmggxqTldmfouDtYu
   tHg0c+8/OFhqx8B5KyB7w6tyv8I6kPyno3veXz1NiaX3n8dUrNRlpVf1q
   yV+Pe4IqZ1rBihnCaWA/bkm1/gD1ojcOWInou827DUJ3OkBILooo7+KHc
   MnC92ZZUw97sp/5AHROzLSNIbsGMIyWLh7gsEA8FC6nXBmMJYfPUP9qP1
   kB7vA3t3NI2xwahHd8sYAYuP4zDyf0PfaDbqkAJFMxqSrJEQufr6GzmXw
   g==;
X-CSE-ConnectionGUID: /LqrPErgRwS+V0paX/PTtQ==
X-CSE-MsgGUID: ktTLyqXJSWqVMVt5ltHpUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18220528"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="18220528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 06:13:27 -0700
X-CSE-ConnectionGUID: ZE5RP+bGTVewQQBe3WvQLg==
X-CSE-MsgGUID: +FD5mYzMShWfeT0IrE0giw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48540062"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jul 2024 06:13:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRtbv-000ZJH-1Z;
	Thu, 11 Jul 2024 13:13:23 +0000
Date: Thu, 11 Jul 2024 21:12:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:memcg_data-test 3/3] mm/kfence/core.c:606:9: error: no
 member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
Message-ID: <202407112147.bCkSOsMy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git memcg_data-test
head:   5dcc94a488cb36b012dde4bb0679dff25478cb1c
commit: 5dcc94a488cb36b012dde4bb0679dff25478cb1c [3/3] mm/memcg: alignment memcg_data define condition
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240711/202407112147.bCkSOsMy-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112147.bCkSOsMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407112147.bCkSOsMy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2221:
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
   In file included from mm/memcontrol.c:54:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/memcontrol.c:62:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
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
   In file included from mm/memcontrol.c:62:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
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
   In file included from mm/memcontrol.c:62:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
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
>> mm/memcontrol.c:3019:7: error: call to undeclared function 'alloc_slab_obj_exts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3019 |                     alloc_slab_obj_exts(slab, s, flags, false)) {
         |                     ^
   mm/memcontrol.c:3019:7: note: did you mean 'slab_obj_exts'?
   mm/slab.h:567:35: note: 'slab_obj_exts' declared here
     567 | static inline struct slabobj_ext *slab_obj_exts(struct slab *slab)
         |                                   ^
   19 warnings and 1 error generated.
--
   In file included from mm/kfence/core.c:17:
   In file included from include/linux/kfence.h:12:
   In file included from include/linux/mm.h:2221:
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
   In file included from mm/kfence/core.c:22:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
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
   In file included from mm/kfence/core.c:22:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
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
   In file included from mm/kfence/core.c:22:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
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
>> mm/kfence/core.c:606:9: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     606 |                 slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
         |                       ^~~~~~~~
         |                       objects
   mm/kfence/../slab.h:75:17: note: 'objects' declared here
      75 |                                                         unsigned objects:15;
         |                                                                  ^
   mm/kfence/core.c:656:9: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     656 |                 slab->obj_exts = 0;
         |                       ^~~~~~~~
         |                       objects
   mm/kfence/../slab.h:75:17: note: 'objects' declared here
      75 |                                                         unsigned objects:15;
         |                                                                  ^
   17 warnings and 2 errors generated.


vim +606 mm/kfence/core.c

0ce20dd840897b Alexander Potapenko 2021-02-25  572  
b33f778bba5ef3 Tianchen Ding       2022-03-22  573  /*
b33f778bba5ef3 Tianchen Ding       2022-03-22  574   * Initialization of the KFENCE pool after its allocation.
b33f778bba5ef3 Tianchen Ding       2022-03-22  575   * Returns 0 on success; otherwise returns the address up to
b33f778bba5ef3 Tianchen Ding       2022-03-22  576   * which partial initialization succeeded.
b33f778bba5ef3 Tianchen Ding       2022-03-22  577   */
b33f778bba5ef3 Tianchen Ding       2022-03-22  578  static unsigned long kfence_init_pool(void)
0ce20dd840897b Alexander Potapenko 2021-02-25  579  {
ec9fee79d48f2f Enze Li             2023-09-06  580  	unsigned long addr;
0ce20dd840897b Alexander Potapenko 2021-02-25  581  	struct page *pages;
0ce20dd840897b Alexander Potapenko 2021-02-25  582  	int i;
0ce20dd840897b Alexander Potapenko 2021-02-25  583  
0ce20dd840897b Alexander Potapenko 2021-02-25  584  	if (!arch_kfence_init_pool())
ec9fee79d48f2f Enze Li             2023-09-06  585  		return (unsigned long)__kfence_pool;
0ce20dd840897b Alexander Potapenko 2021-02-25  586  
ec9fee79d48f2f Enze Li             2023-09-06  587  	addr = (unsigned long)__kfence_pool;
9e7ee421ac1f8d Linus Walleij       2022-06-30  588  	pages = virt_to_page(__kfence_pool);
0ce20dd840897b Alexander Potapenko 2021-02-25  589  
0ce20dd840897b Alexander Potapenko 2021-02-25  590  	/*
0ce20dd840897b Alexander Potapenko 2021-02-25  591  	 * Set up object pages: they must have PG_slab set, to avoid freeing
0ce20dd840897b Alexander Potapenko 2021-02-25  592  	 * these as real pages.
0ce20dd840897b Alexander Potapenko 2021-02-25  593  	 *
0ce20dd840897b Alexander Potapenko 2021-02-25  594  	 * We also want to avoid inserting kfence_free() in the kfree()
0ce20dd840897b Alexander Potapenko 2021-02-25  595  	 * fast-path in SLUB, and therefore need to ensure kfree() correctly
0ce20dd840897b Alexander Potapenko 2021-02-25  596  	 * enters __slab_free() slow-path.
0ce20dd840897b Alexander Potapenko 2021-02-25  597  	 */
0ce20dd840897b Alexander Potapenko 2021-02-25  598  	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
1f2803b2660f4b Muchun Song         2023-03-23  599  		struct slab *slab = page_slab(nth_page(pages, i));
8f0b3649730348 Muchun Song         2022-04-01  600  
0ce20dd840897b Alexander Potapenko 2021-02-25  601  		if (!i || (i % 2))
0ce20dd840897b Alexander Potapenko 2021-02-25  602  			continue;
0ce20dd840897b Alexander Potapenko 2021-02-25  603  
8f0b3649730348 Muchun Song         2022-04-01  604  		__folio_set_slab(slab_folio(slab));
4977351270ff83 Johannes Weiner     2024-07-01  605  #ifdef CONFIG_MEMCG
21c690a349baab Suren Baghdasaryan  2024-03-21 @606  		slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
21c690a349baab Suren Baghdasaryan  2024-03-21  607  				 MEMCG_DATA_OBJEXTS;
8f0b3649730348 Muchun Song         2022-04-01  608  #endif
0ce20dd840897b Alexander Potapenko 2021-02-25  609  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  610  
0ce20dd840897b Alexander Potapenko 2021-02-25  611  	/*
0ce20dd840897b Alexander Potapenko 2021-02-25  612  	 * Protect the first 2 pages. The first page is mostly unnecessary, and
0ce20dd840897b Alexander Potapenko 2021-02-25  613  	 * merely serves as an extended guard page. However, adding one
0ce20dd840897b Alexander Potapenko 2021-02-25  614  	 * additional page in the beginning gives us an even number of pages,
0ce20dd840897b Alexander Potapenko 2021-02-25  615  	 * which simplifies the mapping of address to metadata index.
0ce20dd840897b Alexander Potapenko 2021-02-25  616  	 */
0ce20dd840897b Alexander Potapenko 2021-02-25  617  	for (i = 0; i < 2; i++) {
0ce20dd840897b Alexander Potapenko 2021-02-25  618  		if (unlikely(!kfence_protect(addr)))
b33f778bba5ef3 Tianchen Ding       2022-03-22  619  			return addr;
0ce20dd840897b Alexander Potapenko 2021-02-25  620  
0ce20dd840897b Alexander Potapenko 2021-02-25  621  		addr += PAGE_SIZE;
0ce20dd840897b Alexander Potapenko 2021-02-25  622  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  623  
0ce20dd840897b Alexander Potapenko 2021-02-25  624  	for (i = 0; i < CONFIG_KFENCE_NUM_OBJECTS; i++) {
cabdf74e6b319c Peng Zhang          2023-07-18  625  		struct kfence_metadata *meta = &kfence_metadata_init[i];
0ce20dd840897b Alexander Potapenko 2021-02-25  626  
0ce20dd840897b Alexander Potapenko 2021-02-25  627  		/* Initialize metadata. */
0ce20dd840897b Alexander Potapenko 2021-02-25  628  		INIT_LIST_HEAD(&meta->list);
0ce20dd840897b Alexander Potapenko 2021-02-25  629  		raw_spin_lock_init(&meta->lock);
0ce20dd840897b Alexander Potapenko 2021-02-25  630  		meta->state = KFENCE_OBJECT_UNUSED;
0ce20dd840897b Alexander Potapenko 2021-02-25  631  		meta->addr = addr; /* Initialize for validation in metadata_to_pageaddr(). */
0ce20dd840897b Alexander Potapenko 2021-02-25  632  		list_add_tail(&meta->list, &kfence_freelist);
0ce20dd840897b Alexander Potapenko 2021-02-25  633  
0ce20dd840897b Alexander Potapenko 2021-02-25  634  		/* Protect the right redzone. */
0ce20dd840897b Alexander Potapenko 2021-02-25  635  		if (unlikely(!kfence_protect(addr + PAGE_SIZE)))
3ee2d7471fa496 Muchun Song         2023-03-20  636  			goto reset_slab;
0ce20dd840897b Alexander Potapenko 2021-02-25  637  
0ce20dd840897b Alexander Potapenko 2021-02-25  638  		addr += 2 * PAGE_SIZE;
0ce20dd840897b Alexander Potapenko 2021-02-25  639  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  640  
cabdf74e6b319c Peng Zhang          2023-07-18  641  	/*
cabdf74e6b319c Peng Zhang          2023-07-18  642  	 * Make kfence_metadata visible only when initialization is successful.
cabdf74e6b319c Peng Zhang          2023-07-18  643  	 * Otherwise, if the initialization fails and kfence_metadata is freed,
cabdf74e6b319c Peng Zhang          2023-07-18  644  	 * it may cause UAF in kfence_shutdown_cache().
cabdf74e6b319c Peng Zhang          2023-07-18  645  	 */
cabdf74e6b319c Peng Zhang          2023-07-18  646  	smp_store_release(&kfence_metadata, kfence_metadata_init);
b33f778bba5ef3 Tianchen Ding       2022-03-22  647  	return 0;
3ee2d7471fa496 Muchun Song         2023-03-20  648  
3ee2d7471fa496 Muchun Song         2023-03-20  649  reset_slab:
3ee2d7471fa496 Muchun Song         2023-03-20  650  	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
1f2803b2660f4b Muchun Song         2023-03-23  651  		struct slab *slab = page_slab(nth_page(pages, i));
3ee2d7471fa496 Muchun Song         2023-03-20  652  
3ee2d7471fa496 Muchun Song         2023-03-20  653  		if (!i || (i % 2))
3ee2d7471fa496 Muchun Song         2023-03-20  654  			continue;
4977351270ff83 Johannes Weiner     2024-07-01  655  #ifdef CONFIG_MEMCG
21c690a349baab Suren Baghdasaryan  2024-03-21  656  		slab->obj_exts = 0;
3ee2d7471fa496 Muchun Song         2023-03-20  657  #endif
3ee2d7471fa496 Muchun Song         2023-03-20  658  		__folio_clear_slab(slab_folio(slab));
3ee2d7471fa496 Muchun Song         2023-03-20  659  	}
3ee2d7471fa496 Muchun Song         2023-03-20  660  
3ee2d7471fa496 Muchun Song         2023-03-20  661  	return addr;
b33f778bba5ef3 Tianchen Ding       2022-03-22  662  }
b33f778bba5ef3 Tianchen Ding       2022-03-22  663  

:::::: The code at line 606 was first introduced by commit
:::::: 21c690a349baab895dc68ab70d291e1598d7109d mm: introduce slabobj_ext to support slab object extensions

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
