Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AFD2F25
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 17:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643997580; x=1675533580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ltd387I2tvCTe1OykRC839k9k8NWUEcAdz6wvQq+iJM=;
  b=Y+0JQkyWzjUnOZrv1nl20EeA+fxDZgaX89I2jeKx6mo99lGJLQYy1y9R
   nnC46+E8upGtOZd5BtJfIA8giqdiuVDGpBesnu4JRxg464xxJvw+JrjRa
   s/0QaForT99bFuhCpxWZAJR4gOSu1jCjnM4skdmNEY9q6yNXD+sLqyu5x
   /EQvg+Ppg6wot/YmHgxF8AuJMBMZMW/WuCosYKebjqVobmbBDKB0zTwrg
   35bkj0lt1Nr1Wptw/hvV9onuXDp9B8PYMEmJ4WD8nVtlo2/xmvhjto/Ad
   wBbMkKKK+0YSB/yeToTa5AcrRT9VoVWqSYimRO9mAx33+WNehJF8XnPW9
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="311714736"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="311714736"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 09:59:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="627847072"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2022 09:59:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nG2rx-000Xys-Dm; Fri, 04 Feb 2022 17:59:37 +0000
Date: Sat, 5 Feb 2022 01:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dipen Patel <dipenp@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 03/11] hte: Add tegra194 HTE kernel provider
Message-ID: <202202050111.cOZMMgeY-lkp@intel.com>
References: <20220201222630.21246-4-dipenp@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201222630.21246-4-dipenp@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dipen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 07f8c60fe60f84977dc815ec8a6b1100827c34dd]

url:    https://github.com/0day-ci/linux/commits/Dipen-Patel/Intro-to-Hardware-timestamping-engine/20220202-062447
base:   07f8c60fe60f84977dc815ec8a6b1100827c34dd
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220205/202202050111.cOZMMgeY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/6a6a517b6866ae7e4b1b878ab82312a9a2dc5b90
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dipen-Patel/Intro-to-Hardware-timestamping-engine/20220202-062447
        git checkout 6a6a517b6866ae7e4b1b878ab82312a9a2dc5b90
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/hte/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/hte/hte-tegra194.c:379:9: error: implicit declaration of function 'gpiod_enable_hw_timestamp' [-Werror,-Wimplicit-function-declaration]
                   ret = gpiod_enable_hw_timestamp(attr->line_data,
                         ^
   drivers/hte/hte-tegra194.c:405:9: error: implicit declaration of function 'gpiod_disable_hw_timestamp' [-Werror,-Wimplicit-function-declaration]
                   ret = gpiod_disable_hw_timestamp(attr->line_data,
                         ^
>> drivers/hte/hte-tegra194.c:431:5: warning: no previous prototype for function 'tegra_hte_get_level' [-Wmissing-prototypes]
   int tegra_hte_get_level(struct tegra_hte_soc *gs, u32 line_id)
       ^
   drivers/hte/hte-tegra194.c:431:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tegra_hte_get_level(struct tegra_hte_soc *gs, u32 line_id)
   ^
   static 
>> drivers/hte/hte-tegra194.c:486:6: warning: no previous prototype for function 'tegra_hte_match_from_linedata' [-Wmissing-prototypes]
   bool tegra_hte_match_from_linedata(const struct hte_chip *chip,
        ^
   drivers/hte/hte-tegra194.c:486:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool tegra_hte_match_from_linedata(const struct hte_chip *chip,
   ^
   static 
   2 warnings and 2 errors generated.


vim +/tegra_hte_get_level +431 drivers/hte/hte-tegra194.c

   430	
 > 431	int tegra_hte_get_level(struct tegra_hte_soc *gs, u32 line_id)
   432	{
   433		struct gpio_desc *desc;
   434	
   435		if (gs->prov_data->type == HTE_TEGRA_TYPE_GPIO) {
   436			desc = gs->line_data[line_id].data;
   437			if (desc)
   438				return gpiod_get_raw_value(desc);
   439		}
   440	
   441		return -1;
   442	}
   443	
   444	static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
   445	{
   446		u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
   447		u64 tsc;
   448		struct hte_ts_data el;
   449	
   450		while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
   451			HTE_TESTATUS_OCCUPANCY_SHIFT) &
   452			HTE_TESTATUS_OCCUPANCY_MASK) {
   453			tsh = tegra_hte_readl(gs, HTE_TETSCH);
   454			tsl = tegra_hte_readl(gs, HTE_TETSCL);
   455			tsc = (((u64)tsh << 32) | tsl);
   456	
   457			src = tegra_hte_readl(gs, HTE_TESRC);
   458			slice = (src >> HTE_TESRC_SLICE_SHIFT) &
   459				    HTE_TESRC_SLICE_DEFAULT_MASK;
   460	
   461			pv = tegra_hte_readl(gs, HTE_TEPCV);
   462			cv = tegra_hte_readl(gs, HTE_TECCV);
   463			acv = pv ^ cv;
   464			while (acv) {
   465				bit_index = __builtin_ctz(acv);
   466				line_id = bit_index + (slice << 5);
   467				el.tsc = tsc << HTE_TS_NS_SHIFT;
   468				el.raw_level = tegra_hte_get_level(gs, line_id);
   469				hte_push_ts_ns(gs->chip, line_id, &el);
   470				acv &= ~BIT(bit_index);
   471			}
   472			tegra_hte_writel(gs, HTE_TECMD, HTE_TECMD_CMD_POP);
   473		}
   474	}
   475	
   476	static irqreturn_t tegra_hte_isr(int irq, void *dev_id)
   477	{
   478		struct tegra_hte_soc *gs = dev_id;
   479		(void)irq;
   480	
   481		tegra_hte_read_fifo(gs);
   482	
   483		return IRQ_HANDLED;
   484	}
   485	
 > 486	bool tegra_hte_match_from_linedata(const struct hte_chip *chip,
   487					   const struct hte_ts_desc *hdesc)
   488	{
   489		struct tegra_hte_soc *hte_dev = chip->data;
   490	
   491		if (!hte_dev || (hte_dev->prov_data->type != HTE_TEGRA_TYPE_GPIO))
   492			return false;
   493	
   494		return hte_dev->c == gpiod_to_chip(hdesc->attr.line_data);
   495	}
   496	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
