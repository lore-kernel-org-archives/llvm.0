Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE835168
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 20:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642017973; x=1673553973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6SUhgT2fdHu5uYNshOyw0Ikr1FDKLVrHDEScuPNKw/U=;
  b=m19/p8yipl4Z158TFM84Pt8VteMX8rX+diwxpOwrzUsEHVsEdcMdszFQ
   S1rK/rbCRr1NlKHi7yZ7kNSpZVFWVFM8pk69AT9t5x3lbWwLi1b8G2S9o
   tqwSkIjtwudE1X6Ck4gPIL7n3k8V+LZtuaP+PXqn+uTh22xDcrz6QrpzP
   eC8CTwI7/F/gK5ZiintuQWZu5wj9CiW1M7O/dA/MQDB7BiETtpGD1c3KP
   vYuKPf1AlwM6cUylR40y0YszpTfsh26slZiQqgXBFf78Leq8e5Z9P1RIA
   OM4vC9ION2Eo7dCYvAE1B8dLUscYtsWLGeW7UmAVpHK7KloEFHNIv5MBM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="330192164"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="330192164"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 12:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="475046922"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jan 2022 12:06:11 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7jso-0006Km-8Z; Wed, 12 Jan 2022 20:06:10 +0000
Date: Thu, 13 Jan 2022 04:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 173/326]
 drivers/clk/clk-xlnx-clock-wizard.c:324:8: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202201130302.pmg1cg7e-lkp@intel.com>
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
head:   6a698dbaaf0e6caa053476c2f661b36885a0ce30
commit: bf7387ee9a75c2a390b19f63c47076344e664b86 [173/326] clocking-wizard: Support higher frequency accuracy
config: riscv-randconfig-r042-20220112 (https://download.01.org/0day-ci/archive/20220113/202201130302.pmg1cg7e-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/bf7387ee9a75c2a390b19f63c47076344e664b86
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout bf7387ee9a75c2a390b19f63c47076344e664b86
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/

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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
