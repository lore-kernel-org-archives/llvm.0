Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C8CEC0;
	Sat, 18 Mar 2023 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679135144; x=1710671144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i7OrzP+ieEjaBs8vQXUtNkukKolX9RnAbbUbLsuU68E=;
  b=QoxYKvWDioGcv7i+lqPIYFNDGqXbpl2Sz0oAVCA6JULZTH2iQe4rx+Ji
   qp5cUZ3YUS+dlAbFtg8HBQKvYCaCnb83/NVXWhzmk5NzrH2FbE6arIsGw
   2tmOudoMwgF1TqgQR92zgwrOULbil/DXDNNgZ5lE2mtvjPDUTOBsMFDpQ
   2QJPJhHxC4n/y4or6ney/DcGFPWkCwidv+T00OyyYqufvAQ0Mm7o69YDT
   rq2J7/82sbpepBjo1IEEFFYzNOAex51IBV300Fz1khhoj5Kn4NHBwAqDQ
   UT+NfmSDr3zwPUPftDfuImA61aU1jrt5icIhscLWiuQHeROJAVsMTaDMG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="318823483"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="318823483"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 03:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="804384417"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="804384417"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Mar 2023 03:25:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdTkr-000A0K-0z;
	Sat, 18 Mar 2023 10:25:41 +0000
Date: Sat, 18 Mar 2023 18:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.2.0-net-next-phy-leds 20/28]
 drivers/net/phy/phy_device.c:3084:9: error: no member named
 'hw_control_configure' in 'struct led_classdev'
Message-ID: <202303181822.67ctruak-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.2.0-net-next-phy-leds
head:   8a9b1a5ad5dd0e48585009020088a2ee5bdd6688
commit: bbade5cbf97bd9260cd0c9cf17699127c2b815af [20/28] net: phy: phy_device: Call into the PHY driver to set LED offload
config: riscv-randconfig-r011-20230313 (https://download.01.org/0day-ci/archive/20230318/202303181822.67ctruak-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/lunn/linux/commit/bbade5cbf97bd9260cd0c9cf17699127c2b815af
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout bbade5cbf97bd9260cd0c9cf17699127c2b815af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181822.67ctruak-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/phy_device.c:3084:9: error: no member named 'hw_control_configure' in 'struct led_classdev'
                   cdev->hw_control_configure = phy_led_hw_control_configure;
                   ~~~~  ^
   1 error generated.


vim +3084 drivers/net/phy/phy_device.c

  3056	
  3057	static int of_phy_led(struct phy_device *phydev,
  3058			      struct device_node *led)
  3059	{
  3060		struct device *dev = &phydev->mdio.dev;
  3061		struct led_init_data init_data = {};
  3062		struct led_classdev *cdev;
  3063		struct phy_led *phyled;
  3064		int err;
  3065	
  3066		phyled = devm_kzalloc(dev, sizeof(*phyled), GFP_KERNEL);
  3067		if (!phyled)
  3068			return -ENOMEM;
  3069	
  3070		cdev = &phyled->led_cdev;
  3071		phyled->phydev = phydev;
  3072	
  3073		err = of_property_read_u32(led, "reg", &phyled->index);
  3074		if (err)
  3075			return err;
  3076	
  3077		if (phydev->drv->led_brightness_set)
  3078			cdev->brightness_set_blocking = phy_led_set_brightness;
  3079		if (phydev->drv->led_blink_set)
  3080			cdev->blink_set = phy_led_blink_set;
  3081		if (phydev->drv->led_hw_is_supported &&
  3082		    phydev->drv->led_hw_control_set &&
  3083		    phydev->drv->led_hw_control_get)
> 3084			cdev->hw_control_configure = phy_led_hw_control_configure;
  3085		cdev->max_brightness = 1;
  3086		init_data.devicename = dev_name(&phydev->mdio.dev);
  3087		init_data.fwnode = of_fwnode_handle(led);
  3088	
  3089		err = devm_led_classdev_register_ext(dev, cdev, &init_data);
  3090		if (err)
  3091			return err;
  3092	
  3093		list_add(&phyled->list, &phydev->leds);
  3094	
  3095		return 0;
  3096	}
  3097	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
