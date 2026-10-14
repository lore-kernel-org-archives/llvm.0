Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA233783D5;
	Wed, 14 Oct 2026 18:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003900; cv=none; b=YPDtu8D4W+7xzHC0ILKdv/PZf0a12hxE/Gwbq4w8q4eI/ttlCnhxd7LSBCsQlzUuo7Y78JN8/wfi2UGa+G4K8s2D+Eep9uf4kYVwfOjz67xaQpz2gJ3Ii4haJIil1b89usrvCwWLLU4lqHhVXCzOe1xAxoWTM4ZvwZi8r6j5iK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003900; c=relaxed/simple;
	bh=lUS1W2Odg/+NGW15RceNNdFK33xN7jx6Tb2HGLAErtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOUFURVOysQG/bSS6c95UcC8P3n/yR5xsuuFz7b/UTf9lpNyA706U1GZTN4HSakFbRHF4TvJ2tN+iTPWCH3XFib/wn2MZvilOsMQOVoeYno+5a5Ynjnpdl1qQJF/2iWoRgSh4zWM7R/w/rH7BeBAsYNH/utFxCnh7uqUDzpPft8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USDUYvkI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USDUYvkI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792003898; x=1823539898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lUS1W2Odg/+NGW15RceNNdFK33xN7jx6Tb2HGLAErtQ=;
  b=USDUYvkIjLB62CCZR20m89GemeR6XxNRjcaMoVI3G/9C4TicfASQUjPH
   Y4tzEoh5ypRbNuX05xU+JvNHQFmgvZbcHqjCvpas0QJ4m0eLJi6iWcBdm
   T+/9wqzbzIXBHKt6jn4uvWrhXHBwi38ekJfTBuEnglaMJDnJ37MNfT3pJ
   OLaNzjb8A3D3ENAnidMyEArRlsyt5GNWFgpDcYQUjf9qIlouSDemz/4kD
   8F9Yyq2j8WVffCtKWoBkL9p0Ei45llK3+ikinBWhL4zLJeICWUiLNubsk
   aAvIY8wudI159sb1GCQFWiF33c87PYAxBL4aK+D00+qqxJW8tjcyW/JkF
   Q==;
X-CSE-ConnectionGUID: uyjRz3dwSaGFZ6Sp3a+M3Q==
X-CSE-MsgGUID: mZdeJ03DRrWj3iQ2jJO3ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="650248"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="650248"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:51:35 -0700
X-CSE-ConnectionGUID: qQVATI5hS+a0faOpbzMbRg==
X-CSE-MsgGUID: LUTeRA2TQSuclZxETRYAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1522677"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2026 11:51:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH44Z-00000000F4h-0z1H;
	Wed, 14 Oct 2026 18:51:31 +0000
Date: Thu, 15 Oct 2026 02:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] phy: mediatek: phy-mtk-hdmi: Use regmap to
 manipulate hdmi registers
Message-ID: <202610150209.02LARABo-lkp@intel.com>
References: <20261011082042.348422-2-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011082042.348422-2-l.scorcia@gmail.com>

Hi Luca,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Luca-Leonardo-Scorcia/dt-bindings-mediatek-hdmi-phy-Add-compatible-for-mt8167/20261010-135401]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Leonardo-Scorcia/phy-mediatek-phy-mtk-hdmi-Use-regmap-to-manipulate-hdmi-registers/20261011-102031
base:   https://github.com/intel-lab-lkp/linux Luca-Leonardo-Scorcia/dt-bindings-mediatek-hdmi-phy-Add-compatible-for-mt8167/20261010-135401
patch link:    https://lore.kernel.org/r/20261011082042.348422-2-l.scorcia%40gmail.com
patch subject: [RFC PATCH 1/1] phy: mediatek: phy-mtk-hdmi: Use regmap to manipulate hdmi registers
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261015/202610150209.02LARABo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150209.02LARABo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150209.02LARABo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:113:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     113 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_IC_MASK, 0x1);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:114:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     114 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_IR_MASK, 0x1);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:115:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     115 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_TX_POSDIV_MASK, pos_div);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:116:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     116 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_FBKSEL_MASK, 1);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:117:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_FBKDIV_MASK, 19);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:118:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     118 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON7, RG_HTPLL_DIVEN_MASK, 0x2);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:119:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     119 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BP_MASK, 0xc);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:120:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     120 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BC_MASK, 0x2);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:121:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     121 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BR_MASK, 0x1);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:124:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     124 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PRED_IBIAS_MASK, 0x3);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:126:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_DRV_IMP_MASK, 0x28);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:127:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     127 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON4, RG_HDMITX_RESERVE_MASK, 0x28);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:128:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     128 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_DRV_IBIAS_MASK, 0xa);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
>> drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c:140:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     140 |         val = FIELD_GET(RG_HTPLL_PREDIV_MASK, tmp);
         |               ^
   14 errors generated.
