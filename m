Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DFD13AC1;
	Thu, 27 Jul 2023 12:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690460886; x=1721996886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oDB5fH1u+7MkaayvQQI9q5rBAl1d1a9kRG9MGFRm2Z4=;
  b=I95moxYZpYb5NO9jFUevfuYDjJfHH5audlFLwZudflhzt3zLg9ifN8rj
   SqG2o/fGIsUW/P8q5gWWXaj2lO+hnyoGtFfLk06HyEASQbg1NXwWRThNG
   uCw8n7cO1m+54cuXZadLzlv78Rb6Ejdgd1v0QuTCRKrVSsgJEtXLhJhoS
   QFAshe0p0K1MDvTBP8tIUjtuz+kXDDvtmlFl2DcqmgLs4YRppEXc5A3Qt
   LsgmZlNMGo41ZWwMw8+1ujjFiDFJb8zQXr+Nn2Nlo7pkom9n3Hcgyr6hL
   E/2HKKj07+WM6Do2MnKJmJrtJAkybTT2QlQkknpByKWJBBAZtk690kyTA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368310548"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="368310548"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 05:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="704161445"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="704161445"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 05:28:03 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP067-0002H1-02;
	Thu, 27 Jul 2023 12:28:03 +0000
Date: Thu, 27 Jul 2023 20:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 3594/9999]
 drivers/gpu/drm/vc4/vc4_dsi.c:617:35: warning: unused variable 'dsi0_regs'
Message-ID: <202307272055.DLQgWCti-lkp@intel.com>
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
head:   3602dbc57b556eff2456715301d35a1ef8964bba
commit: 6cc1edddcf02f69664887ea7ed4b604481ae300e [3594/9999] drm/vc4: dsi: Introduce a variant structure
config: mips-randconfig-r023-20230727 (https://download.01.org/0day-ci/archive/20230727/202307272055.DLQgWCti-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307272055.DLQgWCti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307272055.DLQgWCti-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_dsi.c:617:35: warning: unused variable 'dsi0_regs' [-Wunused-const-variable]
     617 | static const struct debugfs_reg32 dsi0_regs[] = {
         |                                   ^
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
https://github.com/intel/lkp-tests/wiki
