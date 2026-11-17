Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916904;
	b=2i7scc9K15bKW6DupF9AnWNX1yybflIh1yyUmuIIZks8Qrgc6VwJZ21Igtm0cfpcQ/PC
	 V79QEIgUkuGuxok3QXjKYi7ockY0o/0lW6FLe3yQotOoXd9bg0aTBAkPKNCzw5IwWcADW
	 RiwpJY8+AA3dmwJ5ZMd2PZOcOW4KGQUOK5BY5jLLffe2WhOKpFORmzmn+MkrKIkGIMmXM
	 /cJ1GBXCxvSyRsPzbIktjC/WgYO/s91AaQxqg6tQaXEgqTgsHB7kxHkt6clKwcDZ/c7J4
	 R7Ec+IFuhn+GfvDYNkMQjfR7ZqVvHA9NrHjKpdJT5yjK92xxYaR8f90GfJSslm4u52Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916904;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=u3RcO+0pvZk44VtJ1yM82hvayEdX/cxZmHc7ECjXG/Y=;
	b=PCw/R4pjNYpS8k8ro/n5SJ0c/7/MgG2NNhlSR6LFln6ThPlRd0l/296YTBGoaLtB6dBf
	 Oz9S2DlCUwcx/pnZ2gRgYotP6pIGe0HsXaViwuGIaRl3IGBa4GpGN6odDoz2VWx9E7f2o
	 2IjQU1gJnzW7l1gxFTw81Fs6UZzNOzuHy7mAgKM5DWjx1DnxYMa5S4mH5uPmNKjdVww9C
	 HlxCBRBKeToozm9SJwqQ8/0/SifnVHHnVkdL+lv4+A7cozfFrbE9vckMKeOEwkr4P2OYX
	 mVeZOf7KMmayIIju0Hv4UVz8EMdgyP89HVkkUfJXB5QC4cqstIwhhpeOK07HxH6Iq3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g1u8XyDD;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5E9606A31C;
	Tue, 17 Nov 2026 12:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC5E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g1u8XyDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794916904; x=1826452904;
  h=date:from:to:cc:subject:message-id;
  bh=gj+qpNf1yH/R9r+Xc9pfjmZNLPo5w6HpmJhSTz8esw0=;
  b=g1u8XyDD40UGtkGKccwptInxdrZmPIo22od+/wwUMQh+rmOQEYa1X7/C
   Sin0BGCu23Bbf8mANYUDYho82xNDrTM/SGXLQOpOK+zyQ91Uxl94Fa2Pf
   KcSIwGPo8ITOjl33PoC68xR4LkTF3nIGDoSXum54RE02zBpB4NjkSBecN
   ttTKjNb0L6Vdx9Rg1QLsZfwi5TmxLYP2M6vLOxEODoK1d25u5wS2HgJcX
   RP35flySzDM4g38UXv6yrdOP9GX6S1E3YaWjckxtgt+SWfvee1SwxJ1oY
   oTEuKAZMctLR6+a37fOwo+Bh/9og01/ZVF1TWUBaiTCaNeH1kDP1UFs25
   Q==;
X-CSE-ConnectionGUID: +uNKgYH6SiSgzyvgT4p9cA==
X-CSE-MsgGUID: /3TAwjZnS0Ov1dsCQnMRog==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3575292"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3575292"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 04:01:43 -0800
X-CSE-ConnectionGUID: 55KJoctbQeOfZJjr46RYsw==
X-CSE-MsgGUID: DNYeiWC0RWCvgYn0ybxjbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9665742"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2026 04:01:42 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTHsZ-00000001BPa-1esO;
	Tue, 17 Nov 2026 12:01:39 +0000
Date: Tue, 17 Nov 2026 20:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 34/89]
 drivers/iommu/riscv/iommu-ir.c:325:13: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202611171945.csZRIh2K-lkp@intel.com>
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
commit: c5446adf22b458b508a4cb31001bcb0e84c87927 [34/89] iommu/riscv: Add guest file irqbypass support
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261117/202611171945.csZRIh2K-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611171945.csZRIh2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611171945.csZRIh2K-lkp@intel.com/

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
