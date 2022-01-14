Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633FB29CA
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 00:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642121848; x=1673657848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5zlHbZlCHZs666H8cOGG7rweh70YY57ByrZiK4jMcZk=;
  b=MHuxm95SW4gMAT/9XN8eyh5w9FvL3a/q82hTnv+rOpjcav/8V0Sg2hf9
   wMT2tj3dBv17t0ZZ+UkV2DxRtxNysGuy2kq/dkLJtkF8PaqrBJWbxk5l8
   +t6M/RZhXannbJX6c2/mY7L5qRP9EwGTFcI9npAoGOqT9qHnRMFsLyHmo
   8IO8lBe2IZx0js4QZCuQvIK0u8Rs+zhjTARHt0GyCYPkFiAtOgllUumqn
   b0PkBOPM59SaYlIo6Zrw9YZzBWsDHAY+xJ9hQ3mbNNK8eE4IS+k2lMG+O
   0/ZyfEPFiJKRYxQ6+nalKHAUQ6MDZYUK0aYYyEnc4GwJ1NNTu6AP1UC/f
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="330501066"
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="330501066"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 16:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="475566017"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Jan 2022 16:57:16 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8Au3-0007qt-Gg; Fri, 14 Jan 2022 00:57:15 +0000
Date: Fri, 14 Jan 2022 08:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [intel-tdx:tdx/guest-rebased 105/133] kernel/dma/swiotlb.c:320:16:
 error: implicit declaration of function 'kzalloc'
Message-ID: <202201140844.HLn72YTB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/intel/tdx.git tdx/guest-rebased
head:   e3995864d37c56f431c93fc3dc454d9c65f5e9ea
commit: 64f46677f0bd4db290a0c6be857c6fd8db39324b [105/133] swiotlb: use bitmap to track free slots
config: s390-randconfig-r033-20220113 (https://download.01.org/0day-ci/archive/20220114/202201140844.HLn72YTB-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel/tdx/commit/64f46677f0bd4db290a0c6be857c6fd8db39324b
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx tdx/guest-rebased
        git checkout 64f46677f0bd4db290a0c6be857c6fd8db39324b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/dma/swiotlb.c:24:
   In file included from include/linux/dma-direct.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/dma/swiotlb.c:24:
   In file included from include/linux/dma-direct.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/dma/swiotlb.c:24:
   In file included from include/linux/dma-direct.h:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> kernel/dma/swiotlb.c:320:16: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
           mem->bitmap = kzalloc(DIV_ROUND_UP(nslabs, BITS_PER_BYTE), GFP_KERNEL);
                         ^
   kernel/dma/swiotlb.c:320:16: note: did you mean 'vzalloc'?
   include/linux/vmalloc.h:140:14: note: 'vzalloc' declared here
   extern void *vzalloc(unsigned long size) __alloc_size(1);
                ^
   kernel/dma/swiotlb.c:320:14: warning: incompatible integer to pointer conversion assigning to 'unsigned long *' from 'int' [-Wint-conversion]
           mem->bitmap = kzalloc(DIV_ROUND_UP(nslabs, BITS_PER_BYTE), GFP_KERNEL);
                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/dma/swiotlb.c:324:3: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
                   kfree(mem->bitmap);
                   ^
   kernel/dma/swiotlb.c:324:3: note: did you mean 'vfree'?
   include/linux/vmalloc.h:155:13: note: 'vfree' declared here
   extern void vfree(const void *addr);
               ^
   13 warnings and 2 errors generated.


vim +/kzalloc +320 kernel/dma/swiotlb.c

   306	
   307	int
   308	swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
   309	{
   310		struct io_tlb_mem *mem = &io_tlb_default_mem;
   311		unsigned long bytes = nslabs << IO_TLB_SHIFT;
   312	
   313		if (swiotlb_force == SWIOTLB_NO_FORCE)
   314			return 0;
   315	
   316		/* protect against double initialization */
   317		if (WARN_ON_ONCE(mem->nslabs))
   318			return -ENOMEM;
   319	
 > 320		mem->bitmap = kzalloc(DIV_ROUND_UP(nslabs, BITS_PER_BYTE), GFP_KERNEL);
   321		mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
   322			get_order(array_size(sizeof(*mem->slots), nslabs)));
   323		if (!mem->slots || !mem->bitmap) {
 > 324			kfree(mem->bitmap);
   325			kfree(mem->slots);
   326			return -ENOMEM;
   327		}
   328	
   329		set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
   330		swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
   331	
   332		swiotlb_print_info();
   333		swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
   334		return 0;
   335	}
   336	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
