Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF3338F5
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 19:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647459451; x=1678995451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cBKvzYKtigCt6VxlxmALwd9l7zV8o/GhnVWf4rkgFD8=;
  b=A9ITbBB6tvQst/8RuuRQ31nffI7qgsif82xrYhCYv3sySKLucKIyfdpL
   GJI7gY/JKYE0pUacPbK22mKYu6WWd7y38h558ym35LnILjRFCQYJ2XH7x
   BiQDuiTGflZ0cZY5lkPuv5+24d5YtbE0wt/aSQ9Tp9ItZ8rAHfClkMY07
   cVTSMzj9YWAuT6xbo2KKcOzlwkbt4n/otC+zQmDapRBJpgGp/XJZu+V63
   u0F9y+2thwAlm0BuKVsIGrfXoEn/JIHDgjBaRwVR3T5cIVS0MsmSSp147
   Cu5Z2J5fu+6Am8UWlRYLC0BSx1CDvEiaTeizbNHTtPbryGbYW2yW9Rflh
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237304742"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="237304742"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 12:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="516473382"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Mar 2022 12:37:28 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUZSZ-000CoA-SG; Wed, 16 Mar 2022 19:37:27 +0000
Date: Thu, 17 Mar 2022 03:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 05/11] habanalabs: add user API to get valid DRAM page
 sizes
Message-ID: <202203170327.EdLrr0lQ-lkp@intel.com>
References: <20220316114129.2520107-5-ogabbay@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316114129.2520107-5-ogabbay@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Oded,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on next-20220316]
[cannot apply to linux/master linus/master v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Oded-Gabbay/habanalabs-set-non-0-value-in-dram-default-page-size/20220316-194323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git d6cd2f85931f87dbd07c664c9c6e806db1dd7c75
config: s390-randconfig-r031-20220317 (https://download.01.org/0day-ci/archive/20220317/202203170327.EdLrr0lQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/1a30c683a2ac64915d5cf4391a973666ac172396
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Oded-Gabbay/habanalabs-set-non-0-value-in-dram-default-page-size/20220316-194323
        git checkout 1a30c683a2ac64915d5cf4391a973666ac172396
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/misc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/habanalabs/goya/goya.c:8:
   In file included from drivers/misc/habanalabs/goya/goyaP.h:12:
   In file included from drivers/misc/habanalabs/goya/../common/habanalabs.h:11:
   In file included from drivers/misc/habanalabs/goya/../common/../include/common/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/misc/habanalabs/goya/goya.c:8:
   In file included from drivers/misc/habanalabs/goya/goyaP.h:12:
   In file included from drivers/misc/habanalabs/goya/../common/habanalabs.h:11:
   In file included from drivers/misc/habanalabs/goya/../common/../include/common/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/misc/habanalabs/goya/goya.c:8:
   In file included from drivers/misc/habanalabs/goya/goyaP.h:12:
   In file included from drivers/misc/habanalabs/goya/../common/habanalabs.h:11:
   In file included from drivers/misc/habanalabs/goya/../common/../include/common/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
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
>> drivers/misc/habanalabs/goya/goya.c:5682:6: warning: no previous prototype for function 'goya_get_valid_dram_page_orders' [-Wmissing-prototypes]
   void goya_get_valid_dram_page_orders(struct hl_info_dev_memalloc_page_sizes *info)
        ^
   drivers/misc/habanalabs/goya/goya.c:5682:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void goya_get_valid_dram_page_orders(struct hl_info_dev_memalloc_page_sizes *info)
   ^
   static 
   13 warnings generated.
--
   In file included from drivers/misc/habanalabs/gaudi/gaudi.c:8:
   In file included from drivers/misc/habanalabs/gaudi/gaudiP.h:12:
   In file included from drivers/misc/habanalabs/gaudi/../common/habanalabs.h:11:
   In file included from drivers/misc/habanalabs/gaudi/../common/../include/common/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/misc/habanalabs/gaudi/gaudi.c:8:
   In file included from drivers/misc/habanalabs/gaudi/gaudiP.h:12:
   In file included from drivers/misc/habanalabs/gaudi/../common/habanalabs.h:11:
   In file included from drivers/misc/habanalabs/gaudi/../common/../include/common/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/misc/habanalabs/gaudi/gaudi.c:8:
   In file included from drivers/misc/habanalabs/gaudi/gaudiP.h:12:
   In file included from drivers/misc/habanalabs/gaudi/../common/habanalabs.h:11:
   In file included from drivers/misc/habanalabs/gaudi/../common/../include/common/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
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
>> drivers/misc/habanalabs/gaudi/gaudi.c:9381:6: warning: no previous prototype for function 'gaudi_get_valid_dram_page_orders' [-Wmissing-prototypes]
   void gaudi_get_valid_dram_page_orders(struct hl_info_dev_memalloc_page_sizes *info)
        ^
   drivers/misc/habanalabs/gaudi/gaudi.c:9381:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void gaudi_get_valid_dram_page_orders(struct hl_info_dev_memalloc_page_sizes *info)
   ^
   static 
   13 warnings generated.


vim +/goya_get_valid_dram_page_orders +5682 drivers/misc/habanalabs/goya/goya.c

  5681	
> 5682	void goya_get_valid_dram_page_orders(struct hl_info_dev_memalloc_page_sizes *info)
  5683	{
  5684		/* set 0 since multiple pages are not supported */
  5685		info->page_order_bitmask = 0;
  5686	}
  5687	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
