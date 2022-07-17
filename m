Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52FA817
	for <llvm@lists.linux.dev>; Sun, 17 Jul 2022 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658062851; x=1689598851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7DYz/+hXHOyXQ/XcLUsoH4nbwpS2tzcO/qeLi/FhQ44=;
  b=XM1IEeYcG08LNsUodzXkF5HcAn07Tad7lseZ9ynWBW5S0ldVVCnW/mA3
   y/+amJgqH3lr4R7PANSbkb2AgYQXs2/D2+TdEkn1PUqRyxCiwNCFB9i0y
   9apyNqliFIGeEMX0erDOjMeOOFw3KJbYBldP7huSNP4/zcYGIiTe63BJ2
   Ig6xQO4zCzLguBIubL0N+PzfjdTJJmlbV0jzkFDixd7FKQGOdM8hyeyuU
   F8SPZpyuOIYBo6pFovvu1i8JjNLpxjhxboSJE40QGUJPJaKpk5cDOXpAT
   sUesJYCvawFaHPaNMf7bR5Ia5z9wNJZ9gVe6i6fOubGca3+raJrpYaQ0N
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="350022428"
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; 
   d="scan'208";a="350022428"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2022 06:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; 
   d="scan'208";a="686458132"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jul 2022 06:00:32 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oD3st-0003GJ-TT;
	Sun, 17 Jul 2022 13:00:31 +0000
Date: Sun, 17 Jul 2022 20:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Saeed Mahameed <saeedm@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [saeed:net-next 46/50]
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3867:5: warning: stack
 frame size (1120) exceeds limit (1024) in 'mlx5e_set_features'
Message-ID: <202207172048.I1B682Ok-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git net-next
head:   fbb84e645ecffed83efc79743bce152dd7d122a8
commit: 5f0d554cf45f149e9ecc57b6cb43a49a18968151 [46/50] Merge branch 'patchq/501993' into mlx5-queue
config: riscv-randconfig-r013-20220717 (https://download.01.org/0day-ci/archive/20220717/202207172048.I1B682Ok-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 45067f8fbf61284839c739807c2da2e2505661eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git/commit/?id=5f0d554cf45f149e9ecc57b6cb43a49a18968151
        git remote add saeed https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git
        git fetch --no-tags saeed net-next
        git checkout 5f0d554cf45f149e9ecc57b6cb43a49a18968151
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3867:5: warning: stack frame size (1120) exceeds limit (1024) in 'mlx5e_set_features' [-Wframe-larger-than]
   int mlx5e_set_features(struct net_device *netdev, netdev_features_t features)
       ^
   drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3438:12: warning: stack frame size (1104) exceeds limit (1024) in 'mlx5e_setup_tc' [-Wframe-larger-than]
   static int mlx5e_setup_tc(struct net_device *dev, enum tc_setup_type type,
              ^
   2 warnings generated.


vim +/mlx5e_set_features +3867 drivers/net/ethernet/mellanox/mlx5/core/en_main.c

0e405443e803a3c Gal Pressman 2016-04-24  3866  
d3cbd4254df8817 Chris Mi     2019-05-16 @3867  int mlx5e_set_features(struct net_device *netdev, netdev_features_t features)
0e405443e803a3c Gal Pressman 2016-04-24  3868  {
992d8a4e38f0527 Gal Pressman 2021-11-29  3869  	netdev_features_t oper_features = features;
be0f780bc50a002 Gal Pressman 2018-01-11  3870  	int err = 0;
be0f780bc50a002 Gal Pressman 2018-01-11  3871  

:::::: The code at line 3867 was first introduced by commit
:::::: d3cbd4254df881777e2efb68ee10ede0d9dc0647 net/mlx5e: Add ndo_set_feature for uplink representor

:::::: TO: Chris Mi <chrism@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
