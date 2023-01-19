Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BF323AE;
	Thu, 19 Jan 2023 05:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674107258; x=1705643258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lRAXFhrwES6RtZm6J0tMBAQQrNufPov6iUsv3OLlBJg=;
  b=YeR0qmVHI2/LwcD/lLI7eqsNppaaEGniJOQ7A5MvtrSuvrIZvABUIYsu
   237T5ZfoJkbwerjRiFUOgZB8w5Yogb5e/LQXr3syBvDS2xrzqJs79DKGk
   ybKBuElXa3f8use9zPA6prxrUPhogDONtP8h5jyYR0cwjHF1KvBe8dY7G
   PGXOvURn5lLTezdww7Ks6UapaVp9LryOa4S0DM3PR50faz50VfgIcmsny
   JVWEvH7vLeBAuh7wACo7QEC/eMIMu5KvXO+uRmtiIH2twXjGoKXnZEF9z
   Yht7bI6Sh0Iy4uLwLAgVQShQz1XMbToktQBT9qpnjMMbLtI34SYPViv50
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="352457251"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="352457251"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 21:47:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="660069786"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="660069786"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jan 2023 21:47:35 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pINlu-00019C-35;
	Thu, 19 Jan 2023 05:47:34 +0000
Date: Thu, 19 Jan 2023 13:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:jiri_devel_work_devlink_various 24/25]
 drivers/net/ethernet/mellanox/mlx5/core/en/devlink.c:60:56: error: expected
 expression
Message-ID: <202301191337.LhRjuuRL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_work_devlink_various
head:   6667b78532ac7d8a8d2f9f05ae37446d6e4adebc
commit: b935a1680b9e8e039142856f1df72496751a3172 [24/25] net/mlx5e: Move dl_port to struct mlx5e_dev
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230119/202301191337.LhRjuuRL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/b935a1680b9e8e039142856f1df72496751a3172
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_work_devlink_various
        git checkout b935a1680b9e8e039142856f1df72496751a3172
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/en/devlink.c:60:56: error: expected expression
                   dl_port_index = mlx5_esw_vport_to_devlink_port_index(>mdev, 0);
                                                                        ^
   1 error generated.


vim +60 drivers/net/ethernet/mellanox/mlx5/core/en/devlink.c

    39	
    40	int mlx5e_devlink_port_register(struct mlx5e_dev *mlx5e_dev,
    41					struct mlx5_core_dev *mdev)
    42	{
    43		struct devlink *devlink = priv_to_devlink(mlx5e_dev);
    44		struct devlink_port_attrs attrs = {};
    45		struct netdev_phys_item_id ppid = {};
    46		unsigned int dl_port_index;
    47	
    48		if (mlx5_core_is_pf(mdev)) {
    49			attrs.flavour = DEVLINK_PORT_FLAVOUR_PHYSICAL;
    50			attrs.phys.port_number = mlx5_get_dev_index(mdev);
    51			if (MLX5_ESWITCH_MANAGER(mdev)) {
    52				mlx5e_devlink_get_port_parent_id(mdev, &ppid);
    53				memcpy(attrs.switch_id.id, ppid.id, ppid.id_len);
    54				attrs.switch_id.id_len = ppid.id_len;
    55			}
    56			dl_port_index = mlx5_esw_vport_to_devlink_port_index(mdev,
    57									     MLX5_VPORT_UPLINK);
    58		} else {
    59			attrs.flavour = DEVLINK_PORT_FLAVOUR_VIRTUAL;
  > 60			dl_port_index = mlx5_esw_vport_to_devlink_port_index(>mdev, 0);
    61		}
    62	
    63		devlink_port_attrs_set(&mlx5e_dev->dl_port, &attrs);
    64	
    65		return devlink_port_register(devlink, &mlx5e_dev->dl_port,
    66					     dl_port_index);
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
