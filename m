Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A12846BE
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 10:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649760743; x=1681296743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eO81RlC9+6xnr2noejR21B5xbenPw6d8rgTgZSyH8zM=;
  b=FYPWdTQNbSykSMiRBRXbfT6SP0TPTHWu0LmZUHo1CaExxUJ9IiWYZLtx
   EltEBmDocWubQbI4wdZvHUe+C13+pBshPPAuxjLeejc7Op8AeTuCNtSEI
   dvkGnF5Fl+9yOoZhNa1lmEiWBCzlyiZqVJjLdT6J+dgO/Neopm+vpoN3c
   ca5AyHSTVqWzL6pFMIRQ1dSXoc6h7vgvfFaUAF2g/zHMxZL96j6YW1eH1
   hQoRKWDRym4m1rDk8YrOZo5vVWcoDh3Uw/Rcw1ei7x5aigicUJC6l3JlB
   D2XrX6jtnVBX2slC3X18MY8b/P5ApSXsL1VP5Ek8ij/OW+MUI2ngmy9zQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="348783828"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="348783828"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 03:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="660441137"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Apr 2022 03:52:20 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neE8C-0002mt-7V;
	Tue, 12 Apr 2022 10:52:20 +0000
Date: Tue, 12 Apr 2022 18:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpirko-mlxsw:jiri_devel_linecards 79/93]
 drivers/net/netdevsim/dev.c:638:14: error: too many arguments to function
 call, expected 3, have 4
Message-ID: <202204121850.XJ5zRujX-lkp@intel.com>
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
head:   e31049bc6a06f24c077e61e74b1bf1f137572726
commit: 5cfe0dc86bde79b21b5e0097a45355e3a5dbb1cb [79/93] netdevsim: allow port objects to be linked with line cards
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220412/202204121850.XJ5zRujX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/5cfe0dc86bde79b21b5e0097a45355e3a5dbb1cb
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_linecards
        git checkout 5cfe0dc86bde79b21b5e0097a45355e3a5dbb1cb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/netdevsim/dev.c:638:14: error: too many arguments to function call, expected 3, have 4
                                             NULL, i);
                                                   ^
   drivers/net/netdevsim/dev.c:612:1: note: '__nsim_dev_port_add' declared here
   __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_type type,
   ^
>> drivers/net/netdevsim/dev.c:651:39: error: too many arguments to function call, expected single argument 'nsim_dev_port', have 3 arguments
                           __nsim_dev_port_del(nsim_dev_port, NULL, i);
                           ~~~~~~~~~~~~~~~~~~~                ^~~~~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^
   drivers/net/netdevsim/dev.c:614:13: note: '__nsim_dev_port_del' declared here
   static void __nsim_dev_port_del(struct nsim_dev_port *nsim_dev_port);
               ^
>> drivers/net/netdevsim/dev.c:1393:12: error: conflicting types for '__nsim_dev_port_add'
   static int __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_type type,
              ^
   drivers/net/netdevsim/dev.c:612:1: note: previous declaration is here
   __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_type type,
   ^
   drivers/net/netdevsim/dev.c:1503:14: error: too many arguments to function call, expected 3, have 4
                                             NULL, i);
                                                   ^
   drivers/net/netdevsim/dev.c:612:1: note: '__nsim_dev_port_add' declared here
   __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_type type,
   ^
   drivers/net/netdevsim/dev.c:1839:27: error: too many arguments to function call, expected 3, have 4
                                             nsim_dev_linecard, port_index);
                                                                ^~~~~~~~~~
   drivers/net/netdevsim/dev.c:612:1: note: '__nsim_dev_port_add' declared here
   __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_type type,
   ^
   5 errors generated.


vim +638 drivers/net/netdevsim/dev.c

   629	
   630	static int nsim_esw_switchdev_enable(struct nsim_dev *nsim_dev,
   631					     struct netlink_ext_ack *extack)
   632	{
   633		struct nsim_dev_port *nsim_dev_port, *tmp;
   634		int i, err;
   635	
   636		for (i = 0; i < nsim_dev_get_vfs(nsim_dev); i++) {
   637			err = __nsim_dev_port_add(nsim_dev, NSIM_DEV_PORT_TYPE_VF,
 > 638						  NULL, i);
   639			if (err) {
   640				NL_SET_ERR_MSG_MOD(extack, "Failed to initialize VFs' netdevsim ports");
   641				pr_err("Failed to initialize VF id=%d. %d.\n", i, err);
   642				goto err_port_add_vfs;
   643			}
   644		}
   645		nsim_dev->esw_mode = DEVLINK_ESWITCH_MODE_SWITCHDEV;
   646		return 0;
   647	
   648	err_port_add_vfs:
   649		list_for_each_entry_safe(nsim_dev_port, tmp, &nsim_dev->port_list, list)
   650			if (nsim_dev_port_is_vf(nsim_dev_port))
 > 651				__nsim_dev_port_del(nsim_dev_port, NULL, i);
   652		return err;
   653	}
   654	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
