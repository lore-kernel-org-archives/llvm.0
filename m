Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88E510FA;
	Thu,  2 Mar 2023 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677782791; x=1709318791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eaoMyL7btXqQ/B5dDTOWgLMMsx+UCkbSOK8Ima8PDDk=;
  b=Id0/1Oi3NAoiSybnJtF2sZutzc7k6A1WfW8tWrqA2pvNDj1B1SM1+6yT
   KpiouVJuT7VlQhpw1+7mxFyUV+iys1mAXeNqWx/SP6cFX/1izPnKTZQFQ
   cUDbg6xXgyAJA2fyrgZ1aNw4Wf5BNljKSijz2wgdbfnobaIA3nBID/ccc
   AJF+fATI+CpkGQ4MYUOpH9ZWHZNNfagiQZN3ZGw+xN1Ivx0mf0pkYrggL
   LPm1kPmrlM/1oTzOYAqdeVNOWe07oKbLKOXw0D/umJJL24z0jOHUk2yj+
   FYIhMof2V4eS5GQ4SBfuaRw/ie71FFYBySrjXl9fgJuKmoEd9rNno105+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="314476147"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="314476147"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 10:46:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="798936242"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="798936242"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 10:46:29 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXnwi-0000n4-2V;
	Thu, 02 Mar 2023 18:46:28 +0000
Date: Fri, 3 Mar 2023 02:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 384/633] drivers/phy/qualcomm/phy-qcom-snps-eusb2.c:172:7: error: call to
 undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202303030257.KkvlYwFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Abel,

First bad commit (maybe != root cause):

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   06abd4f3cf4c58289447483d11d566d20fd3f3db
commit: defa91be85256bdf900fa2eb9709f74744a8fddf [384/633] Merge branch 'topic/sm8550/upstream/usb' into tracking-qcomlt-sm8550-drivers
config: powerpc-buildonly-randconfig-r002-20230302 (https://download.01.org/0day-ci/archive/20230303/202303030257.KkvlYwFb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/krzk/linux/commit/defa91be85256bdf900fa2eb9709f74744a8fddf
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout defa91be85256bdf900fa2eb9709f74744a8fddf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/phy/qualcomm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030257.KkvlYwFb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-snps-eusb2.c:172:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                            FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
                                            ^
   drivers/phy/qualcomm/phy-qcom-snps-eusb2.c:203:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                                    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
                                                    ^
   drivers/phy/qualcomm/phy-qcom-snps-eusb2.c:317:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                            FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
                                            ^
   3 errors generated.


vim +/FIELD_PREP +172 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

e237c1557077309 Abel Vesa 2022-10-25  166  
e237c1557077309 Abel Vesa 2022-10-25  167  static void qcom_eusb2_default_parameters(struct qcom_snps_eusb2_hsphy *phy)
e237c1557077309 Abel Vesa 2022-10-25  168  {
e237c1557077309 Abel Vesa 2022-10-25  169  	/* default parameters: tx pre-emphasis */
e237c1557077309 Abel Vesa 2022-10-25  170  	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
e237c1557077309 Abel Vesa 2022-10-25  171  					 PHY_CFG_TX_PREEMP_TUNE_MASK,
e237c1557077309 Abel Vesa 2022-10-25 @172  					 FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
e237c1557077309 Abel Vesa 2022-10-25  173  
e237c1557077309 Abel Vesa 2022-10-25  174  	/* tx rise/fall time */
e237c1557077309 Abel Vesa 2022-10-25  175  	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
e237c1557077309 Abel Vesa 2022-10-25  176  					 PHY_CFG_TX_RISE_TUNE_MASK,
e237c1557077309 Abel Vesa 2022-10-25  177  					 FIELD_PREP(PHY_CFG_TX_RISE_TUNE_MASK, 0x2));
e237c1557077309 Abel Vesa 2022-10-25  178  
e237c1557077309 Abel Vesa 2022-10-25  179  	/* source impedance adjustment */
e237c1557077309 Abel Vesa 2022-10-25  180  	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
e237c1557077309 Abel Vesa 2022-10-25  181  					 PHY_CFG_TX_RES_TUNE_MASK,
e237c1557077309 Abel Vesa 2022-10-25  182  					 FIELD_PREP(PHY_CFG_TX_RES_TUNE_MASK, 0x1));
e237c1557077309 Abel Vesa 2022-10-25  183  
e237c1557077309 Abel Vesa 2022-10-25  184  	/* dc voltage level adjustement */
e237c1557077309 Abel Vesa 2022-10-25  185  	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
e237c1557077309 Abel Vesa 2022-10-25  186  					 PHY_CFG_TX_HS_VREF_TUNE_MASK,
e237c1557077309 Abel Vesa 2022-10-25  187  					 FIELD_PREP(PHY_CFG_TX_HS_VREF_TUNE_MASK, 0x3));
e237c1557077309 Abel Vesa 2022-10-25  188  
e237c1557077309 Abel Vesa 2022-10-25  189  	/* transmitter HS crossover adjustement */
e237c1557077309 Abel Vesa 2022-10-25  190  	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
e237c1557077309 Abel Vesa 2022-10-25  191  					 PHY_CFG_TX_HS_XV_TUNE_MASK,
e237c1557077309 Abel Vesa 2022-10-25  192  					 FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
e237c1557077309 Abel Vesa 2022-10-25  193  }
e237c1557077309 Abel Vesa 2022-10-25  194  

:::::: The code at line 172 was first introduced by commit
:::::: e237c15570773096c4d5e4a98b3390fc0f1e8d6b phy: qcom: Add QCOM SNPS eUSB2 driver

:::::: TO: Abel Vesa <abel.vesa@linaro.org>
:::::: CC: Abel Vesa <abel.vesa@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
