Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01D91624C5;
	Fri,  1 May 2026 00:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777596243; cv=none; b=mSAHjRW+ZiEAPlV7LLbheOZESEBnM3E3soxk2eduEuuZISS5gbFDxmauGzyAGllYbn5Xq4O047hycV/u03tFIZpC7ZkajeGLkVUFXudtC1U9NwZhEuNaOEYZpuxDj02HcgPJ05ADF4pa5MiVJBZoj5NkB5AipT2sPg8AfeitGYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777596243; c=relaxed/simple;
	bh=YQFQLzXtLtoFX6B3iKKOLhplQJGsp/sjJIIbyGKgNs8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cR9mtvdbirTNH7/Q/jV2YA2excdQ4J98oN1iw1ZA+L45AuW/HAeXlhTYM2Yqkei6lotRnzwA8Y8W7RWYrB/PFfCACgELvFYSsM/mk9yUguGorUUJKWlJe0Sh6+Y+cGliRF2jz/yZsNCJBp7KDiRFJvs8/laRU/dtSuyX/b10XCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUKNwh7T; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUKNwh7T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777596242; x=1809132242;
  h=date:from:to:cc:subject:message-id;
  bh=YQFQLzXtLtoFX6B3iKKOLhplQJGsp/sjJIIbyGKgNs8=;
  b=cUKNwh7TuoffqTwec9vvZPynlB94i5axghwoVOysAbCjfvrlOTLnTxOc
   WflRkGKQfT4Mh0evwKBBQa93uGbBq4BI74crzuBtDCggQ3hVUiCrA1Yzg
   wdstwLk36RBLSfTiM0OTtWIf6LPC2M2okX4fLXNyd2NyQXOrM9p035GPW
   vZDYrCHgPEQfuPT+46K/E/rJAFVu++xHwtLTdk+ZSj3fBoKDT8GAUB60V
   e9e8kMIFp1czpxoZ2JUqirvJ+xQQmr99CRJk6vEKDv7zNQ3V98SwYfBAb
   s7a3axgLwhcMGt7jLisLPwE0fJbB/WLweOLKDCnLbRMf3fYgtIJrdpF5j
   Q==;
X-CSE-ConnectionGUID: pr/Q5BrtQC+Ra2ZTkMMZvA==
X-CSE-MsgGUID: hegIasN9TfqhUxx+wgwCSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78432324"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="78432324"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 17:44:01 -0700
X-CSE-ConnectionGUID: sOZ2/l9IRy+Mixh2aP74Uw==
X-CSE-MsgGUID: yWGqWavWSTK8s1sxAXn3hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="239067986"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Apr 2026 17:43:59 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIbys-00000000DB2-1PKf;
	Fri, 01 May 2026 00:43:46 +0000
Date: Fri, 01 May 2026 08:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: Zong Li <zong.li@sifive.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 Nutty Liu <nutty.liu@hotmail.com>
Subject: [avpatel:riscv_iommu_irqbypass_v2 4/18]
 drivers/iommu/riscv/iommu.c:1197:55: error: no member named 'pgd_mode' in
 'struct riscv_iommu_domain'
Message-ID: <202605010854.qewZyTHP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_iommu_irqbypass_v2
head:   0ba166d111b762ae8f37075ba1266e345ae5ef59
commit: 495fff405c515405e7c816985699bc45338d297d [4/18] iommu/riscv: Use data structure instead of individual values
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260501/202605010854.qewZyTHP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010854.qewZyTHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605010854.qewZyTHP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/riscv/iommu.c:1197:55: error: no member named 'pgd_mode' in 'struct riscv_iommu_domain'
    1197 |         dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                                                      ~~~~~~  ^
>> drivers/iommu/riscv/iommu.c:1197:55: error: no member named 'pgd_mode' in 'struct riscv_iommu_domain'
    1197 |         dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                                                      ~~~~~~  ^
>> drivers/iommu/riscv/iommu.c:1197:55: error: no member named 'pgd_mode' in 'struct riscv_iommu_domain'
    1197 |         dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                                                      ~~~~~~  ^
>> drivers/iommu/riscv/iommu.c:1198:59: error: no member named 'pgd_root' in 'struct riscv_iommu_domain'
    1198 |                  FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
         |                                                                 ~~~~~~  ^
>> drivers/iommu/riscv/iommu.c:1198:59: error: no member named 'pgd_root' in 'struct riscv_iommu_domain'
    1198 |                  FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
         |                                                                 ~~~~~~  ^
>> drivers/iommu/riscv/iommu.c:1198:59: error: no member named 'pgd_root' in 'struct riscv_iommu_domain'
    1198 |                  FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
         |                                                                 ~~~~~~  ^
   6 errors generated.


vim +1197 drivers/iommu/riscv/iommu.c

  1181	
  1182	static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
  1183						    struct device *dev,
  1184						    struct iommu_domain *old)
  1185	{
  1186		struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
  1187		struct riscv_iommu_device *iommu = dev_to_iommu(dev);
  1188		struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
  1189		struct pt_iommu_riscv_64_hw_info pt_info;
  1190		struct riscv_iommu_dc dc = {0};
  1191	
  1192		pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
  1193	
  1194		if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
  1195			return -ENODEV;
  1196	
> 1197		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
> 1198			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
  1199		dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
  1200				   RISCV_IOMMU_PC_TA_V;
  1201	
  1202		if (riscv_iommu_bond_link(domain, dev))
  1203			return -ENOMEM;
  1204	
  1205		riscv_iommu_iodir_update(iommu, dev, &dc);
  1206		riscv_iommu_bond_unlink(info->domain, dev);
  1207		info->domain = domain;
  1208	
  1209		return 0;
  1210	}
  1211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
