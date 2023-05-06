Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7281FDA;
	Sat,  6 May 2023 10:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683369073; x=1714905073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ARfK63+LM6yCmp/qNr1bcCc4U/jzHZzWZe71oQH/vQQ=;
  b=XuYER9in2Sc/TAot1tBseYWPGLskiXTutHM33ZpbgB4ttbbkGe/Mz26f
   JV66XVCjX1VXui+XoitRZruNZeLTsgmL+6KIUpckBOm9OLICw6imfcXpO
   QUnSJPB9lFdN6eAIVTTMn0U+0tHlBVitdNVcpccjOmOM8i2htVHlSF9Di
   FoZFFZpCEn3WQhf+VlMZmJeDcxBuGdzt/ZaJt0SAaO35jq3SQ3nvgxzpW
   jvljns7qA2PNkLE51B3I5vurVOiiDBI8iiM8paDVOQN6eXo/YAjQJZNbd
   utP5C2GoDlVolAM1XyHHcJqLZ3ClVXK4dDHIIa3J0HB8hI2fh0wFj8jna
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="377452402"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="377452402"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 03:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="822064372"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="822064372"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 May 2023 03:31:09 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvFC0-000089-30;
	Sat, 06 May 2023 10:31:08 +0000
Date: Sat, 6 May 2023 18:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.15 49/59]
 drivers/net/ethernet/intel/igc/igc_main.c:646:12: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202305061859.GS3g4PZY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
head:   b25577533173117fe3e262899303a3e3cb9a6ccd
commit: 93dc1f2a073d8317c289c566a7633e9d392ed063 [49/59] igc: read before write to SRRCTL register
config: i386-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230506/202305061859.GS3g4PZY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=93dc1f2a073d8317c289c566a7633e9d392ed063
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.15
        git checkout 93dc1f2a073d8317c289c566a7633e9d392ed063
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/intel/igc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061859.GS3g4PZY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/igc/igc_main.c:646:12: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
           srrctl |= IGC_SRRCTL_BSIZEHDR(IGC_RX_HDR_LEN);
                     ^
   drivers/net/ethernet/intel/igc/igc_base.h:92:33: note: expanded from macro 'IGC_SRRCTL_BSIZEHDR'
   #define IGC_SRRCTL_BSIZEHDR(x)          FIELD_PREP(IGC_SRRCTL_BSIZEHDR_MASK, \
                                           ^
   1 error generated.


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
