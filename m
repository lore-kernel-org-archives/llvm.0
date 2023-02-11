Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421E410FD;
	Sat, 11 Feb 2023 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676113328; x=1707649328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uwpV6m6u6QNCj1RSDEZkzFYp8yz5JF8yVNTqI4tr/QE=;
  b=DN7N1/WE+fryJlJekQpgoCBdkC9L+spH4uoYMPl7cdYdWd2FNKHdqoei
   Uny8fdCNnf7WJ12905KRIDyEwGMd75SuOQttHLTgx9OmOqs7K01BPjggl
   7jWmQ/pwdW+3vR/FL39eVsG9EwTis3FTjvhUukkw6rStjWSEAgl1fG0IA
   LrAaB8rBrIcRLX4aeCvylQXgCn9ellrULIT9zOGqlhB2rhCXbOK4m0Fgc
   qpUg4es5+w04ohV5x9vc+X8KcRUSfbJjrnkvxyP2gK15Qk62miyf/8Njp
   gynMqARDAR4YXoDBl47gNxk94pLVV27+iF84j+dtoLzjRs767OFX1UU4u
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310235120"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="310235120"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 03:02:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="777230781"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="777230781"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Feb 2023 03:02:06 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQndt-0006RZ-1V;
	Sat, 11 Feb 2023 11:02:05 +0000
Date: Sat, 11 Feb 2023 19:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 7942/12152] arch/arm/mach-pxa/balloon3.c:26:10:
 fatal error: 'linux/platform_data/pcf857x.h' file not found
Message-ID: <202302111818.Oiz9M6EM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba8a227fd19d19779005fb66ad7562608e1df83
commit: 91a0192e90e9df40d4b63c4ce11126114ed5d79d [7942/12152] gpio: pcf857x: Get rid of legacy platform data
config: arm-randconfig-r034-20230210 (https://download.01.org/0day-ci/archive/20230211/202302111818.Oiz9M6EM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=91a0192e90e9df40d4b63c4ce11126114ed5d79d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 91a0192e90e9df40d4b63c4ce11126114ed5d79d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111818.Oiz9M6EM-lkp@intel.com/

Note: the linux-next/master HEAD 6ba8a227fd19d19779005fb66ad7562608e1df83 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> arch/arm/mach-pxa/balloon3.c:26:10: fatal error: 'linux/platform_data/pcf857x.h' file not found
   #include <linux/platform_data/pcf857x.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +26 arch/arm/mach-pxa/balloon3.c

b6480faeee2348 Wolfram Sang      2017-05-21 @26  #include <linux/platform_data/pcf857x.h>
f15fc9b12286f6 Wolfram Sang      2017-11-13  27  #include <linux/platform_data/i2c-pxa.h>
c7921bb32ab616 Boris Brezillon   2018-09-07  28  #include <linux/mtd/platnand.h>
e6a8ef54774fb0 Marek Vasut       2010-07-28  29  #include <linux/mtd/physmap.h>
3a27f6e0a164bd Marek Vasut       2010-07-28  30  #include <linux/regulator/max1586.h>
2a23ec3679d84a Jonathan McDowell 2009-07-04  31  

:::::: The code at line 26 was first introduced by commit
:::::: b6480faeee234829b315168aebcb281ecf95f178 gpio: pcf857x: move header file out of I2C realm

:::::: TO: Wolfram Sang <wsa@the-dreams.de>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
