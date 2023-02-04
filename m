Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A4BBA2E;
	Sat,  4 Feb 2023 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675530536; x=1707066536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/qltplcgKHiPugNtCmRJ+PI4oLvv3rpIaa/0/mc4r/8=;
  b=iTeuY5beahjrKD0AhHc7q3VHeg/hF4Rlbj17ypOsP5mLsM26+riyQRCw
   jKbwUCd6HZ1un4o1plvBeQ8/LYg6wVg5FYYE0OjZK/HmEMsxacG0qlUqI
   Q4kYVhXbqEnuFQNiPcxea1pGYwxkQMMc/4rnH0dZoZ5urUlkG7z3qSvM3
   k5AasZA4G8PdQ4k+qxRddKm2Hy16FXHwDB4y5T5HTJIbLJWvnjBdTcB1M
   jXb0bN98QD0q9dlrjZKfGuGDgnL35MdPnZSZc++3X4U5RU3j3Fn3rTSLC
   oeDbF4VudYakE8nj2y7wVeQv4u0f/WqargEfvzaV1I8XZ6WnJVO8aLyW2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309299683"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309299683"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 09:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="734695247"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="734695247"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2023 09:08:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOM1z-0001Rg-10;
	Sat, 04 Feb 2023 17:08:51 +0000
Date: Sun, 5 Feb 2023 01:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [wens:mtk-test 20/39] ld.lld: error: undefined symbol: fhctl_parse_dt
Message-ID: <202302050055.4lYWKspD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-test
head:   14d84237ad57de7b0f267d290ae87e40842965b4
commit: 5659c6c79983c43b0e4785bd204ed10e2c6705a4 [20/39] clk: mediatek: mt8192: Add support for frequency hopping through FHCTL
config: hexagon-randconfig-r002-20230204 (https://download.01.org/0day-ci/archive/20230205/202302050055.4lYWKspD-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?id=5659c6c79983c43b0e4785bd204ed10e2c6705a4
        git remote add wens https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git
        git fetch --no-tags wens mtk-test
        git checkout 5659c6c79983c43b0e4785bd204ed10e2c6705a4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fhctl_parse_dt
   >>> referenced by clk-mt8192.c:1131 (drivers/clk/mediatek/clk-mt8192.c:1131)
   >>>               drivers/clk/mediatek/clk-mt8192.o:(clk_mt8192_apmixed_probe) in archive vmlinux.a
   >>> referenced by clk-mt8192.c:1131 (drivers/clk/mediatek/clk-mt8192.c:1131)
   >>>               drivers/clk/mediatek/clk-mt8192.o:(clk_mt8192_apmixed_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mtk_clk_register_pllfhs
   >>> referenced by clk-mt8192.c:1133 (drivers/clk/mediatek/clk-mt8192.c:1133)
   >>>               drivers/clk/mediatek/clk-mt8192.o:(clk_mt8192_apmixed_probe) in archive vmlinux.a
   >>> referenced by clk-mt8192.c:1133 (drivers/clk/mediatek/clk-mt8192.c:1133)
   >>>               drivers/clk/mediatek/clk-mt8192.o:(clk_mt8192_apmixed_probe) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
   Depends on [n]: PM_DEVFREQ [=n]
   Selected by [m]:
   - DRM_MSM [=m] && HAS_IOMEM [=y] && DRM [=m] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
