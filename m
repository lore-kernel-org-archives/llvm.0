Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2041E25F9;
	Thu, 30 Apr 2026 13:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557154; cv=none; b=t2XTf+hCcC6iAOwv0kxWoKwum0VXgObc/iCngh3On9B1GQjd1y2mQYbmlNoA2Ov64LKQ/AK5ik93HEAmdVH5oaH3CeLMquygbdzxRTf2aSFlXOVmHCgPuJfUrb9oItSnUOY5ZSpv7FB1bhNybW8i6ys4s3epQwGDWn1wQLx1aXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557154; c=relaxed/simple;
	bh=mR6Zv7666oaiDe4jIMRtDeZ/BQ4IxksL1n14u/VLggU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UoiArhBp0flqg+TbKUx6CC1ClXdNN513vmuhnFPjsh0e7XjLy3X/8+/ynL5BlmMYI3YPAEdCWMWguZlRLRqxwbMHIyB15ebZVmgVNjNIFkOtb88Ox0fzQPZ56n7IzXuFT1twAvWsDx1ozGYZp8qqcbiOh7WqdiDEkXH9PNlooyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPGVE98L; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPGVE98L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777557152; x=1809093152;
  h=date:from:to:cc:subject:message-id;
  bh=mR6Zv7666oaiDe4jIMRtDeZ/BQ4IxksL1n14u/VLggU=;
  b=cPGVE98L3I5eXIoY/jI1PD5lnjD4Yq9OBcwc+nCwEzUjevXw9k/xKqD3
   FI8E/QqcoGTivnfAVLiwssDxsu6gXJY25RUxaj66K7HQ86IX3skUL65SX
   EcWJhM3vtaE2E59UFfztnevnMonJ2GL3QY38JDuk3F/6d0kbXSHN8gBWV
   m8lSKXSHsmJb6xiokagV9Q94EDHxwm48Yo/g9SturjV9Bqavp8WDQbKUX
   NIM6zhfnDSuSN/WEnlRgYAIA6nuk5/0nRMPX7jBKZt5y19xt+UBDcOjSJ
   2sjD0Yl3jfM+bcFzN6mnv6domYNo38azOVcu7PSVBRBPfg9ocYiwB3cgW
   Q==;
X-CSE-ConnectionGUID: Cr/3lEIORFSoLaW/6FytPA==
X-CSE-MsgGUID: SmAi0cuIR8ObjWFo8qqGxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="66037296"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="66037296"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:52:31 -0700
X-CSE-ConnectionGUID: +l3xEapkRnugQu7PE0LAzQ==
X-CSE-MsgGUID: N5027/joScW6iUUGzf47PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="231943501"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2026 06:52:29 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIRoY-00000000CQq-3PFJ;
	Thu, 30 Apr 2026 13:52:26 +0000
Date: Thu, 30 Apr 2026 21:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_iommu_irqbypass_v2 13/18]
 drivers/iommu/riscv/iommu-ir.c:185:45: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202604302101.G9YsHRCG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_iommu_irqbypass_v2
