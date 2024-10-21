Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9978156C63;
	Mon, 21 Oct 2024 05:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729488106; cv=none; b=F8kLeoTqNjaeKiNGz1VelEgfnwAeaVcI/cC0776cP3+SjeRTb47H1bCM4wP0AYkoGG3pZDTDX8bv/ky/XmmEzlQdcI6qBjN3PcM4s2kN96FMHa2+tz2h9mvKTgR7TvQOExUmbfR9MlR+NnWfsjqN3lXgrUEUA5S3X3Mb+lGGeW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729488106; c=relaxed/simple;
	bh=kQzW/GiiA1snIT7JwBW5CXPpsE418DVgnOsl+c/pjRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fv7hhEmmTiicfZtRjOmsFV4rrqD4HVg4I6s5Yin/o0KZQ7jLeW/5pKfUkSaWE4Liz9yqkK2UR6AmTy0G+Pkr73FpTYu5G8rU7cQ6Kz1ER5kj1CI24SSAsw7Pziknf20Y874m4ghO7QE9j8aocg4Dx7h5MvjGtRRfRI9sCyaP14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b83imDtJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b83imDtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729488104; x=1761024104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kQzW/GiiA1snIT7JwBW5CXPpsE418DVgnOsl+c/pjRQ=;
  b=b83imDtJSmBZOkhV8JnITtGyK/diosNSzI+Fw9rrwEoe0yCpvFrFrsFb
   NYzTqwW/S0UM0a7s9LyjNrM4O3gR+QZs65m3njeuHFjDyvOiG6IcLAKWc
   gx/WT36JGzffzPfbLz0YT13TQVwZiKXrYQm2ur/Brf5CB1BwHuD0qBxbx
   DHGi56E7H57eVPxYHulJZL0DfE7DnPKQOWvL6E+W9KmAPimPY1m0p026K
   SIm4ILf35Z7UNFZ9kCZ1D7rJC9BTt+Xl/QJlk/dNC0moKTuvDAFCKFqsD
   3fSPdpuGlR1pKe+8VwzB8hJge544ApWobEBQmtqcm36QYQsL3Dn0UFDwA
   A==;
X-CSE-ConnectionGUID: aTFdVeG0SH61UvTu3uBWEA==
X-CSE-MsgGUID: /lw0rqTzQeujh5gNlzVtQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28833713"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="28833713"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 22:21:43 -0700
X-CSE-ConnectionGUID: LM+t/DnkRw+QPEOlzqu04w==
X-CSE-MsgGUID: HhkjWgApRV6yHI6Wv060dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="110256112"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Oct 2024 22:21:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2krL-000RDg-1m;
	Mon, 21 Oct 2024 05:21:39 +0000
Date: Mon, 21 Oct 2024 13:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe-2.2 3/9] mm/init-mm.c:45:26: error: expected
 expression
Message-ID: <202410211309.narb075Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe-2.2
head:   757574ba1822accfdae6ec405421f5e2df48fe52
commit: c689ba830937835b9098f0cd4d6cfeece2e8f71d [3/9] unwind: Introduce sframe userspace unwinding
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20241021/202410211309.narb075Z-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410211309.narb075Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211309.narb075Z-lkp@intel.com/

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
