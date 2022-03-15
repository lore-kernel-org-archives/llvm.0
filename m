Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0341FB8
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647343951; x=1678879951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QylzSgpK5+LAs1zN8uASLzmlF5ziZW+Fxf/h0yakyAc=;
  b=Bqggs8pKhXFloTgd6ThSKYzvq4orBE8EKnMngbB/Tky/Tgy40u50FoMa
   wDUFfb28R/zieSGb9VH1TP9jHACa+2CaKTFv3rSp8KIhfrQ2nrSs8xeni
   hz+Y7zeddYo7k6URkE0YIWJZpqZY6gHPU7pkqaYOtP9VChZ8f/FixkVUw
   p0TZ2hwicx/GqiJFU/dqgUYG3bFsuPO7taHqeuSykb5S62KN+bwi+m/Ok
   LKRan6zQpKVVTPd0QeuB+kb/yWDyBg3ZBC4+wluB5cJwtLQicMgPUQ+S8
   WDQQUT2OON2shzLAIWFecAL/wTlYDssknnTSqXQXkk7Dpn/BCXtXEyLs0
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="236221706"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; 
   d="scan'208";a="236221706"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 04:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; 
   d="scan'208";a="497980434"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2022 04:32:29 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nU5Pg-000Atx-Ie; Tue, 15 Mar 2022 11:32:28 +0000
Date: Tue, 15 Mar 2022 19:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 470/983]
 drivers/misc/jesd204b/jesd_phy.c:172:6: warning: no previous prototype for
 function 'jesd204_phy_set_speed'
Message-ID: <202203151951.Hsvy84Tb-lkp@intel.com>
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
head:   82a6a288ad2ea30575c859f1a5ec2ad014e51528
commit: 4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486 [470/983] misc: jesd204b: Add driver for Xilinx jesd204b
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220315/202203151951.Hsvy84Tb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/misc/jesd204b/ drivers/net/ethernet/xilinx/ drivers/phy/xilinx/ drivers/ptp/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/misc/jesd204b/jesd_phy.c:97:6: warning: variable 'pll' set but not used [-Wunused-but-set-variable]
           int pll = st->pll;
               ^
>> drivers/misc/jesd204b/jesd_phy.c:172:6: warning: no previous prototype for function 'jesd204_phy_set_speed' [-Wmissing-prototypes]
   void jesd204_phy_set_speed(struct jesd204b_phy_state *st, u32 band)
        ^
   drivers/misc/jesd204b/jesd_phy.c:172:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void jesd204_phy_set_speed(struct jesd204b_phy_state *st, u32 band)
   ^
   static 
   2 warnings generated.


vim +/jesd204_phy_set_speed +172 drivers/misc/jesd204b/jesd_phy.c

   171	
 > 172	void jesd204_phy_set_speed(struct jesd204b_phy_state *st, u32 band)
   173	{
   174		/* make sure we have the correct PLL's selected. */
   175		configure_channel_drp(st, band);
   176	}
   177	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