head:   0ba166d111b762ae8f37075ba1266e345ae5ef59
commit: e3141898f38de6d63cb78f33d1b1e7bfb00d6e29 [13/18] iommu/riscv: Add guest file irqbypass support
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260430/202604302101.G9YsHRCG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302101.G9YsHRCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302101.G9YsHRCG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu-ir.c:10:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from drivers/iommu/riscv/iommu-ir.c:16:
   drivers/iommu/riscv/iommu.h:30:28: error: field has incomplete type 'struct pt_iommu_riscv_64'
      30 |                 struct pt_iommu_riscv_64 riscvpt;
         |                                          ^
   drivers/iommu/riscv/iommu.h:30:10: note: forward declaration of 'struct pt_iommu_riscv_64'
      30 |                 struct pt_iommu_riscv_64 riscvpt;
         |                        ^
   drivers/iommu/riscv/iommu-ir.c:48:34: error: no member named 'domain' in 'struct riscv_iommu_domain'
      48 |                                 int ret = iommu_map(&domain->domain, addr, addr, map_size,
         |                                                      ~~~~~~  ^
   drivers/iommu/riscv/iommu-ir.c:53:39: error: no member named 'domain' in 'struct riscv_iommu_domain'
      53 |                                 *unmapped += iommu_unmap(&domain->domain, addr, map_size);
         |                                                           ~~~~~~  ^
   drivers/iommu/riscv/iommu-ir.c:184:54: error: no member named 'pgd_mode' in 'struct riscv_iommu_domain'
     184 |                 .fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                                                            ~~~~~~  ^
   include/linux/bitfield.h:138:23: note: expanded from macro 'FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                                     ^~~~
   include/linux/bitfield.h:91:31: note: expanded from macro '__FIELD_PREP'
      91 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                                             ^~~
   include/linux/bitfield.h:70:41: note: expanded from macro '__BF_FIELD_CHECK_MASK'
      70 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                                                       ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:184:54: error: no member named 'pgd_mode' in 'struct riscv_iommu_domain'
     184 |                 .fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                                                            ~~~~~~  ^
   include/linux/bitfield.h:138:23: note: expanded from macro 'FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                                     ^~~~
   include/linux/bitfield.h:91:31: note: expanded from macro '__FIELD_PREP'
      91 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                                             ^~~
   include/linux/bitfield.h:72:12: note: expanded from macro '__BF_FIELD_CHECK_MASK'
      72 |                                         (0 + (_val)) : 0,               \
         |                                               ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:184:54: error: no member named 'pgd_mode' in 'struct riscv_iommu_domain'
     184 |                 .fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                                                            ~~~~~~  ^
   include/linux/bitfield.h:138:23: note: expanded from macro 'FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                                     ^~~~
   include/linux/bitfield.h:92:19: note: expanded from macro '__FIELD_PREP'
      92 |                 ((typeof(mask))(val) << __bf_shf(mask)) & (mask);       \
         |                                 ^~~
>> drivers/iommu/riscv/iommu-ir.c:185:45: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     185 |                        FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
         |                                                           ^
   drivers/iommu/riscv/iommu-ir.c:185:45: note: did you mean 'virt_to_pte'?
   arch/um/include/asm/pgtable.h:284:15: note: 'virt_to_pte' declared here
     284 | extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
         |               ^
   drivers/iommu/riscv/iommu-ir.c:185:65: error: no member named 'pgd_root' in 'struct riscv_iommu_domain'
     185 |                        FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
         |                                                                       ~~~~~~  ^
   include/linux/bitfield.h:138:23: note: expanded from macro 'FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                                     ^~~~
   include/linux/bitfield.h:91:31: note: expanded from macro '__FIELD_PREP'
      91 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                                             ^~~
   include/linux/bitfield.h:70:41: note: expanded from macro '__BF_FIELD_CHECK_MASK'
      70 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                                                       ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/iommu/riscv/iommu-ir.c:185:65: error: no member named 'pgd_root' in 'struct riscv_iommu_domain'
     185 |                        FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
         |                                                                       ~~~~~~  ^
   include/linux/bitfield.h:138:23: note: expanded from macro 'FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                                     ^~~~
   include/linux/bitfield.h:91:31: note: expanded from macro '__FIELD_PREP'
      91 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                                             ^~~
   include/linux/bitfield.h:72:12: note: expanded from macro '__BF_FIELD_CHECK_MASK'
      72 |                                         (0 + (_val)) : 0,               \
         |                                               ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/iommu/riscv/iommu-ir.c:185:45: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     185 |                        FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
         |                                                           ^
   drivers/iommu/riscv/iommu-ir.c:185:65: error: no member named 'pgd_root' in 'struct riscv_iommu_domain'
     185 |                        FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
         |                                                                       ~~~~~~  ^
   include/linux/bitfield.h:138:23: note: expanded from macro 'FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                                     ^~~~
   include/linux/bitfield.h:92:19: note: expanded from macro '__FIELD_PREP'
      92 |                 ((typeof(mask))(val) << __bf_shf(mask)) & (mask);       \
         |                                 ^~~
   drivers/iommu/riscv/iommu-ir.c:186:13: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     186 |                 .msiptp = virt_to_pfn(domain->msi_root) |
         |                           ^
   drivers/iommu/riscv/iommu-ir.c:327:18: warning: declaration of 'struct riscv_iommu_ir_vcpu_info' will not be visible outside of this function [-Wvisibility]
     327 |                                              struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                     ^
   drivers/iommu/riscv/iommu-ir.c:329:43: error: incomplete definition of type 'struct riscv_iommu_ir_vcpu_info'
     329 |         return domain->msi_addr_mask == vcpu_info->msi_addr_mask &&
         |                                         ~~~~~~~~~^
   drivers/iommu/riscv/iommu-ir.c:327:18: note: forward declaration of 'struct riscv_iommu_ir_vcpu_info'
     327 |                                              struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                     ^
   drivers/iommu/riscv/iommu-ir.c:330:46: error: incomplete definition of type 'struct riscv_iommu_ir_vcpu_info'
     330 |                domain->msi_addr_pattern == vcpu_info->msi_addr_pattern &&
         |                                            ~~~~~~~~~^
   drivers/iommu/riscv/iommu-ir.c:327:18: note: forward declaration of 'struct riscv_iommu_ir_vcpu_info'
     327 |                                              struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                     ^
   drivers/iommu/riscv/iommu-ir.c:331:46: error: incomplete definition of type 'struct riscv_iommu_ir_vcpu_info'
     331 |                domain->group_index_bits == vcpu_info->group_index_bits &&
         |                                            ~~~~~~~~~^
   drivers/iommu/riscv/iommu-ir.c:327:18: note: forward declaration of 'struct riscv_iommu_ir_vcpu_info'
     327 |                                              struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                     ^
   drivers/iommu/riscv/iommu-ir.c:332:47: error: incomplete definition of type 'struct riscv_iommu_ir_vcpu_info'
     332 |                domain->group_index_shift == vcpu_info->group_index_shift;
         |                                             ~~~~~~~~~^
   drivers/iommu/riscv/iommu-ir.c:327:18: note: forward declaration of 'struct riscv_iommu_ir_vcpu_info'
     327 |                                              struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                     ^
   drivers/iommu/riscv/iommu-ir.c:337:15: warning: declaration of 'struct riscv_iommu_ir_vcpu_info' will not be visible outside of this function [-Wvisibility]
     337 |                                           struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                  ^
   drivers/iommu/riscv/iommu-ir.c:343:14: error: no member named 'pgd_mode' in 'struct riscv_iommu_domain'
     343 |         if (domain->pgd_mode)
         |             ~~~~~~  ^
   drivers/iommu/riscv/iommu-ir.c:348:35: error: incomplete definition of type 'struct riscv_iommu_ir_vcpu_info'
     348 |         domain->msi_addr_mask = vcpu_info->msi_addr_mask;
         |                                 ~~~~~~~~~^
   drivers/iommu/riscv/iommu-ir.c:337:15: note: forward declaration of 'struct riscv_iommu_ir_vcpu_info'
     337 |                                           struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                  ^
   drivers/iommu/riscv/iommu-ir.c:349:38: error: incomplete definition of type 'struct riscv_iommu_ir_vcpu_info'
     349 |         domain->msi_addr_pattern = vcpu_info->msi_addr_pattern;
         |                                    ~~~~~~~~~^
   drivers/iommu/riscv/iommu-ir.c:337:15: note: forward declaration of 'struct riscv_iommu_ir_vcpu_info'
     337 |                                           struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   3 warnings and 20 errors generated.


vim +/virt_to_pfn +185 drivers/iommu/riscv/iommu-ir.c

   176	
   177	static void riscv_iommu_ir_msiptp_update(struct riscv_iommu_domain *domain)
   178	{
   179		struct riscv_iommu_bond *bond;
   180		struct riscv_iommu_device *iommu, *prev;
   181		struct riscv_iommu_dc new_dc = {
   182			.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
   183			      RISCV_IOMMU_PC_TA_V,
 > 184			.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
 > 185			       FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
   186			.msiptp = virt_to_pfn(domain->msi_root) |
   187				  FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
   188					     RISCV_IOMMU_DC_MSIPTP_MODE_FLAT),
   189			.msi_addr_mask = domain->msi_addr_mask,
   190			.msi_addr_pattern = domain->msi_addr_pattern,
   191		};
   192	
   193		/* Like riscv_iommu_ir_msitbl_inval(), synchronize with riscv_iommu_bond_link() */
   194		smp_mb();
   195	
   196		rcu_read_lock();
   197	
   198		prev = NULL;
   199		list_for_each_entry_rcu(bond, &domain->bonds, list) {
   200			iommu = dev_to_iommu(bond->dev);
   201			if (iommu == prev)
   202				continue;
   203	
   204			riscv_iommu_iodir_update(iommu, bond->dev, &new_dc);
   205			prev = iommu;
   206		}
   207	
   208		rcu_read_unlock();
   209	}
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
