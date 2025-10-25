Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87DB13C8EA;
	Sat, 25 Oct 2025 00:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761352360; cv=none; b=Jrt8JQFO8OOJTWveHZCla1NmyAAu2QMB7pEpolfO5tcyK6v5YTHe2WJyIwvbfWMsOasCf1paIonABrkbdcqraaN0+ZRx04owm0oI1Xxt55Ck1cAvS2pmtZ89CmERY5kt/0ezu3ULErRJKqy7sX8Cn1TNCo1oWKpjPr5aeEG+GPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761352360; c=relaxed/simple;
	bh=ykn0rynaYicv/KHr2XtoEm7SZC+on0uB1brVoPFjQcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jda+EngEVnkblRkFjNTsVml8B5zccfShlPQ03UFNNKYsmBunDtgGIn8ZbVzZXYULLLFtNtg+5mlMxm3YEVUAnAUEY2qdB+GV9FXRK9jnot1LiSYlP9fiYhGaOt0wuLPfGNKJ2R3hLPM5VZsUHd96lV448OVSJS3G5dkcj4mtss8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lr56BqS+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lr56BqS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761352359; x=1792888359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ykn0rynaYicv/KHr2XtoEm7SZC+on0uB1brVoPFjQcA=;
  b=Lr56BqS++i0fc1WwD2ZTPJEUnTe1fqF4a1Iwe1BWf6BFGtNhmfpRH0sF
   2GXdhKw+LVualKbil+c3OTqE+2+6QrVXGDVUixENFrddue7u2j3LE3zm6
   Ijwk5ehj+bB2nju3e+HUZ/0PjhZr02J/DOpzChCnUUNptleFVRpo/R7mE
   PRP4s/3DcRPxcSSEMwmCDZ8DzbdcklNltAtZcFKW4BYYmzal+/F4uwUZS
   CU6SJS65nnplCPeVyJmTOFMDrEM6uLha/U5mAVGVqtCOj0FyafocQmAHz
   L+eU+7H51MAF7d5LmBZk2qFnmCuK0Ju/O6WX90Zbd5c4RWv3XFaJEnBCC
   Q==;
X-CSE-ConnectionGUID: dkdJjaLZRYiuW7cA3unq9Q==
X-CSE-MsgGUID: qm4lu+v9Th6BnfYkDAdQ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66148768"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="66148768"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 17:32:38 -0700
X-CSE-ConnectionGUID: xd+zz43FQhKMWA9xqz1Y1Q==
X-CSE-MsgGUID: UvuvYmzAStKAuLWehOL2AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="185316801"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2025 17:32:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCSCv-000F05-0H;
	Sat, 25 Oct 2025 00:32:33 +0000
Date: Sat, 25 Oct 2025 08:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a09g056: Add clocks and resets for
 DSI and LCDC modules
Message-ID: <202510250804.WuSolOK0-lkp@intel.com>
References: <20251023210724.666476-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023210724.666476-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-drivers/renesas-clk]
[also build test ERROR on clk/clk-next linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/clk-renesas-r9a09g056-Add-clocks-and-resets-for-DSI-and-LCDC-modules/20251024-050927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20251023210724.666476-2-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH 1/3] clk: renesas: r9a09g056: Add clocks and resets for DSI and LCDC modules
config: x86_64-buildonly-randconfig-004-20251025 (https://download.01.org/0day-ci/archive/20251025/202510250804.WuSolOK0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250804.WuSolOK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250804.WuSolOK0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/renesas/r9a09g056-cpg.c:130:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     130 | RZV2H_CPG_PLL_DSI_LIMITS(rzv2n_cpg_pll_dsi_limits);
         | ^
         | int
>> drivers/clk/renesas/r9a09g056-cpg.c:130:26: error: a parameter list without types is only allowed in a function definition
     130 | RZV2H_CPG_PLL_DSI_LIMITS(rzv2n_cpg_pll_dsi_limits);
         |                          ^
>> drivers/clk/renesas/r9a09g056-cpg.c:153:2: error: call to undeclared function 'DEF_PLLDSI'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     153 |         DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
         |         ^
>> drivers/clk/renesas/r9a09g056-cpg.c:153:48: error: call to undeclared function 'PLL_PACK_LIMITS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     153 |         DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
         |                                                       ^
   drivers/clk/renesas/r9a09g056-cpg.c:131:17: note: expanded from macro 'PLLDSI'
     131 | #define PLLDSI          PLL_PACK_LIMITS(0xc0, 1, 0, &rzv2n_cpg_pll_dsi_limits)
         |                         ^
>> drivers/clk/renesas/r9a09g056-cpg.c:153:48: error: use of undeclared identifier 'rzv2n_cpg_pll_dsi_limits'
   drivers/clk/renesas/r9a09g056-cpg.c:131:46: note: expanded from macro 'PLLDSI'
     131 | #define PLLDSI          PLL_PACK_LIMITS(0xc0, 1, 0, &rzv2n_cpg_pll_dsi_limits)
         |                                                      ^
>> drivers/clk/renesas/r9a09g056-cpg.c:189:5: error: use of undeclared identifier 'CSDIV0_DIVCTL2'
     189 |                   CSDIV0_DIVCTL2, dtable_16_128),
         |                   ^
