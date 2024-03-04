Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB738F59;
	Mon,  4 Mar 2024 03:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709523666; cv=none; b=DNXEg5RyXxHXaY0ZvgPXCp819+AtSLjNPeQtkCm/Nkg4Fk2r0C1go9EDOdPBmxzgU/DFcA+jLxx+GFM8BdNw6ZMkoVpGgumhDEBjmezHrSBEiLXNFFPyblfnC7RjyF2rtfUZOyUanz+g/a4kRX4HPB/hjPZVl4qrbjaToesYZWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709523666; c=relaxed/simple;
	bh=6VPF1ye45SSPVbPugJaGsPrRHmJS1H2y5d0XLZQIQdg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Buv+2Q7Z0Ias9IsBtz56vYtQI2m6TIfl812LdHDQPrVT7W3rw9vj2WLbv420ctzECS/rMC8oeRiefbOUcxh7wOrrNx8m46IjUX+Ud78CcFv4Zg0c5eV/1jgC2y3prMDjjZ5OxNQO9mSQqcRucvOS/QGDsCnLQdU8f9Rl1HqOAmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pwk/wSya; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pwk/wSya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709523665; x=1741059665;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6VPF1ye45SSPVbPugJaGsPrRHmJS1H2y5d0XLZQIQdg=;
  b=Pwk/wSya4so3PXdHyH19s+KcMLcR7+Xy/qwWanW+0vU+KuhZuBN4r5dY
   eXxLWfMhHmFugpWNVLKU3ZWaTJmpRiCe9P+SplM9LcQDXvUaKjoD3yuVI
   tZzeiwhu6pwheGWp+xz3RClUJ5yzp+8mjxNsWFLbgeVaUj8sYdQS8xVX+
   RWX3J6T1LbUexKAxUQLnrauDgLfYYVk3J3tp7uQ126B3Jdg6IGgQVdW1P
   mqLOBV+vIhxkk0mLruUWDF4ZM4y6dsinDIg2uLBVaf8GbFT4PE09YmtQn
   eOWGXwTDlmtRJoZyCa/g7R2ATPvPPK7nmAmEBfSYC9zAEuwLT8XipRsiP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4165292"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4165292"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 19:41:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8784332"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Mar 2024 19:41:03 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgzCG-0002Jv-21;
	Mon, 04 Mar 2024 03:41:00 +0000
Date: Mon, 4 Mar 2024 11:40:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: exynos_sysmmu_irq() falls through to
 next function exynos_iommu_identity_attach()
Message-ID: <202403041132.0Y36UI1Z-lkp@intel.com>
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
head:   90d35da658da8cff0d4ecbb5113f5fac9d00eb72
commit: b3d14960e629f9ee8c82f8feb211ae43e1cb3246 iommu/exynos: Implement an IDENTITY domain
date:   5 months ago
config: x86_64-buildonly-randconfig-001-20240304 (https://download.01.org/0day-ci/archive/20240304/202403041132.0Y36UI1Z-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403041132.0Y36UI1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403041132.0Y36UI1Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: exynos_sysmmu_irq() falls through to next function exynos_iommu_identity_attach()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
