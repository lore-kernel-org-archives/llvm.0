Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F11E2586;
	Sat,  4 Feb 2023 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675524350; x=1707060350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/5eC+P25W5n+6PjKlnn3GEO2ZHBzhePxQYCutPenRIE=;
  b=kxUCTZcaPyqkKBgMOLqW5MMuYDDEIMFOzumnRHzfc6heIUeSZFLldBCf
   Qi6OkikYKMV5iexLDZVNGh95kS17bqJ8kkEK9tfcQfMpWXjod/fpAIray
   M8XlwPgjtEGU/m27EpSKxEeoVjhy7st9rwurpDSRJ83MSS7bfxJcZV4rg
   yxHu5Q8m8/Aq2NTCgQmWxbxxYQrU1RUsPH9bi3MD3jrSao6x678e63qDa
   /+FRBdqV5QASdA1DtZ5lrlclfghSfM46tc8HedXJgr5woWCHnTcXJnqQr
   hy8TVAoe87QigydmFFYdCzMis0TSFtNX+C5X9tv+RnyK7qz6Z+WUohHRg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="330244801"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="330244801"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 07:25:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="754786666"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="754786666"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 07:25:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOKQF-0001Nw-0a;
	Sat, 04 Feb 2023 15:25:47 +0000
Date: Sat, 4 Feb 2023 23:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [wens:mtk-test 19/39] ld.lld: error: undefined symbol:
 mtk_clk_unregister_pllfhs
Message-ID: <202302042333.DtuL4mur-lkp@intel.com>
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
commit: ddcaa79669690cef7a4265a4d6844c2461aa8cd4 [19/39] clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
config: hexagon-randconfig-r002-20230204 (https://download.01.org/0day-ci/archive/20230204/202302042333.DtuL4mur-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?id=ddcaa79669690cef7a4265a4d6844c2461aa8cd4
        git remote add wens https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git
        git fetch --no-tags wens mtk-test
        git checkout ddcaa79669690cef7a4265a4d6844c2461aa8cd4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mtk_clk_unregister_pllfhs
   >>> referenced by clk-mt8173-apmixedsys.c:198 (drivers/clk/mediatek/clk-mt8173-apmixedsys.c:198)
   >>>               drivers/clk/mediatek/clk-mt8173-apmixedsys.o:(clk_mt8173_apmixed_remove) in archive vmlinux.a
   >>> referenced by clk-mt8173-apmixedsys.c:198 (drivers/clk/mediatek/clk-mt8173-apmixedsys.c:198)
   >>>               drivers/clk/mediatek/clk-mt8173-apmixedsys.o:(clk_mt8173_apmixed_remove) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
   Depends on [n]: PM_DEVFREQ [=n]
   Selected by [m]:
   - DRM_MSM [=m] && HAS_IOMEM [=y] && DRM [=m] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
