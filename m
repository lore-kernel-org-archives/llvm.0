Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E7F7468;
	Tue, 19 Dec 2023 06:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XH8jescH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702966287; x=1734502287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I3niG70hDmYdaHrCMys+P5v5syUQfvbA6vVa3Q34db8=;
  b=XH8jescH0Y9xWcHTc8GgJhJnMZoec/aR6Bg5JV1sfxBRXhGNWEJXAAOQ
   lLzkndiQqGAiEHxhA1BR4tVQT8YCX5vHSvHp3M13ckYV7kG8QVv0rqoEs
   c7FdPrfjy4d9le4VWCHQ8w6I+lkkTZ6TrjZfVAfd4JImHv7mMoWMUM8yl
   yjING+CPkKhC8sCIVHjgaZcq6XZJIjeKbbwTYtb/cSx4rPqfqQm9FAHKx
   ALZVhi/mJpxxjjHV5fq5U5VnBrUVPVXoplX6dL+Eqgn82l5gRkH2vWmue
   cv4qDz7M8hm7hiQtqhjrT98eJgD00GMFhFT6TYcjrthDyP8FUJCo266A8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="14300851"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="14300851"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 22:11:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="1023024232"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="1023024232"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Dec 2023 22:11:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFTK6-0004v9-15;
	Tue, 19 Dec 2023 06:11:22 +0000
Date: Tue, 19 Dec 2023 14:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 2/2] Add the Airoha EN8811H PHY driver
Message-ID: <202312191343.AXWGUtmC-lkp@intel.com>
References: <20231216194432.18963-3-ericwouds@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231216194432.18963-3-ericwouds@gmail.com>

Hi Eric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Woudstra/Add-the-Airoha-EN8811H-PHY-driver/20231217-034635
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231216194432.18963-3-ericwouds%40gmail.com
patch subject: [PATCH RFC net-next 2/2] Add the Airoha EN8811H PHY driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231219/202312191343.AXWGUtmC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312191343.AXWGUtmC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312191343.AXWGUtmC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/air_en8811h.c:199:17: error: use of undeclared identifier 'TRIGGER_NETDEV_LINK_2500'
                                                  BIT(TRIGGER_NETDEV_LINK_2500)   |
                                                      ^
   drivers/net/phy/air_en8811h.c:587:19: error: use of undeclared identifier 'TRIGGER_NETDEV_LINK_2500'
           if (rules & (BIT(TRIGGER_NETDEV_LINK_2500) | BIT(TRIGGER_NETDEV_LINK))) {
                            ^
   drivers/net/phy/air_en8811h.c:737:23: error: use of undeclared identifier 'TRIGGER_NETDEV_LINK_2500'
           priv->led[0].rules = AIR_DEFAULT_TRIGGER_LED0;
                                ^
   drivers/net/phy/air_en8811h.c:143:39: note: expanded from macro 'AIR_DEFAULT_TRIGGER_LED0'
   #define AIR_DEFAULT_TRIGGER_LED0 (BIT(TRIGGER_NETDEV_LINK_2500) | \
                                         ^
   drivers/net/phy/air_en8811h.c:738:23: error: use of undeclared identifier 'TRIGGER_NETDEV_LINK_2500'
           priv->led[1].rules = AIR_DEFAULT_TRIGGER_LED1;
                                ^
   drivers/net/phy/air_en8811h.c:147:39: note: expanded from macro 'AIR_DEFAULT_TRIGGER_LED1'
   #define AIR_DEFAULT_TRIGGER_LED1 (BIT(TRIGGER_NETDEV_LINK_2500) | \
                                         ^
>> drivers/net/phy/air_en8811h.c:875:5: warning: no previous prototype for function 'en8811h_c45_read_link' [-Wmissing-prototypes]
   int en8811h_c45_read_link(struct phy_device *phydev)
       ^
   drivers/net/phy/air_en8811h.c:875:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int en8811h_c45_read_link(struct phy_device *phydev)
   ^
   static 
   drivers/net/phy/air_en8811h.c:1012:12: warning: no previous prototype for function 'en8811h_phy_driver_register' [-Wmissing-prototypes]
   int __init en8811h_phy_driver_register(void)
              ^
   drivers/net/phy/air_en8811h.c:1012:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init en8811h_phy_driver_register(void)
   ^
   static 
   drivers/net/phy/air_en8811h.c:1024:13: warning: no previous prototype for function 'en8811h_phy_driver_unregister' [-Wmissing-prototypes]
   void __exit en8811h_phy_driver_unregister(void)
               ^
   drivers/net/phy/air_en8811h.c:1024:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __exit en8811h_phy_driver_unregister(void)
   ^
   static 
   3 warnings and 4 errors generated.


vim +/en8811h_c45_read_link +875 drivers/net/phy/air_en8811h.c

   874	
 > 875	int en8811h_c45_read_link(struct phy_device *phydev)
   876	{
   877		int val;
   878	
   879		/* Read link state from known reliable register (latched) */
   880	
   881		if (!phy_polling_mode(phydev) || !phydev->link) {
   882			val = phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_STAT1);
   883			if (val < 0)
   884				return val;
   885			phydev->link = !!(val & MDIO_STAT1_LSTATUS);
   886	
   887			if (phydev->link)
   888				return 0;
   889		}
   890	
   891		val = phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_STAT1);
   892		if (val < 0)
   893			return val;
   894		phydev->link = !!(val & MDIO_STAT1_LSTATUS);
   895	
   896		return 0;
   897	}
   898	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
