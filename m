Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52AE3FE675;
	Thu, 30 Apr 2026 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544239; cv=none; b=lHhG+uHSPZ9pFXKsr6Af2H26508ZN/ih51xgZFCx1B3wS3yLDtgnbq5TCXe0Eux3tltGUXhTOg1NFjCPywML5EF2B3UFCKGzm4yxcciooFxu/B4S1kmi1Y7dfLYkDY5kQMJuEggHMTb2C9iukR3hs8zE9coXGMO8uNybcYXWlI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544239; c=relaxed/simple;
	bh=bHdIH3H7gqChhcfHZmcW3gbKNfk0TvOzAR1C+Bmd0zo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PxxJWHEJ4b1dmiqjtGc0SIhio1EvjKPXTsbaNDcuQGe+ZaQYrwCUDoJoi2zBPtlW4Nm3xM3JqXgINsti7e7G35eDlQNjTi2pjGCERPWxIngCbbLg5ax1kgo6dQs85RaLySh4oopiWTe54UooDNpfs75HjdDsT0eAWunKf3omw00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQPoV8mA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQPoV8mA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777544238; x=1809080238;
  h=date:from:to:cc:subject:message-id;
  bh=bHdIH3H7gqChhcfHZmcW3gbKNfk0TvOzAR1C+Bmd0zo=;
  b=AQPoV8mAExUuLjvVaqH2Dm9LSv7SRhpDlA19UOk0m4kW11aUDfIxGL+M
   c2Z/T0HA7lym8Z86tBro26+ec36ZMSBOYZFTxH4BgiLJvN5KOfKhe99va
   dGiwEJoPgZzh99ok8B5pan7kt6ALaboQYaPVVUZ0MTSJu/MKqkXylSRy8
   vf097Q800aRFTncBNxT1B7e5fwFh+jQllKQC3i7meRX88rx4ftuyCrtTT
   Wwx0atT7jSaISHmP43hioomdhDzC6ZFm5eyisx9SV7AC3EiPItM0nOEgE
   si7eQf6vTr7wyWiwhI22IyQUeGGBCnQ0EumQslEIg+w00Xd2whXJ7xQwD
   A==;
X-CSE-ConnectionGUID: EvLSSp8sQb2C9b7SywswmQ==
X-CSE-MsgGUID: bbfdQXynTt+zSu4UsOXTsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82355683"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82355683"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 03:17:17 -0700
X-CSE-ConnectionGUID: SYW6ftjYQJS33jhIzCS3tg==
X-CSE-MsgGUID: JwrIvCLGQzqKLtJIgRM7EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="230192797"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Apr 2026 03:17:14 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIOSF-00000000CHA-1RWM;
	Thu, 30 Apr 2026 10:17:11 +0000
Date: Thu, 30 Apr 2026 18:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: Zong Li <zong.li@sifive.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 Nutty Liu <nutty.liu@hotmail.com>
Subject: [avpatel:riscv_iommu_irqbypass_v2 4/18]
 drivers/iommu/riscv/iommu.c:1198:39: error: call to undeclared function
 'virt_to_pfn'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202604301838.BsgW9ygi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_iommu_irqbypass_v2
head:   0ba166d111b762ae8f37075ba1266e345ae5ef59
commit: 495fff405c515405e7c816985699bc45338d297d [4/18] iommu/riscv: Use data structure instead of individual values
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260430/202604301838.BsgW9ygi-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301838.BsgW9ygi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301838.BsgW9ygi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu.c:18:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:20:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   drivers/iommu/riscv/iommu.c:1197:55: error: no member named 'pgd_mode' in 'struct riscv_iommu_domain'
    1197 |         dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                                                      ~~~~~~  ^
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
   drivers/iommu/riscv/iommu.c:1197:55: error: no member named 'pgd_mode' in 'struct riscv_iommu_domain'
    1197 |         dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                                                      ~~~~~~  ^
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
   drivers/iommu/riscv/iommu.c:1197:55: error: no member named 'pgd_mode' in 'struct riscv_iommu_domain'
    1197 |         dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
         |                                                      ~~~~~~  ^
   include/linux/bitfield.h:138:23: note: expanded from macro 'FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                                     ^~~~
   include/linux/bitfield.h:92:19: note: expanded from macro '__FIELD_PREP'
      92 |                 ((typeof(mask))(val) << __bf_shf(mask)) & (mask);       \
         |                                 ^~~
>> drivers/iommu/riscv/iommu.c:1198:39: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1198 |                  FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
         |                                                     ^
   drivers/iommu/riscv/iommu.c:1198:39: note: did you mean 'virt_to_pte'?
   arch/um/include/asm/pgtable.h:284:15: note: 'virt_to_pte' declared here
     284 | extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
         |               ^
   drivers/iommu/riscv/iommu.c:1198:59: error: no member named 'pgd_root' in 'struct riscv_iommu_domain'
    1198 |                  FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
         |                                                                 ~~~~~~  ^
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
   drivers/iommu/riscv/iommu.c:1198:59: error: no member named 'pgd_root' in 'struct riscv_iommu_domain'
    1198 |                  FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
         |                                                                 ~~~~~~  ^
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
>> drivers/iommu/riscv/iommu.c:1198:39: error: call to undeclared function 'virt_to_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1198 |                  FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
         |                                                     ^
   drivers/iommu/riscv/iommu.c:1198:59: error: no member named 'pgd_root' in 'struct riscv_iommu_domain'
    1198 |                  FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
         |                                                                 ~~~~~~  ^
   include/linux/bitfield.h:138:23: note: expanded from macro 'FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                                     ^~~~
   include/linux/bitfield.h:92:19: note: expanded from macro '__FIELD_PREP'
      92 |                 ((typeof(mask))(val) << __bf_shf(mask)) & (mask);       \
         |                                 ^~~
   1 warning and 8 errors generated.


vim +/virt_to_pfn +1198 drivers/iommu/riscv/iommu.c

  1181	
  1182	static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
  1183						    struct device *dev,
  1184						    struct iommu_domain *old)
  1185	{
  1186		struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
  1187		struct riscv_iommu_device *iommu = dev_to_iommu(dev);
  1188		struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
  1189		struct pt_iommu_riscv_64_hw_info pt_info;
  1190		struct riscv_iommu_dc dc = {0};
  1191	
  1192		pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
  1193	
  1194		if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
  1195			return -ENODEV;
  1196	
  1197		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
> 1198			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
  1199		dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
  1200				   RISCV_IOMMU_PC_TA_V;
  1201	
  1202		if (riscv_iommu_bond_link(domain, dev))
  1203			return -ENOMEM;
  1204	
  1205		riscv_iommu_iodir_update(iommu, dev, &dc);
  1206		riscv_iommu_bond_unlink(info->domain, dev);
  1207		info->domain = domain;
  1208	
  1209		return 0;
  1210	}
  1211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
