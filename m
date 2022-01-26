Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584BB168
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 09:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643187707; x=1674723707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G8B6a0BvOHAuJNowulUgiq63eIiXFyJCb8LdkRoTpgw=;
  b=YBrpnVYirOsRUCMMY29kvs2Xp065XUC8WvzbmtZx/078z49QUlokNsY8
   1qEYky1Lt7CSunztr9cEgSEUQowQRsaHp2mmWhHw/IRLtO8iUpA67DO4J
   5cRGWaPNtQg2T7OMkCPL6EfuMx61fSv6EY0C05+uJnznIlkLeCpNRKift
   07Ijl32Bx4GZAF4cm12lySj2pqIQ1ThtVa2vzWcdu/rH94/PAOrth7wlK
   XmuybR5tuBq+EUuvB7uIByb+mWs0HrNrEf0gKGU9BMra9H6pyLJ5HrYqd
   nZG86JXUUGc3+aVGP+SVOLe4zmv+5co0vN2Cg+tb2f5pYbXne/YRDxOrv
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244109486"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="244109486"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 01:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="563351436"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Jan 2022 01:01:44 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCeBT-000L14-J8; Wed, 26 Jan 2022 09:01:43 +0000
Date: Wed, 26 Jan 2022 17:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/mediatek/mtk_star_emac.c:1559:34: warning:
 unused variable 'mtk_star_of_match'
Message-ID: <202201261608.BLH8XrDI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Lorenzo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: a3c62a042237d1adeb0290dcb768e17edd6dcd25 net: mtk_eth: add COMPILE_TEST support
date:   6 weeks ago
config: s390-buildonly-randconfig-r005-20220126 (https://download.01.org/0day-ci/archive/20220126/202201261608.BLH8XrDI-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a3c62a042237d1adeb0290dcb768e17edd6dcd25
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a3c62a042237d1adeb0290dcb768e17edd6dcd25
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/ethernet/mediatek/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_star_emac.c:12:
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
   In file included from drivers/net/ethernet/mediatek/mtk_star_emac.c:12:
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
   In file included from drivers/net/ethernet/mediatek/mtk_star_emac.c:12:
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
>> drivers/net/ethernet/mediatek/mtk_star_emac.c:1559:34: warning: unused variable 'mtk_star_of_match' [-Wunused-const-variable]
   static const struct of_device_id mtk_star_of_match[] = {
                                    ^
   13 warnings generated.


vim +/mtk_star_of_match +1559 drivers/net/ethernet/mediatek/mtk_star_emac.c

8c7bd5a454ffc2 Bartosz Golaszewski 2020-05-22  1558  
8c7bd5a454ffc2 Bartosz Golaszewski 2020-05-22 @1559  static const struct of_device_id mtk_star_of_match[] = {
8c7bd5a454ffc2 Bartosz Golaszewski 2020-05-22  1560  	{ .compatible = "mediatek,mt8516-eth", },
8c7bd5a454ffc2 Bartosz Golaszewski 2020-05-22  1561  	{ .compatible = "mediatek,mt8518-eth", },
8c7bd5a454ffc2 Bartosz Golaszewski 2020-05-22  1562  	{ .compatible = "mediatek,mt8175-eth", },
8c7bd5a454ffc2 Bartosz Golaszewski 2020-05-22  1563  	{ }
8c7bd5a454ffc2 Bartosz Golaszewski 2020-05-22  1564  };
8c7bd5a454ffc2 Bartosz Golaszewski 2020-05-22  1565  MODULE_DEVICE_TABLE(of, mtk_star_of_match);
8c7bd5a454ffc2 Bartosz Golaszewski 2020-05-22  1566  

:::::: The code at line 1559 was first introduced by commit
:::::: 8c7bd5a454ffc2b0518d1499c4af95f00291d2af net: ethernet: mtk-star-emac: new driver

:::::: TO: Bartosz Golaszewski <bgolaszewski@baylibre.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
