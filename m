Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13792176AD8;
	Tue, 27 Aug 2024 22:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724798664; cv=none; b=Pkcze6CQEVTVPPlQ9Yg5cx+CIt+vg+d96QVkFji4uxfj94spHUEcZEuaXeWVboLWTHusYDGbBLO5jOnQohjcUiCcx1KCrwnmVfY2wMYJlVNoS31JQdd/hXbId/zYuiijN/o+aWPxiMUQwgEjUKOFiDpWua+Mbwvd8xgdgzbWp/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724798664; c=relaxed/simple;
	bh=2rRd23sLADmUoTAvAfvdQvXX9hK41kxFTxnm1TRX5PA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cDiJTL6VHxcrZB3u6St3OEMklQnQEqb88hISNOophJlnx5VZ8MWiC3CzYXXRFRZwLje6B/0GrUO6m7/0/FyQQ4dgTX1+sW4R7FvTA7BA1haIS3lPQbdIM06oR4nIjFVt7eiKDZXwhpilo+o8pKrElxh7hwaVJE+rWHcO9sS+lgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WoXdCxm9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WoXdCxm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724798662; x=1756334662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2rRd23sLADmUoTAvAfvdQvXX9hK41kxFTxnm1TRX5PA=;
  b=WoXdCxm9VqRfZOwugpmu0yiRZU/lrMawJramm4xLbFhUpvsfg67xjW6/
   MvpHkGSENn6b7tnaEMmYWmsLXgrpf2JrOx6Os/rALA3qCtkLKotgQ2Dqd
   dRdZdGooES6zGOG833qPv/NFSKLNsnG/q4VBu23zyd1PTSXI+Uo6y/6gn
   LR2cZKhk5Xo2NFfNSyEd2Aj6yZdFI748apQ+NfBHvTX3uisT3tecXHqmy
   1DBsXyzpcNncQEPkSJvV3MwOifC69uZfGoTwhTS8WA16OO7GkI/JbYvo4
   Vy+Xx0FuYAA/rWipO56sqpFSqGYl+okIsK4A7jXkMgmSnfDnOwIWDWXG+
   A==;
X-CSE-ConnectionGUID: CEaHgzcySEqGUxdCsNX6Ow==
X-CSE-MsgGUID: sLpTnY+hSY+h587SPHVYCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27098007"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="27098007"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 15:44:22 -0700
X-CSE-ConnectionGUID: N/YM8+IDQX2cFMWAV3Uqvw==
X-CSE-MsgGUID: gWcVgN00TDa1uX67VEt23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63531607"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Aug 2024 15:44:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj4vB-000KA6-2R;
	Tue, 27 Aug 2024 22:44:17 +0000
Date: Wed, 28 Aug 2024 06:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: ningyu <ningyu@eswincomputing.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [esmil:eic7700 18/20] arch/riscv/kernel/bus_error.c:33: warning:
 Cannot understand  * @brief Bus error unit register map
Message-ID: <202408280625.nTEqbAws-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux eic7700
head:   eb44174b12f99d320be704b45db6b994f6a014bd
commit: f098c3ff914842b8e39b4de84efca891f2347b2b [18/20] drivers: bus-error: Added SiFive Bus Error driver
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240828/202408280625.nTEqbAws-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280625.nTEqbAws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280625.nTEqbAws-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/bus_error.c:33: warning: Cannot understand  * @brief Bus error unit register map
    on line 33 - I thought it was a doc line


vim +33 arch/riscv/kernel/bus_error.c

    31	
    32	/**
  > 33	 * @brief Bus error unit register map
    34	 * 0x00 : cause of error event
    35	 * 0x08 : physical address of error event
    36	 * 0x10 : event enable mask
    37	 * 0x18 : platform-level interrupt enable mask
    38	 * 0x20 : accrued event mask
    39	 * 0x28 : hart-local interrupt enable mask
    40	 */
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
