Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2297D8BF3;
	Wed,  8 Mar 2023 19:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678303079; x=1709839079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qO80AhO2kI+06ydQkDAoiL+qq7Q2OfJ6E5bvNX9iU58=;
  b=O1QWwgPRhdK4lEatRN02fIpS5OSpBc9Ad5rh/Wa/fBdCs6dKuRh3o6ya
   Fg8j2yxyNsXSl2HwFbQCFGPtyqyxuuUJt/RldTzZidVAPjF5BBAYl3la+
   zRXLF2Z/6pu4O1vV+xCemnMQY2whWM9HWai6P33DMDnI1Jw6IJeTMZxDQ
   c0r6ACcvA7ZJaCbTI8C+izWYV5AeM76FSCvwkDH9qjBfcqpy9ztjZxByb
   v3yyw3I4DaujTgEhlEV+bFU3JzmKY5hWpTUK6x++8/pQihMfJP7BM8aqP
   Mzb8c5r2de2M44Nrn04MzsjkjWEK8sAn6emxGRNJ+kXrvcvai14W1QLhM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337776082"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="337776082"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 11:17:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627051078"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="627051078"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2023 11:17:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZzIR-0002MD-37;
	Wed, 08 Mar 2023 19:17:55 +0000
Date: Thu, 9 Mar 2023 03:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 6169/9999]
 drivers/gpu/drm/vc4/vc4_dsi.c:617:35: warning: unused variable 'dsi0_regs'
Message-ID: <202303090324.xCkA2JRm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maxime,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   9fd42770b50756c08f04b4070ab6572adb2d6e1b
commit: 6cc1edddcf02f69664887ea7ed4b604481ae300e [6169/9999] drm/vc4: dsi: Introduce a variant structure
config: hexagon-buildonly-randconfig-r004-20230308 (https://download.01.org/0day-ci/archive/20230309/202303090324.xCkA2JRm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=6cc1edddcf02f69664887ea7ed4b604481ae300e
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 6cc1edddcf02f69664887ea7ed4b604481ae300e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/vc4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090324.xCkA2JRm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_dsi.c:617:35: warning: unused variable 'dsi0_regs' [-Wunused-const-variable]
   static const struct debugfs_reg32 dsi0_regs[] = {
                                     ^
   1 warning generated.


vim +/dsi0_regs +617 drivers/gpu/drm/vc4/vc4_dsi.c

4078f5757144234 Eric Anholt 2017-01-31  616  
3051719af11eb48 Eric Anholt 2019-02-20 @617  static const struct debugfs_reg32 dsi0_regs[] = {
3051719af11eb48 Eric Anholt 2019-02-20  618  	VC4_REG32(DSI0_CTRL),
3051719af11eb48 Eric Anholt 2019-02-20  619  	VC4_REG32(DSI0_STAT),
3051719af11eb48 Eric Anholt 2019-02-20  620  	VC4_REG32(DSI0_HSTX_TO_CNT),
3051719af11eb48 Eric Anholt 2019-02-20  621  	VC4_REG32(DSI0_LPRX_TO_CNT),
3051719af11eb48 Eric Anholt 2019-02-20  622  	VC4_REG32(DSI0_TA_TO_CNT),
3051719af11eb48 Eric Anholt 2019-02-20  623  	VC4_REG32(DSI0_PR_TO_CNT),
3051719af11eb48 Eric Anholt 2019-02-20  624  	VC4_REG32(DSI0_DISP0_CTRL),
3051719af11eb48 Eric Anholt 2019-02-20  625  	VC4_REG32(DSI0_DISP1_CTRL),
3051719af11eb48 Eric Anholt 2019-02-20  626  	VC4_REG32(DSI0_INT_STAT),
3051719af11eb48 Eric Anholt 2019-02-20  627  	VC4_REG32(DSI0_INT_EN),
3051719af11eb48 Eric Anholt 2019-02-20  628  	VC4_REG32(DSI0_PHYC),
3051719af11eb48 Eric Anholt 2019-02-20  629  	VC4_REG32(DSI0_HS_CLT0),
3051719af11eb48 Eric Anholt 2019-02-20  630  	VC4_REG32(DSI0_HS_CLT1),
3051719af11eb48 Eric Anholt 2019-02-20  631  	VC4_REG32(DSI0_HS_CLT2),
3051719af11eb48 Eric Anholt 2019-02-20  632  	VC4_REG32(DSI0_HS_DLT3),
3051719af11eb48 Eric Anholt 2019-02-20  633  	VC4_REG32(DSI0_HS_DLT4),
3051719af11eb48 Eric Anholt 2019-02-20  634  	VC4_REG32(DSI0_HS_DLT5),
3051719af11eb48 Eric Anholt 2019-02-20  635  	VC4_REG32(DSI0_HS_DLT6),
3051719af11eb48 Eric Anholt 2019-02-20  636  	VC4_REG32(DSI0_HS_DLT7),
3051719af11eb48 Eric Anholt 2019-02-20  637  	VC4_REG32(DSI0_PHY_AFEC0),
3051719af11eb48 Eric Anholt 2019-02-20  638  	VC4_REG32(DSI0_PHY_AFEC1),
3051719af11eb48 Eric Anholt 2019-02-20  639  	VC4_REG32(DSI0_ID),
4078f5757144234 Eric Anholt 2017-01-31  640  };
4078f5757144234 Eric Anholt 2017-01-31  641  

:::::: The code at line 617 was first introduced by commit
:::::: 3051719af11eb48dc8947826cfb66dbe0f281c7d drm/vc4: Use drm_print_regset32() for our debug register dumping.

:::::: TO: Eric Anholt <eric@anholt.net>
:::::: CC: Eric Anholt <eric@anholt.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
