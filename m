Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8552940D;
	Fri,  7 Mar 2025 04:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741320066; cv=none; b=jwAAnm03ATEVcLjjjJU1SAjtg/XPXOkRXek2wEdBNsBQDYJ1xahS7yvicZ35doQwzeqCnieAISE1TyZ7QS1Nt/oWpvtdeXxtvqYiXAHfX2sGwmu3qXxln5PY5zk6f2rPB5OvCjcioVBioJokD+0bR1yMowRLTm50ms6YLrfaDxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741320066; c=relaxed/simple;
	bh=MXDmw5oF/qPlvajALrnEa96pA5dJcAJdwwzIiJiGIiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IU9kkVil7OaXuqvXlWlBUnfDU2V5NPy9jOTtT4hrgqmLsfAocSLSftxdahtcqm1sobyD7g5Xv/gJ1RxZGvUIo2MyQjLJniM/4THZ3Ezb/szbpOBAvBOAx95MnGdO6tWGkTvQp0wqyQK5k+kJ7ha2ExOHRfV4DynSkZgClOiGpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYElHz12; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYElHz12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741320064; x=1772856064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MXDmw5oF/qPlvajALrnEa96pA5dJcAJdwwzIiJiGIiw=;
  b=NYElHz12/ZvBsAHFlPdMQb2Fs9C5c/jpTl7KgdIxnRMfCNxHBM5TE3gy
   7jCBrcsoqvZ2N4XzvuCh/bW3fTYrr1w7iGoGemAGA2EKXkruJKdz3PhTV
   6905Sy5/tqgHPR6pO57LZwlfII2zWUhReYpPFfiYrdLFo7rH5e97if4w6
   OzmY1LGByDM0/Sry4fkzbyjJxXWcILH0AxaITtM/Yp27GFEktN6G1mO3m
   lAP2bAgsyQE1IT1qmWjgzTwCMJzy/DA4gd+ewkAU/uFbTP0HRfy/xx4fH
   iQizndKHgCgJJssrUiwcf29vHln7jcHdhk1ro3gO0ja9bAUMP/5YXbNr3
   A==;
X-CSE-ConnectionGUID: 0Jv8ZaMuQuqOHIC92g/GwA==
X-CSE-MsgGUID: Uz3u4fFRRnaSk/1gLePycw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42069622"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="42069622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 20:01:03 -0800
X-CSE-ConnectionGUID: NJsEBEF5QaecyaZO2axScg==
X-CSE-MsgGUID: Y1UEzUvcTeuWgqn6epgWPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="142439592"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2025 20:01:01 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqOtO-000OIp-1h;
	Fri, 07 Mar 2025 04:00:58 +0000
Date: Fri, 7 Mar 2025 12:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Chiara Meiohas <cmeiohas@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>,
	Yishai Hadas <yishaih@nvidia.com>
Subject: [leon-rdma:rdma-next 25/73] ERROR: modpost: "ib_create_ucap"
 [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
Message-ID: <202503071118.kNlSZCrX-lkp@intel.com>
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
commit: 30ed40e7a12a694cf4ee257459ed61b145b7837d [25/73] RDMA/mlx5: Create UCAP char devices for supported device capabilities
config: powerpc64-randconfig-001-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071118.kNlSZCrX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071118.kNlSZCrX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071118.kNlSZCrX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ib_create_ucap" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
>> ERROR: modpost: "ib_remove_ucap" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
