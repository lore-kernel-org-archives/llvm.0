Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5E47C;
	Thu,  4 May 2023 03:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683171588; x=1714707588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dsQcmKbYZXf2UuY5dEl6DNe64J4x62YVEs9O1kzwEa8=;
  b=B9laHwba0n7iVVy36hA61wpdxVtJRg7Cv02Rk0RZPtgbbJOtD+jTr4uR
   FosyBasvxEBuLwb3GuoW2rQhZrMH8/TPTX6PFlu9CSE1qAkfUXg97P9m/
   rQpnwrg3M/9JNITBZtl5GJ9RKWojjq1ppIwNP0SrYWZJxv55BDUyuaPZp
   z7sMcSyiJ4s0dylbFZKehi5zkhj3K1tSO3F+UeGvt3K3ol63+kNLmvKze
   ztnHOPE0Mz61GjMzOjiBPP0OPAAS5H7B/IgRLoBTsg8QBr3tkUK1umgmd
   JWjysh15lLeuWo0SJvVj4IdjMUfoStcqAKBCTEeEx5LwIiRKAhIK7wMxX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348869735"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="348869735"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 20:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="871199392"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="871199392"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 May 2023 20:39:45 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puPon-0002WK-01;
	Thu, 04 May 2023 03:39:45 +0000
Date: Thu, 4 May 2023 11:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 5083/9999]
 drivers/gpu/drm/vc4/vc4_dsi.c:617:35: warning: unused variable 'dsi0_regs'
Message-ID: <202305041150.phd1FixR-lkp@intel.com>
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
head:   f1b32fda06d2cfb8eea9680b0ba7a8b0d5b81eeb
commit: 6cc1edddcf02f69664887ea7ed4b604481ae300e [5083/9999] drm/vc4: dsi: Introduce a variant structure
config: riscv-randconfig-r025-20230503 (https://download.01.org/0day-ci/archive/20230504/202305041150.phd1FixR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=6cc1edddcf02f69664887ea7ed4b604481ae300e
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 6cc1edddcf02f69664887ea7ed4b604481ae300e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/vc4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041150.phd1FixR-lkp@intel.com/

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
