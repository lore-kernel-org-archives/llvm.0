Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7D6749D;
	Fri, 26 May 2023 07:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685085626; x=1716621626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lNgEdCfNUEraK1mHFPX0QaG0cCW/Tg8XiCz83h0NIIg=;
  b=ayAG2d7gR8VF2GVN10TBuwrWz9fzXAdd4bFP1tbzHlPFmoDmnDP25SZ+
   G1cP0VrKE8dsIO29VBicrC48w6Efp+vyIh/lcg1SN3H3HW7i2x9X4J1Br
   sLPE96PVxSoqFxl4UkjlGhquymokRGTYeUam0+ZeH+VGT5LwvOKMSWT/6
   z1PMymUsRvHB3p1NJx13BquDRNTOTEsNu4co3AZY5SK2gb+RKEAqYeMdl
   zXCNdkTu7ICXLj9dbguSGZtQvsWZxOfOprmPVg2GDQqdVxMcqCozkH0Zt
   xniODQFTXSkwMxv0Op4SMwIO/8pEcakW7+ug4sLXyG6lNGj9+f6TTi+Kh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="356523690"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="356523690"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 00:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="738152276"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="738152276"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 May 2023 00:20:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2RkL-000J95-3C;
	Fri, 26 May 2023 07:20:21 +0000
Date: Fri, 26 May 2023 15:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm64:devel/kmalloc-minalign 13/15]
 include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in
 'struct scatterlist'
Message-ID: <202305261555.rLVUFPtf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git devel/kmalloc-minalign
head:   d929a28c8da3f1bc095e4aa0d1b811972929351a
commit: f0b92f544e6b440500c3823c7c47b542816cb4cd [13/15] iommu/dma: Force bouncing if the size is not cacheline-aligned
config: x86_64-randconfig-x064-20230524 (https://download.01.org/0day-ci/archive/20230526/202305261555.rLVUFPtf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=f0b92f544e6b440500c3823c7c47b542816cb4cd
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch --no-tags arm64 devel/kmalloc-minalign
        git checkout f0b92f544e6b440500c3823c7c47b542816cb4cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261555.rLVUFPtf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hid/hid-core.c:33:
   In file included from include/linux/hid-debug.h:14:
   In file included from include/linux/kfifo.h:42:
>> include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in 'struct scatterlist'
           return sg->dma_flags & SG_DMA_USE_SWIOTLB;
                  ~~  ^
   include/linux/scatterlist.h:262:6: error: no member named 'dma_flags' in 'struct scatterlist'
           sg->dma_flags |= SG_DMA_USE_SWIOTLB;
           ~~  ^
   2 errors generated.
--
   In file included from drivers/gpu/drm/vgem/vgem_drv.c:33:
   In file included from include/linux/dma-buf.h:19:
>> include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in 'struct scatterlist'
           return sg->dma_flags & SG_DMA_USE_SWIOTLB;
                  ~~  ^
   include/linux/scatterlist.h:262:6: error: no member named 'dma_flags' in 'struct scatterlist'
           sg->dma_flags |= SG_DMA_USE_SWIOTLB;
           ~~  ^
   drivers/gpu/drm/vgem/vgem_drv.c:144:10: warning: shift count >= width of type [-Wshift-count-overflow]
                                        DMA_BIT_MASK(64));
                                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/most/most_cdev.c:15:
   In file included from include/linux/kfifo.h:42:
>> include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in 'struct scatterlist'
           return sg->dma_flags & SG_DMA_USE_SWIOTLB;
                  ~~  ^
   include/linux/scatterlist.h:262:6: error: no member named 'dma_flags' in 'struct scatterlist'
           sg->dma_flags |= SG_DMA_USE_SWIOTLB;
           ~~  ^
   drivers/most/most_cdev.c:449:2: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           INIT_KFIFO(c->fifo);
           ^~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:130:69: note: expanded from macro 'INIT_KFIFO'
           __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : ARRAY_SIZE(__tmp->buf) - 1;\
                         ~                             ~~~~~~~~~~~~~~~~~~~~~~~^~~
   1 warning and 2 errors generated.
--
   In file included from drivers/net/ethernet/intel/e1000/e1000_main.c:4:
   In file included from drivers/net/ethernet/intel/e1000/e1000.h:16:
   In file included from include/linux/pci.h:1591:
   In file included from include/linux/dmapool.h:14:
>> include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in 'struct scatterlist'
           return sg->dma_flags & SG_DMA_USE_SWIOTLB;
                  ~~  ^
   include/linux/scatterlist.h:262:6: error: no member named 'dma_flags' in 'struct scatterlist'
           sg->dma_flags |= SG_DMA_USE_SWIOTLB;
           ~~  ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1002:45: warning: shift count >= width of type [-Wshift-count-overflow]
               !dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
                                                      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/virtio/virtio_mmio.c:58:
   In file included from include/linux/dma-mapping.h:10:
