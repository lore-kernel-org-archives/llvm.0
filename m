Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419051DB958;
	Tue, 29 Apr 2025 01:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889593; cv=none; b=idXOQv4XgCSLkEodZ9yttQ5GOR8lu5NoyQs2qPF1xKRWk8+E6egL1SJkP64+DBQN2vrMKGO6m7frcdujCMrZy6RkKrUfObMbM6LC7d0ObK2z5KGKv6XhWW1SsvoadMKIAFYqx1NJ8Tx5WODo7oGOusGk3C1JaTMyT08TytkRKUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889593; c=relaxed/simple;
	bh=R3UAhkpOPCmKmxNTzkcTSJ8pqpaUKXLkVbgY8NNMnek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tg0o/kU4A7xwsaNfE00d6K9Z2ANbIiHNXiv6x8+HfeAJW4ksk1kp5ps/HwAwuzJ1Mt15jUEuYnbqZkql2aczloBu+RokqUnA1VukPcaYydy17uwXwhxzPIsLAfIrGRwsUHBiERYU96KvFpnXxBgz9UeVdrLNsI+w67LwqcIip94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ppi8C9P7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ppi8C9P7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889589; x=1777425589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R3UAhkpOPCmKmxNTzkcTSJ8pqpaUKXLkVbgY8NNMnek=;
  b=Ppi8C9P7ZWFnwQaLr4UtY2scZYD+CESpKlKBbj9L/ZniuMxtI8QyDfqM
   QZEyuohpZH7msLLkf6dBHv7rZ4C20xoxgmGcrzGpmHXwR+mw3Ie8K6ozM
   3GbHh5e+9PBgS2Mod4e010SOAZcl+g8rH/x3QcC59n2cRylC2EF44ME4h
   qs0oGxBqmJq3KLwSQga8L9lHuCbfPmqGnlB0Lq55KpXR/jDm6UVmjRd8Q
   xqrIeOOhaULJRPB6vAt0DVZWB18AmIFXMWaFO1t/TCk9T101uoBG5S2s7
   tKUc4GTSVGxh2QhJtYfWaNwFkDgAqA7jxXB8s62l4/zb1IFMaKtWhClKZ
   w==;
X-CSE-ConnectionGUID: K4yHyYtITnKAibm5Ovo9Gw==
X-CSE-MsgGUID: h8NWTL8YRP2bnap8+OlvYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51165300"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51165300"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:36 -0700
X-CSE-ConnectionGUID: NL+2JPk/QSatszxG4Hf86A==
X-CSE-MsgGUID: SgVXDWYzSQ2Krf65Z8hqvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164775790"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2025 18:19:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9Zd7-00001R-1V;
	Tue, 29 Apr 2025 01:19:25 +0000
Date: Tue, 29 Apr 2025 02:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, peter.ujfalusi@gmail.com,
	vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	praneeth@ti.com, vigneshr@ti.com, u-kumar1@ti.com, a-chavda@ti.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/8] drivers: soc: ti: k3-ringacc: handle absence of tisci
Message-ID: <202504290207.ct0tnV56-lkp@intel.com>
References: <20250428072032.946008-6-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428072032.946008-6-s-adivi@ti.com>

