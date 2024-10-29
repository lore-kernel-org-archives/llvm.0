Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C27F205145;
	Tue, 29 Oct 2024 18:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730228066; cv=none; b=cTUHnqxP5eoyWGlmjItx3cDTdddpTvzEp0GjRBziIu4v8RHmBCxGBLvVVyTywcLVf3wiLcwwupaVQ7akmkJeJ8N+OFLgpNyx9QindtWEYA+TPfMU3NQK2+Q7WTxAhmF6hsYhUhK9C+qZgFAc8idTqUk3PximD6b7TPoLxy9bF64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730228066; c=relaxed/simple;
	bh=fgvge7uuCg4mpfWSgPVB9zbMkx0riSOsc1TEvBsEePw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q+4RNjrO/0lQtY409giIklma9CijxOaqUnYykGFcQmy/HxT0rLny3/woqbd/xDDz/egNYPFsGGMO1b7jBwV4t74k040FO88hezjOqBfpRefmsnmHHDI4f1ZFsD7UQBR9VtN8nuePuREj1ne1zYBgTWkE4rrT+bjg+3B+XO2nQDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exLB7qVq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exLB7qVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730228064; x=1761764064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fgvge7uuCg4mpfWSgPVB9zbMkx0riSOsc1TEvBsEePw=;
  b=exLB7qVq8tVaZJlSYHtLZoOi6FKoxPKbuvcSc7yjSLfK6Az5EQSakWev
   hVQQ4XuB0RR4f6Z1N2XthBowC/yE3NzmdmRy6d+jQfC0M8tsswEPpbV1j
   ZH5fV+kZ0H82ZkhqH9/WzCX3G/kPWnJH30gmmEvqqhFzuqSr1RTro8aLG
   WTOPkq/bo9igrKJG9miAoVocqd54/sZGG8kyU4lwbPUNf4Cu7EoRbwjEe
   Yj5XCWij2nA5QQ3X15sIGOdYWF/3tecnXc9MR15ThfQOyOLcm6tc5HOrH
   h54jroGvKg/Vxv0uNIL/uBj8JkwpB7PR2PS1Ac7GyoO0Gl2K2kJUtqe/0
   g==;
X-CSE-ConnectionGUID: qLeaH5TtTcyacvBX2Qe1oQ==
X-CSE-MsgGUID: CR+iV0npSOiB/kogA2wrBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29319381"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="29319381"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 11:54:24 -0700
X-CSE-ConnectionGUID: CuVUtOgJQpClkGmx7WOydg==
X-CSE-MsgGUID: C2+Yx2niTsi96Ubo/+gfSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82383931"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2024 11:54:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5rMB-000e16-2Z;
	Tue, 29 Oct 2024 18:54:19 +0000
Date: Wed, 30 Oct 2024 02:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Joerg Roedel <jroedel@suse.de>, Vasant Hegde <vasant.hegde@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [iommu:core 10/22] ld.lld: error: duplicate symbol:
 iommu_paging_domain_alloc_flags
Message-ID: <202410300255.fmW8K0rj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
head:   a33bf8d8ce7e06bf0f033865b0cea5887cd2ac8c
commit: 20858d4ebb423826b7a978d54cde195f51d87e20 [10/22] iommu: Introduce iommu_paging_domain_alloc_flags()
config: arm-footbridge_defconfig (https://download.01.org/0day-ci/archive/20241030/202410300255.fmW8K0rj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300255.fmW8K0rj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300255.fmW8K0rj-lkp@intel.com/

Note: the iommu/core HEAD a33bf8d8ce7e06bf0f033865b0cea5887cd2ac8c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: iommu_paging_domain_alloc_flags
   >>> defined at dma-mapping.c
   >>>            arch/arm/mm/dma-mapping.o:(iommu_paging_domain_alloc_flags) in archive vmlinux.a
   >>> defined at platform.c
   >>>            drivers/base/platform.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: iommu_paging_domain_alloc_flags
   >>> defined at dma-mapping.c
   >>>            arch/arm/mm/dma-mapping.o:(iommu_paging_domain_alloc_flags) in archive vmlinux.a
   >>> defined at pci-driver.c
   >>>            drivers/pci/pci-driver.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: iommu_paging_domain_alloc_flags
   >>> defined at dma-mapping.c
   >>>            arch/arm/mm/dma-mapping.o:(iommu_paging_domain_alloc_flags) in archive vmlinux.a
   >>> defined at init-mm.c
   >>>            mm/init-mm.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: iommu_paging_domain_alloc_flags
   >>> defined at dma-mapping.c
   >>>            arch/arm/mm/dma-mapping.o:(iommu_paging_domain_alloc_flags) in archive vmlinux.a
   >>> defined at fork.c
   >>>            kernel/fork.o:(.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
