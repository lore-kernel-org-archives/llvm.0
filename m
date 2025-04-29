Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA85821D001;
	Tue, 29 Apr 2025 22:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966306; cv=none; b=BqiHwBHkucKoMUk+tbtmEiqsRjp4OqPYhZO/6Fz9/jvL4VHliKi2co+z/oBqaY5+E4CIWkSnuTpssETje1/yfi3GQTKtoyykf1mCyYcWs47ZUnPyLu2jEO75CDMH/Ag1Y2/TiNN6d6YgSphBXD3HqsutK4ju5VeBGnDg6LOkUfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966306; c=relaxed/simple;
	bh=fCtq1oXjmmZKewt6n+KTVXJeLKmLjW8eDIdHjfWobFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dGzg+p97XJneBHQPOEXIhiKnr1QkjiudcSBtmsXOpIpVl3ZC+J/34jyPunOjinJ/kj1n7x1YOMPTqj0ve2ydF+2A+Ci2Z0nZn1F6GF/xxyW+Wd6nrd0V7e/s5VbYj51FeIocoOdqQDO/8AvC+9C/9LVgiRCzTIlbf8jN8pw3ZlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btBTGC1Y; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btBTGC1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745966304; x=1777502304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fCtq1oXjmmZKewt6n+KTVXJeLKmLjW8eDIdHjfWobFk=;
  b=btBTGC1Y0GS6wkK7i5O/OtkXBFQw2QmK/iL8zRsg8FA8PaWbev5HTaHH
   MbITL8gm0LIKLkU9RDULc4ohCxChTJNjQRrqyc8Zpci1hXP8Nl0YDxq7Y
   inKDyq9P4k2PsPU154SIdaINoLU6RBlnjAxQG8XA1t4wPyu7NRLvnUD/9
   yi28oK4m5cLhd9B5j7RseOnzaQzL+xCBrCrO1zlF62WWba90SLcbdT3fQ
   WODcRgSMI41OcntH1Q8LE70jCXFUIfR9gGDcE7ygfrhgAXd+OQt+MMp6Q
   rLgkLz71i/ZqRnFboZ6A1fah4t7TKkBe61sXVt8AUOYcJAsHLDPmwRpMB
   A==;
X-CSE-ConnectionGUID: p7Y6P1tiTxGCpmskJUwuCA==
X-CSE-MsgGUID: OLL8YMN5S1yJssA+sPkXQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47744538"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="47744538"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 15:38:23 -0700
X-CSE-ConnectionGUID: 5MHgJ1AZT7GcWk0d5hNMMQ==
X-CSE-MsgGUID: Edtp3gvxTLSqbs2E2uI7OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133664108"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2025 15:38:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9tal-0002zj-2K;
	Tue, 29 Apr 2025 22:38:19 +0000
Date: Wed, 30 Apr 2025 06:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:pat 5/10] include/linux/pgtable.h:1493:1: error:
 expected parameter declarator
Message-ID: <202504300626.1rjohol6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux pat
head:   f60106362383c7fbbe2d6fc75c7fc17a85ed2da9
commit: 198b01f86519142d65d84243c329c8beb5f9117a [5/10] x86/mm/pat: remove old pfnmap tracking interface
config: s390-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300626.1rjohol6-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300626.1rjohol6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300626.1rjohol6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:11:
>> include/linux/pgtable.h:1493:1: error: expected parameter declarator
    1493 | {
         | ^
>> include/linux/pgtable.h:1493:1: error: expected ')'
   include/linux/pgtable.h:1492:41: note: to match this '('
    1492 | static inline int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
         |                                         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                                          ^         ~
--
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:27: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:10: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     198 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     211 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     242 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:1016:
>> include/linux/huge_mm.h:454:51: error: call to undeclared function 'pmd_devmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     454 |         if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd))
         |                                                          ^
>> include/linux/huge_mm.h:462:6: error: call to undeclared function 'pud_trans_huge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     462 |         if (pud_trans_huge(*pud) || pud_devmap(*pud))
         |             ^
   include/linux/huge_mm.h:462:6: note: did you mean 'pmd_trans_huge'?
   arch/s390/include/asm/pgtable.h:1873:19: note: 'pmd_trans_huge' declared here
    1873 | static inline int pmd_trans_huge(pmd_t pmd)
         |                   ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:1016:
>> include/linux/huge_mm.h:462:30: error: call to undeclared function 'pud_devmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     462 |         if (pud_trans_huge(*pud) || pud_devmap(*pud))
         |                                     ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
>> include/linux/mm.h:1898:9: error: call to undeclared function 'is_zero_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1898 |         return is_zero_pfn(page_to_pfn(page));
         |                ^
   49 warnings and 6 errors generated.
   make[3]: *** [scripts/Makefile.build:98: arch/s390/kernel/asm-offsets.s] Error 1 shuffle=4211635049
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=4211635049
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=4211635049
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=4211635049
   make: Target 'prepare' not remade because of errors.


vim +1493 include/linux/pgtable.h

0f8975ec4db2c8 include/asm-generic/pgtable.h Pavel Emelyanov               2013-07-03  1484  
34801ba9bf0381 include/asm-generic/pgtable.h venkatesh.pallipadi@intel.com 2008-12-19  1485  #ifndef __HAVE_PFNMAP_TRACKING
34801ba9bf0381 include/asm-generic/pgtable.h venkatesh.pallipadi@intel.com 2008-12-19  1486  /*
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1487   * Interfaces that can be used by architecture code to keep track of
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1488   * memory type of pfn mappings specified by the remap_pfn_range,
67fa1666223d7c include/asm-generic/pgtable.h Matthew Wilcox                2018-10-26  1489   * vmf_insert_pfn.
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1490   */
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1491  
3ab6e156f887d9 include/linux/pgtable.h       David Hildenbrand             2025-04-24  1492  static inline int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08 @1493  {
3ab6e156f887d9 include/linux/pgtable.h       David Hildenbrand             2025-04-24  1494  	return 0;
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1495  }
5180da410db636 include/asm-generic/pgtable.h Suresh Siddha                 2012-10-08  1496  

:::::: The code at line 1493 was first introduced by commit
:::::: 5180da410db6369d1f95c9014da1c9bc33fb043e x86, pat: separate the pfn attribute tracking for remap_pfn_range and vm_insert_pfn

:::::: TO: Suresh Siddha <suresh.b.siddha@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
