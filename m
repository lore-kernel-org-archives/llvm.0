Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026C517E6
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 16:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655484007; x=1687020007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=guZ5f+07/dbNfP6Q/11h2HZtzwQUR44yHoBg7H+FvUM=;
  b=eSxLG/ulRFg9kXuut3Xe/pdq8yceRc7ThhhMKBYL7HHaUnyHHy6WtHFH
   Jb5n8aRRMxDfpaLUu+6ZZhpYj4jiYrFjje6Ifx1+5RpmiVfuWT8rB/WK7
   QU+DnJhDoRD68QeTkmJsBYuyGx6StPTTBqBHZNB/SmyVcNPdolvHZfvsc
   z4Zwk8x/726//Qz3s7WBpji/NlTuQt4YFHc8bklra1a8MWpd5UC7h5by4
   3yXZCXDkUcQLOXu3lasSM3d7nF7ttkc6TUA65IKDrP7+3wX8BVgHw9GvZ
   JrXWo3ymgcdxG0LLCDlX+JpTU6hApp5JdlRuhYD6MZlgs2FmZfV20P/1z
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="277062081"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="277062081"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 09:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="578262525"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Jun 2022 09:26:49 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2Eo4-000PbW-VE;
	Fri, 17 Jun 2022 16:26:48 +0000
Date: Sat, 18 Jun 2022 00:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 470/1181]
 drivers/misc/jesd204b/jesd_phy.c:172:6: warning: no previous prototype for
 function 'jesd204_phy_set_speed'
Message-ID: <202206180042.mZv4R82R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shubhrajyoti,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   59523b5c4aca0174f1f8cba2a07d3b3328b7c80e
commit: 4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486 [470/1181] misc: jesd204b: Add driver for Xilinx jesd204b
config: hexagon-randconfig-r022-20220617 (https://download.01.org/0day-ci/archive/20220618/202206180042.mZv4R82R-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
