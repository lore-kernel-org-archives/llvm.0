Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CAB621
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 03:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649476257; x=1681012257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PBXZsxK87a6dP09C4DQ41BtR+l7G7Nbk9izahg+27y0=;
  b=gNGKMzIvfXnoneBMxsGaFVKLzFBH6YTsUeUZQ2vu51gWM0wlRK8uWLRj
   vJ5kz1m2qDfcqHhIE4lzvTf7YqOu0rhf9aYRJu3ncS4rMc8ax/QadxaN3
   dFppeTKB5sKDs63w9ozKvaKvrLqGLdz8tvytFJ4oLFNIc8o+IOI0Ko7FR
   g/N/vkQtruCX4MdvcDE7vSkZjszTOTHZ5AvodwNdvkOFjOdMjTXMmqtch
   SPxPTUxsUQ5nbtTN2+yVQIIZ7WZhI+IGMmms2qND4AJYlBCVcO/n9Qtxm
   1Y4L4fLOHipoBr1COg4QsFZYYBi51XKWBqRhdpA8foro82q8/CmSfk80i
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="348190753"
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; 
   d="scan'208";a="348190753"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 20:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; 
   d="scan'208";a="643198573"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Apr 2022 20:50:55 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nd27i-0000qv-Hz;
	Sat, 09 Apr 2022 03:50:54 +0000
Date: Sat, 9 Apr 2022 11:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 52/146]
 drivers/net/ethernet/microchip/lan966x/lan966x_main.c:631:2: error: implicit
 declaration of function 'phylink_set_pcs'
Message-ID: <202204091108.I5KIZfNV-lkp@intel.com>
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
head:   9b613822d82aaff62445bab79522b8675612d979
commit: 540ce47af588dbabf68f7f50d0b459c70df811c2 [52/146] net: phylink: remove phylink_set_pcs()
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220409/202204091108.I5KIZfNV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm zii
        git checkout 540ce47af588dbabf68f7f50d0b459c70df811c2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/microchip/lan966x/lan966x_main.c:631:2: error: implicit declaration of function 'phylink_set_pcs' [-Werror,-Wimplicit-function-declaration]
           phylink_set_pcs(phylink, &port->phylink_pcs);
           ^
   drivers/net/ethernet/microchip/lan966x/lan966x_main.c:631:2: note: did you mean 'phylink_stop'?
   include/linux/phylink.h:547:6: note: 'phylink_stop' declared here
   void phylink_stop(struct phylink *);
        ^
   1 error generated.


vim +/phylink_set_pcs +631 drivers/net/ethernet/microchip/lan966x/lan966x_main.c

