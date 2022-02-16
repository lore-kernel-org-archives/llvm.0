Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7041B3668
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 17:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645033968; x=1676569968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/MuB3Mup/CLGmN40NIuicGQzGSxEz7jP2XRVcgPy2U=;
  b=bX3iofNOthV+AmvnIKHLr8PnQla/jGtq2blGKw2t3pi0cH1r4n9Y/J8i
   zF1EqOhVja7xK5xjSPCZjFpM2gyNbIx4g/Bw3NyVG0IzqPXOMHQDowxOs
   OW3DNu9w2sAGKjx6ZL7n9dzfdjN0TTLc+imDB55oM2flpZu9LiuFPYok8
   YGVl0LlMoYO0XhNDDZuMmAarT8B5EWhdTMCHYSBT1y5UwLS9KoyMbe50Z
   /fM/MJKEEjagEEb8Gn82OvCyx4X5EMvyQZbJHTfdk676mhPGJKyorczyR
   7xR3NDeXWzYB+t3SreSlocUVdMKWKNMw0XsszRueFPcYEM6wJIZegIODT
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="311425800"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="311425800"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 09:52:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="681612264"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2022 09:52:46 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKOTt-000B0e-JI; Wed, 16 Feb 2022 17:52:45 +0000
Date: Thu, 17 Feb 2022 01:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Pasternak <vadimp@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Jiri Pirko <jiri@nvidia.com>
Subject: [jpirko-mlxsw:jiri_devel_linecards 27/43]
 drivers/net/ethernet/mellanox/mlxsw/core_env.c:1249:16: error: incompatible
 function pointer types initializing 'void (*)(struct mlxsw_core *, u8, void
 *, void *)' (aka 'void (*)(struct mlxsw_core *, unsigned char, void *, void
 *)') with an expression of ...
Message-ID: <202202170101.p6TIUxNw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_linecards
head:   5cb021512c3be7e03591497caeab474ecccfcd21
commit: 08ac493598146680137ed7a81dc108b837018125 [27/43] mlxsw: core: Add interfaces for line card initialization and de-initialization
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220217/202202170101.p6TIUxNw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/08ac493598146680137ed7a81dc108b837018125
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_linecards
        git checkout 08ac493598146680137ed7a81dc108b837018125
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlxsw/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlxsw/core_env.c:1249:16: error: incompatible function pointer types initializing 'void (*)(struct mlxsw_core *, u8, void *, void *)' (aka 'void (*)(struct mlxsw_core *, unsigned char, void *, void *)') with an expression of type 'void (struct mlxsw_core *, u8, const struct mlxsw_linecard *, void *)' (aka 'void (struct mlxsw_core *, unsigned char, const struct mlxsw_linecard *, void *)') [-Werror,-Wincompatible-function-pointer-types]
           .got_active = mlxsw_env_got_active,
                         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_env.c:1250:18: error: incompatible function pointer types initializing 'void (*)(struct mlxsw_core *, u8, void *, void *)' (aka 'void (*)(struct mlxsw_core *, unsigned char, void *, void *)') with an expression of type 'void (struct mlxsw_core *, u8, const struct mlxsw_linecard *, void *)' (aka 'void (struct mlxsw_core *, unsigned char, const struct mlxsw_linecard *, void *)') [-Werror,-Wincompatible-function-pointer-types]
           .got_inactive = mlxsw_env_got_inactive,
                           ^~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +1249 drivers/net/ethernet/mellanox/mlxsw/core_env.c

  1247	
  1248	static struct mlxsw_linecards_event_ops mlxsw_env_event_ops = {
> 1249		.got_active = mlxsw_env_got_active,
  1250		.got_inactive = mlxsw_env_got_inactive,
  1251	};
  1252	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
