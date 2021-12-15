Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254D7173
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 09:45:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="239410897"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="239410897"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 01:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="614644688"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Dec 2021 01:45:55 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxQrC-0001Z3-UA; Wed, 15 Dec 2021 09:45:54 +0000
Date: Wed, 15 Dec 2021 17:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 119/186] drivers/net/dsa/mt7530.c:2707:27: error: no member
 named 'phylink_pcs' in 'struct mt753x_pcs'
Message-ID: <202112151746.9DgbKRad-lkp@intel.com>
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
head:   d3ebd79d7fb6476e2409c147e4dcc304733f7ae6
commit: 76c8c505247c567d0883b44bab8b678bc9238bfb [119/186] net: dsa: mt7530: partially convert to phylink_pcs  *EXPERIMENTAL*
config: x86_64-randconfig-r016-20211214 (https://download.01.org/0day-ci/archive/20211215/202112151746.9DgbKRad-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm zii
        git checkout 76c8c505247c567d0883b44bab8b678bc9238bfb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/dsa/mt7530.c:2707:27: error: no member named 'phylink_pcs' in 'struct mt753x_pcs'
                   return &priv->pcs[port].phylink_pcs;
                           ~~~~~~~~~~~~~~~ ^
   drivers/net/dsa/mt7530.c:2882:46: error: no member named 'phylink_pcs' in 'struct mt753x_pcs'
           mt753x_phylink_pcs_link_up(&priv->pcs[port].phylink_pcs, MLO_AN_FIXED,
                                       ~~~~~~~~~~~~~~~ ^
   drivers/net/dsa/mt7530.c:3026:18: error: incompatible function pointer types initializing 'int (*)(struct phylink_pcs *, unsigned long *, const struct phylink_link_state *)' with an expression of type 'void (struct phylink_pcs *, unsigned long *, const struct phylink_link_state *)' [-Werror,-Wincompatible-function-pointer-types]
           .pcs_validate = mt753x_pcs_validate,
                           ^~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mt7530.c:3033:18: error: incompatible function pointer types initializing 'int (*)(struct phylink_pcs *, unsigned long *, const struct phylink_link_state *)' with an expression of type 'void (struct phylink_pcs *, unsigned long *, const struct phylink_link_state *)' [-Werror,-Wincompatible-function-pointer-types]
           .pcs_validate = mt753x_pcs_validate,
                           ^~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mt7530.c:3060:19: error: member reference type 'struct phylink_pcs *' is a pointer; did you mean to use '->'?
                   priv->pcs[i].pcs.ops = priv->pcs_ops;
                   ~~~~~~~~~~~~~~~~^
                                   ->
>> drivers/net/dsa/mt7530.c:3060:32: error: no member named 'pcs_ops' in 'struct mt7530_priv'
                   priv->pcs[i].pcs.ops = priv->pcs_ops;
                                          ~~~~  ^
   6 errors generated.


vim +2707 drivers/net/dsa/mt7530.c

  2695	
  2696	static struct phylink_pcs *
  2697	mt753x_phylink_mac_select_pcs(struct dsa_switch *ds, int port,
  2698				      phy_interface_t interface)
  2699	{
  2700		struct mt7530_priv *priv = ds->priv;
  2701	
  2702		switch (interface) {
  2703		case PHY_INTERFACE_MODE_TRGMII:
  2704		case PHY_INTERFACE_MODE_SGMII:
  2705		case PHY_INTERFACE_MODE_1000BASEX:
  2706		case PHY_INTERFACE_MODE_2500BASEX:
> 2707			return &priv->pcs[port].phylink_pcs;
  2708	
  2709		default:
  2710			return NULL;
  2711		}
  2712	}
  2713	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
