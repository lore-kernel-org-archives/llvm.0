Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E18EC9;
	Thu, 11 May 2023 02:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683772793; x=1715308793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ShPZWeMT7zbgBlJA8pzlJbsxgwsTW7aDr9uBiJaWkwM=;
  b=BJ190s4kQxvGnYAuYJ++83MxWToljJ893gYdGyogpcXknZ1GXvkKVZKw
   uzHKLNBtsQLnYAzKjr9aP8+R9ZkgJgKVKIzU/uesQvCa/8RUjnv39SVrE
   MUiYMr+J4XfpiLc/m+k6pfRttbERLPKRjpbviqg5vsFpYwJWwn5eFjOI3
   g50YoLPlGfEg1SyuQJkds7b/m7niD7h3C3jn9NY5fw604N/iKDL6qRVhF
   nJj53So+gWALLNHMOxTpjYohnRCeruv4EVKSnOIdLhcZhQJSleEr9ScP3
   JSyv+Ffu0nsgTmBTL578OkjyngSIa8O1WGBtW6EB6ahGI/KuUQKqPLGQh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="415960973"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="415960973"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 19:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="1029448336"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="1029448336"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 May 2023 19:39:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwwDe-0003ie-2q;
	Thu, 11 May 2023 02:39:50 +0000
Date: Thu, 11 May 2023 10:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 41/41] lib/iomap.c:81:23: error: call to '_inb'
 declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
