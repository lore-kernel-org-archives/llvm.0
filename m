Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483B1392C3D;
	Wed, 13 May 2026 23:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714926; cv=none; b=s1ZoFUtfJznadwvadGnB1JA79PuTVaRSyLxixnCkIFJ3UqgT4ZAZS45uLBZtooca1nG55Td5EmU5q/08cMNrnrhQqoEPeyGvSmNP+mnA89D9LuT2PFJH21Q+x5oCAqdsj4Tw2wcp7DB/iOnUiNL58D4GMP+NyGv5Ca44af01r3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714926; c=relaxed/simple;
	bh=VGgEMB5EKIsNc5CWmjGUhX9BKS0ky0V5gshwODGwgD8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XTWqmjO04vRarE0hET82fj5fRv41Q1rEH+xE7xUZpZt3oPJP+ej1slD0zwCXILC6rZLYgjPcswpjccfVZ9CEH3cuw1th08vo1XtAv4YKnc4v1H4o6G0noYYc99XVoIt8ivgxy/DO9WYmwMyhqD1oN8G5eMVmMY2k5WEgf6hxHEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hj7W/CgY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hj7W/CgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778714925; x=1810250925;
  h=date:from:to:cc:subject:message-id;
  bh=VGgEMB5EKIsNc5CWmjGUhX9BKS0ky0V5gshwODGwgD8=;
  b=Hj7W/CgYmS6hlirBnDaUIKx1uTPw65WpT+UkH4Sd+L6zoyBF5WlEwVTC
   2yZqqWMhFzHS8rdxfllf3w0HtQtdjCSwPCxqXUnjCOeLNSpSbc91G+QSo
   FrPFGy3hoHxSocQpPSSy3S4qsGjPYTkbzY8t1M9pMXDCAdXckJsuwdlXa
   +Ls3zNEBx6YekolgPVzRkemfV6fuVJVthx+ZVLBlIy9WbnV0hCgT0vta6
   I27+TPb6AonauDdMlt7NehrqxMhtZa9cZJzY1MIxfe5lb+6KUaFhgmcHZ
   PQNn94+zk2DTNSNZInV6vjPwXOCBYs6OT9T4LnxiEwIXRJKqdQ0VEl/D2
   w==;
X-CSE-ConnectionGUID: hM4q1gUIRN+ijSbEZGDmrw==
X-CSE-MsgGUID: pMEbsT1STv6/kk7ZsOpvNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79367561"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79367561"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 16:28:43 -0700
X-CSE-ConnectionGUID: LkEVrQh7QjqeN9dDdPHTkQ==
X-CSE-MsgGUID: zzWylNItRmOFJftSff9gsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="276315694"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2026 16:28:42 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNJ0J-000000005IH-0QMy;
	Wed, 13 May 2026 23:28:39 +0000
Date: Thu, 14 May 2026 07:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 15/60]
 drivers/iommu/riscv/iommu-ir.c:325:13: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605140751.7BaPMVNq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   893faf8dbff9fe0958fb1f32b778914af0fa1b45
commit: 3a2ee01e59297777c99794a5887e5e1109bbbf27 [15/60] iommu/riscv: Add guest file irqbypass support
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260514/202605140751.7BaPMVNq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140751.7BaPMVNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140751.7BaPMVNq-lkp@intel.com/

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
