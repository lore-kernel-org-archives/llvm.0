Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6652567
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644662384; x=1676198384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U0oyazIgdr8BRlcbnAi2qE4iTWDo/NuzE6ByBJmMMzs=;
  b=BiLmmsZ7AsPWwf0aMztZQB/Cv1qVgbCYl/ulHzpufe2UIZWCMd6mPaFm
   uxNjiqt/qVinGtATOfs/+8x1s+FJ4vluYL9bD+lb1ebL9edGBdFYKH+YO
   Ocf8zV9apOXR5WV935+1TAJh/q35s0WU0TvvoNxphfpO9FaChG5NApFCK
   G0m042bVJZNUv5Na/XJRhB8jryXzrzF1XfXTNYz15qiW4CS0am7FXl2IU
   w4+hx13ux/+eARL1CPLPC+B5hjWb70gl6SOr4wAzP//a9AzHtfW1e370a
   mBKveFlLmwZRfZUdMriM7ZDSaPZLZ2HpGUY/f7dDz5tiUt/RHaG78+5C5
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="247465976"
X-IronPort-AV: E=Sophos;i="5.88,363,1635231600"; 
   d="scan'208";a="247465976"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2022 02:39:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,363,1635231600"; 
   d="scan'208";a="527258959"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Feb 2022 02:39:41 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIpob-00061X-37; Sat, 12 Feb 2022 10:39:41 +0000
Date: Sat, 12 Feb 2022 18:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [nbd168-wireless:mtk-flow-offload 3/9]
 drivers/net/ethernet/mediatek/mtk_wed.h:33:20: error: no member named 'hw'
 in 'struct mtk_wed_device'
