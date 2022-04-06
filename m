Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEE733D7
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 13:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649251631; x=1680787631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Stjv3mx9BPImjsCvV59JH8Iw6F4O/0nkmdN0BxEo8E=;
  b=m2ZKxAfhlw7NanHOP8IEtm457hjqe4vq6BhWCiGzQV09DsvNIo0MC0ib
   KZBbL3IEz9+3qYLfl4LvEY1jFJLPPZ1SjmBqGyrF06q9NHqWnZYVQEKkw
   VZcqXmTmrc+ouFvIyP8yQxB/PbHKUMNJbg4Cj+Oz8uEEJ8nJT1LZIeECY
   LnhDlWUaxnIHP02vjinVeKAiXl/sybmFebcHBa+r65f5LVADVuInWapA/
   40UM5pjsZ6AoujttKG/mcU+VpAW39cX1ZHEmu4BmOVNRVbCd6ZaJrP6t/
   bGUcf3i1kCfsJ4JkOWmEudI8viFRqTuqiOhOTHgUGct1/pj2pvMEG2m8S
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347486254"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="347486254"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 06:27:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="524469763"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2022 06:27:02 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nc5gc-0004RB-5I;
	Wed, 06 Apr 2022 13:27:02 +0000
Date: Wed, 6 Apr 2022 21:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 132/1080]
 drivers/clk/clk-xlnx-clock-wizard.c:309:8: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202204062138.zt20ujkZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Shubhrajyoti,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   4cf4408c2dbe725bb8530f851fbf277b9343f602
commit: e7cc160039f02d71ef5a3b16038d325ad76ab59e [132/1080] clocking-wizard: Support higher frequency accuracy
config: hexagon-randconfig-r013-20220406 (https://download.01.org/0day-ci/archive/20220406/202204062138.zt20ujkZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/e7cc160039f02d71ef5a3b16038d325ad76ab59e
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout e7cc160039f02d71ef5a3b16038d325ad76ab59e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/clk-xlnx-clock-wizard.c:309:8: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
           reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
                 ^
>> drivers/clk/clk-xlnx-clock-wizard.c:369:6: error: implicit declaration of function 'FIELD_GET' [-Werror,-Wimplicit-function-declaration]
           d = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
               ^
   2 errors generated.


vim +/FIELD_PREP +309 drivers/clk/clk-xlnx-clock-wizard.c

   286	
   287	static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
   288					       unsigned long parent_rate)
   289	{
   290		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   291		u32 reg, pre;
   292		u32 value;
   293		int err;
   294		u64 vco_freq, rate_div, f, clockout0_div;
   295	
   296		err = clk_wzrd_get_divisors(hw, rate, parent_rate);
   297		if (err)
   298			pr_err("failed to get divisors\n");
   299	
   300		vco_freq = DIV_ROUND_CLOSEST((parent_rate * divider->valuem), divider->valued);
   301		rate_div = DIV_ROUND_CLOSEST((vco_freq * WZRD_FRAC_POINTS), rate);
   302	
   303		clockout0_div = rate_div / WZRD_FRAC_POINTS;
   304	
   305		pre = DIV_ROUND_CLOSEST((vco_freq * WZRD_FRAC_POINTS), rate);
   306		f = (u32)(pre - (clockout0_div * WZRD_FRAC_POINTS));
   307		f = f & WZRD_CLKOUT_FRAC_MASK;
   308	
 > 309		reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
   310		      FIELD_PREP(WZRD_CLKOUT0_FRAC_MASK, f);
   311	
   312		writel(reg, divider->base + WZRD_CLK_CFG_REG(2));
   313		/* Set divisor and clear phase offset */
   314		reg = FIELD_PREP(WZRD_CLKFBOUT_MULT_MASK, divider->valuem) |
   315		      FIELD_PREP(WZRD_DIVCLK_DIVIDE_MASK, divider->valued);
   316		writel(reg, divider->base + WZRD_CLK_CFG_REG(0));
   317		writel(divider->valueo, divider->base + WZRD_CLK_CFG_REG(2));
   318		writel(0, divider->base + WZRD_CLK_CFG_REG(3));
   319		/* Check status register */
   320		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
   321					 value & WZRD_DR_LOCK_BIT_MASK,
   322					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   323		if (err)
   324			return -ETIMEDOUT;
   325	
   326		/* Initiate reconfiguration */
   327		writel(WZRD_DR_BEGIN_DYNA_RECONF,
   328		       divider->base + WZRD_DR_INIT_REG_OFFSET);
   329	
   330		/* Check status register */
   331		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
   332					 value & WZRD_DR_LOCK_BIT_MASK,
   333					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   334		if (err)
   335			return -ETIMEDOUT;
   336	
   337		return 0;
   338	}
   339	
   340	static int clk_wzrd_dynamic_all(struct clk_hw *hw, unsigned long rate,
   341					unsigned long parent_rate)
   342	{
   343		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   344		unsigned long flags = 0;
   345		int ret;
   346	
   347		if (divider->lock)
   348			spin_lock_irqsave(divider->lock, flags);
   349		else
   350			__acquire(divider->lock);
   351	
   352		ret = clk_wzrd_dynamic_all_nolock(hw, rate, parent_rate);
   353	
   354		if (divider->lock)
   355			spin_unlock_irqrestore(divider->lock, flags);
   356		else
   357			__release(divider->lock);
   358	
   359		return ret;
   360	}
   361	
   362	static unsigned long clk_wzrd_recalc_rate_all(struct clk_hw *hw,
   363						      unsigned long parent_rate)
   364	{
   365		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   366		u32 m, d, o, div, reg, f;
   367	
   368		reg = readl(divider->base + WZRD_CLK_CFG_REG(0));
 > 369		d = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
   370		m = FIELD_GET(WZRD_CLKFBOUT_MULT_MASK, reg);
   371		reg = readl(divider->base + WZRD_CLK_CFG_REG(2));
   372		o = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
   373		f = FIELD_GET(WZRD_CLKOUT0_FRAC_MASK, reg);
   374	
   375		div = DIV_ROUND_CLOSEST(d * (WZRD_FRAC_POINTS * o + f), WZRD_FRAC_POINTS);
   376		return divider_recalc_rate(hw, parent_rate * m, div, divider->table,
   377				divider->flags, divider->width);
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
