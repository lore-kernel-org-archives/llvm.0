Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED83B1C27;
	Sat,  4 Feb 2023 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675493021; x=1707029021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53XXRHMSCDSXEUVcwpaCNkcvDdFmHcYCQAs+KVgo0nA=;
  b=BOp2FA/MUK+pfEBKgnGRvwDthYHA4D4GliE2FNOZ8DJZe5LreKs05F/u
   cjRGQeg1auBx1MtrSv9uBictplJeOIFmjOClowcYTM+2M03FdAbf0kIYv
   qrzawcDYdz+Wacc9kgEtRsMrxdAasu7UE8ACB+enEOn4QWbW1eLChGJF3
   6OOEkJ8MYORttDdgtV1DWKaB16HXDsuve8nyfvaeJ6v1/fvr4vMBckBSr
   bdxhnUk7VlvUITSx8TNNpePIjQAN99ttHmubhMsmYNhd8ijGYKlCPWzaD
   qspmooc7s/jqOhMAQXFIryH3c5kOnd0AQoFrgSFjd1VHJ7ic4c3zYrBJz
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="393517073"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="393517073"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 22:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729490053"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="729490053"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 22:43:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOCGs-00016l-2r;
	Sat, 04 Feb 2023 06:43:34 +0000
Date: Sat, 4 Feb 2023 14:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sverdlin:ep93xx-dt 24/44] drivers/dma/ep93xx_dma.c:1520:21: error:
 use of undeclared identifier 'ep93xx_dma_of_ids'; did you mean
 'ep93xx_dma_of_probe'?
Message-ID: <202302041436.O2dZ3ZK8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sverdlin/linux ep93xx-dt
head:   1828eb1f87e53b70df4817b242fbea027e1e146c
commit: 2346afc58b3185221160dfbb977124f447cb7fe6 [24/44] dma: cirrus: add DT support for Cirrus EP93xx
config: hexagon-randconfig-r045-20230204 (https://download.01.org/0day-ci/archive/20230204/202302041436.O2dZ3ZK8-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sverdlin/linux/commit/2346afc58b3185221160dfbb977124f447cb7fe6
        git remote add sverdlin https://github.com/sverdlin/linux
        git fetch --no-tags sverdlin ep93xx-dt
        git checkout 2346afc58b3185221160dfbb977124f447cb7fe6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/dma/ep93xx_dma.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/dma/ep93xx_dma.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/dma/ep93xx_dma.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
>> drivers/dma/ep93xx_dma.c:1520:21: error: use of undeclared identifier 'ep93xx_dma_of_ids'; did you mean 'ep93xx_dma_of_probe'?
                   .of_match_table = ep93xx_dma_of_ids,
                                     ^~~~~~~~~~~~~~~~~
                                     ep93xx_dma_of_probe
   drivers/dma/ep93xx_dma.c:1388:12: note: 'ep93xx_dma_of_probe' declared here
   static int ep93xx_dma_of_probe(struct platform_device *pdev,
              ^
>> drivers/dma/ep93xx_dma.c:1520:21: error: incompatible pointer types initializing 'const struct of_device_id *' with an expression of type 'int (struct platform_device *, struct ep93xx_dma_engine *)' [-Werror,-Wincompatible-pointer-types]
                   .of_match_table = ep93xx_dma_of_ids,
                                     ^~~~~~~~~~~~~~~~~
   6 warnings and 2 errors generated.


vim +1520 drivers/dma/ep93xx_dma.c

  1516	
  1517	static struct platform_driver ep93xx_dma_driver = {
  1518		.driver		= {
  1519			.name	= "ep93xx-dma",
> 1520			.of_match_table = ep93xx_dma_of_ids,
  1521		},
  1522		.id_table	= ep93xx_dma_driver_ids,
  1523	};
  1524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
