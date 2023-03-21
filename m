Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0010E9;
	Tue, 21 Mar 2023 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679405131; x=1710941131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1gKUAodHoBXE3anFRjYwPhsp+RW57yCcDh/2IID72o=;
  b=ELVo7p5RQKZvBj//FilcjdIINPsVBQH6bysfG1wcYnsesady0kDf6XC/
   ViU+pySSOywrF1ms0u13HqEdzhf1UzHeCjd4nIPk6i4g42rxOG0ksT3B0
   ZQRrH3UvtRc1wGywJWySBmx/fmuZP+pdACBgMwFEFTW5pzxvUesFS0CY9
   fXXsLxhui8fZfv0gLvmc5/pHvI+Wy1F5TLnTRET4OdmddxiW4UI5CgG/r
   Bdy5gMHZMJGj2tbiI5nU/mdD/Pe/c/X/wPAxaIURmqxtkblIhCkQq1Q41
   GjLb9smBIjot9r+/Xl2K4olSIIXtBZRdYLvismzeC+L7lBiGveEl+YQ16
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="336442855"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="336442855"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 06:25:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="683878123"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="683878123"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Mar 2023 06:25:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pebzU-000BwU-2V;
	Tue, 21 Mar 2023 13:25:28 +0000
Date: Tue, 21 Mar 2023 21:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:file8krnAQ 7/7] drivers/regulator/s5m8767.c:492:10:
 error: call to undeclared function 'of_get_named_gpio'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202303212139.VjsFByow-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file8krnAQ
head:   d962f3f8e4da347cc9fcda7b887ff7a8f23aad2f
commit: d962f3f8e4da347cc9fcda7b887ff7a8f23aad2f [7/7] regulator: s5m8767: Replace of_gpio.h with what indeed is used
config: riscv-randconfig-c006-20230319 (https://download.01.org/0day-ci/archive/20230321/202303212139.VjsFByow-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=d962f3f8e4da347cc9fcda7b887ff7a8f23aad2f
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci file8krnAQ
        git checkout d962f3f8e4da347cc9fcda7b887ff7a8f23aad2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/regulator/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303212139.VjsFByow-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/s5m8767.c:492:10: error: call to undeclared function 'of_get_named_gpio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   gpio = of_get_named_gpio(pmic_np,
                          ^
   drivers/regulator/s5m8767.c:510:10: error: call to undeclared function 'of_get_named_gpio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   gpio = of_get_named_gpio(pmic_np,
                          ^
   2 errors generated.


vim +/of_get_named_gpio +492 drivers/regulator/s5m8767.c

ee1e0994ab1bd30 Krzysztof Kozlowski 2014-01-24  482  
ee1e0994ab1bd30 Krzysztof Kozlowski 2014-01-24  483  
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  484  #ifdef CONFIG_OF
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  485  static int s5m8767_pmic_dt_parse_dvs_gpio(struct sec_pmic_dev *iodev,
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  486  			struct sec_platform_data *pdata,
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  487  			struct device_node *pmic_np)
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  488  {
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  489  	int i, gpio;
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  490  
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  491  	for (i = 0; i < 3; i++) {
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03 @492  		gpio = of_get_named_gpio(pmic_np,
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  493  					"s5m8767,pmic-buck-dvs-gpios", i);
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  494  		if (!gpio_is_valid(gpio)) {
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  495  			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  496  			return -EINVAL;
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  497  		}
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  498  		pdata->buck_gpios[i] = gpio;
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  499  	}
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  500  	return 0;
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  501  }
26aec009f6b61c0 Amit Daniel Kachhap 2013-02-03  502  

:::::: The code at line 492 was first introduced by commit
:::::: 26aec009f6b61c077c6de1a96cca7a5132851dbe regulator: add device tree support for s5m8767

:::::: TO: Amit Daniel Kachhap <amit.daniel@samsung.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
