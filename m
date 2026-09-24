Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7524A06D;
	Thu, 24 Sep 2026 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259569; cv=none; b=mTUXA8ESsEFrSu0XqzvS0ZiFFpzOWz09bn94PAvM5zr4+x7Qhhngby9QGQYdH3z5qK5qiVcYKc4IJShYtxqrNM4h1l7F4UwArjEEn97VoiBYAPKV3YTf63zrRfTnBMG5HcchtBTtJDBoM2LHJW+vlolENcA8WbVOXB5JNgIY7gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259569; c=relaxed/simple;
	bh=4lE5w++DUA64LCVqQQkUOxoRe/oo2Aj0Polh1lZ71CI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UOXfm1HzIw0FCZKoS26YTJv48KcZd909ERL49VOMcDe2f7jLVYmHlOQMKmLmqndm4ecE5+22wSu9Q+FQMJcdE3h+IsavNfl6ACPu3MplHTHplKuv/yH2lFACdtsMTMesgnJE+aJ/Y3FitisK6FSEXgPHMVvHEULM9P0EIJsUxng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5AnZhSA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5AnZhSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790259567; x=1821795567;
  h=date:from:to:cc:subject:message-id;
  bh=4lE5w++DUA64LCVqQQkUOxoRe/oo2Aj0Polh1lZ71CI=;
  b=I5AnZhSAefj0hQyYP1RpsWKVxbuxJf+vhLw95sSIqf9y7p5jswgpFbmr
   2/A6tjx56ne1rFnWDGLuWbwaLQochv0pBNiBvkBrqNKvMrQ174ZTU5Tsv
   wnCH9B3xsFykJ0WFfqnDGaC2/XkuffDDQq+I+vhKc0/BZ4SpBQ279wqNd
   3aTOTVgI0MiDLpcoqC5KQH2ZcFeoLLs1wLjlxSGRFqR480xe3D7DlDHSP
   sKVNTZLiVVJ60GCH701lUX49jtjM7nDaXfVy9Z6VeSBIucpCY7xhOZo/+
   sWQebmgTVdmTtAVPdCuAgQ6yxP5mRVLXHqleWEn5DHnN5MBD+E6gidIfh
   g==;
X-CSE-ConnectionGUID: aEqw1BsDSmGswl4tDtYcRg==
X-CSE-MsgGUID: V3AvAwXcTCSvm/TeQ/AJBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89988787"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="89988787"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 07:19:25 -0700
X-CSE-ConnectionGUID: EAzovXSjTGiBzkw8Gob4EA==
X-CSE-MsgGUID: oT1zvVhDSN2zjop3wOKqlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="277797370"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Sep 2026 07:19:23 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9kID-000000000LG-001i;
	Thu, 24 Sep 2026 14:19:21 +0000
Date: Thu, 24 Sep 2026 16:19:03 +0200
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: include/linux/pgtable.h:493:21: error: conflicting types for
 'ptep_get'
Message-ID: <202609241621.VOcb82Um-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/s390-mm-Drop-all-pxdp_get/20260923-100220
head:   b212352b7f2fdd6516ee447704e5e31fde0c2a8d
commit: 85ab0e85fd6ebe9757f9ba20e039988b46c03efb s390/mm: Drop all pxdp_get()
date:   34 hours ago
config: s390-randconfig-2001-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241621.VOcb82Um-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7e4b8ae111298941e0c31052a7124ab36f5365b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241621.VOcb82Um-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241621.VOcb82Um-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:12:
>> include/linux/pgtable.h:493:21: error: conflicting types for 'ptep_get'
     493 | static inline pte_t ptep_get(pte_t *ptep)
         |                     ^
   arch/s390/include/asm/pgtable.h:28:21: note: previous declaration is here
      28 | static inline pte_t ptep_get(const pte_t *ptep);
         |                     ^
   In file included from arch/s390/kernel/asm-offsets.c:12:
>> include/linux/pgtable.h:507:21: error: conflicting types for 'pudp_get'
     507 | static inline pud_t pudp_get(pud_t *pudp)
         |                     ^
   arch/s390/include/asm/pgtable.h:29:21: note: previous declaration is here
      29 | static inline pud_t pudp_get(const pud_t *pudp);
         |                     ^
   In file included from arch/s390/kernel/asm-offsets.c:12:
>> include/linux/pgtable.h:514:21: error: conflicting types for 'p4dp_get'
     514 | static inline p4d_t p4dp_get(p4d_t *p4dp)
         |                     ^
   arch/s390/include/asm/pgtable.h:30:21: note: previous declaration is here
      30 | static inline p4d_t p4dp_get(const p4d_t *p4dp);
         |                     ^
   In file included from arch/s390/kernel/asm-offsets.c:12:
>> include/linux/pgtable.h:521:21: error: conflicting types for 'pgdp_get'
     521 | static inline pgd_t pgdp_get(pgd_t *pgdp)
         |                     ^
   arch/s390/include/asm/pgtable.h:31:21: note: previous declaration is here
      31 | static inline pgd_t pgdp_get(const pgd_t *pgdp);
         |                     ^
   In file included from arch/s390/kernel/asm-offsets.c:16:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:16:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:16:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:16:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:16:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:16:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:16:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:16:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:16:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:16:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]


vim +/ptep_get +493 include/linux/pgtable.h

^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds  2005-04-16  491  
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  492  #ifndef ptep_get
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12 @493  static inline pte_t ptep_get(pte_t *ptep)
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  494  {
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  495  	return READ_ONCE(*ptep);
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  496  }
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  497  #endif
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  498  
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  499  #ifndef pmdp_get
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  500  static inline pmd_t pmdp_get(pmd_t *pmdp)
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  501  {
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  502  	return READ_ONCE(*pmdp);
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  503  }
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  504  #endif
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts    2023-06-12  505  
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  506  #ifndef pudp_get
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13 @507  static inline pud_t pudp_get(pud_t *pudp)
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  508  {
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  509  	return READ_ONCE(*pudp);
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  510  }
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  511  #endif
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  512  
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  513  #ifndef p4dp_get
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13 @514  static inline p4d_t p4dp_get(p4d_t *p4dp)
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  515  {
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  516  	return READ_ONCE(*p4dp);
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  517  }
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  518  #endif
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  519  
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  520  #ifndef pgdp_get
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13 @521  static inline pgd_t pgdp_get(pgd_t *pgdp)
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  522  {
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  523  	return READ_ONCE(*pgdp);
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  524  }
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  525  #endif
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti 2023-12-13  526  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
