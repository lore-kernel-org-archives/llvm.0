Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ABE643
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 07:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647847703; x=1679383703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3XiR2aCLOnGO8i8qifDIkgNyjS+AntjEKdLnXVQp0Zw=;
  b=f0DW2FW8Kwqs4K4qDP1T8HGVqUmeBt66j+YiEJ3t2TyvUKdT+pogECox
   vh0863WWbYb3Brx+eSU3IDySmzi22D99cLhF2cu4Pj+vYETEEdycA8BHW
   B/sEbw5nm4270BkPrZb1fnEylhsrgSDEcmsiFmnPmxaV//t2p29qkjoxh
   a6OE9a//aRhAB0UCiiAc75kWZ4AQbqp3KntK0p6dwr3eyMxeyizt5Oq0k
   d6lJqpdkoY0Gzm1DTjDi69nVJxx1aH2qLbl+AumfIAVMaXcF/FF1cWYJn
   8TEv0XtBApMutew2Ay9Sni5TmylrQjhzVUf0ELzo/QUlSzb2D0I+jnlqE
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="238091899"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; 
   d="scan'208";a="238091899"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 00:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; 
   d="scan'208";a="648462972"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Mar 2022 00:28:20 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWCSh-000HbD-J2; Mon, 21 Mar 2022 07:28:19 +0000
Date: Mon, 21 Mar 2022 15:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5 v2] clk: ux500: Implement the missing CLKOUT clocks
Message-ID: <202203211549.CqMHSrT8-lkp@intel.com>
References: <20220319225156.1451636-6-linus.walleij@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319225156.1451636-6-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Linus,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.17 next-20220318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Linus-Walleij/U8500-clkout-clocks-v2/20220320-070131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm-buildonly-randconfig-r004-20220321 (https://download.01.org/0day-ci/archive/20220321/202203211549.CqMHSrT8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/b9b90d02e856e84100c5613ebb25d1ab7a1069ec
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Linus-Walleij/U8500-clkout-clocks-v2/20220320-070131
        git checkout b9b90d02e856e84100c5613ebb25d1ab7a1069ec
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/ux500/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/ux500/u8500_of_clk.c:131:17: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
           struct clk_hw *hw;
                          ^
   1 warning generated.


vim +/hw +131 drivers/clk/ux500/u8500_of_clk.c

   124	
   125	static void u8500_clk_init(struct device_node *np)
   126	{
   127		struct prcmu_fw_version *fw_version;
   128		struct device_node *child = NULL;
   129		const char *sgaclk_parent = NULL;
   130		struct clk *clk, *rtc_clk, *twd_clk;
 > 131		struct clk_hw *hw;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
