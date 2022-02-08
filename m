Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771BE2C9C
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644322588; x=1675858588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Olp7rK6zk5YLYG7Pc7r9QucePjQot3Nd7pJoWAbt+Ss=;
  b=fkFo4sjYcpajed1d7ha4nF5GbInEk4z50vnSHY9L5ajlTrXb3DXSWlQo
   +VXaiuto98kjJZ8hYD2Y+xZcudlNjLehrT/wGBWGGA9SVbgCAF/UG7Vba
   rjy1600IewT+5F+h6flOxsXTRF1lnayJVTFAFlct+h4swv6x2bkNGB7p7
   eYq9inXwkd3l3j1EEwcQqcaxAEMmCTIipTWACzs61l2ocAueO+BoVxD6Z
   9qv/R4l4FECndIDE1voGzB3hWA2YAkqI2K1ZyD2l4VwPap3syHLpuabRe
   bCbEQDEl5LbSWYio29L0mxj0WFlEq1hy9lWiFjze98PkAaNa0Eghb51g/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249143348"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="249143348"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 04:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="484792694"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2022 04:16:25 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHPQ1-00009M-5y; Tue, 08 Feb 2022 12:16:25 +0000
Date: Tue, 8 Feb 2022 20:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 216/221] kernel/bpf/core.c:826:37: error: statement
 expression not allowed at file scope
Message-ID: <202202082002.DBLucTeM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   5d1e9f437df5ef21e7567f1970a00fda3b5d1126
commit: 57631054fae6dcc9c892ae6310b58bbb6f6e5048 [216/221] bpf: Introduce bpf_prog_pack allocator
config: s390-randconfig-r044-20220208 (https://download.01.org/0day-ci/archive/20220208/202202082002.DBLucTeM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=57631054fae6dcc9c892ae6310b58bbb6f6e5048
        git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
        git fetch --no-tags bpf-next master
        git checkout 57631054fae6dcc9c892ae6310b58bbb6f6e5048
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/core.c:21:
   In file included from include/linux/filter.h:12:
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
   In file included from kernel/bpf/core.c:21:
   In file included from include/linux/filter.h:12:
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
   In file included from kernel/bpf/core.c:21:
   In file included from include/linux/filter.h:12:
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
>> kernel/bpf/core.c:826:37: error: statement expression not allowed at file scope
           unsigned long bitmap[BITS_TO_LONGS(BPF_PROG_CHUNK_COUNT)];
                                              ^
   kernel/bpf/core.c:821:31: note: expanded from macro 'BPF_PROG_CHUNK_COUNT'
   #define BPF_PROG_CHUNK_COUNT    (BPF_PROG_PACK_SIZE / BPF_PROG_CHUNK_SIZE)
                                    ^
   kernel/bpf/core.c:817:28: note: expanded from macro 'BPF_PROG_PACK_SIZE'
   #define BPF_PROG_PACK_SIZE      HPAGE_PMD_SIZE
                                   ^
   include/linux/huge_mm.h:333:24: note: expanded from macro 'HPAGE_PMD_SIZE'
   #define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })
                          ^
   12 warnings and 1 error generated.


vim +826 kernel/bpf/core.c

   822	
   823	struct bpf_prog_pack {
   824		struct list_head list;
   825		void *ptr;
 > 826		unsigned long bitmap[BITS_TO_LONGS(BPF_PROG_CHUNK_COUNT)];
   827	};
   828	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
