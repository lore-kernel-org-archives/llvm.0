Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B65DEA6;
	Mon, 20 Feb 2023 06:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676873349; x=1708409349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/8oRzrPUY1phs7n2X3M9t+1T5jLua6nfgrVqCjcl25Y=;
  b=N8n0wJG+xqJsIXMBBsxWTA9fOKJL8pdnJ/uVN8Y9Ke7l3uRZvAqgyNfH
   zu1W6FY/YV9CUfyNfk4ZETfsZqB83YlqObJvSV0SpuDUEFJWOJYFamLSz
   4k2G5Ka/QzvA5QiAG+JT5CIXimmRwXpZgdQT0BVideGs0lB2Szf5Kr24f
   JvjEz9i8YTspxfZy2SCY7FVTMQr1N6NTQmEvxGQC+VYsi5dAFE9ONNoeJ
   q2h7vmKhhUxCMNiBmZV9nKwHYKIdDeiNsLZ5qm2JkdXkM30nYOGUSCf05
   74uH5PCZh756OsWDEHHTxfyM1QWtGltA/PMDB0+qj3us0kEFCUP4Sxcy1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="359793439"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="359793439"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 22:09:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="916737578"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="916737578"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Feb 2023 22:09:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTzMG-000Dj2-2v;
	Mon, 20 Feb 2023 06:09:04 +0000
Date: Mon, 20 Feb 2023 14:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.2-rc7-net-next-ethtool-eee-v4 5/21] net/dsa/port.c:1675:17:
 error: incompatible function pointer types initializing 'void (*)(struct
 phylink_config *, struct phy_device *, unsigned int, phy_interface_t, int,
 int, bool, bool, bool)' (aka 'void (*)(struct phylink_config *, struct
 phy_device *...
Message-ID: <202302201452.w1LSLsTM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.2-rc7-net-next-ethtool-eee-v4
head:   77e826a1c4b7decf488d4966ae751195e3043a9d
commit: a544bb9b4c9c9576416b576a4ac00a9fda773a7d [5/21] net: phylink: Plumb eee_active in mac_link_up call
config: x86_64-randconfig-r011-20230220 (https://download.01.org/0day-ci/archive/20230220/202302201452.w1LSLsTM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/a544bb9b4c9c9576416b576a4ac00a9fda773a7d
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2-rc7-net-next-ethtool-eee-v4
        git checkout a544bb9b4c9c9576416b576a4ac00a9fda773a7d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/dsa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302201452.w1LSLsTM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/dsa/port.c:1665:43: error: too few arguments to function call, expected 10, have 9
                                        speed, duplex, tx_pause, rx_pause);
                                                                         ^
>> net/dsa/port.c:1675:17: error: incompatible function pointer types initializing 'void (*)(struct phylink_config *, struct phy_device *, unsigned int, phy_interface_t, int, int, bool, bool, bool)' (aka 'void (*)(struct phylink_config *, struct phy_device *, unsigned int, phy_interface_t, int, int, _Bool, _Bool, _Bool)') with an expression of type 'void (struct phylink_config *, struct phy_device *, unsigned int, phy_interface_t, int, int, bool, bool)' (aka 'void (struct phylink_config *, struct phy_device *, unsigned int, phy_interface_t, int, int, _Bool, _Bool)') [-Werror,-Wincompatible-function-pointer-types]
           .mac_link_up = dsa_port_phylink_mac_link_up,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +1675 net/dsa/port.c

77373d49de22e8 Ioana Ciornei         2019-05-28  1647  
8ae674964e67eb Florian Fainelli      2019-12-16  1648  static void dsa_port_phylink_mac_link_up(struct phylink_config *config,
91a208f2185ad4 Russell King          2020-02-26  1649  					 struct phy_device *phydev,
77373d49de22e8 Ioana Ciornei         2019-05-28  1650  					 unsigned int mode,
77373d49de22e8 Ioana Ciornei         2019-05-28  1651  					 phy_interface_t interface,
91a208f2185ad4 Russell King          2020-02-26  1652  					 int speed, int duplex,
91a208f2185ad4 Russell King          2020-02-26  1653  					 bool tx_pause, bool rx_pause)
77373d49de22e8 Ioana Ciornei         2019-05-28  1654  {
77373d49de22e8 Ioana Ciornei         2019-05-28  1655  	struct dsa_port *dp = container_of(config, struct dsa_port, pl_config);
77373d49de22e8 Ioana Ciornei         2019-05-28  1656  	struct dsa_switch *ds = dp->ds;
77373d49de22e8 Ioana Ciornei         2019-05-28  1657  
77373d49de22e8 Ioana Ciornei         2019-05-28  1658  	if (!ds->ops->phylink_mac_link_up) {
0e27921816ad99 Ioana Ciornei         2019-05-28  1659  		if (ds->ops->adjust_link && phydev)
0e27921816ad99 Ioana Ciornei         2019-05-28  1660  			ds->ops->adjust_link(ds, dp->index, phydev);
77373d49de22e8 Ioana Ciornei         2019-05-28  1661  		return;
77373d49de22e8 Ioana Ciornei         2019-05-28  1662  	}
77373d49de22e8 Ioana Ciornei         2019-05-28  1663  
5b502a7b299200 Russell King          2020-02-26  1664  	ds->ops->phylink_mac_link_up(ds, dp->index, mode, interface, phydev,
5b502a7b299200 Russell King          2020-02-26 @1665  				     speed, duplex, tx_pause, rx_pause);
77373d49de22e8 Ioana Ciornei         2019-05-28  1666  }
77373d49de22e8 Ioana Ciornei         2019-05-28  1667  
21bd64bd717ded Russell King (Oracle  2021-11-30  1668) static const struct phylink_mac_ops dsa_port_phylink_mac_ops = {
77373d49de22e8 Ioana Ciornei         2019-05-28  1669  	.validate = dsa_port_phylink_validate,
bde018222c6b08 Russell King (Oracle  2022-02-17  1670) 	.mac_select_pcs = dsa_port_phylink_mac_select_pcs,
d46b7e4fb06037 Russell King          2019-11-21  1671  	.mac_pcs_get_state = dsa_port_phylink_mac_pcs_get_state,
77373d49de22e8 Ioana Ciornei         2019-05-28  1672  	.mac_config = dsa_port_phylink_mac_config,
77373d49de22e8 Ioana Ciornei         2019-05-28  1673  	.mac_an_restart = dsa_port_phylink_mac_an_restart,
77373d49de22e8 Ioana Ciornei         2019-05-28  1674  	.mac_link_down = dsa_port_phylink_mac_link_down,
77373d49de22e8 Ioana Ciornei         2019-05-28 @1675  	.mac_link_up = dsa_port_phylink_mac_link_up,
77373d49de22e8 Ioana Ciornei         2019-05-28  1676  };
77373d49de22e8 Ioana Ciornei         2019-05-28  1677  

:::::: The code at line 1675 was first introduced by commit
:::::: 77373d49de22e836cf58ddbe7689d6b4b5046539 net: dsa: Move the phylink driver calls into port.c

:::::: TO: Ioana Ciornei <ioana.ciornei@nxp.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
