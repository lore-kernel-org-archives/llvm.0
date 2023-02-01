Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD977369;
	Wed,  1 Feb 2023 00:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675211195; x=1706747195;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZzEHv83TUny97hRZyE8/QGhT6k6zmWzz7fAS8ms7RAc=;
  b=ZMVbzyWEoTWdBKzZdMSRwGYkJrUXwNH/JV+JNBOR0OwZd9QzV5fuYj7W
   JFPR1X/ZLNj1lQuYF5MuG6XhCCquT69ndN5SkFT+yxX4ip2GRF/bbLeSl
   pUIe1aOnJ+8Xzda4UYKwoG7zLRJLWQZ2gip4EHWy+Xr4aZEjK1BOTm0Cw
   dzFgydoisAgZoFHEeenEKhi87l4znwGb9hvjdhVB7TTwYxxn6bPcswx70
   KxUveD/HjBI2TWW8Gf6WTZB1fW6XjrK4BF7nymyT2Z8aX3CupY3ZAuVD2
   WiSFfzGTvqPIhCVWGDjO0VPNPfpyOWQvgZ8x4Q3CsUy261d3CDw+fMrSg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="330109952"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="330109952"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 16:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="838581511"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="838581511"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Jan 2023 16:26:32 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN0xL-0004py-14;
	Wed, 01 Feb 2023 00:26:31 +0000
Date: Wed, 1 Feb 2023 08:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>
Subject: [linux-next:master 7594/9515] arch/arm/mach-pxa/hx4700.c:24:10:
 fatal error: 'linux/mfd/asic3.h' file not found
Message-ID: <202302010857.hYS9V7ob-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   80bd9028fecadae4e8e3a278cd32d74badc2a6e0
commit: 14ccecb63da856372fe59321903256eb7de98efb [7594/9515] mfd: Remove toshiba tmio drivers
config: arm-magician_defconfig (https://download.01.org/0day-ci/archive/20230201/202302010857.hYS9V7ob-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=14ccecb63da856372fe59321903256eb7de98efb
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 14ccecb63da856372fe59321903256eb7de98efb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 80bd9028fecadae4e8e3a278cd32d74badc2a6e0 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> arch/arm/mach-pxa/hx4700.c:24:10: fatal error: 'linux/mfd/asic3.h' file not found
   #include <linux/mfd/asic3.h>
            ^~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from arch/arm/mach-pxa/hx4700-pcmcia.c:13:
>> arch/arm/mach-pxa/hx4700.h:12:10: fatal error: 'linux/mfd/asic3.h' file not found
   #include <linux/mfd/asic3.h>
            ^~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +24 arch/arm/mach-pxa/hx4700.c

d3ca1952e63ffb Philipp Zabel             2009-05-28 @24  #include <linux/mfd/asic3.h>
d3ca1952e63ffb Philipp Zabel             2009-05-28  25  #include <linux/mtd/physmap.h>
d3ca1952e63ffb Philipp Zabel             2009-05-28  26  #include <linux/pda_power.h>
3c6e8d05d60d81 Linus Walleij             2016-09-16  27  #include <linux/platform_data/gpio-htc-egpio.h>
8d6b00f5d639cf Paul Parsons              2012-10-19  28  #include <linux/pwm.h>
d3ca1952e63ffb Philipp Zabel             2009-05-28  29  #include <linux/pwm_backlight.h>
6967cca8b431a1 Heiko Stübner             2012-03-02  30  #include <linux/regulator/driver.h>
6967cca8b431a1 Heiko Stübner             2012-03-02  31  #include <linux/regulator/gpio-regulator.h>
d3ca1952e63ffb Philipp Zabel             2009-05-28  32  #include <linux/regulator/machine.h>
6ea0414fc748ab Philipp Zabel             2009-05-28  33  #include <linux/regulator/max1586.h>
d3ca1952e63ffb Philipp Zabel             2009-05-28  34  #include <linux/spi/ads7846.h>
d3ca1952e63ffb Philipp Zabel             2009-05-28  35  #include <linux/spi/spi.h>
8348c259dd6a60 Sebastian Andrzej Siewior 2010-11-22  36  #include <linux/spi/pxa2xx_spi.h>
f15fc9b12286f6 Wolfram Sang              2017-11-13  37  #include <linux/platform_data/i2c-pxa.h>
d3ca1952e63ffb Philipp Zabel             2009-05-28  38  

:::::: The code at line 24 was first introduced by commit
:::::: d3ca1952e63ffbebab6f2f1c9551df7b3cb731f5 [ARM] pxa: add basic support for HP iPAQ hx4700 PDAs

:::::: TO: Philipp Zabel <philipp.zabel@gmail.com>
:::::: CC: Eric Miao <eric.y.miao@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
