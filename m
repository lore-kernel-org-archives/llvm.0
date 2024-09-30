Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16918EFF9;
	Mon, 30 Sep 2024 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727700330; cv=none; b=dGOalY8g1P29xVL374OnCcVSMWFYj9qNnXTxZLgNsLm2A0V0ppFfkMkYJy9k0FtlqqFXBulzUQI3jElSf/NAPEH30kyrHt6EQnL/20SoVvXaAncefMKTKeD7Vqf0r3Jwr2EbZBuugOfcJf+JDGj3kShStQ4aCypIhO4JzfnUaIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727700330; c=relaxed/simple;
	bh=SFvuTp3up9tV3HaLoWWj8GmTdsQMFUu+BriQa+pAimk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AtFq3LX6uF2axTWwBlobKXu1mjFkmaysPesOLdBjfB9zfm4sIc9dnXFkDHSTruGj3nsSCFyuxTcTbLeIaXbMs+3pHPzTGovXw9vMm93uVtnIq3QoOkycNIy6CPqlSA0xuGzVsyPIK8HiPDLN8IJ6c+iq5GQxXLdAT0jroKri4gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9+PZgEU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9+PZgEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727700327; x=1759236327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SFvuTp3up9tV3HaLoWWj8GmTdsQMFUu+BriQa+pAimk=;
  b=Q9+PZgEU6VinwVcLa4xWqK3uuy91jcVA8hzAL912tWM1hhg0Tl8WbQLB
   oFB/o98prZxg2G47VrIGwyXz9a6GdtbZDTGoBekYg5URS6i85OotEFDM1
   LbGufbX63stV3BL4mCmdrPiWkJdu411YZQNRmwLGePOOKf6GY0G1IFA1Q
   nmaOAG+jHMR9iFEWSoNsFN3bswzG5PV1uA57apkGTLEZ5RhD7Di32rKXX
   VwMpPv9729Jegqq9k7xgN7FeKO18+iJAUAPb4f9WNoFUTpWTDdK13sOWK
   PkGda9cllVNo2WNbdwr+T42nlHOrRyD9YfaH0Nvw1Kasctjp4hwlHQm8a
   A==;
X-CSE-ConnectionGUID: fxjj/g6KQIieUm2K8o7Clw==
X-CSE-MsgGUID: P66+qcmISxSjszIF41z69A==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44247720"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="44247720"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 05:45:23 -0700
X-CSE-ConnectionGUID: ciO5Wry0RtqkT3dsvc1BDw==
X-CSE-MsgGUID: UoSjRFSBRtGmU+QDbcwG5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="104084474"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Sep 2024 05:45:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svFm0-000PSE-2z;
	Mon, 30 Sep 2024 12:45:08 +0000
Date: Mon, 30 Sep 2024 20:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 703/1001]
 arch/arm64/boot/dts/xilinx/zynqmp-sc-vn-p-b2197-00-revA.dtso:183:2: warning:
 '/*' within block comment
Message-ID: <202409302037.T7CIVVmx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 1dfb4885eaa39fb3269b13eee7d97481c409b8bb [703/1001] arm64: zynqmp: Add/Update/Sync DTs for xilinx platforms
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240930/202409302037.T7CIVVmx-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409302037.T7CIVVmx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409302037.T7CIVVmx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/boot/dts/xilinx/zynqmp-sc-vn-p-b2197-00-revA.dtso:183:2: warning: '/*' within block comment [-Wcomment]
     183 |         /* i2c_main_1 - u147 - j157 - disable translation, add 8 */
         |         ^
   1 warning generated.
   arch/arm64/boot/dts/xilinx/zynqmp-sc-vn-p-b2197-00-revA.dtso:15.6-133.3: Warning (avoid_unnecessary_addr_size): /fragment@0/__overlay__: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property


