Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9384433ADB5;
	Wed, 29 Apr 2026 22:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777503248; cv=none; b=j2nXmivWDqhxfVdIIpMOXFmZy4JWb0kQ2yBn0XTeqM6OJ+loJIFEGP0rgikIL3rlDRQ7u1Lw2G1hcYFdnetIisa3PaQRpFMA3mAVcssWuWFzxDtil5apJA4TWVrs6C8XX++OMK3gqNSwnEt0yr/L4M2uXMMPj1yDCRoklquHtNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777503248; c=relaxed/simple;
	bh=ell6//xIfMALrwSKC6fsfCJr4oVTZ90yXwRnTtVzp+k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UOg5lG0vOptamtbMMrwFSiCnwR0iZLnR8mOPx3cOvggMa7cDQIWPapmeMggXnd1VZxnjpitcSgFdmAMSjOUDBR9M9/vCmY9gzYv7O6O6DHgjyuzYWAE4ANpuBumWQmw4taOIlKQsJMnSczRq/16G/aKBsuFmEe/6/J4krZeRXG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtlL1AcG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtlL1AcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777503247; x=1809039247;
  h=date:from:to:cc:subject:message-id;
  bh=ell6//xIfMALrwSKC6fsfCJr4oVTZ90yXwRnTtVzp+k=;
  b=OtlL1AcG849c1fXi/7fSo0SVQOEx7nK4kllrsKzowa94AwiNJov3mFN2
   Q5sudz8+2r1mzvJi0pVow9vMgWiQVsLwYBKDEQEl/HTJwNT5qC/e7/vGd
   rc7jcEeTg17KAES8KU8fiW+0Hu3lYBWZ1BKRfBm8EWvE4X3kNJzv8dNa3
   jC4XtJpeUXYPTV+/uJKmIPvpUzxzPYdUHjpcKBbUctMPb5A2OPLOqWoOA
   SsM4sj7arpl708LQ+mbszQwQz0qu4A1vccNo1yodeuk7zRo/b9KrEenxo
   ZClqHim7fJhFk54OaVqNIGbaDGonZUXMF2db5GTwQx6lo3BrkFwAG9opc
   g==;
X-CSE-ConnectionGUID: /1+NPRr9S1+0hIYWeO2n3g==
X-CSE-MsgGUID: cCM5uFOvRPayAWYszfDh9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82301523"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82301523"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 15:54:06 -0700
X-CSE-ConnectionGUID: zcAphlDQTFCXZCqPt3/n/w==
X-CSE-MsgGUID: gmXVp39FRP+2ciOLQhqeug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="238378690"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2026 15:54:04 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIDn7-00000000Bc8-1y8a;
	Wed, 29 Apr 2026 22:54:01 +0000
Date: Thu, 30 Apr 2026 06:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_iommu_irqbypass_v2 13/18]
 drivers/iommu/riscv/iommu-ir.c:329:43: error: incomplete definition of type
 'struct riscv_iommu_ir_vcpu_info'
Message-ID: <202604300653.EYPGPUlR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_iommu_irqbypass_v2
head:   0ba166d111b762ae8f37075ba1266e345ae5ef59
commit: e3141898f38de6d63cb78f33d1b1e7bfb00d6e29 [13/18] iommu/riscv: Add guest file irqbypass support
config: powerpc64-randconfig-002-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300653.EYPGPUlR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300653.EYPGPUlR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300653.EYPGPUlR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
   drivers/iommu/riscv/iommu-ir.c:185:65: error: no member named 'pgd_root' in 'struct riscv_iommu_domain'
     185 |                        FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root)),
         |                                                                       ~~~~~~  ^
   include/linux/bitfield.h:138:23: note: expanded from macro 'FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                                     ^~~~
   include/linux/bitfield.h:92:19: note: expanded from macro '__FIELD_PREP'
      92 |                 ((typeof(mask))(val) << __bf_shf(mask)) & (mask);       \
         |                                 ^~~
>> drivers/iommu/riscv/iommu-ir.c:327:18: warning: declaration of 'struct riscv_iommu_ir_vcpu_info' will not be visible outside of this function [-Wvisibility]
     327 |                                              struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                     ^
>> drivers/iommu/riscv/iommu-ir.c:329:43: error: incomplete definition of type 'struct riscv_iommu_ir_vcpu_info'
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
   drivers/iommu/riscv/iommu-ir.c:350:38: error: incomplete definition of type 'struct riscv_iommu_ir_vcpu_info'
     350 |         domain->group_index_bits = vcpu_info->group_index_bits;
         |                                    ~~~~~~~~~^
   drivers/iommu/riscv/iommu-ir.c:337:15: note: forward declaration of 'struct riscv_iommu_ir_vcpu_info'
     337 |                                           struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                  ^
   drivers/iommu/riscv/iommu-ir.c:351:39: error: incomplete definition of type 'struct riscv_iommu_ir_vcpu_info'
     351 |         domain->group_index_shift = vcpu_info->group_index_shift;
         |                                     ~~~~~~~~~^
   drivers/iommu/riscv/iommu-ir.c:337:15: note: forward declaration of 'struct riscv_iommu_ir_vcpu_info'
     337 |                                           struct riscv_iommu_ir_vcpu_info *vcpu_info)
         |                                                  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   2 warnings and 20 errors generated.


vim +329 drivers/iommu/riscv/iommu-ir.c

   325	
   326	static bool riscv_iommu_ir_vcpu_check_config(struct riscv_iommu_domain *domain,
 > 327						     struct riscv_iommu_ir_vcpu_info *vcpu_info)
   328	{
 > 329		return domain->msi_addr_mask == vcpu_info->msi_addr_mask &&
   330		       domain->msi_addr_pattern == vcpu_info->msi_addr_pattern &&
   331		       domain->group_index_bits == vcpu_info->group_index_bits &&
   332		       domain->group_index_shift == vcpu_info->group_index_shift;
   333	}
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
