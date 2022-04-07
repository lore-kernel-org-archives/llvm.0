Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8B229A1
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 21:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649368600; x=1680904600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iv0YEy/6RHfewiFfEM0ZrXNUXZFDtIjBQRmrzXCsrTc=;
  b=K4+Vs7LcxWFz58/sl19D7EYb0+QQmXCBRxcx5cSvts/R+oAUf7MlIt4n
   GyhOSO4WZdwVb7yYqfluUZebBW8+pkgYIRCksi8ujBEmUoEnfzi6qgmqB
   8izNh7YvqUyd5eceuzjpwLjtFA/FNWKlBGHQBHEKCq3ElGgfG9oGCxF4i
   kFSv7cHakuoYcee2lk4qIdxgJ6zwxhUth9kOoYINNecyEW8dhrlGWyuLL
   s6ZTkGhsqp81hI9zYM7D8mySXLKBld5m2Alq+9h27FByry9tuKB3SeDjt
   Rsm59n88nUPwLIYP/QF+sJhKe1dAONnwjp7fPU/mz6jJsE7TuN65jkIP/
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="324611907"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="324611907"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2022 14:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="524547730"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 07 Apr 2022 14:56:37 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nca7I-0005ny-Rk;
	Thu, 07 Apr 2022 21:56:36 +0000
Date: Fri, 8 Apr 2022 05:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 484/1091]
 drivers/clk/clk-xlnx-clock-wizard-v.c:164:9: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202204080551.THfW8Lws-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   031eb9ce665429a9574c95f89bcc488fd0ba0ec1
