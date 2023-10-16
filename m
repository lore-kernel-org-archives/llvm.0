Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7250A3AC1D;
	Mon, 16 Oct 2023 22:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pg6mfAHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697495815; x=1729031815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CWqCyZzV0joUCz7OlSbGc9UpVA31Ozg8TMUsJ6VS1f0=;
  b=Pg6mfAHODYjFss30l8KmlU20dY7fX6iV4lDSM4qoFYpk33WGr2IUfuFU
   B5D5+fakU6IkROy3/oxHufim0BgwqNlQgKExYLGPMPm1AEE0QfVk8ThX3
   tbUvMgyU7nzYeh83sbxuwqd8UMmGtCg81/18EJKhsQ/uBCs5+p7zpywjF
   Xhl7XCzcCclqKDMAs1RUUviUHfhA45v1n7wUohsl2SAjpWg9xyxyaamu1
   GaEJxTg8ifA6GjUdReaDVqYnWt4aTBf5353whl9eO4WfkpVoAfthQp0Pu
   CqotPcNNvjrg+tmuNODXsFAv4A6e+G4FKjSK9ZIMfqipI8BIcE0HFjaZ1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="385492513"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="385492513"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 15:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087250685"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="1087250685"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2023 15:36:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsWCg-0008ix-26;
	Mon, 16 Oct 2023 22:36:50 +0000
Date: Tue, 17 Oct 2023 06:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11468/12451]
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c:2004:34: warning: unused
 variable 'xgene_enet_of_match'
Message-ID: <202310170627.2Kvf6ZHY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d0515b235dec789578d135a5db586b25c5870cb
commit: b0377116decdeecb8c6a928d59cd4bea00a4af6e [11468/12451] net: ethernet: Use device_get_match_data()
config: hexagon-randconfig-r005-20221019 (https://download.01.org/0day-ci/archive/20231017/202310170627.2Kvf6ZHY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170627.2Kvf6ZHY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170627.2Kvf6ZHY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/apm/xgene/xgene_enet_main.c:11:
   In file included from drivers/net/ethernet/apm/xgene/xgene_enet_main.h:15:
   In file included from include/linux/efi.h:20:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/net/ethernet/apm/xgene/xgene_enet_main.c:11:
   In file included from drivers/net/ethernet/apm/xgene/xgene_enet_main.h:15:
   In file included from include/linux/efi.h:20:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/ethernet/apm/xgene/xgene_enet_main.c:11:
   In file included from drivers/net/ethernet/apm/xgene/xgene_enet_main.h:15:
   In file included from include/linux/efi.h:20:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/net/ethernet/apm/xgene/xgene_enet_main.c:2004:34: warning: unused variable 'xgene_enet_of_match' [-Wunused-const-variable]
   static const struct of_device_id xgene_enet_of_match[] = {
                                    ^
   7 warnings generated.


vim +/xgene_enet_of_match +2004 drivers/net/ethernet/apm/xgene/xgene_enet_main.c

1f3d62090d3ba4 Arnd Bergmann 2017-02-01  2003  
1f3d62090d3ba4 Arnd Bergmann 2017-02-01 @2004  static const struct of_device_id xgene_enet_of_match[] = {
1f3d62090d3ba4 Arnd Bergmann 2017-02-01  2005  	{.compatible = "apm,xgene-enet",    .data = (void *)XGENE_ENET1},
1f3d62090d3ba4 Arnd Bergmann 2017-02-01  2006  	{.compatible = "apm,xgene1-sgenet", .data = (void *)XGENE_ENET1},
1f3d62090d3ba4 Arnd Bergmann 2017-02-01  2007  	{.compatible = "apm,xgene1-xgenet", .data = (void *)XGENE_ENET1},
1f3d62090d3ba4 Arnd Bergmann 2017-02-01  2008  	{.compatible = "apm,xgene2-sgenet", .data = (void *)XGENE_ENET2},
1f3d62090d3ba4 Arnd Bergmann 2017-02-01  2009  	{.compatible = "apm,xgene2-xgenet", .data = (void *)XGENE_ENET2},
1f3d62090d3ba4 Arnd Bergmann 2017-02-01  2010  	{},
1f3d62090d3ba4 Arnd Bergmann 2017-02-01  2011  };
1f3d62090d3ba4 Arnd Bergmann 2017-02-01  2012  

:::::: The code at line 2004 was first introduced by commit
:::::: 1f3d62090d3ba4d0c14e5271be87812fc577b197 xgene_enet: remove bogus forward declarations

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
