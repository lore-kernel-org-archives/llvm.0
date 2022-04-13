Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FF623D2
	for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 06:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649829932; x=1681365932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7J159Gh9HkMijLSs1cF0rPxuBSczFLJZo1h/cJRFq6E=;
  b=ZDGe6y44WCyCT8PLtBHnYMvEcS/M/drTUbhM3lto7cUnLllpg1oEQaf6
   onvsSpRLa37bZ9GzR77lFfmjWlvZvjM9BX9iliJ3KiG82Gz7JxoL149qs
   csd/b3lBnMcHocTWg5+7o/rgVji0XITemA1Xuk9xi7mCYJcscCg7U5cCb
   rqhD5elapooWdLZ7bLK9c53dkM5WegK7KkJbl7Bxz7ZnX/g2tk8zmvBKL
   rA+bNGr337vSVe0zjAw6JNAKx6zb4fBdz154Ahz48JovQE/rW8DmGl0T+
   Ohr21HjnSLEoigkfCb5seUEhcGbpnYkhCIiAvj5c02lqTFWEDSfZTkEtB
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="287608644"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="287608644"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 23:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="724769585"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2022 23:05:30 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neW89-00005k-G5;
	Wed, 13 Apr 2022 06:05:29 +0000
Date: Wed, 13 Apr 2022 14:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpirko-mlxsw:jiri_devel_linecards 92/94]
 drivers/net/netdevsim/dev.c:119:25: error: too few arguments to function
 call, expected 5, have 4
Message-ID: <202204131305.23NkbTFh-lkp@intel.com>
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
head:   ca9bd759ed5f4422d41446de7c31c6a189ac87df
commit: f39238e4c9d54b5f8d9ebe9c333b83509a644803 [92/94] TMP: devlink device type
config: x86_64-randconfig-a001-20220411 (https://download.01.org/0day-ci/archive/20220413/202204131305.23NkbTFh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/f39238e4c9d54b5f8d9ebe9c333b83509a644803
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_linecards
        git checkout f39238e4c9d54b5f8d9ebe9c333b83509a644803
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/netdevsim/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/netdevsim/dev.c:119:25: error: too few arguments to function call, expected 5, have 4
                                                           nsim_dev_linecard);
                                                                            ^
   include/net/devlink.h:1607:1: note: 'devlink_linecard_device_create' declared here
   devlink_linecard_device_create(struct devlink_linecard *linecard,
   ^
   drivers/net/netdevsim/dev.c:870:14: error: too many arguments to function call, expected 3, have 4
                                             NULL, i);
                                                   ^
   drivers/net/netdevsim/dev.c:844:1: note: '__nsim_dev_port_add' declared here
   __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_type type,
   ^
   drivers/net/netdevsim/dev.c:883:39: error: too many arguments to function call, expected single argument 'nsim_dev_port', have 3 arguments
                           __nsim_dev_port_del(nsim_dev_port, NULL, i);
                           ~~~~~~~~~~~~~~~~~~~                ^~~~~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^
   drivers/net/netdevsim/dev.c:846:13: note: '__nsim_dev_port_del' declared here
   static void __nsim_dev_port_del(struct nsim_dev_port *nsim_dev_port);
               ^
   drivers/net/netdevsim/dev.c:1625:12: error: conflicting types for '__nsim_dev_port_add'
   static int __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_type type,
              ^
   drivers/net/netdevsim/dev.c:844:1: note: previous declaration is here
   __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_type type,
   ^
   drivers/net/netdevsim/dev.c:1738:14: error: too many arguments to function call, expected 3, have 4
                                             NULL, i);
                                                   ^
   drivers/net/netdevsim/dev.c:844:1: note: '__nsim_dev_port_add' declared here
   __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_type type,
   ^
   drivers/net/netdevsim/dev.c:2213:27: error: too many arguments to function call, expected 3, have 4
                                             nsim_dev_linecard, port_index);
                                                                ^~~~~~~~~~
   drivers/net/netdevsim/dev.c:844:1: note: '__nsim_dev_port_add' declared here
   __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_type type,
   ^
   6 errors generated.


