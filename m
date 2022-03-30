Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9037C
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 02:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648608462; x=1680144462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jucMeYJjKV9GuDCm1aueRJFza5TEYdX52yElj6TPF2U=;
  b=CXotLrA2ORGPgFmJEUWdmphaGf3s0C56YD1a2aSY3IC6BZ1dGgJ2ukcs
   2hE8RyIf/Y/o+MVab/J9bH7ukYCRk7ih9fEs+0ajbAnoMZ1XKd+IQnJ4X
   ayhdXq7GzUKifTf/Eqfxp9qy8nXMVL0Bo5HgvfFbPrJdZXXrRTj7i4iXB
   5idNt5N4JuCPH3mjj9WbsoFOx9gTaRXMeaPHWnHjweX4jqgqEYzNRubSv
   9x2suNLJFxMhMVESsk6K4acP8qdz/FaHdWgzRL1QbC3Al/MKxVhpdmowe
   SiIDmQMTy4/6jP3l5pBfcE/nEXE99mGwSHpBqHNyemPG/nQwvaCcMED6r
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259614989"
X-IronPort-AV: E=Sophos;i="5.90,221,1643702400"; 
   d="scan'208";a="259614989"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 19:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,221,1643702400"; 
   d="scan'208";a="653496982"
Received: from lkp-server01.sh.intel.com (HELO 3965e2759b93) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2022 19:47:38 -0700
Received: from kbuild by 3965e2759b93 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nZOMz-0000v8-Sm; Wed, 30 Mar 2022 02:47:37 +0000
Date: Wed, 30 Mar 2022 10:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 449/1039]
 drivers/clk/clk-si5324.c:474: warning: expecting prototype for
 si5324_regmap_is_writable(). Prototype was for si5324_regmap_is_writeable()
 instead
Message-ID: <202203301024.kfL1z28R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   ea33365bd1a8cf667a122498e8f551df05609f92
commit: 2ba5718a624ee405166bd43683de3825b70a128f [449/1039] clk: Adding Silicon labs si5324 clock driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220330/202203301024.kfL1z28R-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/2ba5718a624ee405166bd43683de3825b70a128f
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 2ba5718a624ee405166bd43683de3825b70a128f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-si5324.c:474: warning: expecting prototype for si5324_regmap_is_writable(). Prototype was for si5324_regmap_is_writeable() instead


vim +474 drivers/clk/clk-si5324.c

   462	
   463	/**
   464	 * si5324_regmap_is_writable - Checks the register is writable or not
   465	 *
   466	 * @dev:	Registered device
   467	 * @reg:	Register offset
   468	 *
   469	 * Checks the register is writable or not.
   470	 *
   471	 * Return:	True if the register is writeable, False if it's not writeable.
   472	 */
   473	static bool si5324_regmap_is_writeable(struct device *dev, unsigned int reg)
 > 474	{
   475		if ((reg > SI5324_POWERDOWN && reg < SI5324_FOS_LOCKT) ||
   476		    (reg > SI5324_N1_HS && reg < SI5324_NC1_LS_H) ||
   477		    (reg > SI5324_NC2_LS_L && reg < SI5324_N2_HS_LS_H) ||
   478		    (reg > SI5324_N32_CLKIN_L && reg < SI5324_FOS_CLKIN_RATE) ||
   479		    (reg > SI5324_FOS_CLKIN_RATE && reg < SI5324_PLL_ACTV_CLK) ||
   480		    reg > SI5324_SKEW2 ||
   481		    (reg >= SI5324_PLL_ACTV_CLK && reg <= SI5324_CLKIN_LOL_STATUS) ||
   482		    (reg >= SI5324_PARTNO_H && reg <= SI5324_PARTNO_L))
   483			return false;
   484	
   485		return true;
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
