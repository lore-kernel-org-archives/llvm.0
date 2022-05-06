Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCFB7F
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 15:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651852302; x=1683388302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5FPkw2I6ge2rxTy6Ex5XdLKTC0G489tNVAA2zVBuPfg=;
  b=bWTuLkZECX4ndl2O5dPi8/QPPmiOL1G1CbimqA1ZL6yy/qdZMXsjwWrF
   dmfPl3oiA8bu7pPxWkQyr/ALGoqKYIiYC9u6paUNEkDhEkyx2i5B/7P04
   Q3n57NuAK3Yz9uomKPgjBmvL5gevUzy3FYb3zhswY9PGj/iKRhKCGjWRW
   l8UeSdLxPlwKH6/2s0DauXUU7AF5d4Jl5zR/dH5HUVff6IwcFZt42k8OO
   19rFqVcXm9JJdwTgbhlFU4c9IqXXXhD7cWmjIpP+EJkq7YP+/l0ncZMDs
   MH6CcbmCwLHg62VWWpiZp8li883yj1njgxSEUvULYmH2FGT1NHV6HxA+w
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="255985857"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="255985857"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 08:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="600606577"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 May 2022 08:51:39 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nn0F0-000Dcm-W2;
	Fri, 06 May 2022 15:51:38 +0000
Date: Fri, 6 May 2022 23:51:27 +0800
From: kernel test robot <lkp@intel.com>
To: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 153/1129]
 drivers/i2c/busses/i2c-xiic.c:1134:39: warning: unused variable 'xiic_2_00'
Message-ID: <202205062304.4tdEZj6Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   3076249fc30bf463f8390f89009de928ad3e95ff
commit: 441d1827ed31ab142ec4531999461466c6866f1d [153/1129] i2c: xiic: Switch to Xiic standard mode for i2c-read
config: hexagon-randconfig-r045-20220506 (https://download.01.org/0day-ci/archive/20220506/202205062304.4tdEZj6Y-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/441d1827ed31ab142ec4531999461466c6866f1d
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 441d1827ed31ab142ec4531999461466c6866f1d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/i2c/busses/ drivers/media/mc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-xiic.c:1134:39: warning: unused variable 'xiic_2_00' [-Wunused-const-variable]
   static const struct xiic_version_data xiic_2_00 = {
                                         ^
   1 warning generated.


vim +/xiic_2_00 +1134 drivers/i2c/busses/i2c-xiic.c

  1133	
> 1134	static const struct xiic_version_data xiic_2_00 = {
  1135		.quirks = DYNAMIC_MODE_READ_BROKEN_BIT,
  1136	};
  1137	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