Message-ID: <202202121626.jCM5m8Oy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/nbd168/wireless mtk-flow-offload
head:   1ba2137278dd5c4747b6e43be7aae4e94fb9c76e
commit: b3eab9db70af66f3ce1415f2e51750b15df268c9 [3/9] net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)
config: arm64-randconfig-r022-20220211 (https://download.01.org/0day-ci/archive/20220212/202202121626.jCM5m8Oy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c7eb84634519e6497be42f5fe323f9a04ed67127)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/nbd168/wireless/commit/b3eab9db70af66f3ce1415f2e51750b15df268c9
        git remote add nbd168-wireless https://github.com/nbd168/wireless
        git fetch --no-tags nbd168-wireless mtk-flow-offload
        git checkout b3eab9db70af66f3ce1415f2e51750b15df268c9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:27:
>> drivers/net/ethernet/mediatek/mtk_wed.h:33:20: error: no member named 'hw' in 'struct mtk_wed_device'
           regmap_write(dev->hw->regs, reg, val);
                        ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:41:19: error: no member named 'hw' in 'struct mtk_wed_device'
           regmap_read(dev->hw->regs, reg, &val);
                       ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:49:19: error: no member named 'hw' in 'struct mtk_wed_device'
           writel(val, dev->hw->wdma + reg);
                       ~~~  ^
   arch/arm64/include/asm/io.h:142:56: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
                                                                     ^
   arch/arm64/include/asm/io.h:127:78: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
                                                                                    ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:27:
   drivers/net/ethernet/mediatek/mtk_wed.h:55:20: error: no member named 'hw' in 'struct mtk_wed_device'
           return readl(dev->hw->wdma + reg);
                        ~~~  ^
   arch/arm64/include/asm/io.h:137:46: note: expanded from macro 'readl'
   #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(__v); __v; })
                                                              ^
   arch/arm64/include/asm/io.h:122:79: note: expanded from macro 'readl_relaxed'
   #define readl_relaxed(c)        ({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
                                                                                        ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:27:
>> drivers/net/ethernet/mediatek/mtk_wed.h:61:12: error: no member named 'tx_ring' in 'struct mtk_wed_device'
           if (!dev->tx_ring[ring].wpdma)
                ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:64:20: error: no member named 'tx_ring' in 'struct mtk_wed_device'
           return readl(dev->tx_ring[ring].wpdma + reg);
                        ~~~  ^
   arch/arm64/include/asm/io.h:137:46: note: expanded from macro 'readl'
   #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(__v); __v; })
                                                              ^
   arch/arm64/include/asm/io.h:122:79: note: expanded from macro 'readl_relaxed'
   #define readl_relaxed(c)        ({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
                                                                                        ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:27:
   drivers/net/ethernet/mediatek/mtk_wed.h:70:12: error: no member named 'tx_ring' in 'struct mtk_wed_device'
           if (!dev->tx_ring[ring].wpdma)
                ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:73:19: error: no member named 'tx_ring' in 'struct mtk_wed_device'
           writel(val, dev->tx_ring[ring].wpdma + reg);
                       ~~~  ^
   arch/arm64/include/asm/io.h:142:56: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
                                                                     ^
   arch/arm64/include/asm/io.h:127:78: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
                                                                                    ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:27:
>> drivers/net/ethernet/mediatek/mtk_wed.h:79:12: error: no member named 'txfree_ring' in 'struct mtk_wed_device'
           if (!dev->txfree_ring.wpdma)
                ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:82:20: error: no member named 'txfree_ring' in 'struct mtk_wed_device'
           return readl(dev->txfree_ring.wpdma + reg);
                        ~~~  ^
   arch/arm64/include/asm/io.h:137:46: note: expanded from macro 'readl'
   #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(__v); __v; })
                                                              ^
   arch/arm64/include/asm/io.h:122:79: note: expanded from macro 'readl_relaxed'
   #define readl_relaxed(c)        ({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
                                                                                        ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:27:
   drivers/net/ethernet/mediatek/mtk_wed.h:88:12: error: no member named 'txfree_ring' in 'struct mtk_wed_device'
           if (!dev->txfree_ring.wpdma)
                ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:91:19: error: no member named 'txfree_ring' in 'struct mtk_wed_device'
           writel(val, dev->txfree_ring.wpdma + reg);
                       ~~~  ^
   arch/arm64/include/asm/io.h:142:56: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
                                                                     ^
   arch/arm64/include/asm/io.h:127:78: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
                                                                                    ^
   12 errors generated.
--
   In file included from drivers/net/ethernet/mediatek/mtk_wed.c:17:
>> drivers/net/ethernet/mediatek/mtk_wed.h:33:20: error: no member named 'hw' in 'struct mtk_wed_device'
           regmap_write(dev->hw->regs, reg, val);
                        ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:41:19: error: no member named 'hw' in 'struct mtk_wed_device'
           regmap_read(dev->hw->regs, reg, &val);
                       ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:49:19: error: no member named 'hw' in 'struct mtk_wed_device'
           writel(val, dev->hw->wdma + reg);
                       ~~~  ^
   arch/arm64/include/asm/io.h:142:56: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
                                                                     ^
   arch/arm64/include/asm/io.h:127:78: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
                                                                                    ^
   In file included from drivers/net/ethernet/mediatek/mtk_wed.c:17:
   drivers/net/ethernet/mediatek/mtk_wed.h:55:20: error: no member named 'hw' in 'struct mtk_wed_device'
           return readl(dev->hw->wdma + reg);
                        ~~~  ^
   arch/arm64/include/asm/io.h:137:46: note: expanded from macro 'readl'
   #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(__v); __v; })
                                                              ^
   arch/arm64/include/asm/io.h:122:79: note: expanded from macro 'readl_relaxed'
   #define readl_relaxed(c)        ({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
                                                                                        ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/ethernet/mediatek/mtk_wed.c:17:
>> drivers/net/ethernet/mediatek/mtk_wed.h:61:12: error: no member named 'tx_ring' in 'struct mtk_wed_device'
           if (!dev->tx_ring[ring].wpdma)
                ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:64:20: error: no member named 'tx_ring' in 'struct mtk_wed_device'
           return readl(dev->tx_ring[ring].wpdma + reg);
                        ~~~  ^
   arch/arm64/include/asm/io.h:137:46: note: expanded from macro 'readl'
   #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(__v); __v; })
                                                              ^
   arch/arm64/include/asm/io.h:122:79: note: expanded from macro 'readl_relaxed'
   #define readl_relaxed(c)        ({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
                                                                                        ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/ethernet/mediatek/mtk_wed.c:17:
   drivers/net/ethernet/mediatek/mtk_wed.h:70:12: error: no member named 'tx_ring' in 'struct mtk_wed_device'
           if (!dev->tx_ring[ring].wpdma)
                ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:73:19: error: no member named 'tx_ring' in 'struct mtk_wed_device'
           writel(val, dev->tx_ring[ring].wpdma + reg);
                       ~~~  ^
   arch/arm64/include/asm/io.h:142:56: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
                                                                     ^
   arch/arm64/include/asm/io.h:127:78: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
                                                                                    ^
   In file included from drivers/net/ethernet/mediatek/mtk_wed.c:17:
>> drivers/net/ethernet/mediatek/mtk_wed.h:79:12: error: no member named 'txfree_ring' in 'struct mtk_wed_device'
           if (!dev->txfree_ring.wpdma)
                ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:82:20: error: no member named 'txfree_ring' in 'struct mtk_wed_device'
           return readl(dev->txfree_ring.wpdma + reg);
                        ~~~  ^
   arch/arm64/include/asm/io.h:137:46: note: expanded from macro 'readl'
   #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(__v); __v; })
                                                              ^
   arch/arm64/include/asm/io.h:122:79: note: expanded from macro 'readl_relaxed'
   #define readl_relaxed(c)        ({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
                                                                                        ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/ethernet/mediatek/mtk_wed.c:17:
   drivers/net/ethernet/mediatek/mtk_wed.h:88:12: error: no member named 'txfree_ring' in 'struct mtk_wed_device'
           if (!dev->txfree_ring.wpdma)
                ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.h:91:19: error: no member named 'txfree_ring' in 'struct mtk_wed_device'
           writel(val, dev->txfree_ring.wpdma + reg);
                       ~~~  ^
   arch/arm64/include/asm/io.h:142:56: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed((v),(c)); })
                                                                     ^
   arch/arm64/include/asm/io.h:127:78: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
                                                                                    ^
