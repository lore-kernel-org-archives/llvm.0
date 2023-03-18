Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D08EEC0;
	Sat, 18 Mar 2023 10:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679134484; x=1710670484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34Cdav+srKzurHTVWvsTRzEd+5Ez5b5snNnDPXC95Sw=;
  b=FnpLZsErUO2FGnaxJRtVTzp80DxCVJ7Q18/RsX5QlERRBCxm9DaYTb0J
   MXv6ifsNKmDXG3XrDumhNgbEYETzU83VS8tyhwWdWKSoAi+YeUJt2YR7J
   gk/fq4MAKRbfbLgK9f8oaStGDwr0Irv+H5NAnwNBm3CoYEBHOzDZZE6NN
   rjcYi9obcd2jLGRZ+3RKaC8cv5pE0+Xfw7JrS106KkKaZ+cKtgu5Wxt6I
   CaXefjcg5PHwyedtbsFjLqiLcdtqyGQ0X8X3XfVqow/7mNwAT178TCZ0k
   knL38d9W8220rDzglQoxxiOZ0w9t+Z5Xra5tv8sBRRGnFlFBAsAihIU3j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="322271374"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="322271374"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 03:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="926439268"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="926439268"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Mar 2023 03:14:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdTaD-0009zm-0Q;
	Sat, 18 Mar 2023 10:14:41 +0000
Date: Sat, 18 Mar 2023 18:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [sverdlin:ep93xx-snd-wip 24/48] drivers/dma/ep93xx_dma.c:1520:21:
 error: use of undeclared identifier 'ep93xx_dma_of_ids'; did you mean
 'ep93xx_dma_of_probe'?
Message-ID: <202303181828.7KkZo8lU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sverdlin/linux ep93xx-snd-wip
head:   ba6048c19f4e119e9d76024c66e205a7f6750063
commit: 4b4b4097c04f5f15cf607967eb050b5ab4583fbc [24/48] dma: cirrus: add DT support for Cirrus EP93xx
config: hexagon-randconfig-r041-20230312 (https://download.01.org/0day-ci/archive/20230318/202303181828.7KkZo8lU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sverdlin/linux/commit/4b4b4097c04f5f15cf607967eb050b5ab4583fbc
        git remote add sverdlin https://github.com/sverdlin/linux
        git fetch --no-tags sverdlin ep93xx-snd-wip
        git checkout 4b4b4097c04f5f15cf607967eb050b5ab4583fbc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181828.7KkZo8lU-lkp@intel.com/

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
