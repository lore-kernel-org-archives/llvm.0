Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D59179;
	Tue, 13 Jun 2023 02:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686623489; x=1718159489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GOiNhNQJ7Kbc4limx3A3nHNPpQ3hcpot1ecRyWzTGn0=;
  b=HSj9xXf6qfmGPpon6dRhD6j9q0k5TL3Tz2oYPd4HkN8/0aFxbvP4lUJC
   1SNH/OHYaXOECnmlg4s857we9YvcDg6dahLGVr8cVc8ugy//H3Qb/Bc0C
   FycOJYRehN48xG9N/QsuTklv8gA34OgxWBrryQY+LZ8zLlrJsA8C/AjrY
   iGVGk+Lox571RDEG2QnFFrX0mltO5Fh3VS/N3oPqseIzK1Y3+uFUpeCQy
   TfBdJ/qOB/eY9DSnNfU130+tTQwjSjJ/+qcnCKRvIBNuHIOp/sLICH+tG
   TeTloYoJFVeuJi7H3gJLMZwrHp/+rWKESLc7hTufzps9zL791wWTL7G53
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="347864115"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="347864115"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 19:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="885674094"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="885674094"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Jun 2023 19:31:26 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8toc-0000w6-0Z;
	Tue, 13 Jun 2023 02:31:26 +0000
Date: Tue, 13 Jun 2023 10:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Danielle Ratson <danieller@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 76/94]
 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9834:34: warning:
 variable 'rif' is uninitialized when used here
Message-ID: <202306131041.qUsgJbAX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   3cfb81e62be1e484eed57086d87ac32038f50fa5
commit: 5efc31463b07489a9a3cec153a696c93d0a3a6a6 [76/94] mlxsw: spectrum_router: Replay IP NETDEV_UP on device enslavement
config: i386-randconfig-i004-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131041.qUsgJbAX-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/5efc31463b07489a9a3cec153a696c93d0a3a6a6
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw combined_queue
        git checkout 5efc31463b07489a9a3cec153a696c93d0a3a6a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpio/ drivers/net/ethernet/mellanox/mlxsw/ sound/soc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131041.qUsgJbAX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9834:34: warning: variable 'rif' is uninitialized when used here [-Wuninitialized]
           if (!mlxsw_sp_rif_should_config(rif, dev, NETDEV_UP))
                                           ^~~
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9821:26: note: initialize the variable 'rif' to silence this warning
           struct mlxsw_sp_rif *rif;
                                   ^
                                    = NULL
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
