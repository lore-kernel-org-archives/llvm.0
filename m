Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDCBA40
	for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 04:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648010934; x=1679546934;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=e9j3SDuyNi13ugmnYweIETUnYu9zaonhx9Bo/kDo19w=;
  b=eYHYvyArJ6yrXG4KWLilLik71rbGPIYHiRG9t/a+pfRONbDbzEyPSblZ
   e0Ospj7+B4D9BCwu9mjjrMrA6gSWmcbjyqP4U46JXmH4ciAG9fYk98geo
   vnf1tmzET2OKcxdMQO3/gNcNnmjXq6LfKxKz6uIBHBPnjdQtGWu66BpWn
   hD102H7hoZOcxXu9SWgry+ryuq9I9KSGgQ+fZm/8aFhDY8EiP+nK55e+E
   aplLDlncC6L2UZhJ4CeD+Oid5i2tqL2Hq5Urx9ggB3OP9zdIPAHetQV7N
   CxByu289yI3PLFBXh5HmnUbwm76UQ11yTn3/TdLxHt8oessYkp2j1d+IL
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="344453680"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="344453680"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 21:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="500868506"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Mar 2022 21:48:49 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWsvQ-000JfJ-P8; Wed, 23 Mar 2022 04:48:48 +0000
Date: Wed, 23 Mar 2022 12:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [linux-next:master 2075/14215]
 drivers/net/dsa/realtek/realtek-smi.c:496:34: warning: unused variable
 'realtek_smi_of_match'
Message-ID: <202203231233.Xx73Y40o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Luiz,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f8833a2b23562be2dae91775127c8014c44d8566
commit: 765c39a4fafe6f7ea0d370aa5f30c811579cf8eb [2075/14215] net: dsa: realtek: convert subdrivers into modules
config: s390-randconfig-r005-20220323 (https://download.01.org/0day-ci/archive/20220323/202203231233.Xx73Y40o-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f4708fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=765c39a4fafe6f7ea0d370aa5f30c811579cf8eb
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 765c39a4fafe6f7ea0d370aa5f30c811579cf8eb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/dsa/realtek/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/dsa/realtek/realtek-smi.c:32:
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
   In file included from drivers/net/dsa/realtek/realtek-smi.c:32:
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
   In file included from drivers/net/dsa/realtek/realtek-smi.c:32:
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
>> drivers/net/dsa/realtek/realtek-smi.c:496:34: warning: unused variable 'realtek_smi_of_match' [-Wunused-const-variable]
   static const struct of_device_id realtek_smi_of_match[] = {
                                    ^
   13 warnings generated.


vim +/realtek_smi_of_match +496 drivers/net/dsa/realtek/realtek-smi.c

0650bf52b31ff35 drivers/net/dsa/realtek-smi-core.c    Vladimir Oltean           2021-09-17  495  
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14 @496  static const struct of_device_id realtek_smi_of_match[] = {
765c39a4fafe6f7 drivers/net/dsa/realtek/realtek-smi.c Luiz Angelo Daros de Luca 2022-01-28  497  #if IS_ENABLED(CONFIG_NET_DSA_REALTEK_RTL8366RB)
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  498  	{
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  499  		.compatible = "realtek,rtl8366rb",
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  500  		.data = &rtl8366rb_variant,
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  501  	},
765c39a4fafe6f7 drivers/net/dsa/realtek/realtek-smi.c Luiz Angelo Daros de Luca 2022-01-28  502  #endif
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  503  	{
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  504  		/* FIXME: add support for RTL8366S and more */
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  505  		.compatible = "realtek,rtl8366s",
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  506  		.data = NULL,
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  507  	},
765c39a4fafe6f7 drivers/net/dsa/realtek/realtek-smi.c Luiz Angelo Daros de Luca 2022-01-28  508  #if IS_ENABLED(CONFIG_NET_DSA_REALTEK_RTL8365MB)
4af2950c50c8634 drivers/net/dsa/realtek-smi-core.c    Alvin Šipraga             2021-10-18  509  	{
4af2950c50c8634 drivers/net/dsa/realtek-smi-core.c    Alvin Šipraga             2021-10-18  510  		.compatible = "realtek,rtl8365mb",
4af2950c50c8634 drivers/net/dsa/realtek-smi-core.c    Alvin Šipraga             2021-10-18  511  		.data = &rtl8365mb_variant,
4af2950c50c8634 drivers/net/dsa/realtek-smi-core.c    Alvin Šipraga             2021-10-18  512  	},
765c39a4fafe6f7 drivers/net/dsa/realtek/realtek-smi.c Luiz Angelo Daros de Luca 2022-01-28  513  #endif
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  514  	{ /* sentinel */ },
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  515  };
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  516  MODULE_DEVICE_TABLE(of, realtek_smi_of_match);
d8652956cf37c5c drivers/net/dsa/realtek-smi.c         Linus Walleij             2018-07-14  517  

:::::: The code at line 496 was first introduced by commit
:::::: d8652956cf37c5caa8c19e0b99ce5ca235c6d5de net: dsa: realtek-smi: Add Realtek SMI driver

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
