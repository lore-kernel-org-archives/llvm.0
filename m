Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2528188;
	Tue, 17 Oct 2023 00:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NalP6nNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697501768; x=1729037768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0ARAMviEoscBZLUZvYoBR/8PaPFjPFOsRoLfbc0sxo=;
  b=NalP6nNCHkIhXlXgjZrdHyRyq3AjgJ7PEwrXQjzIWXYtdCcM3Rg2tIUj
   d87sgM64pQVkPEon1OZhx0nmKDwscPv4/NLeHPyDhsOFit71DSoBgMXBw
   hPKj/4fhU2en4hFvD8fqcpGHcX/WjM9i9PnQqWfNHtoEKoWivN9Efpx1z
   Pi/rz8CTW5z7VkkJ1X6QVA/OsWmETZPsAefNpz6+ZLyXFHGHy9hRwa0Ey
   nu7tG1HAlHD1r6RyH+b+VmpO6rb2pGVYKZFIVoxWLQmt0SwA4QXuLT+6G
   8BskAtwYtRwknADInz+KjtaoqBX9JeS7jvv5w3PFlKwcWuSrDmi9MHtcV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="384540714"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="384540714"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 17:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="785284227"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="785284227"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Oct 2023 17:16:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsXkg-0008m3-2H;
	Tue, 17 Oct 2023 00:16:02 +0000
Date: Tue, 17 Oct 2023 08:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11471/12451]
 drivers/net/mdio/mdio-xgene.c:303:34: warning: unused variable
 'xgene_mdio_of_match'
Message-ID: <202310170832.xnVXw1bb-lkp@intel.com>
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
commit: a243ecc323b99f1042262319c1d77f1c52f0e307 [11471/12451] net: mdio: xgene: Use device_get_match_data()
config: hexagon-randconfig-r005-20221019 (https://download.01.org/0day-ci/archive/20231017/202310170832.xnVXw1bb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170832.xnVXw1bb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170832.xnVXw1bb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/mdio/mdio-xgene.c:11:
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
   In file included from drivers/net/mdio/mdio-xgene.c:11:
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
   In file included from drivers/net/mdio/mdio-xgene.c:11:
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
>> drivers/net/mdio/mdio-xgene.c:303:34: warning: unused variable 'xgene_mdio_of_match' [-Wunused-const-variable]
   static const struct of_device_id xgene_mdio_of_match[] = {
                                    ^
   7 warnings generated.


vim +/xgene_mdio_of_match +303 drivers/net/mdio/mdio-xgene.c

43b3cf6634a4ae drivers/net/phy/mdio-xgene.c Iyappan Subramanian 2016-07-25  302  
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01 @303  static const struct of_device_id xgene_mdio_of_match[] = {
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  304  	{
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  305  		.compatible = "apm,xgene-mdio-rgmii",
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  306  		.data = (void *)XGENE_MDIO_RGMII
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  307  	},
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  308  	{
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  309  		.compatible = "apm,xgene-mdio-xfi",
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  310  		.data = (void *)XGENE_MDIO_XFI
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  311  	},
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  312  	{},
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  313  };
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  314  MODULE_DEVICE_TABLE(of, xgene_mdio_of_match);
1f3d62090d3ba4 drivers/net/phy/mdio-xgene.c Arnd Bergmann       2017-02-01  315  

:::::: The code at line 303 was first introduced by commit
:::::: 1f3d62090d3ba4d0c14e5271be87812fc577b197 xgene_enet: remove bogus forward declarations

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
