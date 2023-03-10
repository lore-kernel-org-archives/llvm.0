Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177208838;
	Fri, 10 Mar 2023 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678464866; x=1710000866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z5E2AiPAcKmUYJ9sAxHNV60/63xTzAyPUkJDDPYWd7k=;
  b=ZEJ1NiKedYK0uGKg1jJiN3+UhVWLmHUHWQ1m5Th0eIZxH9NtQl56+MEp
   mdzxnZfk9DgfAvyMrbdAvndp3KDbJZcKjVp4HJaJuTNeXbqa7NdnWpDAr
   SzkkGTJpG3moS/J3vMlaXx/fu4QS0dxi186P/bAHUiQ2oEBvaZh2rqsCU
   IFIwJPX/q/YhtwUvVgVIrOM9BVx2SiM0zWkxiQxIVoLVAr7INduAUkk91
   THaS5K7OO1wiTJULw9QoGuJwc43KaNygoJLe1Rgs/HkY8K1l7/NBTH+Bm
   GZhxvkC26HHHU0pc2GVDV5miVSQD/jRc9MrUYsv9/2iHEbSyYzFSftzj5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="401623867"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="401623867"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 08:14:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="1007166194"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="1007166194"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Mar 2023 08:14:24 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pafNv-0003zD-1g;
	Fri, 10 Mar 2023 16:14:23 +0000
Date: Sat, 11 Mar 2023 00:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 334/652] drivers/clk/qcom/clk-cpu-8996.c:532:2: warning: unannotated
 fall-through between switch labels
Message-ID: <202303110055.TADpWl6c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

FYI, the error/warning still remains.

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   eb6e11ca9bd3d6242c6afa7616b837ccd2a404b5
commit: 27dbfad00558825ed04e50b4fc1cafb23192b3c1 [334/652] clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb
config: arm64-randconfig-r032-20230310 (https://download.01.org/0day-ci/archive/20230311/202303110055.TADpWl6c-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/krzk/linux/commit/27dbfad00558825ed04e50b4fc1cafb23192b3c1
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 27dbfad00558825ed04e50b4fc1cafb23192b3c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110055.TADpWl6c-lkp@intel.com/

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
