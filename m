Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5550C33EB
	for <llvm@lists.linux.dev>; Sat, 20 Aug 2022 21:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661030366; x=1692566366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=62dQ8Ri0QVmRFB/Q0m7xeUmyi0fTIhGNs287/kq6pN8=;
  b=gFpFuCF6E1Ip7UkAB6WDD4cJ6ojD+qBmbvb4mRtz9vTUmYHB+Q93Wh7J
   scwTROrqAc7UHBPMYrnoiRzZM77t22wD0gZDbNBcvGJUxp9hS22H8T1PH
   8fJvNDsNFlaWGNQSOerYML0T6K+d36goGSlK6FOvYsfMA4m4h2Pjq5qqC
   FT5XIP5nQzAmL7oTkRvqwJ0YcRK2E2r073+USwUqllFKGG69NxJo/SPUI
   YChhmQZ/ln9GpMAli6vQ1YJKLMqaaLL4idcUCONgHgFN7Fuzbp/88u48s
   H3Mk6CtXC9MeBFHN+/xTGGmTWvDQBTLpM3DqnnGeBRINlr309CtAGSazt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10445"; a="273592903"
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="273592903"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2022 14:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="676788742"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Aug 2022 14:19:15 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oPVsA-0003Dr-2T;
	Sat, 20 Aug 2022 21:19:14 +0000
Date: Sun, 21 Aug 2022 05:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>, Alex Shi <alexs@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: drivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: error: call to
 undeclared function 'LOCHNAGAR1_'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202208210527.NcaIKIN8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cc1807b9158a909ffe829a5e222be756c57c9a90
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=gnu11
date:   5 months ago
config: mips-buildonly-randconfig-r006-20220821 (https://download.01.org/0day-ci/archive/20220821/202208210527.NcaIKIN8-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c9a41fe60ab62f7a40049c100adcc8087a47669b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/pinctrl/cirrus/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: error: pasting formed 'LOCHNAGAR1_(', an invalid preprocessing token
   LN1_PIN_GPIO(CDC_RESET,    "codec-reset",    RST,      CDC_RESET,    1);
   ^
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:2: note: expanded from macro 'LN1_PIN_GPIO'
           LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
           ^
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:63: note: expanded from macro 'LN_PIN_GPIO'
           .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
                                                                        ^
>> drivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: error: call to undeclared function 'LOCHNAGAR1_'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:2: note: expanded from macro 'LN1_PIN_GPIO'
           LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
           ^
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:46: note: expanded from macro 'LN_PIN_GPIO'
           .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
                                                       ^
   <scratch space>:14:1: note: expanded from here
   LOCHNAGAR1_
   ^
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:200:1: error: initializer element is not a compile-time constant
   LN1_PIN_GPIO(CDC_RESET,    "codec-reset",    RST,      CDC_RESET,    1);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:2: note: expanded from macro 'LN1_PIN_GPIO'
           LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:46: note: expanded from macro 'LN_PIN_GPIO'
           .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
                                                       ^~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:14:1: note: expanded from here
   LOCHNAGAR1_
   ^
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:201:1: error: pasting formed 'LOCHNAGAR1_(', an invalid preprocessing token
   LN1_PIN_GPIO(DSP_RESET,    "dsp-reset",      RST,      DSP_RESET,    1);
   ^
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:2: note: expanded from macro 'LN1_PIN_GPIO'
           LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
           ^
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:63: note: expanded from macro 'LN_PIN_GPIO'
           .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
                                                                        ^
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:201:1: error: initializer element is not a compile-time constant
   LN1_PIN_GPIO(DSP_RESET,    "dsp-reset",      RST,      DSP_RESET,    1);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:2: note: expanded from macro 'LN1_PIN_GPIO'
           LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:46: note: expanded from macro 'LN_PIN_GPIO'
           .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
                                                       ^~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:25:1: note: expanded from here
   LOCHNAGAR1_
   ^
   5 errors generated.


vim +/LOCHNAGAR1_ +200 drivers/pinctrl/cirrus/pinctrl-lochnagar.c

0548448b719ac7 Charles Keepax 2019-03-19  199  
0548448b719ac7 Charles Keepax 2019-03-19 @200  LN1_PIN_GPIO(CDC_RESET,    "codec-reset",    RST,      CDC_RESET,    1);
0548448b719ac7 Charles Keepax 2019-03-19  201  LN1_PIN_GPIO(DSP_RESET,    "dsp-reset",      RST,      DSP_RESET,    1);
0548448b719ac7 Charles Keepax 2019-03-19  202  LN1_PIN_GPIO(CDC_CIF1MODE, "codec-cif1mode", I2C_CTRL, CDC_CIF_MODE, 0);
0548448b719ac7 Charles Keepax 2019-03-19  203  LN1_PIN_MUX(GF_GPIO2,      "gf-gpio2");
0548448b719ac7 Charles Keepax 2019-03-19  204  LN1_PIN_MUX(GF_GPIO3,      "gf-gpio3");
0548448b719ac7 Charles Keepax 2019-03-19  205  LN1_PIN_MUX(GF_GPIO7,      "gf-gpio7");
0548448b719ac7 Charles Keepax 2019-03-19  206  LN1_PIN_MUX(LED1,          "led1");
0548448b719ac7 Charles Keepax 2019-03-19  207  LN1_PIN_MUX(LED2,          "led2");
0548448b719ac7 Charles Keepax 2019-03-19  208  LN1_PIN_AIF(CDC_AIF1);
0548448b719ac7 Charles Keepax 2019-03-19  209  LN1_PIN_AIF(CDC_AIF2);
0548448b719ac7 Charles Keepax 2019-03-19  210  LN1_PIN_AIF(CDC_AIF3);
0548448b719ac7 Charles Keepax 2019-03-19  211  LN1_PIN_AIF(DSP_AIF1);
0548448b719ac7 Charles Keepax 2019-03-19  212  LN1_PIN_AIF(DSP_AIF2);
0548448b719ac7 Charles Keepax 2019-03-19  213  LN1_PIN_AIF(PSIA1);
0548448b719ac7 Charles Keepax 2019-03-19  214  LN1_PIN_AIF(PSIA2);
0548448b719ac7 Charles Keepax 2019-03-19  215  LN1_PIN_AIF(SPDIF_AIF);
0548448b719ac7 Charles Keepax 2019-03-19  216  LN1_PIN_AIF(GF_AIF1);
0548448b719ac7 Charles Keepax 2019-03-19  217  LN1_PIN_AIF(GF_AIF2);
0548448b719ac7 Charles Keepax 2019-03-19  218  LN1_PIN_AIF(GF_AIF3);
0548448b719ac7 Charles Keepax 2019-03-19  219  LN1_PIN_AIF(GF_AIF4);
0548448b719ac7 Charles Keepax 2019-03-19  220  

:::::: The code at line 200 was first introduced by commit
:::::: 0548448b719ac78fa18fdbcd03856952ba6cc7dc pinctrl: lochnagar: Add support for the Cirrus Logic Lochnagar

:::::: TO: Charles Keepax <ckeepax@opensource.cirrus.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
