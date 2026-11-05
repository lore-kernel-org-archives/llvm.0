Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907179;
	b=UhJmY90o85epdq7Bdj3ZdD2fhA4pXTJ+haEDDoBcuB6R3a4YLbR9TjRHvkLoHibEEOPF
	 OSbB4Frigay6rGvokkIHjWeD22dfp3l3nx8MvFWu8Le6iX41UxM+pKWTOsCoAWhIuVghG
	 JlMQT4qee67Wjsjnu/ajktp86KbTcWcrwlfgohNKO+KAWZrmPfnBzWhqzjblqQ1dXeHV9
	 /OwWjTr9rIACwkHKxihQ7G01UKXTPO/+TytIpG3DC3eyFAqeMoPzebgPyk5d7zYJWDCq5
	 uZqDsW8gEh7ojxfrdofYSiedjTZ1i/c46TA99W5lFgZNlFEk+l/Ni5pVtVeLjaNxwCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907179;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ld65lnB6s2YHIIEbU+Hu5d5TFh0BNX0AIPrrPDZ2AHU=;
	b=zXnG/7tFH/eg/qD6/HigzeEc3uEWpdxq87QrgrqXavtAQeuWHFVAay6RklCpH3vkcKzm
	 ngBdEbyMOymSG5yVcMAitvLUMiBaI4M9VzoLSwDHd040h/JBpyZhTl+w1BIYAA/QNh/GK
	 6LCEMwEZRNIeGrO4R0O+TDLPh5Fg1edpA73JwSJrsY60pf0te5/p/qiqjXtm5yZsx6qOw
	 VHtwTa0C3TZxeeBXbW9i5gqJkS9cQICiGEDbiB/INVedfOt9xUjYIRwYMuY9BdBjSH4Ss
	 TNt0bHfLVi9BR2vzHC9foFEgPdNTI7gt35kr0Ei33A7sLOVGUWYkIZG3owT+B8kH8ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Rz/Hd/de";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA31606A6D5;
	Thu,  5 Nov 2026 19:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA31606A6D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rz/Hd/de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793907178; x=1825443178;
  h=date:from:to:cc:subject:message-id;
  bh=TA8v5l/pCkR/fJixyJoW/Ec7dS1dGcJ5fRQRBf9Q2RE=;
  b=Rz/Hd/de2DOhPcmgZSrfe8Z1U98a8m/imkUx1TKri2aGufOAQ8U5INbQ
   zMvxyjFoLuomsRY6D4nXDNWRV3ifIQ4W3pS5wD1bTdjB3U55qYuNmyMTt
   jz8ENrIXyJcyY4VcQThAfU2piLlF4NvkLP1CxeQogPIeUhoLvTrinjBFk
   w8KCL+w75l/7CVqC1v5aJqbEAoMY9LTSHRFwO2R1NWo9D4Pdc5Tjdx66s
   kxyCQgNVkJO2ij4qAfLfTVLm7CFwMJBjcPUEKIgcbmIT6XYhjsN7VM9Ez
   lsIfdnXUVftqfkmqG432+xWJWDUWEjnIypxVcVc76y5vABUQzh4GW7QDx
   g==;
X-CSE-ConnectionGUID: ZZ6/4+tbSpiYwj2FRjd4jA==
X-CSE-MsgGUID: bBd2f8MbQ2qsWp+nAOQlEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2744795"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2744795"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 11:32:57 -0800
X-CSE-ConnectionGUID: sywi7Iw8SS6qKqydGdvi6w==
X-CSE-MsgGUID: 57v5EeJbSo2t3rGn0C+LWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8849709"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 11:32:56 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP3Ce-00000000mlA-3ux2;
	Thu, 05 Nov 2026 19:32:52 +0000
Date: Fri, 06 Nov 2026 03:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v12 25/46]
 drivers/iommu/riscv/iommu-ir.c:325:13: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202611060326.XsfEE8cQ-lkp@intel.com>
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
commit: 0d3e96b381559dc884edb4c957ef4ae6747b454c [25/46] iommu/riscv: Add guest file irqbypass support
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261106/202611060326.XsfEE8cQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060326.XsfEE8cQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060326.XsfEE8cQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/riscv/iommu-ir.c:325:13: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     325 |                 .msiptp = virt_to_pfn(domain->msi_root) |
         |                           ^
   drivers/iommu/riscv/iommu-ir.c:325:13: note: did you mean 'virt_to_kpte'?
   include/linux/pgtable.h:175:22: note: 'virt_to_kpte' declared here
     175 | static inline pte_t *virt_to_kpte(unsigned long vaddr)
         |                      ^
   1 error generated.


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
