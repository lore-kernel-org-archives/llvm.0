Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C225EF8D;
	Tue, 29 Apr 2025 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745955847; cv=none; b=o4LO1xe9WE+hqUSVNdPN7tTvH3I3O212JymyKLDVYYggw7VWmEpIC2V+sfUNGESkRO3Cu7BpoOq3s4dARku+MGdNLJ8f5LV9P/+DgS20IB+MdENfodMEh05Ukuknxj/9XztdiAnzKQHRaGPGixel0TeKiITTtUm8WzPkJltAVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745955847; c=relaxed/simple;
	bh=YNdSrAHLeL7y15KjsKQBANpPGnM6d1OxDpZRYlI//8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQRmYJMcyTVdzgMieFTu86m3GGM+98bsc2mlHVYJ6WfCaPPZMfjupFR0pnT2HEM/owsRRAUq3LrZAeYCtgw37mTYdr2rEoPSQM4zugtZam3J+IWTMLu1eaU7ETMZmIo1NS02e4eojg+Yedu9yh69SW4OodAihZqmeDyAd+J9d2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFBM7kq0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFBM7kq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745955844; x=1777491844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YNdSrAHLeL7y15KjsKQBANpPGnM6d1OxDpZRYlI//8w=;
  b=HFBM7kq0HppxR1lDXkGbVfM9Qjl/HUrVKtay9iSclcIGf1hdFCUDhlP3
   lmqOD7Ik0uWkd6Rpv8lH1iWR5cct8VapB0nUIF7TswpE3LScBSexfw4GK
   Ime903LD/8TRtJHWLE6NMRg9jbaG6CEnHnNlHEvenvQULXH5qH9cZdAhW
   6foiBfGDMOZ0ObigDKdh8TyeVpNW/6QIldEH4TaIn3MBztdSJpRwcldmu
   w+HI+Qo8Ij+Luw799L7GG5AgVt7awy0LCsi9l3fXMPd48qvifqe1SAgc8
   tBraqYNNAkSifdhG6YL5xlUtBEySLA/auik9H4LUyOUsdykw7ucxxmbwi
   Q==;
X-CSE-ConnectionGUID: mOEDFibmT96LgQV23fPXyg==
X-CSE-MsgGUID: 5WHMYradRyecvFd/uVy0rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="70100729"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="70100729"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 12:44:01 -0700
X-CSE-ConnectionGUID: gzVQKWfuTRWP+jZB5ZxC4g==
X-CSE-MsgGUID: qmEVvTX3TxCohHV6GJNE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134908089"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2025 12:44:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9qs1-0002sp-1m;
	Tue, 29 Apr 2025 19:43:57 +0000
Date: Wed, 30 Apr 2025 03:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommu_pt 19/22] drivers/iommu/amd/iommu.c:60:37:
 warning: unused variable 'amd_dirty_ops'
Message-ID: <202504300300.5BmHwgTO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   c1dec260d8b78443ef82054138c29a8d3d155a74
commit: ee6aae7327cd34c61889435908500dbce710d984 [19/22] iommu/amd: Use the generic iommu page table
config: x86_64-buildonly-randconfig-006-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300300.5BmHwgTO-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300300.5BmHwgTO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300300.5BmHwgTO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/amd/iommu.c:60:37: warning: unused variable 'amd_dirty_ops' [-Wunused-const-variable]
      60 | static const struct iommu_dirty_ops amd_dirty_ops;
         |                                     ^~~~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_PT_AMDV1
   Depends on [n]: GENERIC_PT [=n] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]
   WARNING: unmet direct dependencies detected for IOMMU_PT_X86_64
   Depends on [n]: GENERIC_PT [=n] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]


vim +/amd_dirty_ops +60 drivers/iommu/amd/iommu.c

6efed63bec36e2 drivers/iommu/amd_iommu.c   Joerg Roedel 2012-06-14  58  
b0119e870837dc drivers/iommu/amd_iommu.c   Joerg Roedel 2017-02-01  59  const struct iommu_ops amd_iommu_ops;
9abe6c55354db3 drivers/iommu/amd/iommu.c   Kunwu Chan   2023-11-20 @60  static const struct iommu_dirty_ops amd_dirty_ops;
26961efe0dab9c arch/x86/kernel/amd_iommu.c Joerg Roedel 2008-12-03  61  

:::::: The code at line 60 was first introduced by commit
:::::: 9abe6c55354db38f0906fcaf4e1c1644c26cd624 iommu/amd: Set variable amd_dirty_ops to static

:::::: TO: Kunwu Chan <chentao@kylinos.cn>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
