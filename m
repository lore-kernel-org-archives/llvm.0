Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BBA137B
	for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659007037; x=1690543037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DtIM29pjTxa4VPaINN54wUy0i5N0ICSLry3uEWs/U2Q=;
  b=hzMluipJCl0Zh9VMn9/S48RIhob4w2oiUSSJ0KCxstyc0YGXpW66gFB8
   a+CT9Lx6We16Cl3kUXYbzDhXJmx5yH1o2GI2RcfzSlocOlJyW+WT8uGeF
   2mevgQqTb7l4LfNtiZ9IPWuE+HwNeG3uSp/oefuOKw7UvEYXCQ8wrx6tn
   SjZnEWpY9byAdRynBpmQLH4PzZQ2CgIlr8RL+0AIQRsR35qkqVwSlOuuf
   cZbbidDhsOsP7lwW8i//jgquxgvn5ugMx6b4kDoj48y3apxJGxTM2CUAW
   K74kcjL9HwFNHF7IDXhIaOIUnR7GRAxO1g2gDBg6aEHi3JQ0h9o2aoDyo
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="289682615"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="289682615"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 04:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="551266936"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Jul 2022 04:17:07 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oH1Vq-0009vO-1j;
	Thu, 28 Jul 2022 11:17:06 +0000
Date: Thu, 28 Jul 2022 19:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Subject: [steev:sc8280xp-next-20220722 14/141]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1535:37: warning: unused
 variable 'sc8280xp_regdma'
Message-ID: <202207281931.tLjk8lkA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux sc8280xp-next-20220722
head:   05eac286762272a5a2e5a5cd797ecb08b8e92741
commit: 64ab2ccaef7b7adf21c879bae5090e8c0a60135a [14/141] drm/msm/dpu: Introduce sc8280xp
config: arm64-randconfig-r003-20220728 (https://download.01.org/0day-ci/archive/20220728/202207281931.tLjk8lkA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/steev/linux/commit/64ab2ccaef7b7adf21c879bae5090e8c0a60135a
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev sc8280xp-next-20220722
        git checkout 64ab2ccaef7b7adf21c879bae5090e8c0a60135a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1535:37: warning: unused variable 'sc8280xp_regdma' [-Wunused-const-variable]
   static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
                                       ^
   1 warning generated.


vim +/sc8280xp_regdma +1535 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

  1534	
> 1535	static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
  1536		.base = 0x0,
  1537		.version = 0x00020000,
  1538		.trigger_sel_off = 0x119c,
  1539		.xin_id = 7,
  1540		.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
  1541	};
  1542	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
