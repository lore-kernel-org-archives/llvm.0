Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168FE28F7;
	Sat,  4 Mar 2023 19:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677957666; x=1709493666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rg3hPC4bNFq882321CjHf6Y1PcKp3HGn8T/0jZqYkoU=;
  b=ioSAG5jg9cxlY/laFNdN9oz6CC8T73yH7biMnI1m4A3x/ib5ZaFZ+pDy
   eBiArYOG0nR59Phb2uFv5Y9NiLzY9CV9dRPfBX2AQbJZVeLKryP5FnTjg
   DkhxfBQho37k/MmXlZXafINoJxDlV1WK0TbXkGBVMwUHpYpd138xM2geR
   pbnADdDmHpFcJor9X2kECWbeWDitWzOWVwLeQp2a+Rz1r48Z/w4kin+/v
   rDUvsy65KwHplPPC6ngd5blCFSFzNykb/GaSrVMLI9rEGtYF5rVNRrjE2
   24us1W2xqARhPxlKjwdXYaHBvE5wNwySQZ8vVu7fydZhc4g0f9ciCsHvE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="335319733"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="335319733"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 11:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="744602170"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="744602170"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Mar 2023 11:21:04 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYXRH-0002Ji-2D;
	Sat, 04 Mar 2023 19:21:03 +0000
Date: Sun, 5 Mar 2023 03:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Walle <michael@walle.cc>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next] net: phy: intel-xway: remove LED
 configuration
Message-ID: <202303050357.5zihrfBH-lkp@intel.com>
References: <20230302141651.377261-1-michael@walle.cc>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302141651.377261-1-michael@walle.cc>

Hi Michael,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Walle/net-phy-intel-xway-remove-LED-configuration/20230302-222034
patch link:    https://lore.kernel.org/r/20230302141651.377261-1-michael%40walle.cc
patch subject: [PATCH RFC net-next] net: phy: intel-xway: remove LED configuration
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230305/202303050357.5zihrfBH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/689386222eb79ab10b990a46e1b67a89dc32022d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Michael-Walle/net-phy-intel-xway-remove-LED-configuration/20230302-222034
        git checkout 689386222eb79ab10b990a46e1b67a89dc32022d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/phy/ drivers/net/wireless/ath/ath10k/ drivers/vdpa/vdpa_sim/ fs/erofs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303050357.5zihrfBH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/intel-xway.c:119:6: warning: unused variable 'ledxh' [-Wunused-variable]
           u32 ledxh;
               ^
>> drivers/net/phy/intel-xway.c:120:6: warning: unused variable 'ledxl' [-Wunused-variable]
           u32 ledxl;
               ^
   2 warnings generated.


vim +/ledxh +119 drivers/net/phy/intel-xway.c

be393dd685d215 Martin Schiller 2021-07-20  115  
112b558d025712 Hauke Mehrtens  2016-06-05  116  static int xway_gphy_config_init(struct phy_device *phydev)
112b558d025712 Hauke Mehrtens  2016-06-05  117  {
112b558d025712 Hauke Mehrtens  2016-06-05  118  	int err;
112b558d025712 Hauke Mehrtens  2016-06-05 @119  	u32 ledxh;
112b558d025712 Hauke Mehrtens  2016-06-05 @120  	u32 ledxl;
112b558d025712 Hauke Mehrtens  2016-06-05  121  
112b558d025712 Hauke Mehrtens  2016-06-05  122  	/* Mask all interrupts */
112b558d025712 Hauke Mehrtens  2016-06-05  123  	err = phy_write(phydev, XWAY_MDIO_IMASK, 0);
112b558d025712 Hauke Mehrtens  2016-06-05  124  	if (err)
112b558d025712 Hauke Mehrtens  2016-06-05  125  		return err;
112b558d025712 Hauke Mehrtens  2016-06-05  126  
112b558d025712 Hauke Mehrtens  2016-06-05  127  	/* Clear all pending interrupts */
112b558d025712 Hauke Mehrtens  2016-06-05  128  	phy_read(phydev, XWAY_MDIO_ISTAT);
112b558d025712 Hauke Mehrtens  2016-06-05  129  
be393dd685d215 Martin Schiller 2021-07-20  130  	err = xway_gphy_rgmii_init(phydev);
be393dd685d215 Martin Schiller 2021-07-20  131  	if (err)
be393dd685d215 Martin Schiller 2021-07-20  132  		return err;
be393dd685d215 Martin Schiller 2021-07-20  133  
112b558d025712 Hauke Mehrtens  2016-06-05  134  	return 0;
112b558d025712 Hauke Mehrtens  2016-06-05  135  }
112b558d025712 Hauke Mehrtens  2016-06-05  136  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
