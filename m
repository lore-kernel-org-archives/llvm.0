Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A42D14D70E;
	Fri, 28 Mar 2025 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743180878; cv=none; b=ei+aH+BqiXKB0nLM6zhrOhzOcgLOLuA0sg3GKaW3RUiqo4QwCMJBY1vsP2HwgnwbW0AkpoWILHSHIgotZOap5k9Jtlei8FqNuW99QhMW25b8LDpuKargmMxUcWcB4DcFLmE7ot8kIsEDv1CWIIpRjl8BsJY9UmqbxfZTiJfCD5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743180878; c=relaxed/simple;
	bh=qXaW0Zadz4blAQX7mFXbHyYMTPkoMtEdHjKgemnjRX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nmvkgmwc2kVIpUrw6V7rk2Xaro5IaBZ/f/WbYyMZi8OBbJpRI4UewDAf8t0eeGoSvuLIOkNE6GO9i15BgsYG41XkP/UFi1PnoE541pOQmud+BDz0JzNOV/GIJ3M75oRTracu4mi1hMU+hPIXBVrqLCKMifEvzbvEbZzvOQDL7rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQdHm+Fu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQdHm+Fu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743180876; x=1774716876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qXaW0Zadz4blAQX7mFXbHyYMTPkoMtEdHjKgemnjRX0=;
  b=JQdHm+Fu1uMM6wWn39eZUPJBNr2U8zcnZQX6rsqPFSw2Dr3kum+LXV7V
   HMdUPPuR/1rRFrHVq7kG+fgjd/W1qK28OHt87JjmKlIb7FiHnm+xGxIDX
   31+yzRc16scwrdzhT7t2BOiWxmWRsW16045CHNdirMOZ89wKQ8m3mqrd6
   aa3FoI8wA0lSDzHBC/lttEiUHkCHLtM3uo5g+rNTgKEFCw7/E+KnaI/Ke
   ZDuq8QGeoajHU/8l/0zO4rQDBVJxZCzJZV1LekqD9OkhJ8JrL/Bfq1fI0
   eZY+MyNxa5aJIG6lcSjVfxhZKvFgei9Pp4MMT5e3/69U7AxLPtKJb8G6H
   g==;
X-CSE-ConnectionGUID: fVuSr/kOSbaMd0+hCoFRGw==
X-CSE-MsgGUID: +tnVkNvmTJqb4e6Oyv4XjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44463651"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44463651"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 09:54:35 -0700
X-CSE-ConnectionGUID: wQYS+dyWRh+omzm0x3PPXQ==
X-CSE-MsgGUID: 5VM/2BchRHG3LBJHcCVYDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125720466"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Mar 2025 09:54:34 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyCyL-0007b0-2x;
	Fri, 28 Mar 2025 16:54:24 +0000
Date: Sat, 29 Mar 2025 00:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13920/14010] arch/riscv/mm/tlbflush.c:195:16:
 error: redefinition of 'start'
Message-ID: <202503290040.CiWtsZNi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e21edb1638e82460f126a6e49bcdd958d452929c
commit: 5744739d8ce78876d4b62a20fd6bc65f01ba142e [13920/14010] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
config: riscv-randconfig-002-20250328 (https://download.01.org/0day-ci/archive/20250329/202503290040.CiWtsZNi-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290040.CiWtsZNi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290040.CiWtsZNi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/mm/tlbflush.c:195:16: error: redefinition of 'start'
     195 |         unsigned long start = uaddr & PAGE_MASK;
         |                       ^
   arch/riscv/mm/tlbflush.c:193:39: note: previous definition is here
     193 |                 struct mm_struct *mm, unsigned long start, unsigned long end)
         |                                                     ^
>> arch/riscv/mm/tlbflush.c:195:24: error: use of undeclared identifier 'uaddr'
     195 |         unsigned long start = uaddr & PAGE_MASK;
         |                               ^
   2 errors generated.


vim +/start +195 arch/riscv/mm/tlbflush.c

54d7431af73e2f Alexandre Ghiti 2024-01-08  191  
54d7431af73e2f Alexandre Ghiti 2024-01-08  192  void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
2f4ab3ac10e147 Barry Song      2025-02-14  193  		struct mm_struct *mm, unsigned long start, unsigned long end)
54d7431af73e2f Alexandre Ghiti 2024-01-08  194  {
d9be2b9b60497a Alexandre Ghiti 2025-01-13 @195  	unsigned long start = uaddr & PAGE_MASK;
d9be2b9b60497a Alexandre Ghiti 2025-01-13  196  
54d7431af73e2f Alexandre Ghiti 2024-01-08  197  	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
d9be2b9b60497a Alexandre Ghiti 2025-01-13  198  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, start + PAGE_SIZE);
54d7431af73e2f Alexandre Ghiti 2024-01-08  199  }
54d7431af73e2f Alexandre Ghiti 2024-01-08  200  

:::::: The code at line 195 was first introduced by commit
:::::: d9be2b9b60497a82aeceec3a98d8b37fdd2960f2 riscv: Call secondary mmu notifier when flushing the tlb

:::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
:::::: CC: Alexandre Ghiti <alexghiti@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
