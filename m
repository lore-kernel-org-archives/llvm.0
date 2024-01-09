Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B154F7F7;
	Tue,  9 Jan 2024 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFOrr2kF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704762022; x=1736298022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w9UCPLoHz3NrNQ/Hxd1VWzdT16VyjvEOX8iD4SDq0n0=;
  b=jFOrr2kFQvZ/jL/BfPmmPrGBqEV2VtxcsiY9S46EFyGdkpOTsLgYhbQC
   2PzHyndAg+jaLw5Rn4+UuzsJI1BvlCYujnz/6hX13j+sCFOJ6pcXFMFbu
   YRICZ5yzzYNVvf0CWHWCnpKXMhIEgSckRdkjwddZ/64JPb3dCcSB9V43Z
   VoF6eGTRBDs0hp2c5M8WoLnPCcC0aPFyxQuzEiK+gguGH3u1+j36h+az/
   FrR4loPwwMfn3kuaEZ9R9FgnLaZ5wO0IfPCmOlbScrWsy0jfT2nBMr1dw
   TxMj30toerB4GzZbxCuqb+7ue1miWI5ELLPa4+i7i0KrXdazF9c1Ignyh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="401840505"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="401840505"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 17:00:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="851985436"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="851985436"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jan 2024 17:00:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN0Ta-0005He-1o;
	Tue, 09 Jan 2024 01:00:18 +0000
Date: Tue, 9 Jan 2024 08:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/gemini-dts-fixes 4/4]
 drivers/net/ethernet/cortina/gemini.c:307:7: error: call to undeclared
 function 'phy_interface_mode_is_gmii'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202401090803.oWQeHFBf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/gemini-dts-fixes
head:   9ed4f78490d5bf141db56aa5f30a86e83798a419
commit: 9ed4f78490d5bf141db56aa5f30a86e83798a419 [4/4] net: cortina: Support MII and GMII properly
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240109/202401090803.oWQeHFBf-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401090803.oWQeHFBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401090803.oWQeHFBf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/cortina/gemini.c:307:7: error: call to undeclared function 'phy_interface_mode_is_gmii'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |                 if (phy_interface_mode_is_gmii(phydev->interface)) {
         |                     ^
   drivers/net/ethernet/cortina/gemini.c:307:7: note: did you mean 'phy_interface_mode_is_rgmii'?
   include/linux/phy.h:1609:20: note: 'phy_interface_mode_is_rgmii' declared here
    1609 | static inline bool phy_interface_mode_is_rgmii(phy_interface_t mode)
         |                    ^
>> drivers/net/ethernet/cortina/gemini.c:320:7: error: call to undeclared function 'phy_interface_mode_is_mii'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     320 |                 if (phy_interface_mode_is_mii(phydev->interface)) {
         |                     ^
   2 errors generated.


vim +/phy_interface_mode_is_gmii +307 drivers/net/ethernet/cortina/gemini.c

   290	
   291	static void gmac_speed_set(struct net_device *netdev)
   292	{
   293		struct gemini_ethernet_port *port = netdev_priv(netdev);
   294		struct phy_device *phydev = netdev->phydev;
   295		union gmac_status status, old_status;
   296		int pause_tx = 0;
   297		int pause_rx = 0;
   298	
   299		status.bits32 = readl(port->gmac_base + GMAC_STATUS);
   300		old_status.bits32 = status.bits32;
   301		status.bits.link = phydev->link;
   302		status.bits.duplex = phydev->duplex;
   303	
   304		switch (phydev->speed) {
   305		case 1000:
   306			status.bits.speed = GMAC_SPEED_1000;
 > 307			if (phy_interface_mode_is_gmii(phydev->interface)) {
   308				status.bits.mii_rmii = GMAC_PHY_GMII;
   309				netdev_dbg(netdev, "connect %s to GMII @ 1Gbit\n",
   310					   phydev_name(phydev));
   311			}
   312			if (phy_interface_mode_is_rgmii(phydev->interface)) {
   313				status.bits.mii_rmii = GMAC_PHY_RGMII_1000;
   314				netdev_dbg(netdev, "connect %s to RGMII @ 1Gbit\n",
   315					   phydev_name(phydev));
   316			}
   317			break;
   318		case 100:
   319			status.bits.speed = GMAC_SPEED_100;
 > 320			if (phy_interface_mode_is_mii(phydev->interface)) {
   321				status.bits.mii_rmii = GMAC_PHY_MII;
   322				netdev_dbg(netdev, "connect %s to MII @ 100 Mbit\n",
   323					   phydev_name(phydev));
   324			}
   325			if (phy_interface_mode_is_gmii(phydev->interface)) {
   326				status.bits.mii_rmii = GMAC_PHY_GMII;
   327				netdev_dbg(netdev, "connect %s to GMII @ 100 Mbit\n",
   328					   phydev_name(phydev));
   329			}
   330			if (phy_interface_mode_is_rgmii(phydev->interface)) {
   331				status.bits.mii_rmii = GMAC_PHY_RGMII_100_10;
   332				netdev_dbg(netdev, "connect %s to RGMII @ 100 Mbit\n",
   333					   phydev_name(phydev));
   334			}
   335			break;
   336		case 10:
   337			status.bits.speed = GMAC_SPEED_10;
   338			if (phy_interface_mode_is_mii(phydev->interface)) {
   339				status.bits.mii_rmii = GMAC_PHY_MII;
   340				netdev_dbg(netdev, "connect %s to MII @ 10 Mbit\n",
   341					   phydev_name(phydev));
   342			}
   343			if (phy_interface_mode_is_gmii(phydev->interface)) {
   344				status.bits.mii_rmii = GMAC_PHY_GMII;
   345				netdev_dbg(netdev, "connect %s to GMII @ 10 Mbit\n",
   346					   phydev_name(phydev));
   347			}
   348			if (phy_interface_mode_is_rgmii(phydev->interface)) {
   349				status.bits.mii_rmii = GMAC_PHY_RGMII_100_10;
   350				netdev_dbg(netdev, "connect %s to RGMII @ 10 Mbit\n",
   351					   phydev_name(phydev));
   352			}
   353			break;
   354		default:
   355			netdev_warn(netdev, "Unsupported PHY speed (%d) on %s\n",
   356				    phydev->speed, phydev_name(phydev));
   357		}
   358	
   359		if (phydev->duplex == DUPLEX_FULL) {
   360			u16 lcladv = phy_read(phydev, MII_ADVERTISE);
   361			u16 rmtadv = phy_read(phydev, MII_LPA);
   362			u8 cap = mii_resolve_flowctrl_fdx(lcladv, rmtadv);
   363	
   364			if (cap & FLOW_CTRL_RX)
   365				pause_rx = 1;
   366			if (cap & FLOW_CTRL_TX)
   367				pause_tx = 1;
   368		}
   369	
   370		gmac_set_flow_control(netdev, pause_tx, pause_rx);
   371	
   372		if (old_status.bits32 == status.bits32)
   373			return;
   374	
   375		if (netif_msg_link(port)) {
   376			phy_print_status(phydev);
   377			netdev_info(netdev, "link flow control: %s\n",
   378				    phydev->pause
   379				    ? (phydev->asym_pause ? "tx" : "both")
   380				    : (phydev->asym_pause ? "rx" : "none")
   381			);
   382		}
   383	
   384		gmac_disable_tx_rx(netdev);
   385		writel(status.bits32, port->gmac_base + GMAC_STATUS);
   386		gmac_enable_tx_rx(netdev);
   387	}
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