Hi Sai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.15-rc4]
[cannot apply to next-20250428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Sree-Kartheek-Adivi/dt-bindings-dma-ti-Add-document-for-K3-BCDMA-V2/20250428-152616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250428072032.946008-6-s-adivi%40ti.com
patch subject: [PATCH 5/8] drivers: soc: ti: k3-ringacc: handle absence of tisci
config: arm64-randconfig-001-20250428 (https://download.01.org/0day-ci/archive/20250429/202504290207.ct0tnV56-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290207.ct0tnV56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290207.ct0tnV56-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/ti/k3-ringacc.c:214: warning: Function parameter or struct member 'cfg' not described in 'k3_ring'
>> drivers/soc/ti/k3-ringacc.c:214: warning: Function parameter or struct member 'intr' not described in 'k3_ring'


vim +214 drivers/soc/ti/k3-ringacc.c

6b3da0b475b877 Peter Ujfalusi          2020-07-24  168  
3277e8aa2504d9 Grygorii Strashko       2020-01-15  169  /**
3277e8aa2504d9 Grygorii Strashko       2020-01-15  170   * struct k3_ring - RA Ring descriptor
3277e8aa2504d9 Grygorii Strashko       2020-01-15  171   *
3277e8aa2504d9 Grygorii Strashko       2020-01-15  172   * @rt: Ring control/status registers
3277e8aa2504d9 Grygorii Strashko       2020-01-15  173   * @fifos: Ring queues registers
3277e8aa2504d9 Grygorii Strashko       2020-01-15  174   * @proxy: Ring Proxy Datapath registers
3277e8aa2504d9 Grygorii Strashko       2020-01-15  175   * @ring_mem_dma: Ring buffer dma address
3277e8aa2504d9 Grygorii Strashko       2020-01-15  176   * @ring_mem_virt: Ring buffer virt address
3277e8aa2504d9 Grygorii Strashko       2020-01-15  177   * @ops: Ring operations
3277e8aa2504d9 Grygorii Strashko       2020-01-15  178   * @size: Ring size in elements
3277e8aa2504d9 Grygorii Strashko       2020-01-15  179   * @elm_size: Size of the ring element
3277e8aa2504d9 Grygorii Strashko       2020-01-15  180   * @mode: Ring mode
3277e8aa2504d9 Grygorii Strashko       2020-01-15  181   * @flags: flags
50883affe17e11 Lee Jones               2020-11-21  182   * @state: Ring state
3277e8aa2504d9 Grygorii Strashko       2020-01-15  183   * @ring_id: Ring Id
3277e8aa2504d9 Grygorii Strashko       2020-01-15  184   * @parent: Pointer on struct @k3_ringacc
3277e8aa2504d9 Grygorii Strashko       2020-01-15  185   * @use_count: Use count for shared rings
3277e8aa2504d9 Grygorii Strashko       2020-01-15  186   * @proxy_id: RA Ring Proxy Id (only if @K3_RINGACC_RING_USE_PROXY)
8c42379e40e2db Peter Ujfalusi          2020-10-25  187   * @dma_dev: device to be used for DMA API (allocation, mapping)
d782298c6f6b85 Grygorii Strashko       2020-12-08  188   * @asel: Address Space Select value for physical addresses
3277e8aa2504d9 Grygorii Strashko       2020-01-15  189   */
3277e8aa2504d9 Grygorii Strashko       2020-01-15  190  struct k3_ring {
3277e8aa2504d9 Grygorii Strashko       2020-01-15  191  	struct k3_ring_rt_regs __iomem *rt;
babdc2c3524293 Sai Sree Kartheek Adivi 2025-04-28  192  	struct k3_ring_cfg_regs __iomem *cfg;
babdc2c3524293 Sai Sree Kartheek Adivi 2025-04-28  193  	struct k3_ring_intr_regs __iomem *intr;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  194  	struct k3_ring_fifo_regs __iomem *fifos;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  195  	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  196  	dma_addr_t	ring_mem_dma;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  197  	void		*ring_mem_virt;
d9483b44c94eba Christophe JAILLET      2024-07-09  198  	const struct k3_ring_ops *ops;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  199  	u32		size;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  200  	enum k3_ring_size elm_size;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  201  	enum k3_ring_mode mode;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  202  	u32		flags;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  203  #define K3_RING_FLAG_BUSY	BIT(1)
3277e8aa2504d9 Grygorii Strashko       2020-01-15  204  #define K3_RING_FLAG_SHARED	BIT(2)
d782298c6f6b85 Grygorii Strashko       2020-12-08  205  #define K3_RING_FLAG_REVERSE	BIT(3)
6b3da0b475b877 Peter Ujfalusi          2020-07-24  206  	struct k3_ring_state state;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  207  	u32		ring_id;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  208  	struct k3_ringacc	*parent;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  209  	u32		use_count;
3277e8aa2504d9 Grygorii Strashko       2020-01-15  210  	int		proxy_id;
8c42379e40e2db Peter Ujfalusi          2020-10-25  211  	struct device	*dma_dev;
d782298c6f6b85 Grygorii Strashko       2020-12-08  212  	u32		asel;
d782298c6f6b85 Grygorii Strashko       2020-12-08  213  #define K3_ADDRESS_ASEL_SHIFT	48
3277e8aa2504d9 Grygorii Strashko       2020-01-15 @214  };
3277e8aa2504d9 Grygorii Strashko       2020-01-15  215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
