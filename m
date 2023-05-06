Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696DA2F2A;
	Sat,  6 May 2023 09:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683367151; x=1714903151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SLADtL8OYFspqkPhLtZLwyixBNYGS4ShUmq8ZG3g3hA=;
  b=EUD6QXdraY9pLLUyKsNgpxgeyNOyWf1MbHmJZaudo31svKS8wcnJLCsZ
   0rXMAr0MxNEAASqfNG4/gDwIhedJ/Iu8iqZY5my9NbWnFMvNwDptdk5pl
   ZSu3Qx/1JJgjrvQYYdO8X+dPURWxhw5hgzkjkBLOlZJVHsR10AF5O95/Y
   nMTx1kBcdUOxN31uFyuHphkzQyoPz1xdWvaB9H06NC8d0sEa/w/7kBM33
   UJ+CIX135lNjx+bN1VETvGsdUaezJ51uRNSpwKvZbkINJjZJEDEi/zkch
   EEs1mnk8rRiG5G0C7Mw2UEwgRVAwmN2t16jjVP0SqqHfX94mdCcL5BTUx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="352421680"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="352421680"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 02:59:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="944223786"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="944223786"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 May 2023 02:59:08 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvEh1-00007H-2D;
	Sat, 06 May 2023 09:59:07 +0000
Date: Sat, 6 May 2023 17:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/6.1 94/113]
 drivers/net/ethernet/intel/igc/igc_main.c:647:12: error: implicit
 declaration of function 'FIELD_PREP' is invalid in C99
Message-ID: <202305061722.QkUq9HdZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.1
head:   a3dcd1f09de2b628b6dbef91ab9e0a0a55d1192a
commit: 77f6495562cbd53c328e6b96a857859a22e1e8e6 [94/113] igc: read before write to SRRCTL register
config: i386-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230506/202305061722.QkUq9HdZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=77f6495562cbd53c328e6b96a857859a22e1e8e6
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/6.1
        git checkout 77f6495562cbd53c328e6b96a857859a22e1e8e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/intel/igc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061722.QkUq9HdZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/igc/igc_main.c:647:12: error: implicit declaration of function 'FIELD_PREP' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           srrctl |= IGC_SRRCTL_BSIZEHDR(IGC_RX_HDR_LEN);
                     ^
   drivers/net/ethernet/intel/igc/igc_base.h:92:33: note: expanded from macro 'IGC_SRRCTL_BSIZEHDR'
   #define IGC_SRRCTL_BSIZEHDR(x)          FIELD_PREP(IGC_SRRCTL_BSIZEHDR_MASK, \
                                           ^
   1 error generated.


vim +/FIELD_PREP +647 drivers/net/ethernet/intel/igc/igc_main.c

   584	
   585	/**
   586	 * igc_configure_rx_ring - Configure a receive ring after Reset
   587	 * @adapter: board private structure
   588	 * @ring: receive ring to be configured
   589	 *
   590	 * Configure the Rx unit of the MAC after a reset.
   591	 */
   592	static void igc_configure_rx_ring(struct igc_adapter *adapter,
   593					  struct igc_ring *ring)
   594	{
   595		struct igc_hw *hw = &adapter->hw;
   596		union igc_adv_rx_desc *rx_desc;
   597		int reg_idx = ring->reg_idx;
   598		u32 srrctl = 0, rxdctl = 0;
   599		u64 rdba = ring->dma;
   600		u32 buf_size;
   601	
   602		xdp_rxq_info_unreg_mem_model(&ring->xdp_rxq);
   603		ring->xsk_pool = igc_get_xsk_pool(adapter, ring);
   604		if (ring->xsk_pool) {
   605			WARN_ON(xdp_rxq_info_reg_mem_model(&ring->xdp_rxq,
   606							   MEM_TYPE_XSK_BUFF_POOL,
   607							   NULL));
   608			xsk_pool_set_rxq_info(ring->xsk_pool, &ring->xdp_rxq);
   609		} else {
   610			WARN_ON(xdp_rxq_info_reg_mem_model(&ring->xdp_rxq,
   611							   MEM_TYPE_PAGE_SHARED,
   612							   NULL));
   613		}
   614	
   615		if (igc_xdp_is_enabled(adapter))
   616			set_ring_uses_large_buffer(ring);
   617	
   618		/* disable the queue */
   619		wr32(IGC_RXDCTL(reg_idx), 0);
   620	
   621		/* Set DMA base address registers */
   622		wr32(IGC_RDBAL(reg_idx),
   623		     rdba & 0x00000000ffffffffULL);
   624		wr32(IGC_RDBAH(reg_idx), rdba >> 32);
   625		wr32(IGC_RDLEN(reg_idx),
   626		     ring->count * sizeof(union igc_adv_rx_desc));
   627	
   628		/* initialize head and tail */
   629		ring->tail = adapter->io_addr + IGC_RDT(reg_idx);
   630		wr32(IGC_RDH(reg_idx), 0);
   631		writel(0, ring->tail);
   632	
   633		/* reset next-to- use/clean to place SW in sync with hardware */
   634		ring->next_to_clean = 0;
   635		ring->next_to_use = 0;
   636	
   637		if (ring->xsk_pool)
   638			buf_size = xsk_pool_get_rx_frame_size(ring->xsk_pool);
   639		else if (ring_uses_large_buffer(ring))
   640			buf_size = IGC_RXBUFFER_3072;
   641		else
   642			buf_size = IGC_RXBUFFER_2048;
   643	
   644		srrctl = rd32(IGC_SRRCTL(reg_idx));
   645		srrctl &= ~(IGC_SRRCTL_BSIZEPKT_MASK | IGC_SRRCTL_BSIZEHDR_MASK |
   646			    IGC_SRRCTL_DESCTYPE_MASK);
 > 647		srrctl |= IGC_SRRCTL_BSIZEHDR(IGC_RX_HDR_LEN);
   648		srrctl |= IGC_SRRCTL_BSIZEPKT(buf_size);
   649		srrctl |= IGC_SRRCTL_DESCTYPE_ADV_ONEBUF;
   650	
   651		wr32(IGC_SRRCTL(reg_idx), srrctl);
   652	
   653		rxdctl |= IGC_RX_PTHRESH;
   654		rxdctl |= IGC_RX_HTHRESH << 8;
   655		rxdctl |= IGC_RX_WTHRESH << 16;
   656	
   657		/* initialize rx_buffer_info */
   658		memset(ring->rx_buffer_info, 0,
   659		       sizeof(struct igc_rx_buffer) * ring->count);
   660	
   661		/* initialize Rx descriptor 0 */
   662		rx_desc = IGC_RX_DESC(ring, 0);
   663		rx_desc->wb.upper.length = 0;
   664	
   665		/* enable receive descriptor fetching */
   666		rxdctl |= IGC_RXDCTL_QUEUE_ENABLE;
   667	
   668		wr32(IGC_RXDCTL(reg_idx), rxdctl);
   669	}
   670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
