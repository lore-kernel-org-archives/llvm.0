Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216342F26
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644421856; x=1675957856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4nIIc/ym8bl2hk1hPsGnym5MclXcX49JpfKtxeNhTpQ=;
  b=QSoMB6fEsgxx0iaDNBoDxVqBnyz4eXEDN3j115q5adSvPDlq3RbxpjNj
   V3o4mCBYRHiruWJJBttimIdJjK7e31A7Ay/xxkLzvUSVDptklhJYOTvR5
   Gij7D7UoxyPKc1Vo2t/Zb5k6FxK+zWH2fqfTjQgjSdZtO9LSZa/0aBGzQ
   WOhILEdd56rPtGmX6fcIQkhul/IB82lXYPgHZIRIV7g/cQyYrcGshn5q9
   osfiiRG95l5oosoM79jb7tp8KoICYLtfshzaZKZqQI0izQVtauF/zzjhp
   vKNg3IwVJXiOJWZRTFqCMsMEYUGceGUO+sZPZr/u2pnQ+3xU3k6QuxRYM
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="246814811"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="246814811"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 07:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="633259444"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Feb 2022 07:50:53 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHpF6-0001zS-Sd; Wed, 09 Feb 2022 15:50:52 +0000
Date: Wed, 9 Feb 2022 23:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 484/907]
 drivers/clk/clk-xlnx-clock-wizard-v.c:229:20: warning: integer literal is
 too large to be represented in type 'long', interpreting as 'unsigned long'
 per C89; this literal will have type 'long long' in C99 onwards
Message-ID: <202202092332.Cshi6n5z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   423a108a01e05e84b59a4c4885c16bf3cd8c90c7
commit: 8b5383767cb4c856283824baee568f4286ecc0db [484/907] clocking-wizard: Add versal clocking wizard support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220209/202202092332.Cshi6n5z-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/8b5383767cb4c856283824baee568f4286ecc0db
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout 8b5383767cb4c856283824baee568f4286ecc0db
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/net/ethernet/xilinx/ drivers/phy/xilinx/ drivers/ptp/ drivers/staging/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/clk-xlnx-clock-wizard-v.c:164:9: error: implicit declaration of function 'FIELD_GET' [-Werror,-Wimplicit-function-declaration]
           regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
                  ^
>> drivers/clk/clk-xlnx-clock-wizard-v.c:229:20: warning: integer literal is too large to be represented in type 'long', interpreting as 'unsigned long' per C89; this literal will have type 'long long' in C99 onwards [-Wc99-compat]
                           if (vco_freq >= WZRD_VCO_MIN && vco_freq <= WZRD_VCO_MAX) {
                                           ^
   drivers/clk/clk-xlnx-clock-wizard-v.c:78:24: note: expanded from macro 'WZRD_VCO_MIN'
   #define WZRD_VCO_MIN                    2160000000
                                           ^
   drivers/clk/clk-xlnx-clock-wizard-v.c:276:12: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
           regval1 = FIELD_PREP(WZRD_DIVCLK_EDGE, edged);
                     ^
   drivers/clk/clk-xlnx-clock-wizard-v.c:601:63: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
                   if (of_property_read_string_index(np, "clock-output-names", i,
                                                                               ^
   drivers/clk/clk-xlnx-clock-wizard-v.c:545:7: note: initialize the variable 'i' to silence this warning
           int i, ret;
                ^
                 = 0
   2 warnings and 2 errors generated.


vim +229 drivers/clk/clk-xlnx-clock-wizard-v.c

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
 > 229				if (vco_freq >= WZRD_VCO_MIN && vco_freq <= WZRD_VCO_MAX) {
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
