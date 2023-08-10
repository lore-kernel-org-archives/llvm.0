Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB803D71;
	Thu, 10 Aug 2023 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691662870; x=1723198870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EWrrcDCjfnXpl6/oWWrhtc3fyhdolONXYM7mgqyM7Jo=;
  b=QWcaSUBY3wMaUlRqiwq+DzSKxcUi8VXntifavhmFFy0Z9QUhUtKFSk3Z
   K3Ga1xv8i6k6XIWX1o4pQbl1eoYKpl5bTNvjfbfXqbXLVxTAGKf3jIQnN
   RpWaQfcuhonGDuUi5Pj1Hqs+OfqqRApOkwUBxZA4F7XkAGsFwBsIPCii9
   2jUuY7BJl8MCbfguVv71DSs2rVDbUof7+u9tnZJzJuah513Y995kU7ljZ
   NzjNOuTXtT3ppMMoyKyIzGa2RqJA6fRbTELRcEKnGCI1OXZt/ONNbpNA1
   MokjD1IwLqEnIQXPTPmyWjNNePJvuQa+yly2/L43UukRRI+8B4oTEHWlf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="435256176"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="435256176"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 03:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="855886277"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="855886277"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Aug 2023 03:21:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU2mx-0006vc-08;
	Thu, 10 Aug 2023 10:21:07 +0000
Date: Thu, 10 Aug 2023 18:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-kfence 2/2]
 include/linux/kfence.h:58:47: error: 'char *' and 'void *' are not pointers
 to compatible types
Message-ID: <202308101804.UsM0csDB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-kfence
head:   709c5a98b878015dc4f8838fca1c0194b42dee86
commit: 709c5a98b878015dc4f8838fca1c0194b42dee86 [2/2] kfence: Use a void * for page pool
config: s390-randconfig-r022-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101804.UsM0csDB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101804.UsM0csDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101804.UsM0csDB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/kfence/kfence_test.c:17:
>> include/linux/kfence.h:58:47: error: 'char *' and 'void *' are not pointers to compatible types
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                                         ~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
>> mm/kfence/kfence_test.c:648:2: warning: ISO C does not allow indirection on operand of type 'const volatile typeof (_Generic((__kfence_pool[10]), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, short: (short)0, unsigned int: (unsigned int)0, int: (int)0, unsigned long: (unsigned long)0, long: (long)0, unsigned long long: (unsigned long long)0, long long: (long long)0, default: (__kfence_pool[10]))) *' (aka 'const volatile void *') [-Wvoid-ptr-dereference]
     648 |         READ_ONCE(__kfence_pool[10]);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:25: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   In file included from mm/kfence/report.c:20:
   In file included from arch/s390/include/asm/kfence.h:7:
>> include/linux/kfence.h:58:47: error: 'char *' and 'void *' are not pointers to compatible types
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                                         ~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   1 error generated.
--
   In file included from mm/kfence/core.c:17:
>> include/linux/kfence.h:58:47: error: 'char *' and 'void *' are not pointers to compatible types
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                                         ~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   In file included from mm/kfence/core.c:22:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
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
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
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
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from mm/kfence/core.c:36:
   In file included from mm/kfence/kfence.h:17:
   In file included from mm/kfence/../slab.h:239:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/kfence/core.c:36:
   In file included from mm/kfence/kfence.h:17:
   In file included from mm/kfence/../slab.h:239:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here


vim +58 include/linux/kfence.h

0ce20dd840897b Alexander Potapenko 2021-02-25  32  
0ce20dd840897b Alexander Potapenko 2021-02-25  33  /**
0ce20dd840897b Alexander Potapenko 2021-02-25  34   * is_kfence_address() - check if an address belongs to KFENCE pool
0ce20dd840897b Alexander Potapenko 2021-02-25  35   * @addr: address to check
0ce20dd840897b Alexander Potapenko 2021-02-25  36   *
0ce20dd840897b Alexander Potapenko 2021-02-25  37   * Return: true or false depending on whether the address is within the KFENCE
0ce20dd840897b Alexander Potapenko 2021-02-25  38   * object range.
0ce20dd840897b Alexander Potapenko 2021-02-25  39   *
0ce20dd840897b Alexander Potapenko 2021-02-25  40   * KFENCE objects live in a separate page range and are not to be intermixed
0ce20dd840897b Alexander Potapenko 2021-02-25  41   * with regular heap objects (e.g. KFENCE objects must never be added to the
0ce20dd840897b Alexander Potapenko 2021-02-25  42   * allocator freelists). Failing to do so may and will result in heap
0ce20dd840897b Alexander Potapenko 2021-02-25  43   * corruptions, therefore is_kfence_address() must be used to check whether
0ce20dd840897b Alexander Potapenko 2021-02-25  44   * an object requires specific handling.
0ce20dd840897b Alexander Potapenko 2021-02-25  45   *
0ce20dd840897b Alexander Potapenko 2021-02-25  46   * Note: This function may be used in fast-paths, and is performance critical.
0ce20dd840897b Alexander Potapenko 2021-02-25  47   * Future changes should take this into account; for instance, we want to avoid
0ce20dd840897b Alexander Potapenko 2021-02-25  48   * introducing another load and therefore need to keep KFENCE_POOL_SIZE a
0ce20dd840897b Alexander Potapenko 2021-02-25  49   * constant (until immediate patching support is added to the kernel).
0ce20dd840897b Alexander Potapenko 2021-02-25  50   */
0ce20dd840897b Alexander Potapenko 2021-02-25  51  static __always_inline bool is_kfence_address(const void *addr)
0ce20dd840897b Alexander Potapenko 2021-02-25  52  {
0ce20dd840897b Alexander Potapenko 2021-02-25  53  	/*
a7cb5d23eaea14 Marco Elver         2021-08-19  54  	 * The __kfence_pool != NULL check is required to deal with the case
a7cb5d23eaea14 Marco Elver         2021-08-19  55  	 * where __kfence_pool == NULL && addr < KFENCE_POOL_SIZE. Keep it in
a7cb5d23eaea14 Marco Elver         2021-08-19  56  	 * the slow-path after the range-check!
0ce20dd840897b Alexander Potapenko 2021-02-25  57  	 */
a7cb5d23eaea14 Marco Elver         2021-08-19 @58  	return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
0ce20dd840897b Alexander Potapenko 2021-02-25  59  }
0ce20dd840897b Alexander Potapenko 2021-02-25  60  

:::::: The code at line 58 was first introduced by commit
:::::: a7cb5d23eaea148f8582229846f8dfff192f05c3 kfence: fix is_kfence_address() for addresses below KFENCE_POOL_SIZE

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
