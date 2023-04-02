Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873E03C02;
	Sun,  2 Apr 2023 13:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680443284; x=1711979284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zghgTPKo2PizWRrPZ5Q5olyY+CiEvUqerD0Ap0gayuQ=;
  b=ekg25x5Xpif/tHsUb9JOKjYlINa6ukw9HbEHGpEpExXuUaAR4p72IN+U
   0Cp3TC75k77XSNVgP2KlOYFNUj4ltCWGvK09H0qAIWIkL7GJo87BGFjny
   8B+fl+IsUc7v+qFd6klP3/YVCris3qytfYIJHA4PZp0us7O5t20cMOBIx
   VadHMNKhEzYuZhGYjvzmIH0+/nNtic16Tp2IPd/l63rG07Aurb9//1/3c
   Xf4V3IWn4E5pWZJIGX1fVsBTvBDmnTuWy6wCPQgm5dmhqgk1dfO5T03JT
   chM8N/e6B26LYDqn0w2uPeinL4HTSyTYa16AozyTkqGOa66Gq4AxPix8p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="321391333"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="321391333"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 06:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="679168965"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="679168965"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Apr 2023 06:48:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piy3t-000NQV-1S;
	Sun, 02 Apr 2023 13:48:01 +0000
Date: Sun, 2 Apr 2023 21:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/of-device-id-of-match-ptr-rebase 52/60]
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1849:2: error:
 unterminated conditional directive
Message-ID: <202304022118.udeI4dqF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/of-device-id-of-match-ptr-rebase
head:   19aae8d887a6fc883f9702fcf771d9630de95885
commit: cda1249763ec0e873aae2da18470d0009ca8f147 [52/60] media: platform: jpeg: always reference OF data
config: hexagon-randconfig-r034-20230402 (https://download.01.org/0day-ci/archive/20230402/202304022118.udeI4dqF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/cda1249763ec0e873aae2da18470d0009ca8f147
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/of-device-id-of-match-ptr-rebase
        git checkout cda1249763ec0e873aae2da18470d0009ca8f147
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/platform/mediatek/jpeg/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304022118.udeI4dqF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:11:
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
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:11:
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
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:11:
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
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1849:2: error: unterminated conditional directive
   #if defined(CONFIG_OF)
    ^
   6 warnings and 1 error generated.


vim +1849 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  1848  
4ae47770d57bff drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c oushixiong 2023-03-07 @1849  #if defined(CONFIG_OF)
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1850  static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1851  	.clks = mt8173_jpeg_dec_clocks,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1852  	.num_clks = ARRAY_SIZE(mt8173_jpeg_dec_clocks),
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1853  	.formats = mtk_jpeg_dec_formats,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1854  	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1855  	.qops = &mtk_jpeg_dec_qops,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1856  	.irq_handler = mtk_jpeg_dec_irq,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1857  	.hw_reset = mtk_jpeg_dec_reset,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1858  	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1859  	.dev_name = "mtk-jpeg-dec",
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1860  	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1861  	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1862  	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1863  };
b4a82f5d15102a drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  1864  

:::::: The code at line 1849 was first introduced by commit
:::::: 4ae47770d57bff0193fbbf48d56c18759cad5f6e media: mtk-jpegenc: Fix a compilation issue

:::::: TO: oushixiong <oushixiong@kylinos.cn>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
