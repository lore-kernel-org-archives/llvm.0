Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3435FEA2;
	Sat, 12 Aug 2023 01:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691802732; x=1723338732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Gxa8xaru17736R93LnjyTlrZlp8J/PogAt727PFvhs=;
  b=asRBGkrwTMwFHDoyd3JOQTw/uu9RlaW6u1in/xn+aZjXtCzbwV1rq9eR
   AoDFVoQzd+zO3pW+cf4fe0R+0koY85wnpgQJBOqv8VfZJ3whoX7D5HzFW
   XuTxpupc2Zy7e/iX604zZ4fosrlQ8q6oxRsK6FaBEQLKvtyaIYH1rpRA6
   yWOzy2dxCFk/vQDi7H0YkwLwjCqRJ3aavBtMWMI102vfPRvw7y3Dh3UiW
   ngl7Q6PPy4JI9dvL+GIpl3ZQlyzSeL0fS4GjRcm2AlGU+kG6qVOVz7w6o
   Q7JX8up0loJL/LHFLP8caLnAk7BJnj23f5k1opsgXjEErs9DGSof5GNDc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="435686225"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="435686225"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846957870"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="846957870"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 18:11:56 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUdAZ-0008AC-31;
	Sat, 12 Aug 2023 01:11:55 +0000
Date: Sat, 12 Aug 2023 09:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 15/24]
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:206:52: warning: implicit
 conversion from 'unsigned long long' to 'unsigned int' changes value from
 18446744073709551615 to 4294967295
Message-ID: <202308120941.MiHDMooo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   3e25c6d783287d7b5807e5df623589e7d53b64a8
commit: cba36ee4e7f4d5d50334a59f5a5af09605bfdde6 [15/24] pci: Add basic support for discovery of IDE on PCIe device
config: hexagon-randconfig-r045-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120941.MiHDMooo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120941.MiHDMooo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120941.MiHDMooo-lkp@intel.com/

All warnings (new ones prefixed by >>):

      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:21:
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.h:12:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2653:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1007:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     186 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:173:27: note: expanded from macro '_SIG_SET_OP'
     173 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                                  ^        ~
   include/linux/signal.h:185:24: note: expanded from macro '_sig_not'
     185 | #define _sig_not(x)     (~(x))
         |                            ^
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:21:
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.h:12:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2653:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1007:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     186 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:173:10: note: expanded from macro '_SIG_SET_OP'
     173 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:21:
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.h:12:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2653:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1007:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     186 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:20: note: expanded from macro '_SIG_SET_OP'
     174 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:185:24: note: expanded from macro '_sig_not'
     185 | #define _sig_not(x)     (~(x))
         |                            ^
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:21:
   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.h:12:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2653:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1007:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     186 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:3: note: expanded from macro '_SIG_SET_OP'
     174 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
>> drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:206:52: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     206 |         ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   36 warnings and 1 error generated.
--
   In file included from drivers/media/platform/samsung/exynos-gsc/gsc-core.c:14:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/samsung/exynos-gsc/gsc-core.c:14:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/samsung/exynos-gsc/gsc-core.c:14:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/samsung/exynos-gsc/gsc-core.c:26:
   In file included from drivers/media/platform/samsung/exynos-gsc/gsc-core.h:20:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:20:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   include/linux/pci.h:352:12: warning: declaration of 'enum pci_ide_stream_type' will not be visible outside of this function [-Wvisibility]
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
   include/linux/pci.h:352:32: error: variable has incomplete type 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                                                   ^
   include/linux/pci.h:352:12: note: forward declaration of 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
>> drivers/media/platform/samsung/exynos-gsc/gsc-core.c:1187:39: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1187 |         vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   8 warnings and 1 error generated.
--
   In file included from drivers/media/platform/samsung/s5p-g2d/g2d.c:15:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/samsung/s5p-g2d/g2d.c:15:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/samsung/s5p-g2d/g2d.c:15:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/samsung/s5p-g2d/g2d.c:19:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:20:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   include/linux/pci.h:352:12: warning: declaration of 'enum pci_ide_stream_type' will not be visible outside of this function [-Wvisibility]
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
   include/linux/pci.h:352:32: error: variable has incomplete type 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                                                   ^
   include/linux/pci.h:352:12: note: forward declaration of 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
