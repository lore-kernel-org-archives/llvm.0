Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC628D312;
	Mon,  6 Mar 2023 05:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678081671; x=1709617671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+d4f42IdjvGUXh9cKraICvz/rAjy95Qo1vJM6Ryf2s=;
  b=I+tGjAUDok7pDcJxaqs+2vbQ9VBv5+frLDuXv1A6HCbFe6b9SErZc6IR
   nJkyWA/tbszCVsmixkPiKHyDInkSKYyFKISBtzpqRFzB9TRGGQcUvA5j/
   Asc29H4l7uTNrAmbU6+cVItzJanKVEk4tAGS+l4UeYytDPyddL4BAgkzw
   0kD0Rts4pxH/yRcFxTtojnTlxMHI9F7jajaFwBpTox46ZCALsbiQ+ZcLY
   EytxVZq13NhIA+ojDEkgD1Va6aF0jSQrsgaRWUnfCGQK24PTgw61EFFh+
   GvbNugHnl5lVFIRWg8eqcn2/ZisbGyb8curL/5ZXVgycLSPhYEk/Y1lyy
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="398059541"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="398059541"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 21:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="850178635"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="850178635"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Mar 2023 21:47:49 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ3hN-00004P-02;
	Mon, 06 Mar 2023 05:47:49 +0000
Date: Mon, 6 Mar 2023 13:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [broonie-ci:20230303_u_kleine_koenig_spi_convert_to_platform_remove_callback_returning_void
 9/87] drivers/spi/spi-bcm2835.c:1421:2: error: call to undeclared function
 'rbcm2835_spi_remove'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202303061352.BP6YH3Ja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20230303_u_kleine_koenig_spi_convert_to_platform_remove_callback_returning_void
head:   8428522b5b0063454f7a1fad16d405ebca87aeee
commit: b1c4089d04518212ffa1855e1557fe125f71f8a5 [9/87] spi: bcm2835: Convert to platform remove callback returning void
config: hexagon-randconfig-r014-20230305 (https://download.01.org/0day-ci/archive/20230306/202303061352.BP6YH3Ja-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=b1c4089d04518212ffa1855e1557fe125f71f8a5
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci 20230303_u_kleine_koenig_spi_convert_to_platform_remove_callback_returning_void
        git checkout b1c4089d04518212ffa1855e1557fe125f71f8a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061352.BP6YH3Ja-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spi/spi-bcm2835.c:18:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/spi/spi-bcm2835.c:18:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/spi/spi-bcm2835.c:18:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/spi/spi-bcm2835.c:1421:2: error: call to undeclared function 'rbcm2835_spi_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           rbcm2835_spi_remove(pdev);
           ^
   drivers/spi/spi-bcm2835.c:1421:2: note: did you mean 'bcm2835_spi_remove'?
   drivers/spi/spi-bcm2835.c:1401:13: note: 'bcm2835_spi_remove' declared here
   static void bcm2835_spi_remove(struct platform_device *pdev)
               ^
   6 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
   Depends on [n]: PM_DEVFREQ [=n]
   Selected by [y]:
   - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)


vim +/rbcm2835_spi_remove +1421 drivers/spi/spi-bcm2835.c

  1418	
  1419	static void bcm2835_spi_shutdown(struct platform_device *pdev)
  1420	{
> 1421		rbcm2835_spi_remove(pdev);
  1422	}
  1423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
