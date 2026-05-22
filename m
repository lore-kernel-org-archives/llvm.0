Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234A53B52E1;
	Fri, 22 May 2026 09:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443332; cv=none; b=P3mPmk4Ri8p2IURXiAJ2qY5iGJ8RWn4ZLCPPOSzHddHfNNqKieFptw6PjU9D9xDHu9w4kcWXaZkSO8SQHPDPtUe8/VXmwlt2cg7Gg+GrBygXO0Bo87iDum9HYSutvB8h6rJ8ioga/FpDGImTrfQNI9fiE6mgm9Y9i8jtS/XUq/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443332; c=relaxed/simple;
	bh=pXuKngj1VF6nqhCAC95aGkRrbtnFauBmbxWFiqcafqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j/qzyrQ6CujM0xRIFT8l67SBLe6m8svCCG1Q7bXDYhd5MJH8RCoH0GOp1S9vRENRNbz0XI1aVxdBtrFShbDib1e7C0k20ixiWFWz5oHxXJzCKquAkPmKQ/mIxLBvTM7czDmNvdQjjYpe8+569ay3uN+JuAoccSLVRvCk5y/cbR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIOCXVod; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIOCXVod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779443330; x=1810979330;
  h=date:from:to:cc:subject:message-id;
  bh=pXuKngj1VF6nqhCAC95aGkRrbtnFauBmbxWFiqcafqs=;
  b=dIOCXVod5qn6LS9GIGRmlkUu7QkmqiVuzfQCNjGcamzD4oUf/shOj84H
   MWCZkTWDA88AUbfjcSFkHDgYhSR0M2akPcXxot7/b2F4NZFEwq9RrG6H+
   rkpVN3FYdMID9EJNL0HEA4zM1dFiDpLUiITXSHHDXgPCBwioL04/C1xI3
   6qqh956esCu+h4ppU+/X3MObL+fEmR8tKs/nBNXJcvdPdNYTPbgn3NUOM
   Jb3dxwgRjUDfa6SHlFYqYg8ESckHi+VpWwzO4d8AgKHjw3vBb7RcwOKkB
   IHzBnkXpfnzToYFGO3WlanjmE/9q03bpJ+rABHwsanU48KSo5kZ8ByGOw
   w==;
X-CSE-ConnectionGUID: zY/pKOgwQ5SRL+GDnLJ9zA==
X-CSE-MsgGUID: 3hdjexx0RJuG1TqGTj4cfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91840187"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91840187"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 02:48:49 -0700
X-CSE-ConnectionGUID: Rv0OMenCT+irf3NH/nzXMw==
X-CSE-MsgGUID: VWMzEejeTSGv+9RUsKhUkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="234517929"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 May 2026 02:48:47 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQMUm-000000002An-1uiy;
	Fri, 22 May 2026 09:48:44 +0000
Date: Fri, 22 May 2026 17:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 20/65]
 drivers/iommu/riscv/iommu-ir.c:325:13: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605221735.0RNzdr8y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   7087f62c7333ca95c6a5c57f5ba52bd1594f22cf
commit: b94a25c2259625ebc67070995888f7baec7e3203 [20/65] iommu/riscv: Add guest file irqbypass support
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605221735.0RNzdr8y-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221735.0RNzdr8y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221735.0RNzdr8y-lkp@intel.com/

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
