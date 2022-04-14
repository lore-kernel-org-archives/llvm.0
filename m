Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F50B28F6
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 13:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649942576; x=1681478576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q5s6Mi1KwZaanmP+MLd/OHLPbqoXDxfYP5xCn4DY2ZE=;
  b=Pf0LKGuwpRjlhRJ846sMA+9DWrbyriiRsFglyh5MH/xV4VKLaJsL86rD
   aa1NGSdcO+fuXRpu75ai1JrNtNpHUZi8EiMIMYwWtqRTQyX6sRsQ6oR5M
   PR6nN7tLSC8es78O441cGmGSL9Hy5sFq8fiA8+L5as2FFf9Qu7FXO7bG6
   Wpry+OGs4eY8BgHD5lPrlPnelJkmXlGeVdcjACRH1HCHAQGGPEsLRPoUg
   x6HWBO1aBv04d4uR4knKNp9CxafOwvO9lviWxWRCr413H6ogXcQN+no+2
   07rfEv04TSDsEfEsEvPDrb7eHuwBvgB9CMSdRwL2aHTbnyl8+71MFFINs
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="287982771"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="287982771"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 06:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="612330530"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2022 06:22:54 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nezQz-0000zI-Bk;
	Thu, 14 Apr 2022 13:22:53 +0000
Date: Thu, 14 Apr 2022 21:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 132/1093]
 drivers/clk/clk-xlnx-clock-wizard.c:309:8: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202204142127.ZUtBDF8x-lkp@intel.com>
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
head:   b1635a7683e2274f21d795783e4c9db7e518267a
commit: e7cc160039f02d71ef5a3b16038d325ad76ab59e [132/1093] clocking-wizard: Support higher frequency accuracy
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220414/202204142127.ZUtBDF8x-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/e7cc160039f02d71ef5a3b16038d325ad76ab59e
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout e7cc160039f02d71ef5a3b16038d325ad76ab59e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

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
