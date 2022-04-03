Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230C7186A
	for <llvm@lists.linux.dev>; Sun,  3 Apr 2022 01:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648948455; x=1680484455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vi4lWGBphbiq3mXQmN5cdScjROFXvEE9SMLUR5oGi20=;
  b=nKBQa14IAGYPMjwpxQRqN62eYlFr4ij0C4dl3M8T/eM8Vf5jwmVHNNSJ
   SKj/A4lwH8sdSIVXH3Xl+BXJv1lmciHgAqgQMauXPNJCaZwNSaoAOVRQ1
   3TyBGWh3f4z7Cb05AMr7OddAc5n+CBeqnOBcj3n5b8qpzNqrVFnU11Ffw
   SRvRNoomU+snKR0qPc+fCBiH+MNmJMcmKFkAYXUPUAwqdzOuE0dAoM7OL
   IJkQlpaAjN+IcieIMHcKcO68kQ5AsZ8KImv+8pwh/WGttifsIIn5NgQnA
   IVe8YZA8DKusTwZqoEqpAXS71mgHLBCW1xITB0EhQjVy9SJGw0kQaRZDo
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="260526093"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="260526093"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2022 18:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="522328655"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Apr 2022 18:14:12 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1naoom-0000bk-2n;
	Sun, 03 Apr 2022 01:14:12 +0000
Date: Sun, 3 Apr 2022 09:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [lunn:v5.17-rc8-mdio-c45 2/12] drivers/net/phy/phylink.c:2371:50:
 warning: variable 'prtad' is uninitialized when used here
Message-ID: <202204030904.n5cYsrRU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/lunn/linux.git v5.17-rc8-mdio-c45
head:   21ffc4381ec731f5e9521dec8925c0089b14920b
commit: 3e1cf3cbc07f3be863192a3cbdfe2b5f8cb14cd5 [2/12] net: phylink: Convert to mdiobus_c45_{read|write}
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220403/202204030904.n5cYsrRU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/3e1cf3cbc07f3be863192a3cbdfe2b5f8cb14cd5
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v5.17-rc8-mdio-c45
        git checkout 3e1cf3cbc07f3be863192a3cbdfe2b5f8cb14cd5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phylink.c:2371:50: warning: variable 'prtad' is uninitialized when used here [-Wuninitialized]
                   return mdiobus_c45_write(pl->phydev->mdio.bus, prtad, devad,
                                                                  ^~~~~
   drivers/net/phy/phylink.c:2341:11: note: initialize the variable 'prtad' to silence this warning
           int prtad, devad;
                    ^
                     = 0
   1 warning generated.


vim +/prtad +2371 drivers/net/phy/phylink.c

  2336	
  2337	static int phylink_phy_write(struct phylink *pl, unsigned int phy_id,
  2338				     unsigned int reg, unsigned int val)
  2339	{
  2340		struct phy_device *phydev = pl->phydev;
  2341		int prtad, devad;
  2342	
  2343		if (mdio_phy_id_is_c45(phy_id)) {
  2344			prtad = mdio_phy_id_prtad(phy_id);
  2345			devad = mdio_phy_id_devad(phy_id);
  2346			return mdiobus_c45_write(pl->phydev->mdio.bus, prtad, devad,
  2347						 reg, val);
  2348		}
  2349	
  2350		if (phydev->is_c45) {
  2351			switch (reg) {
  2352			case MII_BMCR:
  2353			case MII_BMSR:
  2354			case MII_PHYSID1:
  2355			case MII_PHYSID2:
  2356				devad = __ffs(phydev->c45_ids.mmds_present);
  2357				break;
  2358			case MII_ADVERTISE:
  2359			case MII_LPA:
  2360				if (!(phydev->c45_ids.mmds_present & MDIO_DEVS_AN))
  2361					return -EINVAL;
  2362				devad = MDIO_MMD_AN;
  2363				if (reg == MII_ADVERTISE)
  2364					reg = MDIO_AN_ADVERTISE;
  2365				else
  2366					reg = MDIO_AN_LPA;
  2367				break;
  2368			default:
  2369				return -EINVAL;
  2370			}
> 2371			return mdiobus_c45_write(pl->phydev->mdio.bus, prtad, devad,
  2372						 reg, val);
  2373		}
  2374	
  2375		return mdiobus_write(phydev->mdio.bus, phy_id, reg, val);
  2376	}
  2377	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
