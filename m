Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6378922423A;
	Fri,  2 Oct 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903861; cv=none; b=AUqmp58XqAy2iD8BMoDD7SltHzsxR0/u/14JhDUYh3iOYwk3TKwvpEVusnKQb2f1t6y6/5vmvMCZe48amUrCpl6TG2KAlNArjaDMv/u4nhKx8ChUBpKAc8HA9PaqEJI7YYEwxDJDTYTex/27EN3ViZ/BA5kMjXvT7k2Bq0DB5OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903861; c=relaxed/simple;
	bh=BS1daTxn6+PAcB7PTtnj902/C5rBv4bqsOknvINcfuY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WoWF6+xc7hnAQb6hmvwzCNCdClXzzWwQzbSTlxTGbbEwAgD1jubu+UwetXm3Ys9vpmoBlMWnRl3rWICoHuT1Ctwkzoiwx+QfSdzMZcZj9SXC2wu0txKpPNubG2EvQYdWEmCgM1wrWTOadtlfPJ2xyx1Vc9hWNuuytH2SiZ/FVhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQbBXPBq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQbBXPBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790903859; x=1822439859;
  h=date:from:to:cc:subject:message-id;
  bh=BS1daTxn6+PAcB7PTtnj902/C5rBv4bqsOknvINcfuY=;
  b=jQbBXPBqjuxQ3xQriCOPd5HX8uvrUKJiMG3hOnOOfERP6orAOL+qF4uS
   qRS4f+RiqkobvygDRGK8vQSf/wXc3VwXMA+VwwiLnS3++ymvK4FyiqLAw
   8ZNt+4HyiL5zzUJb9FzE2b/i+VLj3hWGugspNr34b7O2L9VeFyWHlfxrn
   OUfna/VknSnzpw+mkH/XoFc4U+CJ/of3OiPHhu3r136ahcl3Ft66XF65v
   TB0DUdrl2SWN4sJ4VV7wrgjN98rHg9Bj4aKqV69qU4s02AJcXW2higpcF
   Jx9cJ8Ux9BlqhfAm5BEDGzqkLU/suo/BDVdZgrc8n81N/ELeS0+0mRQCF
   g==;
X-CSE-ConnectionGUID: /gfI2gbwTROCaO2fkeTTRg==
X-CSE-MsgGUID: h0e5kP47R1i0ApP4xQNHzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="109159150"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="109159150"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:17:39 -0700
X-CSE-ConnectionGUID: o9FCq1W9ThmDZukul1eNFg==
X-CSE-MsgGUID: o81bikCYRxW2G+QMljYgGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="275262445"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 01 Oct 2026 18:17:37 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCRu2-000000000Jv-2Iwh;
	Fri, 02 Oct 2026 01:17:34 +0000
Date: Fri, 02 Oct 2026 03:17:17 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 17/87]
 drivers/iommu/riscv/iommu.c:1286:15: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202610020353.oHLYlNLw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: bfe2d47be5bc1b02f6c04d095fb71116d417241c [17/87] iommu/riscv: Add IRQ domain for interrupt remapping
config: um-randconfig-2001-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020353.oHLYlNLw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020353.oHLYlNLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020353.oHLYlNLw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu.c:18:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:20:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/iommu/riscv/iommu.c:1286:15: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1286 |                 dc.msiptp = virt_to_pfn(domain->msi_root) |
         |                             ^
   drivers/iommu/riscv/iommu.c:1286:15: note: did you mean 'virt_to_pte'?
   arch/um/include/asm/pgtable.h:284:15: note: 'virt_to_pte' declared here
     284 | extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
         |               ^
   1 warning and 1 error generated.


vim +/virt_to_pfn +1286 drivers/iommu/riscv/iommu.c

  1260	
  1261	static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
  1262						    struct device *dev,
  1263						    struct iommu_domain *old)
  1264	{
  1265		struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
  1266		struct riscv_iommu_device *iommu = dev_to_iommu(dev);
  1267		struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
  1268		struct pt_iommu_riscv_64_hw_info pt_info;
  1269		struct riscv_iommu_dc dc = {0};
  1270		int ret;
  1271	
  1272		pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
  1273	
  1274		if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
  1275			return -ENODEV;
  1276	
  1277		ret = riscv_iommu_ir_attach_paging_domain(domain, dev);
  1278		if (ret)
  1279			return ret;
  1280	
  1281		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
  1282			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
  1283		dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) | RISCV_IOMMU_PC_TA_V;
  1284	
  1285		if (domain->msi_root) {
> 1286			dc.msiptp = virt_to_pfn(domain->msi_root) |
  1287				    FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
  1288					       RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
  1289			dc.msi_addr_mask = domain->msi_addr_mask;
  1290			dc.msi_addr_pattern = domain->msi_addr_pattern;
  1291		}
  1292	
  1293		if (riscv_iommu_bond_link(domain, dev))
  1294			return -ENOMEM;
  1295	
  1296		riscv_iommu_iodir_update(iommu, dev, &dc);
  1297		riscv_iommu_bond_unlink(info->domain, dev);
  1298		info->domain = domain;
  1299	
  1300		return 0;
  1301	}
  1302	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
