Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0925A4414
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 16:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657642405; x=1689178405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c7Iz6RHMVKPXdsiWGS1iCkYOkcfyRfnOC1COzQRedNg=;
  b=UJ1JPz3OjelS2AG/BED/Cjsbh9Z4CvEP58XNF8p4+l3lwGPY8+OqkvL7
   sIOJSUMdLpA+Gk+0aXILqaBY4V0eUFYv1QVX6Fhq8GQQHPCDUmISiMsus
   WdvAUoPNqFywPe/U1DmWPZSIrHzW7z2taIYPfJBuiKsaGqjf5+6dwR7ZL
   aYnJ4jFw9W/lseF3SktPg6I+WjFmlZlqBYrmCOMTK91CWfTOQWJwveFda
   xjKX2boGZnxdmSvUfFyB6xdB/NZ56Zvs74CsBRelUYkrpI3b3HFQTGg0u
   7abbZPRwpKf0jx3JRUL9PeQW2Hel7lHIhse9tnvn7Bk5++0f5hpnizuBG
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285719486"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="285719486"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 09:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="652975426"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jul 2022 09:11:23 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBITq-0002O7-Mb;
	Tue, 12 Jul 2022 16:11:22 +0000
Date: Wed, 13 Jul 2022 00:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lama Kayal <lkayal@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: [saeed:mlx5-queue 40/68]
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:5015:57: warning: variable
 'err' is uninitialized when used here
Message-ID: <202207130003.SL9fRJbu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git mlx5-queue
head:   a78a596e3e1e4b584883b0a6f58d8f9c61943fb1
commit: 4d121fe4ec12681d4948420ee172eb9d325df533 [40/68] net/mlx5e: Convert mlx5e_flow_steering member of mlx5e_priv to pointer
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220713/202207130003.SL9fRJbu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project badda4ac3c489a8c8cccdad1f74b9308c350a9e0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git/commit/?id=4d121fe4ec12681d4948420ee172eb9d325df533
        git remote add saeed https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git
        git fetch --no-tags saeed mlx5-queue
        git checkout 4d121fe4ec12681d4948420ee172eb9d325df533
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/en_main.c:5015:57: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
                   mlx5_core_err(mdev, "FS initialization failed, %d\n", err);
                                                                         ^~~
   drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h:67:11: note: expanded from macro 'mlx5_core_err'
                  ##__VA_ARGS__)
                    ^~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_main.c:5006:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   1 warning generated.


vim +/err +5015 drivers/net/ethernet/mellanox/mlx5/core/en_main.c

593cf33829adfd Rana Shahout    2016-04-20  5000  
182570b26223de Feras Daoud     2018-10-02  5001  static int mlx5e_nic_init(struct mlx5_core_dev *mdev,
3ef14e463f6ed0 Saeed Mahameed  2020-02-25  5002  			  struct net_device *netdev)
6bfd390ba54666 Hadar Hen Zion  2016-07-01  5003  {
6bfd390ba54666 Hadar Hen Zion  2016-07-01  5004  	struct mlx5e_priv *priv = netdev_priv(netdev);
4d121fe4ec1268 Lama Kayal      2022-01-09  5005  	struct mlx5e_flow_steering *fs;
547eede070eb98 Ilan Tayari     2017-04-18  5006  	int err;
6bfd390ba54666 Hadar Hen Zion  2016-07-01  5007  
3ef14e463f6ed0 Saeed Mahameed  2020-02-25  5008  	mlx5e_build_nic_params(priv, &priv->xsk, netdev->mtu);
84db6612471416 Roi Dayan       2020-09-16  5009  	mlx5e_vxlan_set_netdev_info(priv);
519a0bf5b20c37 Saeed Mahameed  2018-09-12  5010  
519a0bf5b20c37 Saeed Mahameed  2018-09-12  5011  	mlx5e_timestamp_init(priv);
519a0bf5b20c37 Saeed Mahameed  2018-09-12  5012  
4d121fe4ec1268 Lama Kayal      2022-01-09  5013  	fs = mlx5e_fs_init(priv->profile);
4d121fe4ec1268 Lama Kayal      2022-01-09  5014  	if (!fs) {
68e66e1a69cd94 Moshe Shemesh   2021-10-02 @5015  		mlx5_core_err(mdev, "FS initialization failed, %d\n", err);
4d121fe4ec1268 Lama Kayal      2022-01-09  5016  		return -ENOMEM;
68e66e1a69cd94 Moshe Shemesh   2021-10-02  5017  	}
4d121fe4ec1268 Lama Kayal      2022-01-09  5018  	priv->fs = fs;
68e66e1a69cd94 Moshe Shemesh   2021-10-02  5019  
547eede070eb98 Ilan Tayari     2017-04-18  5020  	err = mlx5e_ipsec_init(priv);
547eede070eb98 Ilan Tayari     2017-04-18  5021  	if (err)
547eede070eb98 Ilan Tayari     2017-04-18  5022  		mlx5_core_err(mdev, "IPSec initialization failed, %d\n", err);
3ef14e463f6ed0 Saeed Mahameed  2020-02-25  5023  
943aa7bda37301 Leon Romanovsky 2022-04-04  5024  	err = mlx5e_ktls_init(priv);
43585a41bd8949 Ilya Lesokhin   2018-04-30  5025  	if (err)
43585a41bd8949 Ilya Lesokhin   2018-04-30  5026  		mlx5_core_err(mdev, "TLS initialization failed, %d\n", err);
3ef14e463f6ed0 Saeed Mahameed  2020-02-25  5027  
11af6a6d09e9a9 Aya Levin       2019-07-11  5028  	mlx5e_health_create_reporters(priv);
182570b26223de Feras Daoud     2018-10-02  5029  	return 0;
6bfd390ba54666 Hadar Hen Zion  2016-07-01  5030  }
6bfd390ba54666 Hadar Hen Zion  2016-07-01  5031  

:::::: The code at line 5015 was first introduced by commit
:::::: 68e66e1a69cd94f934522348ab232af49863452a net/mlx5e: Fix vlan data lost during suspend flow

:::::: TO: Moshe Shemesh <moshe@nvidia.com>
:::::: CC: Saeed Mahameed <saeedm@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
