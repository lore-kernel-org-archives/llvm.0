Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B287E0;
	Tue, 21 Feb 2023 00:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676938717; x=1708474717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G1Ycu7ol9Ouv0AGvHmGWUsq7X0vqL+yvNslDWoEReGs=;
  b=U1oGgeFYa3Vx6p6bhULZyWf/tbD8iK7GZWq/S1vGcSIXhfiFDX9afSpq
   D4lYOLXiqVRLAE96sOs+gp0U1fS3VEzMPIEEdE6NzDK0NNHa+4vgZrER0
   6FP99VngSYs+ZQHrlXJ+CXIAtNqxXulaPxREyCj/3F17h4v3vZaUFwZ5U
   6PcTxQN62Ioqhd3dbaf87+XRCWqHKe68X1pzI0WajIZ/3obIg8oZ6Ey81
   GsiOucN53LaS9Zu8QOxlQKIVJJc8a9+dezV/so4KRqCctuRcV7HLmC8x4
   qNHHnKVTqp/7KekhbVUIR9AKICGBx23rv5nbHEwZ2ofvgbse6aU5tr9sT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="330230946"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="330230946"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 16:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="735277632"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="735277632"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Feb 2023 16:18:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUGMc-000EGX-1m;
	Tue, 21 Feb 2023 00:18:34 +0000
Date: Tue, 21 Feb 2023 08:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 32/90] sound/soc/codecs/wsa884x.c:1184:29: warning: converting the result of
 '<<' to a boolean always evaluates to true
