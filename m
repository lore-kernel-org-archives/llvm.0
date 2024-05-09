Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CA68F44;
	Thu,  9 May 2024 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715274199; cv=none; b=AYAF0Yx7S8gqp6+FAH4o24ruQd8Js2KTEq3fqFUekFHgPac30Eyx/GI6Ui/PYqWt477jh8To+Llc8PPk4tDTJotncOmhMSvDoGaqbNaA8l85jQvVPiNzaaiorj0CMrlYbZjBf9NdGg11OawutZEzmmfmW7D9ebSnvjnkqYtq+j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715274199; c=relaxed/simple;
	bh=XKnFrmOvBHMUSmt6yDi9tl1NimJNftuWwlXHHTDiT74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q3RvPqNr4g4lTpRY+SRnoLBFkA77cYLHKzwK5QA5vGQdpaBPRv/ipaznjUcMJYOrckWfglByoqeZsNkOEWippfxoEG48GxoJn4Pu8VzilNj3PLxuc+HM0R3U3etAg5gVNlC9/JhogCDw/C2weZ0bLRG4TMeXJiNzBFLce5C77H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSwMhovx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSwMhovx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715274196; x=1746810196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKnFrmOvBHMUSmt6yDi9tl1NimJNftuWwlXHHTDiT74=;
  b=CSwMhovxNyPjxgfnpQPmYkLh1rQW+uwvEkEGPeD9Qab19Y4d4P8X569r
   rpy4US0P/iOTrO0vKpvh8urv/PWxk3btbJo96Rtlgd4OwMnJlN7Ig1tBi
   c+rsEy2Vg0tJCcYC+o73PoE5njwH81r7KUmsLz6QfpMQ08cwsov1Ghk4a
   C6XW/jaXeruZRJxeOa4nPqfY0yil0fhshYpqgrH1mREiN2K3TLFlNx7mK
   FOzPVD0BFUVcKUeAUyTQzr1bWrPR6yesjt0NL5VLz9mb0MEBJDvezT91z
   8rUoOt6gVwtJuqxmc5oCnr80WKNLGPHLl04+Ku8BGHs+LpQ4PPGeuHEIT
   A==;
X-CSE-ConnectionGUID: vQ4JGsneRg6UnAeqmwoisg==
X-CSE-MsgGUID: Zapa0/1sS9qVS6MP5O+T7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11047015"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11047015"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 10:03:16 -0700
X-CSE-ConnectionGUID: kUevydSITVmisfBJM00EpA==
X-CSE-MsgGUID: Woj5fF12QTud/d74RL7VdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="29867349"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 May 2024 10:03:14 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s57Al-00059r-1g;
	Thu, 09 May 2024 17:03:11 +0000
Date: Fri, 10 May 2024 01:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 91/102] drivers/net/dsa/b53/b53_common.c:1480:1: error:
 function definition is not allowed here
Message-ID: <202405100138.673EFBg7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   e9436a5c3f1e8dc9d425f51b98e96e185a20704d
commit: 7e7e7c670675ac436d82b2c0ab183ba0b6c65a21 [91/102] net: use phylink_mode_*() helpers
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240510/202405100138.673EFBg7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100138.673EFBg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100138.673EFBg7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/b53/b53_common.c:1452:23: error: incompatible pointer types initializing 'struct ethtool_keee *' with an expression of type 'struct ethtool_eee *' [-Werror,-Wincompatible-pointer-types]
           struct ethtool_keee *p = &dev->ports[dp->index].eee;
                                ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1457:4: error: incomplete definition of type 'struct ethtool_keee'
                   p->eee_enabled = b53_eee_init(ds, port, phydev);
                   ~^
   drivers/net/dsa/b53/b53_common.c:1452:9: note: forward declaration of 'struct ethtool_keee'
           struct ethtool_keee *p = &dev->ports[dp->index].eee;
                  ^