d28d6d2e37d10d Horatiu Vultur 2021-11-29  562  
db8bcaad539314 Horatiu Vultur 2021-11-29  563  static int lan966x_probe_port(struct lan966x *lan966x, u32 p,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  564  			      phy_interface_t phy_mode,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  565  			      struct fwnode_handle *portnp)
db8bcaad539314 Horatiu Vultur 2021-11-29  566  {
db8bcaad539314 Horatiu Vultur 2021-11-29  567  	struct lan966x_port *port;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  568  	struct phylink *phylink;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  569  	struct net_device *dev;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  570  	int err;
db8bcaad539314 Horatiu Vultur 2021-11-29  571  
db8bcaad539314 Horatiu Vultur 2021-11-29  572  	if (p >= lan966x->num_phys_ports)
db8bcaad539314 Horatiu Vultur 2021-11-29  573  		return -EINVAL;
db8bcaad539314 Horatiu Vultur 2021-11-29  574  
d28d6d2e37d10d Horatiu Vultur 2021-11-29  575  	dev = devm_alloc_etherdev_mqs(lan966x->dev,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  576  				      sizeof(struct lan966x_port), 8, 1);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  577  	if (!dev)
db8bcaad539314 Horatiu Vultur 2021-11-29  578  		return -ENOMEM;
db8bcaad539314 Horatiu Vultur 2021-11-29  579  
d28d6d2e37d10d Horatiu Vultur 2021-11-29  580  	SET_NETDEV_DEV(dev, lan966x->dev);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  581  	port = netdev_priv(dev);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  582  	port->dev = dev;
db8bcaad539314 Horatiu Vultur 2021-11-29  583  	port->lan966x = lan966x;
db8bcaad539314 Horatiu Vultur 2021-11-29  584  	port->chip_port = p;
db8bcaad539314 Horatiu Vultur 2021-11-29  585  	lan966x->ports[p] = port;
db8bcaad539314 Horatiu Vultur 2021-11-29  586  
d28d6d2e37d10d Horatiu Vultur 2021-11-29  587  	dev->max_mtu = ETH_MAX_MTU;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  588  
d28d6d2e37d10d Horatiu Vultur 2021-11-29  589  	dev->netdev_ops = &lan966x_port_netdev_ops;
12c2d0a5b8e2a1 Horatiu Vultur 2021-11-29  590  	dev->ethtool_ops = &lan966x_ethtool_ops;
6d2c186afa5d5d Horatiu Vultur 2021-12-18  591  	dev->features |= NETIF_F_HW_VLAN_CTAG_TX |
6d2c186afa5d5d Horatiu Vultur 2021-12-18  592  			 NETIF_F_HW_VLAN_STAG_TX;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  593  	dev->needed_headroom = IFH_LEN * sizeof(u32);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  594  
e18aba8941b40b Horatiu Vultur 2021-11-29  595  	eth_hw_addr_gen(dev, lan966x->base_mac, p + 1);
e18aba8941b40b Horatiu Vultur 2021-11-29  596  
0c94d657d2a416 Horatiu Vultur 2021-12-23  597  	lan966x_mac_learn(lan966x, PGID_CPU, dev->dev_addr, HOST_PVID,
e18aba8941b40b Horatiu Vultur 2021-11-29  598  			  ENTRYTYPE_LOCKED);
e18aba8941b40b Horatiu Vultur 2021-11-29  599  
d28d6d2e37d10d Horatiu Vultur 2021-11-29  600  	port->phylink_config.dev = &port->dev->dev;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  601  	port->phylink_config.type = PHYLINK_NETDEV;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  602  	port->phylink_pcs.poll = true;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  603  	port->phylink_pcs.ops = &lan966x_phylink_pcs_ops;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  604  
d28d6d2e37d10d Horatiu Vultur 2021-11-29  605  	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
d28d6d2e37d10d Horatiu Vultur 2021-11-29  606  		MAC_10 | MAC_100 | MAC_1000FD | MAC_2500FD;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  607  
d28d6d2e37d10d Horatiu Vultur 2021-11-29  608  	__set_bit(PHY_INTERFACE_MODE_MII,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  609  		  port->phylink_config.supported_interfaces);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  610  	__set_bit(PHY_INTERFACE_MODE_GMII,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  611  		  port->phylink_config.supported_interfaces);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  612  	__set_bit(PHY_INTERFACE_MODE_SGMII,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  613  		  port->phylink_config.supported_interfaces);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  614  	__set_bit(PHY_INTERFACE_MODE_QSGMII,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  615  		  port->phylink_config.supported_interfaces);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  616  	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  617  		  port->phylink_config.supported_interfaces);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  618  	__set_bit(PHY_INTERFACE_MODE_2500BASEX,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  619  		  port->phylink_config.supported_interfaces);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  620  
d28d6d2e37d10d Horatiu Vultur 2021-11-29  621  	phylink = phylink_create(&port->phylink_config,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  622  				 portnp,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  623  				 phy_mode,
d28d6d2e37d10d Horatiu Vultur 2021-11-29  624  				 &lan966x_phylink_mac_ops);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  625  	if (IS_ERR(phylink)) {
d28d6d2e37d10d Horatiu Vultur 2021-11-29  626  		port->dev = NULL;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  627  		return PTR_ERR(phylink);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  628  	}
d28d6d2e37d10d Horatiu Vultur 2021-11-29  629  
d28d6d2e37d10d Horatiu Vultur 2021-11-29  630  	port->phylink = phylink;
d28d6d2e37d10d Horatiu Vultur 2021-11-29 @631  	phylink_set_pcs(phylink, &port->phylink_pcs);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  632  
d28d6d2e37d10d Horatiu Vultur 2021-11-29  633  	err = register_netdev(dev);
d28d6d2e37d10d Horatiu Vultur 2021-11-29  634  	if (err) {
d28d6d2e37d10d Horatiu Vultur 2021-11-29  635  		dev_err(lan966x->dev, "register_netdev failed\n");
d28d6d2e37d10d Horatiu Vultur 2021-11-29  636  		return err;
d28d6d2e37d10d Horatiu Vultur 2021-11-29  637  	}
d28d6d2e37d10d Horatiu Vultur 2021-11-29  638  
6d2c186afa5d5d Horatiu Vultur 2021-12-18  639  	lan966x_vlan_port_set_vlan_aware(port, 0);
6d2c186afa5d5d Horatiu Vultur 2021-12-18  640  	lan966x_vlan_port_set_vid(port, HOST_PVID, false, false);
6d2c186afa5d5d Horatiu Vultur 2021-12-18  641  	lan966x_vlan_port_apply(port);
6d2c186afa5d5d Horatiu Vultur 2021-12-18  642  
db8bcaad539314 Horatiu Vultur 2021-11-29  643  	return 0;
db8bcaad539314 Horatiu Vultur 2021-11-29  644  }
db8bcaad539314 Horatiu Vultur 2021-11-29  645  

:::::: The code at line 631 was first introduced by commit
:::::: d28d6d2e37d10d607f931d25c835a0bd94d370e3 net: lan966x: add port module support

:::::: TO: Horatiu Vultur <horatiu.vultur@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
