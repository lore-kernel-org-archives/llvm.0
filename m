Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2387C7E0
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 05:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655704184; x=1687240184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u55uTieL+hAn57FinZWZl7CcbfDQZ7mkeoFMwdacfhA=;
  b=KKUjbieySaCKTfM7M10zMCp8T0jLER9PRnCmnacWCLSy9cQsak2cva8k
   tJ+tTL1XczW3diZ1oF/ItfgGpbnsuDTwykDEapIjuyo8nipG0iUJ8Dq21
   PXmIKq+5w0D3FuYFFYTl/V3psNNMrC4LtFrbvR8KsjwhOqy5nspyukdUs
   G0z4DRIbzgVxhImECpXQ0eg/9inJ4qLKAcsYt3qqUC59TtCIqrY2WYc7v
   /PMkomVEPg02eDmODw+JRYKw3sqG71LvxfC2h2y6umMljJccMGZTbK+Vx
   VzhMvKMqfK+7XEs4kHUbIskpItAVttYi2EiFnf3FzO/JhebmD3Ya0yRVy
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341489362"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="341489362"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2022 22:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="642950838"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jun 2022 22:49:35 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3AI2-000S3P-JL;
	Mon, 20 Jun 2022 05:49:34 +0000
Date: Mon, 20 Jun 2022 13:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
	tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
	tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
	bjorn.andersson@linaro.org, geert+renesas@glider.be,
	marcel.ziswiler@toradex.com, vkoul@kernel.org,
	biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
	robert.hancock@calian.com, j.neuschaefer@gmx.net
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 06/18] clk: npcm8xx: add clock controller
Message-ID: <202206201323.e0tjY3Zt-lkp@intel.com>
References: <20220619151225.209029-7-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220619151225.209029-7-tmaimon77@gmail.com>

