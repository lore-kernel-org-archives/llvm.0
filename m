Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087B61519A3;
	Fri,  7 Mar 2025 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741331613; cv=none; b=B+NT2wtWteVGIlDXZNE5wgJw7ceMMb532OxDDaw7YvI3pwYXbXkOmmaDwYvVb/+q/4MSipn0/AoLvALBWDRStgSWmD8AJPzkNBYhT5iHuz92bwDQQlbNd9yP5cYZFlzHTpNa9CTfg5FeFJlgZXZByEMiaifW4xKmXewUJQNcPqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741331613; c=relaxed/simple;
	bh=sYdNk+SKW80ie1FMJ9vgFgzBEe67X9mm38FN3hQcrSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PRy4WMct9y2vewCvt+K9Xxbs3+6N0Kbhchw31knNgdydi0ZMHCpvjU08Efs25ZWDKeBA/yMtxtuznhHj/V+9fGsQQfQwv+N9923qtobsfeqthKmNnvhPAG75itFghs2paT3+WEa30bLeXfWllYO3qK90M3b2jxX+r+bdRdaywVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fqmd0Eh+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fqmd0Eh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741331612; x=1772867612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sYdNk+SKW80ie1FMJ9vgFgzBEe67X9mm38FN3hQcrSM=;
  b=Fqmd0Eh+IbXqpNYkvNQwF+gvJDAqVl7v/a+RaO698sP9Gc+uVJ3v/2Vv
   5oPV2Nw3Tofo9LIB4ZE+PM8SHZYdKPNycjE0ICucj/6O3d2KT4I/EfJOs
   OIt9gczn6Is35idqaABsy0X7nWTxC9OfyB/gpGr0gAF0GQ/OxFiSfq83l
   AFNWD9P1kWsX2JZkm9H0yYiEWfIsdalS5jkXkFEg5LhxS++Xg4p8gRCMb
   yw446zYo7CtHdaOG7oNU3g9esehl3C2Dvj/LxUvQUA6k4y/SlZzicfQPZ
   Gx2UeJ23smdYCFRlWO/X2plszksNr2AHoQTQvCxPbbOWIKRpRXXXTIhBP
   g==;
X-CSE-ConnectionGUID: Vik2WPDRSE+fcixSUyyNMw==
X-CSE-MsgGUID: tYIByAH7RNG/kgdfkspd2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53013442"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="53013442"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 23:13:31 -0800
X-CSE-ConnectionGUID: PbEKEGt6R4C/xGaXkK0RWA==
X-CSE-MsgGUID: uVzIPBm+RESX2DdgAPFKBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="124280128"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2025 23:13:30 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqRtL-000079-0i;
	Fri, 07 Mar 2025 07:13:14 +0000
Date: Fri, 7 Mar 2025 15:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: Patrisious Haddad <phaddad@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>
Subject: [leon-rdma:rdma-next 68/73] ERROR: modpost: "mlx5r_fs_bind_op_fc"
 [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
Message-ID: <202503071503.PnhQY3CE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   d0ddfe3f2ff8ba858b1b9f604339bc537ef98cff
commit: 97a3fed386aa190963e63be4bf0ddc5fab34effb [68/73] RDMA/mlx5: Support optional-counters binding for QPs
config: powerpc64-randconfig-001-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071503.PnhQY3CE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071503.PnhQY3CE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071503.PnhQY3CE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mlx5r_fs_bind_op_fc" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
>> ERROR: modpost: "mlx5r_fs_destroy_fcs" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
>> ERROR: modpost: "mlx5r_fs_unbind_op_fc" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
ERROR: modpost: "ib_create_ucap" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
ERROR: modpost: "ib_remove_ucap" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
