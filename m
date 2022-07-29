Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6257A
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 02:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659060308; x=1690596308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0FDsnkvuKpibACcfa0olyd8Hk43wGB7lDn4D5TjKdPU=;
  b=VWMANLiZklfHZ1STbUhglr/LbKkfigvwYXfrtJw7jluSFPX+AQ3C4RrG
   eZ7BKmiJGGF40KnqZfn3qzpQO2eXAunUaXFK9dMiTjYLNLm3pODmQDNMS
   kTB8rZqCU1LKMW79U0nRrUTXdB2fqfIc2GIClL+IXXjGJbHfn9zcOVXJZ
   4Bxn8vbvQupPiBwzEPeHBld9PSXbQMNpExM1mgsc7n9MrI4bUnECrWAfL
   0XmLw9BxaTjI7tTvT65BiZ2XRj1E+QpWTuJKIZQV1Xzqt77QBJRFqoXFL
   RMmAiqpCXdFlIhUTsMpVCcHNkWBLXPJmweNZKaGZ2gOMG4L+egjJx1LDc
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="275551417"
X-IronPort-AV: E=Sophos;i="5.93,200,1654585200"; 
   d="scan'208";a="275551417"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 19:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,200,1654585200"; 
   d="scan'208";a="576758980"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2022 19:05:06 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHFNB-000Ask-2I;
	Fri, 29 Jul 2022 02:05:05 +0000
Date: Fri, 29 Jul 2022 10:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 8/9] clk: qcom: gcc-sdm845: Switch to macros to collapse
 rcg2 clocks definitions
Message-ID: <202207290958.UwizN6Ot-lkp@intel.com>
References: <20220726142303.4126434-9-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726142303.4126434-9-abel.vesa@linaro.org>

Hi Abel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/clk-qcom-gcc-sdm845-Swicth-from-expanded-definitions-to-compact-macros/20220726-222615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm64-buildonly-randconfig-r004-20220726 (https://download.01.org/0day-ci/archive/20220729/202207290958.UwizN6Ot-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 83882606dbd7ffb0bdd3460356202d97705809c8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/23ba361c478806bde48e3f572ae428dcc8adf3e6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abel-Vesa/clk-qcom-gcc-sdm845-Swicth-from-expanded-definitions-to-compact-macros/20220726-222615
        git checkout 23ba361c478806bde48e3f572ae428dcc8adf3e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/gcc-sdm845.c:171:37: warning: unused variable 'gcc_parent_data_8' [-Wunused-const-variable]
   static const struct clk_parent_data gcc_parent_data_8[] = {
                                       ^
   1 warning generated.


vim +/gcc_parent_data_8 +171 drivers/clk/qcom/gcc-sdm845.c

06391eddb60aa2 Taniya Das       2018-05-07  170  
ea434d7a92ce02 Dmitry Baryshkov 2021-04-09 @171  static const struct clk_parent_data gcc_parent_data_8[] = {
ea434d7a92ce02 Dmitry Baryshkov 2021-04-09  172  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
ea434d7a92ce02 Dmitry Baryshkov 2021-04-09  173  	{ .hw = &gpll0.clkr.hw },
ea434d7a92ce02 Dmitry Baryshkov 2021-04-09  174  	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
06391eddb60aa2 Taniya Das       2018-05-07  175  };
06391eddb60aa2 Taniya Das       2018-05-07  176  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
