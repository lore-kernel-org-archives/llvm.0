Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58E51FB5;
	Wed, 22 Feb 2023 08:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677053387; x=1708589387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gQfR21wEOq0Fuy+tIgU1Ij6yg4S+Gs30Ki52dG6cKsA=;
  b=RscwV0CX9ty3f8mEKQU6SYiapiGn6NHmJswQuWUh874mfs2vTi+4cRIL
   t74bU7rvyfQn67RdpaujUUTppA9vt0is10UjOqeb3ahuZ5sVXc0H9Ix1p
   uNIc1x7j6M3t+ohlaGY4JiJdlZNYdxQCX/O18KJeEaXOsZNKf01YMjuMo
   yYxKbYrX3XEoJx+1NG5lxRAShfcN0dGHNwF6TYKG/Ueatv2ROgr/9CmzZ
   e4aewxCWli1J7WIfP7seLdI89Z45bopV3c7qt4kI1M65EiR2ZUK/KUfUV
   DLtoERXPnAUdTwgTZWuoTbDut3YjfbsdqVPZ/jQXRZOf0hicPbkScf4bO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="335060528"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="335060528"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 00:08:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="781338014"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="781338014"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2023 00:08:03 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUkAU-00009H-2F;
	Wed, 22 Feb 2023 08:08:02 +0000
Date: Wed, 22 Feb 2023 16:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steev Klimaszewski <steev@kali.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.2 9/188]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1579:37: warning: unused
 variable 'sc8280xp_regdma'
Message-ID: <202302221531.xQ65NbuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.2
head:   b9925baa3e5cf7919e9736257505a214b66dcdd2
commit: 36c3ab5c7698d3e56ab26806a8512c3a8d22f1e1 [9/188] drm/msm/dpu: Introduce SC8280XP
config: riscv-randconfig-r022-20230222 (https://download.01.org/0day-ci/archive/20230222/202302221531.xQ65NbuE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/steev/linux/commit/36c3ab5c7698d3e56ab26806a8512c3a8d22f1e1
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev lenovo-x13s-v6.2
        git checkout 36c3ab5c7698d3e56ab26806a8512c3a8d22f1e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221531.xQ65NbuE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1579:37: warning: unused variable 'sc8280xp_regdma' [-Wunused-const-variable]
   static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
                                       ^
   1 warning generated.


vim +/sc8280xp_regdma +1579 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

  1578	
> 1579	static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
  1580		.base = 0x0,
  1581		.version = 0x00020000,
  1582		.trigger_sel_off = 0x119c,
  1583		.xin_id = 7,
  1584		.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
  1585	};
  1586	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
