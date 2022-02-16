Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5011C1FCB
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 05:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644989548; x=1676525548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDJpWv6XnPLS+5i/n3SB1QpVOz8ZYtnpJAD5DEwJhos=;
  b=Wyn2p6Puzix1cis7pYKtds39EKIXCjCo8ulX2tWR5LIcWTtgpliN9s0f
   ZM6YOc1kvD4mvzl+5tCoxGiPY1Uoe69s9pSW4ZR/O4GdiBzc05WSLpjaF
   TMwG415NuE+ZQLHKPjHo5grpzDrruYLsx5bUM6/0RLfGPFUtyNft9GyMa
   6YNHhFjU+n31DvtR3WrNMVMsixjXNWJwYgO29C2gAn6EiqgqxUoQa9QHj
   7Kbzz6cONQ8WPbpQn7V0Jnt+nWf7YVvsnAUcWhHmbs37Zs1aIfJmLT4KJ
   C3siXmXY+auVdQGii5wP7ULv7hGODPApJnVdzjw9hZTlvlOxZlyIRjaAr
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="234067508"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="234067508"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 21:32:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="571131353"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Feb 2022 21:32:26 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKCvR-000ATN-GF; Wed, 16 Feb 2022 05:32:25 +0000
Date: Wed, 16 Feb 2022 13:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yong Wu <yong.wu@mediatek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>
Subject: [deller-fbdev:for-next 51/51]
 drivers/video/fbdev/omap2/omapfb/dss/dss.c:1209:42: error: use of undeclared
 identifier 'component_compare_dev'; did you mean 'component_master_del'?
Message-ID: <202202161324.Jh1OfqAf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next
head:   61038027aa13351c63b452a0d48c805bab1d2ce9
commit: 61038027aa13351c63b452a0d48c805bab1d2ce9 [51/51] video: fbdev: omapfb: Make use of the helper component_compare_dev
config: arm-randconfig-c002-20220216 (https://download.01.org/0day-ci/archive/20220216/202202161324.Jh1OfqAf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/commit/?id=61038027aa13351c63b452a0d48c805bab1d2ce9
        git remote add deller-fbdev git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
        git fetch --no-tags deller-fbdev for-next
        git checkout 61038027aa13351c63b452a0d48c805bab1d2ce9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/video/fbdev/omap2/omapfb/dss/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/omap2/omapfb/dss/dss.c:1209:42: error: use of undeclared identifier 'component_compare_dev'; did you mean 'component_master_del'?
           component_match_add(dev->parent, match, component_compare_dev, dev);
                                                   ^~~~~~~~~~~~~~~~~~~~~
                                                   component_master_del
   include/linux/component.h:85:6: note: 'component_master_del' declared here
   void component_master_del(struct device *,
        ^
   1 error generated.


vim +1209 drivers/video/fbdev/omap2/omapfb/dss/dss.c

  1195	
  1196	static int dss_add_child_component(struct device *dev, void *data)
  1197	{
  1198		struct component_match **match = data;
  1199	
  1200		/*
  1201		 * HACK
  1202		 * We don't have a working driver for rfbi, so skip it here always.
  1203		 * Otherwise dss will never get probed successfully, as it will wait
  1204		 * for rfbi to get probed.
  1205		 */
  1206		if (strstr(dev_name(dev), "rfbi"))
  1207			return 0;
  1208	
> 1209		component_match_add(dev->parent, match, component_compare_dev, dev);
  1210	
  1211		return 0;
  1212	}
  1213	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
