Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDB9168
	for <llvm@lists.linux.dev>; Wed, 29 Dec 2021 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640772661; x=1672308661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lGf6/X9BDj8lFtPmeErN4ZyizHYoRMyWvIbeu13QZO0=;
  b=TY/ZavsPUDEkiFPt8Ziepnpd8QfaRtTrjujiz+s6KKVpPStNuezS2Auh
   Jb36nMkKoIaNWFXczKPqKV+XkzLZaKgy/iuxdbM0GRZOxxlYkRkKhXHkO
   kFhzulhPWNdcypNZjWlVl4mo+VNFvSimcZkk3O0HsQRn0PFGvIFGfmzmo
   KCrgvz7bkSfXMaGDxjWCj/4vfCRIHklPDVirkous9Z8ojjchtsio/8Ees
   +6NJky73JmLJoNC9WbMFpmu33qGW8XPAnlE6nk7t/Rm89eA1tTmSBX6SG
   Gdifrq/rdIhbOY4R7iMV39iZ7V2eGyasgzBTPexxdCl1l9NMxzbFz9lxx
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="240281952"
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="240281952"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2021 02:11:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="468433080"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Dec 2021 02:10:59 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n2Vv8-0008oz-ED; Wed, 29 Dec 2021 10:10:58 +0000
Date: Wed, 29 Dec 2021 18:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH bpf-next v2 3/4] ice: xsk: improve AF_XDP ZC Tx and use
 batching API
