Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D5917F1;
	Fri, 20 Jan 2023 10:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674212138; x=1705748138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K/8OAe5bsvMj1kQ3OooopFLGHD20X+RYJBlEOV+v8K8=;
  b=ijWWAZpSBDzPn1DOgkEKou/AQGfM6FqOiCK4aqg1zOtjAQxJ38s6uGzK
   SPCs05g1zZx/OQLjvz+3QhFziItCkg0DC7FdS8XCmt2dCJuWA6S6U535B
   4hQEpy+Qv8Y84qvqE4JhHxU3R86lb9p9jWCSYXOnR2USNI9pxExB1DxXs
   1GFmbYtAGTuRMKPEw9H1juhuoiTR5vhh+lTydhSsD+PmemSsA2wTa1/VE
   s3vXuEgCuG5BkTU71Qe+NYZaf+u5oqG2eecnx1JWAM9uPb6boirL/73Q9
   +WWlyYmpmdEIvgonvfS7efCuAYdYfxVOoSDFmpwXBYT1h+xlvBuI8iv6c
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323243867"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="323243867"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 02:55:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="653754120"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="653754120"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Jan 2023 02:55:01 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIp2u-0002UO-0S;
	Fri, 20 Jan 2023 10:54:56 +0000
Date: Fri, 20 Jan 2023 18:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tadeusz Struk <tadeusz.struk@linaro.org>
Subject: [stable:linux-5.10.y 4228/9999] s390x-linux-ld:
 dw-axi-dmac-platform.c:undefined reference to `devm_ioremap_resource'
Message-ID: <202301201809.HDefVwZr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   3a9f1b907bc434a91f0d295533d2c7e3758efe92
commit: 58823a9b097cf36dd59c4d463396e15a5ec4efb7 [4228/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: s390-buildonly-randconfig-r003-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201809.HDefVwZr-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=58823a9b097cf36dd59c4d463396e15a5ec4efb7
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 58823a9b097cf36dd59c4d463396e15a5ec4efb7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390x-linux-ld: drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.o: in function `dw_probe':
   dw-axi-dmac-platform.c:(.text+0x142): undefined reference to `devm_ioremap_resource'
>> s390x-linux-ld: dw-axi-dmac-platform.c:(.text+0xb7c): undefined reference to `devm_ioremap_resource'
   s390x-linux-ld: drivers/dma/qcom/hidma.o: in function `hidma_probe':
   hidma.c:(.text+0x44): undefined reference to `devm_ioremap_resource'
   s390x-linux-ld: hidma.c:(.text+0x82): undefined reference to `devm_ioremap_resource'
   s390x-linux-ld: drivers/input/serio/apbps2.o: in function `apbps2_of_probe':
   apbps2.c:(.text+0x60): undefined reference to `devm_ioremap_resource'
   s390x-linux-ld: drivers/crypto/ccree/cc_driver.o:cc_driver.c:(.text+0x8bc): more undefined references to `devm_ioremap_resource' follow
   s390x-linux-ld: drivers/crypto/ccree/cc_debugfs.o: in function `cc_debugfs_init':
   cc_debugfs.c:(.text+0x136): undefined reference to `debugfs_create_regset32'
   s390x-linux-ld: cc_debugfs.c:(.text+0x2b4): undefined reference to `debugfs_create_regset32'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