>> drivers/net/ethernet/mediatek/mtk_wed.c:35:26: error: no member named 'hw' in 'struct mtk_wed_device'
           regmap_update_bits(dev->hw->regs, reg, mask | val, val);
                              ~~~  ^
>> drivers/net/ethernet/mediatek/mtk_wed.c:84:34: error: no member named 'wlan' in 'struct mtk_wed_device'
           hw = hw_list[pci_domain_nr(dev->wlan.pci_dev->bus)];
                                      ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.c:98:19: error: no member named 'wlan' in 'struct mtk_wed_device'
           int token = dev->wlan.token_start;
                       ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.c:103:19: error: no member named 'wlan' in 'struct mtk_wed_device'
           ring_size = dev->wlan.nbuf & ~(MTK_WED_BUF_PER_PAGE - 1);
                       ~~~  ^
>> drivers/net/ethernet/mediatek/mtk_wed.c:110:7: error: no member named 'buf_ring' in 'struct mtk_wed_device'
           dev->buf_ring.size = ring_size;
           ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.c:111:7: error: no member named 'buf_ring' in 'struct mtk_wed_device'
           dev->buf_ring.pages = page_list;
           ~~~  ^
   drivers/net/ethernet/mediatek/mtk_wed.c:113:33: error: no member named 'hw' in 'struct mtk_wed_device'
           desc = dma_alloc_coherent(dev->hw->dev, ring_size * sizeof(*desc),
                                     ~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +33 drivers/net/ethernet/mediatek/mtk_wed.h

    29	
    30	static inline void
    31	wed_w32(struct mtk_wed_device *dev, u32 reg, u32 val)
    32	{
  > 33		regmap_write(dev->hw->regs, reg, val);
    34	}
    35	
    36	static inline u32
    37	wed_r32(struct mtk_wed_device *dev, u32 reg)
    38	{
    39		unsigned int val;
    40	
    41		regmap_read(dev->hw->regs, reg, &val);
    42	
    43		return val;
    44	}
    45	
    46	static inline void
    47	wdma_w32(struct mtk_wed_device *dev, u32 reg, u32 val)
    48	{
    49		writel(val, dev->hw->wdma + reg);
    50	}
    51	
    52	static inline u32
    53	wdma_r32(struct mtk_wed_device *dev, u32 reg)
    54	{
    55		return readl(dev->hw->wdma + reg);
    56	}
    57	
    58	static inline u32
    59	wpdma_tx_r32(struct mtk_wed_device *dev, int ring, u32 reg)
    60	{
  > 61		if (!dev->tx_ring[ring].wpdma)
    62			return 0;
    63	
    64		return readl(dev->tx_ring[ring].wpdma + reg);
    65	}
    66	
    67	static inline void
    68	wpdma_tx_w32(struct mtk_wed_device *dev, int ring, u32 reg, u32 val)
    69	{
    70		if (!dev->tx_ring[ring].wpdma)
    71			return;
    72	
    73		writel(val, dev->tx_ring[ring].wpdma + reg);
    74	}
    75	
    76	static inline u32
    77	wpdma_txfree_r32(struct mtk_wed_device *dev, u32 reg)
    78	{
  > 79		if (!dev->txfree_ring.wpdma)
    80			return 0;
    81	
    82		return readl(dev->txfree_ring.wpdma + reg);
    83	}
    84	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
