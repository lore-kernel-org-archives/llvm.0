Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E95E156FB;
	Mon, 27 Nov 2023 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSYWNSfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701098548; x=1732634548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AG8V9hV+PDkIJfz4FAswRpJxbUoTS5CT7ocIGTh5A6g=;
  b=BSYWNSfWb5Wod94+tFWkgXuX2nAKzliQW+R+Zh17HlyTbflBL4gh9Khd
   wExbe/svm7Bk5JbjB08gJpAPWlWwcZJrbNMBCFjVktVGVvZzZ9vcWL500
   dESTaLD3eMyvtAp6dsffH6/DT6Nvy2xHQeE2qGU71bELFPC4T0qQpc8XJ
   N91lWHyiRA3bl5f07WD6qDnVOd/o6XkLqSln5jdZlFsHTqiWBStweTCnJ
   TZJvg5LLU12++fqIsCQlX6jB02lpfFGgOuokIFRFyIJRSYQRmXeYJej0U
   fqGj9YrAlVbvKO9aAMfO/mP02v6xE7HIg5sOKFNLAW+iGIqF1GXN9UNk1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="395546800"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="395546800"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="9809399"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Nov 2023 07:22:26 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7dRI-0006MM-0U;
	Mon, 27 Nov 2023 15:22:24 +0000
Date: Mon, 27 Nov 2023 23:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 39/42]
 drivers/iommu/arm/arm-smmu/arm-smmu.c:1314:9: error: expected ';' after
 expression
Message-ID: <202311272010.Z2CAtEHL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   9624604aaaa41adf3cb018da14da2744b69a5eee
commit: 6b52c2ea5f140f23a5fa75f1fe32b595d170c27f [39/42] iommu/arm-smmu: Move to iommu_of_xlate()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231127/202311272010.Z2CAtEHL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311272010.Z2CAtEHL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311272010.Z2CAtEHL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu/arm-smmu.c:1314:9: error: expected ';' after expression
           smmu = iommu_iort_get_single_iommu(pinf, &arm_smmu_ops, &flags,
                  ^
   include/linux/iommu-driver.h:242:2: note: expanded from macro 'iommu_iort_get_single_iommu'
           })
           ^
   1 error generated.


vim +1314 drivers/iommu/arm/arm-smmu/arm-smmu.c

  1306	
  1307	static struct arm_smmu_master_cfg *
  1308	arm_smmu_probe_new_master(struct iommu_probe_info *pinf)
  1309	{
  1310		struct arm_smmu_master_cfg *cfg;
  1311		struct arm_smmu_device *smmu;
  1312		unsigned int flags;
  1313	
> 1314		smmu = iommu_iort_get_single_iommu(pinf, &arm_smmu_ops, &flags,
  1315						   struct arm_smmu_device, iommu);
  1316		if (IS_ERR(smmu))
  1317			return ERR_CAST(smmu);
  1318	
  1319		if (!pinf->of_master_np) {
  1320			/* In ACPI mode the smmu uses the usual u32 format */
  1321			cfg = iommu_fw_alloc_per_device_ids(pinf, cfg);
  1322			if (IS_ERR(cfg))
  1323				return cfg;
  1324			cfg->acpi_fwnode = iommu_fw_acpi_fwnode(pinf);
  1325		} else {
  1326			unsigned int num_ids;
  1327			int ret;
  1328	
  1329			/*
  1330			 * In OF mode it supports several different formats for the arg,
  1331			 * pass through arm_smmu_of_xlate to extract it.
  1332			 */
  1333			num_ids = iommu_of_num_ids(pinf);
  1334			cfg = kzalloc(struct_size(cfg, ids, num_ids), GFP_KERNEL);
  1335			if (!cfg)
  1336				return ERR_PTR(-ENOMEM);
  1337	
  1338			ret = iommu_of_xlate(pinf, &arm_smmu_ops, -1,
  1339					     &arm_smmu_of_xlate, cfg);
  1340			if (ret) {
  1341				kfree(cfg);
  1342				return ERR_PTR(ret);
  1343			}
  1344		}
  1345	
  1346		cfg->smmu = smmu;
  1347		return cfg;
  1348	}
  1349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
