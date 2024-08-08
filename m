Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535DD63D;
	Thu,  8 Aug 2024 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723120590; cv=none; b=XQ5259h7Pc5vk8qal+29xN1FidUv5bSpbqoByAlJwIkhRIVac70TSzVKd743gzhj+WnNIYUoX3DASnyc1GX6mFuM5MMZj+Z0nfKkWaBAtohpV3rU1TGlCJU7SIQY5yEFZy5Og4Vuepqj1uvOwfXWAiND5FJaX8jFQDvYVrkB/jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723120590; c=relaxed/simple;
	bh=uDopJ27T5DtRRFmAf3KSNmeY1tR1UbbmyILobet9304=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fuJ0R0dt3p98NevZx4b6MjqCRHEkqCTSAwttIfE9VvKX25pfInyvf+Ogpy67Au97+Sbg51DWt4THVdaJgfBY2/nQnjEGWu32XZGmxnOt/IFpYTwDJr3g62BhN9UDH5ZdX/lCQM+OBjbiPfKJzAGCaWYRxsQh4WGAZNyjNKb1Duo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJjKGfOx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJjKGfOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723120588; x=1754656588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uDopJ27T5DtRRFmAf3KSNmeY1tR1UbbmyILobet9304=;
  b=GJjKGfOx11/ceD4I+ZMlTb1BJAMZ4/D8mO1K773fY4H1dt5g0L2Dk96a
   XDR5Ypdux+NWFmfbtqTZQgzeceeLkRaYKPnn0osWPfV1q+qb/2D0etc0k
   xMbrJOdvHvPUI65aMcDWCAxtddlrgYavdyeYBaQg8wTYMgGzkVf/t3n1/
   OPOhFzvLIEktPRvLMUf0zpiqsbMiomtzDgQyY9sI7qZwre/xdasysQvNo
   K09dWHocFHzKVTFElNQMF7E/mo005kxpPHKsbg25qThZqGfaqXFQKdl/5
   Aq6lI2rq5pkXeV73Jp64FmkW8mfcCOgGEOPCfledBxScedgcYHA/cNeEB
   Q==;
X-CSE-ConnectionGUID: B0VCkgwrTG+GYv6DJGl0DQ==
X-CSE-MsgGUID: Il5lMMBxSBKaqjuwT7gglQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21213161"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21213161"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 05:36:28 -0700
X-CSE-ConnectionGUID: pU6cwp+sQbWis1UXGYgnoA==
X-CSE-MsgGUID: NxLBJgmqRzWcjcX/8HO5RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="57126305"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 08 Aug 2024 05:36:26 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc2NN-0006Au-1W;
	Thu, 08 Aug 2024 12:36:19 +0000
Date: Thu, 8 Aug 2024 20:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 18/225] lib/stackdepot.c:66:26: error: call to
 undeclared function 'MIN'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202408082056.0xMOdtbe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   275d686abcb590d862b74e2670533d93fd10e58c
commit: 2900cb53f7d7d47f73c4c368c0db15a2c6df3e72 [18/225] lib/stackdepot: double DEPOT_POOLS_CAP if KASAN is enabled
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240808/202408082056.0xMOdtbe-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408082056.0xMOdtbe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408082056.0xMOdtbe-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from lib/stackdepot.c:36:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from lib/stackdepot.c:36:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from lib/stackdepot.c:36:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
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
>> lib/stackdepot.c:66:26: error: call to undeclared function 'MIN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      66 | static void *stack_pools[DEPOT_MAX_POOLS];
         |                          ^
   lib/stackdepot.c:44:2: note: expanded from macro 'DEPOT_MAX_POOLS'
      44 |         MIN((1LL << (DEPOT_POOL_INDEX_BITS)) - 1, DEPOT_POOLS_CAP)
         |         ^
>> lib/stackdepot.c:66:26: warning: variable length array used [-Wvla]
      66 | static void *stack_pools[DEPOT_MAX_POOLS];
         |                          ^~~~~~~~~~~~~~~
   lib/stackdepot.c:44:2: note: expanded from macro 'DEPOT_MAX_POOLS'
      44 |         MIN((1LL << (DEPOT_POOL_INDEX_BITS)) - 1, DEPOT_POOLS_CAP)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/stackdepot.c:66:14: error: variable length array declaration not allowed at file scope
      66 | static void *stack_pools[DEPOT_MAX_POOLS];
         |              ^           ~~~~~~~~~~~~~~~
   13 warnings and 2 errors generated.


vim +/MIN +66 lib/stackdepot.c

