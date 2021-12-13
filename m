Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33009173
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 04:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639371339; x=1670907339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Jj4LHnxYVAotFxoF9mkBEj/DMroH+iLGee9/NEZDB0=;
  b=ifdWT9PlFpO2VsKJLvNhiNdcO/89R4dU9T/6WNnT9WB4Gpq/gnSpOAfH
   TFK4HJy8BlRUMASHwLu2Ja1F9BDMhxnwo7wMvPn82lEpobI5Qe8kLNPTb
   QLyrq8hjo+61LbP8bwUPrgSpOTHTQ7X3EZj5NMIDnWhVg/B30f5LEpPfr
   +lTNUeCepUb2IyDdt0KNOJN8h98LJpl0+7LBiKIRO1+ura2jcInk+2yLe
   JyeisI2CAfrMKSbJYXO+6MJTjj2R6gDnrjGsGkNlnbNxp39fVSBs/B3b/
   W40KctWtew7hU6Q+fOnCdZHcp1XAJqftcq0Z9otXGbLL7W99tPbrM+zXL
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="302044210"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; 
   d="scan'208";a="302044210"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2021 20:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; 
   d="scan'208";a="464488620"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2021 20:55:37 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwdNA-0006I8-Bm; Mon, 13 Dec 2021 04:55:36 +0000
Date: Mon, 13 Dec 2021 12:55:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 147/186]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1531:49: error:
 incompatible pointer types passing 'struct phylink_config *' to parameter of
 type 'struct phylink_pcs *'
Message-ID: <202112131233.tkpcN3nU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   bc8489278c9545054f74b2226d3e2c09ec4e05fe
commit: 7123048813642c4842fcf8e6f4ce6315926cc164 [147/186] net: axienet: convert to phylink_pcs
config: riscv-randconfig-c006-20211212 (https://download.01.org/0day-ci/archive/20211213/202112131233.tkpcN3nU-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm zii
        git checkout 7123048813642c4842fcf8e6f4ce6315926cc164
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/ethernet/xilinx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1523:33: error: use of undeclared identifier 'lp'
           phylink_mii_c22_pcs_an_restart(lp->pcs_phy);
                                          ^
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1531:49: error: incompatible pointer types passing 'struct phylink_config *' to parameter of type 'struct phylink_pcs *' [-Werror,-Wincompatible-pointer-types]
           struct net_device *ndev = pcs_to_axienet_local(pcs)->ndev;
                                                          ^~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1506:71: note: passing argument to parameter 'pcs' here
   static struct axienet_local *pcs_to_axienet_local(struct phylink_pcs *pcs)
                                                                         ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1532:53: error: incompatible pointer types passing 'struct phylink_config *' to parameter of type 'struct phylink_pcs *' [-Werror,-Wincompatible-pointer-types]
           struct mdio_device *pcs_phy = pcs_to_axienet_local(pcs)->pcs_phy;
                                                              ^~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1506:71: note: passing argument to parameter 'pcs' here
   static struct axienet_local *pcs_to_axienet_local(struct phylink_pcs *pcs)
                                                                         ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1537:8: error: use of undeclared identifier 'iface'
                               iface == PHY_INTERFACE_MODE_SGMII ?
                               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1554:16: error: incompatible function pointer types initializing 'int (*)(struct phylink_pcs *, unsigned int, phy_interface_t, const unsigned long *, bool)' (aka 'int (*)(struct phylink_pcs *, unsigned int, phy_interface_t, const unsigned long *, _Bool)') with an expression of type 'int (struct phylink_config *, unsigned int, phy_interface_t, const unsigned long *, bool)' (aka 'int (struct phylink_config *, unsigned int, phy_interface_t, const unsigned long *, _Bool)') [-Werror,-Wincompatible-function-pointer-types]
           .pcs_config = axienet_pcs_config,
                         ^~~~~~~~~~~~~~~~~~
   5 errors generated.


vim +1531 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

  1525	
  1526	static int axienet_pcs_config(struct phylink_config *pcs, unsigned int mode,
  1527				      phy_interface_t interface,
  1528				      const unsigned long *advertising,
  1529				      bool permit_pause_to_mac)
  1530	{
> 1531		struct net_device *ndev = pcs_to_axienet_local(pcs)->ndev;
  1532		struct mdio_device *pcs_phy = pcs_to_axienet_local(pcs)->pcs_phy;
  1533		int ret;
  1534	
  1535		ret = mdiobus_write(pcs_phy->bus, pcs_phy->addr,
  1536				    XLNX_MII_STD_SELECT_REG,
  1537				    iface == PHY_INTERFACE_MODE_SGMII ?
  1538					XLNX_MII_STD_SELECT_SGMII : 0);
  1539		if (ret < 0) {
  1540			netdev_warn(ndev, "Failed to switch PHY interface: %d\n",
  1541				    ret);
  1542			return ret;
  1543		}
  1544	
  1545		ret = phylink_mii_c22_pcs_config(pcs_phy, mode, interface, advertising);
  1546		if (ret < 0)
  1547			netdev_warn(ndev, "Failed to configure PCS: %d\n", ret);
  1548	
  1549		return ret;
  1550	}
  1551	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