Message-ID: <202305111015.BDgHTEHP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   b873f53aa1a6487f4a450747bd5ee38afad6dfe4
commit: b873f53aa1a6487f4a450747bd5ee38afad6dfe4 [41/41] asm-generic/io.h: drop inb() etc for HAS_IOPORT=n
config: hexagon-randconfig-r045-20230509 (https://download.01.org/0day-ci/archive/20230511/202305111015.BDgHTEHP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=b873f53aa1a6487f4a450747bd5ee38afad6dfe4
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout b873f53aa1a6487f4a450747bd5ee38afad6dfe4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305111015.BDgHTEHP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/iomap.c:81:23: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
           IO_COND(addr, return inb(port), return readb(addr));
                                ^
   include/asm-generic/io.h:642:13: note: expanded from macro 'inb'
   #define inb _inb
               ^
   include/asm-generic/io.h:541:14: note: expanded from macro '_inb'
   #define _inb _inb
                ^
>> lib/iomap.c:87:23: error: call to '_inw' declared with 'error' attribute: inw() requires CONFIG_HAS_IOPORT
           IO_COND(addr, return inw(port), return readw(addr));
                                ^
   include/asm-generic/io.h:646:13: note: expanded from macro 'inw'
   #define inw _inw
               ^
   include/asm-generic/io.h:559:14: note: expanded from macro '_inw'
   #define _inw _inw
                ^
   lib/iomap.c:93:23: error: call to '_inw' declared with 'error' attribute: inw() requires CONFIG_HAS_IOPORT
           IO_COND(addr, return pio_read16be(port), return mmio_read16be(addr));
                                ^
   lib/iomap.c:64:35: note: expanded from macro 'pio_read16be'
   #define pio_read16be(port) swab16(inw(port))
                                     ^
   include/asm-generic/io.h:646:13: note: expanded from macro 'inw'
   #define inw _inw
               ^
   include/asm-generic/io.h:559:14: note: expanded from macro '_inw'
   #define _inw _inw
                ^
>> lib/iomap.c:99:23: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
           IO_COND(addr, return inl(port), return readl(addr));
                                ^
   include/asm-generic/io.h:650:13: note: expanded from macro 'inl'
   #define inl _inl
               ^
   include/asm-generic/io.h:577:14: note: expanded from macro '_inl'
   #define _inl _inl
                ^
   lib/iomap.c:105:23: error: call to '_inl' declared with 'error' attribute: inl() requires CONFIG_HAS_IOPORT
           IO_COND(addr, return pio_read32be(port), return mmio_read32be(addr));
                                ^
   lib/iomap.c:65:35: note: expanded from macro 'pio_read32be'
   #define pio_read32be(port) swab32(inl(port))
                                     ^
   include/asm-generic/io.h:650:13: note: expanded from macro 'inl'
   #define inl _inl
               ^
   include/asm-generic/io.h:577:14: note: expanded from macro '_inl'
   #define _inl _inl
                ^
>> lib/iomap.c:207:16: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
           IO_COND(addr, outb(val,port), writeb(val, addr));
                         ^
   include/asm-generic/io.h:654:14: note: expanded from macro 'outb'
   #define outb _outb
                ^
   include/asm-generic/io.h:595:15: note: expanded from macro '_outb'
   #define _outb _outb
                 ^
>> lib/iomap.c:213:16: error: call to '_outw' declared with 'error' attribute: outw() requires CONFIG_HAS_IOPORT
           IO_COND(addr, outw(val,port), writew(val, addr));
                         ^
   include/asm-generic/io.h:658:14: note: expanded from macro 'outw'
   #define outw _outw
                ^
   include/asm-generic/io.h:610:15: note: expanded from macro '_outw'
   #define _outw _outw
                 ^
   lib/iomap.c:219:16: error: call to '_outw' declared with 'error' attribute: outw() requires CONFIG_HAS_IOPORT
           IO_COND(addr, pio_write16be(val,port), mmio_write16be(val, addr));
                         ^
   lib/iomap.c:193:33: note: expanded from macro 'pio_write16be'
   #define pio_write16be(val,port) outw(swab16(val),port)
                                   ^
   include/asm-generic/io.h:658:14: note: expanded from macro 'outw'
   #define outw _outw
                ^
   include/asm-generic/io.h:610:15: note: expanded from macro '_outw'
   #define _outw _outw
                 ^
>> lib/iomap.c:225:16: error: call to '_outl' declared with 'error' attribute: outl() requires CONFIG_HAS_IOPORT
           IO_COND(addr, outl(val,port), writel(val, addr));
                         ^
   include/asm-generic/io.h:662:14: note: expanded from macro 'outl'
   #define outl _outl
                ^
   include/asm-generic/io.h:625:15: note: expanded from macro '_outl'
   #define _outl _outl
                 ^
   lib/iomap.c:231:16: error: call to '_outl' declared with 'error' attribute: outl() requires CONFIG_HAS_IOPORT
           IO_COND(addr, pio_write32be(val,port), mmio_write32be(val, addr));
                         ^
   lib/iomap.c:194:33: note: expanded from macro 'pio_write32be'
   #define pio_write32be(val,port) outl(swab32(val),port)
                                   ^
   include/asm-generic/io.h:662:14: note: expanded from macro 'outl'
   #define outl _outl
                ^
   include/asm-generic/io.h:625:15: note: expanded from macro '_outl'
   #define _outl _outl
                 ^
   10 errors generated.


vim +81 lib/iomap.c

34ba8a5cd0b0d5 Linus Torvalds      2006-11-11   73  
a28a4d4723c11f Alexander Potapenko 2022-09-15   74  /*
a28a4d4723c11f Alexander Potapenko 2022-09-15   75   * Here and below, we apply __no_kmsan_checks to functions reading data from
a28a4d4723c11f Alexander Potapenko 2022-09-15   76   * hardware, to ensure that KMSAN marks their return values as initialized.
a28a4d4723c11f Alexander Potapenko 2022-09-15   77   */
a28a4d4723c11f Alexander Potapenko 2022-09-15   78  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14   79  unsigned int ioread8(const void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16   80  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  @81  	IO_COND(addr, return inb(port), return readb(addr));
6cbf0c704d7c3b Linus Torvalds      2007-05-04   82  	return 0xff;
^1da177e4c3f41 Linus Torvalds      2005-04-16   83  }
a28a4d4723c11f Alexander Potapenko 2022-09-15   84  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14   85  unsigned int ioread16(const void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16   86  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  @87  	IO_COND(addr, return inw(port), return readw(addr));
6cbf0c704d7c3b Linus Torvalds      2007-05-04   88  	return 0xffff;
^1da177e4c3f41 Linus Torvalds      2005-04-16   89  }
a28a4d4723c11f Alexander Potapenko 2022-09-15   90  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14   91  unsigned int ioread16be(const void __iomem *addr)
dae409a2778877 James Bottomley     2005-04-16   92  {
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11   93  	IO_COND(addr, return pio_read16be(port), return mmio_read16be(addr));
6cbf0c704d7c3b Linus Torvalds      2007-05-04   94  	return 0xffff;
dae409a2778877 James Bottomley     2005-04-16   95  }
a28a4d4723c11f Alexander Potapenko 2022-09-15   96  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14   97  unsigned int ioread32(const void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16   98  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  @99  	IO_COND(addr, return inl(port), return readl(addr));
6cbf0c704d7c3b Linus Torvalds      2007-05-04  100  	return 0xffffffff;
^1da177e4c3f41 Linus Torvalds      2005-04-16  101  }
a28a4d4723c11f Alexander Potapenko 2022-09-15  102  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  103  unsigned int ioread32be(const void __iomem *addr)
dae409a2778877 James Bottomley     2005-04-16  104  {
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  105  	IO_COND(addr, return pio_read32be(port), return mmio_read32be(addr));
6cbf0c704d7c3b Linus Torvalds      2007-05-04  106  	return 0xffffffff;
dae409a2778877 James Bottomley     2005-04-16  107  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  108  EXPORT_SYMBOL(ioread8);
^1da177e4c3f41 Linus Torvalds      2005-04-16  109  EXPORT_SYMBOL(ioread16);
dae409a2778877 James Bottomley     2005-04-16  110  EXPORT_SYMBOL(ioread16be);
^1da177e4c3f41 Linus Torvalds      2005-04-16  111  EXPORT_SYMBOL(ioread32);
dae409a2778877 James Bottomley     2005-04-16  112  EXPORT_SYMBOL(ioread32be);
^1da177e4c3f41 Linus Torvalds      2005-04-16  113  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  114  #ifdef readq
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  115  static u64 pio_read64_lo_hi(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  116  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  117  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  118  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  119  	lo = inl(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  120  	hi = inl(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  121  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  122  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  123  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  124  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  125  static u64 pio_read64_hi_lo(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  126  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  127  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  128  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  129  	hi = inl(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  130  	lo = inl(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  131  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  132  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  133  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  134  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  135  static u64 pio_read64be_lo_hi(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  136  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  137  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  138  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  139  	lo = pio_read32be(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  140  	hi = pio_read32be(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  141  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  142  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  143  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  144  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  145  static u64 pio_read64be_hi_lo(unsigned long port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  146  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  147  	u64 lo, hi;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  148  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  149  	hi = pio_read32be(port);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  150  	lo = pio_read32be(port + sizeof(u32));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  151  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  152  	return lo | (hi << 32);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  153  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  154  
a28a4d4723c11f Alexander Potapenko 2022-09-15  155  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  156  u64 ioread64_lo_hi(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  157  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  158  	IO_COND(addr, return pio_read64_lo_hi(port), return readq(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  159  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  160  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  161  
a28a4d4723c11f Alexander Potapenko 2022-09-15  162  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  163  u64 ioread64_hi_lo(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  164  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  165  	IO_COND(addr, return pio_read64_hi_lo(port), return readq(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  166  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  167  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  168  
a28a4d4723c11f Alexander Potapenko 2022-09-15  169  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  170  u64 ioread64be_lo_hi(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  171  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  172  	IO_COND(addr, return pio_read64be_lo_hi(port),
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  173  		return mmio_read64be(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  174  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  175  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  176  
a28a4d4723c11f Alexander Potapenko 2022-09-15  177  __no_kmsan_checks
8f28ca6bd82112 Krzysztof Kozlowski 2020-08-14  178  u64 ioread64be_hi_lo(const void __iomem *addr)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  179  {
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  180  	IO_COND(addr, return pio_read64be_hi_lo(port),
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  181  		return mmio_read64be(addr));
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  182  	return 0xffffffffffffffffULL;
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  183  }
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  184  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  185  EXPORT_SYMBOL(ioread64_lo_hi);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  186  EXPORT_SYMBOL(ioread64_hi_lo);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  187  EXPORT_SYMBOL(ioread64be_lo_hi);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  188  EXPORT_SYMBOL(ioread64be_hi_lo);
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  189  
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  190  #endif /* readq */
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  191  
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  192  #ifndef pio_write16be
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  193  #define pio_write16be(val,port) outw(swab16(val),port)
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  194  #define pio_write32be(val,port) outl(swab32(val),port)
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  195  #endif
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  196  
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  197  #ifndef mmio_write16be
aecc787c06f430 Logan Gunthorpe     2019-01-16  198  #define mmio_write16be(val,port) writew(swab16(val),port)
aecc787c06f430 Logan Gunthorpe     2019-01-16  199  #define mmio_write32be(val,port) writel(swab32(val),port)
79bf0cbd86ac48 Logan Gunthorpe     2019-01-16  200  #define mmio_write64be(val,port) writeq(swab64(val),port)
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  201  #endif
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  202  
9f741cb8fecef9 Harvey Harrison     2008-02-08  203  void iowrite8(u8 val, void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16  204  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  205  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  206  	kmsan_check_memory(&val, sizeof(val));
^1da177e4c3f41 Linus Torvalds      2005-04-16 @207  	IO_COND(addr, outb(val,port), writeb(val, addr));
^1da177e4c3f41 Linus Torvalds      2005-04-16  208  }
9f741cb8fecef9 Harvey Harrison     2008-02-08  209  void iowrite16(u16 val, void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16  210  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  211  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  212  	kmsan_check_memory(&val, sizeof(val));
^1da177e4c3f41 Linus Torvalds      2005-04-16 @213  	IO_COND(addr, outw(val,port), writew(val, addr));
^1da177e4c3f41 Linus Torvalds      2005-04-16  214  }
9f741cb8fecef9 Harvey Harrison     2008-02-08  215  void iowrite16be(u16 val, void __iomem *addr)
dae409a2778877 James Bottomley     2005-04-16  216  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  217  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  218  	kmsan_check_memory(&val, sizeof(val));
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  219  	IO_COND(addr, pio_write16be(val,port), mmio_write16be(val, addr));
dae409a2778877 James Bottomley     2005-04-16  220  }
9f741cb8fecef9 Harvey Harrison     2008-02-08  221  void iowrite32(u32 val, void __iomem *addr)
^1da177e4c3f41 Linus Torvalds      2005-04-16  222  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  223  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  224  	kmsan_check_memory(&val, sizeof(val));
^1da177e4c3f41 Linus Torvalds      2005-04-16 @225  	IO_COND(addr, outl(val,port), writel(val, addr));
^1da177e4c3f41 Linus Torvalds      2005-04-16  226  }
9f741cb8fecef9 Harvey Harrison     2008-02-08  227  void iowrite32be(u32 val, void __iomem *addr)
dae409a2778877 James Bottomley     2005-04-16  228  {
a28a4d4723c11f Alexander Potapenko 2022-09-15  229  	/* Make sure uninitialized memory isn't copied to devices. */
a28a4d4723c11f Alexander Potapenko 2022-09-15  230  	kmsan_check_memory(&val, sizeof(val));
34ba8a5cd0b0d5 Linus Torvalds      2006-11-11  231  	IO_COND(addr, pio_write32be(val,port), mmio_write32be(val, addr));
dae409a2778877 James Bottomley     2005-04-16  232  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  233  EXPORT_SYMBOL(iowrite8);
^1da177e4c3f41 Linus Torvalds      2005-04-16  234  EXPORT_SYMBOL(iowrite16);
dae409a2778877 James Bottomley     2005-04-16  235  EXPORT_SYMBOL(iowrite16be);
^1da177e4c3f41 Linus Torvalds      2005-04-16  236  EXPORT_SYMBOL(iowrite32);
dae409a2778877 James Bottomley     2005-04-16  237  EXPORT_SYMBOL(iowrite32be);
^1da177e4c3f41 Linus Torvalds      2005-04-16  238  

:::::: The code at line 81 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
