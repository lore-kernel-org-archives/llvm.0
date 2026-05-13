Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66156145B11;
	Wed, 13 May 2026 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686361; cv=none; b=ZeiEifH5tsbCgdFsBPATHpJGJ9n1Cyj+jfW7CC5MeeVyI9KnbMfxh7vQI+n5nmjnH5eDuyoM++VNeceBq7nos49In9dbwqHtqYltIn4zDkgcfa8xkAPbhlGABlZxj7IxYGm0XkT6S0NKsZtg2sxCI/Yo0BVn2ncM0SdhIaNW4HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686361; c=relaxed/simple;
	bh=vfpMWq/u+iDnjqDgoPmABsgVru5Kptmi4H8MbvcH/IA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hS5vMpjNSCb738tK17CzUV7rKwNoYz0lVczMMzC0490RN/8NttPTzXuggjHLAPalZXPJlPsZPOOoGKL4Bzcvg01G3uy9uRYX1GqOPYta7JdQ5mcey3suycPmQx177dgwL8m8Cx+W07HP171gn/R6kHOHxde0CR99cwaJN3KcoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4ZfFFZ8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4ZfFFZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778686360; x=1810222360;
  h=date:from:to:cc:subject:message-id;
  bh=vfpMWq/u+iDnjqDgoPmABsgVru5Kptmi4H8MbvcH/IA=;
  b=H4ZfFFZ8Y8HeJtZemK6UzPdfVDtIE3cq5eYbluDEE/v+qPjlthJ9UVrr
   WcxBXatp/3fTdkdSH4sbTc7ZWgSiYbdcvV4ejL2epsP4lHOZVzPxbRwki
   921Pnl4eUo40BFWBu7Q8K3/jtxVZlUi0q3nmKVFDEe6Ls4s0wirtENge9
   GG177aszwz434Pcx3k6JNVom1jfI2ii+ZkvzoX0QHX4phZWrD1p3v19sK
   H2Rb46mLNhaU8dQ5ULQHx+IvuHShXs4VR0g6E5eQL4BTKdXZUDKHeK7PK
   g7xqDY2pM3JBdkkM0DVs8voeqyevXPa1ZzZGXdKJYI60t0MkFr56IEDde
   g==;
X-CSE-ConnectionGUID: 8+KhxO2xRjecfzX9qoACqg==
X-CSE-MsgGUID: 2ztlpcZ0Q0m5jCwLkCr0kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90310765"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="90310765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 08:32:39 -0700
X-CSE-ConnectionGUID: blVsVntXQsK5Y3UJMW1ijQ==
X-CSE-MsgGUID: ich/W68aTHytQV5CGryyHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="261859268"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 May 2026 08:32:37 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNBZa-000000004KJ-3edD;
	Wed, 13 May 2026 15:32:34 +0000
Date: Wed, 13 May 2026 23:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 7/60]
 drivers/iommu/riscv/iommu.c:1181:15: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605132339.J4ujGoJH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   893faf8dbff9fe0958fb1f32b778914af0fa1b45
commit: 636d6f4d6f412057412d72bfa4751cf2e760b0ad [7/60] iommu/riscv: Add IRQ domain for interrupt remapping
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260513/202605132339.J4ujGoJH-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605132339.J4ujGoJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605132339.J4ujGoJH-lkp@intel.com/

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
