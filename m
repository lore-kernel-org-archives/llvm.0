Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3BE199B7;
	Fri, 22 Dec 2023 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PErmzks1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703253402; x=1734789402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aPlrDkVRT3LjDT9JvIZAn4aTqTQrIRV0xpTNE5Pbths=;
  b=PErmzks18XuUNga99sCErID7m1b35Ms5HzcFZlIG4y0Ggg/v5BKR8yxY
   3OXhuO9M8rq93E7AcaWokUptLIdtW8SsX7R3I+6y9eNzNo7hxshbvbzjl
   FmHml7wAilGLfkSgwPsvGwABbHxn69zvYxqryZwApyhHH1Hgmx31KZlGJ
   wO+kdpmlqA8PA+5cCTh+ZN8ufspXyeBc3xIbTxPY9gse9LSi+di0Y3HPS
   MaQ1N86AfoPozQYkE/JwWcjX5b+WjoF5CsJecunI6qtqbOTLhagm5eoza
   on9QOiBXm/+mf3SspHAm4k0R4U4qGuiXjJuyo4zrsbGxUZuSfSB/I9vaj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="3373088"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="3373088"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 05:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="847466849"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="847466849"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Dec 2023 05:56:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGg0y-0009Wf-2q;
	Fri, 22 Dec 2023 13:56:36 +0000
Date: Fri, 22 Dec 2023 21:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kuliga <jankul@alatek.krakow.pl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 9985/10295] drivers/dma/xilinx/xdma.c:757:68:
 warning: operator '?:' has lower precedence than '+'; '+' will be evaluated
 first
Message-ID: <202312222155.w90Evz26-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 01e6d907656134949c4126e7fd64984d4daa4c1e [9985/10295] dmaengine: xilinx: xdma: Implement interleaved DMA transfers
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231222/202312222155.w90Evz26-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312222155.w90Evz26-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312222155.w90Evz26-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/xilinx/xdma.c:757:68: warning: operator '?:' has lower precedence than '+'; '+' will be evaluated first [-Wparentheses]
     757 |                 src_addr += dmaengine_get_src_icg(xt, &xt->sgl[i]) + xt->src_inc ?
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/dma/xilinx/xdma.c:757:68: note: place parentheses around the '+' expression to silence this warning
     757 |                 src_addr += dmaengine_get_src_icg(xt, &xt->sgl[i]) + xt->src_inc ?
         |                                                                                  ^
         |                             (                                                   )
   drivers/dma/xilinx/xdma.c:757:68: note: place parentheses around the '?:' expression to evaluate it first
     757 |                 src_addr += dmaengine_get_src_icg(xt, &xt->sgl[i]) + xt->src_inc ?
         |                                                                                  ^
         |                                                                      (
     758 |                                                               xt->sgl[i].size : 0;
         |                                                                                  
         |                                                                                  )
   drivers/dma/xilinx/xdma.c:759:68: warning: operator '?:' has lower precedence than '+'; '+' will be evaluated first [-Wparentheses]
     759 |                 dst_addr += dmaengine_get_dst_icg(xt, &xt->sgl[i]) + xt->dst_inc ?
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/dma/xilinx/xdma.c:759:68: note: place parentheses around the '+' expression to silence this warning
     759 |                 dst_addr += dmaengine_get_dst_icg(xt, &xt->sgl[i]) + xt->dst_inc ?
         |                                                                                  ^
         |                             (                                                   )
   drivers/dma/xilinx/xdma.c:759:68: note: place parentheses around the '?:' expression to evaluate it first
     759 |                 dst_addr += dmaengine_get_dst_icg(xt, &xt->sgl[i]) + xt->dst_inc ?
         |                                                                                  ^
         |                                                                      (
     760 |                                                               xt->sgl[i].size : 0;
         |                                                                                  
         |                                                                                  )
