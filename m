Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC692F33
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 21:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657575105; x=1689111105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eTJe6TGm1wlUsvFnmKRHIcBxhcTdjUMjqpmUdR/JPrk=;
  b=iN9h7yp8On1b1Lk+B5WlNfepfhKf8MWq8Q4hdY3PhKsZe/CnGmri5mBu
   mejkwUvHSNkFdAiN5z3H3wK6dHa0gvZhz03kZHhPENkz9l/2rrEzLnuzY
   WXkbdG2F66SbQIqQ6HGgjkIxmF2LvnwKTauJxZ6F9iI52gEur/geTwjdC
   EhX5AKKCAUf2A720fDDg22BH5WgkdJNC/irOj7WpYctwmfzXvDWIVraV3
   nRSb1Vxt9UWi1PLDiyJo93vzvhZdRHRGfdEJp4Gp0Evii9Fn1ZIFBxIst
   BtEg0lmJhWyZj8hcTvV5Tt/kPf/60edlT96xDtKrvV6NXAN/7AqMbo8cu
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="285901713"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="285901713"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 14:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="545172273"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Jul 2022 14:31:42 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oB10H-0001F1-O1;
	Mon, 11 Jul 2022 21:31:41 +0000
Date: Tue, 12 Jul 2022 05:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Moshe Tal <moshet@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: [saeed:net-next 1/52]
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3466:12: warning: stack
 frame size (1068) exceeds limit (1024) in 'mlx5e_setup_tc'
Message-ID: <202207120503.gFGvtnc8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git net-next
head:   f42c9d1eb0a1e2c7f986e0c2f6b362fddd0cdae7
commit: b229566876d91a99322a682e98beaa68dc38f9c9 [1/52] net/mlx5e: Fix mqprio_rl handling on devlink reload
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220712/202207120503.gFGvtnc8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6ce63e267aab79ca87bf63453d34dd3909ab978d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git/commit/?id=b229566876d91a99322a682e98beaa68dc38f9c9
        git remote add saeed https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git
        git fetch --no-tags saeed net-next
        git checkout b229566876d91a99322a682e98beaa68dc38f9c9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hid/ drivers/md/ drivers/net/ethernet/mellanox/mlx5/core/ drivers/vfio/pci/mlx5/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3466:12: warning: stack frame size (1068) exceeds limit (1024) in 'mlx5e_setup_tc' [-Wframe-larger-than]
   static int mlx5e_setup_tc(struct net_device *dev, enum tc_setup_type type,
              ^
   1 warning generated.


vim +/mlx5e_setup_tc +3466 drivers/net/ethernet/mellanox/mlx5/core/en_main.c

955bcb6ea0df0d Pablo Neira Ayuso  2019-07-09  3465  
9afe9a53537789 Or Gerlitz         2018-01-01 @3466  static int mlx5e_setup_tc(struct net_device *dev, enum tc_setup_type type,
de4784ca030fed Jiri Pirko         2017-08-07  3467  			  void *type_data)
0cf0f6d3d39672 Jiri Pirko         2017-08-07  3468  {
4e95bc268b915c Pablo Neira Ayuso  2019-07-09  3469  	struct mlx5e_priv *priv = netdev_priv(dev);
2ff349c5edfe3e Roi Dayan          2020-09-16  3470  	bool tc_unbind = false;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  3471  	int err;
4e95bc268b915c Pablo Neira Ayuso  2019-07-09  3472  
2ff349c5edfe3e Roi Dayan          2020-09-16  3473  	if (type == TC_SETUP_BLOCK &&
2ff349c5edfe3e Roi Dayan          2020-09-16  3474  	    ((struct flow_block_offload *)type_data)->command == FLOW_BLOCK_UNBIND)
2ff349c5edfe3e Roi Dayan          2020-09-16  3475  		tc_unbind = true;
2ff349c5edfe3e Roi Dayan          2020-09-16  3476  
2ff349c5edfe3e Roi Dayan          2020-09-16  3477  	if (!netif_device_present(dev) && !tc_unbind)
2ff349c5edfe3e Roi Dayan          2020-09-16  3478  		return -ENODEV;
2ff349c5edfe3e Roi Dayan          2020-09-16  3479  
0cf0f6d3d39672 Jiri Pirko         2017-08-07  3480  	switch (type) {
daa664a5cdd599 Vlad Buslov        2019-08-29  3481  	case TC_SETUP_BLOCK: {
daa664a5cdd599 Vlad Buslov        2019-08-29  3482  		struct flow_block_offload *f = type_data;
daa664a5cdd599 Vlad Buslov        2019-08-29  3483  
c9f14470d04830 Vlad Buslov        2019-08-26  3484  		f->unlocked_driver_cb = true;
955bcb6ea0df0d Pablo Neira Ayuso  2019-07-09  3485  		return flow_block_cb_setup_simple(type_data,
955bcb6ea0df0d Pablo Neira Ayuso  2019-07-09  3486  						  &mlx5e_block_cb_list,
4e95bc268b915c Pablo Neira Ayuso  2019-07-09  3487  						  mlx5e_setup_tc_block_cb,
4e95bc268b915c Pablo Neira Ayuso  2019-07-09  3488  						  priv, priv, true);
daa664a5cdd599 Vlad Buslov        2019-08-29  3489  	}
575ed7d39e2fbe Nogah Frankel      2017-11-06  3490  	case TC_SETUP_QDISC_MQPRIO:
e2aeac448f06ac Tariq Toukan       2021-07-06  3491  		mutex_lock(&priv->state_lock);
e2aeac448f06ac Tariq Toukan       2021-07-06  3492  		err = mlx5e_setup_tc_mqprio(priv, type_data);
e2aeac448f06ac Tariq Toukan       2021-07-06  3493  		mutex_unlock(&priv->state_lock);
e2aeac448f06ac Tariq Toukan       2021-07-06  3494  		return err;
214baf22870cfa Maxim Mikityanskiy 2021-01-19  3495  	case TC_SETUP_QDISC_HTB:
214baf22870cfa Maxim Mikityanskiy 2021-01-19  3496  		mutex_lock(&priv->state_lock);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  3497  		err = mlx5e_setup_tc_htb(priv, type_data);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  3498  		mutex_unlock(&priv->state_lock);
214baf22870cfa Maxim Mikityanskiy 2021-01-19  3499  		return err;
0cf0f6d3d39672 Jiri Pirko         2017-08-07  3500  	default:
0cf0f6d3d39672 Jiri Pirko         2017-08-07  3501  		return -EOPNOTSUPP;
0cf0f6d3d39672 Jiri Pirko         2017-08-07  3502  	}
08fb1dacdd7634 Saeed Mahameed     2016-02-22  3503  }
08fb1dacdd7634 Saeed Mahameed     2016-02-22  3504  

:::::: The code at line 3466 was first introduced by commit
:::::: 9afe9a5353778994d4396f3d5ff639221bfa5cc9 net/mlx5e: Eliminate build warnings on no previous prototype

:::::: TO: Or Gerlitz <ogerlitz@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
