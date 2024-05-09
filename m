Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABA01494D9;
	Thu,  9 May 2024 08:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715242750; cv=none; b=eZdD0Ho4dSgJdL5cS/d0BTFPXoWh72jHfcqTuIFsITdtmoQYeDhNVvISxLyb5KXUWMM4DVwTigXL0XzK8OzovYr3itPvDoZKp7MoOizaA2T51y6BwyXet1noBYIJks2ERGU7P9ACtj9Sf0k86tWBWLgQ2aCLhY+MROGErTAu2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715242750; c=relaxed/simple;
	bh=tF0X5jGVbAKJufeKAGAhWp67AQ8fCvgmSv1yhY5y1jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSsg6hWpmxu7M6mFAKpOYA3I8taJTEPTUaIihMlb1/MHI4c3k+fHI7jk/s2LUuPJwDPHQEWsDu6DINvvk/g0DEWGM5B6sU85uUY2IJBTdwU5xXwjaU9MYnybAYsNP0gWK6u/bOk1j4Vk3mb1nCwQvfLYOZAFnlD+1ZuXWG7eaAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hA6Ml6ae; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hA6Ml6ae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715242748; x=1746778748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tF0X5jGVbAKJufeKAGAhWp67AQ8fCvgmSv1yhY5y1jA=;
  b=hA6Ml6aeTYgyjEmbbbVnn9Q4XSJ1GNtxGoLGd5ADt8ViRMETW6GnPPwz
   KYcjUF90rIVP8KoREF79Gm6MlCboQraS4ABd3VAGSM8GGZ1KyvCdHntbu
   uJGjsha5HSbkaAQNiii5HVHHICpqWx+x5C9HltBq5BOv00fbLyIaxpuDy
   v9xiIL72QMrXGPfshVlq7sCRvQZMTVK576cv/qKK9z09Rx9MAkAqVlF0I
   sWkRAhjueXuU+tC/J0vTRGNw76b1iOaeroaddbS4gxuM+OKi4pyAtqZST
   PwqwaIDSGz14gwjjB7xPbMS4NzpX3Jwuy4e5MobXNOr5hWiDWaJnMxGzd
   A==;
X-CSE-ConnectionGUID: GFMYYe4bQq6yimP34F/8bw==
X-CSE-MsgGUID: SAVzf0W7TxCCazmmYYxnSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11360639"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="11360639"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 01:19:07 -0700
X-CSE-ConnectionGUID: meyYVVIxSJ2oW3Fr180rtQ==
X-CSE-MsgGUID: 7E50C4vdTYGZUak4mmR2yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="60340458"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2024 01:19:06 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4yzX-0004dJ-2V;
	Thu, 09 May 2024 08:19:03 +0000
Date: Thu, 9 May 2024 16:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 07/11] i2c: tegra: config settings for interface
 timings
Message-ID: <202405091512.rrDDf4UJ-lkp@intel.com>
References: <20240506225139.57647-8-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506225139.57647-8-kyarlagadda@nvidia.com>

Hi Krishna,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on robh/for-next andi-shyti/i2c/i2c-host wsa/i2c/for-next linus/master v6.9-rc7 next-20240508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Yarlagadda/Documentation-Introduce-config-settings-framework/20240507-065814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20240506225139.57647-8-kyarlagadda%40nvidia.com
patch subject: [RFC PATCH 07/11] i2c: tegra: config settings for interface timings
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240509/202405091512.rrDDf4UJ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405091512.rrDDf4UJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405091512.rrDDf4UJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-tegra.c:234: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * I2C register config fields.
   drivers/i2c/busses/i2c-tegra.c:346: warning: Function parameter or struct member 'dma_dev' not described in 'tegra_i2c_dev'
>> drivers/i2c/busses/i2c-tegra.c:346: warning: Function parameter or struct member 'list' not described in 'tegra_i2c_dev'