>> drivers/clk/renesas/r9a09g056-cpg.c:191:2: error: call to undeclared function 'DEF_PLLDSI_DIV'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     191 |         DEF_PLLDSI_DIV(".plldsi_gear", CLK_PLLDSI_GEAR, CLK_PLLDSI,
         |         ^
>> drivers/clk/renesas/r9a09g056-cpg.c:192:10: error: use of undeclared identifier 'CSDIV1_DIVCTL2'
     192 |                        CSDIV1_DIVCTL2, dtable_2_32),
         |                        ^
>> drivers/clk/renesas/r9a09g056-cpg.c:410:19: error: invalid application of 'sizeof' to an incomplete type 'const struct cpg_core_clk[]'
     410 |         .num_core_clks = ARRAY_SIZE(r9a09g056_core_clks),
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   9 errors generated.


vim +/int +130 drivers/clk/renesas/r9a09g056-cpg.c

   129	
 > 130	RZV2H_CPG_PLL_DSI_LIMITS(rzv2n_cpg_pll_dsi_limits);
   131	#define PLLDSI		PLL_PACK_LIMITS(0xc0, 1, 0, &rzv2n_cpg_pll_dsi_limits)
   132	
   133	/* Mux clock tables */
   134	static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
   135	static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
   136	static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
   137	static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1_txclk" };
   138	static const char * const smux2_xspi_clk0[] = { ".pllcm33_div3", ".pllcm33_div4" };
   139	static const char * const smux2_xspi_clk1[] = { ".smux2_xspi_clk0", ".pllcm33_div5" };
   140	
   141	static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
   142		/* External Clock Inputs */
   143		DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
   144		DEF_INPUT("rtxin", CLK_RTXIN),
   145		DEF_INPUT("qextal", CLK_QEXTAL),
   146	
   147		/* PLL Clocks */
   148		DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
   149		DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
   150		DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
   151		DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
   152		DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
 > 153		DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
   154		DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
   155	
   156		/* Internal Core Clocks */
   157		DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
   158		DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
   159		DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
   160		DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
   161		DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
   162		DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
   163		DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
   164		DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
   165			  dtable_2_16),
   166	
   167		DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
   168		DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
   169		DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
   170	
   171		DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
   172		DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
   173		DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
   174		DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
   175		DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
   176	
   177		DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
   178		DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
   179		DEF_CSDIV(".plleth_gbe0", CLK_CSDIV_PLLETH_GBE0,
   180			  CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL0, dtable_2_100),
   181		DEF_CSDIV(".plleth_gbe1", CLK_CSDIV_PLLETH_GBE1,
   182			  CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL1, dtable_2_100),
   183		DEF_SMUX(".smux2_gbe0_txclk", CLK_SMUX2_GBE0_TXCLK, SSEL0_SELCTL2, smux2_gbe0_txclk),
   184		DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
   185		DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
   186		DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
   187		DEF_FIXED(".cdiv4_plleth_lpclk", CLK_CDIV4_PLLETH_LPCLK, CLK_PLLETH, 1, 4),
   188		DEF_CSDIV(".plleth_lpclk_gear", CLK_PLLETH_LPCLK_GEAR, CLK_CDIV4_PLLETH_LPCLK,
 > 189			  CSDIV0_DIVCTL2, dtable_16_128),
   190	
 > 191		DEF_PLLDSI_DIV(".plldsi_gear", CLK_PLLDSI_GEAR, CLK_PLLDSI,
 > 192			       CSDIV1_DIVCTL2, dtable_2_32),
   193	
   194		DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
   195	
   196		/* Core Clocks */
   197		DEF_FIXED("sys_0_pclk", R9A09G056_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
   198		DEF_DDIV("ca55_0_coreclk0", R9A09G056_CA55_0_CORE_CLK0, CLK_PLLCA55,
   199			 CDDIV1_DIVCTL0, dtable_1_8),
   200		DEF_DDIV("ca55_0_coreclk1", R9A09G056_CA55_0_CORE_CLK1, CLK_PLLCA55,
   201			 CDDIV1_DIVCTL1, dtable_1_8),
   202		DEF_DDIV("ca55_0_coreclk2", R9A09G056_CA55_0_CORE_CLK2, CLK_PLLCA55,
   203			 CDDIV1_DIVCTL2, dtable_1_8),
   204		DEF_DDIV("ca55_0_coreclk3", R9A09G056_CA55_0_CORE_CLK3, CLK_PLLCA55,
   205			 CDDIV1_DIVCTL3, dtable_1_8),
   206		DEF_FIXED("iotop_0_shclk", R9A09G056_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
   207		DEF_FIXED("usb2_0_clk_core0", R9A09G056_USB2_0_CLK_CORE0, CLK_QEXTAL, 1, 1),
   208		DEF_FIXED("gbeth_0_clk_ptp_ref_i", R9A09G056_GBETH_0_CLK_PTP_REF_I,
   209			  CLK_PLLETH_DIV_125_FIX, 1, 1),
   210		DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G056_GBETH_1_CLK_PTP_REF_I,
   211			  CLK_PLLETH_DIV_125_FIX, 1, 1),
   212		DEF_FIXED_MOD_STATUS("spi_clk_spi", R9A09G056_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2,
   213				     FIXED_MOD_CONF_XSPI),
   214	};
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