Hi Tomer,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on pza/reset/next clk/clk-next linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/Introduce-Nuvoton-Arbel-NPCM8XX-BMC-SoC/20220619-231717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: arm64-randconfig-r013-20220620 (https://download.01.org/0day-ci/archive/20220620/202206201323.e0tjY3Zt-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/d7bd2f3034704914b803bcbc64785cacca9aab80
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tomer-Maimon/Introduce-Nuvoton-Arbel-NPCM8XX-BMC-SoC/20220619-231717
        git checkout d7bd2f3034704914b803bcbc64785cacca9aab80
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-npcm8xx.c:380:48: warning: unused variable 'npcm8xx_divs_fx' [-Wunused-const-variable]
   static const struct npcm8xx_clk_div_fixed_data npcm8xx_divs_fx[] = {
                                                  ^
>> drivers/clk/clk-npcm8xx.c:474:43: warning: unused variable 'npcm8xx_gates' [-Wunused-const-variable]
   static const struct npcm8xx_clk_gate_data npcm8xx_gates[] = {
                                             ^
   2 warnings generated.


vim +/npcm8xx_divs_fx +380 drivers/clk/clk-npcm8xx.c

   378	
   379	/* fixed ratio dividers (no register): */
 > 380	static const struct npcm8xx_clk_div_fixed_data npcm8xx_divs_fx[] = {
   381		{ 1, 2, NPCM8XX_CLK_S_MC, NPCM8XX_CLK_S_MC_MUX, 0, NPCM8XX_CLK_MC},
   382		{ 1, 2, NPCM8XX_CLK_S_AXI, NPCM8XX_CLK_S_TH, 0, NPCM8XX_CLK_AXI},
   383		{ 1, 2, NPCM8XX_CLK_S_ATB, NPCM8XX_CLK_S_AXI, 0, NPCM8XX_CLK_ATB},
   384		{ 1, 2, NPCM8XX_CLK_S_PRE_CLK, NPCM8XX_CLK_S_CPU_MUX, 0, -1},
   385		{ 1, 2, NPCM8XX_CLK_S_PLL1_DIV2, NPCM8XX_CLK_S_PLL1, 0, -1},
   386		{ 1, 2, NPCM8XX_CLK_S_PLL2_DIV2, NPCM8XX_CLK_S_PLL2, 0, -1},
   387	};
   388	
   389	/* configurable dividers: */
   390	static const struct npcm8xx_clk_div_data npcm8xx_divs[] = {
   391		{NPCM8XX_CLKDIV1, 28, 3, NPCM8XX_CLK_S_ADC, NPCM8XX_CLK_S_PRE_ADC,
   392			CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
   393			NPCM8XX_CLK_ADC},
   394		/* bit 30-28 ADCCKDIV*/
   395		{NPCM8XX_CLKDIV1, 26, 2, NPCM8XX_CLK_S_AHB, NPCM8XX_CLK_S_PRE_CLK,
   396			CLK_DIVIDER_READ_ONLY, CLK_IS_CRITICAL, NPCM8XX_CLK_AHB},
   397		/* bit 28-26 CLK4DIV*/
   398		{NPCM8XX_CLKDIV1, 21, 5, NPCM8XX_CLK_S_PRE_ADC,
   399		NPCM8XX_CLK_S_ADC_MUX, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_PRE_ADC},
   400		/* bit 25-21 PRE-ADCCKDIV*/
   401		{NPCM8XX_CLKDIV1, 16, 5, NPCM8XX_CLK_S_UART,
   402		NPCM8XX_CLK_S_UART_MUX, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_UART},
   403		/* bit 20-16 UARTDIV*/
   404		{NPCM8XX_CLKDIV1, 11, 5, NPCM8XX_CLK_S_MMC,
   405		NPCM8XX_CLK_S_SD_MUX, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_MMC},
   406		/* bit 15-11 MMCCKDIV*/
   407		{NPCM8XX_CLKDIV1, 6, 5, NPCM8XX_CLK_S_SPI3,
   408		NPCM8XX_CLK_S_AHB, 0, 0, NPCM8XX_CLK_SPI3},
   409		/* bit 10-6 AHB3CKDIV*/
   410		{NPCM8XX_CLKDIV1, 2, 4, NPCM8XX_CLK_S_PCI,
   411		NPCM8XX_CLK_S_GFX_MUX, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_PCI},
   412		/* bit 5-2 PCICKDIV*/
   413	
   414		{NPCM8XX_CLKDIV2, 30, 2, NPCM8XX_CLK_S_APB4, NPCM8XX_CLK_S_AHB,
   415			CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
   416			NPCM8XX_CLK_APB4},
   417		/* bit 31-30 APB4CKDIV*/
   418		{NPCM8XX_CLKDIV2, 28, 2, NPCM8XX_CLK_S_APB3, NPCM8XX_CLK_S_AHB,
   419			CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
   420			NPCM8XX_CLK_APB3},
   421		/* bit 29-28 APB3CKDIV*/
   422		{NPCM8XX_CLKDIV2, 26, 2, NPCM8XX_CLK_S_APB2, NPCM8XX_CLK_S_AHB,
   423			CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
   424			NPCM8XX_CLK_APB2},
   425		/* bit 28-26 APB2CKDIV*/
   426		{NPCM8XX_CLKDIV2, 24, 2, NPCM8XX_CLK_S_APB1, NPCM8XX_CLK_S_AHB,
   427			CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
   428			NPCM8XX_CLK_APB1},
   429		/* bit 25-24 APB1CKDIV*/
   430		{NPCM8XX_CLKDIV2, 22, 2, NPCM8XX_CLK_S_APB5, NPCM8XX_CLK_S_AHB,
   431			CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
   432			NPCM8XX_CLK_APB5},
   433		/* bit 23-22 APB5CKDIV*/
   434		{NPCM8XX_CLKDIV2, 16, 5, NPCM8XX_CLK_S_CLKOUT, NPCM8XX_CLK_S_CLKOUT_MUX,
   435			 CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_CLKOUT},
   436		/* bit 20-16 CLKOUTDIV*/
   437		{NPCM8XX_CLKDIV2, 13, 3, NPCM8XX_CLK_S_GFX, NPCM8XX_CLK_S_GFX_MUX,
   438			CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_GFX},
   439		/* bit 15-13 GFXCKDIV*/
   440		{NPCM8XX_CLKDIV2, 8, 5, NPCM8XX_CLK_S_USB_BRIDGE, NPCM8XX_CLK_S_SU_MUX,
   441			CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU},
   442		/* bit 12-8 SUCKDIV*/
   443		{NPCM8XX_CLKDIV2, 4, 4, NPCM8XX_CLK_S_USB_HOST, NPCM8XX_CLK_S_SU_MUX,
   444			CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU48},
   445		/* bit 8-4 SU48CKDIV*/
   446		{NPCM8XX_CLKDIV2, 0, 4, NPCM8XX_CLK_S_SDHC,
   447		NPCM8XX_CLK_S_SD_MUX, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SDHC}
   448		,/* bit 3-0 SD1CKDIV*/
   449	
   450		{NPCM8XX_CLKDIV3, 16, 8, NPCM8XX_CLK_S_SPI1,
   451		NPCM8XX_CLK_S_AHB, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI1},
   452		/* bit 23-16 SPI1CKDV*/
   453		{NPCM8XX_CLKDIV3, 11, 5, NPCM8XX_CLK_S_UART2,
   454		NPCM8XX_CLK_S_UART_MUX, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_UART2},
   455		/* bit 15-11 UARTDIV2*/
   456		{NPCM8XX_CLKDIV3, 6, 5, NPCM8XX_CLK_S_SPI0,
   457		NPCM8XX_CLK_S_AHB, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI0},
   458		/* bit 10-6 SPI0CKDV*/
   459		{NPCM8XX_CLKDIV3, 1, 5, NPCM8XX_CLK_S_SPIX,
   460		NPCM8XX_CLK_S_AHB, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPIX},
   461	
   462		/* bit 5-1 SPIXCKDV*/
   463		{NPCM8XX_CLKDIV4, 28, 4, NPCM8XX_CLK_S_RG, NPCM8XX_CLK_S_RG_MUX,
   464		CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RG},
   465		/* bit 31-28 RGREFDIV*/
   466		{NPCM8XX_CLKDIV4, 12, 4, NPCM8XX_CLK_S_RCP, NPCM8XX_CLK_S_RCP_MUX,
   467		CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RCP},
   468		/* bit 15-12 RCPREFDIV*/
   469		{NPCM8XX_THRTL_CNT, 0, 2, NPCM8XX_CLK_S_TH, NPCM8XX_CLK_S_CPU_MUX,
   470		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_TH},
   471		/* bit 1-0 TH_DIV*/
   472	};
   473	
 > 474	static const struct npcm8xx_clk_gate_data npcm8xx_gates[] = {
   475		{NPCM8XX_CLKEN1, 31, "smb1-gate", NPCM8XX_CLK_S_APB2, 0},
   476		{NPCM8XX_CLKEN1, 30, "smb0-gate", NPCM8XX_CLK_S_APB2, 0},
   477		{NPCM8XX_CLKEN1, 29, "smb7-gate", NPCM8XX_CLK_S_APB2, 0},
   478		{NPCM8XX_CLKEN1, 28, "smb6-gate", NPCM8XX_CLK_S_APB2, 0},
   479		{NPCM8XX_CLKEN1, 27, "adc-gate", NPCM8XX_CLK_S_APB1, 0},
   480		{NPCM8XX_CLKEN1, 26, "wdt-gate", NPCM8XX_CLK_S_TIMER, 0},
   481		{NPCM8XX_CLKEN1, 25, "usbdev3-gate", NPCM8XX_CLK_S_AHB, 0},
   482		{NPCM8XX_CLKEN1, 24, "usbdev6-gate", NPCM8XX_CLK_S_AHB, 0},
   483		{NPCM8XX_CLKEN1, 23, "usbdev5-gate", NPCM8XX_CLK_S_AHB, 0},
   484		{NPCM8XX_CLKEN1, 22, "usbdev4-gate", NPCM8XX_CLK_S_AHB, 0},
   485		{NPCM8XX_CLKEN1, 21, "gmac4-gate", NPCM8XX_CLK_S_AHB, 0},
   486		{NPCM8XX_CLKEN1, 20, "timer5_9-gate", NPCM8XX_CLK_S_APB1, 0},
   487		{NPCM8XX_CLKEN1, 19, "timer0_4-gate", NPCM8XX_CLK_S_APB1, 0},
   488		{NPCM8XX_CLKEN1, 18, "pwmm0-gate", NPCM8XX_CLK_S_APB3, 0},
   489		{NPCM8XX_CLKEN1, 17, "huart-gate", NPCM8XX_CLK_S_UART, 0},
   490		{NPCM8XX_CLKEN1, 16, "smb5-gate", NPCM8XX_CLK_S_APB2, 0},
   491		{NPCM8XX_CLKEN1, 15, "smb4-gate", NPCM8XX_CLK_S_APB2, 0},
   492		{NPCM8XX_CLKEN1, 14, "smb3-gate", NPCM8XX_CLK_S_APB2, 0},
   493		{NPCM8XX_CLKEN1, 13, "smb2-gate", NPCM8XX_CLK_S_APB2, 0},
   494		{NPCM8XX_CLKEN1, 12, "mc-gate", NPCM8XX_CLK_S_MC, 0},
   495		{NPCM8XX_CLKEN1, 11, "uart01-gate", NPCM8XX_CLK_S_APB1, 0},
   496		{NPCM8XX_CLKEN1, 10, "aes-gate", NPCM8XX_CLK_S_AHB, 0},
   497		{NPCM8XX_CLKEN1, 9, "peci-gate", NPCM8XX_CLK_S_APB3, 0},
   498		{NPCM8XX_CLKEN1, 8, "usbdev2-gate", NPCM8XX_CLK_S_AHB, 0},
   499		{NPCM8XX_CLKEN1, 7, "uart23-gate", NPCM8XX_CLK_S_APB1, 0},
   500		{NPCM8XX_CLKEN1, 6, "gmac3-gate", NPCM8XX_CLK_S_AHB, 0},
   501		{NPCM8XX_CLKEN1, 5, "usbdev1-gate", NPCM8XX_CLK_S_AHB, 0},
   502		{NPCM8XX_CLKEN1, 4, "shm-gate", NPCM8XX_CLK_S_AHB, 0},
   503		{NPCM8XX_CLKEN1, 3, "gdma0-gate", NPCM8XX_CLK_S_AHB, 0},
   504		{NPCM8XX_CLKEN1, 2, "kcs-gate", NPCM8XX_CLK_S_APB1, 0},
   505		{NPCM8XX_CLKEN1, 1, "spi3-gate", NPCM8XX_CLK_S_AHB, 0},
   506		{NPCM8XX_CLKEN1, 0, "spi0-gate", NPCM8XX_CLK_S_AHB, 0},
   507	
   508		{NPCM8XX_CLKEN2, 31, "cp-gate", NPCM8XX_CLK_S_AHB, 0},
   509		{NPCM8XX_CLKEN2, 30, "tock-gate", NPCM8XX_CLK_S_TOCK, 0},
   510		/* bit 29 is reserved */
   511		{NPCM8XX_CLKEN2, 28, "gmac1-gate", NPCM8XX_CLK_S_AHB, 0},
   512		{NPCM8XX_CLKEN2, 27, "usbif-gate", NPCM8XX_CLK_S_USBIF, 0},
   513		{NPCM8XX_CLKEN2, 26, "usbhost1-gate", NPCM8XX_CLK_S_AHB, 0},
   514		{NPCM8XX_CLKEN2, 25, "gmac2-gate", NPCM8XX_CLK_S_AHB, 0},
   515		{NPCM8XX_CLKEN2, 24, "spi1-gate", NPCM8XX_CLK_S_APB5, 0},
   516		{NPCM8XX_CLKEN2, 23, "pspi2-gate", NPCM8XX_CLK_S_APB5, 0},
   517		/* bit 22 is reserved */
   518		{NPCM8XX_CLKEN2, 21, "3des-gate", NPCM8XX_CLK_S_AHB, 0},
   519		{NPCM8XX_CLKEN2, 20, "bt-gate", NPCM8XX_CLK_S_APB3, 0},
   520		{NPCM8XX_CLKEN2, 19, "siox2-gate", NPCM8XX_CLK_S_APB3, 0},
   521		{NPCM8XX_CLKEN2, 18, "siox1-gate", NPCM8XX_CLK_S_APB3, 0},
   522		{NPCM8XX_CLKEN2, 17, "viruart2-gate", NPCM8XX_CLK_S_APB5, 0},
   523		{NPCM8XX_CLKEN2, 16, "viruart1-gate", NPCM8XX_CLK_S_APB5, 0},
   524		/*  bit 15 is reserved */
   525		{NPCM8XX_CLKEN2, 14, "vcd-gate", NPCM8XX_CLK_S_AHB, 0},
   526		{NPCM8XX_CLKEN2, 13, "ece-gate", NPCM8XX_CLK_S_AHB, 0},
   527		{NPCM8XX_CLKEN2, 12, "vdma-gate", NPCM8XX_CLK_S_AHB, 0},
   528		{NPCM8XX_CLKEN2, 11, "ahbpcibrg-gate", NPCM8XX_CLK_S_AHB, 0},
   529		{NPCM8XX_CLKEN2, 10, "gfxsys-gate", NPCM8XX_CLK_S_APB1, 0},
   530		//{NPCM8XX_CLKEN2, 9, "sdhc-gate", NPCM8XX_CLK_S_AHB, 0},
   531		/*  bit 9 is reserved */
   532		{NPCM8XX_CLKEN2, 8, "mmc-gate", NPCM8XX_CLK_S_AHB, 0},
   533		{NPCM8XX_CLKEN2, 7, "mft7-gate", NPCM8XX_CLK_S_APB4, 0},
   534		{NPCM8XX_CLKEN2, 6, "mft6-gate", NPCM8XX_CLK_S_APB4, 0},
   535		{NPCM8XX_CLKEN2, 5, "mft5-gate", NPCM8XX_CLK_S_APB4, 0},
   536		{NPCM8XX_CLKEN2, 4, "mft4-gate", NPCM8XX_CLK_S_APB4, 0},
   537		{NPCM8XX_CLKEN2, 3, "mft3-gate", NPCM8XX_CLK_S_APB4, 0},
   538		{NPCM8XX_CLKEN2, 2, "mft2-gate", NPCM8XX_CLK_S_APB4, 0},
   539		{NPCM8XX_CLKEN2, 1, "mft1-gate", NPCM8XX_CLK_S_APB4, 0},
   540		{NPCM8XX_CLKEN2, 0, "mft0-gate", NPCM8XX_CLK_S_APB4, 0},
   541	
   542		{NPCM8XX_CLKEN3, 31, "gpiom7-gate", NPCM8XX_CLK_S_APB1, 0},
   543		{NPCM8XX_CLKEN3, 30, "gpiom6-gate", NPCM8XX_CLK_S_APB1, 0},
   544		{NPCM8XX_CLKEN3, 29, "gpiom5-gate", NPCM8XX_CLK_S_APB1, 0},
   545		{NPCM8XX_CLKEN3, 28, "gpiom4-gate", NPCM8XX_CLK_S_APB1, 0},
   546		{NPCM8XX_CLKEN3, 27, "gpiom3-gate", NPCM8XX_CLK_S_APB1, 0},
   547		{NPCM8XX_CLKEN3, 26, "gpiom2-gate", NPCM8XX_CLK_S_APB1, 0},
   548		{NPCM8XX_CLKEN3, 25, "gpiom1-gate", NPCM8XX_CLK_S_APB1, 0},
   549		{NPCM8XX_CLKEN3, 24, "gpiom0-gate", NPCM8XX_CLK_S_APB1, 0},
   550		{NPCM8XX_CLKEN3, 23, "espi-gate", NPCM8XX_CLK_S_APB2, 0},
   551		{NPCM8XX_CLKEN3, 22, "smb11-gate", NPCM8XX_CLK_S_APB2, 0},
   552		{NPCM8XX_CLKEN3, 21, "smb10-gate", NPCM8XX_CLK_S_APB2, 0},
   553		{NPCM8XX_CLKEN3, 20, "smb9-gate", NPCM8XX_CLK_S_APB2, 0},
   554		{NPCM8XX_CLKEN3, 19, "smb8-gate", NPCM8XX_CLK_S_APB2, 0},
   555		{NPCM8XX_CLKEN3, 18, "smb15-gate", NPCM8XX_CLK_S_APB2, 0},
   556		{NPCM8XX_CLKEN3, 17, "rng-gate", NPCM8XX_CLK_S_APB1, 0},
   557		{NPCM8XX_CLKEN3, 16, "timer10_14-gate", NPCM8XX_CLK_S_APB1, 0},
   558		{NPCM8XX_CLKEN3, 15, "pcirc-gate", NPCM8XX_CLK_S_AHB, 0},
   559		{NPCM8XX_CLKEN3, 14, "sececc-gate", NPCM8XX_CLK_S_AHB, 0},
   560		{NPCM8XX_CLKEN3, 13, "sha-gate", NPCM8XX_CLK_S_AHB, 0},
   561		{NPCM8XX_CLKEN3, 12, "smb14-gate", NPCM8XX_CLK_S_APB2, 0},
   562		{NPCM8XX_CLKEN3, 11, "gdma2-gate", NPCM8XX_CLK_S_AHB, 0},
   563		{NPCM8XX_CLKEN3, 10, "gdma1-gate", NPCM8XX_CLK_S_AHB, 0},
   564		{NPCM8XX_CLKEN3, 9, "pcimbx-gate", NPCM8XX_CLK_S_AHB, 0},
   565		/* bit 8 is reserved */
   566		{NPCM8XX_CLKEN3, 7, "usbdev9-gate", NPCM8XX_CLK_S_AHB, 0},
   567		{NPCM8XX_CLKEN3, 6, "usbdev8-gate", NPCM8XX_CLK_S_AHB, 0},
   568		{NPCM8XX_CLKEN3, 5, "usbdev7-gate", NPCM8XX_CLK_S_AHB, 0},
   569		{NPCM8XX_CLKEN3, 4, "usbdev0-gate", NPCM8XX_CLK_S_AHB, 0},
   570		{NPCM8XX_CLKEN3, 3, "smb13-gate", NPCM8XX_CLK_S_APB2, 0},
   571		{NPCM8XX_CLKEN3, 2, "spix-gate", NPCM8XX_CLK_S_AHB, 0},
   572		{NPCM8XX_CLKEN3, 1, "smb12-gate", NPCM8XX_CLK_S_APB2, 0},
   573		{NPCM8XX_CLKEN3, 0, "pwmm1-gate", NPCM8XX_CLK_S_APB3, 0},
   574	
   575		{NPCM8XX_CLKEN4, 31, "usbhost2-gate", NPCM8XX_CLK_S_AHB, 0},
   576		{NPCM8XX_CLKEN4, 30, "jtm2-gate", NPCM8XX_CLK_S_APB5, 0},
   577		{NPCM8XX_CLKEN4, 29, "jtm1-gate", NPCM8XX_CLK_S_APB5, 0},
   578		{NPCM8XX_CLKEN4, 28, "pwmm2-gate", NPCM8XX_CLK_S_APB3, 0},
   579		/* bit 27 is reserved */
   580		/* bit 26 is reserved */
   581		/* bit 25 is reserved */
   582		{NPCM8XX_CLKEN4, 24, "smb26-gate", NPCM8XX_CLK_S_APB19, 0},
   583		{NPCM8XX_CLKEN4, 23, "smb25-gate", NPCM8XX_CLK_S_APB19, 0},
   584		{NPCM8XX_CLKEN4, 22, "smb24-gate", NPCM8XX_CLK_S_APB19, 0},
   585		/* bit 21 is reserved */
   586		/* bit 20 is reserved */
   587		{NPCM8XX_CLKEN4, 19, "pcimbx2-gate", NPCM8XX_CLK_S_AHB, 0},
   588		{NPCM8XX_CLKEN4, 18, "uart6-gate", NPCM8XX_CLK_S_APB1, 0},
   589		{NPCM8XX_CLKEN4, 17, "uart5-gate", NPCM8XX_CLK_S_APB1, 0},
   590		{NPCM8XX_CLKEN4, 16, "uart4-gate", NPCM8XX_CLK_S_APB1, 0},
   591		/* bit 15 is reserved */
   592		/* bit 14 is reserved */
   593		{NPCM8XX_CLKEN4, 13, "i3c5-gate", NPCM8XX_CLK_S_APB19, 0},
   594		{NPCM8XX_CLKEN4, 12, "i3c4-gate", NPCM8XX_CLK_S_APB19, 0},
   595		{NPCM8XX_CLKEN4, 11, "i3c3-gate", NPCM8XX_CLK_S_APB19, 0},
   596		{NPCM8XX_CLKEN4, 10, "i3c2-gate", NPCM8XX_CLK_S_APB19, 0},
   597		{NPCM8XX_CLKEN4, 9, "i3c1-gate", NPCM8XX_CLK_S_APB19, 0},
   598		{NPCM8XX_CLKEN4, 8, "i3c0-gate", NPCM8XX_CLK_S_APB19, 0},
   599		{NPCM8XX_CLKEN4, 7, "smb23-gate", NPCM8XX_CLK_S_APB19, 0},
   600		{NPCM8XX_CLKEN4, 6, "smb22-gate", NPCM8XX_CLK_S_APB19, 0},
   601		{NPCM8XX_CLKEN4, 5, "smb21-gate", NPCM8XX_CLK_S_APB19, 0},
   602		{NPCM8XX_CLKEN4, 4, "smb20-gate", NPCM8XX_CLK_S_APB19, 0},
   603		{NPCM8XX_CLKEN4, 3, "smb19-gate", NPCM8XX_CLK_S_APB19, 0},
   604		{NPCM8XX_CLKEN4, 2, "smb18-gate", NPCM8XX_CLK_S_APB19, 0},
   605		{NPCM8XX_CLKEN4, 1, "smb17-gate", NPCM8XX_CLK_S_APB19, 0},
   606		{NPCM8XX_CLKEN4, 0, "smb16-gate", NPCM8XX_CLK_S_APB19, 0},
   607	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
