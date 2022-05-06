Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DABA4F
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651852303; x=1683388303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZlrLZjQWhyxRTfRMzdLGS3wjbHf86AZLaNOEKOW4n9U=;
  b=Sj9+Try0f/ey5MRp18RiKuvvZ0jUzwrNwQ9h0TWNFe5zSFg49iGYqUIs
   vJOWr/Hms5vHRdvG3MT0G1G0Jp5bXfkN2rgxdJ/4FnO/T4EZg5FRuSD/7
   lLXEvLYWwGfGNBOBR2UBPNanQAg5rte4WBdBCYerPooXK6o9TlwOgdwNH
   AKY6UnumcedFinouWZx6m5w+leAUXhMgDtsO+DAHtLrn9L1ERvVsebLlI
   yC5S3Nmq6yW+/e6LTqxo1Y7W1WoIowLp+ag8HB/153zLd1qoAjqEQ6x2p
   sVWnamtJjzE/TA5SzqutVnbJgip+FtTI8ATTEVyxB0UHZw5NgUvsf5D9P
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="268643281"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="268643281"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 08:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="569146092"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 May 2022 08:51:39 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nn0F1-000Dcs-2M;
	Fri, 06 May 2022 15:51:39 +0000
Date: Fri, 6 May 2022 23:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Davor Joja <davor.joja@logicbricks.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 622/1129]
 drivers/media/i2c/adv7511-v4l2.c:2245:21: warning: no previous prototype for
 function 'adv7511_subdev'
Message-ID: <202205062304.jxNotrGO-lkp@intel.com>
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
commit: 59e26517c7b77c4c82aad32cfac74ae39c32b76b [622/1129] drivers: media: Customized adv7511 for Xylon LogiCVC (deprecated)
config: arm-randconfig-r002-20220506 (https://download.01.org/0day-ci/archive/20220506/202205062304.jxNotrGO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Xilinx/linux-xlnx/commit/59e26517c7b77c4c82aad32cfac74ae39c32b76b
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 59e26517c7b77c4c82aad32cfac74ae39c32b76b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/adv7511-v4l2.c:2245:21: warning: no previous prototype for function 'adv7511_subdev' [-Wmissing-prototypes]
   struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
                       ^
   drivers/media/i2c/adv7511-v4l2.c:2245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
   ^
   static 
   drivers/media/i2c/adv7511-v4l2.c:304:19: warning: unused function 'adv7511_cec_write_and_or' [-Wunused-function]
   static inline int adv7511_cec_write_and_or(struct v4l2_subdev *sd, u8 reg, u8 mask,
                     ^
   drivers/media/i2c/adv7511-v4l2.c:334:20: warning: unused function 'adv7511_pktmem_wr_and_or' [-Wunused-function]
   static inline void adv7511_pktmem_wr_and_or(struct v4l2_subdev *sd, u8 reg, u8 clr_mask, u8 val_mask)
                      ^
   3 warnings generated.


vim +/adv7511_subdev +2245 drivers/media/i2c/adv7511-v4l2.c

  2244	
> 2245	struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
  2246	{
  2247		static struct v4l2_subdev *subdev;
  2248	
  2249		if (sd)
  2250			subdev = sd;
  2251	
  2252		return subdev;
  2253	}
  2254	EXPORT_SYMBOL(adv7511_subdev);
  2255	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
