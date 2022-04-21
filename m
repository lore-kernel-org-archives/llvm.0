Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD3B1FA1
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650522772; x=1682058772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sDg8JlXhuBLvr3qealRzh/3gznsd9BkHgfOZj1Rn5T8=;
  b=Hx7b1qmdjRhl6COQgBnzebhMlpPrwwW2/T77AzDUjFXmBORsCAW3VuEJ
   HS2TNRePsK9bw1pBOWtEfM0lG6csAqE8+l1YhkQi1I5KhnzK0hFGw1/ty
   wx9zmddCZvTSJB829/MJyPhd9rkjqJKoPu6fnRRZhfhcb1LhJyOYxT8SY
   V3u2nM+tF1jGoXhtYen1wbOmR3Qx982Anc5i8m6zt1+cU/xmTf2DzITP1
   CMRh6kA+dVCelY5j3m0eQO9P0LN83/QXYoGQX2ydUmLtDoR8o/H4pmP8c
   VdT0sQ43tEvMZctoyBkHvQZe8WmNhPBqJAvJUqunsw7HqqQiYgQzp25Mw
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="244836863"
X-IronPort-AV: E=Sophos;i="5.90,277,1643702400"; 
   d="scan'208";a="244836863"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,277,1643702400"; 
   d="scan'208";a="593505839"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Apr 2022 23:32:49 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQMy-0007wq-Eh;
	Thu, 21 Apr 2022 06:32:48 +0000
Date: Thu, 21 Apr 2022 14:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpirko-mlxsw:jiri_devel_linecards 92/94]
 drivers/net/netdevsim/dev.c:119:25: error: too few arguments to function
 call, expected 5, have 4
Message-ID: <202204202021.UKHPj2M9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_linecards
head:   653975cafc05a2ffc68d2cbd1c5a328c67ce7142
commit: cb770dca23bd2c2fc957d64caeed00ba78a07e0b [92/94] TMP: devlink device type
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220420/202204202021.UKHPj2M9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/cb770dca23bd2c2fc957d64caeed00ba78a07e0b
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_linecards
        git checkout cb770dca23bd2c2fc957d64caeed00ba78a07e0b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

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

eae68f21fc5005 Jiri Pirko 2021-05-05  100  
eae68f21fc5005 Jiri Pirko 2021-05-05  101  static int
eae68f21fc5005 Jiri Pirko 2021-05-05  102  nsim_dev_linecard_devices_create(struct nsim_dev_linecard *nsim_dev_linecard)
eae68f21fc5005 Jiri Pirko 2021-05-05  103  {
eae68f21fc5005 Jiri Pirko 2021-05-05  104  	struct devlink_linecard_device *device;
eae68f21fc5005 Jiri Pirko 2021-05-05  105  	char *component_name;
eae68f21fc5005 Jiri Pirko 2021-05-05  106  	int err;
eae68f21fc5005 Jiri Pirko 2021-05-05  107  	int i;
eae68f21fc5005 Jiri Pirko 2021-05-05  108  
eae68f21fc5005 Jiri Pirko 2021-05-05  109  	snprintf(nsim_dev_linecard->device_component_name,
eae68f21fc5005 Jiri Pirko 2021-05-05  110  		 sizeof(nsim_dev_linecard->device_component_name), "lc%u_dev0",
eae68f21fc5005 Jiri Pirko 2021-05-05  111  		 nsim_dev_linecard->linecard_index);
eae68f21fc5005 Jiri Pirko 2021-05-05  112  	component_name = nsim_dev_linecard->device_component_name;
eae68f21fc5005 Jiri Pirko 2021-05-05  113  
eae68f21fc5005 Jiri Pirko 2021-05-05  114  	for (i = 0; i < NSIM_DEV_LINECARD_DEVICE_COUNT; i++) {
eae68f21fc5005 Jiri Pirko 2021-05-05  115  		if (i > 0)
eae68f21fc5005 Jiri Pirko 2021-05-05  116  			component_name = NULL;
eae68f21fc5005 Jiri Pirko 2021-05-05  117  		device = devlink_linecard_device_create(nsim_dev_linecard->devlink_linecard,
eae68f21fc5005 Jiri Pirko 2021-05-05  118  							i, component_name,
eae68f21fc5005 Jiri Pirko 2021-05-05 @119  							nsim_dev_linecard);
eae68f21fc5005 Jiri Pirko 2021-05-05  120  		if (IS_ERR(device)) {
eae68f21fc5005 Jiri Pirko 2021-05-05  121  			err = PTR_ERR(device);
eae68f21fc5005 Jiri Pirko 2021-05-05  122  			goto rollback;
eae68f21fc5005 Jiri Pirko 2021-05-05  123  		}
eae68f21fc5005 Jiri Pirko 2021-05-05  124  		nsim_dev_linecard->devlink_device[i] = device;
eae68f21fc5005 Jiri Pirko 2021-05-05  125  	}
eae68f21fc5005 Jiri Pirko 2021-05-05  126  	return 0;
eae68f21fc5005 Jiri Pirko 2021-05-05  127  
eae68f21fc5005 Jiri Pirko 2021-05-05  128  rollback:
eae68f21fc5005 Jiri Pirko 2021-05-05  129  	for (i--; i >= 0; i--) {
eae68f21fc5005 Jiri Pirko 2021-05-05  130  		device = nsim_dev_linecard->devlink_device[i];
eae68f21fc5005 Jiri Pirko 2021-05-05  131  		devlink_linecard_device_destroy(nsim_dev_linecard->devlink_linecard,
eae68f21fc5005 Jiri Pirko 2021-05-05  132  						device);
eae68f21fc5005 Jiri Pirko 2021-05-05  133  	}
eae68f21fc5005 Jiri Pirko 2021-05-05  134  	return err;
eae68f21fc5005 Jiri Pirko 2021-05-05  135  }
eae68f21fc5005 Jiri Pirko 2021-05-05  136  

:::::: The code at line 119 was first introduced by commit
:::::: eae68f21fc5005048b5b49a4c953ff76b724df98 netdevsim: create couple of devices on each linecard

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
