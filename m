Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C89911CBA;
	Mon, 10 Mar 2025 01:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741570311; cv=none; b=jigFkOjqODTk9LApRZ7T2VvyUEVKygZb1MdPFjANTF51NgvQyDayQlXN62bUnz1yxMe3hZxrTB04NurD37aK02RiSlB0AS06k5jF6dgVYSWz4rb3OzgB8ZewU+saxSKqcHfJWeedYTit6gCh/SZRZuey7eLRZVShBh/8+6a9tUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741570311; c=relaxed/simple;
	bh=55EuGOXC3Kz1nA9VOFTCxz0BojTtSL5EVix6D23D3cw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q49lK1OCiOiMz1U9XCV2yG5jqeqgMJNGMyPdRFd1YIZNh6qbFnFFzd9vNMJf4e7ESgmSSW8mYEgUp9/6YjzCfg+81zRUyU+LHtaMUMVaGPu2O1IJ5AN4qNYxSCzSKTmK41O+UVPeL0szcaKZg/nfJjNR85xKG1y5ZtXyw2ocvl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9gPanC9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9gPanC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741570309; x=1773106309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=55EuGOXC3Kz1nA9VOFTCxz0BojTtSL5EVix6D23D3cw=;
  b=D9gPanC9vBEVJ5vJ+OAST92yfzUHx+PIEk91lOYD4BmbdfMJOqvLPAYx
   Tte5GmS6tIQFHUl5/QDKASUN5V003o3LjzJ9BCw+sfe1qc4CF0HYdLc4f
   dp3QLT6mCHQh4K4Jd7uzjkH48F60WcpX9rUSwahC2CEn+ttYLnfh6C6QD
   5Is3xlD7rkwh0bVooY298Fsc+Gfyjs3kp7nyycNgdIZfwqIakpXWmabyS
   n5LrBLY2IHArvU98FIwbz/d4aq5knZGuQ0zH3nrZB3Ph9oWWi2GNTGBYg
   27J0lBRE6VDxk/Q0p54hBcM/KSeE5D82LMJ1EsKNKOoijXTOt/mtg6y3h
   w==;
X-CSE-ConnectionGUID: i7E6wY39Steq1+kX0k1+Sg==
X-CSE-MsgGUID: NnZFDhh2SWuOIp1UG3Glug==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53536725"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="53536725"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 18:31:49 -0700
X-CSE-ConnectionGUID: aI6baRwrRLyxDEZZ6yX0Vg==
X-CSE-MsgGUID: bdbFg7MXQwKORVkl0hpLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120752887"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 09 Mar 2025 18:31:48 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trRzd-0003gG-0w;
	Mon, 10 Mar 2025 01:31:45 +0000
Date: Mon, 10 Mar 2025 09:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: Patrisious Haddad <phaddad@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>
Subject: [rdma-rdma:wip/leon-for-next 29/29] ld.lld: error: undefined symbol:
 mlx5r_fs_bind_op_fc
Message-ID: <202503100927.KkG7sWul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   a05e560ea288efd4ff1fd7c86f1aeb9d10678411
commit: a05e560ea288efd4ff1fd7c86f1aeb9d10678411 [29/29] RDMA/mlx5: Support optional-counters binding for QPs
config: i386-buildonly-randconfig-005-20250310 (https://download.01.org/0day-ci/archive/20250310/202503100927.KkG7sWul-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100927.KkG7sWul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100927.KkG7sWul-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mlx5r_fs_bind_op_fc
   >>> referenced by counters.c
   >>>               drivers/infiniband/hw/mlx5/counters.o:(mlx5_ib_counter_bind_qp) in archive vmlinux.a
   >>> referenced by counters.c
   >>>               drivers/infiniband/hw/mlx5/counters.o:(mlx5_ib_counter_unbind_qp) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mlx5r_fs_unbind_op_fc
   >>> referenced by counters.c
   >>>               drivers/infiniband/hw/mlx5/counters.o:(mlx5_ib_counter_unbind_qp) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mlx5r_fs_destroy_fcs
   >>> referenced by counters.c
   >>>               drivers/infiniband/hw/mlx5/counters.o:(mlx5_ib_counter_dealloc) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
