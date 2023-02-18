Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1433D9E;
	Sat, 18 Feb 2023 16:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676736968; x=1708272968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=32JoVkcytdpiPFHTWXsy9zNfpMofqTKdkH41HCp5PNU=;
  b=Ey9jDkepyTMllg7z98f2PANwU8uZBU7MPhMuHmcozxArrukj5T9O5iHo
   V2FI8AE6TYRvps5RPBluGUjjR0cSZ+nJb0OcYCnU22+w5hVO6Nmf01AXh
   z2Y2dEFVnaTSTCCy8Zx2Pi1FTd9vy/X2gyKyszflPiqTeZk6UG6TXE3tg
   1Q1VU7fyUwFpiscCCWIm3FIFqTAgn8g20eWwd0js+2DR202BpvzOfJ8Z6
   tSh0Ri4LXxI8v9CUwQ/2gtBI3E89B2RxkdeGg6Y4Q+OktOOvLk6+/hE5o
   ZzkTt8ocjZAmh1Y8Qga8enZLcN2AtUpAy7A9jwnXoYPft6DJc0rp5UTqR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="332187379"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="332187379"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 08:16:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="813699426"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="813699426"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2023 08:16:06 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTPsc-000CYH-0O;
	Sat, 18 Feb 2023 16:16:06 +0000
Date: Sun, 19 Feb 2023 00:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-audio-wsa881x-gpio 396/614]
 drivers/clk/qcom/clk-cpu-8996.c:532:2: warning: unannotated fall-through
 between switch labels
Message-ID: <202302190012.dSSrrBUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
head:   ab3b1a5e70c27be92944b0001d5432866887ccc0
commit: 27dbfad00558825ed04e50b4fc1cafb23192b3c1 [396/614] clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb
config: arm64-randconfig-r034-20230217 (https://download.01.org/0day-ci/archive/20230219/202302190012.dSSrrBUS-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/krzk/linux/commit/27dbfad00558825ed04e50b4fc1cafb23192b3c1
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
        git checkout 27dbfad00558825ed04e50b4fc1cafb23192b3c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190012.dSSrrBUS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/clk-cpu-8996.c:532:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/clk/qcom/clk-cpu-8996.c:532:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +532 drivers/clk/qcom/clk-cpu-8996.c

03e342dc45c9ec Loic Poulain     2020-07-03  503  
03e342dc45c9ec Loic Poulain     2020-07-03  504  static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
03e342dc45c9ec Loic Poulain     2020-07-03  505  			       void *data)
03e342dc45c9ec Loic Poulain     2020-07-03  506  {
9a9f5f9a5a0ca3 Yassine Oudjana  2022-06-21  507  	struct clk_cpu_8996_pmux *cpuclk = to_clk_cpu_8996_pmux_nb(nb);
03e342dc45c9ec Loic Poulain     2020-07-03  508  	struct clk_notifier_data *cnd = data;
03e342dc45c9ec Loic Poulain     2020-07-03  509  
03e342dc45c9ec Loic Poulain     2020-07-03  510  	switch (event) {
03e342dc45c9ec Loic Poulain     2020-07-03  511  	case PRE_RATE_CHANGE:
03e342dc45c9ec Loic Poulain     2020-07-03  512  		qcom_cpu_clk_msm8996_acd_init(base);
27dbfad0055882 Dmitry Baryshkov 2022-07-28  513  
27dbfad0055882 Dmitry Baryshkov 2022-07-28  514  		/*
27dbfad0055882 Dmitry Baryshkov 2022-07-28  515  		 * Avoid overvolting. clk_core_set_rate_nolock() walks from top
27dbfad0055882 Dmitry Baryshkov 2022-07-28  516  		 * to bottom, so it will change the rate of the PLL before
27dbfad0055882 Dmitry Baryshkov 2022-07-28  517  		 * chaging the parent of PMUX. This can result in pmux getting
27dbfad0055882 Dmitry Baryshkov 2022-07-28  518  		 * clocked twice the expected rate.
27dbfad0055882 Dmitry Baryshkov 2022-07-28  519  		 *
27dbfad0055882 Dmitry Baryshkov 2022-07-28  520  		 * Manually switch to PLL/2 here.
27dbfad0055882 Dmitry Baryshkov 2022-07-28  521  		 */
27dbfad0055882 Dmitry Baryshkov 2022-07-28  522  		if (cnd->new_rate < DIV_2_THRESHOLD &&
27dbfad0055882 Dmitry Baryshkov 2022-07-28  523  		    cnd->old_rate > DIV_2_THRESHOLD)
27dbfad0055882 Dmitry Baryshkov 2022-07-28  524  			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, SMUX_INDEX);
27dbfad0055882 Dmitry Baryshkov 2022-07-28  525  
03e342dc45c9ec Loic Poulain     2020-07-03  526  		break;
27dbfad0055882 Dmitry Baryshkov 2022-07-28  527  	case ABORT_RATE_CHANGE:
27dbfad0055882 Dmitry Baryshkov 2022-07-28  528  		/* Revert manual change */
27dbfad0055882 Dmitry Baryshkov 2022-07-28  529  		if (cnd->new_rate < DIV_2_THRESHOLD &&
27dbfad0055882 Dmitry Baryshkov 2022-07-28  530  		    cnd->old_rate > DIV_2_THRESHOLD)
27dbfad0055882 Dmitry Baryshkov 2022-07-28  531  			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ACD_INDEX);
03e342dc45c9ec Loic Poulain     2020-07-03 @532  	default:
03e342dc45c9ec Loic Poulain     2020-07-03  533  		break;
03e342dc45c9ec Loic Poulain     2020-07-03  534  	}
03e342dc45c9ec Loic Poulain     2020-07-03  535  
27dbfad0055882 Dmitry Baryshkov 2022-07-28  536  	return NOTIFY_OK;
03e342dc45c9ec Loic Poulain     2020-07-03  537  };
03e342dc45c9ec Loic Poulain     2020-07-03  538  

:::::: The code at line 532 was first introduced by commit
:::::: 03e342dc45c9ec07303953d4e4af11879be36609 clk: qcom: Add CPU clock driver for msm8996

:::::: TO: Loic Poulain <loic.poulain@linaro.org>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
