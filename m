Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB2A947F;
	Sat, 17 Jun 2023 15:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687016021; x=1718552021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DVPguA5UBHk+9X4d4Gpn9XEDJOhQ47TYVuTeLgs8j7E=;
  b=ZNuH2lPd6BvRUbPQbwN+HNXM/i2zC5nUfdeX/jUpjNkPtsWy+0P1QBIV
   FDflBipLArVoocOVvB4MDfAbVeHhCRpS8LegC3EADoKfPGrbM29b+h5ZQ
   1TgyFn9Rwld7T4YKCSHd4SeX6RpkHG7xjx0HVU6qEcUJOg4A3Za4KLJJr
   NdR6SmA/xWDkZGLsHlASvBcITblku49v1qQBcuaT0S/usrDmrb4KANBug
   L0W/UX85wP/hYYPYbh3vHZNBr2+wvAbayb4tvn+9h4Rt3OR1jm7Sl5QRt
   ktkt+7RLoDfWJy1eyLNGfyA/qSVPy5GW80i+N7eam8JvqquTtQOEozzBp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="445780023"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="445780023"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 08:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="857720497"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="857720497"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2023 08:33:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAXvk-0002qy-24;
	Sat, 17 Jun 2023 15:33:36 +0000
Date: Sat, 17 Jun 2023 23:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [krzk-github:wip/sm8350-audio 16/36]
 drivers/usb/typec/mux/nb7vpq904m.c:98:24: error: call to undeclared function
 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202306172349.Xg2Aw18G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/sm8350-audio
head:   d24f8447c187285597f1322d9d57ebd6ee5a55fe
commit: 236a2a4503e2cd28b116847e9a7e6baadaa09204 [16/36] usb: typec: add support for the nb7vpq904m Type-C Linear Redriver
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230617/202306172349.Xg2Aw18G-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306172349.Xg2Aw18G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306172349.Xg2Aw18G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/typec/mux/nb7vpq904m.c:98:24: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                              EQ_SETTING_MASK, FIELD_PREP(EQ_SETTING_MASK, eq));
                                               ^
   drivers/usb/typec/mux/nb7vpq904m.c:119:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                                FIELD_PREP(GEN_DEV_SET_OP_MODE_MASK,
                                ^
   drivers/usb/typec/mux/nb7vpq904m.c:199:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                                FIELD_PREP(GEN_DEV_SET_OP_MODE_MASK,
                                ^
   3 errors generated.


vim +/FIELD_PREP +98 drivers/usb/typec/mux/nb7vpq904m.c

    80	
    81	static void nb7vpq904m_set_channel(struct nb7vpq904m *nb7, unsigned int channel, bool dp)
    82	{
    83		u8 eq, out_comp, flat_gain, loss_match;
    84	
    85		if (dp) {
    86			eq = NB7_IS_CHAN_AD(channel) ? 0x6 : 0x4;
    87			out_comp = 0x3;
    88			flat_gain = NB7_IS_CHAN_AD(channel) ? 0x2 : 0x1;
    89			loss_match = 0x3;
    90		} else {
    91			eq = 0x4;
    92			out_comp = 0x3;
    93			flat_gain = NB7_IS_CHAN_AD(channel) ? 0x3 : 0x1;
    94			loss_match = NB7_IS_CHAN_AD(channel) ? 0x1 : 0x3;
    95		}
    96	
    97		regmap_update_bits(nb7->regmap, EQ_SETTING_REG(channel),
  > 98				   EQ_SETTING_MASK, FIELD_PREP(EQ_SETTING_MASK, eq));
    99		regmap_update_bits(nb7->regmap, OUTPUT_COMPRESSION_AND_POL_REG(channel),
   100				   OUTPUT_COMPRESSION_MASK, FIELD_PREP(OUTPUT_COMPRESSION_MASK, out_comp));
   101		regmap_update_bits(nb7->regmap, FLAT_GAIN_REG(channel),
   102				   FLAT_GAIN_MASK, FIELD_PREP(FLAT_GAIN_MASK, flat_gain));
   103		regmap_update_bits(nb7->regmap, LOSS_MATCH_REG(channel),
   104				   LOSS_MATCH_MASK, FIELD_PREP(LOSS_MATCH_MASK, loss_match));
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
