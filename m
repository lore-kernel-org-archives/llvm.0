Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B8A1EB35;
	Tue, 17 Sep 2024 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726574290; cv=none; b=D4WkFyG7hEnv/P3bwDqzWZgJLcW1dvvIz5dzc6vBaVv1jzPwU+lbtYg4cZxQO6YGeAyaE1I80itInycyISXSG3Pr6clk7Fqy91p8mgx0/xw47ZRBnLucVkL2apTmGrj7q01a9QDNrbMFvCYh8SNbCbE9BuZfDAwkT5WGZb8CQsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726574290; c=relaxed/simple;
	bh=rNtMyRI9Qdo+E11cUe4G7hmk/ddhcuAu+3msnYiIg0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZWZKnEfttnrXHyYXAM4p3MTMtmgJp5iw7+WMpZABiXryWoFX4HbfhTIdRVlJ/Se7k70tooLouAfJwX8pMq4cAHhbIIAhG9+kWe0UQEXBy50MThYAQ9Bvu2JTF3Ws3cJU4/7Ne5sWH9qs+LynuFjjm9tXmBr++pN7OKHgqT6dDek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fIwzpc7h; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fIwzpc7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726574288; x=1758110288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rNtMyRI9Qdo+E11cUe4G7hmk/ddhcuAu+3msnYiIg0s=;
  b=fIwzpc7hWHMAI/USu1FH+SlGDuRuP2EtOquQNup9DUr2PefhjmiLK/LV
   vJEiuRRp950nJGQIhEu0qbitpf/oyQFCgXUgNpsDBivMa9fwOqPQbxtY1
   O3TfN68vemhlxP6qVkeXTXFeljbohwTcguB+EzQ7r0ePMLCk+c/DUxAa6
   0w3ZvBOczqvaKGEld01T94tUKymWLasRTG0/SLgn5SrMZnBgt0R5TdXe6
   Vz+v7V9AHQ3dCbB3aTMkbQ0Kbm9PUd6fPFvYdG+Elm4CJfoav9pBLEkEA
   wBBORchItDsFhjDpBkozlHCyVLNLa/7Mi0ei/tVzOZ00eVA36xMFZLNQq
   Q==;
X-CSE-ConnectionGUID: rx9tOTOLTRO4goXnArZEFw==
X-CSE-MsgGUID: ZexyT8yMS/Kh/m8uL62OyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36802748"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36802748"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 04:58:08 -0700
X-CSE-ConnectionGUID: d7uqc18DS7KM1+Nfy8XA9A==
X-CSE-MsgGUID: vny/MWLmTMeKNdlNG+gdbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69133134"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Sep 2024 04:58:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqWqK-000B6s-10;
	Tue, 17 Sep 2024 11:58:04 +0000
Date: Tue, 17 Sep 2024 19:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe-2.1 3/5] mm/init-mm.c:45:26: error: expected
 expression
Message-ID: <202409172221.nJprwP5F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe-2.1
head:   5b35eb7c617539f21cbe3764b0ee0c77567b0f22
commit: a0737313b793121a36e5830518ba23e53131d9fc [3/5] unwind: Introduce sframe user space unwinding
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240917/202409172221.nJprwP5F-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409172221.nJprwP5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409172221.nJprwP5F-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/init-mm.c:13:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from mm/init-mm.c:13:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from mm/init-mm.c:13:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
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
>> mm/init-mm.c:45:26: error: expected expression
      45 |         INIT_MM_CONTEXT(init_mm),
         |                                 ^
   13 warnings and 1 error generated.


vim +45 mm/init-mm.c

    18	
    19	/*
    20	 * For dynamically allocated mm_structs, there is a dynamically sized cpumask
    21	 * at the end of the structure, the size of which depends on the maximum CPU
    22	 * number the system can see. That way we allocate only as much memory for
    23	 * mm_cpumask() as needed for the hundreds, or thousands of processes that
    24	 * a system typically runs.
    25	 *
    26	 * Since there is only one init_mm in the entire system, keep it simple
    27	 * and size this cpu_bitmask to NR_CPUS.
    28	 */
    29	struct mm_struct init_mm = {
    30		.mm_mt		= MTREE_INIT_EXT(mm_mt, MM_MT_FLAGS, init_mm.mmap_lock),
    31		.pgd		= swapper_pg_dir,
    32		.mm_users	= ATOMIC_INIT(2),
    33		.mm_count	= ATOMIC_INIT(1),
    34		.write_protect_seq = SEQCNT_ZERO(init_mm.write_protect_seq),
    35		MMAP_LOCK_INITIALIZER(init_mm)
    36		.page_table_lock =  __SPIN_LOCK_UNLOCKED(init_mm.page_table_lock),
    37		.arg_lock	=  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
    38		.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
    39	#ifdef CONFIG_PER_VMA_LOCK
    40		.mm_lock_seq	= 0,
    41	#endif
    42		.user_ns	= &init_user_ns,
    43		.cpu_bitmap	= CPU_BITS_NONE,
    44	#ifdef INIT_MM_CONTEXT
  > 45		INIT_MM_CONTEXT(init_mm),
    46	#endif
    47	#ifdef INIT_MM_SFRAME
    48		INIT_MM_SFRAME,
    49	#endif
    50	};
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
