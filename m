Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795383476;
	b=S2aBB/OtwOjZ/nLKDuXXIFmguVPNC9HFtGhakUcbDSo9AZSfMGoS0SBPfsFUBQXk7sM0
	 19+V7lmHzGrV//HZqhkzT0PtCTAJL9GU5Fnnt37kFaZQzX3ybBHJcmF0gUzMh92LTfiFH
	 k1FAfoFbqC46HU5KGuxKtDqGzCodWL0Flx4vnI2WyakFD//Vx4T75V1Bt9CyaJFIA6OY7
	 OD01v54Tm2eJwwz05GQOogQkltRX4TUCTduOf9Pggigx2rAEsUxnjOp1ZCSt1CUvif/bq
	 M2kvTinMLShLiDdICwmJPmijdtseNbB0lR4QQpllHCFT/WwtKsaT83CC0N7OmEu+ZgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383476;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=r33Cj4lupPhh24gJePZ1Dl7y1V10m6bSBH32VLKAENo=;
	b=cwrUC1IDCLsJJsnguIIOdGT3abYAe4H1CUL6uJPg4qo+4RH7bEaUm2Jcdn9T5Z+o9m8U
	 isYCIElYwl95EQn99JFciD/XtraIuYBSgVUpfs/xLDPpLywSbKcXEA0YhiwUrXGt7MYnv
	 mDuo0otlOQGY7HQL8GZ389rwXG/s0QDH1ApaYeoc/I8iBekRAPsYSKJLmascm/ReqSYPR
	 i0BDD/+R2jKR3m75hc2iFFuZlaYJzXZxOZNsJSYIFhjLEo8en6AI99X7gHWxD1N0XK92F
	 H3XEEvMAsjjZTRieUl1Nnxdok1CMc/N+mi5dG+UPj2GhjOmDLUaZpklBraqFYqWV2qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AFkBYtwS;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBF7606A31D;
	Sun, 22 Nov 2026 21:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBF7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AFkBYtwS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795383475; x=1826919475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=47WiqbuVGJhCQD/UFYev9AOeQxncNO/1VcFLwy5fqR8=;
  b=AFkBYtwS5GTKXqOC8E7+Dse3unNTGZHegPG8l2FfePsuJevhleTRtAYQ
   UL1S7RamQYC2HSvwCHlXIrZGUjlVjhDag3V/oQSv98k8mzCAM5Tdrli/r
   cozooMTcvDLQ5NxeMyQQ8hGgZRjwJi5lYHzQTDqJiQj4X74Moo2gZnJfg
   L69H82UoUamHdfNe4HbKdRxzKRNEuKv1BJ1eueXCzIzS2nHWBJ6kN8AgV
   z66lExb3ieYJbhVUn5rnowCRo8Ux4ynw+MHOSChjIMn21Qrt8ZmnBfRvI
   P5FhMUNb5K5nyOIElFJKwETgOZf2Qgiq+w4wU0b+zB0Zi9rNnO1zrWAMa
   w==;
X-CSE-ConnectionGUID: 942gYQj+Tx+NoZ+V49ihjw==
X-CSE-MsgGUID: 0hoQwHezTRuV7rCfwZmSsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4085141"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4085141"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 13:37:54 -0800
X-CSE-ConnectionGUID: a+H/fAZnQ1WSPIPsfJH+bw==
X-CSE-MsgGUID: V9DTBvzdRyOQ6xxQb8LhZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11082364"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2026 13:37:50 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVFFs-00000001M6c-0KH7;
	Sun, 22 Nov 2026 21:37:48 +0000
Date: Mon, 23 Nov 2026 05:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH v2 5/5] phy: apple: atc: Split generation-specific code
Message-ID: <202611230532.xXpnoRHP-lkp@intel.com>
References: <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>

Hi Sasha,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Finkelstein/dt-bindings-phy-atcphy-Add-M3-series/20261122-132757
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261122-t8122-phy-v2-5-8d5c8fdf31ba%40chaosmail.tech
patch subject: [PATCH v2 5/5] phy: apple: atc: Split generation-specific code
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261123/202611230532.xXpnoRHP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/202611230532.xXpnoRHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611230532.xXpnoRHP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/apple/atc-t8103.c:33:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |                     FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
         |                     ^
   drivers/phy/apple/atc-t8103.c:71:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      71 |                     FIELD_PREP(DPRX_PCLK_SELECT, 1));
         |                     ^
   drivers/phy/apple/atc-t8103.c:146:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     146 |                FIELD_PREP(ACIOPHY_SLEEP_CTRL_TX_SMALL_OV, 3));
         |                ^
   3 errors generated.
--
>> drivers/phy/apple/atc-t8122.c:78:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      78 |                FIELD_PREP(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV, 2),
         |                ^
   drivers/phy/apple/atc-t8122.c:158:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     158 |                     FIELD_PREP(AUSPLL_APB_CMD_OVERRIDE_CMD, command) |
         |                     ^
   drivers/phy/apple/atc-t8122.c:173:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |                     FIELD_PREP(DPTX_PCLK1_SELECT, 1) | FIELD_PREP(DPTX_PCLK2_SELECT, 1) |
         |                     ^
   drivers/phy/apple/atc-t8122.c:249:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     249 |                FIELD_PREP(LN_LDOCLK1_VREG_ADJ, 12));
         |                ^
   drivers/phy/apple/atc-t8122.c:307:25: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |                LN_VREF221_EN | FIELD_PREP(LN_VREF221_FILTER_ADJUST, 1));
         |                                ^
   5 errors generated.


vim +/FIELD_PREP +33 drivers/phy/apple/atc-t8103.c

    11	
    12	static void atcphy_configure_pipehandler_usb3_host_t8103(struct apple_atcphy *atcphy)
    13	{
    14		int ret;
    15		u32 reg;
    16	
    17		core_set32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG0,
    18			   ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N);
    19		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG, ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV);
    20		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
    21					 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
    22		if (ret)
    23			dev_warn(atcphy->dev,
    24				 "Timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
    25	
    26		core_set32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
    27			   ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
    28		core_clear32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
    29			     ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
    30	
    31		core_mask32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG1,
    32			    ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN,
  > 33			    FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
    34	
    35		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG,
    36			   ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV);
    37		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    38			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
    39		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    40			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
    41		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_CIOPHY_CFG1);
    42	
    43		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
    44					 (reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK0), 10, 10000);
    45		if (ret)
    46			dev_warn(atcphy->dev,
    47				 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK0\n");
    48	
    49		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
    50					 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
    51		if (ret)
    52			dev_warn(atcphy->dev,
    53				 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
    54	
    55		atcphy_clear_nonselected_phy_reset(atcphy);
    56	
    57		/* More BIST stuff (?) */
    58		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_OV_CFG);
    59		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    60			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
    61		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    62			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
