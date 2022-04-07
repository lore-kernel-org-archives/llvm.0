Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440AE17F1
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 04:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649306366; x=1680842366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BXVOFzFRBmVNJtFTdmXGegB5Bcl74SBOc6mimAvNA9I=;
  b=ejbP6NQiuc1zHYWt5bihiHOu/dJ4njHKyt9H1tgZcsoH6Im8mGv2FJvB
   a3Cv2Nqgq3XOqN9yP9CE7i8y0aUkS06Ct589KZogHyOya7nv2NNmSNzO7
   5YD9ouWHBTCbyXBRXgBEasAwjbX6t0auq6kCz50+Rpm/Gt7piNbAWul2n
   5Rd6X8R2ZTgXTjgjXZEefoWo1BWhlikVriE4fClHtIrUEU8vz9pZXC+5m
   D9TQNl7Gcybzm02c28/hcu7rfbmj29XqqVAK22qGf2IRWLvNhNfZkPdb8
   dFHV7hn7JHDhFJXXO8AyMxY/TH/vhJBNMQHL31YJ3QqrrhmjuTFOsgsvs
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347668060"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; 
   d="scan'208";a="347668060"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 21:39:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; 
   d="scan'208";a="658914419"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 06 Apr 2022 21:39:23 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncJvW-00054g-N4;
	Thu, 07 Apr 2022 04:39:22 +0000
Date: Thu, 7 Apr 2022 12:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 173/698]
 drivers/clk/clk-xlnx-clock-wizard.c:324:8: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202204071256.7UDkfVJu-lkp@intel.com>
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

tree:   https://github.com/Xilinx/linux-xlnx master
head:   b69197c3f3202af1a06397760e890444f726d900
commit: bf7387ee9a75c2a390b19f63c47076344e664b86 [173/698] clocking-wizard: Support higher frequency accuracy
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220407/202204071256.7UDkfVJu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b306233f78876a1d197ed6e1f05785505de7c63)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/bf7387ee9a75c2a390b19f63c47076344e664b86
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout bf7387ee9a75c2a390b19f63c47076344e664b86
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/clk-xlnx-clock-wizard.c:324:8: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
           reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
                 ^
>> drivers/clk/clk-xlnx-clock-wizard.c:392:6: error: implicit declaration of function 'FIELD_GET' [-Werror,-Wimplicit-function-declaration]
           d = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
               ^
   2 errors generated.


vim +/FIELD_PREP +324 drivers/clk/clk-xlnx-clock-wizard.c

   301	
   302	static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
   303					       unsigned long parent_rate)
   304	{
   305		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   306		u32 reg, pre;
   307		u16 retries;
   308		int err;
   309		u64 vco_freq, rate_div, f, clockout0_div;
   310	
   311		err = clk_wzrd_get_divisors(hw, rate, parent_rate);
   312		if (err)
   313			pr_err("failed to get divisors\n");
   314	
   315		vco_freq = DIV_ROUND_CLOSEST((parent_rate * divider->valuem), divider->valued);
   316		rate_div = DIV_ROUND_CLOSEST((vco_freq * WZRD_FRAC_POINTS), rate);
   317	
   318		clockout0_div = rate_div / WZRD_FRAC_POINTS;
   319	
   320		pre = DIV_ROUND_CLOSEST((vco_freq * WZRD_FRAC_POINTS), rate);
   321		f = (u32)(pre - (clockout0_div * WZRD_FRAC_POINTS));
   322		f = f & WZRD_CLKOUT_FRAC_MASK;
   323	
 > 324		reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
   325		      FIELD_PREP(WZRD_CLKOUT0_FRAC_MASK, f);
   326	
   327		writel(reg, divider->base + WZRD_CLK_CFG_REG(2));
   328		/* Set divisor and clear phase offset */
   329		reg = FIELD_PREP(WZRD_CLKFBOUT_MULT_MASK, divider->valuem) |
   330		      FIELD_PREP(WZRD_DIVCLK_DIVIDE_MASK, divider->valued);
   331		writel(reg, divider->base + WZRD_CLK_CFG_REG(0));
   332		writel(divider->valueo, divider->base + WZRD_CLK_CFG_REG(2));
   333		writel(0, divider->base + WZRD_CLK_CFG_REG(3));
   334		/* Check status register */
   335		retries = WZRD_DR_NUM_RETRIES;
   336		while (retries--) {
   337			if (readl(divider->base + WZRD_DR_STATUS_REG_OFFSET) &
   338								WZRD_DR_LOCK_BIT_MASK)
   339				break;
   340		}
   341	
   342		if (!retries)
   343			return -ETIMEDOUT;
   344	
   345		/* Initiate reconfiguration */
   346		writel(WZRD_DR_BEGIN_DYNA_RECONF,
   347		       divider->base + WZRD_DR_INIT_REG_OFFSET);
   348	
   349		/* Check status register */
   350		retries = WZRD_DR_NUM_RETRIES;
   351		while (retries--) {
   352			if (readl(divider->base + WZRD_DR_STATUS_REG_OFFSET) &
   353								WZRD_DR_LOCK_BIT_MASK)
   354				break;
   355		}
   356	
   357		if (!retries)
   358			return -ETIMEDOUT;
   359	
   360		return 0;
   361	}
   362	
   363	static int clk_wzrd_dynamic_all(struct clk_hw *hw, unsigned long rate,
   364					unsigned long parent_rate)
   365	{
   366		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   367		unsigned long flags = 0;
   368		int ret;
   369	
   370		if (divider->lock)
   371			spin_lock_irqsave(divider->lock, flags);
   372		else
   373			__acquire(divider->lock);
   374	
   375		ret = clk_wzrd_dynamic_all_nolock(hw, rate, parent_rate);
   376	
   377		if (divider->lock)
   378			spin_unlock_irqrestore(divider->lock, flags);
   379		else
   380			__release(divider->lock);
   381	
   382		return ret;
   383	}
   384	
   385	static unsigned long clk_wzrd_recalc_rate_all(struct clk_hw *hw,
   386						      unsigned long parent_rate)
   387	{
   388		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   389		u32 m, d, o, div, reg, f;
   390	
   391		reg = readl(divider->base + WZRD_CLK_CFG_REG(0));
 > 392		d = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
   393		m = FIELD_GET(WZRD_CLKFBOUT_MULT_MASK, reg);
   394		reg = readl(divider->base + WZRD_CLK_CFG_REG(2));
   395		o = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
   396		f = FIELD_GET(WZRD_CLKOUT0_FRAC_MASK, reg);
   397	
   398		div = DIV_ROUND_CLOSEST(d * (WZRD_FRAC_POINTS * o + f), WZRD_FRAC_POINTS);
   399		return divider_recalc_rate(hw, parent_rate * m, div, divider->table,
   400				divider->flags, divider->width);
   401	}
   402	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
