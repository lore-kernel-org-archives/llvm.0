Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D3036E;
	Sun, 25 Dec 2022 02:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671933776; x=1703469776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YwxoLv8DOn+CuLYemivbJcLZeB4wZvnghH+PIaDiw4Q=;
  b=K28YppoIbp0NLONl0LQFmoy6yNIm7v6eOK9u/ld/u5sGeLKw3kbuyLa/
   pcmS24qaG2f985t5biJ6RePyuBq2ksxvKMjrI+8I5YTNjXNTl9aoFPBky
   o0/BcbzqEgGDC2DR9umRYXABg98Zegwu1Srz0hBJj8oE3sUtaY0htyi1X
   Ec8mDwFOVkjD8V2FYP+XqqUUv/YSfN/fap9VVqb3n45MPHaLeKWa8WnJE
   92FzwsG+J/BvQMMOyv3sajJyrwWUkM8GynIuejyMIaD28z+5yoEmXMZTQ
   8VK5v+8ysWqleyC0GECaS0SBH/eo51H1aLmmBMj0lhzkoaGycZsNcsm4y
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="320528582"
X-IronPort-AV: E=Sophos;i="5.96,272,1665471600"; 
   d="scan'208";a="320528582"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2022 18:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="776625247"
X-IronPort-AV: E=Sophos;i="5.96,272,1665471600"; 
   d="scan'208";a="776625247"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Dec 2022 18:02:53 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p9GLk-000DgN-1K;
	Sun, 25 Dec 2022 02:02:52 +0000
Date: Sun, 25 Dec 2022 10:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-test-stm32-cryp 7/7]
 drivers/crypto/Kconfig:400: can't open file "drivers/crypto/ux500/Kconfig"
Message-ID: <202212250925.kJBDWMhg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-test-stm32-cryp
head:   4cd90320805b656001bfde1428b002972b857e1a
commit: 4cd90320805b656001bfde1428b002972b857e1a [7/7] crypto: ux500/hash - delete driver
config: hexagon-randconfig-r045-20221225 (attached as .config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project f5700e7b69048de958172fb513b336564e7f8709)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?id=4cd90320805b656001bfde1428b002972b857e1a
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-test-stm32-cryp
        git checkout 4cd90320805b656001bfde1428b002972b857e1a
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=hexagon 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/crypto/Kconfig:400: can't open file "drivers/crypto/ux500/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: oldconfig] Error 1
   make[1]: *** [Makefile:708: oldconfig] Error 2
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/crypto/Kconfig:400: can't open file "drivers/crypto/ux500/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: olddefconfig] Error 1
   make[1]: *** [Makefile:708: olddefconfig] Error 2
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +400 drivers/crypto/Kconfig

aef7b31c8833e7d Kent Yoder     2012-04-12  392  
2789c08fffeae27 Andreas Westin 2012-04-30  393  config CRYPTO_DEV_UX500
2789c08fffeae27 Andreas Westin 2012-04-30  394  	tristate "Driver for ST-Ericsson UX500 crypto hardware acceleration"
2789c08fffeae27 Andreas Westin 2012-04-30  395  	depends on ARCH_U8500
2789c08fffeae27 Andreas Westin 2012-04-30  396  	help
2789c08fffeae27 Andreas Westin 2012-04-30  397  	  Driver for ST-Ericsson UX500 crypto engine.
2789c08fffeae27 Andreas Westin 2012-04-30  398  
2789c08fffeae27 Andreas Westin 2012-04-30  399  if CRYPTO_DEV_UX500
2789c08fffeae27 Andreas Westin 2012-04-30 @400  	source "drivers/crypto/ux500/Kconfig"
2789c08fffeae27 Andreas Westin 2012-04-30  401  endif # if CRYPTO_DEV_UX500
2789c08fffeae27 Andreas Westin 2012-04-30  402  

:::::: The code at line 400 was first introduced by commit
:::::: 2789c08fffeae270820dda5d096634aecc810af5 crypto: ux500 - Add driver for CRYP hardware

:::::: TO: Andreas Westin <andreas.westin@stericsson.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
