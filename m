Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3C3136C;
	Sat, 18 Mar 2023 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679138805; x=1710674805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L2oqCvx4RHKWo8xb5jcyGinNVpYpRC2MUhwZ1bhLdis=;
  b=Ag9pR7ik0OGLYRVM5uH/386E76ftMtaPyk2eBDh9oC05hmjY+2T8DY6y
   rzAea6kk49JyE4KLW0uO3WVbGntW2lUKy80Pacr5TashdGgN4o2UlnKUr
   M5nJgw5uQ4dMBqn+1bQi2akOj0eUwtxvQb93kxy6JFT8vf+gT3LdSqZps
   Gede+N2z41LPsKoI/xKiU+XIeQc2OQnjgxqBes0lMzB+r/9FWrfjCtlTi
   UT9gPlF6oPle2N0jkfidpIuJyqUlxuOGAzLgqzH4Z4T7IZFqzGx3uGLcD
   3wgBc1xUDRa8XOCeDhjd2KyTru3kDLCY2GsQaFNX3C+n7ic+Hx7GDXl8Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338446377"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="338446377"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 04:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="854759570"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="854759570"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2023 04:26:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdUhu-000A1u-15;
	Sat, 18 Mar 2023 11:26:42 +0000
Date: Sat, 18 Mar 2023 19:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.2.0-net-next-phy-leds 27/28]
 drivers/net/phy/phy_device.c:3096:8: error: no member named
 'hw_control_get_device' in 'struct led_classdev'
Message-ID: <202303181928.Sf9EiOxx-lkp@intel.com>
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
commit: 7c2cfe88a4bf5b643c74c16e15be9119689e475d [27/28] net: phy: Implement hw_control_get_device()
config: riscv-randconfig-r011-20230313 (https://download.01.org/0day-ci/archive/20230318/202303181928.Sf9EiOxx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/lunn/linux/commit/7c2cfe88a4bf5b643c74c16e15be9119689e475d
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout 7c2cfe88a4bf5b643c74c16e15be9119689e475d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181928.Sf9EiOxx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phy_device.c:3095:9: error: no member named 'hw_control_configure' in 'struct led_classdev'
                   cdev->hw_control_configure = phy_led_hw_control_configure;
                   ~~~~  ^
>> drivers/net/phy/phy_device.c:3096:8: error: no member named 'hw_control_get_device' in 'struct led_classdev'
           cdev->hw_control_get_device = phy_led_hw_control_get_device;
           ~~~~  ^
   2 errors generated.


vim +3096 drivers/net/phy/phy_device.c

  3067	
  3068	static int of_phy_led(struct phy_device *phydev,
  3069			      struct device_node *led)
  3070	{
  3071		struct device *dev = &phydev->mdio.dev;
  3072		struct led_init_data init_data = {};
  3073		struct led_classdev *cdev;
  3074		struct phy_led *phyled;
  3075		int err;
  3076	
  3077		phyled = devm_kzalloc(dev, sizeof(*phyled), GFP_KERNEL);
  3078		if (!phyled)
  3079			return -ENOMEM;
  3080	
  3081		cdev = &phyled->led_cdev;
  3082		phyled->phydev = phydev;
  3083	
  3084		err = of_property_read_u32(led, "reg", &phyled->index);
  3085		if (err)
  3086			return err;
  3087	
  3088		if (phydev->drv->led_brightness_set)
  3089			cdev->brightness_set_blocking = phy_led_set_brightness;
  3090		if (phydev->drv->led_blink_set)
  3091			cdev->blink_set = phy_led_blink_set;
  3092		if (phydev->drv->led_hw_is_supported &&
  3093		    phydev->drv->led_hw_control_set &&
  3094		    phydev->drv->led_hw_control_get)
  3095			cdev->hw_control_configure = phy_led_hw_control_configure;
> 3096		cdev->hw_control_get_device = phy_led_hw_control_get_device;
  3097		cdev->max_brightness = 1;
  3098		init_data.devicename = dev_name(&phydev->mdio.dev);
  3099		init_data.fwnode = of_fwnode_handle(led);
  3100	
  3101		err = devm_led_classdev_register_ext(dev, cdev, &init_data);
  3102		if (err)
  3103			return err;
  3104	
  3105		list_add(&phyled->list, &phydev->leds);
  3106	
  3107		return 0;
  3108	}
  3109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
