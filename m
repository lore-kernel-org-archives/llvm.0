Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CF920FB4;
	Tue,  1 Aug 2023 11:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690890174; x=1722426174;
  h=date:from:cc:subject:message-id:mime-version;
  bh=k+WK4ZA4mY3CC2VgERoyIck81OxEtZM9kylo73d9qvQ=;
  b=KDgrvGAOYlGizAf9iKBgWAr9SvBQXTRlov3x3jXZS3gCptfkdm5XNEAW
   OmJXOEeTYajL2XVQm7upeeym69iGNdrnqHR4bfzPPa+A1dboPQWLaWO5z
   f/44FFVuZE+Ikdq7+abp280Yvvx98zNJ0U4CZ3KZBCJrwjfbZQQ/W5W0a
   43ODZm1kBli/qo3vHMFLOhLIiKWKYnPb/GYevjwvV/SLLGc1XLCnNjBwC
   T69x7m5/WO7HZowq43JQUJCvgWXv9oRBhzt3cRDI1WSNef5eUVDgA1SkE
   oUPDjcEKoR++/7/3VNwLC/DYcJiBhJi1gXzTt7apo1DtK2x3u7Fuidaua
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="433111241"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="433111241"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 04:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="798630992"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="798630992"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Aug 2023 04:42:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQnm6-0000FD-24;
	Tue, 01 Aug 2023 11:42:50 +0000
Date: Tue, 1 Aug 2023 19:42:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 8470/9999] drivers/bus/mhi/host/init.c:355:20:
 warning: taking address of packed member 'wp' of class or structure
 'mhi_event_ctxt' may result in an unaligned pointer value
Message-ID: <202308011932.uCTX853L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
drivers/bus/mhi/host/init.c: 355:20: warning: taking address of packed member
 'wp' of class or structure 'mhi_event_ctxt' may result in an unaligned
 pointer value [-Waddress-of-packed-member]
drivers/bus/mhi/host/init.c: 384:20: warning: taking address of packed member
 'wp' of class or structure 'mhi_cmd_ctxt' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
drivers/bus/mhi/host/init.c: 629:23: warning: taking address of packed member
 'wp' of class or structure 'mhi_chan_ctxt' may result in an unaligned
 pointer value [-Waddress-of-packed-member]

TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Hemant Kumar <hemantk@codeaurora.org>
CC: Alex Elder <elder@linaro.org>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   09996673e3139a6d86fc3d95c852b3a020e2fe5f
commit: 9fbf10148f31a63b6d8c2b0e56cb97eb173d600b [8470/9999] bus: mhi: Move host MHI code to "host" directory
config: mips-randconfig-r031-20230801 (https://download.01.org/0day-ci/archive/20230801/202308011932.uCTX853L-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308011932.uCTX853L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308011932.uCTX853L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/init.c:355:20: warning: taking address of packed member 'wp' of class or structure 'mhi_event_ctxt' may result in an unaligned pointer value [-Waddress-of-packed-member]
     355 |                 ring->ctxt_wp = &er_ctxt->wp;
         |                                  ^~~~~~~~~~~
>> drivers/bus/mhi/host/init.c:384:20: warning: taking address of packed member 'wp' of class or structure 'mhi_cmd_ctxt' may result in an unaligned pointer value [-Waddress-of-packed-member]
     384 |                 ring->ctxt_wp = &cmd_ctxt->wp;
         |                                  ^~~~~~~~~~~~
>> drivers/bus/mhi/host/init.c:629:23: warning: taking address of packed member 'wp' of class or structure 'mhi_chan_ctxt' may result in an unaligned pointer value [-Waddress-of-packed-member]
     629 |         tre_ring->ctxt_wp = &chan_ctxt->wp;
         |                              ^~~~~~~~~~~~~
   3 warnings generated.


vim +355 drivers/bus/mhi/host/init.c

3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  260  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  261  int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  262  {
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  263  	struct mhi_ctxt *mhi_ctxt;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  264  	struct mhi_chan_ctxt *chan_ctxt;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  265  	struct mhi_event_ctxt *er_ctxt;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  266  	struct mhi_cmd_ctxt *cmd_ctxt;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  267  	struct mhi_chan *mhi_chan;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  268  	struct mhi_event *mhi_event;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  269  	struct mhi_cmd *mhi_cmd;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  270  	u32 tmp;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  271  	int ret = -ENOMEM, i;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  272  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  273  	atomic_set(&mhi_cntrl->dev_wake, 0);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  274  	atomic_set(&mhi_cntrl->pending_pkts, 0);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  275  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  276  	mhi_ctxt = kzalloc(sizeof(*mhi_ctxt), GFP_KERNEL);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  277  	if (!mhi_ctxt)
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  278  		return -ENOMEM;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  279  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  280  	/* Setup channel ctxt */
2e36190de69cb4 drivers/bus/mhi/core/init.c Bhaumik Bhatt         2021-08-02  281  	mhi_ctxt->chan_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  282  						 sizeof(*mhi_ctxt->chan_ctxt) *
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  283  						 mhi_cntrl->max_chan,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  284  						 &mhi_ctxt->chan_ctxt_addr,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  285  						 GFP_KERNEL);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  286  	if (!mhi_ctxt->chan_ctxt)
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  287  		goto error_alloc_chan_ctxt;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  288  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  289  	mhi_chan = mhi_cntrl->mhi_chan;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  290  	chan_ctxt = mhi_ctxt->chan_ctxt;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  291  	for (i = 0; i < mhi_cntrl->max_chan; i++, chan_ctxt++, mhi_chan++) {
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  292  		/* Skip if it is an offload channel */
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  293  		if (mhi_chan->offload_ch)
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  294  			continue;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  295  
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  296  		tmp = le32_to_cpu(chan_ctxt->chcfg);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  297  		tmp &= ~CHAN_CTX_CHSTATE_MASK;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  298  		tmp |= (MHI_CH_STATE_DISABLED << CHAN_CTX_CHSTATE_SHIFT);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  299  		tmp &= ~CHAN_CTX_BRSTMODE_MASK;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  300  		tmp |= (mhi_chan->db_cfg.brstmode << CHAN_CTX_BRSTMODE_SHIFT);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  301  		tmp &= ~CHAN_CTX_POLLCFG_MASK;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  302  		tmp |= (mhi_chan->db_cfg.pollcfg << CHAN_CTX_POLLCFG_SHIFT);
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  303  		chan_ctxt->chcfg = cpu_to_le32(tmp);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  304  
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  305  		chan_ctxt->chtype = cpu_to_le32(mhi_chan->type);
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  306  		chan_ctxt->erindex = cpu_to_le32(mhi_chan->er_index);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  307  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  308  		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  309  		mhi_chan->tre_ring.db_addr = (void __iomem *)&chan_ctxt->wp;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  310  	}
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  311  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  312  	/* Setup event context */
2e36190de69cb4 drivers/bus/mhi/core/init.c Bhaumik Bhatt         2021-08-02  313  	mhi_ctxt->er_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  314  					       sizeof(*mhi_ctxt->er_ctxt) *
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  315  					       mhi_cntrl->total_ev_rings,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  316  					       &mhi_ctxt->er_ctxt_addr,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  317  					       GFP_KERNEL);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  318  	if (!mhi_ctxt->er_ctxt)
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  319  		goto error_alloc_er_ctxt;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  320  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  321  	er_ctxt = mhi_ctxt->er_ctxt;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  322  	mhi_event = mhi_cntrl->mhi_event;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  323  	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, er_ctxt++,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  324  		     mhi_event++) {
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  325  		struct mhi_ring *ring = &mhi_event->ring;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  326  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  327  		/* Skip if it is an offload event */
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  328  		if (mhi_event->offload_ev)
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  329  			continue;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  330  
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  331  		tmp = le32_to_cpu(er_ctxt->intmod);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  332  		tmp &= ~EV_CTX_INTMODC_MASK;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  333  		tmp &= ~EV_CTX_INTMODT_MASK;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  334  		tmp |= (mhi_event->intmod << EV_CTX_INTMODT_SHIFT);
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  335  		er_ctxt->intmod = cpu_to_le32(tmp);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  336  
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  337  		er_ctxt->ertype = cpu_to_le32(MHI_ER_TYPE_VALID);
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  338  		er_ctxt->msivec = cpu_to_le32(mhi_event->irq);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  339  		mhi_event->db_cfg.db_mode = true;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  340  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  341  		ring->el_size = sizeof(struct mhi_tre);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  342  		ring->len = ring->el_size * ring->elements;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  343  		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  344  		if (ret)
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  345  			goto error_alloc_er;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  346  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  347  		/*
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  348  		 * If the read pointer equals to the write pointer, then the
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  349  		 * ring is empty
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  350  		 */
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  351  		ring->rp = ring->wp = ring->base;
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  352  		er_ctxt->rbase = cpu_to_le64(ring->iommu_base);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  353  		er_ctxt->rp = er_ctxt->wp = er_ctxt->rbase;
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  354  		er_ctxt->rlen = cpu_to_le64(ring->len);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20 @355  		ring->ctxt_wp = &er_ctxt->wp;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  356  	}
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  357  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  358  	/* Setup cmd context */
1ea34b2988554a drivers/bus/mhi/core/init.c Wei Yongjun           2020-05-09  359  	ret = -ENOMEM;
2e36190de69cb4 drivers/bus/mhi/core/init.c Bhaumik Bhatt         2021-08-02  360  	mhi_ctxt->cmd_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  361  						sizeof(*mhi_ctxt->cmd_ctxt) *
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  362  						NR_OF_CMD_RINGS,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  363  						&mhi_ctxt->cmd_ctxt_addr,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  364  						GFP_KERNEL);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  365  	if (!mhi_ctxt->cmd_ctxt)
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  366  		goto error_alloc_er;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  367  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  368  	mhi_cmd = mhi_cntrl->mhi_cmd;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  369  	cmd_ctxt = mhi_ctxt->cmd_ctxt;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  370  	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++, cmd_ctxt++) {
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  371  		struct mhi_ring *ring = &mhi_cmd->ring;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  372  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  373  		ring->el_size = sizeof(struct mhi_tre);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  374  		ring->elements = CMD_EL_PER_RING;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  375  		ring->len = ring->el_size * ring->elements;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  376  		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  377  		if (ret)
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  378  			goto error_alloc_cmd;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  379  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  380  		ring->rp = ring->wp = ring->base;
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  381  		cmd_ctxt->rbase = cpu_to_le64(ring->iommu_base);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  382  		cmd_ctxt->rp = cmd_ctxt->wp = cmd_ctxt->rbase;
c1013a5ba4c961 drivers/bus/mhi/core/init.c Paul Davey            2022-03-01  383  		cmd_ctxt->rlen = cpu_to_le64(ring->len);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20 @384  		ring->ctxt_wp = &cmd_ctxt->wp;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  385  	}
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  386  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  387  	mhi_cntrl->mhi_ctxt = mhi_ctxt;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  388  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  389  	return 0;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  390  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  391  error_alloc_cmd:
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  392  	for (--i, --mhi_cmd; i >= 0; i--, mhi_cmd--) {
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  393  		struct mhi_ring *ring = &mhi_cmd->ring;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  394  
2e36190de69cb4 drivers/bus/mhi/core/init.c Bhaumik Bhatt         2021-08-02  395  		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  396  				  ring->pre_aligned, ring->dma_handle);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  397  	}
2e36190de69cb4 drivers/bus/mhi/core/init.c Bhaumik Bhatt         2021-08-02  398  	dma_free_coherent(mhi_cntrl->cntrl_dev,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  399  			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  400  			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  401  	i = mhi_cntrl->total_ev_rings;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  402  	mhi_event = mhi_cntrl->mhi_event + i;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  403  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  404  error_alloc_er:
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  405  	for (--i, --mhi_event; i >= 0; i--, mhi_event--) {
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  406  		struct mhi_ring *ring = &mhi_event->ring;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  407  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  408  		if (mhi_event->offload_ev)
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  409  			continue;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  410  
2e36190de69cb4 drivers/bus/mhi/core/init.c Bhaumik Bhatt         2021-08-02  411  		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  412  				  ring->pre_aligned, ring->dma_handle);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  413  	}
2e36190de69cb4 drivers/bus/mhi/core/init.c Bhaumik Bhatt         2021-08-02  414  	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->er_ctxt) *
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  415  			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  416  			  mhi_ctxt->er_ctxt_addr);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  417  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  418  error_alloc_er_ctxt:
2e36190de69cb4 drivers/bus/mhi/core/init.c Bhaumik Bhatt         2021-08-02  419  	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->chan_ctxt) *
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  420  			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  421  			  mhi_ctxt->chan_ctxt_addr);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  422  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  423  error_alloc_chan_ctxt:
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  424  	kfree(mhi_ctxt);
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  425  
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  426  	return ret;
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  427  }
3000f85b8f47b2 drivers/bus/mhi/core/init.c Manivannan Sadhasivam 2020-02-20  428  

:::::: The code at line 355 was first introduced by commit
:::::: 3000f85b8f47b2c860add5cce4c201c83bde6468 bus: mhi: core: Add support for basic PM operations

:::::: TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