Message-ID: <202302210844.Qf1w8Phx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   e15c7eb7cae15791837d300af128824b82d8232c
commit: 9afbe16f2744d13915020ea482927d4442fec5f9 [32/90] reg
config: mips-buildonly-randconfig-r001-20230220 (https://download.01.org/0day-ci/archive/20230221/202302210844.Qf1w8Phx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/krzk/linux/commit/9afbe16f2744d13915020ea482927d4442fec5f9
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 9afbe16f2744d13915020ea482927d4442fec5f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210844.Qf1w8Phx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/wsa884x.c:1184:65: warning: use of logical '||' with constant operand [-Wconstant-logical-operand]
           { WSA884X_BOP2_PROG, (0x06 << WSA884X_BOP2_PROG_BOP2_VTH_SHIFT ||
                                                                          ^
   sound/soc/codecs/wsa884x.c:1184:65: note: use '|' for a bitwise operation
           { WSA884X_BOP2_PROG, (0x06 << WSA884X_BOP2_PROG_BOP2_VTH_SHIFT ||
                                                                          ^~
                                                                          |
>> sound/soc/codecs/wsa884x.c:1184:29: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
           { WSA884X_BOP2_PROG, (0x06 << WSA884X_BOP2_PROG_BOP2_VTH_SHIFT ||
                                      ^
   sound/soc/codecs/wsa884x.c:1185:15: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
                                 0x06 << WSA884X_BOP2_PROG_BOP2_HYST_SHIFT) },
                                      ^
   sound/soc/codecs/wsa884x.c:1244:6: warning: unused variable 'variant' [-Wunused-variable]
           int variant, version;
               ^
   sound/soc/codecs/wsa884x.c:1244:15: warning: unused variable 'version' [-Wunused-variable]
           int variant, version;
                        ^
   sound/soc/codecs/wsa884x.c:1420:23: warning: unused variable 'wsa884x' [-Wunused-variable]
           struct wsa884x_priv *wsa884x = snd_soc_component_get_drvdata(component);
                                ^
   sound/soc/codecs/wsa884x.c:1569:28: warning: unused variable 'component' [-Wunused-variable]
           struct snd_soc_component *component = dai->component;
                                     ^
   sound/soc/codecs/wsa884x.c:1669:8: error: use of undeclared label 'err'
                   goto err;
                        ^
   7 warnings and 1 error generated.


vim +1184 sound/soc/codecs/wsa884x.c

9abafb4fee08d4 Krzysztof Kozlowski 2023-01-25  1152  
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1153  static const struct reg_sequence wsa884x_reg_init[] = {
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1154  	{ WSA884X_CKWD_CTL_1, (0x00 << WSA884X_CKWD_CTL_1_VPP_SW_CTL_SHIFT |
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1155  			       0x13 << WSA884X_CKWD_CTL_1_CKWD_VCOMP_VREF_SEL_SHIFT) },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1156  	{ WSA884X_CDC_SPK_DSM_A2_0, 0x0A },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1157  	{ WSA884X_CDC_SPK_DSM_A2_1, 0x08 },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1158  	{ WSA884X_CDC_SPK_DSM_A3_0, 0xF3 },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1159  	{ WSA884X_CDC_SPK_DSM_A3_1, 0x07 },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1160  	{ WSA884X_CDC_SPK_DSM_A4_0, 0x79 },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1161  	{ WSA884X_CDC_SPK_DSM_A5_0, 0x0B },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1162  	{ WSA884X_CDC_SPK_DSM_A6_0, 0x8A },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1163  	{ WSA884X_CDC_SPK_DSM_A7_0, 0x9B },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1164  	{ WSA884X_CDC_SPK_DSM_C_0, (0x06 << WSA884X_CDC_SPK_DSM_C_0_COEF_C3_SHIFT |
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1165  				    0x08 << WSA884X_CDC_SPK_DSM_C_0_COEF_C2_SHIFT) },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1166  	{ WSA884X_CDC_SPK_DSM_C_2, 0x0F << WSA884X_CDC_SPK_DSM_C_2_COEF_C7_SHIFT },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1167  	{ WSA884X_CDC_SPK_DSM_C_3, 0x20 << WSA884X_CDC_SPK_DSM_C_3_COEF_C7_SHIFT},
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1168  	{ WSA884X_CDC_SPK_DSM_R1, 0x83 },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1169  	{ WSA884X_CDC_SPK_DSM_R2, 0x7F },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1170  	{ WSA884X_CDC_SPK_DSM_R3, 0x9D },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1171  	{ WSA884X_CDC_SPK_DSM_R4, 0x82 },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1172  	{ WSA884X_CDC_SPK_DSM_R5, 0x8B },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1173  	{ WSA884X_CDC_SPK_DSM_R6, 0x9B },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1174  	{ WSA884X_CDC_SPK_DSM_R7, 0x3F },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1175  	{ WSA884X_BOP_DEGLITCH_CTL, 0x08 << WSA884X_BOP_DEGLITCH_CTL_BOP_DEGLITCH_SETTING_SHIFT},
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1176  	{ WSA884X_VBAT_THRM_FLT_CTL, 0x04 << WSA884X_VBAT_THRM_FLT_CTL_VBAT_COEF_SEL_SHIFT },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1177  	{ WSA884X_CLSH_CTL_0, 0x06 << WSA884X_CLSH_CTL_0_DLY_CODE_SHIFT},
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1178  	{ WSA884X_CLSH_SOFT_MAX, 0xFF },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1179  	{ WSA884X_OTP_REG_38, 0x00 },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1180  	{ WSA884X_OTP_REG_40, 0x08 << WSA884X_OTP_REG_40_ISENSE_RESCAL_SHIFT },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1181  	{ WSA884X_STB_CTRL1, 0x0D << WSA884X_STB_CTRL1_SLOPE_COMP_CURRENT_SHIFT },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1182  	{ WSA884X_ILIM_CTRL1, 0x03 },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1183  	{ WSA884X_CURRENT_LIMIT, 0x09 << WSA884X_CURRENT_LIMIT_CURRENT_LIMIT_SHIFT },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25 @1184  	{ WSA884X_BOP2_PROG, (0x06 << WSA884X_BOP2_PROG_BOP2_VTH_SHIFT ||
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1185  			      0x06 << WSA884X_BOP2_PROG_BOP2_HYST_SHIFT) },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1186  	{ WSA884X_VBAT_CAL_CTL, 0x02 << WSA884X_VBAT_CAL_CTL_RESERVE_SHIFT },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1187  	{ WSA884X_REF_CTRL, 0x01 },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1188  	{ WSA884X_ZX_CTRL1, 0x03 << WSA884X_ZX_CTRL1_ZX_DET_SW_SEL_SHIFT },
22c0d4694d69ba Krzysztof Kozlowski 2023-01-25  1189  

:::::: The code at line 1184 was first introduced by commit
:::::: 22c0d4694d69ba232f8895c5f771f830276d68fc notes and reg init

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
:::::: CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
