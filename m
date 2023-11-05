Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E01C10E9;
	Sun,  5 Nov 2023 03:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lT9N6D1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699155538; x=1730691538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oQIT+hQtFpD/OGnZEV6LzfhDWbGgwr4Tzy3dd6PHMp0=;
  b=lT9N6D1/gFlnrqU58uuPvn1hNvPo2e9c1tqoxFhJhWpEWracTX7+leoF
   aH6lS6HKCWHRO2fDb7dVUxz+UzU/tT0LCo769EG6XtXGi+p5bK0yCA6NB
   NzUFJRZUGsZiUOr4bEHT/d3Wz5QG3u2kyUPP2wLJeDRZMFMFWxzYODfLA
   DSwwh/5k25UWBRZYhgKgGI3y6SduLwlu9g2FZg6eeVeIyq7PA+AzlfjYf
   +YZ0yTjOCFpSeiMJEHWKL/yFwbIvdPaAdSIf/4hytfe2rmoWvqifx8ikF
   FaaqAIGtP9dsPcyArCXwA/UF+WuUfYWCjoR5bVn86/+yIQKxgTtvgSBvT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="369330654"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="369330654"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 20:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="796986187"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="796986187"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Nov 2023 20:38:56 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzTyP-0004zA-2K;
	Sun, 05 Nov 2023 03:38:53 +0000
Date: Sun, 5 Nov 2023 11:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 11/19] drivers/acpi/scan.c:1570:45: error:
 too many arguments to function call, expected 2, have 3
Message-ID: <202311051143.ny1zHAgd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   a387bf414bfa3cc4e39cc07d1cfb257a13081c8e
commit: 82d63e7b3a55983a4ff9d4633c4f1f233f3e8853 [11/19] acpi: Do not use dev->iommu within acpi_iommu_configure()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231105/202311051143.ny1zHAgd-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051143.ny1zHAgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051143.ny1zHAgd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/scan.c:1570:45: error: too many arguments to function call, expected 2, have 3
           err = iort_iommu_configure_id(fwspec, dev, id_in);
                 ~~~~~~~~~~~~~~~~~~~~~~~              ^~~~~
   include/linux/acpi_iort.h:61:19: note: 'iort_iommu_configure_id' declared here
   static inline int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
                     ^
   1 error generated.


vim +1570 drivers/acpi/scan.c

  1560	
  1561	static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
  1562	{
  1563		int err;
  1564		struct iommu_fwspec *fwspec;
  1565	
  1566		fwspec = iommu_fwspec_alloc();
  1567		if (IS_ERR(fwspec))
  1568			return PTR_ERR(fwspec);
  1569	
> 1570		err = iort_iommu_configure_id(fwspec, dev, id_in);
  1571		if (err == -ENODEV)
  1572			err = viot_iommu_configure(fwspec, dev);
  1573		if (err == -ENODEV || err == -EPROBE_DEFER)
  1574			goto err_free;
  1575		if (err)
  1576			goto err_log;
  1577	
  1578		err = iommu_probe_device_fwspec(dev, fwspec);
  1579		if (err) {
  1580			/*
  1581			 * Ownership for fwspec always passes into
  1582			 * iommu_probe_device_fwspec()
  1583			 */
  1584			fwspec = NULL;
  1585			goto err_log;
  1586		}
  1587	
  1588	err_log:
  1589		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
  1590	err_free:
  1591		iommu_fwspec_dealloc(fwspec);
  1592		return err;
  1593	}
  1594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