>> include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in 'struct scatterlist'
           return sg->dma_flags & SG_DMA_USE_SWIOTLB;
                  ~~  ^
   include/linux/scatterlist.h:262:6: error: no member named 'dma_flags' in 'struct scatterlist'
           sg->dma_flags |= SG_DMA_USE_SWIOTLB;
           ~~  ^
   drivers/virtio/virtio_mmio.c:666:33: warning: shift count >= width of type [-Wshift-count-overflow]
                   rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
                                                 ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   drivers/virtio/virtio_mmio.c:675:46: warning: shift count >= width of type [-Wshift-count-overflow]
                   rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   2 warnings and 2 errors generated.
--
   In file included from drivers/vdpa/vdpa.c:13:
   In file included from include/linux/vdpa.h:9:
   In file included from include/linux/virtio_net.h:5:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:10:
>> include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in 'struct scatterlist'
           return sg->dma_flags & SG_DMA_USE_SWIOTLB;
                  ~~  ^
   include/linux/scatterlist.h:262:6: error: no member named 'dma_flags' in 'struct scatterlist'
           sg->dma_flags |= SG_DMA_USE_SWIOTLB;
           ~~  ^
   drivers/vdpa/vdpa.c:43:37: warning: shift count >= width of type [-Wshift-count-overflow]
           ret = dma_set_mask_and_coherent(d, DMA_BIT_MASK(64));
                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/vdpa/vdpa_sim/vdpa_sim.c:16:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:10:
>> include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in 'struct scatterlist'
           return sg->dma_flags & SG_DMA_USE_SWIOTLB;
                  ~~  ^
   include/linux/scatterlist.h:262:6: error: no member named 'dma_flags' in 'struct scatterlist'
           sg->dma_flags |= SG_DMA_USE_SWIOTLB;
           ~~  ^
   drivers/vdpa/vdpa_sim/vdpa_sim.c:238:37: warning: shift count >= width of type [-Wshift-count-overflow]
           if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/tty/tty_port.c:8:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
>> include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in 'struct scatterlist'
           return sg->dma_flags & SG_DMA_USE_SWIOTLB;
                  ~~  ^
   include/linux/scatterlist.h:262:6: error: no member named 'dma_flags' in 'struct scatterlist'
           sg->dma_flags |= SG_DMA_USE_SWIOTLB;
           ~~  ^
   drivers/tty/tty_port.c:266:2: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           INIT_KFIFO(port->xmit_fifo);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:130:69: note: expanded from macro 'INIT_KFIFO'
           __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : ARRAY_SIZE(__tmp->buf) - 1;\
                         ~                             ~~~~~~~~~~~~~~~~~~~~~~~^~~
   1 warning and 2 errors generated.
--
   In file included from drivers/gpu/drm/drm_gem.c:28:
   In file included from include/linux/dma-buf.h:19:
>> include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in 'struct scatterlist'
           return sg->dma_flags & SG_DMA_USE_SWIOTLB;
                  ~~  ^
   include/linux/scatterlist.h:262:6: error: no member named 'dma_flags' in 'struct scatterlist'
           sg->dma_flags |= SG_DMA_USE_SWIOTLB;
           ~~  ^
   In file included from drivers/gpu/drm/drm_gem.c:34:
   include/linux/mman.h:154:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:132:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/dma-buf/udmabuf.c:4:
   In file included from include/linux/dma-buf.h:19:
>> include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in 'struct scatterlist'
           return sg->dma_flags & SG_DMA_USE_SWIOTLB;
                  ~~  ^
   include/linux/scatterlist.h:262:6: error: no member named 'dma_flags' in 'struct scatterlist'
           sg->dma_flags |= SG_DMA_USE_SWIOTLB;
           ~~  ^
   drivers/dma-buf/udmabuf.c:414:9: warning: shift count >= width of type [-Wshift-count-overflow]
                                              DMA_BIT_MASK(64));
                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/mmc/core/sd.c:16:
>> include/linux/scatterlist.h:257:13: error: no member named 'dma_flags' in 'struct scatterlist'
           return sg->dma_flags & SG_DMA_USE_SWIOTLB;
                  ~~  ^
   include/linux/scatterlist.h:262:6: error: no member named 'dma_flags' in 'struct scatterlist'
           sg->dma_flags |= SG_DMA_USE_SWIOTLB;
           ~~  ^
   drivers/mmc/core/sd.c:106:22: warning: shift count >= width of type [-Wshift-count-overflow]
           card->cid.serial                = UNSTUFF_BITS(resp, 24, 32);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd.c:61:39: note: expanded from macro 'UNSTUFF_BITS'
                   const u32 __mask = (__size < 32 ? 1 << __size : 0) - 1; \
                                                       ^  ~~~~~~
   1 warning and 2 errors generated.
..


vim +257 include/linux/scatterlist.h

   253	
   254	#ifdef CONFIG_SWIOTLB
   255	static inline bool sg_is_dma_use_swiotlb(struct scatterlist *sg)
   256	{
 > 257		return sg->dma_flags & SG_DMA_USE_SWIOTLB;
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