2900cb53f7d7d4 Waiman Long         2024-08-07  41  
3ee34eabac2abb Oscar Salvador      2024-02-15  42  /* The pool_index is offset by 1 so the first record does not have a 0 handle. */
424cafee4a9c66 Andrey Konovalov    2023-02-10  43  #define DEPOT_MAX_POOLS \
2900cb53f7d7d4 Waiman Long         2024-08-07 @44  	MIN((1LL << (DEPOT_POOL_INDEX_BITS)) - 1, DEPOT_POOLS_CAP)
cd11016e5f5212 Alexander Potapenko 2016-03-25  45  
735df3c3a3493c Andrey Konovalov    2023-02-10  46  static bool stack_depot_disabled;
1c0310add78e7e Andrey Konovalov    2023-02-10  47  static bool __stack_depot_early_init_requested __initdata = IS_ENABLED(CONFIG_STACKDEPOT_ALWAYS_INIT);
a5f1783be29ada Vlastimil Babka     2022-03-02  48  static bool __stack_depot_early_init_passed __initdata;
a5f1783be29ada Vlastimil Babka     2022-03-02  49  
0d249ac0e07680 Andrey Konovalov    2023-02-10  50  /* Use one hash table bucket per 16 KB of memory. */
4c2e9a679468a5 Andrey Konovalov    2023-02-10  51  #define STACK_HASH_TABLE_SCALE 14
0d249ac0e07680 Andrey Konovalov    2023-02-10  52  /* Limit the number of buckets between 4K and 1M. */
4c2e9a679468a5 Andrey Konovalov    2023-02-10  53  #define STACK_BUCKET_NUMBER_ORDER_MIN 12
4c2e9a679468a5 Andrey Konovalov    2023-02-10  54  #define STACK_BUCKET_NUMBER_ORDER_MAX 20
0d249ac0e07680 Andrey Konovalov    2023-02-10  55  /* Initial seed for jhash2. */
cd11016e5f5212 Alexander Potapenko 2016-03-25  56  #define STACK_HASH_SEED 0x9747b28c
cd11016e5f5212 Alexander Potapenko 2016-03-25  57  
4805180bc16523 Andrey Konovalov    2023-11-20  58  /* Hash table of stored stack records. */
4805180bc16523 Andrey Konovalov    2023-11-20  59  static struct list_head *stack_table;
0d249ac0e07680 Andrey Konovalov    2023-02-10  60  /* Fixed order of the number of table buckets. Used when KASAN is enabled. */
4c2e9a679468a5 Andrey Konovalov    2023-02-10  61  static unsigned int stack_bucket_number_order;
0d249ac0e07680 Andrey Konovalov    2023-02-10  62  /* Hash mask for indexing the table. */
f9987921cb541b Vlastimil Babka     2022-06-20  63  static unsigned int stack_hash_mask;
f9987921cb541b Vlastimil Babka     2022-06-20  64  
4805180bc16523 Andrey Konovalov    2023-11-20  65  /* Array of memory regions that store stack records. */
424cafee4a9c66 Andrey Konovalov    2023-02-10 @66  static void *stack_pools[DEPOT_MAX_POOLS];
a5d21f71715a04 Andrey Konovalov    2023-11-20  67  /* Newly allocated pool that is not yet added to stack_pools. */
a5d21f71715a04 Andrey Konovalov    2023-11-20  68  static void *new_pool;
b29d3188581400 Andrey Konovalov    2023-11-20  69  /* Number of pools in stack_pools. */
b29d3188581400 Andrey Konovalov    2023-11-20  70  static int pools_num;
31639fd6cebd4f Marco Elver         2024-01-29  71  /* Offset to the unused space in the currently used pool. */
31639fd6cebd4f Marco Elver         2024-01-29  72  static size_t pool_offset = DEPOT_POOL_SIZE;
4805180bc16523 Andrey Konovalov    2023-11-20  73  /* Freelist of stack records within stack_pools. */
4805180bc16523 Andrey Konovalov    2023-11-20  74  static LIST_HEAD(free_stacks);
4434a56ec20925 Marco Elver         2024-01-18  75  /* The lock must be held when performing pool or freelist modifications. */
4434a56ec20925 Marco Elver         2024-01-18  76  static DEFINE_RAW_SPINLOCK(pool_lock);
e1fdc403349c64 Vijayanand Jitta    2021-02-25  77  

:::::: The code at line 66 was first introduced by commit
:::::: 424cafee4a9c66435d8b86e7edbc794c116b52a5 lib/stackdepot: rename handle and pool constants

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
