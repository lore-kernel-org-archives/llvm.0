Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993D0480346;
	Wed,  3 Jun 2026 18:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780513010; cv=none; b=FJIG+zAD4mgv0lEeDO4rFEETL6rCZMwJw7feXLN10A9PwyaS9pRUbjwFOnCW7vLzoR1fzeElxdZygmHVpDrybQ2v9Foh20z1pNiyuSHSzB6lgEBc1lgHXEaId+OJsdLsz6Q7no/2+ClY5ylHS+uP8mXjOliT2sCt9DDz0J5h8sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780513010; c=relaxed/simple;
	bh=K1m9iz3Mf/Z/2HkW2/lw6CLgBeM4sVWKVrxUJtsSUkg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bwzKqvCRrkj3XgCKQv4GC1lMf0t9AIt5gyX3g8vFf53O9bLUwqGfmLSppKIrL7iaei8LlwRRwcJKzYgPuwzBJz79ARAWOX5K5E8RRociBYkJQGZ1QImON2/mSDA18mG5hIiHDUL/lROktHnPu6HaqiK/OKu4WZx86Oiyd3r5ca4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUwwSjtC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUwwSjtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780513010; x=1812049010;
  h=date:from:to:cc:subject:message-id;
  bh=K1m9iz3Mf/Z/2HkW2/lw6CLgBeM4sVWKVrxUJtsSUkg=;
  b=LUwwSjtCQpuQT47VpZfffHddvW6suPEN9vyiVWWEGDdq2zRPadeFe44D
   WQJfr78QQ85syKi5Yn3SUVeyXU+0aIrLVMyAokKwxOKYlm0CKurgNwr5m
   aizqRrVag/+9bjFQL8ediccBoQ9Ct6itVRcyueqYof03JY0tmrPYD1ZV2
   oCfIfzvNuQSFl/u296ugtvKXCnNYmf6X1sI/z5X093wh1B5dJkmdbotnh
   gMHYg22xIjB4lejP5y1Hm5GbaNwj7RqDa2nJqVaad/1dlf9XZN3Y6A+nw
   U/xnZesOwtucwKAm5mFlZ7/R1qjwU6Wj+N9+Gma6tF45zk5oNLaXNEnDj
   w==;
X-CSE-ConnectionGUID: mb7VknvhRIe4KRTnoLmY5A==
X-CSE-MsgGUID: uswGaafSRXKIoQSvWdgCGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81073583"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="81073583"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 11:56:50 -0700
X-CSE-ConnectionGUID: 2VsjqbCfS0q60h7q3shhGw==
X-CSE-MsgGUID: v/I7X/MCQU62sOU/ZythQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="248647347"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 03 Jun 2026 11:56:47 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUqlh-0000000028L-0Xuq;
	Wed, 03 Jun 2026 18:56:45 +0000
Date: Wed, 03 Jun 2026 20:56:10 +0200
From: kernel test robot <lkp@intel.com>
To: Nikolay Aleksandrov <nikolay@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, David Ahern <dsahern@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>
Subject: 
 drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c:877:10: error:
 incompatible function pointer types initializing 'int (*)(struct devlink *,
 u32, union devlink_param_value *, struct netlink_ext_ack *)' (aka 'int
 (*)(struct devlink *, unsigned int, un...
Message-ID: <202606032050.tgc4z881-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tariq-Toukan/devlink-add-generic-device-max_sfs-parameter/20260603-183351
head:   3f9c478ff2a7ceca60d14dab453bbd80ba5347fd
commit: 3f9c478ff2a7ceca60d14dab453bbd80ba5347fd net/mlx5: implement max_sfs parameter
date:   8 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260603/202606032050.tgc4z881-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606032050.tgc4z881-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606032050.tgc4z881-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c:877:10: error: incompatible function pointer types initializing 'int (*)(struct devlink *, u32, union devlink_param_value *, struct netlink_ext_ack *)' (aka 'int (*)(struct devlink *, unsigned int, union devlink_param_value *, struct netlink_ext_ack *)') with an expression of type 'int (struct devlink *, u32, union devlink_param_value, struct netlink_ext_ack *)' (aka 'int (struct devlink *, unsigned int, union devlink_param_value, struct netlink_ext_ack *)') [-Wincompatible-function-pointer-types]
     877 |                               mlx5_devlink_max_sfs_validate),
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +877 drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c

   865	
   866	static const struct devlink_param mlx5_nv_param_devlink_params[] = {
   867		DEVLINK_PARAM_GENERIC(ENABLE_SRIOV, BIT(DEVLINK_PARAM_CMODE_PERMANENT),
   868				      mlx5_devlink_enable_sriov_get,
   869				      mlx5_devlink_enable_sriov_set, NULL),
   870		DEVLINK_PARAM_GENERIC(TOTAL_VFS, BIT(DEVLINK_PARAM_CMODE_PERMANENT),
   871				      mlx5_devlink_total_vfs_get,
   872				      mlx5_devlink_total_vfs_set,
   873				      mlx5_devlink_total_vfs_validate),
   874		DEVLINK_PARAM_GENERIC(MAX_SFS, BIT(DEVLINK_PARAM_CMODE_PERMANENT),
   875				      mlx5_devlink_max_sfs_get,
   876				      mlx5_devlink_max_sfs_set,
 > 877				      mlx5_devlink_max_sfs_validate),
   878		DEVLINK_PARAM_DRIVER(MLX5_DEVLINK_PARAM_ID_CQE_COMPRESSION_TYPE,
   879				     "cqe_compress_type", DEVLINK_PARAM_TYPE_STRING,
   880				     BIT(DEVLINK_PARAM_CMODE_PERMANENT),
   881				     mlx5_nv_param_devlink_cqe_compress_get,
   882				     mlx5_nv_param_devlink_cqe_compress_set,
   883				     mlx5_nv_param_devlink_cqe_compress_validate),
   884		DEVLINK_PARAM_DRIVER_WITH_DEFAULTS(MLX5_DEVLINK_PARAM_ID_SWP_L4_CSUM_MODE,
   885						   "swp_l4_csum_mode", DEVLINK_PARAM_TYPE_STRING,
   886						   BIT(DEVLINK_PARAM_CMODE_PERMANENT),
   887						   mlx5_devlink_swp_l4_csum_mode_get,
   888						   mlx5_devlink_swp_l4_csum_mode_set,
   889						   mlx5_devlink_swp_l4_csum_mode_validate,
   890						   mlx5_devlink_swp_l4_csum_mode_get_default,
   891						   mlx5_devlink_swp_l4_csum_mode_set_default),
   892	};
   893	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
