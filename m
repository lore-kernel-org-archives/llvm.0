Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D423185D;
	Thu, 16 Oct 2025 21:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760650569; cv=none; b=CcKV+j9JcIC4v91IzIQYAdX3wsQXfhIcw28W/kuXF1A5wdAI8rEvJeNEAoEKJq60/xuU+geJMAv0NXzKszZo5iUm5NCvDdtWTe+qA+zERbKQkDJTqBPtSHWHzBNfeaaZ6cb92hwnNFqe0X5Cspn+gvKSg3MJlh/4wOTRVdG8So0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760650569; c=relaxed/simple;
	bh=uVbxIBDtJ6avmsRcu1VMzgaYxHFdu2dpZ8WUD/BJGGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfUVcXX1hPsCJP7HGpO0Zmr8IKavLlxkyh+2G8wk8aGFJR1lVjrdSPOm3mNQX7KV0/N9Vzt2xhQU8Q6fWef+eP5NCVbpGudIX/qsmorB0KZlyvt66ED1CttbSa5aiNx9Q2agT0PWttcjHHCHA/rwyCty9rSx4OsghUUwsFz0QLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmkCpObj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmkCpObj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760650567; x=1792186567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uVbxIBDtJ6avmsRcu1VMzgaYxHFdu2dpZ8WUD/BJGGc=;
  b=DmkCpObjke3O5Vo3fE6HY7i+trNKoGt5SSWGjL2iPwIPucozOeDTVodj
   i4nO/ydJ1c3w1fnXkflaFwEzGerFcEcOve+G/0NfBvKPGPzu201W82vmj
   FtS9yt787rvig77tzqqbWJQK8gqDuXF9ZvQ6nK+SiiLEKtwLyN3NFz9Sz
   O3wr8gk9/LW5NRJx185qIpslrHqhdegTU3LAwUwf4YIuWhz1Nd37sdm6u
   69DdDBHpZMJJtfGdwitVsjZwjMQhCGrts02PTlJ76z7U8m3yrJPqYo/0P
   QQ4FU77/rxPHWCKqNH30raLjgCYEUAwaO7SdTvXSG3qftQx70k9HK1LAT
   w==;
X-CSE-ConnectionGUID: VsX5n/9iSVaAmlIVtQtV2A==
X-CSE-MsgGUID: RvIwf4SrQtSR161DxZ2M2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="85476637"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="85476637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 14:36:05 -0700
X-CSE-ConnectionGUID: kuu7jeVNSc+SpZM+qg7+gg==
X-CSE-MsgGUID: dX5YN5uVRx648xdCouaxkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213534682"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 14:36:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Vdg-0005GZ-1G;
	Thu, 16 Oct 2025 21:36:00 +0000
Date: Fri, 17 Oct 2025 05:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: Saeed Mahameed <saeed@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>, mbloch@nvidia.com,
	Adithya Jayachandran <ajayachandra@nvidia.com>
Subject: Re: [PATCH net-next 2/3] net/mlx5: MPFS, add support for dynamic
 enable/disable
Message-ID: <202510170416.DfoJV8mp-lkp@intel.com>
References: <20251016013618.2030940-3-saeed@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016013618.2030940-3-saeed@kernel.org>

Hi Saeed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Saeed-Mahameed/devlink-Introduce-devlink-eswitch-state/20251016-094245
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251016013618.2030940-3-saeed%40kernel.org
patch subject: [PATCH net-next 2/3] net/mlx5: MPFS, add support for dynamic enable/disable
config: x86_64-randconfig-075-20251017 (https://download.01.org/0day-ci/archive/20251017/202510170416.DfoJV8mp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170416.DfoJV8mp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170416.DfoJV8mp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlx5/core/sriov.c:38:
   In file included from drivers/net/ethernet/mellanox/mlx5/core/eswitch.h:45:
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97:5: warning: no previous prototype for function 'mlx5_mpfs_enable' [-Wmissing-prototypes]
      97 | int mlx5_mpfs_enable(struct mlx5_core_dev *dev) { return 0; }
         |     ^
   drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | int mlx5_mpfs_enable(struct mlx5_core_dev *dev) { return 0; }
         | ^
         | static 
>> drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98:6: warning: no previous prototype for function 'mlx5_mpfs_disable' [-Wmissing-prototypes]
      98 | void mlx5_mpfs_disable(struct mlx5_core_dev *dev) {}
         |      ^
   drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h:98:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      98 | void mlx5_mpfs_disable(struct mlx5_core_dev *dev) {}
         | ^
         | static 
   2 warnings generated.


vim +/mlx5_mpfs_enable +97 drivers/net/ethernet/mellanox/mlx5/core/lib/mpfs.h

    87	
    88	#ifdef CONFIG_MLX5_MPFS
    89	struct mlx5_core_dev;
    90	int  mlx5_mpfs_init(struct mlx5_core_dev *dev);
    91	void mlx5_mpfs_cleanup(struct mlx5_core_dev *dev);
    92	int mlx5_mpfs_enable(struct mlx5_core_dev *dev);
    93	void mlx5_mpfs_disable(struct mlx5_core_dev *dev);
    94	#else /* #ifndef CONFIG_MLX5_MPFS */
    95	static inline int  mlx5_mpfs_init(struct mlx5_core_dev *dev) { return 0; }
    96	static inline void mlx5_mpfs_cleanup(struct mlx5_core_dev *dev) {}
  > 97	int mlx5_mpfs_enable(struct mlx5_core_dev *dev) { return 0; }
  > 98	void mlx5_mpfs_disable(struct mlx5_core_dev *dev) {}
    99	#endif
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
