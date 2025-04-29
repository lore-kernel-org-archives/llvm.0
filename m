Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899DA2741C2;
	Tue, 29 Apr 2025 22:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966307; cv=none; b=hUGfsrFiqRNi4G2rWgSdR58Cu4u3bSrmF2yFBwfX9x7foxxy0dL77Yof+i5D9bHeYQT6u2m69XuWtcyLXG8ocQfKPvCgIzHxTG6YkVQMC8wDMBdzMJ1dXtZ7f3CBaQlTsslnf/CbOYO1TXU7yJ9STbVEonMmRPHGg9huQMeM+hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966307; c=relaxed/simple;
	bh=9j0OBpPTy7CNxdm0ZJpE9tcdc4Fsfevskh7TEvuHBAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gxVh62b9Sbzji+YG/d4i9243wHLBeuaLYSCjR4aKlGM9q9WtcOLdLziHtxn/0eYoVoaxI4xASSSAX4H4ljS9mwi1CAoUMz843BuNLWefX5YXj0Pr0x0bMOT8lVa5FALfhKgSqdchy5UOiwMcS93fVybRxqTMwqlBrSd5j1XqlHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhTK47+t; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhTK47+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745966306; x=1777502306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9j0OBpPTy7CNxdm0ZJpE9tcdc4Fsfevskh7TEvuHBAc=;
  b=hhTK47+tWiAs99FfIiakRrxdOI8b/948vAD97ym5zRr5PiWXMNrpulCR
   tyJGkn5PmpLBN8hEeJfHY1ciLV+gw8Ht7KeXborJFxL6X0bgCghRKX9gl
   xrRbCC9n/nekZiF3ftAfC7xb/HKwX704TltJUPcXIFCRu7EJ/FIKjpW6R
   C3RUvRWrV+y18BRndl/x+41fz9uA0a1XomGF+Tx26lFvHndArIIQWd13k
   Fjb+7eT02hB5fQrYDsJlwUvXjP5v1IcOWUnqvvvsR23WQZl8IMS4EFo+x
   LbTJCvWa6dRT5J3xlseiyXWLAqzG96Wi19lRAZhgJzRrzIjoJm1yA+YkF
   A==;
X-CSE-ConnectionGUID: +WRoZEa9RN2YwqGTsrP7hA==
X-CSE-MsgGUID: ylgtVBY2SYa5+RLOYGopzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51427994"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="51427994"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 15:38:23 -0700
X-CSE-ConnectionGUID: HmcNqxyQTMW8M/btigjxDQ==
X-CSE-MsgGUID: dOALC5XtQh+q5bhAJOzfnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="138765459"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 15:38:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9tal-0002zm-2S;
	Tue, 29 Apr 2025 22:38:19 +0000
Date: Wed, 30 Apr 2025 06:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommu_pt 19/22] ld.lld: error: undefined symbol:
 pt_iommu_x86_64_hw_info
Message-ID: <202504300622.6hXIcimG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   c1dec260d8b78443ef82054138c29a8d3d155a74
commit: ee6aae7327cd34c61889435908500dbce710d984 [19/22] iommu/amd: Use the generic iommu page table
config: x86_64-buildonly-randconfig-006-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300622.6hXIcimG-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300622.6hXIcimG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300622.6hXIcimG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pt_iommu_x86_64_hw_info
   >>> referenced by iommu.c:2144 (drivers/iommu/amd/iommu.c:2144)
   >>>               vmlinux.o:(amd_iommu_attach_device)
--
>> ld.lld: error: undefined symbol: pt_iommu_amdv1_hw_info
   >>> referenced by iommu.c:2029 (drivers/iommu/amd/iommu.c:2029)
   >>>               vmlinux.o:(set_dte_entry)
--
>> ld.lld: error: undefined symbol: pt_iommu_x86_64_unmap_pages
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(amdv2_ops)
--
>> ld.lld: error: undefined symbol: pt_iommu_amdv1_init
   >>> referenced by iommu.c:2608 (drivers/iommu/amd/iommu.c:2608)
   >>>               vmlinux.o:(amd_iommu_domain_alloc_paging_v1)
--
>> ld.lld: error: undefined symbol: pt_iommu_x86_64_init
   >>> referenced by iommu.c:2669 (drivers/iommu/amd/iommu.c:2669)
   >>>               vmlinux.o:(amd_iommu_domain_alloc_paging_v2)
--
>> ld.lld: error: undefined symbol: pt_iommu_amdv1_read_and_clear_dirty
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(amdv1_dirty_ops)
--
>> ld.lld: error: undefined symbol: pt_iommu_amdv1_map_pages
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(amdv1_ops)
--
>> ld.lld: error: undefined symbol: pt_iommu_amdv1_iova_to_phys
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(amdv1_ops)
--
>> ld.lld: error: undefined symbol: pt_iommu_amdv1_unmap_pages
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(amdv1_ops)
--
>> ld.lld: error: undefined symbol: pt_iommu_x86_64_map_pages
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(amdv2_ops)
--
>> ld.lld: error: undefined symbol: pt_iommu_x86_64_iova_to_phys
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(amdv2_ops)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_PT_AMDV1
   Depends on [n]: GENERIC_PT [=n] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]
   WARNING: unmet direct dependencies detected for IOMMU_PT_X86_64
   Depends on [n]: GENERIC_PT [=n] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