vim +234 drivers/i2c/busses/i2c-tegra.c

   232	
   233	/**
 > 234	 * I2C register config fields.
   235	 */
   236	static const struct tegra_cfg_field_desc i2c_cfg_fields[] = {
   237		TEGRA_CFG_FIELD("nvidia,i2c-clk-divisor-fs-mode",
   238				I2C_CLK_DIVISOR, I2C_CLK_DIVISOR_STD_FAST_MODE),
   239		TEGRA_CFG_FIELD("nvidia,i2c-clk-divisor-hs-mode",
   240				I2C_CLK_DIVISOR, I2C_CLK_DIVISOR_HSMODE),
   241		TEGRA_CFG_FIELD("nvidia,i2c-hs-sclk-high-period",
   242				I2C_HS_INTERFACE_TIMING_0,
   243				I2C_HS_INTERFACE_TIMING_THIGH),
   244		TEGRA_CFG_FIELD("nvidia,i2c-hs-sclk-low-period",
   245				I2C_HS_INTERFACE_TIMING_0,
   246				I2C_HS_INTERFACE_TIMING_TLOW),
   247		TEGRA_CFG_FIELD("nvidia,i2c-hs-stop-setup-time",
   248				I2C_HS_INTERFACE_TIMING_1,
   249				I2C_HS_INTERFACE_TIMING_TSU_STO),
   250		TEGRA_CFG_FIELD("nvidia,i2c-hs-start-hold-time",
   251				I2C_HS_INTERFACE_TIMING_1,
   252				I2C_HS_INTERFACE_TIMING_THD_STA),
   253		TEGRA_CFG_FIELD("nvidia,i2c-hs-start-setup-time",
   254				I2C_HS_INTERFACE_TIMING_1,
   255				I2C_HS_INTERFACE_TIMING_TSU_STA),
   256		TEGRA_CFG_FIELD("nvidia,i2c-sclk-high-period",
   257				I2C_INTERFACE_TIMING_0, I2C_INTERFACE_TIMING_THIGH),
   258		TEGRA_CFG_FIELD("nvidia,i2c-sclk-low-period",
   259				I2C_INTERFACE_TIMING_0, I2C_INTERFACE_TIMING_TLOW),
   260		TEGRA_CFG_FIELD("nvidia,i2c-bus-free-time",
   261				I2C_INTERFACE_TIMING_1, I2C_INTERFACE_TIMING_TBUF),
   262		TEGRA_CFG_FIELD("nvidia,i2c-stop-setup-time",
   263				I2C_INTERFACE_TIMING_1, I2C_INTERFACE_TIMING_TSU_STO),
   264		TEGRA_CFG_FIELD("nvidia,i2c-start-hold-time",
   265				I2C_INTERFACE_TIMING_1, I2C_INTERFACE_TIMING_THD_STA),
   266		TEGRA_CFG_FIELD("nvidia,i2c-start-setup-time",
   267				I2C_INTERFACE_TIMING_1, I2C_INTERFACE_TIMING_TSU_STA),
   268	};
   269	
   270	static struct tegra_cfg_desc i2c_cfg_desc = {
   271		.num_regs = 0,
   272		.num_fields = ARRAY_SIZE(i2c_cfg_fields),
   273		.fields = i2c_cfg_fields,
   274	};
   275	
   276	/**
   277	 * struct tegra_i2c_dev - per device I2C context
   278	 * @dev: device reference for power management
   279	 * @hw: Tegra I2C HW feature
   280	 * @adapter: core I2C layer adapter information
   281	 * @div_clk: clock reference for div clock of I2C controller
   282	 * @clocks: array of I2C controller clocks
   283	 * @nclocks: number of clocks in the array
   284	 * @rst: reset control for the I2C controller
   285	 * @base: ioremapped registers cookie
   286	 * @base_phys: physical base address of the I2C controller
   287	 * @cont_id: I2C controller ID, used for packet header
   288	 * @irq: IRQ number of transfer complete interrupt
   289	 * @is_dvc: identifies the DVC I2C controller, has a different register layout
   290	 * @is_vi: identifies the VI I2C controller, has a different register layout
   291	 * @msg_complete: transfer completion notifier
   292	 * @msg_buf_remaining: size of unsent data in the message buffer
   293	 * @msg_len: length of message in current transfer
   294	 * @msg_err: error code for completed message
   295	 * @msg_buf: pointer to current message data
   296	 * @msg_read: indicates that the transfer is a read access
   297	 * @timings: i2c timings information like bus frequency
   298	 * @multimaster_mode: indicates that I2C controller is in multi-master mode
   299	 * @dma_chan: DMA channel
   300	 * @dma_phys: handle to DMA resources
   301	 * @dma_buf: pointer to allocated DMA buffer
   302	 * @dma_buf_size: DMA buffer size
   303	 * @dma_mode: indicates active DMA transfer
   304	 * @dma_complete: DMA completion notifier
   305	 * @atomic_mode: indicates active atomic transfer
   306	 */
   307	struct tegra_i2c_dev {
   308		struct device *dev;
   309		struct i2c_adapter adapter;
   310	
   311		const struct tegra_i2c_hw_feature *hw;
   312		struct reset_control *rst;
   313		unsigned int cont_id;
   314		unsigned int irq;
   315	
   316		phys_addr_t base_phys;
   317		void __iomem *base;
   318	
   319		struct clk_bulk_data clocks[2];
   320		unsigned int nclocks;
   321	
   322		struct clk *div_clk;
   323		struct i2c_timings timings;
   324	
   325		struct completion msg_complete;
   326		size_t msg_buf_remaining;
   327		unsigned int msg_len;
   328		int msg_err;
   329		u8 *msg_buf;
   330	
   331		struct completion dma_complete;
   332		struct dma_chan *dma_chan;
   333		unsigned int dma_buf_size;
   334		struct device *dma_dev;
   335		dma_addr_t dma_phys;
   336		void *dma_buf;
   337	
   338		struct tegra_cfg_list *list;
   339	
   340		bool multimaster_mode;
   341		bool atomic_mode;
   342		bool dma_mode;
   343		bool msg_read;
   344		bool is_dvc;
   345		bool is_vi;
 > 346	};
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
