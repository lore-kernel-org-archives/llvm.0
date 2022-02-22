Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267D27B
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 00:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645490629; x=1677026629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0lftnnsZaTEZ8YMf6RereihD+PVWlCNWEoV+mbZajBo=;
  b=bl1RSeVco1CIIV4VosxqjvJvw7dFfhFUiWvbn0hwdq+gXND4RSPaAxoC
   E9+kQvAFZbi2q/6tOEe//w8daEcmgJElgxq1hfMwzEGS74tCWSD/9plis
   GoXnVGZbijmskikRsOvh1UUXo3dsYRhPRHEj5N1DcdydVu601J+UFuVP+
   8ozypJgH4sjLIRVjGlz3dMDk5UyUU6UIMmI69u9y6Q0BoByZOVw7LgDo9
   KI6Qe275cNnHMQWioyjsfUU1NTMMkAiccf0D/YOMbDnTai5nqtafe/7gG
   kC/Jgcaqd3imz3BU7mT/KSl5WU7TdXweJ2nptPSpuL+Q5zQ1tk1ELQmk5
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="338017676"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="338017676"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 16:43:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="542761799"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Feb 2022 16:43:47 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMJHO-00029i-KA; Tue, 22 Feb 2022 00:43:46 +0000
Date: Tue, 22 Feb 2022 08:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 08/12] pinctrl: renesas: r8a779f0: Add MMC pins,
 groups, and function
Message-ID: <202202220816.4R3DRnX0-lkp@intel.com>
References: <81a35c1fac4616d25501942848eb9662d477f9ef.1645457792.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81a35c1fac4616d25501942848eb9662d477f9ef.1645457792.git.geert+renesas@glider.be>
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
config: arm64-randconfig-r021-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220816.4R3DRnX0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/06b5c197da936f9f7d6dc715ff6ae7ab6aee760d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Geert-Uytterhoeven/pinctrl-renesas-Add-R-Car-S4-8-support/20220221-234855
        git checkout 06b5c197da936f9f7d6dc715ff6ae7ab6aee760d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pinctrl/renesas/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/renesas/pfc-r8a779f0.c:851:2: error: implicit declaration of function 'BUS_DATA_PIN_GROUP' [-Werror,-Wimplicit-function-declaration]
           BUS_DATA_PIN_GROUP(mmc_data, 1),
           ^
>> drivers/pinctrl/renesas/pfc-r8a779f0.c:851:21: error: use of undeclared identifier 'mmc_data'
           BUS_DATA_PIN_GROUP(mmc_data, 1),
                              ^
   drivers/pinctrl/renesas/pfc-r8a779f0.c:852:21: error: use of undeclared identifier 'mmc_data'
           BUS_DATA_PIN_GROUP(mmc_data, 4),
                              ^
   drivers/pinctrl/renesas/pfc-r8a779f0.c:853:21: error: use of undeclared identifier 'mmc_data'
           BUS_DATA_PIN_GROUP(mmc_data, 8),
                              ^
   drivers/pinctrl/renesas/pfc-r8a779f0.c:1489:20: error: incompatible function pointer types initializing 'int (*)(struct sh_pfc *, unsigned int, u32 *)' (aka 'int (*)(struct sh_pfc *, unsigned int, unsigned int *)') with an expression of type 'int (unsigned int, u32 *)' (aka 'int (unsigned int, unsigned int *)') [-Werror,-Wincompatible-function-pointer-types]
           .pin_to_pocctrl = r8a779f0_pin_to_pocctrl,
                             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/renesas/pfc-r8a779f0.c:1504:15: error: invalid application of 'sizeof' to an incomplete type 'const struct sh_pfc_pin_group[]'
           .nr_groups = ARRAY_SIZE(pinmux_groups),
                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   6 errors generated.


vim +/BUS_DATA_PIN_GROUP +851 drivers/pinctrl/renesas/pfc-r8a779f0.c

   825	
   826	static const struct sh_pfc_pin_group pinmux_groups[] = {
   827		SH_PFC_PIN_GROUP(hscif0_data),
   828		SH_PFC_PIN_GROUP(hscif0_clk),
   829		SH_PFC_PIN_GROUP(hscif0_ctrl),
   830		SH_PFC_PIN_GROUP(hscif1_data),
   831		SH_PFC_PIN_GROUP(hscif1_clk),
   832		SH_PFC_PIN_GROUP(hscif1_ctrl),
   833		SH_PFC_PIN_GROUP(hscif2_data),
   834		SH_PFC_PIN_GROUP(hscif2_clk),
   835		SH_PFC_PIN_GROUP(hscif2_ctrl),
   836		SH_PFC_PIN_GROUP(hscif3_data),
   837		SH_PFC_PIN_GROUP(hscif3_clk),
   838		SH_PFC_PIN_GROUP(hscif3_ctrl),
   839		SH_PFC_PIN_GROUP(i2c0),
   840		SH_PFC_PIN_GROUP(i2c1),
   841		SH_PFC_PIN_GROUP(i2c2),
   842		SH_PFC_PIN_GROUP(i2c3),
   843		SH_PFC_PIN_GROUP(i2c4),
   844		SH_PFC_PIN_GROUP(i2c5),
   845		SH_PFC_PIN_GROUP(intc_ex_irq0),
   846		SH_PFC_PIN_GROUP(intc_ex_irq1),
   847		SH_PFC_PIN_GROUP(intc_ex_irq2),
   848		SH_PFC_PIN_GROUP(intc_ex_irq3),
   849		SH_PFC_PIN_GROUP(intc_ex_irq4),
   850		SH_PFC_PIN_GROUP(intc_ex_irq5),
 > 851		BUS_DATA_PIN_GROUP(mmc_data, 1),
   852		BUS_DATA_PIN_GROUP(mmc_data, 4),
   853		BUS_DATA_PIN_GROUP(mmc_data, 8),
   854		SH_PFC_PIN_GROUP(mmc_ctrl),
   855		SH_PFC_PIN_GROUP(mmc_cd),
   856		SH_PFC_PIN_GROUP(mmc_wp),
   857		SH_PFC_PIN_GROUP(mmc_ds),
   858		SH_PFC_PIN_GROUP(scif0_data),
   859		SH_PFC_PIN_GROUP(scif0_clk),
   860		SH_PFC_PIN_GROUP(scif0_ctrl),
   861		SH_PFC_PIN_GROUP(scif1_data),
   862		SH_PFC_PIN_GROUP(scif1_clk),
   863		SH_PFC_PIN_GROUP(scif1_ctrl),
   864		SH_PFC_PIN_GROUP(scif3_data),
   865		SH_PFC_PIN_GROUP(scif3_clk),
   866		SH_PFC_PIN_GROUP(scif3_ctrl),
   867		SH_PFC_PIN_GROUP(scif4_data),
   868		SH_PFC_PIN_GROUP(scif4_clk),
   869		SH_PFC_PIN_GROUP(scif4_ctrl),
   870		SH_PFC_PIN_GROUP(scif_clk),
   871	};
   872	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
