Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6F48D0
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646748455; x=1678284455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+oHbdDk7RVU8mFBrgvhwsbKXJLPjk9gTrZfPKc5C3s=;
  b=Sirm+r06MShtZvqmLBSvoHiKK6gS61kqfhO5VnhxdXuf4R3JP1/x3wQy
   snx6DaYr2YEpvhUY6Rm2ikIAACXTslV8nJHg/4W+uVqS0Snc1uIIHeq9N
   DW+pS39dl23x5JKPCJ9oKQrm+Unr6g/KHBJjVHoSysKguwCgtlvQpCmOH
   Ep4WZj6fQvu6Jb5GJQ7WTOpfrqzs9W+dSDdcX2dMU16N562NLAL7GKGr+
   nCK0zwtnEXdb8cKP9pNlsi/T8av9q1GssWc4Y7Us8zDmyulnbqLdNtQJZ
   1ED81vLHmYOHr4UD2KqAgwq6+1qrzzXqdh3IlQto6vnRaQ1gyZEth4Xxz
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254628511"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="254628511"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 06:07:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="643664725"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Mar 2022 06:07:25 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRaUn-0001Vl-42; Tue, 08 Mar 2022 14:07:25 +0000
Date: Tue, 8 Mar 2022 22:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpirko-mlxsw:jiri_devel_linecards 39/40]
 drivers/net/netdevsim/dev.c:119:25: error: too few arguments to function
 call, expected 5, have 4
Message-ID: <202203082101.aGtvJRgf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_linecards
head:   00a5d1d90798fb011d849a45bcaadd546af72602
commit: 2e58b589b7c7b2ab1355721db5122b8f415410f6 [39/40] TMP: devlink device type
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220308/202203082101.aGtvJRgf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/2e58b589b7c7b2ab1355721db5122b8f415410f6
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_linecards
        git checkout 2e58b589b7c7b2ab1355721db5122b8f415410f6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/netdevsim/dev.c:119:25: error: too few arguments to function call, expected 5, have 4
                                                           nsim_dev_linecard);
                                                                            ^
   include/net/devlink.h:1577:1: note: 'devlink_linecard_device_create' declared here
   devlink_linecard_device_create(struct devlink_linecard *linecard,
   ^
   1 error generated.


vim +119 drivers/net/netdevsim/dev.c

dcf92710cf8eb9 Jiri Pirko 2021-05-05  100  
dcf92710cf8eb9 Jiri Pirko 2021-05-05  101  static int
dcf92710cf8eb9 Jiri Pirko 2021-05-05  102  nsim_dev_linecard_devices_create(struct nsim_dev_linecard *nsim_dev_linecard)
dcf92710cf8eb9 Jiri Pirko 2021-05-05  103  {
dcf92710cf8eb9 Jiri Pirko 2021-05-05  104  	struct devlink_linecard_device *device;
dcf92710cf8eb9 Jiri Pirko 2021-05-05  105  	char *component_name;
dcf92710cf8eb9 Jiri Pirko 2021-05-05  106  	int err;
dcf92710cf8eb9 Jiri Pirko 2021-05-05  107  	int i;
dcf92710cf8eb9 Jiri Pirko 2021-05-05  108  
dcf92710cf8eb9 Jiri Pirko 2021-05-05  109  	snprintf(nsim_dev_linecard->device_component_name,
dcf92710cf8eb9 Jiri Pirko 2021-05-05  110  		 sizeof(nsim_dev_linecard->device_component_name), "lc%u_dev0",
dcf92710cf8eb9 Jiri Pirko 2021-05-05  111  		 nsim_dev_linecard->linecard_index);
dcf92710cf8eb9 Jiri Pirko 2021-05-05  112  	component_name = nsim_dev_linecard->device_component_name;
dcf92710cf8eb9 Jiri Pirko 2021-05-05  113  
dcf92710cf8eb9 Jiri Pirko 2021-05-05  114  	for (i = 0; i < NSIM_DEV_LINECARD_DEVICE_COUNT; i++) {
dcf92710cf8eb9 Jiri Pirko 2021-05-05  115  		if (i > 0)
dcf92710cf8eb9 Jiri Pirko 2021-05-05  116  			component_name = NULL;
dcf92710cf8eb9 Jiri Pirko 2021-05-05  117  		device = devlink_linecard_device_create(nsim_dev_linecard->devlink_linecard,
dcf92710cf8eb9 Jiri Pirko 2021-05-05  118  							i, component_name,
dcf92710cf8eb9 Jiri Pirko 2021-05-05 @119  							nsim_dev_linecard);
dcf92710cf8eb9 Jiri Pirko 2021-05-05  120  		if (IS_ERR(device)) {
dcf92710cf8eb9 Jiri Pirko 2021-05-05  121  			err = PTR_ERR(device);
dcf92710cf8eb9 Jiri Pirko 2021-05-05  122  			goto rollback;
dcf92710cf8eb9 Jiri Pirko 2021-05-05  123  		}
dcf92710cf8eb9 Jiri Pirko 2021-05-05  124  		nsim_dev_linecard->devlink_device[i] = device;
dcf92710cf8eb9 Jiri Pirko 2021-05-05  125  	}
dcf92710cf8eb9 Jiri Pirko 2021-05-05  126  	return 0;
dcf92710cf8eb9 Jiri Pirko 2021-05-05  127  
dcf92710cf8eb9 Jiri Pirko 2021-05-05  128  rollback:
dcf92710cf8eb9 Jiri Pirko 2021-05-05  129  	for (i--; i >= 0; i--) {
dcf92710cf8eb9 Jiri Pirko 2021-05-05  130  		device = nsim_dev_linecard->devlink_device[i];
dcf92710cf8eb9 Jiri Pirko 2021-05-05  131  		devlink_linecard_device_destroy(nsim_dev_linecard->devlink_linecard,
dcf92710cf8eb9 Jiri Pirko 2021-05-05  132  						device);
dcf92710cf8eb9 Jiri Pirko 2021-05-05  133  	}
dcf92710cf8eb9 Jiri Pirko 2021-05-05  134  	return err;
dcf92710cf8eb9 Jiri Pirko 2021-05-05  135  }
dcf92710cf8eb9 Jiri Pirko 2021-05-05  136  

:::::: The code at line 119 was first introduced by commit
:::::: dcf92710cf8eb910bb40f1ce722ec40a4e39d199 netdevsim: create couple of devices on each linecard

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
