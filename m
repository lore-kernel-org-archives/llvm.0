Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8526610F0
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 07:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650440594; x=1681976594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m8gEtRCvltgGJLOKzvUcDcgIkJWYlMrgbk7Qyy5PY9g=;
  b=CbjdpHQhIyT8Isz7W+tyQTKRRS7wn+OFQtbpGfVxsbbOFY7N5988In+m
   R49enz8NESG8vYggTf+W4syir4ACNWm/nCG8lbSKcR4PjtuZke3ELxY6m
   9O9as6JSUeZUgGIKUvY3Q3WGkPX5tehl9i5CXxm6u/B5w7v6J99qBHyLt
   57OiwqGnxCnuUWRZPlIrcULDFQao2kzdcQxuyCHtEtWgOYbfYaRV7BjMa
   Z9pk766SSN5zVfafFkcMRJz9oN69htWAdcRg+t4eT26tPihC6ikA2K2lU
   oUPfBBOkLKM0GuGyBBkyynHTl4MoUKh69Sp07r0WGT9uS7Nnwz3hV2cvb
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263728751"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="263728751"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 00:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="614319784"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Apr 2022 00:43:11 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nh4zW-0006jG-RO;
	Wed, 20 Apr 2022 07:43:10 +0000
Date: Wed, 20 Apr 2022 15:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes 229/274]
 arch/arm/mach-s3c/s3c24xx.c:683:9: warning: The platform is deprecated and
 scheduled for removal. Please reach to the maintainers of the platform and
 linux-samsung-soc@vger.kernel.org if you still use it.Without such feedback,
 the platform will be removed...
Message-ID: <202204201540.nxLLmmi6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   668a59697807412522822722d2010f7dc2904879
commit: 436ce66003d5020ca02cd096761d3214e9a91d82 [229/274] ARM: s3c: mark as deprecated and schedule removal
config: arm-s3c2410_defconfig (https://download.01.org/0day-ci/archive/20220420/202204201540.nxLLmmi6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=436ce66003d5020ca02cd096761d3214e9a91d82
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next pending-fixes
        git checkout 436ce66003d5020ca02cd096761d3214e9a91d82
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
