Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895259;
	b=sPF8wsqzmaignH27Z12/o9QJZ3/++2b+cx450vfOHCx33kWph+LbPZc42/BYokhGr69B
	 p+yVnXY7VWSnnFEpPi2oY7HvHlkA80WWeFAFHGV+jrGIRqskwe8TaUC5wbi5e76pHif2i
	 xPfeCQdbk+OVs0sN7tCSWzu7AAHVi0MkyhDaD9aWoAdV0XqKwWDsMfNQmVDH7nU5ER+hr
	 0o7Q568TYQFMZVsyPljd6wVfnPRfRqQBOLR+01ZIP2xka2TYQE5KsxueGWAsA3NqPQNY+
	 leqIkPQNktC1L1DF28ALquERiVl0eFls0tRtrzGKYk7SJo2Wm/dn7HVf+mogW9i7hwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895259;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DxM+VnUXVDpz7ltojWRFXsifMTmGzeuPyBAfL0uZa/0=;
	b=XXpTVBcCmgOmDmOCuHhmOH7ZI5QzjZL3k+AYQ2UJfVJPTXUWqkaAMvTEMZdmbhIbo05a
	 dxZLTyw8Hb4uLY61PH0TiC9fmmnSMFfHWB+t4wsI18Dq2ctG90qTZBCFhpnbuGo3PioXR
	 LUKlS6JZUFQHctTFeCC/0bLUK0Mbez8T3TjGeZ5nlazi3O3obiUZ3getJCuRVAn909cp0
	 DQtAaqTlMV4OAriRm63eMORziITDJkqR9JaQJthuThqSvm1RKXAhuc2DubJFQ8UlxMmdG
	 HuDx5Tj1fjJTXFBgj4RZ4FUB94yrMO6VfwqI4OsY805s68KYruFUYjkh15t1jSV/N5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=drPOFg0Q;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0318C606A31C;
	Tue, 17 Nov 2026 06:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0318C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=drPOFg0Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794895260; x=1826431260;
  h=date:from:to:cc:subject:message-id;
  bh=b4nOZTgiGkatqGGQAXTbzzsFV7O1INzLxnRGtHpB7Nc=;
  b=drPOFg0QyLiriJvC2OoFhHCrPFjxazWHnopqSCFljQ/bUWDMmBOFk2rJ
   /HN7XUPGSVo0Oi44DIA9Y24toc+92sexhdmYuCpXozE7jKZndRRYq4hQx
   BL2qVPPLFefOivmkqq6C3D2EhfCx9VnDogEi/1qeplwY25DjJ8c/9Rfeg
   Hw+XEd6j0HGGDloc+i8gjTofRmX1eiukHjWaEk1stBfh6jAMU17V7Php/
   y5MltExRlc5DUJkvTuKuHiqAfs5k/XyMVOvV5t0DSPYCWs2aZ9aaPxI20
   LG+S/RvWTsB7RVtD/ZCux9CvfsxCrz6m9fCDcg2et0ZNkWz4+XxmWSTlh
   g==;
X-CSE-ConnectionGUID: A2yCLwkxT3ykXijMI+Yp9Q==
X-CSE-MsgGUID: 12GLGlrFRNS8RCdLn1ZfYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3641653"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3641653"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 22:00:58 -0800
X-CSE-ConnectionGUID: GhLyvvYoSdKkTb5iHzWt2w==
X-CSE-MsgGUID: Nhc7czfqSr2K6EpHiG83uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11679351"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 16 Nov 2026 22:00:53 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTCFP-00000001A8K-2Gmn;
	Tue, 17 Nov 2026 06:00:51 +0000
Date: Tue, 17 Nov 2026 14:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 26/89]
 drivers/iommu/riscv/iommu.c:1287:15: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202611171308.vQrnsvMp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   1dab2361933785691d1874856d9e368c5be79b2c
commit: cbdcd79d57964765c2aa1e5a50ce2d65cd95eb0b [26/89] iommu/riscv: Add IRQ domain for interrupt remapping
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261117/202611171308.vQrnsvMp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611171308.vQrnsvMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611171308.vQrnsvMp-lkp@intel.com/

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
