Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E5A20F1
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 04:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653972418; x=1685508418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMXd5+SRH/26T4spxfNmiDa6kr0xrNsZ15FEQuO0q1g=;
  b=YI+pru9M7+xy6qlegL6KZlub6erXa629TktY/vl9ZtYW+e7SGIUr6oZi
   qVSl8yx5WY9yzVMXOQLX/JKxM7ePIjaYpJKrfJC2YwcCLiCwJmxYY3R53
   B+KVE5UU4JscJYY4n/TtkXKGnbSM26DYuYhTE2UNxyuc5G1hUeIxczEQp
   IQ63IDlyxUovtbhNqCGNpM168uJrUAcLGXL8gQfJtYwp3ZQTpqWe2pO4b
   X5n/AvLNRQOBBoR8bP7aleQnmRxSVZQb7C/gnYAYTbkGNZoxbMR/afWJu
   Gu+ZasGtD6apO7MJ5JbLow33piu1yRrvmsLHeqASaKoCUFlKYv+t9nzbh
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="273945045"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="273945045"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 21:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="562151958"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 May 2022 21:46:56 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvtmR-0002Ka-Gh;
	Tue, 31 May 2022 04:46:55 +0000
Date: Tue, 31 May 2022 12:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 470/1102]
 drivers/misc/jesd204b/jesd_phy.c:172:6: warning: no previous prototype for
 function 'jesd204_phy_set_speed'
Message-ID: <202205311254.tY9EYYED-lkp@intel.com>
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

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   8e42834c82e505bacccca3c9d35da7041793d9d7
commit: 4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486 [470/1102] misc: jesd204b: Add driver for Xilinx jesd204b
config: arm-randconfig-r026-20220531 (https://download.01.org/0day-ci/archive/20220531/202205311254.tY9EYYED-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Xilinx/linux-xlnx/commit/4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout 4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/xlnx/ drivers/media/i2c/ drivers/misc/jesd204b/ drivers/staging/

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
