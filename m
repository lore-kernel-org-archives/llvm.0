Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817463A8C6;
	Fri,  1 Mar 2024 02:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709259904; cv=none; b=SviIQ2lMgNTffCQu0Ugr3pcWwBbCFE3ss0Kk9UMgWaj0aFnF2pFs8GVCxsgDQNOKugvfE7TwZ1mutbJd7sXtLrxsEfOb5y/zFC6w2oCpLmq6QwJHA+oKqgRAZ7WSZiBDeZdc2cjJysllH+PZU0y4RhgSG/m/MFHdvBBFHz8Z/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709259904; c=relaxed/simple;
	bh=wFO2u4X20ld4vQKIrm80n+9r92jthAzf6Mbc9kgYygY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MpwYEG93k9/Ac448Ckkj5mVHdy6v5wZcIaHuMu/OSba4DLu91pZgyiGHhXdlbAZtjoyWNB7qBlpBALbzOa2Hh7ZJJwWk9KkZjKePLBD+3ajGXn98bXqBFYZU1Cm5x79patGSQ+MNme8zfIiZzanIpoXustXsaLUxwYRIeahQXxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REhAThrZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REhAThrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709259902; x=1740795902;
  h=date:from:cc:subject:message-id:mime-version;
  bh=wFO2u4X20ld4vQKIrm80n+9r92jthAzf6Mbc9kgYygY=;
  b=REhAThrZuSfOjPf8hC5uodO4+lqxExwKvzg/Lt88SePmmN5R1CuOkX24
   IjjxyrkSRYysCaoEBf4zSDg+XlokdFhHxyiJ3fEReKNuiITc5Gl6IBgfM
   hIo8FWSrtbnztFPE6dvrRYT0OfJYGVZWM4zqnT3bEPWpqhekPr41m6ySx
   mJGHaJT3YgUKAZB7ytwNuls8V4VQOgjL+81a1VUjb4Ol574vJpssA/VK1
   sn2muhV9fHRtcXYYdgGp67g8Gr7ye0MFlj6+cKAxstE4e3Ve+S6GEQcLN
   tm4fzhAui0j6PXHPLQBzdcAysR17v+mHybf5090yAqcffRPpIJeWgfLj6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="21320933"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="21320933"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 18:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8172537"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Feb 2024 18:25:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfsZt-000DTH-0i;
	Fri, 01 Mar 2024 02:24:52 +0000
Date: Fri, 1 Mar 2024 10:24:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/iommu/exynos-iommu.o: warning: objtool: exynos_sysmmu_irq()
 falls through to next function __cfi_exynos_iommu_identity_attach()
Message-ID: <202403011005.JHczfBsc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Jerry Snitselaar <jsnitsel@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   87adedeba51a822533649b143232418b9e26d08b
commit: b3d14960e629f9ee8c82f8feb211ae43e1cb3246 iommu/exynos: Implement an IDENTITY domain
date:   5 months ago
config: x86_64-buildonly-randconfig-001-20240301 (https://download.01.org/0day-ci/archive/20240301/202403011005.JHczfBsc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011005.JHczfBsc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011005.JHczfBsc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/exynos-iommu.o: warning: objtool: exynos_sysmmu_irq() falls through to next function __cfi_exynos_iommu_identity_attach()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
