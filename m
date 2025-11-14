Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488B7311967;
	Fri, 14 Nov 2025 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126383; cv=none; b=LqPy+i67t9tZ7mjrreQjdv0OaphNrm1Uc9/c1eci/cAks2LHBcDlMbg0gcLZ8wLRBmibu9MRknwnmHuhsRPpTAl5u35+pdkYA2fNCg3+wzgqcAptT4KWuB72Lhaf83vqzSHmTQ57r6HWX+ZePM8IUpkFRT+8cSZqeKgKH71Gdws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126383; c=relaxed/simple;
	bh=NDhm4O/FVsAXjZfG47kTBj12SFHmytZ3Y/An7pHu30k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cICvvUJuCLnSvs3OIgvxlU0nNXfaQlekC6hLVsZML7zmdUutVqcRyZ2wmkcvJYZ2t7ECXC8YWgj2K2LMWorDZEbjXW14I/QQIAo8Vitn5YxU8RCP8WmdeYUWB0D/WSIB9F6Fs3MMs391Dfnb2iXlFVsJrdNV6MaoRhfpdsIeCvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvaIkEKh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvaIkEKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763126382; x=1794662382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NDhm4O/FVsAXjZfG47kTBj12SFHmytZ3Y/An7pHu30k=;
  b=mvaIkEKhFtmQ67gfWgsXMNvzIJ2OZJnyPkTKM1Q6UnIrGQ+gIFo+kaW0
   tICDdsPRRg2uUk7mAdfahMIEGLhyQtlMq3FtKvg0xXOipWdxe3tk946N7
   XzaI0i7lvlp5owjVrigfCAbqQr3c2hZfiKmKtufRoBEwUTzFMfJsnIREP
   TbyssAbKo9uxd6+Qwc6gb8eUAD+8A6injZjxNJ+957oqH/cn1J9H1G5U6
   VvxGr59f6DZM8U/pCPnpfl1zPuaXoTiP/7K/16Deo1SFKbm5WzcbIfo+N
   icM/VbD4a7jT2yfamqN8XEQ1M5egMpcYUjA3LoUoovbZ39zWY12E/+MYC
   w==;
X-CSE-ConnectionGUID: h3u6rAV1SGiw9pIls7hE6w==
X-CSE-MsgGUID: e38iFxgZToeNPLPYOjhrbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="87866168"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="87866168"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 05:19:40 -0800
X-CSE-ConnectionGUID: oGIVJsMBR9u/dGc028k5zw==
X-CSE-MsgGUID: WOQIM5mbTsis2Rb8rW1ZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189975817"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Nov 2025 05:19:39 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJtiC-0006br-1F;
	Fri, 14 Nov 2025 13:19:36 +0000
Date: Fri, 14 Nov 2025 21:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: [arm-tegra:for-6.19/syscore 1/1] drivers/iommu/amd/init.c:3505:20:
 error: too few arguments to function call, single argument 'data' was not
 specified
Message-ID: <202511142150.vh7dqU5T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-6.19/syscore
head:   19debadfa11b4a51888b07727426a20359879558
commit: 19debadfa11b4a51888b07727426a20359879558 [1/1] syscore: Pass context data to callbacks
config: x86_64-randconfig-004-20251114 (https://download.01.org/0day-ci/archive/20251114/202511142150.vh7dqU5T-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511142150.vh7dqU5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511142150.vh7dqU5T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/amd/init.c:3505:20: error: too few arguments to function call, single argument 'data' was not specified
    3505 |         amd_iommu_suspend();
         |         ~~~~~~~~~~~~~~~~~ ^
   drivers/iommu/amd/init.c:3041:12: note: 'amd_iommu_suspend' declared here
    3041 | static int amd_iommu_suspend(void *data)
         |            ^                 ~~~~~~~~~~
   drivers/iommu/amd/init.c:3510:19: error: too few arguments to function call, single argument 'data' was not specified
    3510 |         amd_iommu_resume();
         |         ~~~~~~~~~~~~~~~~ ^
   drivers/iommu/amd/init.c:3027:13: note: 'amd_iommu_resume' declared here
    3027 | static void amd_iommu_resume(void *data)
         |             ^                ~~~~~~~~~~
   2 errors generated.


vim +/data +3505 drivers/iommu/amd/init.c

6b474b8224cdb4 drivers/iommu/amd_iommu_init.c   Joerg Roedel 2012-06-26  3502  
6b474b8224cdb4 drivers/iommu/amd_iommu_init.c   Joerg Roedel 2012-06-26  3503  void amd_iommu_disable(void)
6b474b8224cdb4 drivers/iommu/amd_iommu_init.c   Joerg Roedel 2012-06-26  3504  {
6b474b8224cdb4 drivers/iommu/amd_iommu_init.c   Joerg Roedel 2012-06-26 @3505  	amd_iommu_suspend();
6b474b8224cdb4 drivers/iommu/amd_iommu_init.c   Joerg Roedel 2012-06-26  3506  }
d7f07769753340 arch/x86/kernel/amd_iommu_init.c Joerg Roedel 2010-05-31  3507  

:::::: The code at line 3505 was first introduced by commit
:::::: 6b474b8224cdb473f19e8c925171e608499cc45d iommu/amd: Add initialization routines for AMD interrupt remapping

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