vim +183 arch/arm64/boot/dts/xilinx/zynqmp-sc-vn-p-b2197-00-revA.dtso

   134	
   135	&i2c1 {
   136		#address-cells = <1>;
   137		#size-cells = <0>;
   138	
   139		/* u97 eeprom at 0x54 described in sc-revB - WP protection via BOARD_EEPROM_WP - J1801 */
   140		/* DC/SE eeprom at 0x52 */
   141		x_prc_eeprom: eeprom@52 { /* u4 - DC card identification - possible WP */
   142			compatible = "atmel,24c02";
   143			reg = <0x52>;
   144			bootph-all;
   145		};
   146	
   147		x_prc_tca9534: gpio@22 { /* u5 */
   148			compatible = "nxp,pca9534";
   149			reg = <0x22>;
   150			gpio-controller; /* IRQ not connected */
   151			#gpio-cells = <2>;
   152			gpio-line-names = "xprc_sw_1", "xprc_sw_2", "xprc_sw_3", "xprc_sw_4",
   153						"", "", "", "";
   154			gtr-sel0 {
   155				gpio-hog;
   156				gpios = <0 0>;
   157				input; /* FIXME add meaning */
   158				line-name = "xprc_sw_1";
   159			};
   160			gtr-sel1 {
   161				gpio-hog;
   162				gpios = <1 0>;
   163				input; /* FIXME add meaning */
   164				line-name = "xprc_sw_1";
   165			};
   166			gtr-sel2 {
   167				gpio-hog;
   168				gpios = <2 0>;
   169				input; /* FIXME add meaning */
   170				line-name = "xprc_sw_1";
   171			};
   172			gtr-sel3 {
   173				gpio-hog;
   174				gpios = <3 0>;
   175				input; /* FIXME add meaning */
   176				line-name = "xprc_sw_1";
   177			};
   178		};
   179	
   180		/* FMC eeproms at 0x50/0x51 */
   181		/* via j3/j5 to 0x68 to u32/9FGV1006C
   182	
 > 183		/* i2c_main_1 - u147 - j157 - disable translation, add 8 */
   184		/* J1 - OE for u43@55 + 8 - 161,132813MHz - QSFP56G_0 */
   185		qsfp56g_0_clk: clock-controller@5d {
   186			compatible = "renesas,proxo-xp";
   187			reg = <0x5d>;
   188			#clock-cells = <0>;
   189			clock-output-names = "qsfp56g_0_clk";
   190		};
   191	
   192		/* J2 - OE for u41@57 + 8 - 322,265625MHz - QSFP56G_1 */
   193		qsfp56g_1_clk: clock-controller@5f {
   194			compatible = "renesas,proxo-xp";
   195			reg = <0x5f>;
   196			#clock-cells = <0>;
   197			clock-output-names = "qsfp56g_1_clk";
   198		};
   199	
   200		/* J81 - OE for u115@50 + 8 - 320MHz - LPDDR5_C0 */
   201		lpddr5_c0_clk: clock-controller@58 {
   202			compatible = "renesas,proxo-xp";
   203			reg = <0x58>;
   204			#clock-cells = <0>;
   205			clock-output-names = "lpddr5_c0_clk";
   206		};
   207	
   208		/* i2c_main_2 - u148 - j122 - disable translation, add 9 */
   209		/* J112 - OE for u63@50 + 9 - 320MHz - LPDDR5_C2 */
   210		lpddr5_c2_clk: clock-controller@59 {
   211			compatible = "renesas,proxo-xp";
   212			reg = <0x59>;
   213			#clock-cells = <0>;
   214			clock-output-names = "lpddr5_c2_clk";
   215		};
   216	
   217		/* i2c_main_3 - u149 - j154 - disable translation, add 6 */
   218		/* J78 - OE for u116@50 + 6  - 320MHz - DDR5_UDIMM */
   219		ddr5_udimm_clk: clock-controller@56 {
   220			compatible = "renesas,proxo-xp";
   221			reg = <0x56>;
   222			#clock-cells = <0>;
   223			clock-output-names = "ddr5_udimm_clk";
   224		};
   225	
   226		/* i2c_main_4 - u150 - j146 - disable translation, add 5 */
   227		/* J107 - OE for u39@50 + 5 - 33,3333MHz - PS_REFCLK */
   228		ps_refclk: clock-controller@55 {
   229			compatible = "renesas,proxo-xp";
   230			reg = <0x55>;
   231			#clock-cells = <0>;
   232			clock-output-names = "ps_refclk";
   233		};
   234	
   235		/* i2c_main_5 - u1782 - j1798 - disable translation, add 7 */
   236		/* J77 - OE for u1783@50 + 7 - 320MHz - DDR4 */
   237		ddr4_clk: clock-controller@57 {
   238			compatible = "renesas,proxo-xp";
   239			reg = <0x57>;
   240			#clock-cells = <0>;
   241			clock-output-names = "ddr4_clk";
   242		};
   243	
   244		/* LTC4316 - not wired XORH/XORL - FIXME */
   245		/* J3 gate - FIXME should be connected for SW handling */
   246		/* i2c_main_1 bus */
   247		i2c1_u32: clock-controller@68 {
   248			compatible = "renesas,9fgv1006";
   249			reg = <0x68>;
   250		};
   251	
   252		/* J71 - selection to LP_I2C_SCL_J or LP_I2C_PMC_SCL_J */
   253		/* J70 - selection to LP_I2C_SDA_J or LP_I2C_PMC_SDA_J */
   254		/* this should be SW controlable too */
   255	};
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
