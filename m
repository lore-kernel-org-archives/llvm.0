Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4538C168
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 07:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640158481; x=1671694481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=83WKMpgmd2Hu6tY0NSHF4KKHcftxqykMjMZPEZ1Wo/c=;
  b=D/D62YsGJWNzjp9fxkMtrU3dRTsEIKYZ7K0gB17jcUKXDI64MRtWbI8Y
   o7T1H5q6jSd++uUHWdCchAC14M+x1X0jsR7ZVB02/jNq6VYSzr7giuaux
   2uUADf0SDDehz4VzGneECKFPaytG+M8nBBwHWABHkVF3cJP/WiNprrnFf
   NgU9wIjUi+K24ZYVT4AX6isSDwRxVTCAPC4HNGKOLKwI30c0vy1ZpuNSN
   IiH4T6yY1jOuhpUaKVhVPEcXecdzvBFSCOn76Iteh6kCpArvS/GuwjYsb
   LOYpPlENvjqiYOH/aBJ19UCAsxUsamFTGASQToCe+Jh8rgNG/Tp0DnehN
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240789998"
X-IronPort-AV: E=Sophos;i="5.88,225,1635231600"; 
   d="scan'208";a="240789998"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 23:34:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,225,1635231600"; 
   d="scan'208";a="684933256"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Dec 2021 23:34:37 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzw8z-0000FN-12; Wed, 22 Dec 2021 07:34:37 +0000
Date: Wed, 22 Dec 2021 15:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [andersson:wip/sm8350-next-20211215 24/35]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1040:37: warning: unused
 variable 'sm8350_regdma'
Message-ID: <202112221505.c3wIxSKR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/andersson/kernel wip/sm8350-next-20211215
head:   525164cde506e9a9353b07816e50e26685e57fe4
commit: 54ccddafd25a1a96ca276ffe86c96c41fcc98b80 [24/35] drm/msm/dpu: Fix typo in sm8350 hw_catalog
config: hexagon-randconfig-r041-20211222 (https://download.01.org/0day-ci/archive/20211222/202112221505.c3wIxSKR-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project de4e0195ae1c39f1c3b07834b8e32c113f4f20eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/andersson/kernel/commit/54ccddafd25a1a96ca276ffe86c96c41fcc98b80
        git remote add andersson https://github.com/andersson/kernel
        git fetch --no-tags andersson wip/sm8350-next-20211215
        git checkout 54ccddafd25a1a96ca276ffe86c96c41fcc98b80
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1040:37: warning: unused variable 'sm8350_regdma' [-Wunused-const-variable]
   static const struct dpu_reg_dma_cfg sm8350_regdma = {
                                       ^
   1 warning generated.


vim +/sm8350_regdma +1040 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

af776a3e1c304bf Jonathan Marek 2020-07-10  1039  
2fee5af852f1b5e Robert Foss    2021-06-16 @1040  static const struct dpu_reg_dma_cfg sm8350_regdma = {
2fee5af852f1b5e Robert Foss    2021-06-16  1041  	.base = 0x0,
2fee5af852f1b5e Robert Foss    2021-06-16  1042  	.version = 0x00020000,
2fee5af852f1b5e Robert Foss    2021-06-16  1043  	.trigger_sel_off = 0x119c,
2fee5af852f1b5e Robert Foss    2021-06-16  1044  	.xin_id = 7,
2fee5af852f1b5e Robert Foss    2021-06-16  1045  	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
2fee5af852f1b5e Robert Foss    2021-06-16  1046  };
2fee5af852f1b5e Robert Foss    2021-06-16  1047  

:::::: The code at line 1040 was first introduced by commit
:::::: 2fee5af852f1b5e0cfacae8782b09c0a888b3488 drm/msm/dpu: Add SM8350 to hw catalog

:::::: TO: Robert Foss <robert.foss@linaro.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
