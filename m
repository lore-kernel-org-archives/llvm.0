Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A7B15CE;
	Thu,  7 Dec 2023 02:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AT1YYdjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701915723; x=1733451723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6UJrye13+9he0kh2Bl2TS8SowZ/Hi8F5/t6IqlrwEKk=;
  b=AT1YYdjQLlrUVXHlp7bo3zfG4uaKESvbULkXF1Uq474HjeIQSYRIB+x8
   dAYnEoEuG+HXKEqvwrnL1poXLRnAOSb/Rha9CbkKU4Dw1168ftJiC/CTl
   whRXuoOkkUfvC6QF9d5/C+fRkATRsidK/Z2t4PKdvrW4OYtmfj9uPHC5R
   q+5bIRriKFocMldeuilMLFhxcRd2aipYVwnS7suTuOYNoecp6En7lwSdE
   K32yxyWsP0nX/QCLUHBKLhM1j2kCrvf4I8n+3bwV0YKU8NU5pa2vIQkJx
   lfMsLd1uWO0UJopewsyQH3aWG7B4sSNDKZYU/RLoVE2k6ojbGtxWsokw3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12873134"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="12873134"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 18:22:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="747806041"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="747806041"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 06 Dec 2023 18:22:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB41T-000Bis-3A;
	Thu, 07 Dec 2023 02:21:56 +0000
Date: Thu, 7 Dec 2023 10:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sujuan Chen <sujuan.chen@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Rex Lu <rex.lu@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [nbd168-wireless:mt76 58/62]
 drivers/net/wireless/mediatek/mt76/mmio.c:146:39: warning: shift count >=
 width of type
Message-ID: <202312071044.ks9eUdyG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   131c05dd91da2a13df20d4e5671e7c90d510bf69
commit: 950aaa76922a903f2431d36e9093327dc0e8ff9c [58/62] wifi: mt76: mt7996: set DMA mask to 36 bits for boards with more than 4GB of RAM
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20231207/202312071044.ks9eUdyG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312071044.ks9eUdyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312071044.ks9eUdyG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76/mmio.c:6:
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/wireless/mediatek/mt76/mmio.c:6:
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/wireless/mediatek/mt76/mmio.c:6:
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mmio.c:146:39: warning: shift count >= width of type [-Wshift-count-overflow]
     146 |                         FIELD_PREP(MT_DMA_CTL_SDP0_H, addr >> 32);
         |                                                            ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                                               ^~~~
   include/linux/bitfield.h:68:41: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                                                       ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                                          ^~~~
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mmio.c:146:39: warning: shift count >= width of type [-Wshift-count-overflow]
     146 |                         FIELD_PREP(MT_DMA_CTL_SDP0_H, addr >> 32);
         |                                                            ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                                               ^~~~
   include/linux/bitfield.h:69:39: note: expanded from macro '__BF_FIELD_CHECK'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
         |                                                                   ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                                          ^~~~
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mmio.c:146:39: warning: shift count >= width of type [-Wshift-count-overflow]
     146 |                         FIELD_PREP(MT_DMA_CTL_SDP0_H, addr >> 32);
         |                                                            ^  ~~
   include/linux/bitfield.h:115:20: note: expanded from macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                  ^~~~
   9 warnings generated.


vim +146 drivers/net/wireless/mediatek/mt76/mmio.c

   110	
   111	u32 mt76_mmio_wed_init_rx_buf(struct mtk_wed_device *wed, int size)
   112	{
   113		struct mt76_dev *dev = container_of(wed, struct mt76_dev, mmio.wed);
   114		struct mtk_wed_bm_desc *desc = wed->rx_buf_ring.desc;
   115		struct mt76_queue *q = &dev->q_rx[MT_RXQ_MAIN];
   116		int i, len = SKB_WITH_OVERHEAD(q->buf_size);
   117		struct mt76_txwi_cache *t = NULL;
   118	
   119		for (i = 0; i < size; i++) {
   120			enum dma_data_direction dir;
   121			dma_addr_t addr;
   122			u32 offset;
   123			int token;
   124			void *buf;
   125	
   126			t = mt76_get_rxwi(dev);
   127			if (!t)
   128				goto unmap;
   129	
   130			buf = mt76_get_page_pool_buf(q, &offset, q->buf_size);
   131			if (!buf)
   132				goto unmap;
   133	
   134			addr = page_pool_get_dma_addr(virt_to_head_page(buf)) + offset;
   135			dir = page_pool_get_dma_dir(q->page_pool);
   136			dma_sync_single_for_device(dev->dma_dev, addr, len, dir);
   137	
   138			desc->buf0 = cpu_to_le32(addr);
   139			token = mt76_rx_token_consume(dev, buf, t, addr);
   140			if (token < 0) {
   141				mt76_put_page_pool_buf(buf, false);
   142				goto unmap;
   143			}
   144	
   145			token = FIELD_PREP(MT_DMA_CTL_TOKEN, token) |
 > 146				FIELD_PREP(MT_DMA_CTL_SDP0_H, addr >> 32);
   147			desc->token |= cpu_to_le32(token);
   148			desc++;
   149		}
   150	
   151		return 0;
   152	
   153	unmap:
   154		if (t)
   155			mt76_put_rxwi(dev, t);
   156		mt76_mmio_wed_release_rx_buf(wed);
   157	
   158		return -ENOMEM;
   159	}
   160	EXPORT_SYMBOL_GPL(mt76_mmio_wed_init_rx_buf);
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
