Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82E0363
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 03:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650943522; x=1682479522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PZz7KnydPEjcWT2gND0b9yCoPDyVFmsnn0TzTs7irRo=;
  b=S0my+UMT0qps1DyFelgrnLsBhvpC+SaeVxwuOvpkjZtVe7nyCqO5I7e2
   H2RtpKfTK9/u1n9Goj+XxGHj2v2+hJ24vKP01PdzoNukxqUBTL6LFNwsM
   C2Fk8woWjkLqRz/j/LcmXqQYyMyOWCken77WOKDfqom1EsLRj5ESzu8++
   T0li9zlFzeVSSsls5ENlnh6msBR8LLiQ+rwOL36O6bbKv3aAg9geyPmLp
   O8R5KyyUOseX1QYQljPNbhgiU023+DaLyuSe9oun/Iv0gP7/psruZEY5F
   ch2xDCyeA5YaZRdL3gvD9mHAkAxbJfOEHRO302FtrJmLN525LMhag7kX8
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265601812"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="265601812"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 20:25:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="512936465"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Apr 2022 20:25:19 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njBpH-0003BC-6L;
	Tue, 26 Apr 2022 03:25:19 +0000
Date: Tue, 26 Apr 2022 11:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [soc:arm/multiplatform-late 13/18]
 arch/arm/mach-s3c/s3c24xx.c:683:9: warning: The platform is deprecated and
 scheduled for removal. Please reach to the maintainers of the platform and
 linux-samsung-soc@vger.kernel.org if you still use it.Without such feedback,
 the platform will be removed...
Message-ID: <202204261130.D9GY2vp9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/multiplatform-late
head:   4894b187da71512fa656294ca916e7e73aa3243e
commit: 6a5e69c7ddeacbfcab1ffe501c32e21d7989c0f8 [13/18] ARM: s3c: mark as deprecated and schedule removal
config: arm-s3c2410_defconfig (https://download.01.org/0day-ci/archive/20220426/202204261130.D9GY2vp9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=6a5e69c7ddeacbfcab1ffe501c32e21d7989c0f8
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc arm/multiplatform-late
        git checkout 6a5e69c7ddeacbfcab1ffe501c32e21d7989c0f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/arm/mach-s3c/s3c24xx.c:177:16: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
           unsigned long tmp = 0;
                         ^
>> arch/arm/mach-s3c/s3c24xx.c:683:9: warning: The platform is deprecated and scheduled for removal. Please reach to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if you still use it.Without such feedback, the platform will be removed after 2022. [-W#pragma-messages]
   #pragma message "The platform is deprecated and scheduled for removal. " \
           ^
   2 warnings generated.


vim +683 arch/arm/mach-s3c/s3c24xx.c

   681	
   682	#ifndef CONFIG_COMPILE_TEST
 > 683	#pragma message "The platform is deprecated and scheduled for removal. " \

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
