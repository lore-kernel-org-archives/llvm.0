Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BE82F872;
	Thu, 21 May 2026 06:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779343509; cv=none; b=Qb0XI60dQ56j1++XyicysTsr55KvOfObnXB4YwffX1HBphOHiDVi6QZfELsSqQjqBgHhXUtP9Xomwn87AOr8Kr6HAzZl9mT1PBU1c/9UwP8KywFLdQRNKRTPoKHlVJbqw39OyoSTA2iEjWAdp8vKadnk/JrCEzpGyyMtW+TcBAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779343509; c=relaxed/simple;
	bh=IWep55/V8XtzexhsqgHT+jE10t9Zg51cqS6zXTv+ylg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KZu3nRZKvJYTZHCnYMAQ9L0tR5mQny8N/Ylgt6dD7nP8GC8WvtQ5tQs/Q2Gr7cVQk4VVlTdQx4EmwCn/pUkHJUJQGuh3egSI0jERaD24Uikrs4heseP+Tpg2cadmI/18Nn90ZJPK8Ivc6zQmVLYKZdjySqTtrbtuNzdtSRsf038=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgC2w6xR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgC2w6xR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779343508; x=1810879508;
  h=date:from:to:cc:subject:message-id;
  bh=IWep55/V8XtzexhsqgHT+jE10t9Zg51cqS6zXTv+ylg=;
  b=AgC2w6xRRQMlR8O8HvPQtaJQUXKzexSEbC9wquD80Rjk9lXvFWrBh9ap
   vJKvibYNrYAvjXkiDzsM1j6sgxA3J9QS2M20CKrke5kZIY467UfG2HtAc
   FC5HNQlf/ZWnZH/k6PQyupYa3KTZb6mAO7sVr8dcMywAHoGSXISOw9sjY
   UtbeA4JdX8hocTgW9zLC3WYFJGvSaKAv3iWJqIJKu1awjfzBhqqvxvNWr
   lJeISFykuI4WuaPkX48TQ2SCKV+emKp90pj9sstbSB/2JnD+LPNGxxbi4
   L39N35Y7Goiw/+dVg4VSe7tMY2NwgVQIPXPOYaDaTlufwdS6Bup9UeiQf
   w==;
X-CSE-ConnectionGUID: mvG5Z2QGR8eZVbGbLyKT1w==
X-CSE-MsgGUID: LyohhbTzS/qSqV9N8IIAYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90949216"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="90949216"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 23:05:07 -0700
X-CSE-ConnectionGUID: GQAyP8xOSsmC/C0JiRV6sA==
X-CSE-MsgGUID: WbfrYpblTM6IJh2cquHbkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="242234609"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2026 23:05:04 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPwWE-000000004Ur-1Qjr;
	Thu, 21 May 2026 06:04:40 +0000
Date: Thu, 21 May 2026 14:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1041/1130]
 include/linux/kasan.h:53:37: error: use of undeclared identifier
 'MAX_PTRS_PER_PTE'
Message-ID: <202605211459.X3y8ugOT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 48f331391ec79fde4f8d61b0c39124cd52c089a4 [1041/1130] cheri: compat64: Prepare binfmt code for compat64 support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605211459.X3y8ugOT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211459.X3y8ugOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211459.X3y8ugOT-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/dtc/dtc-lexer.lex.c:641:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
     641 | static int dts_version = 1;
         |            ^
   1 warning generated.
   scripts/sorttable.c:452:12: warning: variable 'long_size' set but not used [-Wunused-but-set-global]
     452 | static int long_size;
         |            ^
   1 warning generated.
   scripts/mod/modpost.c:59:13: warning: variable 'extra_warn' set but not used [-Wunused-but-set-global]
      59 | static bool extra_warn;
         |             ^
   1 warning generated.
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:125:
   In file included from arch/riscv/include/asm/compat.h:11:
   In file included from include/linux/sched/task_stack.h:12:
>> include/linux/kasan.h:53:37: error: use of undeclared identifier 'MAX_PTRS_PER_PTE'
      53 | extern pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE + PTE_HWTABLE_PTRS];
         |                                     ^~~~~~~~~~~~~~~~
>> include/linux/kasan.h:54:8: error: unknown type name 'pmd_t'
      54 | extern pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD];
         |        ^
>> include/linux/kasan.h:54:37: error: use of undeclared identifier 'MAX_PTRS_PER_PMD'
      54 | extern pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD];
         |                                     ^~~~~~~~~~~~~~~~
>> include/linux/kasan.h:55:8: error: unknown type name 'pud_t'
      55 | extern pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD];
         |        ^
>> include/linux/kasan.h:55:37: error: use of undeclared identifier 'MAX_PTRS_PER_PUD'
      55 | extern pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD];
         |                                     ^~~~~~~~~~~~~~~~
>> include/linux/kasan.h:56:8: error: unknown type name 'p4d_t'
      56 | extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
         |        ^
>> include/linux/kasan.h:56:37: error: use of undeclared identifier 'MAX_PTRS_PER_P4D'
      56 | extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
         |                                     ^~~~~~~~~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     100 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     100 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:103:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     103 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:117:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     117 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:117:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     117 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:118:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     118 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:118:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     118 |                         (set1->sig[1] == set2->sig[1]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here


vim +/MAX_PTRS_PER_PTE +53 include/linux/kasan.h

29970dc24faf00 Hailong Liu      2021-01-12  51  
9577dd74864877 Andrey Konovalov 2018-12-28  52  extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
cb32c9c5d45662 Daniel Axtens    2021-06-28 @53  extern pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE + PTE_HWTABLE_PTRS];
cb32c9c5d45662 Daniel Axtens    2021-06-28 @54  extern pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD];
cb32c9c5d45662 Daniel Axtens    2021-06-28 @55  extern pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD];
9577dd74864877 Andrey Konovalov 2018-12-28 @56  extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
69786cdb379bbc Andrey Ryabinin  2015-08-13  57  

:::::: The code at line 53 was first introduced by commit
:::::: cb32c9c5d45662770160e0055cb672fd6e0813e8 kasan: use MAX_PTRS_PER_* for early shadow tables

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
