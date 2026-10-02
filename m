Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F96F30D3E5;
	Fri,  2 Oct 2026 02:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790908863; cv=none; b=p4k33Mpe6KtjSLcu7FMkBtKD2HSyTc/B7LCODeUZpBgSzw99IJCtrD+yZYo1qf6W6XPg8BVPLhZOCM6dugDKGU0R+wkRAAgPWxtYQtUBGzDJBgxnylpW0kYq3k9AmSnALZh2Tzpij1w4tM9/0BHihcQADlKIqSkc0o8of0jnhEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790908863; c=relaxed/simple;
	bh=JsLAv/knxVizdzQSSx62mwVHSe7xE9QjBe+VCWy57XA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s4u/IlX9F7q5j0Q9h8J1mDavfGg45M7VlPvjhgatnAnN76EGnYK7rqq//BiCE222rtXBmigNrRx4ELbBqr+tcTvuNqZTCew1WbuMAvP3oNdla1o88SDMCkryB0fWhoqaV5VUjipdAsOJMMtBvf1jiDrItKbVinNvkwz9NiuZazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mr2Ib4VF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mr2Ib4VF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790908861; x=1822444861;
  h=date:from:to:cc:subject:message-id;
  bh=JsLAv/knxVizdzQSSx62mwVHSe7xE9QjBe+VCWy57XA=;
  b=mr2Ib4VF1onrUoD03vR4poAKRwpyYqyWR+Q7hlZT0eKsSKo/Td3digTC
   7KwYH0qFOBInAK+M1j9nZnsBcgiAgO1l8FkDCRP3bShelHcFrI1dhiLbi
   2JAxbKxGxQnIoz/CL/D8I0pcmxI0oewfc3iCtrFC0AO2AnoaRpRYEA/5R
   tEFoOlAA9qpMeNu30Y8lpYQzT0XXI7d+HV8otQdh7vTcvyRbPYVzyH4xu
   P53WxUfR+9BEZn+jFriclqcIKHz7PyscAOBSPRHDOGZx+6QbFf2CMUZr8
   wd45QsBClwlVqN7LPLDib1fT6H7Iu1ZQoyMniKS6GnaJ1lUK3W0fP9mXs
   g==;
X-CSE-ConnectionGUID: CdW5iqVHTn6doMDNdRu7bA==
X-CSE-MsgGUID: 9iK4+ApyQKqEcuyPlgby/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108058529"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="108058529"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 19:41:01 -0700
X-CSE-ConnectionGUID: oYkzjlzJTtOLyZ75L7Ai7A==
X-CSE-MsgGUID: geujd1IQRYeE7yfco1iy1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="273968643"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Oct 2026 19:40:59 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCTCj-000000000MN-1OFS;
	Fri, 02 Oct 2026 02:40:57 +0000
Date: Fri, 02 Oct 2026 04:40:25 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 25/87]
 drivers/iommu/riscv/iommu-ir.c:325:13: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202610020457.U4VhZETX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: 7ed3486599553f96f1b456971bd63b3973904f3c [25/87] iommu/riscv: Add guest file irqbypass support
config: um-randconfig-2001-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020457.U4VhZETX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020457.U4VhZETX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020457.U4VhZETX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu-ir.c:10:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/iommu/riscv/iommu-ir.c:325:13: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     325 |                 .msiptp = virt_to_pfn(domain->msi_root) |
         |                           ^
   drivers/iommu/riscv/iommu-ir.c:325:13: note: did you mean 'virt_to_pte'?
   arch/um/include/asm/pgtable.h:284:15: note: 'virt_to_pte' declared here
     284 | extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
         |               ^
   1 warning and 1 error generated.


vim +/virt_to_pfn +325 drivers/iommu/riscv/iommu-ir.c

   306	
   307	static void riscv_iommu_ir_msiptp_update(struct riscv_iommu_domain *domain)
   308	{
   309		struct pt_iommu_riscv_64_hw_info pt_info, gstage_info;
   310		struct riscv_iommu_device *iommu, *prev;
   311		struct riscv_iommu_bond *bond;
   312		struct riscv_iommu_dc new_dc;
   313	
   314		pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
   315		pt_iommu_riscv_64_hw_info(&domain->gstage_riscvpt, &gstage_info);
   316	
   317		new_dc = (struct riscv_iommu_dc){
   318			.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
   319			      RISCV_IOMMU_PC_TA_V,
   320			.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, gstage_info.fsc_iosatp_mode) |
   321				   FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
   322				   FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, gstage_info.ppn),
   323			.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
   324			       FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn),
 > 325			.msiptp = virt_to_pfn(domain->msi_root) |
   326				  FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
   327					     RISCV_IOMMU_DC_MSIPTP_MODE_FLAT),
   328			.msi_addr_mask = domain->msi_addr_mask,
   329			.msi_addr_pattern = domain->msi_addr_pattern,
   330		};
   331	
   332		/* Like riscv_iommu_ir_msitbl_inval(), synchronize with riscv_iommu_bond_link() */
   333		smp_mb();
   334	
   335		rcu_read_lock();
   336	
   337		prev = NULL;
   338		list_for_each_entry_rcu(bond, &domain->bonds, list) {
   339			iommu = dev_to_iommu(bond->dev);
   340			if (iommu == prev)
   341				continue;
   342	
   343			riscv_iommu_iodir_update(iommu, bond->dev, &new_dc);
   344			prev = iommu;
   345		}
   346	
   347		rcu_read_unlock();
   348	}
   349	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
