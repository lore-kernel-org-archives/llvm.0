Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8E11AA83;
	Wed,  9 Aug 2023 16:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691597114; x=1723133114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tV9kx4lRBM0Fr/e/Nh+Jeal6/5Xk3/+aqAgnGZh05Js=;
  b=VTtxfmo8FQiTfzrKSJkPafWj2lp+RCam6EPqxwnCnW3ia5bWLF3H9h+T
   sPqKAStQ+OPjOKrsDK3TM/aHo98IRLPOJrhUKfTI3VhBqzwrauThkCEm8
   xnzzBx3BNN4Ofr+dhtjAWbU36+1y3U/QbPxuJXiM4CGht+1/Rnia1LT1D
   Xfxh//l5ThXc6oapGbppKJ9gt9p82syTzLbPxvpgc4LRck2/uSGPiRBYH
   zhLFZSK8uDB5jH6ZC/h+eOthohd0IuVF1Sm6NxqC68bU2rh/EhSM+1auH
   FWvxQPL0YKHF51eUh+OzsiYGvmD/BCN9wn7PYrkT/2vid3Zt3EJkCrHkn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356128824"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="356128824"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 09:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="731872894"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="731872894"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 09:04:37 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTlfp-0006E4-0P;
	Wed, 09 Aug 2023 16:04:37 +0000
Date: Thu, 10 Aug 2023 00:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.5-rc1 11/12]
 arch/s390/include/asm/kfence.h:38:34: error: incompatible integer to pointer
 conversion passing 'unsigned long' to parameter of type 'const void *'
Message-ID: <202308100032.TNd9PEFv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.5-rc1
head:   b6a25d37eca4850c246b94d73bd2e3c75860d265
commit: b8edce3ddc7647f7d66a7d322afe9954fa707ee8 [11/12] s390/mm: Make virt_to_pfn() a static inline
config: s390-randconfig-r044-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100032.TNd9PEFv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100032.TNd9PEFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100032.TNd9PEFv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/mm/init.c:25:
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
   In file included from arch/s390/mm/init.c:25:
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
   In file included from arch/s390/mm/init.c:25:
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
   In file included from arch/s390/mm/init.c:38:
>> arch/s390/include/asm/kfence.h:38:34: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
      38 |         __kernel_map_pages(virt_to_page(addr), 1, !protect);
         |                                         ^~~~
   arch/s390/include/asm/page.h:201:53: note: expanded from macro 'virt_to_page'
     201 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                                         ^~~~~
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   arch/s390/include/asm/page.h:195:53: note: passing argument to parameter 'kaddr' here
     195 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                                     ^
   12 warnings and 1 error generated.
--
   In file included from arch/s390/mm/pageattr.c:13:
>> arch/s390/include/asm/kfence.h:38:34: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
      38 |         __kernel_map_pages(virt_to_page(addr), 1, !protect);
         |                                         ^~~~
   arch/s390/include/asm/page.h:201:53: note: expanded from macro 'virt_to_page'
     201 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                                         ^~~~~
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   arch/s390/include/asm/page.h:195:53: note: passing argument to parameter 'kaddr' here
     195 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                                     ^
   1 error generated.
--
   In file included from arch/s390/mm/vmem.c:7:
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
   In file included from arch/s390/mm/vmem.c:7:
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
   In file included from arch/s390/mm/vmem.c:7:
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
>> arch/s390/mm/vmem.c:39:45: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
      39 |             WARN_ON_ONCE(PageReserved(virt_to_page(addr))))
         |                                                    ^~~~
   arch/s390/include/asm/page.h:201:53: note: expanded from macro 'virt_to_page'
     201 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                                         ^~~~~
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   include/asm-generic/bug.h:181:41: note: expanded from macro 'WARN_ON_ONCE'
     181 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                         ^~~~~~~~~
   include/asm-generic/bug.h:168:25: note: expanded from macro 'WARN_ON'
     168 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/s390/include/asm/page.h:195:53: note: passing argument to parameter 'kaddr' here
     195 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                                     ^
   arch/s390/mm/vmem.c:514:6: warning: no previous prototype for function 'vmemmap_free' [-Wmissing-prototypes]
     514 | void vmemmap_free(unsigned long start, unsigned long end,
         |      ^
   arch/s390/mm/vmem.c:514:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     514 | void vmemmap_free(unsigned long start, unsigned long end,
         | ^
         | static 
   13 warnings and 1 error generated.
--
>> drivers/s390/char/vmcp.c:92:23: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
      92 |                 page = virt_to_page((unsigned long)session->response);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/page.h:201:53: note: expanded from macro 'virt_to_page'
     201 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                                         ^~~~~
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   arch/s390/include/asm/page.h:195:53: note: passing argument to parameter 'kaddr' here
     195 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                                     ^
   1 error generated.


vim +38 arch/s390/include/asm/kfence.h

e41ba1115a351d Sven Schnelle 2021-07-28  35  
e41ba1115a351d Sven Schnelle 2021-07-28  36  static inline bool kfence_protect_page(unsigned long addr, bool protect)
e41ba1115a351d Sven Schnelle 2021-07-28  37  {
e41ba1115a351d Sven Schnelle 2021-07-28 @38  	__kernel_map_pages(virt_to_page(addr), 1, !protect);
e41ba1115a351d Sven Schnelle 2021-07-28  39  	return true;
e41ba1115a351d Sven Schnelle 2021-07-28  40  }
e41ba1115a351d Sven Schnelle 2021-07-28  41  

:::::: The code at line 38 was first introduced by commit
:::::: e41ba1115a351dd037c21ac75660638219d51485 s390: add support for KFENCE

:::::: TO: Sven Schnelle <svens@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
