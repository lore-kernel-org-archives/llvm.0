Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948B331584;
	Sat, 25 Nov 2023 22:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpAWXKiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700951206; x=1732487206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Br3PWbV8MBdfcgcwWBjwaxkLE3thERmsm00LtzMlqoQ=;
  b=KpAWXKiR6ta5ijpOHkJ+0L2XItpuF/yaD4NjPqDIG/pm4GBzKvwqnlwQ
   xSjbwKJWKUFxANg83AY8/0KrbpqLi2QxC9bMyrZgVP6MC7p+k5pKg00QS
   hFwJJlhgmuOmvITQeHGlwOXPghgLPjHsW3MeOCdfk3ut6F1umtET6LXrL
   ZFtZZ4YUZeG9uO+uxxAw9XUhxN7jITDq/PdP5ywrNm4PTia7+DkZkD2mN
   Eb3x+xNnF4EZ+k+qB0jv6E3FL8dQEihtIp8tfohBDy8Aop+ElZh1fc4uS
   kCUx8PDnQn+KdhH+mqk/OMcGDl2M1W/mey7H5uJAOH9+RuHyxaaPntdtl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="389691505"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="389691505"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 14:26:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="767781163"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="767781163"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Nov 2023 14:26:44 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r716o-0004Ta-0N;
	Sat, 25 Nov 2023 22:26:42 +0000
Date: Sun, 26 Nov 2023 06:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 35/41] ld.lld: error: undefined symbol:
 iommu_fw_get_u32_ids
Message-ID: <202311260653.PcPLbeDO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   49c7574491cc9c8e8f21a8e8acb635b0e0bdfd61
commit: d0a141235082defd318c48bb011795daa8610d51 [35/41] iommu/virtio: Move to iommu_fw_alloc_per_device_ids()
config: x86_64-buildonly-randconfig-003-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260653.PcPLbeDO-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260653.PcPLbeDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260653.PcPLbeDO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: iommu_fw_get_u32_ids
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(viommu_probe_device)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
