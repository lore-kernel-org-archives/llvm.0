Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE80D1DDC15;
	Fri, 11 Jul 2025 07:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752219431; cv=none; b=IQtSIwkcbAHG+p4kHgJduBBshRSlcxA542hlxwwAYsm4yMKqB0BpJMKT+skZ8AE4zyAThEOWnTujm+iCB6alNgdrg2/Pc1IRZPmmcgU4tD0TVRVIddkrQHrQv+EoWhShhZ6ElEdChp4OQzHGCA1U2wrIrZys7VLqqdECC7clL0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752219431; c=relaxed/simple;
	bh=2h88zarZXgjvPTL9JxfrKalr1zsgTnAjqFXrVH0YeZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/R8P7gVu/SB+dQk0yCl4+jZtdQXIeQ8ZGwuAOceL1g9bmoZv62ZNO/G9mvHGaTGwzJGJnEv1DmCdTt7g+GGToUyr+dCekuqGPF6Beeb0ObW25uW430upuwZRpzmpxfkp34nQi+wbA2n6lA3RGN6mkihoxg+ElfMhygkQ6gjoz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJgwFpvy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJgwFpvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752219430; x=1783755430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2h88zarZXgjvPTL9JxfrKalr1zsgTnAjqFXrVH0YeZI=;
  b=PJgwFpvyubRisLVvhR1xK5EjwDtHHi/EjLHkBsWQ8sovkWcG8eu0yI1K
   nVUWjXUbpZ/+U/dvj1WydQ0ah8AOYEsRxbSqHo1GQiPD5Qab0kPUbPwfq
   Vu5MAE9wuuNnZm/DffhYfp8MNgFRodGd8JWSbITuzDSza/8Kz+IBhsa3x
   W3tEQadCD3OlmNWLEFNRZvUzVgwAQCOINyKR0vuHNwkJSdprul+nVzm1R
   XZawvOJVDOT9KxEFfPkktlH0ST5ORIXtl4OFiEGle+IjvAxPUDJJLjDkJ
   hrH7SvgqtIM405SHPvLNn8qzRwZH/Fip+JmPcCyHA09wBVVSNWI2wU1Af
   Q==;
X-CSE-ConnectionGUID: wd2dd4cYS/SxClJkHScI5Q==
X-CSE-MsgGUID: 1eeJGaRZSYKuut+pdKb4dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="72092160"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="72092160"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 00:36:01 -0700
X-CSE-ConnectionGUID: FG5T1BoARw283OZWOTlZUg==
X-CSE-MsgGUID: y127qEjuTd6wnZfRIO1DDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="155931164"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jul 2025 00:35:58 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua8IV-00066F-2Q;
	Fri, 11 Jul 2025 07:35:55 +0000
Date: Fri, 11 Jul 2025 15:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [jgg-iommufd:for-next 25/43] Warning:
 drivers/iommu/iommufd/pages.c:2114 function parameter 'lock_area' not
 described in 'iopt_area_add_access'
Message-ID: <202507111555.VxJIWo2k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git for-next
head:   7de5cc04caf979c6a1978b283eb8ad8fe5167e24
commit: 940d0dd200c80a77133156bb3e1aaed47e2a9c23 [25/43] iommufd/access: Bypass access->ops->unmap for internal use
config: i386-buildonly-randconfig-006-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111555.VxJIWo2k-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111555.VxJIWo2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111555.VxJIWo2k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/iommu/iommufd/pages.c:2114 function parameter 'lock_area' not described in 'iopt_area_add_access'
>> Warning: drivers/iommu/iommufd/pages.c:2173 function parameter 'unlock_area' not described in 'iopt_area_remove_access'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
