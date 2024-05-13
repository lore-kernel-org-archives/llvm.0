Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606C52D05E;
	Mon, 13 May 2024 05:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715577362; cv=none; b=b8t3BVXYdSFzkDAmymCC2b6Fzo3TBZ7Stiz5B9Fvh051ZstGOsPwGnjD0MzPmmPeNZtfwKf4IXH1deANDUhgJM3K4wyfGofU6OnGRBb0VPg/gD12qC7HxRXoCXr5BMXQNFDsBTlXJrF/oUAj21wMlGjQfYr1zczGbwV94LwYD2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715577362; c=relaxed/simple;
	bh=/TKp7mIly9nvaDtT0R+Tuh0OoJbNpdPfw2AGy7X781o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uz8mie0qHRYFk0Yf6SIHgfhCM5rfrrZJJW0RawKLVPrvnx4fl2g9xf1uNvJ309EoNTFe1o6J3JjXPLaiuLZKGCXfwLWAVAnjAZBxotr9eGHFZGj5v5Qjz0W9VsFcaFWwY9jbW9rWKOg/UC1KyinqBWWCbcdeKUDv5sGAa1jyZDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLwJnZKT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLwJnZKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715577360; x=1747113360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/TKp7mIly9nvaDtT0R+Tuh0OoJbNpdPfw2AGy7X781o=;
  b=HLwJnZKToUZbK2P9txgRfrmCeiIBMZlb/ZAa0RZCoai7pyEndTRhOWmW
   A4X0iR4ZgExbUjMP1kMJQXN/H4cs56uDAug59T7gLKAIoGepXt24FEBAa
   USkv3b82BI3EdlTgb2FZBqpfXtDjZv/lWSy70CKTcsupYZdMh5Ja8iMtx
   Ne5vhSoDHSOnrzPGAYs0+SasmLReHJk3CIc5GHz2aVFpJOn1MDfCemdV1
   ptb7LHmpW5BRIM8ZSD4yJHUhi64xTJ+D4zQQF3enmIpEuymRj3jrdELyG
   ch2t7L3axXFnJJ70ZzVLPvv6k/Cbt1sJUhcqEWXV5oz0SMDExj7KPyuSM
   g==;
X-CSE-ConnectionGUID: zaO6SRf1QSKBYC1iKT1eJw==
X-CSE-MsgGUID: REQWidoQSXSU2CZjgBlcuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="36871359"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="36871359"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 22:16:00 -0700
X-CSE-ConnectionGUID: 4moxybXbQX2QBT2L56+O/g==
X-CSE-MsgGUID: 3YPGGmpIQlqwfw5ji33JsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="53444420"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2024 22:15:58 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6O2W-0009ZN-0y;
	Mon, 13 May 2024 05:15:56 +0000
Date: Mon, 13 May 2024 13:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 2/6] net: stmmac: remove pcs_ctrl_ane()
 method and associated code
Message-ID: <202405131223.7F8xA20v-lkp@intel.com>
References: <E1s6C4O-00Ck6O-9D@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1s6C4O-00Ck6O-9D@rmk-PC.armlinux.org.uk>

Hi Russell,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-remove-pcs_ctrl_ane-method-and-associated-code/20240513-003120
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1s6C4O-00Ck6O-9D%40rmk-PC.armlinux.org.uk
patch subject: [PATCH RFC net-next 2/6] net: stmmac: remove pcs_ctrl_ane() method and associated code
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240513/202405131223.7F8xA20v-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405131223.7F8xA20v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131223.7F8xA20v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:628:3: error: implicit declaration of function 'stmmac_pcs_ctrl_ane' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
                   ^
   1 error generated.


vim +/stmmac_pcs_ctrl_ane +628 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

