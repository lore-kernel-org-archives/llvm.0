Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE1F1392
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 20:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653511038; x=1685047038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t8SjK44JIzEd/n+YfaHvSfSWIm2sEi69oVRkadDgaeY=;
  b=WVqphQ3VLfrCY5h5nL4Frh7gI3+OVNH2zl5JD80Vc1g3dm0RODAas4JX
   XFnOSSzCm9r0VPZv2UI1/iOAaPRTmWI1eT+rOL2KMOCNWTC2LvsMglxVq
   ZDxzfcaIYldV9q+86KDRhvfIC1rvLbyQA3vmXJ5odCU1qhVh/tDNOkWR6
   FnWk/3ad+S4JnIgSadStezACNcdV/icBXFgddGACG/3eYJX1ZoqLUw3zR
   e0AUK/iPhPIQ2+OP03TqJ7dGSBs8itu2bOU4TLitYh1w+fQxYkii2eq2d
   kCBJKyL5nDyYLsPfOhq6aqMEK9LE+/IKIXL3Ac6Y2EPzJ0fXLlYzjmbEP
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="273656812"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="273656812"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 13:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="527027308"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 May 2022 13:37:16 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntxkp-0003Ia-DA;
	Wed, 25 May 2022 20:37:15 +0000
Date: Thu, 26 May 2022 04:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/pinctrl/meson/pinctrl-meson-s4.c:178:27: warning: unused
 variable 'tdm_sclk1_c_pins'
Message-ID: <202205260425.ZVzHhy0e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qianggui,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   64e34b50d7aeee7082287ec39f9d34d4e60f3a04
commit: 775214d389c259c77ff2b4de50bdaab5c9bd5db3 pinctrl: meson: add pinctrl driver support for Meson-S4 Soc
date:   4 months ago
config: arm64-randconfig-r006-20220524 (https://download.01.org/0day-ci/archive/20220526/202205260425.ZVzHhy0e-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d52a6e75b0c402c7f3b42a2b1b2873f151220947)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=775214d389c259c77ff2b4de50bdaab5c9bd5db3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 775214d389c259c77ff2b4de50bdaab5c9bd5db3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pinctrl/meson/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/meson/pinctrl-meson-s4.c:178:27: warning: unused variable 'tdm_sclk1_c_pins' [-Wunused-const-variable]
   static const unsigned int tdm_sclk1_c_pins[]            = { GPIOC_3 };
                             ^
   1 warning generated.


vim +/tdm_sclk1_c_pins +178 drivers/pinctrl/meson/pinctrl-meson-s4.c

   173	
   174	/* Bank C func4 */
   175	static const unsigned int tdm_d2_c_pins[]		= { GPIOC_0 };
   176	static const unsigned int tdm_d3_c_pins[]		= { GPIOC_1 };
   177	static const unsigned int tdm_fs1_c_pins[]		= { GPIOC_2 };
 > 178	static const unsigned int tdm_sclk1_c_pins[]		= { GPIOC_3 };
   179	static const unsigned int mclk_1_c_pins[]		= { GPIOC_4 };
   180	static const unsigned int tdm_d4_c_pins[]		= { GPIOC_5 };
   181	static const unsigned int tdm_d5_c_pins[]		= { GPIOC_6 };
   182	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
