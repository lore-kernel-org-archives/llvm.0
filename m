Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C725E4435;
	Sat, 25 Nov 2023 07:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kblRhXp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700897072; x=1732433072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6n6QMcaABgJpw1hUSOBou9L5RvyTT+BV3purB7lEEyM=;
  b=kblRhXp6s6ETpR4WFmM1Xz0fOm9brwWRrtwgHwMKUqfnH70gLToOP0Py
   OqMHc+TpTyMslry8ZXfrtiob+uomzb5GzDQbZl6fnf1U4mj/hqT2i7bFc
   eqb+PrjUNuA0HOoRdjAKrMSxd4Z/MdqLLdiieosPbURs6mRd6wgqChkAy
   +zj60xhYJjsyr9ViB43Vz6SNDa5fhByHY5NMW+F95I9Yxw2TmPfZ3Sdfj
   V9dFoTxyXeC99c1RpEBB74wzsRrYFjICMCdGicvCbiGcEnjhZZuqwV1Pm
   v0EQw1wLPYwKJnnpL5fErVdDZb2PEa0su4AW0zqj1EAngFV29RVmy13wy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377546085"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="377546085"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="941093723"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="941093723"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Nov 2023 23:24:30 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6n1g-0003j2-1x;
	Sat, 25 Nov 2023 07:24:28 +0000
Date: Sat, 25 Nov 2023 15:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 38/41]
 drivers/iommu/arm/arm-smmu/arm-smmu.c:178:1: error: expected identifier or
 '('
Message-ID: <202311251407.uFSaCbCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   c87a72108f7683a608ec2eb459ee92b3eeca7406
commit: 1edf61c2267928bf8ca21acf257018342828b13b [38/41] iommu/arm-smmu: Move to iommu_of_xlate()
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311251407.uFSaCbCn-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251407.uFSaCbCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251407.uFSaCbCn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu/arm-smmu.c:178:1: error: expected identifier or '('
   {
   ^
   1 error generated.


vim +178 drivers/iommu/arm/arm-smmu/arm-smmu.c

a9a1b0b53d8b7c drivers/iommu/arm-smmu.c              Will Deacon     2014-05-01  130  
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  131  static struct arm_smmu_master_cfg *
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  132  arm_smmu_register_legacy_master(struct device *dev)
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  133  {
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  134  	struct arm_smmu_master_cfg *cfg;
adfec2e709d2a4 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-12  135  	struct device *smmu_dev;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  136  	struct device_node *np;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  137  	struct of_phandle_iterator it;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  138  	void *data = &it;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  139  	__be32 pci_sid;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  140  	int err;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  141  
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  142  	np = dev_get_dev_node(dev);
a6c9e3874e5759 drivers/iommu/arm/arm-smmu/arm-smmu.c Rob Herring     2023-03-10  143  	if (!np || !of_property_present(np, "#stream-id-cells")) {
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  144  		of_node_put(np);
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  145  		return ERR_PTR(-ENODEV);
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  146  	}
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  147  
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  148  	it.node = np;
d6fc5d977671d1 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-12  149  	err = driver_for_each_device(&arm_smmu_driver.driver, NULL, &data,
d6fc5d977671d1 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-12  150  				     __find_legacy_master_phandle);
adfec2e709d2a4 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-12  151  	smmu_dev = data;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  152  	of_node_put(np);
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  153  	if (err == 0)
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  154  		return ERR_PTR(-ENODEV);
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  155  	if (err < 0)
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  156  		return ERR_PTR(err);
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  157  
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  158  	if (dev_is_pci(dev)) {
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  159  		/* "mmu-masters" assumes Stream ID == Requester ID */
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  160  		pci_for_each_dma_alias(to_pci_dev(dev), __arm_smmu_get_pci_sid,
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  161  				       &pci_sid);
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  162  		it.cur = &pci_sid;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  163  		it.cur_count = 1;
f80cd885fcdd05 drivers/iommu/arm-smmu.c              Robin Murphy    2016-09-14  164  	}
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  165  
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  166  	cfg = kzalloc(struct_size(cfg, ids, it.cur_count), GFP_KERNEL);
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  167  	if (!cfg)
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  168  		return ERR_PTR(-ENOMEM);
44680eedf9409d drivers/iommu/arm-smmu.c              Will Deacon     2014-06-25  169  
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  170  	cfg->num_ids = it.cur_count;
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  171  	cfg->smmu = dev_get_drvdata(smmu_dev);
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  172  	of_phandle_iterator_args(&it, cfg->ids, it.cur_count);
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  173  	return 0;
45ae7cff3684ab drivers/iommu/arm-smmu.c              Will Deacon     2013-06-24  174  }
cd221bd24ff556 drivers/iommu/arm-smmu.c              Will Deacon     2019-12-19  175  #else
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  176  static struct arm_smmu_master_cfg *
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  177  arm_smmu_register_legacy_master(struct device *dev);
cd221bd24ff556 drivers/iommu/arm-smmu.c              Will Deacon     2019-12-19 @178  {
1edf61c2267928 drivers/iommu/arm/arm-smmu/arm-smmu.c Jason Gunthorpe 2023-11-23  179  	return ERR_PTR(-ENODEV);
cd221bd24ff556 drivers/iommu/arm-smmu.c              Will Deacon     2019-12-19  180  }
cd221bd24ff556 drivers/iommu/arm-smmu.c              Will Deacon     2019-12-19  181  #endif /* CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS */
cd221bd24ff556 drivers/iommu/arm-smmu.c              Will Deacon     2019-12-19  182  

:::::: The code at line 178 was first introduced by commit
:::::: cd221bd24ff5567bbcc11ec0c303141a7c2b71bf iommu/arm-smmu: Allow building as a module

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
