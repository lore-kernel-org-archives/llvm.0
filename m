Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA7F63B5;
	Wed,  7 Jun 2023 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686156644; x=1717692644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SEgnOiDfpgT7K4MDwD8lslf+8SvraVHJTzb/YRJqyBA=;
  b=oHh4WoCzSPbBYFiXPxyBcpdjrgA6fmABi/eBTddH1bgAgy8aShICW3BE
   CRMOfiBfz1Js68z7Z1PeozDxEeMTeluqjeT7oGnzBzvKlywuavm7fvEHc
   n3ObBKf+td1Zn3kqC9UY7jJ75uis4SmI/3K5iK+o9/RuCTduO6yUR6g80
   ylVwk709xTihlzgeWrVOfpO8hHiD6KJHBnR+M67XXicElX/iS/JtFq/KM
   jULYbclanvtaLUfCAWXklTzX4HavqL5LOd/6ViRfUajbRhajcCGaj65bE
   6V1W6HKS4E0ea0723x7Y9GvBO21epBBHP0KK7xgNSHuJ6eMJdPUxqE3a9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="385373288"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="385373288"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 09:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="703732397"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="703732397"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Jun 2023 09:50:30 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6wMg-0006lD-0J;
	Wed, 07 Jun 2023 16:50:30 +0000
Date: Thu, 8 Jun 2023 00:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Danielle Ratson <danieller@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 75/82]
 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9834:34: warning:
 variable 'rif' is uninitialized when used here
Message-ID: <202306080029.CAKJ1SGq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   c58ed86fb0a2783e661f4fbb5b9cb02cd1207bbb
commit: 2cdf9abaaae530f19b20b2b4bf570b23b4233bc3 [75/82] mlxsw: spectrum_router: Replay IP NETDEV_UP on device enslavement
config: powerpc-randconfig-r031-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080029.CAKJ1SGq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/jpirko/linux_mlxsw/commit/2cdf9abaaae530f19b20b2b4bf570b23b4233bc3
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw combined_queue
        git checkout 2cdf9abaaae530f19b20b2b4bf570b23b4233bc3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/ethernet/mellanox/mlxsw/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080029.CAKJ1SGq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9834:34: warning: variable 'rif' is uninitialized when used here [-Wuninitialized]
    9834 |         if (!mlxsw_sp_rif_should_config(rif, dev, NETDEV_UP))
         |                                         ^~~
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9821:26: note: initialize the variable 'rif' to silence this warning
    9821 |         struct mlxsw_sp_rif *rif;
         |                                 ^
         |                                  = NULL
   1 warning generated.


vim +/rif +9834 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c

  9815	
  9816	static int mlxsw_sp_router_unreplay_inetaddr_up(struct net_device *dev,
  9817							struct netdev_nested_priv *priv)
  9818	{
  9819		struct mlxsw_sp_router_replay_inetaddr_up *ctx = priv->data;
  9820		struct mlxsw_sp_crif *crif;
  9821		struct mlxsw_sp_rif *rif;
  9822	
  9823		if (!ctx->done)
  9824			return 0;
  9825	
  9826		if (mlxsw_sp_dev_addr_list_empty(dev))
  9827			return 0;
  9828	
  9829		crif = mlxsw_sp_crif_lookup(ctx->mlxsw_sp->router, dev);
  9830		if (!crif || !crif->rif)
  9831			return 0;
  9832	
  9833		/* We are rolling back NETDEV_UP, so ask for that. */
> 9834		if (!mlxsw_sp_rif_should_config(rif, dev, NETDEV_UP))
  9835			return 0;
  9836	
  9837		__mlxsw_sp_inetaddr_event(ctx->mlxsw_sp, dev, NETDEV_DOWN, false, NULL);
  9838	
  9839		ctx->done--;
  9840		return 0;
  9841	}
  9842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
