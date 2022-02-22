Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0DC7B
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 01:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645494971; x=1677030971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uyId3YjY0namnENfNwsDfMsJuKD93JUb6gv5+LVLATA=;
  b=PQH5pcPdJ3wZF0ubGWLRjccVfK75RoZ4nP0JbQcYaH5fWiHRLo7i0rh6
   dMmFQncQnGgP95tvz57nhPb1OdDZ77fENCPxUSLF2nOtrdMzYJB5su5+v
   Jk0CipszOhW1isc7CcqY0Lvkve9pqaLsDbbI2BZC9QNUTp+flQ6Rs/XNK
   TKwzxYAB7K2ywmkUN2YH1ZSE6uE2DsdVHMTgRKH3HP6jEParGk0+2NUBE
   H/F4PRmIBOZxU0H5SK5hKH9XWm+1NOi6G76xpB7DB0GP+DKOu4JIoPxWp
   lOS44kOaOR1sf2XHSwLrDmSYud5qqMeRlm+xKbWI5uM9MHXGI525uHM+S
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="312338982"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="312338982"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 17:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="490605583"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Feb 2022 17:55:48 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMKP6-0002DG-06; Tue, 22 Feb 2022 01:55:48 +0000
Date: Tue, 22 Feb 2022 09:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 11/12] pinctrl: renesas: r8a779f0: Add QSPI pins,
 groups, and functions
Message-ID: <202202220911.QtJ97DYI-lkp@intel.com>
References: <cd7f7feeabebf268adc9e050e348230e93b40829.1645457792.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd7f7feeabebf268adc9e050e348230e93b40829.1645457792.git.geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Geert,

I love your patch! Yet something to improve:

[auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
[also build test ERROR on robh/for-next linusw-pinctrl/devel v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/pinctrl-renesas-Add-R-Car-S4-8-support/20220221-234855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
config: arm64-randconfig-r021-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220911.QtJ97DYI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/a5976fa9dc1d92148ae24e8dd706696e45a45d5a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Geert-Uytterhoeven/pinctrl-renesas-Add-R-Car-S4-8-support/20220221-234855
        git checkout a5976fa9dc1d92148ae24e8dd706696e45a45d5a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pinctrl/renesas/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pinctrl/renesas/pfc-r8a779f0.c:1082:2: error: implicit declaration of function 'BUS_DATA_PIN_GROUP' [-Werror,-Wimplicit-function-declaration]
           BUS_DATA_PIN_GROUP(mmc_data, 1),
           ^
   drivers/pinctrl/renesas/pfc-r8a779f0.c:1082:21: error: use of undeclared identifier 'mmc_data'
           BUS_DATA_PIN_GROUP(mmc_data, 1),
                              ^
   drivers/pinctrl/renesas/pfc-r8a779f0.c:1083:21: error: use of undeclared identifier 'mmc_data'
           BUS_DATA_PIN_GROUP(mmc_data, 4),
                              ^
   drivers/pinctrl/renesas/pfc-r8a779f0.c:1084:21: error: use of undeclared identifier 'mmc_data'
           BUS_DATA_PIN_GROUP(mmc_data, 8),
                              ^
>> drivers/pinctrl/renesas/pfc-r8a779f0.c:1116:21: error: use of undeclared identifier 'qspi0_data'
           BUS_DATA_PIN_GROUP(qspi0_data, 2),
                              ^
   drivers/pinctrl/renesas/pfc-r8a779f0.c:1117:21: error: use of undeclared identifier 'qspi0_data'
           BUS_DATA_PIN_GROUP(qspi0_data, 4),
                              ^
>> drivers/pinctrl/renesas/pfc-r8a779f0.c:1119:21: error: use of undeclared identifier 'qspi1_data'
           BUS_DATA_PIN_GROUP(qspi1_data, 2),
                              ^
   drivers/pinctrl/renesas/pfc-r8a779f0.c:1120:21: error: use of undeclared identifier 'qspi1_data'
           BUS_DATA_PIN_GROUP(qspi1_data, 4),
                              ^
   drivers/pinctrl/renesas/pfc-r8a779f0.c:1812:20: error: incompatible function pointer types initializing 'int (*)(struct sh_pfc *, unsigned int, u32 *)' (aka 'int (*)(struct sh_pfc *, unsigned int, unsigned int *)') with an expression of type 'int (unsigned int, u32 *)' (aka 'int (unsigned int, unsigned int *)') [-Werror,-Wincompatible-function-pointer-types]
           .pin_to_pocctrl = r8a779f0_pin_to_pocctrl,
                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pfc-r8a779f0.c:1827:15: error: invalid application of 'sizeof' to an incomplete type 'const struct sh_pfc_pin_group[]'
           .nr_groups = ARRAY_SIZE(pinmux_groups),
                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   10 errors generated.


vim +/qspi0_data +1116 drivers/pinctrl/renesas/pfc-r8a779f0.c

  1056	
  1057	static const struct sh_pfc_pin_group pinmux_groups[] = {
  1058		SH_PFC_PIN_GROUP(hscif0_data),
  1059		SH_PFC_PIN_GROUP(hscif0_clk),
  1060		SH_PFC_PIN_GROUP(hscif0_ctrl),
  1061		SH_PFC_PIN_GROUP(hscif1_data),
  1062		SH_PFC_PIN_GROUP(hscif1_clk),
  1063		SH_PFC_PIN_GROUP(hscif1_ctrl),
  1064		SH_PFC_PIN_GROUP(hscif2_data),
  1065		SH_PFC_PIN_GROUP(hscif2_clk),
  1066		SH_PFC_PIN_GROUP(hscif2_ctrl),
  1067		SH_PFC_PIN_GROUP(hscif3_data),
  1068		SH_PFC_PIN_GROUP(hscif3_clk),
  1069		SH_PFC_PIN_GROUP(hscif3_ctrl),
  1070		SH_PFC_PIN_GROUP(i2c0),
  1071		SH_PFC_PIN_GROUP(i2c1),
  1072		SH_PFC_PIN_GROUP(i2c2),
  1073		SH_PFC_PIN_GROUP(i2c3),
  1074		SH_PFC_PIN_GROUP(i2c4),
  1075		SH_PFC_PIN_GROUP(i2c5),
  1076		SH_PFC_PIN_GROUP(intc_ex_irq0),
  1077		SH_PFC_PIN_GROUP(intc_ex_irq1),
  1078		SH_PFC_PIN_GROUP(intc_ex_irq2),
  1079		SH_PFC_PIN_GROUP(intc_ex_irq3),
  1080		SH_PFC_PIN_GROUP(intc_ex_irq4),
  1081		SH_PFC_PIN_GROUP(intc_ex_irq5),
  1082		BUS_DATA_PIN_GROUP(mmc_data, 1),
  1083		BUS_DATA_PIN_GROUP(mmc_data, 4),
  1084		BUS_DATA_PIN_GROUP(mmc_data, 8),
  1085		SH_PFC_PIN_GROUP(mmc_ctrl),
  1086		SH_PFC_PIN_GROUP(mmc_cd),
  1087		SH_PFC_PIN_GROUP(mmc_wp),
  1088		SH_PFC_PIN_GROUP(mmc_ds),
  1089		SH_PFC_PIN_GROUP(msiof0_clk),
  1090		SH_PFC_PIN_GROUP(msiof0_sync),
  1091		SH_PFC_PIN_GROUP(msiof0_ss1),
  1092		SH_PFC_PIN_GROUP(msiof0_ss2),
  1093		SH_PFC_PIN_GROUP(msiof0_txd),
  1094		SH_PFC_PIN_GROUP(msiof0_rxd),
  1095		SH_PFC_PIN_GROUP(msiof1_clk),
  1096		SH_PFC_PIN_GROUP(msiof1_sync),
  1097		SH_PFC_PIN_GROUP(msiof1_ss1),
  1098		SH_PFC_PIN_GROUP(msiof1_ss2),
  1099		SH_PFC_PIN_GROUP(msiof1_txd),
  1100		SH_PFC_PIN_GROUP(msiof1_rxd),
  1101		SH_PFC_PIN_GROUP(msiof2_clk),
  1102		SH_PFC_PIN_GROUP(msiof2_sync),
  1103		SH_PFC_PIN_GROUP(msiof2_ss1),
  1104		SH_PFC_PIN_GROUP(msiof2_ss2),
  1105		SH_PFC_PIN_GROUP(msiof2_txd),
  1106		SH_PFC_PIN_GROUP(msiof2_rxd),
  1107		SH_PFC_PIN_GROUP(msiof3_clk),
  1108		SH_PFC_PIN_GROUP(msiof3_sync),
  1109		SH_PFC_PIN_GROUP(msiof3_ss1),
  1110		SH_PFC_PIN_GROUP(msiof3_ss2),
  1111		SH_PFC_PIN_GROUP(msiof3_txd),
  1112		SH_PFC_PIN_GROUP(msiof3_rxd),
  1113		SH_PFC_PIN_GROUP(pcie0_clkreq_n),
  1114		SH_PFC_PIN_GROUP(pcie1_clkreq_n),
  1115		SH_PFC_PIN_GROUP(qspi0_ctrl),
> 1116		BUS_DATA_PIN_GROUP(qspi0_data, 2),
  1117		BUS_DATA_PIN_GROUP(qspi0_data, 4),
  1118		SH_PFC_PIN_GROUP(qspi1_ctrl),
> 1119		BUS_DATA_PIN_GROUP(qspi1_data, 2),
  1120		BUS_DATA_PIN_GROUP(qspi1_data, 4),
  1121		SH_PFC_PIN_GROUP(scif0_data),
  1122		SH_PFC_PIN_GROUP(scif0_clk),
  1123		SH_PFC_PIN_GROUP(scif0_ctrl),
  1124		SH_PFC_PIN_GROUP(scif1_data),
  1125		SH_PFC_PIN_GROUP(scif1_clk),
  1126		SH_PFC_PIN_GROUP(scif1_ctrl),
  1127		SH_PFC_PIN_GROUP(scif3_data),
  1128		SH_PFC_PIN_GROUP(scif3_clk),
  1129		SH_PFC_PIN_GROUP(scif3_ctrl),
  1130		SH_PFC_PIN_GROUP(scif4_data),
  1131		SH_PFC_PIN_GROUP(scif4_clk),
  1132		SH_PFC_PIN_GROUP(scif4_ctrl),
  1133		SH_PFC_PIN_GROUP(scif_clk),
  1134	};
  1135	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
