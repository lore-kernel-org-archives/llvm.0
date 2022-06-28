Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB264367
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 05:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656394749; x=1687930749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ir8lmK7C7d8cLKlhbPdCb+2NADN21Wc5Vd2lMQ7GZVE=;
  b=P+BuJ6f3NZI6CuClIFiazdSZ/YXGWMbRS9bbWu2ftFUZAPtkiyvqm+/a
   SlRsvjB9ejsfwzzYI/S0DL0WOXWzfBL5du03TxCuWbYUvV5dBNtd8vv3U
   2IibfWjjAFhmR8nHfQoZBv8BrTkttKzR3jIsv0C6BkkQkiyBxuSjFmqhR
   olAHuqGJmjp8p9ACPMzuG8X2/eiFUj4lXhsj6G+27RqxELTafqA0SzGuf
   32Hkq4ESfDNANxfjHogH9U9nizRFBLQefPU8yJQ8APpfsTxGgtLSw8DhK
   CC/GWUnTGfuKYNs3KGUeyaoMnRTJvozSJUCOfqThgKWoSYsDZbU9G1eMw
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="279184801"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="279184801"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 22:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="587737228"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Jun 2022 22:39:07 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o63wI-0009Yh-Gx;
	Tue, 28 Jun 2022 05:39:06 +0000
Date: Tue, 28 Jun 2022 13:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: arch/arm/mach-pxa/corgi_pm.c:137:15: warning: no previous prototype
 for function 'corgipm_read_devdata'
Message-ID: <202206281334.Hj0eme5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   941e3e7912696b9fbe3586083a7c2e102cee7a87
commit: 8c1fb11b8a77dc489a8ef6d96c38c1297b629d06 ARM: s3c: enable s3c24xx multiplatform support
date:   3 months ago
config: arm-buildonly-randconfig-r001-20220627 (https://download.01.org/0day-ci/archive/20220628/202206281334.Hj0eme5G-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 016342e319fd31e41cf5ed16a6140a8ea2de74dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8c1fb11b8a77dc489a8ef6d96c38c1297b629d06
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8c1fb11b8a77dc489a8ef6d96c38c1297b629d06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-pxa/corgi_pm.c:137:15: warning: no previous prototype for function 'corgipm_read_devdata' [-Wmissing-prototypes]
   unsigned long corgipm_read_devdata(int type)
                 ^
   arch/arm/mach-pxa/corgi_pm.c:137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long corgipm_read_devdata(int type)
   ^
   static 
   1 warning generated.


vim +/corgipm_read_devdata +137 arch/arm/mach-pxa/corgi_pm.c

d72f25b0dfb080 Richard Purdie 2005-11-13  136  
b7557de41a0434 Richard Purdie 2006-01-05 @137  unsigned long corgipm_read_devdata(int type)
d72f25b0dfb080 Richard Purdie 2005-11-13  138  {
b7557de41a0434 Richard Purdie 2006-01-05  139  	switch(type) {
b7557de41a0434 Richard Purdie 2006-01-05  140  	case SHARPSL_STATUS_ACIN:
9bf448c66d4b4c Haojian Zhuang 2011-10-17  141  		return !gpio_get_value(CORGI_GPIO_AC_IN);
b7557de41a0434 Richard Purdie 2006-01-05  142  	case SHARPSL_STATUS_LOCK:
05732d7eb0d7f7 Eric Miao      2010-07-04  143  		return gpio_get_value(sharpsl_pm.machinfo->gpio_batlock);
b7557de41a0434 Richard Purdie 2006-01-05  144  	case SHARPSL_STATUS_CHRGFULL:
05732d7eb0d7f7 Eric Miao      2010-07-04  145  		return gpio_get_value(sharpsl_pm.machinfo->gpio_batfull);
b7557de41a0434 Richard Purdie 2006-01-05  146  	case SHARPSL_STATUS_FATAL:
05732d7eb0d7f7 Eric Miao      2010-07-04  147  		return gpio_get_value(sharpsl_pm.machinfo->gpio_fatal);
b7557de41a0434 Richard Purdie 2006-01-05  148  	case SHARPSL_ACIN_VOLT:
b7557de41a0434 Richard Purdie 2006-01-05  149  		return sharpsl_pm_pxa_read_max1111(MAX1111_ACIN_VOLT);
b7557de41a0434 Richard Purdie 2006-01-05  150  	case SHARPSL_BATT_TEMP:
b7557de41a0434 Richard Purdie 2006-01-05  151  		return sharpsl_pm_pxa_read_max1111(MAX1111_BATT_TEMP);
b7557de41a0434 Richard Purdie 2006-01-05  152  	case SHARPSL_BATT_VOLT:
b7557de41a0434 Richard Purdie 2006-01-05  153  	default:
b7557de41a0434 Richard Purdie 2006-01-05  154  		return sharpsl_pm_pxa_read_max1111(MAX1111_BATT_VOLT);
b7557de41a0434 Richard Purdie 2006-01-05  155  	}
d72f25b0dfb080 Richard Purdie 2005-11-13  156  }
d72f25b0dfb080 Richard Purdie 2005-11-13  157  

:::::: The code at line 137 was first introduced by commit
:::::: b7557de41a04346cb545d4dda7088760cb96e713 [ARM] 3228/1: SharpSL: Move PM code to arch/arm/common

:::::: TO: Richard Purdie <rpurdie@rpsys.net>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