a7c30e62d4b895 Vinod Koul          2019-01-21  607  
981d947bcd382c Sneh Shah           2023-12-12  608  /* On interface toggle MAC registers gets reset.
981d947bcd382c Sneh Shah           2023-12-12  609   * Configure MAC block for SGMII on ethernet phy link up
981d947bcd382c Sneh Shah           2023-12-12  610   */
463120c31c58bb Bartosz Golaszewski 2023-06-19  611  static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
463120c31c58bb Bartosz Golaszewski 2023-06-19  612  {
a818bd12538c14 Sneh Shah           2024-02-20  613  	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
a818bd12538c14 Sneh Shah           2024-02-20  614  	struct stmmac_priv *priv = netdev_priv(dev);
463120c31c58bb Bartosz Golaszewski 2023-06-19  615  	int val;
463120c31c58bb Bartosz Golaszewski 2023-06-19  616  
463120c31c58bb Bartosz Golaszewski 2023-06-19  617  	val = readl(ethqos->mac_base + MAC_CTRL_REG);
463120c31c58bb Bartosz Golaszewski 2023-06-19  618  
463120c31c58bb Bartosz Golaszewski 2023-06-19  619  	switch (ethqos->speed) {
a818bd12538c14 Sneh Shah           2024-02-20  620  	case SPEED_2500:
a818bd12538c14 Sneh Shah           2024-02-20  621  		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
a818bd12538c14 Sneh Shah           2024-02-20  622  		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
a818bd12538c14 Sneh Shah           2024-02-20  623  			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
a818bd12538c14 Sneh Shah           2024-02-20  624  			      RGMII_IO_MACRO_CONFIG2);
a818bd12538c14 Sneh Shah           2024-02-20  625  		if (ethqos->serdes_speed != SPEED_2500)
a818bd12538c14 Sneh Shah           2024-02-20  626  			phy_set_speed(ethqos->serdes_phy, SPEED_2500);
a818bd12538c14 Sneh Shah           2024-02-20  627  		ethqos->serdes_speed = SPEED_2500;
a818bd12538c14 Sneh Shah           2024-02-20 @628  		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
a818bd12538c14 Sneh Shah           2024-02-20  629  		break;
463120c31c58bb Bartosz Golaszewski 2023-06-19  630  	case SPEED_1000:
463120c31c58bb Bartosz Golaszewski 2023-06-19  631  		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
463120c31c58bb Bartosz Golaszewski 2023-06-19  632  		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
463120c31c58bb Bartosz Golaszewski 2023-06-19  633  			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
463120c31c58bb Bartosz Golaszewski 2023-06-19  634  			      RGMII_IO_MACRO_CONFIG2);
a818bd12538c14 Sneh Shah           2024-02-20  635  		if (ethqos->serdes_speed != SPEED_1000)
a818bd12538c14 Sneh Shah           2024-02-20  636  			phy_set_speed(ethqos->serdes_phy, SPEED_1000);
a818bd12538c14 Sneh Shah           2024-02-20  637  		ethqos->serdes_speed = SPEED_1000;
a818bd12538c14 Sneh Shah           2024-02-20  638  		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
463120c31c58bb Bartosz Golaszewski 2023-06-19  639  		break;
463120c31c58bb Bartosz Golaszewski 2023-06-19  640  	case SPEED_100:
463120c31c58bb Bartosz Golaszewski 2023-06-19  641  		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
a818bd12538c14 Sneh Shah           2024-02-20  642  		if (ethqos->serdes_speed != SPEED_1000)
a818bd12538c14 Sneh Shah           2024-02-20  643  			phy_set_speed(ethqos->serdes_phy, SPEED_1000);
a818bd12538c14 Sneh Shah           2024-02-20  644  		ethqos->serdes_speed = SPEED_1000;
a818bd12538c14 Sneh Shah           2024-02-20  645  		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
463120c31c58bb Bartosz Golaszewski 2023-06-19  646  		break;
463120c31c58bb Bartosz Golaszewski 2023-06-19  647  	case SPEED_10:
463120c31c58bb Bartosz Golaszewski 2023-06-19  648  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
463120c31c58bb Bartosz Golaszewski 2023-06-19  649  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
981d947bcd382c Sneh Shah           2023-12-12  650  		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
981d947bcd382c Sneh Shah           2023-12-12  651  			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
981d947bcd382c Sneh Shah           2023-12-12  652  					 SGMII_10M_RX_CLK_DVDR),
981d947bcd382c Sneh Shah           2023-12-12  653  			      RGMII_IO_MACRO_CONFIG);
a818bd12538c14 Sneh Shah           2024-02-20  654  		if (ethqos->serdes_speed != SPEED_1000)
a818bd12538c14 Sneh Shah           2024-02-20  655  			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
a818bd12538c14 Sneh Shah           2024-02-20  656  		ethqos->serdes_speed = SPEED_1000;
a818bd12538c14 Sneh Shah           2024-02-20  657  		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
463120c31c58bb Bartosz Golaszewski 2023-06-19  658  		break;
463120c31c58bb Bartosz Golaszewski 2023-06-19  659  	}
463120c31c58bb Bartosz Golaszewski 2023-06-19  660  
463120c31c58bb Bartosz Golaszewski 2023-06-19  661  	writel(val, ethqos->mac_base + MAC_CTRL_REG);
463120c31c58bb Bartosz Golaszewski 2023-06-19  662  
463120c31c58bb Bartosz Golaszewski 2023-06-19  663  	return val;
463120c31c58bb Bartosz Golaszewski 2023-06-19  664  }
463120c31c58bb Bartosz Golaszewski 2023-06-19  665  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
