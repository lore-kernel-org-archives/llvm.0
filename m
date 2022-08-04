Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC767C
	for <llvm@lists.linux.dev>; Thu,  4 Aug 2022 00:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659572134; x=1691108134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l7WZXdv2XrPnPHDwU04lAWjh1cZdwXb0E2z3t3ATqqA=;
  b=mlq255yU8w1bRHwmTIQZRt5/TNp5KKtU+glbBc/4NI4IspIsX8ggdP+Z
   W2cmZVHHBwMmRjCOPTNXVcOZNguMWbpbe2PoYbQzy6J/t6b/NILQzCyU4
   8fuI1zRnHXsoKefNPno5A+Sj/XM3ylUZ+Sv9WMAfpwy/NLgiDjOUpPdyH
   purZmhgFjGfIicBSI8noKFVuInfjR9M6CCIySDEG15GY5mCvObBAhRtTl
   K4OfkiWFdcaGrCwNJhv7kY9Sl+PMzF6NATmO54myzmuQdKjhI1Kji73e2
   tIMBB3udHQzcMD0zK3NNxAXbnrVQ8E+V14Kn1JXdmyfQghXQBQN1Q9vAN
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="288561989"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="288561989"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 17:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="553514327"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Aug 2022 17:15:29 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJOWO-000Hoe-2t;
	Thu, 04 Aug 2022 00:15:28 +0000
Date: Thu, 4 Aug 2022 08:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: [rmk-arm:zii 15/87] drivers/net/dsa/microchip/ksz9477.c:1334:22:
 error: incompatible function pointer types initializing 'void (*)(struct
 dsa_switch *, int, struct phylink_config *, phy_interface_t *)' with an
 expression of type 'void (struct dsa_switch *, int, struct phylin...
Message-ID: <202208040812.1vQa7ayZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm zii
head:   315d00812d1f8ed8bbbce4e4fd8d32fc883900a0
commit: 8ed5becb72c09d9835bedc0bdaf431cc23f8b7de [15/87] net: dsa: add support for retrieving the interface mode
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220804/202208040812.1vQa7ayZ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 495519e5f8232d144ed26e9c18dbcbac6a5f25eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm zii
        git checkout 8ed5becb72c09d9835bedc0bdaf431cc23f8b7de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/dsa/microchip/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/dsa/microchip/ksz9477.c:1334:22: error: incompatible function pointer types initializing 'void (*)(struct dsa_switch *, int, struct phylink_config *, phy_interface_t *)' with an expression of type 'void (struct dsa_switch *, int, struct phylink_config *)' [-Werror,-Wincompatible-function-pointer-types]
           .phylink_get_caps       = ksz9477_get_caps,
                                     ^~~~~~~~~~~~~~~~
   1 error generated.


vim +1334 drivers/net/dsa/microchip/ksz9477.c

c2e866911e2540 Tristram Ha       2018-11-20  1327  
c2e866911e2540 Tristram Ha       2018-11-20  1328  static const struct dsa_switch_ops ksz9477_switch_ops = {
c2e866911e2540 Tristram Ha       2018-11-20  1329  	.get_tag_protocol	= ksz9477_get_tag_protocol,
c2e866911e2540 Tristram Ha       2018-11-20  1330  	.setup			= ksz9477_setup,
c2e866911e2540 Tristram Ha       2018-11-20  1331  	.phy_read		= ksz9477_phy_read16,
c2e866911e2540 Tristram Ha       2018-11-20  1332  	.phy_write		= ksz9477_phy_write16,
143a102e309053 Codrin Ciubotariu 2020-07-02  1333  	.phylink_mac_link_down	= ksz_mac_link_down,
65ac79e1812016 Arun Ramadoss     2022-05-17 @1334  	.phylink_get_caps	= ksz9477_get_caps,
c2e866911e2540 Tristram Ha       2018-11-20  1335  	.port_enable		= ksz_enable_port,
997d2126ac6112 Arun Ramadoss     2022-05-17  1336  	.get_strings		= ksz_get_strings,
c2e866911e2540 Tristram Ha       2018-11-20  1337  	.get_ethtool_stats	= ksz_get_ethtool_stats,
c2e866911e2540 Tristram Ha       2018-11-20  1338  	.get_sset_count		= ksz_sset_count,
c2e866911e2540 Tristram Ha       2018-11-20  1339  	.port_bridge_join	= ksz_port_bridge_join,
c2e866911e2540 Tristram Ha       2018-11-20  1340  	.port_bridge_leave	= ksz_port_bridge_leave,
c2e866911e2540 Tristram Ha       2018-11-20  1341  	.port_stp_state_set	= ksz9477_port_stp_state_set,
c2e866911e2540 Tristram Ha       2018-11-20  1342  	.port_fast_age		= ksz_port_fast_age,
c2e866911e2540 Tristram Ha       2018-11-20  1343  	.port_vlan_filtering	= ksz9477_port_vlan_filtering,
c2e866911e2540 Tristram Ha       2018-11-20  1344  	.port_vlan_add		= ksz9477_port_vlan_add,
c2e866911e2540 Tristram Ha       2018-11-20  1345  	.port_vlan_del		= ksz9477_port_vlan_del,
c2e866911e2540 Tristram Ha       2018-11-20  1346  	.port_fdb_dump		= ksz9477_port_fdb_dump,
c2e866911e2540 Tristram Ha       2018-11-20  1347  	.port_fdb_add		= ksz9477_port_fdb_add,
c2e866911e2540 Tristram Ha       2018-11-20  1348  	.port_fdb_del		= ksz9477_port_fdb_del,
c2e866911e2540 Tristram Ha       2018-11-20  1349  	.port_mdb_add           = ksz9477_port_mdb_add,
c2e866911e2540 Tristram Ha       2018-11-20  1350  	.port_mdb_del           = ksz9477_port_mdb_del,
c2e866911e2540 Tristram Ha       2018-11-20  1351  	.port_mirror_add	= ksz9477_port_mirror_add,
c2e866911e2540 Tristram Ha       2018-11-20  1352  	.port_mirror_del	= ksz9477_port_mirror_del,
c6101dd7ffb8b7 Arun Ramadoss     2022-04-26  1353  	.get_stats64		= ksz_get_stats64,
e18058ea998603 Oleksij Rempel    2022-03-08  1354  	.port_change_mtu	= ksz9477_change_mtu,
e18058ea998603 Oleksij Rempel    2022-03-08  1355  	.port_max_mtu		= ksz9477_max_mtu,
c2e866911e2540 Tristram Ha       2018-11-20  1356  };
c2e866911e2540 Tristram Ha       2018-11-20  1357  

:::::: The code at line 1334 was first introduced by commit
:::::: 65ac79e1812016d7c5760872736802f985ec7455 net: dsa: microchip: add the phylink get_caps

:::::: TO: Arun Ramadoss <arun.ramadoss@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
