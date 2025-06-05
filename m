Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF2B20FA8B;
	Thu,  5 Jun 2025 22:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749162097; cv=none; b=CSZra4fJtlhptIxrFLi1ROzDaCdzDOCytVKWvZPL8JsaftO24HWVfSoZ3uwyLy2TUvkO0E8d0ksYyNlX0HxlGVJwKd4rTrSt/q8I1o1Vw3cXucguaWCZE+BOJdAK1i4s5wJolyeBj4qDb96Y+8dLy9ty0CsW6q/WylZ1WkLYiO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749162097; c=relaxed/simple;
	bh=5Rz5qcm+DQp0PQcRDY+At3gmN7yKbD5lAwd7JQc9Kbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eMwm+sgAxnEHqG7OHoquSBqLg/zOozyZTWaSFhfcGRYcasTBIAJttuz1mVyLlbmdl08Mnk9KaWZytQ0DTWndofNWDluLAINIDuqO5Onn59iyX6B1Ogt1K5rALt4qOTAI9As5Pr1wKWGTXCsdmqaZdAYFRx+cSbb8rvKkmqwrD50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4Nkv5iX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4Nkv5iX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749162096; x=1780698096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Rz5qcm+DQp0PQcRDY+At3gmN7yKbD5lAwd7JQc9Kbc=;
  b=Z4Nkv5iXB1ml1ABBIJc6X6KC7bdGNMTrmB3/j//FHNwGthi0ZIS98Uay
   mfD7+63fW7DOFg3ueASL2mGwMQo8hgJ7zfyURwWuDTfUNJEVrspGKChPR
   nfXaAPHKS53ArmmNhU4H0uOQctrZ8gvGNpFJs1S+5EXMEGVZUOjU7DpBK
   9bZ7nJerQEIyLl78wGEeOuLcY1iy+Xfr7MHwPgP0qXzsFq1mnhnhHekD5
   gW4IkOFOc6MXMn0WJZqyGcqufiT1OTMNi/Z2PYgniv8I2yYQ9AO9j2xgd
   TPrGF7PplB35BUU4lPnclgm9MqpqEhFH7UY49DVB1fBoHeE3mt2gEMF/G
   A==;
X-CSE-ConnectionGUID: rc3Ehy7fR82Z0tsl7/+Aqw==
X-CSE-MsgGUID: zySWpwELSuGCtbKmrgpy5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51399154"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="51399154"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 15:21:35 -0700
X-CSE-ConnectionGUID: N/D9bld5RhC3/hF0nKTlCw==
X-CSE-MsgGUID: 0qJz7KWaTeK+CL+oeh2yMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="145590735"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2025 15:21:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNIxo-0004Vt-14;
	Thu, 05 Jun 2025 22:21:32 +0000
Date: Fri, 6 Jun 2025 06:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:move-drivers 10/14] ERROR: modpost:
 "mlx5e_arfs_destroy_tables" [drivers/infiniband/hw/mlx5/mlx5_ib.ko]
 undefined!
Message-ID: <202506060608.Z6ts2Mn1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git move-drivers
head:   7c037ebae89e2ccf00fd35276d97b5a2fa113e27
commit: de2172556640f73cd0cdae776f54ffa0ecd673bb [10/14] RDMA/mlx5: Move IPoIB to relevant subsystem
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250606/202506060608.Z6ts2Mn1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060608.Z6ts2Mn1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060608.Z6ts2Mn1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mlx5e_arfs_destroy_tables" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
>> ERROR: modpost: "mlx5e_arfs_create_tables" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
ERROR: modpost: "mlx5e_ethtool_cleanup_steering" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
ERROR: modpost: "mlx5e_ethtool_init_steering" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
