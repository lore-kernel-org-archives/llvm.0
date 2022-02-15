Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA41388
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644924231; x=1676460231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jp0pIKbcI1qV26UhwcsDlmvc7Aazcoo2ETmNbMMXSu4=;
  b=kzidVz9tXo25Gv9LX38R0A3x4EEZeRrsC1JYo2l487PmfGtrRiY3BFww
   3nzM3GwEdfuhH8xNR5JLCNwWdwXHxIbY4EBmn0Es8fnKbhYrCoBs2JhwI
   Ww8cQJRDj8EclpI1DbreNdb9KVRIaVxIDQdxVMcFjot8/DVhH3I6kpxC6
   wm4p3siZ6RS92jvLJD7Q4pWxUZOu6v8+n4agSbIuRN5GvzIPvePGx7IpZ
   bE3owsxaWyrRTl/jPLlp++ziXmERdPyiHoz6GJXhMlGe8AOMynk0dQqZK
   lwM9Sfc49o3oRnS+RP4ZwwyfyTUm0Z4hISvp2rnCfISEa6QeSgTRB2haW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="247926311"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="247926311"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 03:23:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="603763768"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Feb 2022 03:23:46 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJvvu-0009az-3c; Tue, 15 Feb 2022 11:23:46 +0000
Date: Tue, 15 Feb 2022 19:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@xilinx.com>,
	Swati Agarwal <swati.agarwal@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 225/924]
 drivers/net/ethernet/xilinx/xilinx_axienet.h:973:2: error: implicit
 declaration of function 'writeq'
Message-ID: <202202151714.yArZWj6O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   66bb31d008b55b6ae2ca9e41f7a4ff21816dded3
commit: ee94241b2118ddd38a456b2b805fc584b57de58f [225/924] net: axienet: added multichannel DMA support
config: i386-randconfig-a005-20220214 (https://download.01.org/0day-ci/archive/20220215/202202151714.yArZWj6O-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/ee94241b2118ddd38a456b2b805fc584b57de58f
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout ee94241b2118ddd38a456b2b805fc584b57de58f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_main.c:48:
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:973:2: error: implicit declaration of function 'writeq' [-Werror,-Wimplicit-function-declaration]
           writeq(value, (q->dma_regs + reg));
           ^
   1 error generated.


vim +/writeq +973 drivers/net/ethernet/xilinx/xilinx_axienet.h

   959	
   960	/**
   961	 * axienet_dma_bdout - Memory mapped Axi DMA register Buffer Descriptor write.
   962	 * @q:		Pointer to DMA queue structure
   963	 * @reg:	Address offset from the base address of the Axi DMA core
   964	 * @value:	Value to be written into the Axi DMA register
   965	 *
   966	 * This function writes the desired value into the corresponding Axi DMA
   967	 * register.
   968	 */
   969	static inline void axienet_dma_bdout(struct axienet_dma_q *q,
   970					     off_t reg, dma_addr_t value)
   971	{
   972	#if defined(CONFIG_PHYS_ADDR_T_64BIT)
 > 973		writeq(value, (q->dma_regs + reg));
   974	#else
   975		writel(value, (q->dma_regs + reg));
   976	#endif
   977	}
   978	/* Function prototypes visible in xilinx_axienet_mdio.c for other files */
   979	int axienet_mdio_enable(struct axienet_local *lp);
   980	void axienet_mdio_disable(struct axienet_local *lp);
   981	int axienet_mdio_setup(struct axienet_local *lp);
   982	void axienet_mdio_teardown(struct axienet_local *lp);
   983	int axienet_mdio_wait_until_ready(struct axienet_local *lp);
   984	void __maybe_unused axienet_bd_free(struct net_device *ndev,
   985					    struct axienet_dma_q *q);
   986	int __maybe_unused axienet_dma_q_init(struct net_device *ndev,
   987					      struct axienet_dma_q *q);
   988	void axienet_dma_err_handler(unsigned long data);
   989	irqreturn_t __maybe_unused axienet_tx_irq(int irq, void *_ndev);
   990	irqreturn_t __maybe_unused axienet_rx_irq(int irq, void *_ndev);
   991	void axienet_start_xmit_done(struct net_device *ndev, struct axienet_dma_q *q);
   992	void axienet_dma_bd_release(struct net_device *ndev);
   993	void __axienet_device_reset(struct axienet_dma_q *q);
   994	void axienet_set_mac_address(struct net_device *ndev, const void *address);
   995	void axienet_set_multicast_list(struct net_device *ndev);
   996	int xaxienet_rx_poll(struct napi_struct *napi, int quota);
   997	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