>> drivers/dma/xilinx/xdma.c:729:1: warning: no previous prototype for function 'xdma_prep_interleaved_dma' [-Wmissing-prototypes]
     729 | xdma_prep_interleaved_dma(struct dma_chan *chan,
         | ^
   drivers/dma/xilinx/xdma.c:728:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     728 | struct dma_async_tx_descriptor *
         | ^
         | static 
>> drivers/dma/xilinx/xdma.c:894:3: warning: variable 'desc' is uninitialized when used here [-Wuninitialized]
     894 |                 desc->error = true;
         |                 ^~~~
   drivers/dma/xilinx/xdma.c:874:24: note: initialize the variable 'desc' to silence this warning
     874 |         struct xdma_desc *desc;
         |                               ^
         |                                = NULL
   4 warnings generated.


vim +757 drivers/dma/xilinx/xdma.c

   721	
   722	/**
   723	 * xdma_prep_interleaved_dma - Prepare virtual descriptor for interleaved DMA transfers
   724	 * @chan: DMA channel
   725	 * @xt: DMA transfer template
   726	 * @flags: tx flags
   727	 */
   728	struct dma_async_tx_descriptor *
 > 729	xdma_prep_interleaved_dma(struct dma_chan *chan,
   730				  struct dma_interleaved_template *xt,
   731				  unsigned long flags)
   732	{
   733		int i;
   734		u32 desc_num = 0, period_size = 0;
   735		struct dma_async_tx_descriptor *tx_desc;
   736		struct xdma_chan *xchan = to_xdma_chan(chan);
   737		struct xdma_desc *sw_desc;
   738		u64 src_addr, dst_addr;
   739	
   740		for (i = 0; i < xt->frame_size; ++i)
   741			desc_num += DIV_ROUND_UP(xt->sgl[i].size, XDMA_DESC_BLEN_MAX);
   742	
   743		sw_desc = xdma_alloc_desc(xchan, desc_num, false);
   744		if (!sw_desc)
   745			return NULL;
   746		sw_desc->dir = xt->dir;
   747		sw_desc->interleaved_dma = true;
   748		sw_desc->cyclic = flags & DMA_PREP_REPEAT;
   749		sw_desc->frames_left = xt->numf;
   750		sw_desc->periods = xt->numf;
   751	
   752		desc_num = 0;
   753		src_addr = xt->src_start;
   754		dst_addr = xt->dst_start;
   755		for (i = 0; i < xt->frame_size; ++i) {
   756			desc_num += xdma_fill_descs(sw_desc, src_addr, dst_addr, xt->sgl[i].size, desc_num);
 > 757			src_addr += dmaengine_get_src_icg(xt, &xt->sgl[i]) + xt->src_inc ?
   758								      xt->sgl[i].size : 0;
 > 759			dst_addr += dmaengine_get_dst_icg(xt, &xt->sgl[i]) + xt->dst_inc ?
   760								      xt->sgl[i].size : 0;
   761			period_size += xt->sgl[i].size;
   762		}
   763		sw_desc->period_size = period_size;
   764	
   765		tx_desc = vchan_tx_prep(&xchan->vchan, &sw_desc->vdesc, flags);
   766		if (tx_desc)
   767			return tx_desc;
   768	
   769		xdma_free_desc(&sw_desc->vdesc);
   770		return NULL;
   771	}
   772	
   773	/**
   774	 * xdma_device_config - Configure the DMA channel
   775	 * @chan: DMA channel
   776	 * @cfg: channel configuration
   777	 */
   778	static int xdma_device_config(struct dma_chan *chan,
   779				      struct dma_slave_config *cfg)
   780	{
   781		struct xdma_chan *xdma_chan = to_xdma_chan(chan);
   782	
   783		memcpy(&xdma_chan->cfg, cfg, sizeof(*cfg));
   784	
   785		return 0;
   786	}
   787	
   788	/**
   789	 * xdma_free_chan_resources - Free channel resources
   790	 * @chan: DMA channel
   791	 */
   792	static void xdma_free_chan_resources(struct dma_chan *chan)
   793	{
   794		struct xdma_chan *xdma_chan = to_xdma_chan(chan);
   795	
   796		vchan_free_chan_resources(&xdma_chan->vchan);
   797		dma_pool_destroy(xdma_chan->desc_pool);
   798		xdma_chan->desc_pool = NULL;
   799	}
   800	
   801	/**
   802	 * xdma_alloc_chan_resources - Allocate channel resources
   803	 * @chan: DMA channel
   804	 */
   805	static int xdma_alloc_chan_resources(struct dma_chan *chan)
   806	{
   807		struct xdma_chan *xdma_chan = to_xdma_chan(chan);
   808		struct xdma_device *xdev = xdma_chan->xdev_hdl;
   809		struct device *dev = xdev->dma_dev.dev;
   810	
   811		while (dev && !dev_is_pci(dev))
   812			dev = dev->parent;
   813		if (!dev) {
   814			xdma_err(xdev, "unable to find pci device");
   815			return -EINVAL;
   816		}
   817	
   818		xdma_chan->desc_pool = dma_pool_create(dma_chan_name(chan), dev, XDMA_DESC_BLOCK_SIZE,
   819						       XDMA_DESC_BLOCK_ALIGN, XDMA_DESC_BLOCK_BOUNDARY);
   820		if (!xdma_chan->desc_pool) {
   821			xdma_err(xdev, "unable to allocate descriptor pool");
   822			return -ENOMEM;
   823		}
   824	
   825		return 0;
   826	}
   827	
   828	static enum dma_status xdma_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
   829					      struct dma_tx_state *state)
   830	{
   831		struct xdma_chan *xdma_chan = to_xdma_chan(chan);
   832		struct xdma_desc *desc = NULL;
   833		struct virt_dma_desc *vd;
   834		enum dma_status ret;
   835		unsigned long flags;
   836		unsigned int period_idx;
   837		u32 residue = 0;
   838	
   839		ret = dma_cookie_status(chan, cookie, state);
   840		if (ret == DMA_COMPLETE)
   841			return ret;
   842	
   843		spin_lock_irqsave(&xdma_chan->vchan.lock, flags);
   844	
   845		vd = vchan_find_desc(&xdma_chan->vchan, cookie);
   846		if (!vd)
   847			goto out;
   848	
   849		desc = to_xdma_desc(vd);
   850		if (desc->error) {
   851			ret = DMA_ERROR;
   852		} else if (desc->cyclic) {
   853			period_idx = desc->completed_desc_num % desc->periods;
   854			residue = (desc->periods - period_idx) * desc->period_size;
   855			dma_set_residue(state, residue);
   856		}
   857	out:
   858		spin_unlock_irqrestore(&xdma_chan->vchan.lock, flags);
   859	
   860		return ret;
   861	}
   862	
   863	/**
   864	 * xdma_channel_isr - XDMA channel interrupt handler
   865	 * @irq: IRQ number
   866	 * @dev_id: Pointer to the DMA channel structure
   867	 */
   868	static irqreturn_t xdma_channel_isr(int irq, void *dev_id)
   869	{
   870		struct xdma_chan *xchan = dev_id;
   871		u32 complete_desc_num = 0;
   872		struct xdma_device *xdev = xchan->xdev_hdl;
   873		struct virt_dma_desc *vd, *next_vd;
   874		struct xdma_desc *desc;
   875		int ret;
   876		u32 st;
   877		bool repeat_tx;
   878	
   879		spin_lock(&xchan->vchan.lock);
   880	
   881		/* get submitted request */
   882		vd = vchan_next_desc(&xchan->vchan);
   883		if (!vd)
   884			goto out;
   885	
   886		/* Clear-on-read the status register */
   887		ret = regmap_read(xdev->rmap, xchan->base + XDMA_CHAN_STATUS_RC, &st);
   888		if (ret)
   889			goto out;
   890	
   891		st &= XDMA_CHAN_STATUS_MASK;
   892		if ((st & XDMA_CHAN_ERROR_MASK) ||
   893		    !(st & (CHAN_CTRL_IE_DESC_COMPLETED | CHAN_CTRL_IE_DESC_STOPPED))) {
 > 894			desc->error = true;
   895			xdma_err(xdev, "channel error, status register value: 0x%x", st);
   896			goto out;
   897		}
   898	
   899		ret = regmap_read(xdev->rmap, xchan->base + XDMA_CHAN_COMPLETED_DESC,
   900				  &complete_desc_num);
   901		if (ret)
   902			goto out;
   903	
   904		desc = to_xdma_desc(vd);
   905		if (desc->interleaved_dma) {
   906			xchan->busy = false;
   907			desc->completed_desc_num += complete_desc_num;
   908			if (complete_desc_num == XDMA_DESC_BLOCK_NUM * XDMA_DESC_ADJACENT) {
   909				xdma_xfer_start(xchan);
   910				goto out;
   911			}
   912	
   913			/* last desc of any frame */
   914			desc->frames_left--;
   915			if (desc->frames_left)
   916				goto out;
   917	
   918			/* last desc of the last frame  */
   919			repeat_tx = vd->tx.flags & DMA_PREP_REPEAT;
   920			next_vd = list_first_entry_or_null(&vd->node, struct virt_dma_desc, node);
   921			if (next_vd)
   922				repeat_tx = repeat_tx && !(next_vd->tx.flags & DMA_PREP_LOAD_EOT);
   923			if (repeat_tx) {
   924				desc->frames_left = desc->periods;
   925				desc->completed_desc_num = 0;
   926				vchan_cyclic_callback(vd);
   927			} else {
   928				list_del(&vd->node);
   929				vchan_cookie_complete(vd);
   930			}
   931			/* start (or continue) the tx of a first desc on the vc.desc_issued list, if any */
   932			xdma_xfer_start(xchan);
   933		} else if (!desc->cyclic) {
   934			xchan->busy = false;
   935			desc->completed_desc_num += complete_desc_num;
   936	
   937			/* if all data blocks are transferred, remove and complete the request */
   938			if (desc->completed_desc_num == desc->desc_num) {
   939				list_del(&vd->node);
   940				vchan_cookie_complete(vd);
   941				goto out;
   942			}
   943	
   944			if (desc->completed_desc_num > desc->desc_num ||
   945			    complete_desc_num != XDMA_DESC_BLOCK_NUM * XDMA_DESC_ADJACENT)
   946				goto out;
   947	
   948			/* transfer the rest of data */
   949			xdma_xfer_start(xchan);
   950		} else {
   951			desc->completed_desc_num = complete_desc_num;
   952			vchan_cyclic_callback(vd);
   953		}
   954	
   955	out:
   956		spin_unlock(&xchan->vchan.lock);
   957		return IRQ_HANDLED;
   958	}
   959	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
