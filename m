Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCD57E0;
	Fri, 31 Mar 2023 22:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680302293; x=1711838293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bAdgdM9qxWwNUygkEZ9jWDGPYJInba7mW77utGzoikU=;
  b=LIncV/wluPwUptzhlkpsQdyKpdMkw55TuVxfeU+AIgn70wPwaLuDIqK+
   YBF1cxm+fgRGcytJZTj9ceSgLA9qXmvjJWbmm4VztErekI+tLVRbLIxZh
   OKQS0XRF9E8A4egoSFTXcnok97nN9FYsIYGaCXh1JiOdrXW58Er8M6lWj
   Nlb9zgJ9vJTkjKYVEkp5NqWDegqm2pNUdQLM3/PySVKara5evc1EwrtxJ
   XmDKhxQruaWQEf6H8/gnAJHR4cLJkAnMZhfYDifYoL9TmXP2tPPSjt8U7
   VCEKSroNsQ7QRYohFRhWKCXIrq/MHvwqTSn+tDhfStf+1qqFAKqN7NBu5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321964640"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="321964640"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 15:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="1015003336"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="1015003336"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 Mar 2023 15:38:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piNNf-000MEf-2L;
	Fri, 31 Mar 2023 22:37:59 +0000
Date: Sat, 1 Apr 2023 06:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Geis <pgwipeout@gmail.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv1 2/2] soc: rockchip: power-domain: add rk3588 mem module
 support
Message-ID: <202304010627.ugL7o7Ct-lkp@intel.com>
References: <20230331163058.5688-3-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331163058.5688-3-sebastian.reichel@collabora.com>

Hi Sebastian,

I love your patch! Yet something to improve:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/clk-rockchip-rk3588-make-gate-linked-clocks-ignore-unused/20230401-003605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20230331163058.5688-3-sebastian.reichel%40collabora.com
patch subject: [PATCHv1 2/2] soc: rockchip: power-domain: add rk3588 mem module support
config: riscv-randconfig-r042-20230329 (https://download.01.org/0day-ci/archive/20230401/202304010627.ugL7o7Ct-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8a9b7bc14bff10030ef40e0350429490ff984f26
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sebastian-Reichel/clk-rockchip-rk3588-make-gate-linked-clocks-ignore-unused/20230401-003605
        git checkout 8a9b7bc14bff10030ef40e0350429490ff984f26
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/rockchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010627.ugL7o7Ct-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/rockchip/pm_domains.c:462:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           dsb(sy);
           ^
>> drivers/soc/rockchip/pm_domains.c:462:6: error: use of undeclared identifier 'sy'
           dsb(sy);
               ^
   drivers/soc/rockchip/pm_domains.c:475:6: error: use of undeclared identifier 'sy'
           dsb(sy);
               ^
   3 errors generated.


vim +/dsb +462 drivers/soc/rockchip/pm_domains.c

   441	
   442	static int rockchip_pmu_domain_mem_reset(struct rockchip_pm_domain *pd)
   443	{
   444		struct rockchip_pmu *pmu = pd->pmu;
   445		struct generic_pm_domain *genpd = &pd->genpd;
   446		bool is_on;
   447		int ret = 0;
   448	
   449		ret = readx_poll_timeout_atomic(rockchip_pmu_domain_is_chain_on, pd, is_on,
   450						is_on == true, 0, 10000);
   451		if (ret) {
   452			dev_err(pmu->dev,
   453				"failed to get chain status '%s', target_on=1, val=%d\n",
   454				genpd->name, is_on);
   455			goto error;
   456		}
   457	
   458		udelay(20);
   459	
   460		regmap_write(pmu->regmap, pmu->info->mem_pwr_offset + pd->info->pwr_offset,
   461			     (pd->info->pwr_mask | pd->info->pwr_w_mask));
 > 462		dsb(sy);
   463	
   464		ret = readx_poll_timeout_atomic(rockchip_pmu_domain_is_mem_on, pd, is_on,
   465						is_on == false, 0, 10000);
   466		if (ret) {
   467			dev_err(pmu->dev,
   468				"failed to get mem status '%s', target_on=0, val=%d\n",
   469				genpd->name, is_on);
   470			goto error;
   471		}
   472	
   473		regmap_write(pmu->regmap, pmu->info->mem_pwr_offset + pd->info->pwr_offset,
   474			     pd->info->pwr_w_mask);
   475		dsb(sy);
   476	
   477		ret = readx_poll_timeout_atomic(rockchip_pmu_domain_is_mem_on, pd, is_on,
   478						is_on == true, 0, 10000);
   479		if (ret) {
   480			dev_err(pmu->dev,
   481				"failed to get mem status '%s', target_on=1, val=%d\n",
   482				genpd->name, is_on);
   483		}
   484	
   485	error:
   486		return ret;
   487	}
   488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
