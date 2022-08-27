Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E78D17C5
	for <llvm@lists.linux.dev>; Sat, 27 Aug 2022 05:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661579458; x=1693115458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTIDnPUVNynQy5bkUrHHmocR0AYMrXJJvvAZPIRVHbM=;
  b=MU/sUCDAFa3oSyqkDF4xKi2c6PJKYmTr+ftr14igFiEqoiGa/7xBM0bY
   fZ/1zATolw81Yxe+gEWcv5I5rs9Cz2faQPqbLTr4P/t7l0J13nAtccuHA
   At8BzelNFQzS7bH4cUbDCra0fsJ+4Gu10ENxDzOoLf5icdQOEtJ87JEW1
   FyAlnwy9agnWrCqOvuRxuQ30l6TDqkuzmxU7UUnWtQnFmyW4plz55D+XT
   pBf28xx13cLuYDAOU5i7H/kpEN+oaUGw4DzCexeCLa77+5P9hkyPvi+S5
   C+QhA2qnsObmLE+ValK6MdZwvO/c5yBgTDOWpKCfZVYc7M5PiTkd/3fFS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="358605267"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="358605267"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 22:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="753097141"
Received: from lkp-server01.sh.intel.com (HELO 71b0d3b5b1bc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2022 22:50:39 -0700
Received: from kbuild by 71b0d3b5b1bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRoiN-00012p-0e;
	Sat, 27 Aug 2022 05:50:39 +0000
Date: Sat, 27 Aug 2022 13:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Roi Dayan <roid@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Saeed Mahameed <saeedm@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
	Maor Dickman <maord@nvidia.com>
Subject: [linux-next:master 2212/3682]
 drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: warning: variable
 'err' is used uninitialized whenever 'if' condition is false
Message-ID: <202208271304.MimlzZvl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d0c42c9e80791e8baba2932d2cbd2dcead50d47
commit: 430e2d5e2a982e6f86866762e6d6eb78191f9677 [2212/3682] net/mlx5: E-Switch, Move send to vport meta rule creation
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220827/202208271304.MimlzZvl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=430e2d5e2a982e6f86866762e6d6eb78191f9677
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 430e2d5e2a982e6f86866762e6d6eb78191f9677
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/ drivers/net/ethernet/mellanox/mlxsw/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (IS_ERR(flow_rule)) {
               ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:489:9: note: uninitialized use occurs here
           return err;
                  ^~~
   drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:2: note: remove the 'if' if its condition is always true
           if (IS_ERR(flow_rule)) {
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:474:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   1 warning generated.


vim +481 drivers/net/ethernet/mellanox/mlx5/core/en_rep.c

   465	
   466	static int
   467	mlx5e_rep_add_meta_tunnel_rule(struct mlx5e_priv *priv)
   468	{
   469		struct mlx5_eswitch *esw = priv->mdev->priv.eswitch;
   470		struct mlx5e_rep_priv *rpriv = priv->ppriv;
   471		struct mlx5_eswitch_rep *rep = rpriv->rep;
   472		struct mlx5_flow_handle *flow_rule;
   473		struct mlx5_flow_group *g;
   474		int err;
   475	
   476		g = esw->fdb_table.offloads.send_to_vport_meta_grp;
   477		if (!g)
   478			return 0;
   479	
   480		flow_rule = mlx5_eswitch_add_send_to_vport_meta_rule(esw, rep->vport);
 > 481		if (IS_ERR(flow_rule)) {
   482			err = PTR_ERR(flow_rule);
   483			goto out;
   484		}
   485	
   486		rpriv->send_to_vport_meta_rule = flow_rule;
   487	
   488	out:
   489		return err;
   490	}
   491	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
