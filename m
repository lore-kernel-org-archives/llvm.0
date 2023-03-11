Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40955395;
	Sat, 11 Mar 2023 22:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678572844; x=1710108844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lhfWOlpIJRSXV6Wiz9ZOl+fXb39UUn2tEzvb8YIly8E=;
  b=dChSGWueRqWgC5O+rXliodX7kNUgI54jroD0gZlfGpwobMAsCEf1Jgxr
   1MpQtZ5aq5PqbYeUFgQ0Y2m4PquXm1PDuyDd7sHfx39P0F/hiTSFLJ/Lf
   IzQr8Q8KQaqbIh5Lvq3OAAovO+FZ4zbMics9Qu6GNgYGAxWoDdCdL4gpv
   9CzErdB6tp8NZ3ij8tHuuTDl1VURoBXRcySXx2j/3xB3aaDCwh547XScy
   NB2EIy3rdoEemneQg6XokJzB7KKBNcZCWqGgz7Kkc0+STt/l5lMVseI9t
   OwUIwGEj5q1aybQ7m3jwn0++36Vl4ma88Nv/inhozNmwlO1O6OjTJ37rx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="325301434"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="325301434"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 14:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="802009545"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="802009545"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Mar 2023 14:14:03 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb7TW-0004or-1r;
	Sat, 11 Mar 2023 22:14:02 +0000
Date: Sun, 12 Mar 2023 06:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/test 14/18] drivers/tty/serial/samsung_tty.c:2034:10:
 error: call to undeclared function 'of_device_get_match_data'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202303120614.LYLaE7l9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/test
head:   a44acb6722672badc6478a7adf3c949e911a6deb
commit: e4624c687475c173f119d4bced069509fa102cb7 [14/18] cpufreq: Adjust includes to remove of_device.h
config: mips-randconfig-r022-20230312 (https://download.01.org/0day-ci/archive/20230312/202303120614.LYLaE7l9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=e4624c687475c173f119d4bced069509fa102cb7
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/test
        git checkout e4624c687475c173f119d4bced069509fa102cb7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120614.LYLaE7l9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/samsung_tty.c:2034:10: error: call to undeclared function 'of_device_get_match_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   return of_device_get_match_data(&pdev->dev);
                          ^
   drivers/tty/serial/samsung_tty.c:2034:10: note: did you mean 'device_get_match_data'?
   include/linux/property.h:396:13: note: 'device_get_match_data' declared here
   const void *device_get_match_data(const struct device *dev);
               ^
>> drivers/tty/serial/samsung_tty.c:2034:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'const struct s3c24xx_serial_drv_data *' [-Wint-conversion]
                   return of_device_get_match_data(&pdev->dev);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/of_device_get_match_data +2034 drivers/tty/serial/samsung_tty.c

b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  2029  
97a6cfe8115b04 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08  2030  static inline const struct s3c24xx_serial_drv_data *
695b847b247cff drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2020-06-17  2031  s3c24xx_get_driver_data(struct platform_device *pdev)
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2032  {
f25fbd5b1ef377 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08  2033  	if (dev_of_node(&pdev->dev))
f25fbd5b1ef377 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08 @2034  		return of_device_get_match_data(&pdev->dev);
9fe0d41ffd39cb drivers/tty/serial/samsung_tty.c Greg Kroah-Hartman  2019-12-10  2035  
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2036  	return (struct s3c24xx_serial_drv_data *)
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2037  			platform_get_device_id(pdev)->driver_data;
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2038  }
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2039  

:::::: The code at line 2034 was first introduced by commit
:::::: f25fbd5b1ef3773bd975135f8a017dc2251626cc tty: serial: samsung: simplify getting OF match data

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