--
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:156:29: error: arithmetic on a pointer to an incomplete type 'struct regmap'
     156 |         tmp = readl(hdmi_phy->regs + HDMI_CON6);
         |                     ~~~~~~~~~~~~~~ ^
   include/linux/mfd/syscon.h:20:8: note: forward declaration of 'struct regmap'
      20 | struct regmap *device_node_to_regmap(struct device_node *np);
         |        ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c:173:29: error: arithmetic on a pointer to an incomplete type 'struct regmap'
     173 |         tmp = readl(hdmi_phy->regs + HDMI_CON2);
         |                     ~~~~~~~~~~~~~~ ^
   include/linux/mfd/syscon.h:20:8: note: forward declaration of 'struct regmap'
      20 | struct regmap *device_node_to_regmap(struct device_node *np);
         |        ^
   2 errors generated.
--
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c:163:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     163 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_PLL_PREDIV, pre_div);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c:13:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      13 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c:167:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     167 |                            FIELD_PREP(RG_HDMITX_PLL_IC, 0x1) |
         |                            ^
   2 errors generated.
--
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:43:3: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      43 |                 mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI20_CLK_CFG, REG_TXC_DIV, VAL_TXC_DIV4);
         |                 ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:65:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      65 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_IC, 0x1);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:66:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      66 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_BR, 0x2);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:67:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      67 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_2, RG_HDMITXPLL_IR, 0x2);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:72:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      72 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_0, RG_HDMITXPLL_HREN, 0x1);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:73:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_0, RG_HDMITXPLL_LVR_SEL, 0x1);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:99:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      99 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_10, RG_HDMITX21_BIAS_PE_BG_VREF_SEL, 0x2);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:101:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     101 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_9, RG_HDMITX21_SLDO_VREF_SEL, 0x2);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:104:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     104 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_INTR_CAL, 0x11);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:110:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV, txposdiv_value);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:136:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     136 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_4, RG_HDMITXPLL_POSDIV_DIV3_CTRL, div3_ctrl_value);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:137:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     137 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_4, RG_HDMITXPLL_POSDIV, posdiv_vallue);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:157:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     157 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_4, RG_HDMITXPLL_DIV_CTRL, div_ctrl_value);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:180:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     180 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT3_2, reserve_3_2_value);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:183:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     183 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT1_0, 0x2);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:188:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     188 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_4, RG_HDMITXPLL_PREDIV, prediv_value);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \
         |                                               ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:193:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     193 |         mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT13, reserve13_value);
         |         ^
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:25:40: note: expanded from macro 'mtk_phy_update_regmap_field'
      25 |         regmap_update_bits(regmap, reg, mask, FIELD_PREP(mask, val)); \


vim +/FIELD_PREP +113 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c

    96	
    97	static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
    98					 unsigned long parent_rate)
    99	{
   100		struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
   101		u32 pos_div;
   102	
   103		if (rate <= 64000000)
   104			pos_div = 3;
   105		else if (rate <= 128000000)
   106			pos_div = 2;
   107		else
   108			pos_div = 1;
   109	
   110		regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_PREDIV_MASK);
   111		regmap_set_bits(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
   112		regmap_set_bits(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
 > 113		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_IC_MASK, 0x1);
   114		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_IR_MASK, 0x1);
   115		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON2, RG_HDMITX_TX_POSDIV_MASK, pos_div);
   116		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_FBKSEL_MASK, 1);
   117		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_FBKDIV_MASK, 19);
   118		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON7, RG_HTPLL_DIVEN_MASK, 0x2);
   119		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BP_MASK, 0xc);
   120		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BC_MASK, 0x2);
   121		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON6, RG_HTPLL_BR_MASK, 0x1);
   122	
   123		regmap_clear_bits(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PRED_IMP);
   124		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_PRED_IBIAS_MASK, 0x3);
   125		regmap_clear_bits(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_EN_IMP_MASK);
   126		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON1, RG_HDMITX_DRV_IMP_MASK, 0x28);
   127		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON4, RG_HDMITX_RESERVE_MASK, 0x28);
   128		mtk_phy_update_regmap_field(hdmi_phy->regs, HDMI_CON0, RG_HDMITX_DRV_IBIAS_MASK, 0xa);
   129		return 0;
   130	}
   131	
   132	static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
   133						      unsigned long parent_rate)
   134	{
   135		struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
   136		unsigned long out_rate, val;
   137		u32 tmp;
   138	
   139		regmap_read(hdmi_phy->regs, HDMI_CON6, &tmp);
 > 140		val = FIELD_GET(RG_HTPLL_PREDIV_MASK, tmp);
   141		switch (val) {
   142		case 0x00:
   143			out_rate = parent_rate;
   144			break;
   145		case 0x01:
   146			out_rate = parent_rate / 2;
   147			break;
   148		default:
   149			out_rate = parent_rate / 4;
   150			break;
   151		}
   152	
   153		val = FIELD_GET(RG_HTPLL_FBKDIV_MASK, tmp);
   154		out_rate *= (val + 1) * 2;
   155	
   156		regmap_read(hdmi_phy->regs, HDMI_CON2, &tmp);
   157		val = FIELD_GET(RG_HDMITX_TX_POSDIV_MASK, tmp);
   158		out_rate >>= val;
   159	
   160		if (tmp & RG_HDMITX_EN_TX_POSDIV)
   161			out_rate /= 5;
   162	
   163		return out_rate;
   164	}
   165	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
