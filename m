Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC052BA4E;
	Sat, 10 Jun 2023 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686402701; x=1717938701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=taMJlKAKA2towUqUDzWpc8HwtY1ZrICSivcLEeka6lo=;
  b=RZxI6FTgLkbtM9ZPSsWsjKUuOeRnMsUH1n34C4MyDoV3RvVNqt4+oGN/
   Ys228Lvg1akQ/DnIEpmSrp4slq9jKoMQkLClnFEPR+A47ojUgxANb6rfH
   Nnv/3tu1ykhFXNnkYq71PJOEYcjaOq5He1CWsIjdhdHO9UfweZ+p+mMqe
   wf0B7rYs9SqYuNpTfn4WGOpxZQSDsYfDATCdd23eTKAiuJ6Jhbwi3qIc8
   Sk7p95GgkTuOGr6At910jOwU+D0ZV6+ZFcVIjDfmphabX1cutlS4fSY+r
   f1nL0Ov/zSXeB6tKQpF65cVz3JaANYjnifXYj9M6Ep/+Gp48/0O3G3Ljl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="355252718"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="355252718"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 06:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="661061696"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="661061696"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jun 2023 06:11:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7yNV-000A6a-3C;
	Sat, 10 Jun 2023 13:11:37 +0000
Date: Sat, 10 Jun 2023 21:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <simon.horman@corigine.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>
Subject: [netdev-net-next:main 26/28] ld.lld: error: undefined symbol:
 efx_tc_netdev_event
Message-ID: <202306102026.ISK5JfUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
head:   e431e712c83676a8a9cd3988b323e3ef994a8ff3
commit: 7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9 [26/28] sfc: neighbour lookup for TC encap action offload
config: arm-randconfig-r011-20230610 (https://download.01.org/0day-ci/archive/20230610/202306102026.ISK5JfUQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9
        git remote add netdev-net-next https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
        git fetch --no-tags netdev-net-next main
        git checkout 7e5e7d800011adf4aeda615f8a1bc31c0c1e2bb9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306102026.ISK5JfUQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: efx_tc_netdev_event
   >>> referenced by ef100_netdev.c:313 (drivers/net/ethernet/sfc/ef100_netdev.c:313)
   >>>               drivers/net/ethernet/sfc/ef100_netdev.o:(ef100_netdev_event) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: efx_tc_netevent_event
   >>> referenced by ef100_netdev.c:329 (drivers/net/ethernet/sfc/ef100_netdev.c:329)
   >>>               drivers/net/ethernet/sfc/ef100_netdev.o:(ef100_netevent_event) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
