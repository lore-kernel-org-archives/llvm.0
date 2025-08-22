Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9511531C8;
	Fri, 22 Aug 2025 21:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755898331; cv=none; b=H0QYva9wE0y7QXuePUZxZ5c9U7anIkJELvldO2cPzjBOeAcbSoj75cyhw1//DVZlYVpy5o8D7o45BUzHsmsgkdNwF9l9BLFo+RDA6uz2CJPFMEG1rm0ouSEvthLQwA5I1lseqcetnVy/yGMLXsKPtvhneBmHnP1ZfCrB6zazl7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755898331; c=relaxed/simple;
	bh=Wl9kBX66Z0TKjWVUHQeTmjamBi1LEqMsL/BdZ6WQ0qc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G28t7C2TWk7xBg3E375HQ+FhdgZiXQFZw2g4wVNMfZSHOvBElbcr2PW/jGo+maHcoCEfOsiwjgn8ZCmOZCjsvanZ4jDNWjYTXM/9Gj44CkXz3QDH0XTSiw1qITEV/X/4Se4zsvY/9GGTMO65+Xe59sujdpF51wbu5u/XFl1L/yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hP7lh31S; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hP7lh31S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755898330; x=1787434330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wl9kBX66Z0TKjWVUHQeTmjamBi1LEqMsL/BdZ6WQ0qc=;
  b=hP7lh31Se5/vgkExjU6UYF4Sw4ef3Q0tddbJywYJcvhvP6CwN7lZJGy3
   wEweeZpPPulWeWnBAFyAo3VX+D/U2XI8kimyNBFg1tRZCYo+fv5eZQTkU
   ntK4kmyHK/mWnmiEcDnEZOzec/hE0q0SxBq5ObsVmlQJ/Y3K6TfDJkLPh
   Vc9TIwziUPdYi7kTnHVmmXuPLMBzWyJgpkBsDca6YZkJhPU21AHTy+8hc
   MKcJNSONfefw6Uk/rYCt39ZUOO6hxOAb//X2C/ptFMHybsAtK5Pr05nME
   lQ2wzMsowzN2tZiqEydgrG0NHHWecVFptofBAT7a8OxUF3jDFSiClIbUv
   w==;
X-CSE-ConnectionGUID: 0ac325t/S7upas5rfZsJhQ==
X-CSE-MsgGUID: CWBQV32MTF2zWRS8CztxYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58161409"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58161409"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 14:32:09 -0700
X-CSE-ConnectionGUID: Bf7s2TwDQNuTpTP88xTo9g==
X-CSE-MsgGUID: CoOCDXvQQM60UdW/G10kZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168032442"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Aug 2025 14:32:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upZMR-000LqT-1B;
	Fri, 22 Aug 2025 21:31:54 +0000
Date: Sat, 23 Aug 2025 05:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [akpm-mm:mm-new 216/233] arch/riscv/include/asm/pgtable.h:951:36:
 error: too few arguments to function call, expected 3, have 2
Message-ID: <202508230551.qiEQu04P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   a8af4c2fd982fd94fffde3c5b6b764fd20af68fe
commit: e009b0f3187482a5756ff3b015cf30277cc1cfd9 [216/233] mm/page_table_check: reinstate address parameter in [__]page_table_check_pud_clear()
config: riscv-randconfig-001-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230551.qiEQu04P-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230551.qiEQu04P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230551.qiEQu04P-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:951:36: error: too few arguments to function call, expected 3, have 2
     951 |         page_table_check_pud_clear(mm, pud);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~        ^
   include/linux/page_table_check.h:128:20: note: 'page_table_check_pud_clear' declared here
     128 | static inline void page_table_check_pud_clear(struct mm_struct *mm,
         |                    ^                          ~~~~~~~~~~~~~~~~~~~~~
     129 |                                               unsigned long addr, pud_t pud)
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:


vim +951 arch/riscv/include/asm/pgtable.h

c3cc2a4a3a23faf Alexandre Ghiti 2025-03-21  944  
f2716df5ec97bde Alexandre Ghiti 2025-08-14  945  #define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR
f2716df5ec97bde Alexandre Ghiti 2025-08-14  946  static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
f2716df5ec97bde Alexandre Ghiti 2025-08-14  947  					    unsigned long address, pud_t *pudp)
f2716df5ec97bde Alexandre Ghiti 2025-08-14  948  {
f2716df5ec97bde Alexandre Ghiti 2025-08-14  949  	pud_t pud = __pud(atomic_long_xchg((atomic_long_t *)pudp, 0));
f2716df5ec97bde Alexandre Ghiti 2025-08-14  950  
f2716df5ec97bde Alexandre Ghiti 2025-08-14 @951  	page_table_check_pud_clear(mm, pud);
f2716df5ec97bde Alexandre Ghiti 2025-08-14  952  
f2716df5ec97bde Alexandre Ghiti 2025-08-14  953  	return pud;
f2716df5ec97bde Alexandre Ghiti 2025-08-14  954  }
f2716df5ec97bde Alexandre Ghiti 2025-08-14  955  

:::::: The code at line 951 was first introduced by commit
:::::: f2716df5ec97bde2827d917452dc4de45a6c737c riscv: use an atomic xchg in pudp_huge_get_and_clear()

:::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
