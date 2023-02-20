Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21B9A3C;
	Mon, 20 Feb 2023 23:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676934574; x=1708470574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTWec+zWXRjKfW2iw2aYHlC68yorIlRSy+OppiSRHIc=;
  b=Sfh1CBjEtXiFb3eebpmmw4rQddfJ589mEkqZOTeqDTDRiclQEzPvw7ta
   X+X8bGi3rClKhGSDwQyzqZCNhBEzP7Q3JokzKDNU8JNVW+N7IRHXvLVSE
   CRMD9nBb+q54FYwiRJ0kpWHPmHq5kqNEhCSCj1ziq1pKeh5tYyeAXmBL9
   PqFCdbsehNhhlN9XjnAUT0kb6rSj30LKbpus1eaMoJKnp3RM7w7RGdSLZ
   0n1YrzqGaYyHtXXXO0F789NaluwlwsstT0H+ZklDuWtrG+AC1JnkNgWZX
   48rco+jYHmf+LwfCjlSE51YYbNMKsT6mcfDLVpUX9zOTOMZ1bQ4hkUX6f
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="334702715"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="334702715"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 15:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="621283413"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="621283413"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Feb 2023 15:09:33 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUFHo-000EEn-15;
	Mon, 20 Feb 2023 23:09:32 +0000
Date: Tue, 21 Feb 2023 07:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 31/90] sound/soc/codecs/wsa884x.c:1177:65: warning: use of logical '||' with
 constant operand
