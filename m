Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F72D516;
	Fri, 10 Mar 2023 17:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678470987; x=1710006987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VvUPlZRVbPSx0drls/cN0OLtZdAtuZByVDC9J3grKLo=;
  b=PebZJ0DWZQNUnYG8uCJ/YBIwBsWIvakbJ7v4Uxu/gKfkuAWMasKc0acN
   FunGbhDnF1p+czNmlthMTlfK5JcOb3EzNFxk0BaiSfcZisbp7QpBLBSpd
   X8JXxJzY1a7CKagmGarNFRL36cQewjn2BMFBtcWts1xjwZyCe4jyprnW+
   bBqhEzySNbcKDtQEBL8e9RZw281bsrmvVTU34NiZ3eQEdECO+ZWXmFeSX
   en5fC9uLNAKfRJ3hLmf8V/T0Sg3SYhOWT4eGrU+Hh8/hL8gzLrvpWa6Cy
   qjeH369jFOrCOPsJp3q4unJhKB6SAVYyHLt90uF2qffYKOz0kK2tkrlB7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="325143599"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="325143599"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 09:56:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788110877"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="788110877"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2023 09:56:26 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pagyf-000427-1Z;
	Fri, 10 Mar 2023 17:56:25 +0000
Date: Sat, 11 Mar 2023 01:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 342/652] drivers/clk/qcom/clk-cbf-8996.c:193:7: warning: variable 'ret' is
 used uninitialized whenever switch case is taken
Message-ID: <202303110138.rRhdggCl-lkp@intel.com>
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
commit: 46e36546fa73cea293ad26c84a0316bf435d95a3 [342/652] clk: qcom: cbf-8996: rework cbf_clk_notifier_cb
config: arm64-randconfig-r032-20230310 (https://download.01.org/0day-ci/archive/20230311/202303110138.rRhdggCl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/krzk/linux/commit/46e36546fa73cea293ad26c84a0316bf435d95a3
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 46e36546fa73cea293ad26c84a0316bf435d95a3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110138.rRhdggCl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/clk-cbf-8996.c:193:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case ABORT_RATE_CHANGE:
                ^~~~~~~~~~~~~~~~~
   include/linux/clk.h:41:28: note: expanded from macro 'ABORT_RATE_CHANGE'
   #define ABORT_RATE_CHANGE               BIT(2)
                                           ^~~~~~
   include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                   ^~~~~~~~~~~~~~~
   drivers/clk/qcom/clk-cbf-8996.c:204:29: note: uninitialized use occurs here
           return notifier_from_errno(ret);
                                      ^~~
   drivers/clk/qcom/clk-cbf-8996.c:180:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case PRE_RATE_CHANGE:
                ^~~~~~~~~~~~~~~
   include/linux/clk.h:39:27: note: expanded from macro 'PRE_RATE_CHANGE'
   #define PRE_RATE_CHANGE                 BIT(0)
                                           ^~~~~~
   include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                   ^~~~~~~~~~~~~~~
   drivers/clk/qcom/clk-cbf-8996.c:204:29: note: uninitialized use occurs here
           return notifier_from_errno(ret);
                                      ^~~
   drivers/clk/qcom/clk-cbf-8996.c:177:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   2 warnings generated.


vim +/ret +193 drivers/clk/qcom/clk-cbf-8996.c

   172	
   173	static int cbf_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
   174				       void *data)
   175	{
   176		struct clk_notifier_data *cnd = data;
   177		int ret;
   178	
   179		switch (event) {
   180		case PRE_RATE_CHANGE:
   181			/*
   182			 * Avoid overvolting. clk_core_set_rate_nolock() walks from top
   183			 * to bottom, so it will change the rate of the PLL before
   184			 * chaging the parent of PMUX. This can result in pmux getting
   185			 * clocked twice the expected rate.
   186			 *
   187			 * Manually switch to PLL/2 here.
   188			 */
   189			if (cnd->old_rate > DIV_THRESHOLD &&
   190			    cnd->new_rate < DIV_THRESHOLD)
   191				clk_cbf_8996_mux_set_parent(&cbf_mux.clkr.hw, CBF_DIV_INDEX);
   192			break;
 > 193		case ABORT_RATE_CHANGE:
   194			/* Revert manual change */
   195			if (cnd->new_rate < DIV_THRESHOLD &&
   196			    cnd->old_rate > DIV_THRESHOLD)
   197				clk_cbf_8996_mux_set_parent(&cbf_mux.clkr.hw, CBF_PLL_INDEX);
   198			break;
   199		default:
   200			ret = 0;
   201			break;
   202		}
   203	
   204		return notifier_from_errno(ret);
   205	};
   206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
