Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476725A624;
	Tue,  4 Feb 2025 05:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646419; cv=none; b=Fb51sC2czfUaQhh4PhpVMRQ6iLv/SgWUAbwx819x5xieuJCf96SwjwCC1IiekYCo16Uj9m9k9tegF40yGJtjWPC/yuzJi6bECvmjGQ85L+ewfKVOgwBTsl3IZCXBBpovVehXOexcgiwl9eCffzsHGp3b+buQw92EiPIIc0fputk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646419; c=relaxed/simple;
	bh=Omwe6LnT3uBQt67RB6V+zKSmwy98tmKpwDO4Vm43r7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vCUecrKfY5TNl0jR4ZmsJvbESaTtMXeWnXh9nnLifITZDm4WnvfHD8QE+/KmRvncOroyYpq7sVAtXS+g39iEUbyMKeAseyZ3vOIn6nu/5RSjZTLNO/0yBdUeq2RNV65/HmGDTZBYT5aykwfU55eFmJD7DS2l+s1oh5V0+uRkgrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfwLTHWx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfwLTHWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738646418; x=1770182418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Omwe6LnT3uBQt67RB6V+zKSmwy98tmKpwDO4Vm43r7w=;
  b=LfwLTHWxdXBBI9rkfX1Gum4tXUXgSP3kaj8I/CtwVaOVVUCoj/bk0TL8
   aiwtrw+2o8sh3b7vige/BDaOzwcVbrP+Y5vEBrjuhIwyzGskJS3ID/LcS
   WsjumLHgYVtfrVPZVJd0YK1kVuFHqQ1scvqqJmJQJMkvF/UaaIvcx7lbm
   SZ7D9vUNt4p7oAFyKZ4Cy5TDgGJbUkQylY8uicYgmT6d3efws0abRNpw2
   KgTVTqfkK2mNBFH4L+lOFI8RwIpd7VwPsmZG5E0/+BK6ad9skBALaFtQ1
   PlMU/s0CZA/d2Jc9ujE08DGWTMZgNXOgoJZaaGB4/F400kNPOahwcZu2y
   w==;
X-CSE-ConnectionGUID: CUWzcP9xQx6thDwxFJ16eg==
X-CSE-MsgGUID: MTE1CV9cSoC0Ujn0x5nCow==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50152226"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="50152226"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 21:20:17 -0800
X-CSE-ConnectionGUID: UXSw7QxNSL+GMuka1kAmjg==
X-CSE-MsgGUID: ZHR3/1V9Rsme0lCORDZVWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="110457934"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Feb 2025 21:20:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfBM5-000s15-19;
	Tue, 04 Feb 2025 05:20:13 +0000
Date: Tue, 4 Feb 2025 13:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: vmlinux.o: warning: objtool:
 amd_iommu_domain_alloc_paging_flags+0x2c3: unreachable instruction
Message-ID: <202502041311.kWm3wyBl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0de63bb7d91975e73338300a57c54b93d3cc151c
commit: 082f1bcae8d1b5f76e92e369091176b8d61120ec iommu/amd: Fully decode all combinations of alloc_paging_flags
date:   3 weeks ago
config: x86_64-randconfig-075-20250203 (https://download.01.org/0day-ci/archive/20250204/202502041311.kWm3wyBl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041311.kWm3wyBl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041311.kWm3wyBl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ep_poll_callback+0x458: unreachable instruction
>> vmlinux.o: warning: objtool: amd_iommu_domain_alloc_paging_flags+0x2c3: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
