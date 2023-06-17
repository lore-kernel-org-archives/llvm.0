Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961198C0F;
	Sat, 17 Jun 2023 12:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687004147; x=1718540147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mQ87SPnE3Di8X8k0ALKsp3NAdHIXJcUi2J4OGCuvT7M=;
  b=jC0aBWdI1eOU3FDyesENWEP3tJUvux+sKMEA8M6J1SFhEuuZWB0I6Jva
   oxsm5ueJyD6JHjJ81D79Q610AO/ZREEBDflh+NEz2zuCVQGo2D086Yjya
   FwSQ21Hhh6om0S6E6REJa3X+EBGwSrLzs4cUPlRgvGv3pKLyXCdP56O2z
   EYx4uwtT/1aN2IDv+v+1xXOiYA3rG+XoQ//oDYOkQ/3Yifa8DDERk2bxa
   sGx777Z9LAk8WJ+gUz6ezd2Dut2OwQkKMk19919lEN6CMZ4ubszfTQcYp
   XxXQAhLtW3za/YklVrn37PbtHZbFKhd2Wtob0NJWVEd0WY3ydaLmYUNaB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="344123938"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="344123938"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 05:15:37 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="746738268"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="746738268"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jun 2023 05:15:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAUq4-0002jg-1C;
	Sat, 17 Jun 2023 12:15:32 +0000
Date: Sat, 17 Jun 2023 20:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Oltmanns <frank@oltmanns.dev>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Frank Oltmanns <frank@oltmanns.dev>,
	"A.s. Dong" <aisheng.dong@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: Re: [PATCH v4 2/2] clk: fractional-divider: tests: Add test suite
 for edge cases
Message-ID: <202306172036.EevtaVp6-lkp@intel.com>
References: <20230617102919.27564-3-frank@oltmanns.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230617102919.27564-3-frank@oltmanns.dev>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.4-rc6 next-20230616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Oltmanns/clk-fractional-divider-Improve-approximation-when-zero-based-and-export/20230617-183118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230617102919.27564-3-frank%40oltmanns.dev
patch subject: [PATCH v4 2/2] clk: fractional-divider: tests: Add test suite for edge cases
config: hexagon-randconfig-r035-20230617 (https://download.01.org/0day-ci/archive/20230617/202306172036.EevtaVp6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306172036.EevtaVp6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306172036.EevtaVp6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-fractional-divider_test.c:26:41: warning: variable 'max_m' set but not used [-Wunused-but-set-variable]
      26 |         unsigned long rate, parent_rate, m, n, max_m, max_n;
         |                                                ^
   drivers/clk/clk-fractional-divider_test.c:88:41: warning: variable 'max_m' set but not used [-Wunused-but-set-variable]
      88 |         unsigned long rate, parent_rate, m, n, max_m, max_n;
         |                                                ^
   2 warnings generated.


vim +/max_m +26 drivers/clk/clk-fractional-divider_test.c

    15	
    16	/*
    17	 * Test the maximum denominator case for fd clock without flags.
    18	 *
    19	 * Expect the highest possible denominator to be used in order to get as close as possible to the
    20	 * requested rate.
    21	 */
    22	static void clk_fd_test_approximation_max_denominator(struct kunit *test)
    23	{
    24		struct clk_fractional_divider *fd;
    25		struct clk_hw *hw;
  > 26		unsigned long rate, parent_rate, m, n, max_m, max_n;
    27	
    28		fd = kunit_kzalloc(test, sizeof(*fd), GFP_KERNEL);
    29		KUNIT_ASSERT_NOT_NULL(test, fd);
    30	
    31		fd->mwidth = 3;
    32		max_m = 7;
    33		fd->nwidth = 3;
    34		max_n = 7;
    35	
    36		hw = &fd->hw;
    37	
    38		rate = 240000000;
    39		parent_rate = (max_n + 1) * rate; /* so that it exceeds the maximum divisor */
    40	
    41		clk_fractional_divider_general_approximation(hw, rate, &parent_rate, &m, &n);
    42		KUNIT_EXPECT_EQ(test, parent_rate, (max_n + 1) * rate); /* parent remains unchanged */
    43		KUNIT_EXPECT_EQ(test, m, 1);
    44		KUNIT_EXPECT_EQ(test, n, max_n);
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
