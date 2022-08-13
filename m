Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99375803
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660415790; x=1691951790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z9vmo3oouOg13TEelcgv+Ek1MmzLAcDcfCyaj5ae2hg=;
  b=iL7uML8AITNv4TRcBXlUcUBOQyIJgblHvmbGJ/KViWCfiSxaJMetXEh6
   UKCFM/m/AQHPcPyylQWw1gxuy+67bHtnLuC04xxaH5DsPMPIpb+/mkzcW
   0hZI5FNZhCfFgAIDBFfWK/gxvco+oE6FvH+9+Cvwi/y7H9IZfD+AFzapp
   H25fMFuSVUnFqkVePViRStAvTDcI1AAf5HmB0OcUU8POGruGGGBiHt3Je
   CMZJlFeBiHy1nuJEGffDrw7SewUCS5PDDK/lUjWJEfhuQkfxBljsxsgpm
   +NXv9fENshVqpDC9MTELGVhnzOI828LmZ7USh87YXlb2gL/PycCt6+Tuu
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="271543171"
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="271543171"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 11:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="635018771"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Aug 2022 11:36:27 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMvzn-0001zF-0O;
	Sat, 13 Aug 2022 18:36:27 +0000
Date: Sun, 14 Aug 2022 02:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [andersson:wip/sc8280xp-next-20220720-nonworking-gpu 9/143]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1535:37: warning: unused
 variable 'sc8280xp_regdma'
Message-ID: <202208140224.llj1D2O5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/andersson/kernel wip/sc8280xp-next-20220720-nonworking-gpu
head:   50749fc985b5eb2036a6139b10182a05e42ce4b0
commit: 4dc0d00149b8260bcbe5fd583b44ff1b1bbac3cd [9/143] drm/msm/dpu: Introduce sc8280xp
config: arm-defconfig (https://download.01.org/0day-ci/archive/20220814/202208140224.llj1D2O5-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 3329cec2f79185bafd678f310fafadba2a8c76d2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/andersson/kernel/commit/4dc0d00149b8260bcbe5fd583b44ff1b1bbac3cd
        git remote add andersson https://github.com/andersson/kernel
        git fetch --no-tags andersson wip/sc8280xp-next-20220720-nonworking-gpu
        git checkout 4dc0d00149b8260bcbe5fd583b44ff1b1bbac3cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/msm/

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
