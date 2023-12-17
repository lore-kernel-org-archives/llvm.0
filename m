Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FA217EB;
	Sun, 17 Dec 2023 06:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAQMi0vR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702794153; x=1734330153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UOfljn2/Buy3WCX5qdZT6TCYFOZK0Bt9vsp6zD3Xdvw=;
  b=fAQMi0vREI1vQzNQfAEmVfbpY/B6YeV5T4tkUkhKj/erAWVv4YzYBT7h
   Gj+1B+Fz0+7hajVG7yimWh0csD8DTre+nVskek9cc7v9W47EsMOUPlrxp
   Ncb7zdlCt+SuwdbmF501CGoZmHYWyX3YJklPkOVGvNeScU++GYVP4HbEK
   OuXD1DP5RTrIQvjdZZMbVuHFNyMz/ZJly8FKUCBMjbJhXI3f0mFU3gFgJ
   FVCEkzzb60WsueE7bwaHA7u6qitKFKPhpACrzT3iBrK+rXGIAiinwSg+t
   oTecsgnaSlrsrgi6Ac68BfB41CVWo6jVAQY8ITQw2KS8J7x66NULVI9oI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="392574007"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="392574007"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 22:22:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="845577517"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="845577517"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2023 22:22:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEkXk-0002jY-1g;
	Sun, 17 Dec 2023 06:22:28 +0000
Date: Sun, 17 Dec 2023 14:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: drivers/dma/ste_dma40.c:57: warning: Excess struct member 'dev_tx'
 description in 'stedma40_platform_data'
Message-ID: <202312171417.izbQThoU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b8a9b2e6809d281890dd0a1102dc14d2cd11caf
commit: 42ae6f1695beed57958e7a2554e6d52dddc56e43 dmaengine: ste_dma40: Remove platform data
date:   7 months ago
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231217/202312171417.izbQThoU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171417.izbQThoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171417.izbQThoU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/ste_dma40.c:57: warning: Excess struct member 'dev_tx' description in 'stedma40_platform_data'
>> drivers/dma/ste_dma40.c:57: warning: Excess struct member 'dev_rx' description in 'stedma40_platform_data'
   drivers/dma/ste_dma40.c:151: warning: expecting prototype for enum 40_command. Prototype was for enum d40_command instead


vim +57 drivers/dma/ste_dma40.c

    30	
    31	/**
    32	 * struct stedma40_platform_data - Configuration struct for the dma device.
    33	 *
    34	 * @dev_tx: mapping between destination event line and io address
    35	 * @dev_rx: mapping between source event line and io address
    36	 * @disabled_channels: A vector, ending with -1, that marks physical channels
    37	 * that are for different reasons not available for the driver.
    38	 * @soft_lli_chans: A vector, that marks physical channels will use LLI by SW
    39	 * which avoids HW bug that exists in some versions of the controller.
    40	 * SoftLLI introduces relink overhead that could impact performace for
    41	 * certain use cases.
    42	 * @num_of_soft_lli_chans: The number of channels that needs to be configured
    43	 * to use SoftLLI.
    44	 * @use_esram_lcla: flag for mapping the lcla into esram region
    45	 * @num_of_memcpy_chans: The number of channels reserved for memcpy.
    46	 * @num_of_phy_chans: The number of physical channels implemented in HW.
    47	 * 0 means reading the number of channels from DMA HW but this is only valid
    48	 * for 'multiple of 4' channels, like 8.
    49	 */
    50	struct stedma40_platform_data {
    51		int				 disabled_channels[STEDMA40_MAX_PHYS];
    52		int				*soft_lli_chans;
    53		int				 num_of_soft_lli_chans;
    54		bool				 use_esram_lcla;
    55		int				 num_of_memcpy_chans;
    56		int				 num_of_phy_chans;
  > 57	};
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
