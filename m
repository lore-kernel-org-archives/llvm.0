Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A172904
	for <llvm@lists.linux.dev>; Thu, 19 May 2022 16:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652979233; x=1684515233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8X0qL89+WozJq+hGjk8Bh2/GCXWpYIPIisS/UBgeSYs=;
  b=KilojnzL+t+LZHefVsqIcmSlCTJ2KlFU6/eL8LLAmhLP01y8rCiU9blj
   sGPoUEy0iiNjhe1sT8qayixE3CUAGaX+sYPdFgcz0Lv0GQ5eAbafcFB6G
   ucqBwE84O8/1h022A0m4MNOZ/6dRifF5rS5P+se2vU45lIPe9SqZzt7zI
   4iZ3017Rs93wu2ZiM2d5g17QDIg9QyR3pnf4hjAGxhJu/t9RzMZ4aaTGT
   12RhAwdPMQOKgn/BxyIlqNOAn8v6gC2Z/G5wA9NSffbr3m5a1FU+WnzVe
   nsLU1hJXKpZXed4gMlKLBuCwFxEl4czCb/MBiPZeTBVjIKZ5cJQnitDmU
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="332901948"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="332901948"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 09:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="556996184"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 May 2022 09:53:50 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrjPJ-0003lI-Mu;
	Thu, 19 May 2022 16:53:49 +0000
Date: Fri, 20 May 2022 00:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Eli Cohen <elic@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Saeed Mahameed <saeedm@nvidia.com>, Mark Bloch <mbloch@nvidia.com>
Subject: [linux-next:master 12347/12886]
 drivers/net/ethernet/mellanox/mlx5/core/lag/mpesw.h:22:6: warning: no
 previous prototype for function 'mlx5_lag_mpesw_init'
Message-ID: <202205200012.68rPHREP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21498d01d045c5b95b93e0a0625ae965b4330ebe
commit: 94db3317781922ba52722c58061e0e8517d4d80d [12347/12886] net/mlx5: Support multiport eswitch mode
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220520/202205200012.68rPHREP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=94db3317781922ba52722c58061e0e8517d4d80d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 94db3317781922ba52722c58061e0e8517d4d80d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlx5/core/lag/debugfs.c:4:
   In file included from drivers/net/ethernet/mellanox/mlx5/core/lag/lag.h:13:
>> drivers/net/ethernet/mellanox/mlx5/core/lag/mpesw.h:22:6: warning: no previous prototype for function 'mlx5_lag_mpesw_init' [-Wmissing-prototypes]
   void mlx5_lag_mpesw_init(struct mlx5_lag *ldev) {}
        ^
   drivers/net/ethernet/mellanox/mlx5/core/lag/mpesw.h:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mlx5_lag_mpesw_init(struct mlx5_lag *ldev) {}
   ^
   static 
>> drivers/net/ethernet/mellanox/mlx5/core/lag/mpesw.h:23:6: warning: no previous prototype for function 'mlx5_lag_mpesw_cleanup' [-Wmissing-prototypes]
   void mlx5_lag_mpesw_cleanup(struct mlx5_lag *ldev) {}
        ^
   drivers/net/ethernet/mellanox/mlx5/core/lag/mpesw.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mlx5_lag_mpesw_cleanup(struct mlx5_lag *ldev) {}
   ^
   static 
   2 warnings generated.


vim +/mlx5_lag_mpesw_init +22 drivers/net/ethernet/mellanox/mlx5/core/lag/mpesw.h

    14	
    15	void mlx5_mpesw_work(struct work_struct *work);
    16	int mlx5_lag_do_mirred(struct mlx5_core_dev *mdev, struct net_device *out_dev);
    17	bool mlx5_lag_mpesw_is_activated(struct mlx5_core_dev *dev);
    18	#if IS_ENABLED(CONFIG_MLX5_ESWITCH)
    19	void mlx5_lag_mpesw_init(struct mlx5_lag *ldev);
    20	void mlx5_lag_mpesw_cleanup(struct mlx5_lag *ldev);
    21	#else
  > 22	void mlx5_lag_mpesw_init(struct mlx5_lag *ldev) {}
  > 23	void mlx5_lag_mpesw_cleanup(struct mlx5_lag *ldev) {}
    24	#endif
    25	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
