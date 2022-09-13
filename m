Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E4D3C10
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 14:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663079435; x=1694615435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ox9GGUs+Z82R1C7QDSPr4g0v7Fd9egBuMqzhOmk9J00=;
  b=eZ4O7EvA0uGW+BLZQynnShq4K5ObPiGdGCfx0PWcG6angxB126+jrrt8
   DKf2kcHzoDEWuzx/NAITGKRb8S2/lzgslvEeSpUphicH6cXZthgtBgv5E
   nTVlX0WpRyeBQwWQ1WKU5jKD/sZSWSEs5mHxmPRLUpn+4J7EeZt9Wd5sr
   J4FZ40KmX+6DCPRJ1bH2gd7GyjHr1rlocdAufE9lOlB5RRWCl2DlvnAkI
   LHxwlsGuZlQlvgKnbEd9KqFlPw2wlfWJbsEq1xaa4FGfoXXi433mCQ+nW
   dT3RDtTLHiBSFoha0fkiTnvxtFLmYBPIUaDngRhcWqUHtliAWLypJEn1+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="298154020"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="298154020"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 07:30:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="684885449"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2022 07:30:30 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oY6vl-0003eF-2v;
	Tue, 13 Sep 2022 14:30:29 +0000
Date: Tue, 13 Sep 2022 22:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jianglei Nie <niejianglei2021@163.com>, irusskikh@marvell.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianglei Nie <niejianglei2021@163.com>
Subject: Re: [PATCH] net: atlantic: fix potential memory leak in
 aq_ndev_close()
Message-ID: <202209132232.nSnoIBSi-lkp@intel.com>
References: <20220913063941.83611-1-niejianglei2021@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913063941.83611-1-niejianglei2021@163.com>

Hi Jianglei,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master linus/master v6.0-rc5 next-20220913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianglei-Nie/net-atlantic-fix-potential-memory-leak-in-aq_ndev_close/20220913-144300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 169ccf0e40825d9e465863e4707d8e8546d3c3cb
config: s390-randconfig-r026-20220912 (https://download.01.org/0day-ci/archive/20220913/202209132232.nSnoIBSi-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/e1ce8c41446db3a7dd59206ff9c8a75baf7be067
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jianglei-Nie/net-atlantic-fix-potential-memory-leak-in-aq_ndev_close/20220913-144300
        git checkout e1ce8c41446db3a7dd59206ff9c8a75baf7be067
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/ethernet/aquantia/atlantic/ fs/f2fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/aquantia/atlantic/aq_main.c:10:
   In file included from drivers/net/ethernet/aquantia/atlantic/aq_main.h:12:
   In file included from drivers/net/ethernet/aquantia/atlantic/aq_common.h:13:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/net/ethernet/aquantia/atlantic/aq_main.c:10:
   In file included from drivers/net/ethernet/aquantia/atlantic/aq_main.h:12:
   In file included from drivers/net/ethernet/aquantia/atlantic/aq_common.h:13:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/net/ethernet/aquantia/atlantic/aq_main.c:10:
   In file included from drivers/net/ethernet/aquantia/atlantic/aq_main.h:12:
   In file included from drivers/net/ethernet/aquantia/atlantic/aq_common.h:13:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/net/ethernet/aquantia/atlantic/aq_main.c:99:1: warning: unused label 'err_exit' [-Wunused-label]
   err_exit:
   ^~~~~~~~~
   13 warnings generated.


vim +/err_exit +99 drivers/net/ethernet/aquantia/atlantic/aq_main.c

97bde5c4f909a5 David VomLehn  2017-01-23   90  
97bde5c4f909a5 David VomLehn  2017-01-23   91  static int aq_ndev_close(struct net_device *ndev)
97bde5c4f909a5 David VomLehn  2017-01-23   92  {
97bde5c4f909a5 David VomLehn  2017-01-23   93  	struct aq_nic_s *aq_nic = netdev_priv(ndev);
7b0c342f1f6754 Nikita Danilov 2019-11-07   94  	int err = 0;
97bde5c4f909a5 David VomLehn  2017-01-23   95  
97bde5c4f909a5 David VomLehn  2017-01-23   96  	err = aq_nic_stop(aq_nic);
837c637869bef2 Nikita Danilov 2019-11-07   97  	aq_nic_deinit(aq_nic, true);
97bde5c4f909a5 David VomLehn  2017-01-23   98  
97bde5c4f909a5 David VomLehn  2017-01-23  @99  err_exit:
97bde5c4f909a5 David VomLehn  2017-01-23  100  	return err;
97bde5c4f909a5 David VomLehn  2017-01-23  101  }
97bde5c4f909a5 David VomLehn  2017-01-23  102  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