Message-ID: <202112291846.LmSTdxbq-lkp@intel.com>
References: <20211216135958.3434-4-maciej.fijalkowski@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216135958.3434-4-maciej.fijalkowski@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Maciej,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Maciej-Fijalkowski/xsk-Tx-improvements/20211216-220139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: riscv-randconfig-r042-20211228 (https://download.01.org/0day-ci/archive/20211229/202112291846.LmSTdxbq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/64cb650145881d3738a05befb3773e16b1a5de56
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maciej-Fijalkowski/xsk-Tx-improvements/20211216-220139
        git checkout 64cb650145881d3738a05befb3773e16b1a5de56
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/ethernet/intel/ice/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_xsk.c:636: warning: expecting prototype for ice_clean_xdp_irq(). Prototype was for ice_clean_xdp_irq_zc() instead
>> drivers/net/ethernet/intel/ice/ice_xsk.c:719: warning: expecting prototype for ice_xmit_pkt(). Prototype was for ice_xmit_pkt_batch() instead


vim +636 drivers/net/ethernet/intel/ice/ice_xsk.c

2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  628  
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  629  /**
64cb650145881d Maciej Fijalkowski     2021-12-16  630   * ice_clean_xdp_irq - Reclaim resources after transmit completes on XDP ring
64cb650145881d Maciej Fijalkowski     2021-12-16  631   * @xdp_ring: XDP ring to clean
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  632   *
64cb650145881d Maciej Fijalkowski     2021-12-16  633   * Returns count of cleaned descriptors
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  634   */
64cb650145881d Maciej Fijalkowski     2021-12-16  635  static u16 ice_clean_xdp_irq_zc(struct ice_tx_ring *xdp_ring)
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04 @636  {
64cb650145881d Maciej Fijalkowski     2021-12-16  637  	struct ice_tx_desc *next_dd_desc;
64cb650145881d Maciej Fijalkowski     2021-12-16  638  	u16 next_dd = xdp_ring->next_dd;
64cb650145881d Maciej Fijalkowski     2021-12-16  639  	u16 desc_cnt = xdp_ring->count;
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  640  	struct ice_tx_buf *tx_buf;
64cb650145881d Maciej Fijalkowski     2021-12-16  641  	u16 ntc, cleared_dds = 0;
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  642  	u32 xsk_frames = 0;
64cb650145881d Maciej Fijalkowski     2021-12-16  643  	u16 i;
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  644  
64cb650145881d Maciej Fijalkowski     2021-12-16  645  	next_dd_desc = ICE_TX_DESC(xdp_ring, next_dd);
64cb650145881d Maciej Fijalkowski     2021-12-16  646  	if (!(next_dd_desc->cmd_type_offset_bsz &
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  647  	    cpu_to_le64(ICE_TX_DESC_DTYPE_DESC_DONE)))
64cb650145881d Maciej Fijalkowski     2021-12-16  648  		return 0;
64cb650145881d Maciej Fijalkowski     2021-12-16  649  
64cb650145881d Maciej Fijalkowski     2021-12-16  650  again:
64cb650145881d Maciej Fijalkowski     2021-12-16  651  	cleared_dds++;
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  652  
64cb650145881d Maciej Fijalkowski     2021-12-16  653  	ntc = xdp_ring->next_to_clean;
64cb650145881d Maciej Fijalkowski     2021-12-16  654  
64cb650145881d Maciej Fijalkowski     2021-12-16  655  	for (i = 0; i < ICE_TX_THRESH; i++) {
64cb650145881d Maciej Fijalkowski     2021-12-16  656  		tx_buf = &xdp_ring->tx_buf[ntc];
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  657  
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  658  		if (tx_buf->raw_buf) {
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  659  			ice_clean_xdp_tx_buf(xdp_ring, tx_buf);
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  660  			tx_buf->raw_buf = NULL;
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  661  		} else {
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  662  			xsk_frames++;
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  663  		}
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  664  
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  665  		ntc++;
64cb650145881d Maciej Fijalkowski     2021-12-16  666  		if (ntc >= xdp_ring->count)
64cb650145881d Maciej Fijalkowski     2021-12-16  667  			ntc = 0;
64cb650145881d Maciej Fijalkowski     2021-12-16  668  	}
64cb650145881d Maciej Fijalkowski     2021-12-16  669  
64cb650145881d Maciej Fijalkowski     2021-12-16  670  	xdp_ring->next_to_clean += ICE_TX_THRESH;
64cb650145881d Maciej Fijalkowski     2021-12-16  671  	if (xdp_ring->next_to_clean >= desc_cnt)
64cb650145881d Maciej Fijalkowski     2021-12-16  672  		xdp_ring->next_to_clean -= desc_cnt;
64cb650145881d Maciej Fijalkowski     2021-12-16  673  	if (xsk_frames)
64cb650145881d Maciej Fijalkowski     2021-12-16  674  		xsk_tx_completed(xdp_ring->xsk_pool, xsk_frames);
64cb650145881d Maciej Fijalkowski     2021-12-16  675  	next_dd_desc->cmd_type_offset_bsz = 0;
64cb650145881d Maciej Fijalkowski     2021-12-16  676  	xdp_ring->next_dd = xdp_ring->next_dd + ICE_TX_THRESH;
64cb650145881d Maciej Fijalkowski     2021-12-16  677  	if (xdp_ring->next_dd >= desc_cnt)
64cb650145881d Maciej Fijalkowski     2021-12-16  678  		xdp_ring->next_dd = ICE_TX_THRESH - 1;
64cb650145881d Maciej Fijalkowski     2021-12-16  679  
64cb650145881d Maciej Fijalkowski     2021-12-16  680  	next_dd_desc = ICE_TX_DESC(xdp_ring, next_dd);
64cb650145881d Maciej Fijalkowski     2021-12-16  681  	if ((next_dd_desc->cmd_type_offset_bsz &
64cb650145881d Maciej Fijalkowski     2021-12-16  682  	    cpu_to_le64(ICE_TX_DESC_DTYPE_DESC_DONE)))
64cb650145881d Maciej Fijalkowski     2021-12-16  683  		goto again;
64cb650145881d Maciej Fijalkowski     2021-12-16  684  
64cb650145881d Maciej Fijalkowski     2021-12-16  685  	return cleared_dds * ICE_TX_THRESH;
64cb650145881d Maciej Fijalkowski     2021-12-16  686  }
64cb650145881d Maciej Fijalkowski     2021-12-16  687  
64cb650145881d Maciej Fijalkowski     2021-12-16  688  /**
64cb650145881d Maciej Fijalkowski     2021-12-16  689   * ice_xmit_pkt - produce a single HW Tx descriptor out of AF_XDP descriptor
64cb650145881d Maciej Fijalkowski     2021-12-16  690   * @xdp_ring: XDP ring to produce the HW Tx descriptor on
64cb650145881d Maciej Fijalkowski     2021-12-16  691   * @desc: AF_XDP descriptor to pull the DMA address and length from
64cb650145881d Maciej Fijalkowski     2021-12-16  692   * @total_bytes: bytes accumulator that will be used for stats update
64cb650145881d Maciej Fijalkowski     2021-12-16  693   */
64cb650145881d Maciej Fijalkowski     2021-12-16  694  static void ice_xmit_pkt(struct ice_tx_ring *xdp_ring, struct xdp_desc *desc,
64cb650145881d Maciej Fijalkowski     2021-12-16  695  			 unsigned int *total_bytes)
64cb650145881d Maciej Fijalkowski     2021-12-16  696  {
64cb650145881d Maciej Fijalkowski     2021-12-16  697  	struct ice_tx_desc *tx_desc;
64cb650145881d Maciej Fijalkowski     2021-12-16  698  	dma_addr_t dma;
64cb650145881d Maciej Fijalkowski     2021-12-16  699  
64cb650145881d Maciej Fijalkowski     2021-12-16  700  	dma = xsk_buff_raw_get_dma(xdp_ring->xsk_pool, desc->addr);
64cb650145881d Maciej Fijalkowski     2021-12-16  701  	xsk_buff_raw_dma_sync_for_device(xdp_ring->xsk_pool, dma, desc->len);
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  702  
64cb650145881d Maciej Fijalkowski     2021-12-16  703  	tx_desc = ICE_TX_DESC(xdp_ring, xdp_ring->next_to_use++);
64cb650145881d Maciej Fijalkowski     2021-12-16  704  	tx_desc->buf_addr = cpu_to_le64(dma);
64cb650145881d Maciej Fijalkowski     2021-12-16  705  	tx_desc->cmd_type_offset_bsz = ice_build_ctob(ICE_TX_DESC_CMD_EOP,
64cb650145881d Maciej Fijalkowski     2021-12-16  706  						      0, desc->len, 0);
64cb650145881d Maciej Fijalkowski     2021-12-16  707  
64cb650145881d Maciej Fijalkowski     2021-12-16  708  	*total_bytes += desc->len;
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  709  }
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  710  
64cb650145881d Maciej Fijalkowski     2021-12-16  711  /**
64cb650145881d Maciej Fijalkowski     2021-12-16  712   * ice_xmit_pkt - produce a batch of HW Tx descriptors out of AF_XDP descriptors
64cb650145881d Maciej Fijalkowski     2021-12-16  713   * @xdp_ring: XDP ring to produce the HW Tx descriptors on
64cb650145881d Maciej Fijalkowski     2021-12-16  714   * @descs: AF_XDP descriptors to pull the DMA addresses and lengths from
64cb650145881d Maciej Fijalkowski     2021-12-16  715   * @total_bytes: bytes accumulator that will be used for stats update
64cb650145881d Maciej Fijalkowski     2021-12-16  716   */
64cb650145881d Maciej Fijalkowski     2021-12-16  717  static void ice_xmit_pkt_batch(struct ice_tx_ring *xdp_ring, struct xdp_desc *descs,
64cb650145881d Maciej Fijalkowski     2021-12-16  718  			       unsigned int *total_bytes)
64cb650145881d Maciej Fijalkowski     2021-12-16 @719  {
64cb650145881d Maciej Fijalkowski     2021-12-16  720  	u16 ntu = xdp_ring->next_to_use;
64cb650145881d Maciej Fijalkowski     2021-12-16  721  	struct ice_tx_desc *tx_desc;
64cb650145881d Maciej Fijalkowski     2021-12-16  722  	dma_addr_t dma;
64cb650145881d Maciej Fijalkowski     2021-12-16  723  	u32 i;
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  724  
64cb650145881d Maciej Fijalkowski     2021-12-16  725  	loop_unrolled_for(i = 0; i < PKTS_PER_BATCH; i++) {
64cb650145881d Maciej Fijalkowski     2021-12-16  726  		dma = xsk_buff_raw_get_dma(xdp_ring->xsk_pool, descs[i].addr);
64cb650145881d Maciej Fijalkowski     2021-12-16  727  		xsk_buff_raw_dma_sync_for_device(xdp_ring->xsk_pool, dma, descs[i].len);
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  728  
64cb650145881d Maciej Fijalkowski     2021-12-16  729  		tx_desc = ICE_TX_DESC(xdp_ring, ntu++);
64cb650145881d Maciej Fijalkowski     2021-12-16  730  		tx_desc->buf_addr = cpu_to_le64(dma);
64cb650145881d Maciej Fijalkowski     2021-12-16  731  		tx_desc->cmd_type_offset_bsz = ice_build_ctob(ICE_TX_DESC_CMD_EOP,
64cb650145881d Maciej Fijalkowski     2021-12-16  732  							      0, descs[i].len, 0);
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  733  
64cb650145881d Maciej Fijalkowski     2021-12-16  734  		*total_bytes += descs[i].len;
64cb650145881d Maciej Fijalkowski     2021-12-16  735  	}
64cb650145881d Maciej Fijalkowski     2021-12-16  736  
64cb650145881d Maciej Fijalkowski     2021-12-16  737  	xdp_ring->next_to_use = ntu;
64cb650145881d Maciej Fijalkowski     2021-12-16  738  
64cb650145881d Maciej Fijalkowski     2021-12-16  739  	if (xdp_ring->next_to_use > xdp_ring->next_rs) {
64cb650145881d Maciej Fijalkowski     2021-12-16  740  		tx_desc = ICE_TX_DESC(xdp_ring, xdp_ring->next_rs);
64cb650145881d Maciej Fijalkowski     2021-12-16  741  		tx_desc->cmd_type_offset_bsz |=
64cb650145881d Maciej Fijalkowski     2021-12-16  742  			cpu_to_le64(ICE_TX_DESC_CMD_RS << ICE_TXD_QW1_CMD_S);
64cb650145881d Maciej Fijalkowski     2021-12-16  743  		xdp_ring->next_rs += ICE_TX_THRESH;
64cb650145881d Maciej Fijalkowski     2021-12-16  744  	}
64cb650145881d Maciej Fijalkowski     2021-12-16  745  }
64cb650145881d Maciej Fijalkowski     2021-12-16  746  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