Message-ID: <202302210631.kxP9etbc-lkp@intel.com>
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
commit: 22c0d4694d69ba232f8895c5f771f830276d68fc [31/90] notes and reg init
config: mips-buildonly-randconfig-r001-20230220 (https://download.01.org/0day-ci/archive/20230221/202302210631.kxP9etbc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/krzk/linux/commit/22c0d4694d69ba232f8895c5f771f830276d68fc
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 22c0d4694d69ba232f8895c5f771f830276d68fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210631.kxP9etbc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/wsa884x.c:1169:39: error: use of undeclared identifier 'WSA884X_VBAT_THRM_FLT_CTL_VBAT_COEF_SEL_SHIFT'
           { WSA884X_VBAT_THRM_FLT_CTL, 0x04 << WSA884X_VBAT_THRM_FLT_CTL_VBAT_COEF_SEL_SHIFT },
                                                ^
   sound/soc/codecs/wsa884x.c:1170:32: error: use of undeclared identifier 'WSA884X_CLSH_CTL_0_DLY_CODE_SHIFT'
           { WSA884X_CLSH_CTL_0, 0x06 << WSA884X_CLSH_CTL_0_DLY_CODE_SHIFT},
                                         ^
>> sound/soc/codecs/wsa884x.c:1177:65: warning: use of logical '||' with constant operand [-Wconstant-logical-operand]
           { WSA884X_BOP2_PROG, (0x06 << WSA884X_BOP2_PROG_BOP2_VTH_SHIFT ||
                                                                          ^
   sound/soc/codecs/wsa884x.c:1177:65: note: use '|' for a bitwise operation
           { WSA884X_BOP2_PROG, (0x06 << WSA884X_BOP2_PROG_BOP2_VTH_SHIFT ||
                                                                          ^~
                                                                          |
   sound/soc/codecs/wsa884x.c:1280:11: error: invalid application of 'sizeof' to an incomplete type 'const struct reg_sequence[]'
                                  ARRAY_SIZE(wsa884x_reg_init));
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   sound/soc/codecs/wsa884x.c:1413:23: warning: unused variable 'wsa884x' [-Wunused-variable]
           struct wsa884x_priv *wsa884x = snd_soc_component_get_drvdata(component);
                                ^
   sound/soc/codecs/wsa884x.c:1562:28: warning: unused variable 'component' [-Wunused-variable]
           struct snd_soc_component *component = dai->component;
                                     ^
   sound/soc/codecs/wsa884x.c:1662:8: error: use of undeclared label 'err'
                   goto err;
                        ^
   3 warnings and 4 errors generated.


vim +1177 sound/soc/codecs/wsa884x.c

  1145	
  1146	static const struct reg_sequence wsa884x_reg_init[] = {
  1147		{ WSA884X_CKWD_CTL_1, (0x00 << WSA884X_CKWD_CTL_1_VPP_SW_CTL_SHIFT |
  1148				       0x13 << WSA884X_CKWD_CTL_1_CKWD_VCOMP_VREF_SEL_SHIFT) },
  1149		{ WSA884X_CDC_SPK_DSM_A2_0, 0x0A },
  1150		{ WSA884X_CDC_SPK_DSM_A2_1, 0x08 },
  1151		{ WSA884X_CDC_SPK_DSM_A3_0, 0xF3 },
  1152		{ WSA884X_CDC_SPK_DSM_A3_1, 0x07 },
  1153		{ WSA884X_CDC_SPK_DSM_A4_0, 0x79 },
  1154		{ WSA884X_CDC_SPK_DSM_A5_0, 0x0B },
  1155		{ WSA884X_CDC_SPK_DSM_A6_0, 0x8A },
  1156		{ WSA884X_CDC_SPK_DSM_A7_0, 0x9B },
  1157		{ WSA884X_CDC_SPK_DSM_C_0, (0x06 << WSA884X_CDC_SPK_DSM_C_0_COEF_C3_SHIFT |
  1158					    0x08 << WSA884X_CDC_SPK_DSM_C_0_COEF_C2_SHIFT) },
  1159		{ WSA884X_CDC_SPK_DSM_C_2, 0x0F << WSA884X_CDC_SPK_DSM_C_2_COEF_C7_SHIFT },
  1160		{ WSA884X_CDC_SPK_DSM_C_3, 0x20 << WSA884X_CDC_SPK_DSM_C_3_COEF_C7_SHIFT},
  1161		{ WSA884X_CDC_SPK_DSM_R1, 0x83 },
  1162		{ WSA884X_CDC_SPK_DSM_R2, 0x7F },
  1163		{ WSA884X_CDC_SPK_DSM_R3, 0x9D },
  1164		{ WSA884X_CDC_SPK_DSM_R4, 0x82 },
  1165		{ WSA884X_CDC_SPK_DSM_R5, 0x8B },
  1166		{ WSA884X_CDC_SPK_DSM_R6, 0x9B },
  1167		{ WSA884X_CDC_SPK_DSM_R7, 0x3F },
  1168		{ WSA884X_BOP_DEGLITCH_CTL, 0x08 << WSA884X_BOP_DEGLITCH_CTL_BOP_DEGLITCH_SETTING_SHIFT},
  1169		{ WSA884X_VBAT_THRM_FLT_CTL, 0x04 << WSA884X_VBAT_THRM_FLT_CTL_VBAT_COEF_SEL_SHIFT },
  1170		{ WSA884X_CLSH_CTL_0, 0x06 << WSA884X_CLSH_CTL_0_DLY_CODE_SHIFT},
  1171		{ WSA884X_CLSH_SOFT_MAX, 0xFF },
  1172		{ WSA884X_OTP_REG_38, 0x00 },
  1173		{ WSA884X_OTP_REG_40, 0x08 << WSA884X_OTP_REG_40_ISENSE_RESCAL_SHIFT },
  1174		{ WSA884X_STB_CTRL1, 0x0D << WSA884X_STB_CTRL1_SLOPE_COMP_CURRENT_SHIFT },
  1175		{ WSA884X_ILIM_CTRL1, 0x03 },
  1176		{ WSA884X_CURRENT_LIMIT, 0x09 << WSA884X_CURRENT_LIMIT_CURRENT_LIMIT_SHIFT },
> 1177		{ WSA884X_BOP2_PROG, (0x06 << WSA884X_BOP2_PROG_BOP2_VTH_SHIFT ||
  1178				      0x06 << WSA884X_BOP2_PROG_BOP2_HYST_SHIFT) },
  1179		{ WSA884X_VBAT_CAL_CTL, 0x02 << WSA884X_VBAT_CAL_CTL_RESERVE_SHIFT },
  1180		{ WSA884X_REF_CTRL, 0x01 },
  1181		{ WSA884X_ZX_CTRL1, 0x03 << WSA884X_ZX_CTRL1_ZX_DET_SW_SEL_SHIFT },
  1182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