>> drivers/media/platform/samsung/s5p-g2d/g2d.c:679:46: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     679 |         vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   8 warnings and 1 error generated.
--
   In file included from drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:11:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:11:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:11:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:23:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:20:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   include/linux/pci.h:352:12: warning: declaration of 'enum pci_ide_stream_type' will not be visible outside of this function [-Wvisibility]
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
   include/linux/pci.h:352:32: error: variable has incomplete type 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                                                   ^
   include/linux/pci.h:352:12: note: forward declaration of 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
>> drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:1183:6: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1183 |         vb2_dma_contig_set_max_seg_size(mfc_dev->mem_dev[BANK_L_CTX],
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1184 |                                         DMA_BIT_MASK(32));
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:1185:6: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1185 |         vb2_dma_contig_set_max_seg_size(mfc_dev->mem_dev[BANK_R_CTX],
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1186 |                                         DMA_BIT_MASK(32));
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:1241:39: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1241 |         vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   10 warnings and 1 error generated.


vim +206 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c

86698b9505bbc9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  104  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  105  static int mtk_mdp_probe(struct platform_device *pdev)
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  106  {
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  107  	struct mtk_mdp_dev *mdp;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  108  	struct device *dev = &pdev->dev;
ba1f1f70c2c08f drivers/media/platform/mtk-mdp/mtk_mdp_core.c Daniel Kurtz          2017-05-23  109  	struct device_node *node, *parent;
86698b9505bbc9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  110  	struct mtk_mdp_comp *comp, *comp_temp;
86698b9505bbc9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  111  	int ret = 0;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  112  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  113  	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  114  	if (!mdp)
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  115  		return -ENOMEM;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  116  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  117  	mdp->id = pdev->id;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  118  	mdp->pdev = pdev;
86698b9505bbc9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  119  	INIT_LIST_HEAD(&mdp->comp_list);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  120  	INIT_LIST_HEAD(&mdp->ctx_list);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  121  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  122  	mutex_init(&mdp->lock);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  123  	mutex_init(&mdp->vpulock);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  124  
ba1f1f70c2c08f drivers/media/platform/mtk-mdp/mtk_mdp_core.c Daniel Kurtz          2017-05-23  125  	/* Old dts had the components as child nodes */
864919ea0380e6 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Matthias Brugger      2019-06-21  126  	node = of_get_next_child(dev->of_node, NULL);
864919ea0380e6 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Matthias Brugger      2019-06-21  127  	if (node) {
864919ea0380e6 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Matthias Brugger      2019-06-21  128  		of_node_put(node);
ba1f1f70c2c08f drivers/media/platform/mtk-mdp/mtk_mdp_core.c Daniel Kurtz          2017-05-23  129  		parent = dev->of_node;
ba1f1f70c2c08f drivers/media/platform/mtk-mdp/mtk_mdp_core.c Daniel Kurtz          2017-05-23  130  		dev_warn(dev, "device tree is out of date\n");
ba1f1f70c2c08f drivers/media/platform/mtk-mdp/mtk_mdp_core.c Daniel Kurtz          2017-05-23  131  	} else {
ba1f1f70c2c08f drivers/media/platform/mtk-mdp/mtk_mdp_core.c Daniel Kurtz          2017-05-23  132  		parent = dev->of_node->parent;
ba1f1f70c2c08f drivers/media/platform/mtk-mdp/mtk_mdp_core.c Daniel Kurtz          2017-05-23  133  	}
ba1f1f70c2c08f drivers/media/platform/mtk-mdp/mtk_mdp_core.c Daniel Kurtz          2017-05-23  134  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  135  	/* Iterate over sibling MDP function blocks */
ba1f1f70c2c08f drivers/media/platform/mtk-mdp/mtk_mdp_core.c Daniel Kurtz          2017-05-23  136  	for_each_child_of_node(parent, node) {
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  137  		const struct of_device_id *of_id;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  138  		enum mtk_mdp_comp_type comp_type;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  139  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  140  		of_id = of_match_node(mtk_mdp_comp_dt_ids, node);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  141  		if (!of_id)
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  142  			continue;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  143  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  144  		if (!of_device_is_available(node)) {
68d9c47b1679ec drivers/media/platform/mtk-mdp/mtk_mdp_core.c Rob Herring           2017-07-21  145  			dev_err(dev, "Skipping disabled component %pOF\n",
68d9c47b1679ec drivers/media/platform/mtk-mdp/mtk_mdp_core.c Rob Herring           2017-07-21  146  				node);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  147  			continue;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  148  		}
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  149  
440aae04f38bf5 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Mauro Carvalho Chehab 2021-11-24  150  		comp_type = (uintptr_t)of_id->data;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  151  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  152  		comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  153  		if (!comp) {
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  154  			ret = -ENOMEM;
22ff7d4ca3f748 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Nishka Dasgupta       2019-07-09  155  			of_node_put(node);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  156  			goto err_comp;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  157  		}
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  158  
37e278c801078d drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  159  		ret = mtk_mdp_comp_init(dev, node, comp, comp_type);
22ff7d4ca3f748 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Nishka Dasgupta       2019-07-09  160  		if (ret) {
22ff7d4ca3f748 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Nishka Dasgupta       2019-07-09  161  			of_node_put(node);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  162  			goto err_comp;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  163  		}
86698b9505bbc9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  164  
86698b9505bbc9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  165  		mtk_mdp_register_component(mdp, comp);
22ff7d4ca3f748 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Nishka Dasgupta       2019-07-09  166  	}
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  167  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  168  	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  169  	if (!mdp->job_wq) {
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  170  		dev_err(&pdev->dev, "unable to alloc job workqueue\n");
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  171  		ret = -ENOMEM;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  172  		goto err_alloc_job_wq;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  173  	}
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  174  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  175  	mdp->wdt_wq = create_singlethread_workqueue("mdp_wdt_wq");
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  176  	if (!mdp->wdt_wq) {
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  177  		dev_err(&pdev->dev, "unable to alloc wdt workqueue\n");
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  178  		ret = -ENOMEM;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  179  		goto err_alloc_wdt_wq;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  180  	}
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  181  	INIT_WORK(&mdp->wdt_work, mtk_mdp_wdt_worker);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  182  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  183  	ret = v4l2_device_register(dev, &mdp->v4l2_dev);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  184  	if (ret) {
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  185  		dev_err(&pdev->dev, "Failed to register v4l2 device\n");
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  186  		ret = -EINVAL;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  187  		goto err_dev_register;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  188  	}
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  189  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  190  	ret = mtk_mdp_register_m2m_device(mdp);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  191  	if (ret) {
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  192  		v4l2_err(&mdp->v4l2_dev, "Failed to init mem2mem device\n");
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  193  		goto err_m2m_register;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  194  	}
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  195  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  196  	mdp->vpu_dev = vpu_get_plat_device(pdev);
ee18fc7b0b9517 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  197  	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  198  				  VPU_RST_MDP);
ee18fc7b0b9517 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  199  	if (ret) {
ee18fc7b0b9517 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  200  		dev_err(&pdev->dev, "Failed to register reset handler\n");
ee18fc7b0b9517 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  201  		goto err_m2m_register;
ee18fc7b0b9517 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  202  	}
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  203  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  204  	platform_set_drvdata(pdev, mdp);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  205  
256a12e1a343e1 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07 @206  	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
256a12e1a343e1 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  207  	if (ret) {
256a12e1a343e1 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  208  		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
256a12e1a343e1 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  209  		goto err_m2m_register;
256a12e1a343e1 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  210  	}
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  211  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  212  	pm_runtime_enable(dev);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  213  	dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  214  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  215  	return 0;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  216  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  217  err_m2m_register:
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  218  	v4l2_device_unregister(&mdp->v4l2_dev);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  219  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  220  err_dev_register:
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  221  	destroy_workqueue(mdp->wdt_wq);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  222  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  223  err_alloc_wdt_wq:
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  224  	destroy_workqueue(mdp->job_wq);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  225  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  226  err_alloc_job_wq:
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  227  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  228  err_comp:
86698b9505bbc9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  229  	list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
86698b9505bbc9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  230  		mtk_mdp_unregister_component(mdp, comp);
86698b9505bbc9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  231  		mtk_mdp_comp_deinit(dev, comp);
86698b9505bbc9 drivers/media/platform/mtk-mdp/mtk_mdp_core.c Eizan Miyamoto        2020-05-07  232  	}
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  233  
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  234  	dev_dbg(dev, "err %d\n", ret);
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  235  	return ret;
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  236  }
c8eb2d7e8202fd drivers/media/platform/mtk-mdp/mtk_mdp_core.c Minghsiu Tsai         2016-09-08  237  

:::::: The code at line 206 was first introduced by commit
:::::: 256a12e1a343e1efff00a9065063f0846d219336 media: mtk-mdp: handle vb2_dma_contig_set_max_seg_size errors during probe

:::::: TO: Eizan Miyamoto <eizan@chromium.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
