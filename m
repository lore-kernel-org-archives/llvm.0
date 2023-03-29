Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EBD7B;
	Wed, 29 Mar 2023 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680089509; x=1711625509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m9LH2SvZOgxqeJfFM0/6An3OEjZs1nSFIDdySrpNJz4=;
  b=LPwPq10u8JWJ5fKM/yP6cc7wodqA3gDJRK6SqBKrbAIjidDh95kJLKaB
   CRgKNtuIXpMDQb0b0L1s36TGsvalvswlWz5C+8GYwEMXbz0yZt3/eCdlb
   1Amh9wYDvxhB2UKYCLuNFtPhAunf8uW0IHIHYqig3MlINNOMX5Eb/53g/
   hk5Hu2D/06oYrP8Fi0HOUnF4+HbSnKt7BbfRHlxkrljeiqltR5aFx/bvG
   zPIU98rONvQdySuF3KGBOoJjASVCUMTKHzlEwcORd59w4yWCh18IRaZ+O
   M4sp08dTsMJkXXIGi/sLhl1JkoDwYR3VY865JnzXG/AEuNnVWb8JqMgJv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405792247"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="405792247"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 04:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="858459373"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="858459373"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Mar 2023 04:31:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phU1r-000JU0-2D;
	Wed, 29 Mar 2023 11:31:47 +0000
Date: Wed, 29 Mar 2023 19:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.3-rc3-net-next-ethtool-eee-v5 3/24]
 drivers/net/phy/phy-c45.c:1397: warning: expecting prototype for
 phy_eee_clk_stop_enable(). Prototype was for
 genphy_c45_eee_clk_stop_enable() instead
Message-ID: <202303291945.quD9TqI9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc3-net-next-ethtool-eee-v5
head:   d8c52ea1f279ee6766fd4bb1965104d205935be7
commit: 4494162ce01fd53dc45e5ecb12f33c667e02ac3f [3/24] net: phy: Add helper to set EEE Clock stop enable bit
config: x86_64-randconfig-a012-20230327 (https://download.01.org/0day-ci/archive/20230329/202303291945.quD9TqI9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/4494162ce01fd53dc45e5ecb12f33c667e02ac3f
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc3-net-next-ethtool-eee-v5
        git checkout 4494162ce01fd53dc45e5ecb12f33c667e02ac3f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291945.quD9TqI9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy-c45.c:1397: warning: expecting prototype for phy_eee_clk_stop_enable(). Prototype was for genphy_c45_eee_clk_stop_enable() instead


vim +1397 drivers/net/phy/phy-c45.c

  1388	
  1389	/**
  1390	 * phy_eee_clk_stop_enable - Clock should stop during LPI signalling
  1391	 * @phydev: target phy_device struct
  1392	 *
  1393	 * Description: Program the MMD register 3.0 setting the "Clock stop enable"
  1394	 * bit.
  1395	 */
  1396	int genphy_c45_eee_clk_stop_enable(struct phy_device *phydev)
> 1397	{
  1398		int ret;
  1399	
  1400		/* IEEE 802.3:2018 - 45.2.3.2.6 Clock stop capable (3.1.6) */
  1401		ret = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_STAT1);
  1402		if (ret < 0)
  1403			return ret;
  1404	
  1405		if (ret & MDIO_STAT1_CLKSTOP_CAPABLE)
  1406			/* IEEE 802.3-2018 45.2.3.1.4 Clock stop enable (3.0.10) */
  1407			return phy_set_bits_mmd(phydev, MDIO_MMD_PCS, MDIO_CTRL1,
  1408						MDIO_PCS_CTRL1_CLKSTOP_EN);
  1409		return 0;
  1410	}
  1411	EXPORT_SYMBOL_GPL(genphy_c45_eee_clk_stop_enable);
  1412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
