Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CFF285CAA;
	Fri, 22 May 2026 03:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779421334; cv=none; b=DXdU6J385yNl/Hd2A0ee5sWbRThnFRYlly03MFRF3sKwYzab3IEjIrr/1RxYgHF58Q/bsnbV75wZKWDlA0yXqWvOISw24Cs+R1Br8GpbRdeUI9qQnX8cd5+bnIsaYZLcOiY/h0RUeMt9GEznSTGTPRBeJIAYvRi3VtVoo08fm2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779421334; c=relaxed/simple;
	bh=tV9dgERNqoJvKDBfFMcOPpD76b2rAmMqEMG40VFWZ1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hPMTDxa/ccetBcIobhZHwv9PJwb2CN02q/9BPfakelLfzH24zt8pCtoKWUHTE3O9bZ96L28NlAAX6650qp6nThutn616L80BYyzxAU9mEd+DQRYKF2h6rwMTT6f+E5D1afHBIMInqMjuetsfsberbnXAgXwBZ0xIqer+LGw+C3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEuEcO/f; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEuEcO/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779421332; x=1810957332;
  h=date:from:to:cc:subject:message-id;
  bh=tV9dgERNqoJvKDBfFMcOPpD76b2rAmMqEMG40VFWZ1I=;
  b=UEuEcO/fCXgM9+J0eCNa/tR+lEOulluJ/uovNcWrkiUI8yNduCUWV/MI
   T9XT9f+sSjIAXBhwvIrwGSTR8XNlNGTtBmsGSA5Rn0uQU2sVIGVe/hpiR
   mNseqqc5zZS3B4k67582iFYbGSbnf+YigI2y0Wz2hs23ZQslCNwCYAhub
   LENafxQxQWBRqqETU+P205Ewy3p3U7JpNf8Y0d7xLFoCms2spz5lMnc2k
   sJdcwWFRUK5RXeh6WMqCKEJen79W/dzM1+4r0W922aAp4guSP04VXAA0N
   KalzuFGo9XFEgMXxp2b0Q7hX3YEyfgMOuaUGhB871Rmdk8jq3WNOQkLO2
   A==;
X-CSE-ConnectionGUID: Ci9f26tSTESTbE92TUW+KA==
X-CSE-MsgGUID: 9jbzG4fNTWO8eVVssMnAow==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="97771071"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="97771071"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 20:42:11 -0700
X-CSE-ConnectionGUID: GXUPHSuKQJu9NqUBfbSUTA==
X-CSE-MsgGUID: 50Z6DMk+RoGdbDdTjbbpMQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 May 2026 20:42:09 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQGlz-000000001eL-0cNb;
	Fri, 22 May 2026 03:42:07 +0000
Date: Fri, 22 May 2026 11:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 12/65]
 drivers/iommu/riscv/iommu.c:1181:15: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605221104.DbDZLwRw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   7087f62c7333ca95c6a5c57f5ba52bd1594f22cf
commit: 4d325e1fb5c55e8cf3982b22ec745949ededd3b7 [12/65] iommu/riscv: Add IRQ domain for interrupt remapping
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605221104.DbDZLwRw-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221104.DbDZLwRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221104.DbDZLwRw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu.c:18:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:20:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/iommu/riscv/iommu.c:1181:15: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1181 |                 dc.msiptp = virt_to_pfn(domain->msi_root) |
         |                             ^
   drivers/iommu/riscv/iommu.c:1181:15: note: did you mean 'virt_to_pte'?
   arch/um/include/asm/pgtable.h:284:15: note: 'virt_to_pte' declared here
     284 | extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
         |               ^
   1 warning and 1 error generated.


vim +/virt_to_pfn +1181 drivers/iommu/riscv/iommu.c

  1155	
  1156	static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
  1157						    struct device *dev,
  1158						    struct iommu_domain *old)
  1159	{
  1160		struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
  1161		struct riscv_iommu_device *iommu = dev_to_iommu(dev);
  1162		struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
  1163		struct pt_iommu_riscv_64_hw_info pt_info;
  1164		struct riscv_iommu_dc dc = {0};
  1165		int ret;
  1166	
  1167		pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
  1168	
  1169		if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
  1170			return -ENODEV;
  1171	
  1172		ret = riscv_iommu_ir_attach_paging_domain(domain, dev);
  1173		if (ret)
  1174			return ret;
  1175	
  1176		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
  1177			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
  1178		dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) | RISCV_IOMMU_PC_TA_V;
  1179	
  1180		if (domain->msi_root) {
> 1181			dc.msiptp = virt_to_pfn(domain->msi_root) |
  1182				    FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
  1183					       RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
  1184			dc.msi_addr_mask = domain->msi_addr_mask;
  1185			dc.msi_addr_pattern = domain->msi_addr_pattern;
  1186		}
  1187	
  1188		if (riscv_iommu_bond_link(domain, dev))
  1189			return -ENOMEM;
  1190	
  1191		riscv_iommu_iodir_update(iommu, dev, &dc);
  1192		riscv_iommu_bond_unlink(info->domain, dev);
  1193		info->domain = domain;
  1194	
  1195		return 0;
  1196	}
  1197	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
