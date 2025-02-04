Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBCE203710;
	Tue,  4 Feb 2025 21:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738703161; cv=none; b=e6kAQT8O+17yqRWYgSCqs8xhd2XW5ZGcKOX4HqntUNWclaiRdUas36+/cPEDCHLxnUK1pWIHjNseotvhdppoH6kBXIL0L7RkQQxWR1YW3ak6l4grzlD2ECBf4jAApRmiXnpy8mBJ63lhZbHp0xzsfoWDFeXr+dFKgQSQzRWDsK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738703161; c=relaxed/simple;
	bh=RuXgFcGDF9Ed66J6sTyG4wfX4s2ucDDE3qYghVIFRgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fHbHY+AYkzJP5KqDAdwOU6XLXyn1k4e9GYOqcquJPIIvLCrJRHTVkwYs0QSEXAmN0vvNw68lmMbxGkIrQD1RGBvz4EhKDcwYzK/3QQgclrmTdj2tgGDiSAJqeGf57tfdq0sjyNQQhAFnSxtcIHotLvXMhfdiR6HvDkF0HjRlPew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P59tqN8I; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P59tqN8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738703159; x=1770239159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RuXgFcGDF9Ed66J6sTyG4wfX4s2ucDDE3qYghVIFRgE=;
  b=P59tqN8IoZ7y1hsNxm9apnLq7h3BuYTOb/7lMmLHTma8l9r8SU2JK1qC
   4wdTF2oLceRnMvONpBvu7kukl03OmLRegznoF2F/2P6wQ3oHACC+t4f9K
   W3DtBUDvOVRQUzt5cZbYx1jMNnKYh2EBxaavBIzfLvwqLFMR1gzsGswzY
   K8m4/jH0obL7Vrze0KaNrgRNsCoGA9r0DyXgTtnHjSvD/rmcMlLUuREIJ
   TELWC38iXrSbCe8WNIGjUEfxsn9xC5ON7buQq7YjnwwjC770vDU9liPJm
   T8ikr+9Lr/htXTOBG4Vyxg8WJdi164mN7zChKq02o0LoOCFBID/Uc0qfF
   Q==;
X-CSE-ConnectionGUID: F9BS4B0uSO+GB1BJJoHLjA==
X-CSE-MsgGUID: dFKDtA+QTrKt905c5SNW3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="26849548"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="26849548"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 13:05:59 -0800
X-CSE-ConnectionGUID: 5k0TK33ZTb6HYBI9eGZzyw==
X-CSE-MsgGUID: tlaJ2HEzQcKplwhhYpyjMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111573720"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 13:05:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfQ7F-000t0l-1w;
	Tue, 04 Feb 2025 21:05:53 +0000
Date: Wed, 5 Feb 2025 05:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 371/504] drivers/phy/ti/phy-gmii-sel.c:120:33:
 warning: shift count >= width of type
