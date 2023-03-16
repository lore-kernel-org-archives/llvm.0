Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDC3376;
	Thu, 16 Mar 2023 04:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678942704; x=1710478704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r7yFsFgexqTpUSKGYA0N1z0vkkc8GA9bmMC1sNWTb9o=;
  b=NkLUTaX/jHs8OKW74qUNovTlcXCopPik0HObBJljUbZN6874t4I4VcWK
   LlYjePQAH5TG9VqJNTY3BilNWXDUzfHfIMslTAp8HlqSZ0gwTjEXvRaa2
   7ATG8zPyzEHdSzwl8JfRvj/nYy4pGgzIY0B9zBqYqani8NCVpbOa41J3T
   jI91zl72h+IMnHPtdGlKWUYboxAYclEsAVSBsNsUYFKc/ls4OXubmpPZT
   DiAD5lXlvqU9qdtQ2JEVoU0gwya6+w9CFwDMJLDUOAQDVEot+xLOa66YN
   3ay+CDVrU6NE/dxtkpeFhi6a5xQUOrzr71lvS8rZj2woyME+6p8HnSBdq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="402762638"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="402762638"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 21:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="768785766"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="768785766"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2023 21:58:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcfgy-0008J5-2v;
	Thu, 16 Mar 2023 04:58:20 +0000
Date: Thu, 16 Mar 2023 12:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 27/31]
 drivers/net/ethernet/mellanox/mlx4/intf.c:62:6: warning: no previous
 prototype for function 'is_ib_supported'
Message-ID: <202303161210.hjGCYKry-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   712b4584a71d7f86b5f870dae8ee6e5abd42971f
commit: ed40d1a4b21149df98f2d3975d3b6752e33e2b88 [27/31] mlx4: Connect the infiniband part to the auxiliary bus
config: i386-randconfig-a013-20230313 (https://download.01.org/0day-ci/archive/20230316/202303161210.hjGCYKry-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/commit/?id=ed40d1a4b21149df98f2d3975d3b6752e33e2b88
        git remote add leon-rdma https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git
        git fetch --no-tags leon-rdma rdma-next
        git checkout ed40d1a4b21149df98f2d3975d3b6752e33e2b88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161210.hjGCYKry-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx4/intf.c:53:6: warning: no previous prototype for function 'is_eth_supported' [-Wmissing-prototypes]
   bool is_eth_supported(struct mlx4_dev *dev)
        ^
   drivers/net/ethernet/mellanox/mlx4/intf.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool is_eth_supported(struct mlx4_dev *dev)
   ^
   static 
>> drivers/net/ethernet/mellanox/mlx4/intf.c:62:6: warning: no previous prototype for function 'is_ib_supported' [-Wmissing-prototypes]
   bool is_ib_supported(struct mlx4_dev *dev)
        ^
   drivers/net/ethernet/mellanox/mlx4/intf.c:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool is_ib_supported(struct mlx4_dev *dev)
   ^
   static 
   2 warnings generated.


vim +/is_ib_supported +62 drivers/net/ethernet/mellanox/mlx4/intf.c

    52	
  > 53	bool is_eth_supported(struct mlx4_dev *dev)
    54	{
    55		for (int port = 1; port <= dev->caps.num_ports; port++)
    56			if (dev->caps.port_type[port] == MLX4_PORT_TYPE_ETH)
    57				return true;
    58	
    59		return false;
    60	}
    61	
  > 62	bool is_ib_supported(struct mlx4_dev *dev)
    63	{
    64		for (int port = 1; port <= dev->caps.num_ports; port++)
    65			if (dev->caps.port_type[port] == MLX4_PORT_TYPE_IB)
    66				return true;
    67	
    68		if (dev->caps.flags & MLX4_DEV_CAP_FLAG_IBOE)
    69			return true;
    70	
    71		return false;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
