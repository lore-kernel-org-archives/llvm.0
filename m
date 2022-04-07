Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A06C20F5
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 07:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649314956; x=1680850956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+V40WE+kYDuiNwugfWzf0qQ86G/RlSPWEGv/TCbofk=;
  b=caiqWu+4pDDSxf2mnKuekcoNoPC3neSYAMoqo+SDp+s4YBtQVwI7GgmQ
   M9Ez3MGgkryeKouEih4K57ZpymyfbqjyZEjMFi2Mw2SLXaoD5uUAjl8/N
   21ATBKHaZAM3AdSL0wtNzzR5mrDo/MPSj1uqdXOg0V67kzAA0/MAb8/Ri
   I3EWM/BHgvhGQoDrdEMa+xMofaHj2PqsRebVWJMkRc8Bm42Ki04xjOPHN
   V4B2p1OdtkIPT4y7JqbjZhaNnhcypbxFViAb6dg2rZ3891elGUpiQsyVa
   Gd/rOXzSF7LF6rpXmFyU1v2RUv3fZW02fcpbAQI2nN32c9UHBNFzMO6Sy
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="241838962"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; 
   d="scan'208";a="241838962"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2022 00:02:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; 
   d="scan'208";a="549894270"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 07 Apr 2022 00:02:32 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncMA3-0005AU-M1;
	Thu, 07 Apr 2022 07:02:31 +0000
Date: Thu, 7 Apr 2022 15:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <alobakin@pm.me>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: drivers/net/dsa/microchip/ksz9477_spi.c:86:34: warning: unused
 variable 'ksz9477_dt_ids'
Message-ID: <202204071418.9ByMEtlP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Alexander,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: 227d72063fccb2d19b30fb4197fba478514f7d83 dsa: simplify Kconfig symbols and dependencies
date:   1 year, 1 month ago
config: s390-randconfig-c005-20220407 (https://download.01.org/0day-ci/archive/20220407/202204071418.9ByMEtlP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b306233f78876a1d197ed6e1f05785505de7c63)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=227d72063fccb2d19b30fb4197fba478514f7d83
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 227d72063fccb2d19b30fb4197fba478514f7d83
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/dsa/microchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                     ^
   In file included from drivers/net/dsa/microchip/ksz9477_spi.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from drivers/net/dsa/microchip/ksz9477_spi.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
                     ^
   In file included from drivers/net/dsa/microchip/ksz9477_spi.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
                     ^
   In file included from drivers/net/dsa/microchip/ksz9477_spi.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from drivers/net/dsa/microchip/ksz9477_spi.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
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
>> drivers/net/dsa/microchip/ksz9477_spi.c:86:34: warning: unused variable 'ksz9477_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id ksz9477_dt_ids[] = {
                                    ^
   21 warnings generated.


vim +/ksz9477_dt_ids +86 drivers/net/dsa/microchip/ksz9477_spi.c

c2e866911e2540 drivers/net/dsa/microchip/ksz9477_spi.c Tristram Ha        2018-11-20  85  
c2e866911e2540 drivers/net/dsa/microchip/ksz9477_spi.c Tristram Ha        2018-11-20 @86  static const struct of_device_id ksz9477_dt_ids[] = {
b987e98e50ab90 drivers/net/dsa/microchip/ksz_spi.c     Woojung Huh        2017-05-31  87  	{ .compatible = "microchip,ksz9477" },
45316818371d1f drivers/net/dsa/microchip/ksz_spi.c     Lad, Prabhakar     2018-08-15  88  	{ .compatible = "microchip,ksz9897" },
8c29bebb1f8a68 drivers/net/dsa/microchip/ksz9477_spi.c Tristram Ha        2019-02-28  89  	{ .compatible = "microchip,ksz9893" },
8c29bebb1f8a68 drivers/net/dsa/microchip/ksz9477_spi.c Tristram Ha        2019-02-28  90  	{ .compatible = "microchip,ksz9563" },
d9033ae95cf445 drivers/net/dsa/microchip/ksz9477_spi.c Razvan Stefanescu  2019-08-30  91  	{ .compatible = "microchip,ksz8563" },
9b2d9f05cddfee drivers/net/dsa/microchip/ksz9477_spi.c George McCollister 2019-09-10  92  	{ .compatible = "microchip,ksz9567" },
b987e98e50ab90 drivers/net/dsa/microchip/ksz_spi.c     Woojung Huh        2017-05-31  93  	{},
b987e98e50ab90 drivers/net/dsa/microchip/ksz_spi.c     Woojung Huh        2017-05-31  94  };
c2e866911e2540 drivers/net/dsa/microchip/ksz9477_spi.c Tristram Ha        2018-11-20  95  MODULE_DEVICE_TABLE(of, ksz9477_dt_ids);
b987e98e50ab90 drivers/net/dsa/microchip/ksz_spi.c     Woojung Huh        2017-05-31  96  

:::::: The code at line 86 was first introduced by commit
:::::: c2e866911e2540677c31ee009d8f75cdb4c023aa net: dsa: microchip: break KSZ9477 DSA driver into two files

:::::: TO: Tristram Ha <Tristram.Ha@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
