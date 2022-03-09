Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DC37A
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 06:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646806197; x=1678342197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BkddJwLaNHbRkIM03fEcB7GswNwAmU2E4YNG/vlpmOA=;
  b=Esi1fiQgFr/Ni5rwKujTrIas43uu0W95kGG95BHA5bZUUW68Iob2fbd8
   BIyNqkm6Hy5A0oPZ3v0fvhGO/iGSyfXrD9NqYiNa1sjiLgWL8NIrgzmsO
   9sK8fQ0BceM0Gg6kkLHTaWRLJ45tmZp97nD9M62rCpqhvKrg0sRKF9Rsp
   ATziQLWmZdJNc5oc0hU2tDORLBEeFBkvfp2IH2fhFCcWIuRmPO/nAskUp
   DSKDdpwWe465URBoNLvUwJcbFKl6fT2kFjzdvhLjJuekDpDxDuL36DH40
   xE0J7ruoP/TJmXe+hPWg08p+V/XqsQZSHRlDiy3ap4fI8SkKmvwKkgXxW
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="318125257"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; 
   d="scan'208";a="318125257"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 22:09:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; 
   d="scan'208";a="596161489"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2022 22:09:55 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRpWE-0002i7-BG; Wed, 09 Mar 2022 06:09:54 +0000
Date: Wed, 9 Mar 2022 14:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [andersson:tuxsuite 33/42]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1405:37: warning: unused
 variable 'sm8350_regdma'
Message-ID: <202203091451.k8xPf3xI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/andersson/kernel tuxsuite
head:   d1c9502cfe160da3c09a0f379147f16d559e4ab7
commit: 263030b81c7535a746e774fd5fcba7b5e30b3180 [33/42] drm/msm/dpu: Fix typo in sm8350 hw_catalog
config: riscv-randconfig-r042-20220307 (https://download.01.org/0day-ci/archive/20220309/202203091451.k8xPf3xI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/andersson/kernel/commit/263030b81c7535a746e774fd5fcba7b5e30b3180
        git remote add andersson https://github.com/andersson/kernel
        git fetch --no-tags andersson tuxsuite
        git checkout 263030b81c7535a746e774fd5fcba7b5e30b3180
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/ drivers/dma/ drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1405:37: warning: unused variable 'sm8350_regdma' [-Wunused-const-variable]
   static const struct dpu_reg_dma_cfg sm8350_regdma = {
                                       ^
   1 warning generated.


vim +/sm8350_regdma +1405 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

af776a3e1c304bf Jonathan Marek 2020-07-10  1404  
b3a92bed29f97a8 Robert Foss    2021-06-16 @1405  static const struct dpu_reg_dma_cfg sm8350_regdma = {
b3a92bed29f97a8 Robert Foss    2021-06-16  1406  	.base = 0x0,
b3a92bed29f97a8 Robert Foss    2021-06-16  1407  	.version = 0x00020000,
b3a92bed29f97a8 Robert Foss    2021-06-16  1408  	.trigger_sel_off = 0x119c,
b3a92bed29f97a8 Robert Foss    2021-06-16  1409  	.xin_id = 7,
b3a92bed29f97a8 Robert Foss    2021-06-16  1410  	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
b3a92bed29f97a8 Robert Foss    2021-06-16  1411  };
b3a92bed29f97a8 Robert Foss    2021-06-16  1412  

:::::: The code at line 1405 was first introduced by commit
:::::: b3a92bed29f97a812160786819bf18c2cc590cc9 drm/msm/dpu: Add SM8350 to hw catalog

:::::: TO: Robert Foss <robert.foss@linaro.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
