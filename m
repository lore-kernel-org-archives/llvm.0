Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3EE882B;
	Sat,  6 May 2023 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683390085; x=1714926085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZB+AkW92jfIZlBvpLlVORKecXonM/RC3tdqlmfxeRj8=;
  b=Mz7PimtbOitQ4856mTPRCo2F/QhjqQEnmM5hfY0bUDIC5qUR/Pic51vH
   Fy1eHFq1Jqmq6Wkscp6s//MeGqmaxF/296DZ4NqAQ3IofFKPc90Dih/Tk
   CrywUNYEkhnyP/BWwhqOWmRtsHT0Yhm3lcXEAV6MbQRty/Q/Rgb1Q22xP
   Jt1SosUOb/XZnF9zyV4JlU5cAWS5y17BW2auXoVz0xTKtSwTnyoht/yPQ
   018J1ypcAzlmlljh58A0yBVdoih8d21HiTFROa8ep0OofysozrIAiWxe6
   eWNsr5TAu7jGDVe92oL6WVptG3RqXyPoRVyOsr3MNKYaDTYSOupKR39Zr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="414948207"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="414948207"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 09:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="787558022"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="787558022"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 May 2023 09:21:20 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvKeu-0000Oz-0E;
	Sat, 06 May 2023 16:21:20 +0000
Date: Sun, 7 May 2023 00:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.15 49/355]
 drivers/net/ethernet/intel/igc/igc_main.c:646:12: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202305070001.mYkVPIHh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
head:   0ba96946e8d1c0dcc8c05330cbe57c8bedae722a
commit: 17dad56cbca9e1123d8756e82bd840d930abad24 [49/355] igc: read before write to SRRCTL register
config: s390-randconfig-r021-20230430 (https://download.01.org/0day-ci/archive/20230507/202305070001.mYkVPIHh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=17dad56cbca9e1123d8756e82bd840d930abad24
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.15
        git checkout 17dad56cbca9e1123d8756e82bd840d930abad24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/ethernet/intel/igc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305070001.mYkVPIHh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/igc/igc_main.c:6:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/net/ethernet/intel/igc/igc_main.c:6:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/net/ethernet/intel/igc/igc_main.c:6:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/net/ethernet/intel/igc/igc_main.c:646:12: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
           srrctl |= IGC_SRRCTL_BSIZEHDR(IGC_RX_HDR_LEN);
                     ^
   drivers/net/ethernet/intel/igc/igc_base.h:92:33: note: expanded from macro 'IGC_SRRCTL_BSIZEHDR'
   #define IGC_SRRCTL_BSIZEHDR(x)          FIELD_PREP(IGC_SRRCTL_BSIZEHDR_MASK, \
                                           ^
   12 warnings and 1 error generated.


vim +/FIELD_PREP +646 drivers/net/ethernet/intel/igc/igc_main.c

   583	
   584	/**
   585	 * igc_configure_rx_ring - Configure a receive ring after Reset
   586	 * @adapter: board private structure
   587	 * @ring: receive ring to be configured
   588	 *
   589	 * Configure the Rx unit of the MAC after a reset.
   590	 */
   591	static void igc_configure_rx_ring(struct igc_adapter *adapter,
   592					  struct igc_ring *ring)
   593	{
   594		struct igc_hw *hw = &adapter->hw;
   595		union igc_adv_rx_desc *rx_desc;
   596		int reg_idx = ring->reg_idx;
   597		u32 srrctl = 0, rxdctl = 0;
   598		u64 rdba = ring->dma;
   599		u32 buf_size;
   600	
   601		xdp_rxq_info_unreg_mem_model(&ring->xdp_rxq);
   602		ring->xsk_pool = igc_get_xsk_pool(adapter, ring);
   603		if (ring->xsk_pool) {
   604			WARN_ON(xdp_rxq_info_reg_mem_model(&ring->xdp_rxq,
   605							   MEM_TYPE_XSK_BUFF_POOL,
   606							   NULL));
   607			xsk_pool_set_rxq_info(ring->xsk_pool, &ring->xdp_rxq);
   608		} else {
   609			WARN_ON(xdp_rxq_info_reg_mem_model(&ring->xdp_rxq,
   610							   MEM_TYPE_PAGE_SHARED,
   611							   NULL));
   612		}
   613	
   614		if (igc_xdp_is_enabled(adapter))
   615			set_ring_uses_large_buffer(ring);
   616	
   617		/* disable the queue */
   618		wr32(IGC_RXDCTL(reg_idx), 0);
   619	
   620		/* Set DMA base address registers */
   621		wr32(IGC_RDBAL(reg_idx),
   622		     rdba & 0x00000000ffffffffULL);
   623		wr32(IGC_RDBAH(reg_idx), rdba >> 32);
   624		wr32(IGC_RDLEN(reg_idx),
   625		     ring->count * sizeof(union igc_adv_rx_desc));
   626	
   627		/* initialize head and tail */
   628		ring->tail = adapter->io_addr + IGC_RDT(reg_idx);
   629		wr32(IGC_RDH(reg_idx), 0);
   630		writel(0, ring->tail);
   631	
   632		/* reset next-to- use/clean to place SW in sync with hardware */
   633		ring->next_to_clean = 0;
   634		ring->next_to_use = 0;
   635	
   636		if (ring->xsk_pool)
   637			buf_size = xsk_pool_get_rx_frame_size(ring->xsk_pool);
   638		else if (ring_uses_large_buffer(ring))
   639			buf_size = IGC_RXBUFFER_3072;
   640		else
   641			buf_size = IGC_RXBUFFER_2048;
   642	
   643		srrctl = rd32(IGC_SRRCTL(reg_idx));
   644		srrctl &= ~(IGC_SRRCTL_BSIZEPKT_MASK | IGC_SRRCTL_BSIZEHDR_MASK |
   645			    IGC_SRRCTL_DESCTYPE_MASK);
 > 646		srrctl |= IGC_SRRCTL_BSIZEHDR(IGC_RX_HDR_LEN);
   647		srrctl |= IGC_SRRCTL_BSIZEPKT(buf_size);
   648		srrctl |= IGC_SRRCTL_DESCTYPE_ADV_ONEBUF;
   649	
   650		wr32(IGC_SRRCTL(reg_idx), srrctl);
   651	
   652		rxdctl |= IGC_RX_PTHRESH;
   653		rxdctl |= IGC_RX_HTHRESH << 8;
   654		rxdctl |= IGC_RX_WTHRESH << 16;
   655	
   656		/* initialize rx_buffer_info */
   657		memset(ring->rx_buffer_info, 0,
   658		       sizeof(struct igc_rx_buffer) * ring->count);
   659	
   660		/* initialize Rx descriptor 0 */
   661		rx_desc = IGC_RX_DESC(ring, 0);
   662		rx_desc->wb.upper.length = 0;
   663	
   664		/* enable receive descriptor fetching */
   665		rxdctl |= IGC_RXDCTL_QUEUE_ENABLE;
   666	
   667		wr32(IGC_RXDCTL(reg_idx), rxdctl);
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