commit: 8b5383767cb4c856283824baee568f4286ecc0db [484/1091] clocking-wizard: Add versal clocking wizard support
config: riscv-randconfig-r023-20220407 (https://download.01.org/0day-ci/archive/20220408/202204080551.THfW8Lws-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b306233f78876a1d197ed6e1f05785505de7c63)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/8b5383767cb4c856283824baee568f4286ecc0db
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 8b5383767cb4c856283824baee568f4286ecc0db
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/clk/clk-xlnx-clock-wizard-v.c:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/clk/clk-xlnx-clock-wizard-v.c:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/clk/clk-xlnx-clock-wizard-v.c:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/clk/clk-xlnx-clock-wizard-v.c:164:9: error: implicit declaration of function 'FIELD_GET' [-Werror,-Wimplicit-function-declaration]
           regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
                  ^
>> drivers/clk/clk-xlnx-clock-wizard-v.c:276:12: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
           regval1 = FIELD_PREP(WZRD_DIVCLK_EDGE, edged);
                     ^
   drivers/clk/clk-xlnx-clock-wizard-v.c:601:63: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
                   if (of_property_read_string_index(np, "clock-output-names", i,
                                                                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/clk/clk-xlnx-clock-wizard-v.c:545:7: note: initialize the variable 'i' to silence this warning
           int i, ret;
                ^
                 = 0
   8 warnings and 2 errors generated.


vim +/FIELD_GET +164 drivers/clk/clk-xlnx-clock-wizard-v.c

   154	
   155	static unsigned long clk_wzrd_recalc_rate_all(struct clk_hw *hw,
   156						      unsigned long parent_rate)
   157	{
   158		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   159		u32 edged, div, div2, p5en, edge, prediv2, all, regl, regh, mult, reg;
   160	
   161		edge = !!(readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_1)) & WZRD_CLKFBOUT_EDGE);
   162	
   163		reg = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_2));
 > 164		regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
   165		regh = FIELD_GET(WZRD_CLKFBOUT_H_MASK, reg);
   166	
   167		mult = regl + regh + edge;
   168		if (!mult)
   169			mult = 1;
   170	
   171		regl = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_4)) &
   172			     WZRD_CLKFBOUT_FRAC_EN;
   173		if (regl) {
   174			regl = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_3)) &
   175				WZRD_CLKFBOUT_FRAC_MASK;
   176			mult = mult * WZRD_FRAC_GRADIENT + regl;
   177			parent_rate = DIV_ROUND_CLOSEST((parent_rate * mult), WZRD_FRAC_GRADIENT);
   178		} else {
   179			parent_rate = parent_rate * mult;
   180		}
   181	
   182		/* O Calculation */
   183		reg = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_1));
   184		edged = FIELD_GET(WZRD_CLKFBOUT_EDGE, reg);
   185		p5en = FIELD_GET(WZRD_P5EN, reg);
   186		prediv2 = FIELD_GET(WZRD_CLKOUT0_PREDIV2, reg);
   187	
   188		reg = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_2));
   189		/* Low time */
   190		regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
   191		/* High time */
   192		regh = FIELD_GET(WZRD_CLKFBOUT_H_MASK, reg);
   193		all = regh + regl + edged;
   194		if (!all)
   195			all = 1;
   196	
   197		if (prediv2)
   198			div2 = PREDIV2_MULT * all + p5en;
   199		else
   200			div2 = all;
   201	
   202		/* D calculation */
   203		edged = !!(readl(divider->base + WZRD_CLK_CFG_REG(WZRD_DESKEW_2)) &
   204			     WZRD_DIVCLK_EDGE);
   205		reg = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_DIVCLK));
   206		/* Low time */
   207		regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
   208		/* High time */
   209		regh = FIELD_GET(WZRD_CLKFBOUT_H_MASK, reg);
   210		div = regl + regh + edged;
   211		if (!div)
   212			div = 1;
   213	
   214		div = div * div2;
   215		return divider_recalc_rate(hw, parent_rate, div, divider->table,
   216				divider->flags, divider->width);
   217	}
   218	
   219	static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
   220					 unsigned long parent_rate)
   221	{
   222		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   223		u64 vco_freq, freq, diff;
   224		u32 m, d, o;
   225	
   226		for (m = WZRD_M_MIN; m <= WZRD_M_MAX; m++) {
   227			for (d = WZRD_D_MIN; d <= WZRD_D_MAX; d++) {
   228				vco_freq = DIV_ROUND_CLOSEST((parent_rate * m), d);
   229				if (vco_freq >= WZRD_VCO_MIN && vco_freq <= WZRD_VCO_MAX) {
   230					for (o = WZRD_O_MIN; o <= WZRD_O_MAX; o++) {
   231						freq = DIV_ROUND_CLOSEST(vco_freq, o);
   232						diff = abs(freq - rate);
   233	
   234						if (diff < WZRD_MIN_ERR) {
   235							divider->valuem = m;
   236							divider->valued = d;
   237							divider->valueo = o;
   238							return 0;
   239						}
   240					}
   241				}
   242			}
   243		}
   244		return -EBUSY;
   245	}
   246	
   247	static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
   248					       unsigned long parent_rate)
   249	{
   250		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   251		u32 value, regh, edged, p5en, p5fedge, value2, m, regval, regval1;
   252		int err;
   253	
   254		err = clk_wzrd_get_divisors(hw, rate, parent_rate);
   255		if (err)
   256			return err;
   257	
   258		writel(0, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_4));
   259	
   260		m = divider->valuem;
   261		edged = m % WZRD_DUTY_CYCLE;
   262		regh = m / WZRD_DUTY_CYCLE;
   263		regval1 = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_1));
   264		regval1 |= WZRD_MULT_PREDIV2;
   265		if (edged)
   266			regval1 = regval1 | WZRD_CLKFBOUT_EDGE;
   267		else
   268			regval1 = regval1 & ~WZRD_CLKFBOUT_EDGE;
   269		writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_1));
   270		regval1 = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
   271		writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_2));
   272	
   273		value2 = divider->valued;
   274		edged = value2 % WZRD_DUTY_CYCLE;
   275		regh = (value2 / WZRD_DUTY_CYCLE);
 > 276		regval1 = FIELD_PREP(WZRD_DIVCLK_EDGE, edged);
   277		writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_DESKEW_2));
   278		regval1 = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
   279		writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_DIVCLK));
   280	
   281		value = divider->valueo;
   282		regh = value / WZRD_O_DIV;
   283		regval1 = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_1));
   284		regval1 |= WZRD_CLKFBOUT_PREDIV2;
   285		regval1 = regval1 & ~(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | WZRD_P5FEDGE);
   286		if (value % WZRD_O_DIV > 1) {
   287			edged = 1;
   288			regval1 |= edged << WZRD_CLKFBOUT_H_SHIFT;
   289		}
   290		p5fedge = value % WZRD_DUTY_CYCLE;
   291		p5en = value % WZRD_DUTY_CYCLE;
   292	
   293		regval1 = regval1 | FIELD_PREP(WZRD_P5EN, p5en) | FIELD_PREP(WZRD_P5FEDGE, p5fedge);
   294		writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_1));
   295		regval = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
   296		writel(regval, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_2));
   297	
   298		/* Check status register */
   299		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
   300					 value, value & WZRD_DR_LOCK_BIT_MASK,
   301					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   302		if (err)
   303			return err;
   304	
   305		/* Initiate reconfiguration */
   306		writel(WZRD_DR_BEGIN_DYNA_RECONF,
   307		       divider->base + WZRD_DR_INIT_REG_OFFSET);
   308	
   309		/* Check status register */
   310		return  readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
   311					 value, value & WZRD_DR_LOCK_BIT_MASK,
   312					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   313	}
   314	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