>> drivers/net/dsa/b53/b53_common.c:1480:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1491:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1516:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1555:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1587:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1605:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1628:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1669:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1745:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1766:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1779:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1799:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1812:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1824:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1868:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1889:1: error: function definition is not allowed here
   {
   ^
   drivers/net/dsa/b53/b53_common.c:1905:1: error: function definition is not allowed here
   {
   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +1480 drivers/net/dsa/b53/b53_common.c

a8e8b98531369c Florian Fainelli      2018-09-05  1441  
630f81edcbf1a8 Florian Fainelli      2024-05-05  1442  static void b53_phylink_mac_link_up(struct phylink_config *config,
630f81edcbf1a8 Florian Fainelli      2024-05-05  1443  				    struct phy_device *phydev,
a8e8b98531369c Florian Fainelli      2018-09-05  1444  				    unsigned int mode,
a8e8b98531369c Florian Fainelli      2018-09-05  1445  				    phy_interface_t interface,
5b502a7b299200 Russell King          2020-02-26  1446  				    int speed, int duplex,
5b502a7b299200 Russell King          2020-02-26  1447  				    bool tx_pause, bool rx_pause)
a8e8b98531369c Florian Fainelli      2018-09-05  1448  {
630f81edcbf1a8 Florian Fainelli      2024-05-05  1449  	struct dsa_port *dp = dsa_phylink_to_port(config);
630f81edcbf1a8 Florian Fainelli      2024-05-05  1450  	struct dsa_switch *ds = dp->ds;
a8e8b98531369c Florian Fainelli      2018-09-05  1451  	struct b53_device *dev = ds->priv;
630f81edcbf1a8 Florian Fainelli      2024-05-05 @1452  	struct ethtool_keee *p = &dev->ports[dp->index].eee;
630f81edcbf1a8 Florian Fainelli      2024-05-05  1453  	int port = dp->index;
a8e8b98531369c Florian Fainelli      2018-09-05  1454  
7e7e7c670675ac Russell King (Oracle  2021-11-27  1455) 	if (phylink_mode_phy(mode)) {
7e189be0111c72 Florian Fainelli      2024-05-05  1456  		/* Re-negotiate EEE if it was enabled already */
7e189be0111c72 Florian Fainelli      2024-05-05  1457  		p->eee_enabled = b53_eee_init(ds, port, phydev);
a8e8b98531369c Florian Fainelli      2018-09-05  1458  		return;
7e189be0111c72 Florian Fainelli      2024-05-05  1459  	}
a8e8b98531369c Florian Fainelli      2018-09-05  1460  
7e7e7c670675ac Russell King (Oracle  2021-11-27  1461) 	if (phylink_mode_fixed(mode)) {
a8e8b98531369c Florian Fainelli      2018-09-05  1462  	if (mode == MLO_AN_FIXED) {
a6b9753fcb98a6 Florian Fainelli      2024-05-05  1463  		/* Force flow control on BCM5301x's CPU port */
a6b9753fcb98a6 Florian Fainelli      2024-05-05  1464  		if (is5301x(dev) && dsa_is_cpu_port(ds, port))
a6b9753fcb98a6 Florian Fainelli      2024-05-05  1465  			tx_pause = rx_pause = true;
a6b9753fcb98a6 Florian Fainelli      2024-05-05  1466  
ab017b7921d324 Russell King          2020-06-30  1467  		b53_force_port_config(dev, port, speed, duplex,
ab017b7921d324 Russell King          2020-06-30  1468  				      tx_pause, rx_pause);
a8e8b98531369c Florian Fainelli      2018-09-05  1469  		b53_force_link(dev, port, true);
a8e8b98531369c Florian Fainelli      2018-09-05  1470  		return;
a8e8b98531369c Florian Fainelli      2018-09-05  1471  	}
0e01491de64600 Florian Fainelli      2018-09-05  1472  
0e01491de64600 Florian Fainelli      2018-09-05  1473  	if (phy_interface_mode_is_8023z(interface) &&
0e01491de64600 Florian Fainelli      2018-09-05  1474  	    dev->ops->serdes_link_set)
0e01491de64600 Florian Fainelli      2018-09-05  1475  		dev->ops->serdes_link_set(dev, port, mode, interface, true);
a8e8b98531369c Florian Fainelli      2018-09-05  1476  }
a8e8b98531369c Florian Fainelli      2018-09-05  1477  
89153ed6ebc148 Vladimir Oltean       2021-02-13  1478  int b53_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
89153ed6ebc148 Vladimir Oltean       2021-02-13  1479  		       struct netlink_ext_ack *extack)
a2482d2ce34986 Florian Fainelli      2016-06-09 @1480  {
dad8d7c6452b5b Florian Fainelli      2019-02-15  1481  	struct b53_device *dev = ds->priv;
dad8d7c6452b5b Florian Fainelli      2019-02-15  1482  
ee47ed08d75e8f Florian Fainelli      2021-03-10  1483  	b53_enable_vlan(dev, port, dev->vlan_enabled, vlan_filtering);
dad8d7c6452b5b Florian Fainelli      2019-02-15  1484  
a2482d2ce34986 Florian Fainelli      2016-06-09  1485  	return 0;
a2482d2ce34986 Florian Fainelli      2016-06-09  1486  }
3117455dd6c16d Florian Fainelli      2017-01-08  1487  EXPORT_SYMBOL(b53_vlan_filtering);
a2482d2ce34986 Florian Fainelli      2016-06-09  1488  

:::::: The code at line 1480 was first introduced by commit
:::::: a2482d2ce3498642d180b9d7453d0d9c7452cb29 net: dsa: b53: Plug in VLAN support

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
