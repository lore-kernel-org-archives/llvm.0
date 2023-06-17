Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0BD111A;
	Sat, 17 Jun 2023 22:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687040515; x=1718576515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ovln+n1TaAJYwBJD/oupr40uvUEaSLVpiHzSYAYWrAs=;
  b=k+SOWX2I2FUny4zz8MEaRRuYrHd9WmwlrnShAUSazyt7PN0DYYHpSPXy
   1HhlipVFtcWYUmE7q7yPX8cZ0E5yIiwGT3pWPdfxdjahUHHGRjgG8oUlk
   dz+hkrxdr+De/MvYEfGua4K5nA4cm6r7JsTKZy2zvhYPmv+osP1TQrQDq
   0TtdcTuqZ0/r0L3z6Mm39qKgO8VL9S+S+qIh5WsfHTsN55dCqnhQMAKEa
   WRcKsQLGrX24JbAzCU8QPtYdIcHrcF8K+C7uSJCwWVrz4UYOc6Au2ErBk
   dku8ln2VI3ehiaj8ERHNHd2pkbiBhli77tNagk/tR81ndr5VtZYLGTl5L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="359438159"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="359438159"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 15:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="837425269"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="837425269"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Jun 2023 15:21:53 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAeIq-0003AE-0y;
	Sat, 17 Jun 2023 22:21:52 +0000
Date: Sun, 18 Jun 2023 06:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 14/17]
 net/rds/sysctl.c:107:10: error: too many arguments to function call,
 expected 3, have 4
Message-ID: <202306180608.GX63erj3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   cbba378db4b97256c72560da5762aaed778957c0
commit: 21228baedf71a454dde0e4d62f4686d99a2c7f28 [14/17] sysctl: Add size to the regsiter_net_sysctl function
config: hexagon-randconfig-r045-20230618 (https://download.01.org/0day-ci/archive/20230618/202306180608.GX63erj3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180608.GX63erj3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180608.GX63erj3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/rds/sysctl.c:37:
   In file included from net/rds/rds.h:5:
   In file included from include/net/sock.h:38:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/rds/sysctl.c:37:
   In file included from net/rds/rds.h:5:
   In file included from include/net/sock.h:38:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/rds/sysctl.c:37:
   In file included from net/rds/rds.h:5:
   In file included from include/net/sock.h:38:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> net/rds/sysctl.c:107:10: error: too many arguments to function call, expected 3, have 4
     107 |         rds_sysctl_reg_table = register_net_sysctl(&init_net, "net/rds",
         |                                ~~~~~~~~~~~~~~~~~~~
     108 |                                                    rds_sysctl_rds_table,
     109 |                                                    ARRAY_SIZE(rds_sysctl_rds_table));
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:25: note: expanded from macro 'ARRAY_SIZE'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/net_namespace.h:479:40: note: 'register_net_sysctl' declared here
     479 | static inline struct ctl_table_header *register_net_sysctl(struct net *net,
         |                                        ^
   6 warnings and 1 error generated.
--
   In file included from drivers/infiniband/core/iwcm.c:38:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/infiniband/core/iwcm.c:38:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/infiniband/core/iwcm.c:38:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/infiniband/core/iwcm.c:1197:8: error: too many arguments to function call, expected 3, have 4
    1197 |         iwcm_ctl_table_hdr = register_net_sysctl(&init_net, "net/iw_cm",
         |                              ~~~~~~~~~~~~~~~~~~~
    1198 |                                                  iwcm_ctl_table,
    1199 |                                                  ARRAY_SIZE(iwcm_ctl_table));
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:25: note: expanded from macro 'ARRAY_SIZE'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/net_namespace.h:479:40: note: 'register_net_sysctl' declared here
     479 | static inline struct ctl_table_header *register_net_sysctl(struct net *net,
         |                                        ^
   6 warnings and 1 error generated.


vim +107 net/rds/sysctl.c

    99	
   100	int rds_sysctl_init(void)
   101	{
   102		rds_sysctl_reconnect_min = msecs_to_jiffies(1);
   103		rds_sysctl_reconnect_min_jiffies = rds_sysctl_reconnect_min;
   104	
   105		rds_sysctl_reg_table = register_net_sysctl(&init_net, "net/rds",
   106							   rds_sysctl_rds_table,
 > 107							   ARRAY_SIZE(rds_sysctl_rds_table));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
