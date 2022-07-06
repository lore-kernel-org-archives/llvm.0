Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88A97C
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657096896; x=1688632896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7udfgNra6mujz5rBRUlQoR8QCZrJarCTZMIThcKPVRQ=;
  b=eEtg70riQniDQA5K4800LgpfMecbju4sAZJvJUP5IxCuOaDkSakGF/wB
   WZofRRcKgxkL5KfPZ5p8NEzlM/9mrx/0YEp3oZrjlPB0dMJu+x0m158Je
   91SIrRiBr3FF3cCLI5M/q7rQNgpevFLfd0qT8lYx9/0bkohpTW3rZioih
   WEl6GS8keTXydf/M40st7+c/V4GRX8Cg1MhDBZ0gd0Px9ujy+ISv+QzRr
   t4Zl/0t7wIEg3tV2OCW8cwx2UkI8tXxA9BNpAue8xXqfRO3mR94JMjN3s
   ytHF0f59a2NqmJt1pjfEoNomY447GSTvSdcjA9OCAEvZd3G2gt6EaIdAD
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="347669090"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="347669090"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 01:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="735486426"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2022 01:41:34 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o90bF-000KHV-SS;
	Wed, 06 Jul 2022 08:41:33 +0000
Date: Wed, 6 Jul 2022 16:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: Moshe Tal <moshet@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: [saeed:net-next 1/52]
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3404:12: warning: stack
 frame size (1104) exceeds limit (1024) in 'mlx5e_setup_tc_mqprio'
Message-ID: <202207061612.xOfK0eiz-lkp@intel.com>
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
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20220706/202207061612.xOfK0eiz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f553287b588916de09c66e3e32bf75e5060f967f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git/commit/?id=b229566876d91a99322a682e98beaa68dc38f9c9
        git remote add saeed https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git
        git fetch --no-tags saeed net-next
        git checkout b229566876d91a99322a682e98beaa68dc38f9c9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3404:12: warning: stack frame size (1104) exceeds limit (1024) in 'mlx5e_setup_tc_mqprio' [-Wframe-larger-than]
   static int mlx5e_setup_tc_mqprio(struct mlx5e_priv *priv,
              ^
   1 warning generated.


vim +/mlx5e_setup_tc_mqprio +3404 drivers/net/ethernet/mellanox/mlx5/core/en_main.c

b229566876d91a Moshe Tal    2022-05-04  3403  
e2aeac448f06ac Tariq Toukan 2021-07-06 @3404  static int mlx5e_setup_tc_mqprio(struct mlx5e_priv *priv,
e2aeac448f06ac Tariq Toukan 2021-07-06  3405  				 struct tc_mqprio_qopt_offload *mqprio)
e2aeac448f06ac Tariq Toukan 2021-07-06  3406  {
e2aeac448f06ac Tariq Toukan 2021-07-06  3407  	/* MQPRIO is another toplevel qdisc that can't be attached
e2aeac448f06ac Tariq Toukan 2021-07-06  3408  	 * simultaneously with the offloaded HTB.
e2aeac448f06ac Tariq Toukan 2021-07-06  3409  	 */
e2aeac448f06ac Tariq Toukan 2021-07-06  3410  	if (WARN_ON(priv->htb.maj_id))
e2aeac448f06ac Tariq Toukan 2021-07-06  3411  		return -EINVAL;
e2aeac448f06ac Tariq Toukan 2021-07-06  3412  
e2aeac448f06ac Tariq Toukan 2021-07-06  3413  	switch (mqprio->mode) {
e2aeac448f06ac Tariq Toukan 2021-07-06  3414  	case TC_MQPRIO_MODE_DCB:
e2aeac448f06ac Tariq Toukan 2021-07-06  3415  		return mlx5e_setup_tc_mqprio_dcb(priv, &mqprio->qopt);
ec60c4581bd952 Tariq Toukan 2021-08-11  3416  	case TC_MQPRIO_MODE_CHANNEL:
ec60c4581bd952 Tariq Toukan 2021-08-11  3417  		return mlx5e_setup_tc_mqprio_channel(priv, mqprio);
e2aeac448f06ac Tariq Toukan 2021-07-06  3418  	default:
e2aeac448f06ac Tariq Toukan 2021-07-06  3419  		return -EOPNOTSUPP;
e2aeac448f06ac Tariq Toukan 2021-07-06  3420  	}
e2aeac448f06ac Tariq Toukan 2021-07-06  3421  }
e2aeac448f06ac Tariq Toukan 2021-07-06  3422  

:::::: The code at line 3404 was first introduced by commit
:::::: e2aeac448f06ac6c6bee41a7ebecf814f7a57eef net/mlx5e: Maintain MQPRIO mode parameter

:::::: TO: Tariq Toukan <tariqt@nvidia.com>
:::::: CC: Saeed Mahameed <saeedm@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
