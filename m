Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890096;
	b=zvavQ3mPPSuasv+oLnwBTI3hfR9YE48hIgt/Xw6uwFv2GtfTSo+GUAw3AAiaiTdXb3Gv
	 XFONp80RATOxkhlLApHaXUXYsRh4X64rc1cbZSvpweQj0b2xCBsm/3hPRHJdXLj3FoZlP
	 Y0/L+jJ93O1zJe/Vu4PCNYETYX8kfavMKAMr7gTR1sgva8V20v0aA9/UlCshBALDocYDW
	 iS4Wwq8eeLOu5DG5QWaiNCMYyxchJGOSaNLd+JCmjkIDsX3CALmVOWoBiFtLijoBGTYrA
	 1tA88fedU3Nx9iKh8SVsySBvsVZC5+viFHX3EPJEHw9Hs6NKFzvG7aWi9labKEJAv+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890096;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cWFoGZDZXZWmHZU/BuomrRSSpBfsbXG61vJhz9UGsuk=;
	b=m0kWWdiRl3ztnrIXBqhyyypSdB9pAdUQetVQ+4EOR0bZ8v4qCThVqrf849dRIxLuzv4O
	 3N3aoTiLsuc/gALcp9ofMisrcfN2oT/bErpVAik/nC3Qq2nuEMRAv9IImUyre4QO8Dx/r
	 svpzWX1XhdHjPnUKzF4NEjvKw+YTJhkZz9j525WulMZc7uDQ9iieiQpu59hMqcaa1iYKO
	 SHLAEdFqCFWqvuPAO1ichecI12Q8p4lM/YuZfSs4k93xMg+cUzU9kQ4N1K7VKcTcunCj4
	 zYSE3VLzRZFVA5RYPU9dnM3sbFXDOXNzjpbq0eIBDVyZ0P37MPQtZPkSWQAhckGjrVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sitby1In;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA16E606A330;
	Thu,  5 Nov 2026 14:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA16E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sitby1In
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793890094; x=1825426094;
  h=date:from:to:cc:subject:message-id;
  bh=QmnwDxz86nvresraMw7UdpnrClfHHU1Q2I2EFPIc+V4=;
  b=Sitby1Ingl+AZS5ngPlGgI6SE5zroNbgjs2tLjmkv4K4pQFCmG1G2IEL
   YZWsz3qH8jIlIgy+vrPl8XCWgM0gJcRLBRC43edCa64h6ny8Nm21QDfcQ
   GbFpgcvsbmkZNZvSeN6FLpzgOx6hk/gyeu8FASxbYUZIxsqWwKb1I+7FD
   HnoVOSjHtSXvK5X5ZLz6DHDb0RYsYifThpN0AJli17VLxROGS5welYPEY
   AribZ8VucmamgtezIt//2VxH+dLEa0950E6jCALxIC8VzPSCWkukC9kRt
   B/th7RO5D1QX2/hR87BgB7GM/QzXLXISekTnGjGrjx5+FBMbrNR7mf2KR
   Q==;
X-CSE-ConnectionGUID: yGzqDUseSq6WUev/PZCaUA==
X-CSE-MsgGUID: JN1u1sUoSRGpC0tn9tYfIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2712919"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2712919"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:48:14 -0800
X-CSE-ConnectionGUID: XIm0qMssStim+bCOoVykdg==
X-CSE-MsgGUID: lXhRB+T4SBCb6cdGvhFFQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7367497"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2026 06:48:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOyl7-00000000mLB-2Jak;
	Thu, 05 Nov 2026 14:48:09 +0000
Date: Thu, 05 Nov 2026 22:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v12 17/46]
 drivers/iommu/riscv/iommu.c:1287:15: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202611052137.5r5Z4MVM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v12
head:   6edb42266d180e7a96cbf7c0f790f5170e1c5c5a
commit: a49d1ae32c9d2e31752c7c9d50772bbfb57647a9 [17/46] iommu/riscv: Add IRQ domain for interrupt remapping
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611052137.5r5Z4MVM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052137.5r5Z4MVM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052137.5r5Z4MVM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/riscv/iommu.c:1287:15: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1287 |                 dc.msiptp = virt_to_pfn(domain->msi_root) |
         |                             ^
   drivers/iommu/riscv/iommu.c:1287:15: note: did you mean 'virt_to_kpte'?
   include/linux/pgtable.h:175:22: note: 'virt_to_kpte' declared here
     175 | static inline pte_t *virt_to_kpte(unsigned long vaddr)
         |                      ^
   1 error generated.


vim +/virt_to_pfn +1287 drivers/iommu/riscv/iommu.c

  1261	
  1262	static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
  1263						    struct device *dev,
  1264						    struct iommu_domain *old)
  1265	{
  1266		struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
  1267		struct riscv_iommu_device *iommu = dev_to_iommu(dev);
  1268		struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
  1269		struct pt_iommu_riscv_64_hw_info pt_info;
  1270		struct riscv_iommu_dc dc = {0};
  1271		int ret;
  1272	
  1273		pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
  1274	
  1275		if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
  1276			return -ENODEV;
  1277	
  1278		ret = riscv_iommu_ir_attach_paging_domain(domain, dev);
  1279		if (ret)
  1280			return ret;
  1281	
  1282		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
  1283			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
  1284		dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) | RISCV_IOMMU_PC_TA_V;
  1285	
  1286		if (domain->msi_root) {
> 1287			dc.msiptp = virt_to_pfn(domain->msi_root) |
  1288				    FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
  1289					       RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
  1290			dc.msi_addr_mask = domain->msi_addr_mask;
  1291			dc.msi_addr_pattern = domain->msi_addr_pattern;
  1292		}
  1293	
  1294		if (riscv_iommu_bond_link(domain, dev))
  1295			return -ENOMEM;
  1296	
  1297		riscv_iommu_iodir_update(iommu, dev, &dc);
  1298		riscv_iommu_bond_unlink(info->domain, dev);
  1299		info->domain = domain;
  1300	
  1301		return 0;
  1302	}
  1303	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
