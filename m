Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CCC37C;
	Thu, 16 Mar 2023 04:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678939521; x=1710475521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hpH6L+I/nEbsBP3kL+1fD0Z4aYVWtT5wrEZd2/6GUiQ=;
  b=FFDt7k/HqKjr0StMrKax/bbbp86cvdFnphxxFBeMmnGls2HLZs/5HwD0
   xh6MGnV9SGonAaURPvJZmbIp0t3/u/FybVZtXYpdQpbd5V3r/i//VBtKL
   7I7lGTYlMGCg6S4pyV09+q7Ml+9+IoSl/MFytBwU6pUNMARWXl1kWMhlh
   j65KbFMUEPmLZN45oWdxJdD7xGB7/5Xk/AE3Sm1nwJDFPVYBzWETihSn8
   6QZH6blv8uK5P5QdiCLxk2Ujef9Xu/lDupG/QiSM+OhMwVztof5rF8wtW
   Ah/K4DlX/CKo0LzB4hcYrmb/CKMX/uleMxb4dNppNKMpDyVpjWEUsu84U
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="317535894"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="317535894"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 21:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="790108656"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="790108656"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2023 21:05:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcerf-0008Hn-0q;
	Thu, 16 Mar 2023 04:05:19 +0000
Date: Thu, 16 Mar 2023 12:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 26/31]
 drivers/net/ethernet/mellanox/mlx4/intf.c:53:6: warning: no previous
 prototype for function 'is_eth_supported'
Message-ID: <202303161132.FK0lyTWs-lkp@intel.com>
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
commit: 49f2c235465534f179d6044a2c72f840ab0671ad [26/31] mlx4: Connect the ethernet part to the auxiliary bus
config: i386-randconfig-a013-20230313 (https://download.01.org/0day-ci/archive/20230316/202303161132.FK0lyTWs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/commit/?id=49f2c235465534f179d6044a2c72f840ab0671ad
        git remote add leon-rdma https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git
        git fetch --no-tags leon-rdma rdma-next
        git checkout 49f2c235465534f179d6044a2c72f840ab0671ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161132.FK0lyTWs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx4/intf.c:53:6: warning: no previous prototype for function 'is_eth_supported' [-Wmissing-prototypes]
   bool is_eth_supported(struct mlx4_dev *dev)
        ^
   drivers/net/ethernet/mellanox/mlx4/intf.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool is_eth_supported(struct mlx4_dev *dev)
   ^
   static 
   1 warning generated.


vim +/is_eth_supported +53 drivers/net/ethernet/mellanox/mlx4/intf.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