vim +119 drivers/net/netdevsim/dev.c

f516d881f25d5ec Jiri Pirko 2021-05-05  100  
f516d881f25d5ec Jiri Pirko 2021-05-05  101  static int
f516d881f25d5ec Jiri Pirko 2021-05-05  102  nsim_dev_linecard_devices_create(struct nsim_dev_linecard *nsim_dev_linecard)
f516d881f25d5ec Jiri Pirko 2021-05-05  103  {
f516d881f25d5ec Jiri Pirko 2021-05-05  104  	struct devlink_linecard_device *device;
f516d881f25d5ec Jiri Pirko 2021-05-05  105  	char *component_name;
f516d881f25d5ec Jiri Pirko 2021-05-05  106  	int err;
f516d881f25d5ec Jiri Pirko 2021-05-05  107  	int i;
f516d881f25d5ec Jiri Pirko 2021-05-05  108  
f516d881f25d5ec Jiri Pirko 2021-05-05  109  	snprintf(nsim_dev_linecard->device_component_name,
f516d881f25d5ec Jiri Pirko 2021-05-05  110  		 sizeof(nsim_dev_linecard->device_component_name), "lc%u_dev0",
f516d881f25d5ec Jiri Pirko 2021-05-05  111  		 nsim_dev_linecard->linecard_index);
f516d881f25d5ec Jiri Pirko 2021-05-05  112  	component_name = nsim_dev_linecard->device_component_name;
f516d881f25d5ec Jiri Pirko 2021-05-05  113  
f516d881f25d5ec Jiri Pirko 2021-05-05  114  	for (i = 0; i < NSIM_DEV_LINECARD_DEVICE_COUNT; i++) {
f516d881f25d5ec Jiri Pirko 2021-05-05  115  		if (i > 0)
f516d881f25d5ec Jiri Pirko 2021-05-05  116  			component_name = NULL;
f516d881f25d5ec Jiri Pirko 2021-05-05  117  		device = devlink_linecard_device_create(nsim_dev_linecard->devlink_linecard,
f516d881f25d5ec Jiri Pirko 2021-05-05  118  							i, component_name,
f516d881f25d5ec Jiri Pirko 2021-05-05 @119  							nsim_dev_linecard);
f516d881f25d5ec Jiri Pirko 2021-05-05  120  		if (IS_ERR(device)) {
f516d881f25d5ec Jiri Pirko 2021-05-05  121  			err = PTR_ERR(device);
f516d881f25d5ec Jiri Pirko 2021-05-05  122  			goto rollback;
f516d881f25d5ec Jiri Pirko 2021-05-05  123  		}
f516d881f25d5ec Jiri Pirko 2021-05-05  124  		nsim_dev_linecard->devlink_device[i] = device;
f516d881f25d5ec Jiri Pirko 2021-05-05  125  	}
f516d881f25d5ec Jiri Pirko 2021-05-05  126  	return 0;
f516d881f25d5ec Jiri Pirko 2021-05-05  127  
f516d881f25d5ec Jiri Pirko 2021-05-05  128  rollback:
f516d881f25d5ec Jiri Pirko 2021-05-05  129  	for (i--; i >= 0; i--) {
f516d881f25d5ec Jiri Pirko 2021-05-05  130  		device = nsim_dev_linecard->devlink_device[i];
f516d881f25d5ec Jiri Pirko 2021-05-05  131  		devlink_linecard_device_destroy(nsim_dev_linecard->devlink_linecard,
f516d881f25d5ec Jiri Pirko 2021-05-05  132  						device);
f516d881f25d5ec Jiri Pirko 2021-05-05  133  	}
f516d881f25d5ec Jiri Pirko 2021-05-05  134  	return err;
f516d881f25d5ec Jiri Pirko 2021-05-05  135  }
f516d881f25d5ec Jiri Pirko 2021-05-05  136  

:::::: The code at line 119 was first introduced by commit
:::::: f516d881f25d5ec76a01608f6b13e88d91687f6c netdevsim: create couple of devices on each linecard

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
