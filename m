Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF381CAA6D;
	Sat,  5 Apr 2025 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743859645; cv=none; b=oRAEEiDQhU5Na8mSXjLj2z83TbJRFKxKUQ8wZdnhRZpCNzjqDDeuams4P+oUXbwXY6pFBhQOHwQEDFDOGYGGoy7KJKmvnMyQJZHRE2zgBGXr+VqN0vYdJxOyeuYdQxpEP6L6Y4l72Kz9wpUTwsnzbeptWw2rJ2c1RbryffN+4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743859645; c=relaxed/simple;
	bh=bwmSzUzijE9HjSXI1UDBlEbEhh9nHZTmo3ZguXrGXd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/RWKzDgnJ9DbahF3NwQ+51hU3Qm5/+wScZe86i9Z7tLipc+8AT69AkwS1wWOQrfMQRfNbWz9el+eJsk9REo/p2aZNPvvKCJbwQijRApyz0/XF9UwMMyEb2AzolUo9eQ4olZCzqBoaMQbkp26r9M7e8AMYsq6pQ2LnZLtbALwio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCkSaU6C; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCkSaU6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743859645; x=1775395645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bwmSzUzijE9HjSXI1UDBlEbEhh9nHZTmo3ZguXrGXd0=;
  b=LCkSaU6CebMBrGvzkmEBPcQr4A2+vcLoBkUSrvzaklj0o3ngqhQq3EpV
   sT6+pr2MPtINVn0epQuq+xlkJdpdLQJvVQaon+4OsT+k6UyaRVv73/84f
   V9uwrHl2u7UbAdc19Y3PivQp/HR59E08+1HquOfZ8YcubIoir8NZXR2eM
   PbX7JXmGETCrEWDkXsUNd1iaW58YK0JMTznT398dZnQ7g5539kTC9j9Q/
   fDjFCXThHM5qudCRZ4rZP6DYpkj0BpiVZFAoVgcVIuRBwTlV28WO5Psjt
   PnSSU6cnsaR/IQTxcqE7N82U98XWff8KJbh7xiAtQR/NgsjnXzypHmlcn
   w==;
X-CSE-ConnectionGUID: 3vLKWc66S/WOPKm/JxS16A==
X-CSE-MsgGUID: jFCfWVITTfeqr54SvMaewQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45428666"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="45428666"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 06:27:24 -0700
X-CSE-ConnectionGUID: 1r9g4Yx4Tqq5vm7924jILQ==
X-CSE-MsgGUID: fAzEKcdXTMCurr6FzG22Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="127853489"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Apr 2025 06:27:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u13YO-00022n-0N;
	Sat, 05 Apr 2025 13:27:20 +0000
Date: Sat, 5 Apr 2025 21:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 14547/14595] arch/riscv/mm/tlbflush.c:195:16:
 error: redefinition of 'start'
Message-ID: <202504052159.1sI48GPM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a4cda136f021ad44b8b52286aafd613030a6db5f
commit: c0a813cbda64fd2f027ddd6dce3187fc89564f65 [14547/14595] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250405/202504052159.1sI48GPM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504052159.1sI48GPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504052159.1sI48GPM-lkp@intel.com/

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
