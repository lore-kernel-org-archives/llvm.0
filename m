Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B3D125B2;
	Tue, 19 Dec 2023 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjLV2tMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702976469; x=1734512469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=btmRQ/nvmK3iVo0NwdsWXw4qFAWsZCy6rM+yvrLvMAU=;
  b=QjLV2tMCmvmlCUMz/fqhJ/B33z0c48vx86Ijpezcim7GxvCUc5abwCMb
   CT14Xa7ZZLsCOc08D60o0lgpm1gEdDNeo/QvSDmeUSPHENV//f844T9R7
   SQgF55DO8XtBYYcUl6IVHxzAcc625l7xEXsv0psvQ3d64qV8qTf5b8vxh
   /4K2hx2UY5Czf7xItwRRHu7DypAIdbUqHeiCQt4bj0vrG3b+LsU20TFm1
   98jPps1lxBEBPgpDg8Q6tc9Eg+36ZIeCAtR5rgVwwr7JjyembJbd3clkO
   8YQpVQxAnFrQ2Ap9lwXjWKprZblOiYL2H9uW98PbJlEkHg4zkUiNcuD43
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="380612397"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="380612397"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 01:01:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="894212904"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="894212904"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2023 01:01:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFVyL-00055j-0D;
	Tue, 19 Dec 2023 09:01:05 +0000
Date: Tue, 19 Dec 2023 17:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 2/2] Add the Airoha EN8811H PHY driver
Message-ID: <202312191633.hOuF0f5h-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Woudstra/Add-the-Airoha-EN8811H-PHY-driver/20231217-034635
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231216194432.18963-3-ericwouds%40gmail.com
patch subject: [PATCH RFC net-next 2/2] Add the Airoha EN8811H PHY driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231219/202312191633.hOuF0f5h-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312191633.hOuF0f5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312191633.hOuF0f5h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/air_en8811h.c:199:17: error: use of undeclared identifier 'TRIGGER_NETDEV_LINK_2500'
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
   drivers/net/phy/air_en8811h.c:875:5: warning: no previous prototype for function 'en8811h_c45_read_link' [-Wmissing-prototypes]
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


vim +/TRIGGER_NETDEV_LINK_2500 +199 drivers/net/phy/air_en8811h.c

   193	
   194	static const unsigned long en8811h_led_trig = (BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
   195						       BIT(TRIGGER_NETDEV_LINK)        |
   196						       BIT(TRIGGER_NETDEV_LINK_10)     |
   197						       BIT(TRIGGER_NETDEV_LINK_100)    |
   198						       BIT(TRIGGER_NETDEV_LINK_1000)   |
 > 199						       BIT(TRIGGER_NETDEV_LINK_2500)   |
   200						       BIT(TRIGGER_NETDEV_RX)          |
   201						       BIT(TRIGGER_NETDEV_TX));
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
