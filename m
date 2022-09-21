Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0BD7C
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 19:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663788224; x=1695324224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tb1ZJFyVkMzNDTfhmTI0cGITVZVMhs9seI71Wf28Xig=;
  b=Hg6zKgytWWYqS2obSZR1/EwH/Cc6PfP1HCiuaea09SZk3ImoSeos+ASa
   lXRym0ATP3u8ayERNmiyyj2wxLl4gPHchtDP19lYrHjm6c/1nJT2+uPU7
   zsweIM1l3viEYmwLKbQr6QCwV99LqCOUelT/ZL6jAAOaPqhP5kcl6Hb56
   lwfDSK5pLWxXKRfKmioUFR+U3Z44eVmg2Y7dHCOF1bHsF/jAIou3ziR45
   w9dpxZYDOaVUKpNtHD9/HxktrA5w1rpSVQRemd/kLE+M1Djv8CAb02pK6
   h5TMxmH/idY7rNrUfjGzzkxWr1ztv7LXju7kXvrJI08MCcyyxf4oZeZ0V
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="326418972"
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="326418972"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 12:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="688001705"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Sep 2022 12:23:34 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ob5Jm-0003sw-0H;
	Wed, 21 Sep 2022 19:23:34 +0000
Date: Thu, 22 Sep 2022 03:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Eliav Farber <farbere@amazon.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [groeck-staging:hwmon-next 36/55] ld.lld: error: undefined symbol:
 __aeabi_ldivmod
Message-ID: <202209220303.tyh2lOm9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   103974b1117651a5884e2bc7832d7b02990e0232
commit: 3b12ca798e022192fb451e9e5ef1bb147f21c413 [36/55] hwmon: (mr75203) add support for series 6 temperature equation
config: arm-randconfig-r012-20220921 (https://download.01.org/0day-ci/archive/20220922/202209220303.tyh2lOm9-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=3b12ca798e022192fb451e9e5ef1bb147f21c413
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout 3b12ca798e022192fb451e9e5ef1bb147f21c413
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the groeck-staging/hwmon-next HEAD 103974b1117651a5884e2bc7832d7b02990e0232 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_ldivmod
   >>> referenced by mr75203.c
   >>>               hwmon/mr75203.o:(pvt_read) in archive drivers/built-in.a
   >>> did you mean: __aeabi_idivmod
   >>> defined in: arch/arm/lib/lib.a(lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
