Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A259B1EB4F;
	Fri, 22 Dec 2023 23:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FX+ULMIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703288079; x=1734824079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IlE9zVK9IPc02wWB7JPozwEAdYb40JOV3XTLtW5KvDw=;
  b=FX+ULMINtBZjWakocaeAx3Sc6lN5SZCP+lOTyzAgdN+UfUJJIC1wfxE2
   su8+rXUmMItCkkoALFOszQ2qOfOSLIaX0VigBuoilLHQrIahySFxwpzEh
   OIsXcWTnU3qKJmdmGpSMjZG3bIhlRQoUdVMiw9KiXjg/y+w1SYOMoCXST
   HFE5CkgSbMj/yWPRkiKXQubeY78nMvLFGbW7e5O/gFfjlag8f7UwG8wpY
   FzXUGUV98TP5sNUg8X/Th4uQ3SDgR7IxO6EvqInIBELjATtCGXo37H7jJ
   euyGbuifPF5xMDhBj5g7cmmrFDwb53d+GEWr2gwwJ0SbCJSG5DaSXLG5q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="14848456"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="14848456"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 15:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="780723506"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="780723506"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Dec 2023 15:33:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGp0E-0009zj-0Z;
	Fri, 22 Dec 2023 23:32:47 +0000
Date: Sat, 23 Dec 2023 07:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:zap-batching 43/50] include/linux/pgtable.h:220:3:
 error: implicit declaration of function 'ptep_set_wrprotect' is invalid in
 C99
Message-ID: <202312230700.OBz2GkED-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux zap-batching
head:   a87ca0519e9108ec48b13a88d4a30a7756923d83
commit: 7ddc8bfc39055b1ed487d6639b4125e1c77a9e4b [43/50] mm/memory: optimize fork() with PTE-mapped THP
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231223/202312230700.OBz2GkED-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230700.OBz2GkED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230700.OBz2GkED-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:29:
   include/linux/pgtable.h:211:38: error: use of undeclared identifier 'PFN_PTE_SHIFT'
           return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
                                               ^
>> include/linux/pgtable.h:220:3: error: implicit declaration of function 'ptep_set_wrprotect' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   ptep_set_wrprotect(mm, addr, ptep);
                   ^
   include/linux/pgtable.h:220:3: note: did you mean 'pte_wrprotect'?
   arch/arm/include/asm/pgtable.h:226:21: note: 'pte_wrprotect' declared here
   static inline pte_t pte_wrprotect(pte_t pte)
                       ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:29:
   include/linux/pgtable.h:631:20: error: static declaration of 'ptep_set_wrprotect' follows non-static declaration
   static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
                      ^
   include/linux/pgtable.h:220:3: note: previous implicit declaration is here
                   ptep_set_wrprotect(mm, addr, ptep);
                   ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]


vim +/ptep_set_wrprotect +220 include/linux/pgtable.h

   214	
   215	#ifndef wrprotect_ptes
   216	static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
   217			pte_t *ptep, unsigned int nr)
   218	{
   219		for (;;) {
 > 220			ptep_set_wrprotect(mm, addr, ptep);
   221			if (--nr == 0)
   222				break;
   223			ptep++;
   224			addr += PAGE_SIZE;
   225		}
   226	}
   227	#endif
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
