Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891323D4D;
	Fri, 12 May 2023 19:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683919736; x=1715455736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ikTRTlGb8lRy3CXJymmR5K36PUxRrpLiiTB3mC3SWu8=;
  b=C0UoBJaXUXsWzPUktzssFevJIZ8mHBiYfDn1HcQEHShNFRh/Ys4w4XoY
   1l1L8BTrN8OFANaKYwYkDz9Je7DJO+Axdw549W1k+A96Upch5P7irQYDk
   zycB1VMwm1rU9gUya9ypOJ/I8XyEllg/oFJH2kwKI4vWW3Z9VgromrrxO
   8bEFuWomWHRv6Vm93TFAwe9GiITs07gP7bgJ8iUYPolNJJrEMGiFyR08C
   lrH9gigQHFT7ojmWMtAGN3D4/HC1aSmul2akfe3SJ6mSzhYzDTUJj/6a3
   DDjk/7jRpShQ9Xq7fyJjzBW/P2l/MZQsELKBlNAZoWI6WURaI8ozuKJCU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349711807"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="349711807"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 12:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="874492241"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="874492241"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 May 2023 12:28:54 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxYRi-00053w-05;
	Fri, 12 May 2023 19:28:54 +0000
Date: Sat, 13 May 2023 03:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [superna9999:amlogic/v6.4/upstream/dsi-ccf-vim3 7/17]
 drivers/clk/meson/g12a.c:3272:8: warning: suggest braces around
 initialization of subobject
Message-ID: <202305130354.w2d1SNhw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/superna9999/linux amlogic/v6.4/upstream/dsi-ccf-vim3
head:   d7317adadf4b5ed2dcca853d6c3ece2f9172f86a
commit: 45f494e94304b4838f2b5c8df6a75657f2011134 [7/17] clk: meson: add code to setup VCLK2/DSI clocks
config: arm64-randconfig-r023-20230509 (https://download.01.org/0day-ci/archive/20230513/202305130354.w2d1SNhw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/superna9999/linux/commit/45f494e94304b4838f2b5c8df6a75657f2011134
        git remote add superna9999 https://github.com/superna9999/linux
        git fetch --no-tags superna9999 amlogic/v6.4/upstream/dsi-ccf-vim3
        git checkout 45f494e94304b4838f2b5c8df6a75657f2011134
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/meson/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130354.w2d1SNhw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/meson/g12a.c:3272:8: warning: suggest braces around initialization of subobject [-Wmissing-braces]
           .nb = g12a_vclk_div_notifier_cb,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
                 {                        }
   drivers/clk/meson/g12a.c:3335:8: warning: suggest braces around initialization of subobject [-Wmissing-braces]
           .nb = g12a_vclk_notifier_cb,
                 ^~~~~~~~~~~~~~~~~~~~~
                 {                    }
   2 warnings generated.


vim +3272 drivers/clk/meson/g12a.c

  3266	
  3267	static struct g12a_vclk_div_notifier g12a_vclk2_div_data = {
  3268		.clk = &g12a_vclk2_div,
  3269		.offset = HHI_VIID_CLK_DIV,
  3270		.en_bit_idx = 16,
  3271		.reset_bit_idx = 17,
> 3272		.nb = g12a_vclk_div_notifier_cb,
  3273	};
  3274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