Message-ID: <202502050459.sfvpQSC6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   4bb3217d050fc4871623ae6035fa7b73d33d90ad
commit: 283af8498d05e86e44d20b589ac66a75860a795a [371/504] net: phy: Add phy interfaces 100Gbase-r, 200Gbase-r and 400Gbase-r
config: arm-randconfig-003-20250205 (https://download.01.org/0day-ci/archive/20250205/202502050459.sfvpQSC6-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050459.sfvpQSC6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050459.sfvpQSC6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/ti/phy-gmii-sel.c:120:33: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (!(soc_data->extra_modes & BIT(PHY_INTERFACE_MODE_USXGMII)))
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   drivers/phy/ti/phy-gmii-sel.c:252:10: warning: shift count >= width of type [-Wshift-count-overflow]
                          BIT(PHY_INTERFACE_MODE_USXGMII),
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   2 warnings generated.


vim +120 drivers/phy/ti/phy-gmii-sel.c

92b58b34741ff5 Grygorii Strashko   2018-11-25   69  
92b58b34741ff5 Grygorii Strashko   2018-11-25   70  static int phy_gmii_sel_mode(struct phy *phy, enum phy_mode mode, int submode)
92b58b34741ff5 Grygorii Strashko   2018-11-25   71  {
92b58b34741ff5 Grygorii Strashko   2018-11-25   72  	struct phy_gmii_sel_phy_priv *if_phy = phy_get_drvdata(phy);
92b58b34741ff5 Grygorii Strashko   2018-11-25   73  	const struct phy_gmii_sel_soc_data *soc_data = if_phy->priv->soc_data;
92b58b34741ff5 Grygorii Strashko   2018-11-25   74  	struct device *dev = if_phy->priv->dev;
92b58b34741ff5 Grygorii Strashko   2018-11-25   75  	struct regmap_field *regfield;
92b58b34741ff5 Grygorii Strashko   2018-11-25   76  	int ret, rgmii_id = 0;
92b58b34741ff5 Grygorii Strashko   2018-11-25   77  	u32 gmii_sel_mode = 0;
92b58b34741ff5 Grygorii Strashko   2018-11-25   78  
92b58b34741ff5 Grygorii Strashko   2018-11-25   79  	if (mode != PHY_MODE_ETHERNET)
92b58b34741ff5 Grygorii Strashko   2018-11-25   80  		return -EINVAL;
92b58b34741ff5 Grygorii Strashko   2018-11-25   81  
92b58b34741ff5 Grygorii Strashko   2018-11-25   82  	switch (submode) {
92b58b34741ff5 Grygorii Strashko   2018-11-25   83  	case PHY_INTERFACE_MODE_RMII:
92b58b34741ff5 Grygorii Strashko   2018-11-25   84  		gmii_sel_mode = AM33XX_GMII_SEL_MODE_RMII;
92b58b34741ff5 Grygorii Strashko   2018-11-25   85  		break;
92b58b34741ff5 Grygorii Strashko   2018-11-25   86  
92b58b34741ff5 Grygorii Strashko   2018-11-25   87  	case PHY_INTERFACE_MODE_RGMII:
316b4294590662 Grygorii Strashko   2019-10-23   88  	case PHY_INTERFACE_MODE_RGMII_RXID:
92b58b34741ff5 Grygorii Strashko   2018-11-25   89  		gmii_sel_mode = AM33XX_GMII_SEL_MODE_RGMII;
92b58b34741ff5 Grygorii Strashko   2018-11-25   90  		break;
92b58b34741ff5 Grygorii Strashko   2018-11-25   91  
92b58b34741ff5 Grygorii Strashko   2018-11-25   92  	case PHY_INTERFACE_MODE_RGMII_ID:
92b58b34741ff5 Grygorii Strashko   2018-11-25   93  	case PHY_INTERFACE_MODE_RGMII_TXID:
92b58b34741ff5 Grygorii Strashko   2018-11-25   94  		gmii_sel_mode = AM33XX_GMII_SEL_MODE_RGMII;
92b58b34741ff5 Grygorii Strashko   2018-11-25   95  		rgmii_id = 1;
92b58b34741ff5 Grygorii Strashko   2018-11-25   96  		break;
92b58b34741ff5 Grygorii Strashko   2018-11-25   97  
92b58b34741ff5 Grygorii Strashko   2018-11-25   98  	case PHY_INTERFACE_MODE_MII:
58aa7729310db0 Grygorii Strashko   2020-02-14   99  	case PHY_INTERFACE_MODE_GMII:
eefed634eb61e4 Grygorii Strashko   2020-02-14  100  		gmii_sel_mode = AM33XX_GMII_SEL_MODE_MII;
92b58b34741ff5 Grygorii Strashko   2018-11-25  101  		break;
92b58b34741ff5 Grygorii Strashko   2018-11-25  102  
af96579dc31761 Siddharth Vadapalli 2022-09-12  103  	case PHY_INTERFACE_MODE_QSGMII:
af96579dc31761 Siddharth Vadapalli 2022-09-12  104  		if (!(soc_data->extra_modes & BIT(PHY_INTERFACE_MODE_QSGMII)))
af96579dc31761 Siddharth Vadapalli 2022-09-12  105  			goto unsupported;
af96579dc31761 Siddharth Vadapalli 2022-09-12  106  		if (if_phy->priv->qsgmii_main_ports & BIT(if_phy->id - 1))
af96579dc31761 Siddharth Vadapalli 2022-09-12  107  			gmii_sel_mode = J72XX_GMII_SEL_MODE_QSGMII;
af96579dc31761 Siddharth Vadapalli 2022-09-12  108  		else
af96579dc31761 Siddharth Vadapalli 2022-09-12  109  			gmii_sel_mode = J72XX_GMII_SEL_MODE_QSGMII_SUB;
af96579dc31761 Siddharth Vadapalli 2022-09-12  110  		break;
af96579dc31761 Siddharth Vadapalli 2022-09-12  111  
6a301188420ae5 Siddharth Vadapalli 2023-03-09  112  	case PHY_INTERFACE_MODE_SGMII:
6a301188420ae5 Siddharth Vadapalli 2023-03-09  113  		if (!(soc_data->extra_modes & BIT(PHY_INTERFACE_MODE_SGMII)))
6a301188420ae5 Siddharth Vadapalli 2023-03-09  114  			goto unsupported;
6a301188420ae5 Siddharth Vadapalli 2023-03-09  115  		else
6a301188420ae5 Siddharth Vadapalli 2023-03-09  116  			gmii_sel_mode = J72XX_GMII_SEL_MODE_SGMII;
6a301188420ae5 Siddharth Vadapalli 2023-03-09  117  		break;
6a301188420ae5 Siddharth Vadapalli 2023-03-09  118  
8d087a09c7017f Siddharth Vadapalli 2023-03-31  119  	case PHY_INTERFACE_MODE_USXGMII:
8d087a09c7017f Siddharth Vadapalli 2023-03-31 @120  		if (!(soc_data->extra_modes & BIT(PHY_INTERFACE_MODE_USXGMII)))
8d087a09c7017f Siddharth Vadapalli 2023-03-31  121  			goto unsupported;
8d087a09c7017f Siddharth Vadapalli 2023-03-31  122  		else
8d087a09c7017f Siddharth Vadapalli 2023-03-31  123  			gmii_sel_mode = J72XX_GMII_SEL_MODE_USXGMII;
8d087a09c7017f Siddharth Vadapalli 2023-03-31  124  		break;
8d087a09c7017f Siddharth Vadapalli 2023-03-31  125  
92b58b34741ff5 Grygorii Strashko   2018-11-25  126  	default:
af96579dc31761 Siddharth Vadapalli 2022-09-12  127  		goto unsupported;
1a3a09270668d9 kbuild test robot   2018-12-09  128  	}
92b58b34741ff5 Grygorii Strashko   2018-11-25  129  
92b58b34741ff5 Grygorii Strashko   2018-11-25  130  	if_phy->phy_if_mode = submode;
92b58b34741ff5 Grygorii Strashko   2018-11-25  131  
92b58b34741ff5 Grygorii Strashko   2018-11-25  132  	dev_dbg(dev, "%s id:%u mode:%u rgmii_id:%d rmii_clk_ext:%d\n",
eefed634eb61e4 Grygorii Strashko   2020-02-14  133  		__func__, if_phy->id, submode, rgmii_id,
92b58b34741ff5 Grygorii Strashko   2018-11-25  134  		if_phy->rmii_clock_external);
92b58b34741ff5 Grygorii Strashko   2018-11-25  135  
92b58b34741ff5 Grygorii Strashko   2018-11-25  136  	regfield = if_phy->fields[PHY_GMII_SEL_PORT_MODE];
92b58b34741ff5 Grygorii Strashko   2018-11-25  137  	ret = regmap_field_write(regfield, gmii_sel_mode);
92b58b34741ff5 Grygorii Strashko   2018-11-25  138  	if (ret) {
92b58b34741ff5 Grygorii Strashko   2018-11-25  139  		dev_err(dev, "port%u: set mode fail %d", if_phy->id, ret);
92b58b34741ff5 Grygorii Strashko   2018-11-25  140  		return ret;
92b58b34741ff5 Grygorii Strashko   2018-11-25  141  	}
92b58b34741ff5 Grygorii Strashko   2018-11-25  142  
92b58b34741ff5 Grygorii Strashko   2018-11-25  143  	if (soc_data->features & BIT(PHY_GMII_SEL_RGMII_ID_MODE) &&
92b58b34741ff5 Grygorii Strashko   2018-11-25  144  	    if_phy->fields[PHY_GMII_SEL_RGMII_ID_MODE]) {
92b58b34741ff5 Grygorii Strashko   2018-11-25  145  		regfield = if_phy->fields[PHY_GMII_SEL_RGMII_ID_MODE];
92b58b34741ff5 Grygorii Strashko   2018-11-25  146  		ret = regmap_field_write(regfield, rgmii_id);
92b58b34741ff5 Grygorii Strashko   2018-11-25  147  		if (ret)
92b58b34741ff5 Grygorii Strashko   2018-11-25  148  			return ret;
92b58b34741ff5 Grygorii Strashko   2018-11-25  149  	}
92b58b34741ff5 Grygorii Strashko   2018-11-25  150  
92b58b34741ff5 Grygorii Strashko   2018-11-25  151  	if (soc_data->features & BIT(PHY_GMII_SEL_RMII_IO_CLK_EN) &&
92b58b34741ff5 Grygorii Strashko   2018-11-25  152  	    if_phy->fields[PHY_GMII_SEL_RMII_IO_CLK_EN]) {
92b58b34741ff5 Grygorii Strashko   2018-11-25  153  		regfield = if_phy->fields[PHY_GMII_SEL_RMII_IO_CLK_EN];
92b58b34741ff5 Grygorii Strashko   2018-11-25  154  		ret = regmap_field_write(regfield,
92b58b34741ff5 Grygorii Strashko   2018-11-25  155  					 if_phy->rmii_clock_external);
92b58b34741ff5 Grygorii Strashko   2018-11-25  156  	}
92b58b34741ff5 Grygorii Strashko   2018-11-25  157  
92b58b34741ff5 Grygorii Strashko   2018-11-25  158  	return 0;
af96579dc31761 Siddharth Vadapalli 2022-09-12  159  
af96579dc31761 Siddharth Vadapalli 2022-09-12  160  unsupported:
af96579dc31761 Siddharth Vadapalli 2022-09-12  161  	dev_warn(dev, "port%u: unsupported mode: \"%s\"\n",
af96579dc31761 Siddharth Vadapalli 2022-09-12  162  		 if_phy->id, phy_modes(submode));
af96579dc31761 Siddharth Vadapalli 2022-09-12  163  	return -EINVAL;
92b58b34741ff5 Grygorii Strashko   2018-11-25  164  }
92b58b34741ff5 Grygorii Strashko   2018-11-25  165  

:::::: The code at line 120 was first introduced by commit
:::::: 8d087a09c7017f1425f3f1d36807eb4988410942 phy: ti: gmii-sel: Enable USXGMII mode for J784S4

:::::: TO: Siddharth Vadapalli <s-vadapalli@ti.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
