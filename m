Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3071C6B
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645620453; x=1677156453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QQxeX/jbVCxYVyClBrFI4ueqwrzdBsTi7qkw3tVNQtM=;
  b=I2W3Dc/mvBsKUjZeiiJ9x72BEzQ+3c4nnCFkyunTtJYi0HNiO9iwG/dF
   npeG7PZpzfk0Dqq27gD9GUGiq6mqIbjRnbXK6ANyTkaOEGtHNo5aP3zQK
   DulkcxNeo2BKF89RY81khB5UTF1W0peSGBcM3I9MTXrCjbQeBRmUGW6Oo
   eVkU23b4xIuX8JOP/WI4uu0PqN145CaA+KPjKhzktGByT3RsP5SCDNPwi
   D0tivUJLloqUNDxll6SyWHf/sLFYIMZu24TJHFD6ECSTcq3icawzFfMyV
   tZied90HdKw0PfayFU8NOWpPrvGAqP/aOzEbSmmt+3BqsgKrZJ9QIka/v
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="315180174"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="315180174"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:47:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="491183315"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Feb 2022 04:47:30 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMr3K-0001Ou-1I; Wed, 23 Feb 2022 12:47:30 +0000
Date: Wed, 23 Feb 2022 20:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Cheng <michael.cheng@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
	balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
	casey.g.bowman@intel.com, lucas.demarchi@intel.com,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Message-ID: <202202231817.dkY1qGrU-lkp@intel.com>
References: <20220223055900.415627-2-michael.cheng@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223055900.415627-2-michael.cheng@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Michael,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on drm/drm-next]
[cannot apply to drm-intel/for-linux-next v5.17-rc5 next-20220222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Cheng/Use-drm_clflush-instead-of-clflush/20220223-140110
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: s390-randconfig-r013-20220221 (https://download.01.org/0day-ci/archive/20220223/202202231817.dkY1qGrU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/f4c92ba1f52db578a26ac9944e2cbe52c548e8e9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Cheng/Use-drm_clflush-instead-of-clflush/20220223-140110
        git checkout f4c92ba1f52db578a26ac9944e2cbe52c548e8e9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_cache.c:31:
>> include/linux/cacheflush.h:12:46: warning: declaration of 'struct folio' will not be visible outside of this function [-Wvisibility]
   static inline void flush_dcache_folio(struct folio *folio)
                                                ^
   In file included from drivers/gpu/drm/drm_cache.c:35:
   In file included from include/linux/iosys-map.h:9:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/gpu/drm/drm_cache.c:35:
   In file included from include/linux/iosys-map.h:9:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/gpu/drm/drm_cache.c:35:
   In file included from include/linux/iosys-map.h:9:
   In file included from include/linux/io.h:13:
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
   13 warnings generated.


vim +12 include/linux/cacheflush.h

522a0032af0055 Matthew Wilcox (Oracle  2021-11-06   6) 
522a0032af0055 Matthew Wilcox (Oracle  2021-11-06   7) #if ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
522a0032af0055 Matthew Wilcox (Oracle  2021-11-06   8) #ifndef ARCH_IMPLEMENTS_FLUSH_DCACHE_FOLIO
522a0032af0055 Matthew Wilcox (Oracle  2021-11-06   9) void flush_dcache_folio(struct folio *folio);
522a0032af0055 Matthew Wilcox (Oracle  2021-11-06  10) #endif
522a0032af0055 Matthew Wilcox (Oracle  2021-11-06  11) #else
522a0032af0055 Matthew Wilcox (Oracle  2021-11-06 @12) static inline void flush_dcache_folio(struct folio *folio)
522a0032af0055 Matthew Wilcox (Oracle  2021-11-06  13) {
522a0032af0055 Matthew Wilcox (Oracle  2021-11-06  14) }
522a0032af0055 Matthew Wilcox (Oracle  2021-11-06  15) #define ARCH_IMPLEMENTS_FLUSH_DCACHE_FOLIO 0
522a0032af0055 Matthew Wilcox (Oracle  2021-11-06  16) #endif /* ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE */
522a0032af0055 Matthew Wilcox (Oracle  2021-11-06  17) 

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
