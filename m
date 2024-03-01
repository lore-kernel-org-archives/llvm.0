Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C445915D;
	Fri,  1 Mar 2024 22:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709331399; cv=none; b=iTKsxVGDhxCDGyQ2TUkp+wBsfkI6lQiR5dsytoh/5psybiU4uo+nsdArOmJxoewNR5epOtw+vK2sdI96jCFKKp7sHaDLFihfJN7L/axko8rxGKn0Y1MK0abOORXCVg1unDAPKT2dkTut2ZefEpORPHk58jCg47b3q5KA016u7kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709331399; c=relaxed/simple;
	bh=oDYARa8WXz+458IiNigRRHYZUnbrXioVYYLvK/lUIG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X3zwUiWdKI6NBHJkhLIhYuwvC19T4bZdKpaL4RqpAZP8vQVKojHpHiJpjFiPPQj9WF4+zxy8SVs4FHjWTrwHgrvXC2UK1OWWOHzN0+hMIpVNXl4LGy4RzGMb167prsIDhbqU2vz29VNPwUvsK+7tAqNOanI3JaXZdoZOhVi0EKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGzXhveX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGzXhveX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709331394; x=1740867394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oDYARa8WXz+458IiNigRRHYZUnbrXioVYYLvK/lUIG0=;
  b=YGzXhveXBvmybDUYS1Y5eUErK5zftzK6AGYWwY/PmygLFOjXpvf/MqRj
   GoDEEKD7ZS7Iyh439MUE4rdd/24EYkwn45i5+n8EZLfm5pZscipg9BCO4
   hsi8AY4qCEIDmwuEtRFpL0gI4edQL1oOHHosN6+NfltS+Aep7PCg5QWlN
   UHMz8MTKbgPQ/VBj9b20dRJt4GkNCfENOiZ1JSUGV6I+o4LAPr5sqv+Rl
   Ge+mGlmR+T817rcpRsO51zBQDn607Uc83bMc8NYlq9PJlJA5unjLEAF0I
   h/CrkH9b5WneUmeDvYAp8XMnfrjULuCqPfKIUd3nKOOCXkJ/b0wMNSAUc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4010435"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="4010435"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 14:16:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8392426"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2024 14:16:32 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgBB7-000E8Q-1w;
	Fri, 01 Mar 2024 22:16:29 +0000
Date: Sat, 2 Mar 2024 06:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:net-queue 70/72] drivers/net/phy/phylink.c:1190:49: error: use
 of undeclared identifier 'state'
Message-ID: <202403020610.dZd9Kzcc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git net-queue
head:   ccd059cded5d2b8ed8f784a837b02a578fa927ff
commit: c62df466ec00e3b18bc49d91acd19b8ceb3abb63 [70/72] net: phylink: add pcs_query_inband()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240302/202403020610.dZd9Kzcc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020610.dZd9Kzcc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020610.dZd9Kzcc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/phylink.c:1190:49: error: use of undeclared identifier 'state'
                   pcs_link_mode = phylink_pcs_query_inband(pcs, state->interface);
                                                                 ^
>> drivers/net/phy/phylink.c:1192:47: error: too few arguments to function call, expected 2, have 1
                           phy_link_mode = phy_query_inband(pl->phydev);
                                           ~~~~~~~~~~~~~~~~           ^
   include/linux/phy.h:1785:14: note: 'phy_query_inband' declared here
   unsigned int phy_query_inband(struct phy_device *phydev,
                ^
   2 errors generated.


vim +/state +1190 drivers/net/phy/phylink.c

  1157	
  1158	/**
  1159	 * phylink_pcs_neg_mode() - helper to determine PCS inband mode
  1160	 * @pl:
  1161	 * @pcs:
  1162	 * @mode: one of %MLO_AN_FIXED, %MLO_AN_PHY, %MLO_AN_INBAND.
  1163	 * @interface: interface mode to be used
  1164	 * @advertising: adertisement ethtool link mode mask
  1165	 *
  1166	 * Determines the negotiation mode to be used by the PCS, and returns
  1167	 * one of:
  1168	 *
  1169	 * - %PHYLINK_PCS_NEG_NONE: interface mode does not support inband
  1170	 * - %PHYLINK_PCS_NEG_OUTBAND: an out of band mode (e.g. reading the PHY)
  1171	 *   will be used.
  1172	 * - %PHYLINK_PCS_NEG_INBAND_DISABLED: inband mode selected but autoneg
  1173	 *   disabled
  1174	 * - %PHYLINK_PCS_NEG_INBAND_ENABLED: inband mode selected and autoneg enabled
  1175	 *
  1176	 * Note: this is for cases where the PCS itself is involved in negotiation
  1177	 * (e.g. Clause 37, SGMII and similar) not Clause 73.
  1178	 */
  1179	static unsigned int phylink_pcs_neg_mode(struct phylink *pl,
  1180						 struct phylink_pcs *pcs,
  1181						 unsigned int mode,
  1182						 phy_interface_t interface,
  1183						 const unsigned long *advertising)
  1184	{
  1185		unsigned int pcs_link_mode = 0;
  1186		unsigned int phy_link_mode = 0;
  1187		unsigned int neg_mode;
  1188	
  1189		if (phylink_autoneg_inband(mode)) {
> 1190			pcs_link_mode = phylink_pcs_query_inband(pcs, state->interface);
  1191			if (pl->phydev)
> 1192				phy_link_mode = phy_query_inband(pl->phydev);
  1193		}
  1194	
  1195		switch (interface) {
  1196		case PHY_INTERFACE_MODE_SGMII:
  1197		case PHY_INTERFACE_MODE_QSGMII:
  1198		case PHY_INTERFACE_MODE_QUSGMII:
  1199		case PHY_INTERFACE_MODE_USXGMII:
  1200			/* These protocols are designed for use with a PHY which
  1201			 * communicates its negotiation result back to the MAC via
  1202			 * inband communication. Note: there exist PHYs that run
  1203			 * with SGMII but do not send the inband data.
  1204			 */
  1205			if (!phylink_autoneg_inband(mode))
  1206				neg_mode = PHYLINK_PCS_NEG_OUTBAND;
  1207			else
  1208				neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
  1209			break;
  1210	
  1211		case PHY_INTERFACE_MODE_1000BASEX:
  1212		case PHY_INTERFACE_MODE_2500BASEX:
  1213			/* 1000base-X is designed for use media-side for Fibre
  1214			 * connections, and thus the Autoneg bit needs to be
  1215			 * taken into account. We also do this for 2500base-X
  1216			 * as well, but drivers may not support this, so may
  1217			 * need to override this.
  1218			 */
  1219			if (!phylink_autoneg_inband(mode))
  1220				neg_mode = PHYLINK_PCS_NEG_OUTBAND;
  1221			else if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
  1222						   advertising))
  1223				neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
  1224			else
  1225				neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED;
  1226			break;
  1227	
  1228		default:
  1229			neg_mode = PHYLINK_PCS_NEG_NONE;
  1230			break;
  1231		}
  1232	
  1233		return neg_mode;
  1234	}
  1235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
