Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4DF2C11F3;
	Sat, 29 Aug 2026 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788041637; cv=none; b=pbsY7bZVwuCZ7+3SmL0bfaLE33WMCETCUMNGP97UxJ5MFfiVS1D3OddobAZjn3Ie9qOsPPZYL4P553UWliwcqa5M1FBllc7AYstjY6+1wpsq0rW6yKw/RLy/AW4C2O+veoRWcXJQxsKiDZzVnwQmHZn4LjdAtQ0Ji6TkjBLkehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788041637; c=relaxed/simple;
	bh=ePRsY6R209f3vOe1pB6AwVkUqmlfmGiSX1Pb8j7254M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hn0q9xBAA//Pncj5xvrVM2pap48scXA9jbznwXavEajfiQ+YEptrBa03wN2ZuGgTuGwqzszfnxp2JtfOiTC6Q61ZqOxgddosBgfwXh0L5a+LDhg/gn0kXoOoaABTrRAeIzbbBE56+A28ZmlsFS38797u5axeE8SckiIWaXYCenQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XiaA9yRn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiaA9yRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788041623; x=1819577623;
  h=date:from:to:cc:subject:message-id;
  bh=ePRsY6R209f3vOe1pB6AwVkUqmlfmGiSX1Pb8j7254M=;
  b=XiaA9yRnzhhDAggrXZNZgnzAtS0L7JSlHHXosCPcO/i+pPPAOMO41on4
   E72FEk2eIEdk4StdDAaYdJhtdzjQtCBTIBq7RVA2GOVJVUmGZ5ax8sdm/
   T/uSww3UtBLBbMM79VgG9FbldcmhC9+EfsAZH58s5eyHb0wSNcxJ8N99f
   anZNliqE+WL+c9sRPi+BgudK7MowPZevE1OhBUTcApBe4d4JERTX4ShXd
   K+zk+Ghv6NZ3bygnqv83S+dG/WmfrW7ZRTYTAbAkSuh1yjZm4HrTV/6rr
   I9Pp/NJ4SXu3FnwG+NK87bTzAeLFrsAvBZp2RFdWCrTZlT/QIRBxd4MF7
   Q==;
X-CSE-ConnectionGUID: c66RWClRRvu2sbxeVjZ7Gg==
X-CSE-MsgGUID: MgJftR5BR3m6cimTBofx4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="99854441"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="99854441"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 15:13:41 -0700
X-CSE-ConnectionGUID: 8TVQimnrTgy/dW0LXRq6bA==
X-CSE-MsgGUID: 4NPkiIKATpqaEWNIZJ3tNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="265883816"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Aug 2026 15:13:39 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0RIu-00000000DLg-3aTk;
	Sat, 29 Aug 2026 22:13:36 +0000
Date: Sun, 30 Aug 2026 06:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 17/20] include/linux/math64.h:106:15:
 error: call to undeclared function 'is_power_of_2'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202608300655.4x1xVMdw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   59394501f5a285ef270931207a67d2f129403151
commit: f0f1f20d167c74ea3bf43b179ce88214100b21a5 [17/20] irqflags: Provide refcounted local_irq_*() variants
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260830/202608300655.4x1xVMdw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 52774473867e49b5891ab9381accf4e5a3ce0024)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608300655.4x1xVMdw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608300655.4x1xVMdw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/restart_block.h:9:
   In file included from include/linux/time64.h:5:
>> include/linux/math64.h:106:15: error: call to undeclared function 'is_power_of_2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     106 |         *remainder = do_div(dividend, divisor);
         |                      ^
   include/asm-generic/div64.h:185:6: note: expanded from macro 'do_div'
     185 |             is_power_of_2(__base)) {                    \
         |             ^
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/restart_block.h:9:
   In file included from include/linux/time64.h:5:
>> include/linux/math64.h:106:15: error: call to undeclared function 'ilog2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/asm-generic/div64.h:187:11: note: expanded from macro 'do_div'
     187 |                 (n) >>= ilog2(__base);                  \
         |                         ^
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/restart_block.h:9:
   In file included from include/linux/time64.h:5:
>> include/linux/math64.h:106:15: error: call to undeclared function 'ilog2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/asm-generic/div64.h:191:9: note: expanded from macro 'do_div'
     191 |                 (n) = __div64_const32(n, __base);       \
         |                       ^
   include/asm-generic/div64.h:81:14: note: expanded from macro '__div64_const32'
      81 |         ___p = 1 << ilog2(___b);                                        \
         |                     ^
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/restart_block.h:9:
   In file included from include/linux/time64.h:5:
   include/linux/math64.h:304:14: error: call to undeclared function 'is_power_of_2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     304 |         rl.l.high = do_div(rh.ll, divisor);
         |                     ^
   include/asm-generic/div64.h:185:6: note: expanded from macro 'do_div'
     185 |             is_power_of_2(__base)) {                    \
         |             ^
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/restart_block.h:9:
   In file included from include/linux/time64.h:5:
   include/linux/math64.h:304:14: error: call to undeclared function 'ilog2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/asm-generic/div64.h:187:11: note: expanded from macro 'do_div'
     187 |                 (n) >>= ilog2(__base);                  \
         |                         ^
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/restart_block.h:9:
   In file included from include/linux/time64.h:5:
   include/linux/math64.h:304:14: error: call to undeclared function 'ilog2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/asm-generic/div64.h:191:9: note: expanded from macro 'do_div'
     191 |                 (n) = __div64_const32(n, __base);       \
         |                       ^
   include/asm-generic/div64.h:81:14: note: expanded from macro '__div64_const32'
      81 |         ___p = 1 << ilog2(___b);                                        \
         |                     ^
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/restart_block.h:9:
   In file included from include/linux/time64.h:5:
   include/linux/math64.h:307:2: error: call to undeclared function 'is_power_of_2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |         do_div(rl.ll, divisor);
         |         ^
   include/asm-generic/div64.h:185:6: note: expanded from macro 'do_div'
     185 |             is_power_of_2(__base)) {                    \
         |             ^
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/restart_block.h:9:
   In file included from include/linux/time64.h:5:
   include/linux/math64.h:307:2: error: call to undeclared function 'ilog2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/asm-generic/div64.h:187:11: note: expanded from macro 'do_div'
     187 |                 (n) >>= ilog2(__base);                  \
         |                         ^
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/restart_block.h:9:
   In file included from include/linux/time64.h:5:
   include/linux/math64.h:307:2: error: call to undeclared function 'ilog2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/asm-generic/div64.h:191:9: note: expanded from macro 'do_div'
     191 |                 (n) = __div64_const32(n, __base);       \
         |                       ^
   include/asm-generic/div64.h:81:14: note: expanded from macro '__div64_const32'
      81 |         ___p = 1 << ilog2(___b);                                        \
         |                     ^
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:62:
   In file included from arch/arm/include/asm/thread_info.h:14:
   In file included from arch/arm/include/asm/page.h:189:
>> include/asm-generic/getorder.h:38:10: error: call to undeclared function 'ilog2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      38 |                 return ilog2((size) - 1) - PAGE_SHIFT + 1;
         |                        ^
>> include/asm-generic/getorder.h:44:9: error: call to undeclared function 'fls'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      44 |         return fls(size);
         |                ^
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:62:
>> arch/arm/include/asm/thread_info.h:40:39: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      40 | DECLARE_PER_CPU(struct task_struct *, __entry_task);
         |                                       ^
         |                                       int 
   arch/arm/include/asm/thread_info.h:40:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      40 | DECLARE_PER_CPU(struct task_struct *, __entry_task);
         | ^
         | int 
>> arch/arm/include/asm/thread_info.h:115:16: error: use of undeclared identifier 'MODE_MASK'
     115 |                 .cpsr_mask      = MODE_MASK | PSR_T_BIT,
         |                                   ^~~~~~~~~
>> arch/arm/include/asm/thread_info.h:115:28: error: use of undeclared identifier 'PSR_T_BIT'
     115 |                 .cpsr_mask      = MODE_MASK | PSR_T_BIT,
         |                                               ^~~~~~~~~
>> arch/arm/include/asm/thread_info.h:116:15: error: use of undeclared identifier 'USR_MODE'
     116 |                 .cpsr_val       = USR_MODE,
         |                                   ^~~~~~~~
   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:28:
   In file included from include/linux/irqflags.h:16:
   In file included from include/linux/preempt.h:109:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
>> include/linux/thread_info.h:104:2: error: call to undeclared function 'set_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     104 |         set_bit(flag, (unsigned long *)&ti->flags);
         |         ^
>> include/linux/thread_info.h:109:2: error: call to undeclared function 'clear_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     109 |         clear_bit(flag, (unsigned long *)&ti->flags);
         |         ^
>> include/linux/thread_info.h:123:9: error: call to undeclared function 'test_and_set_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     123 |         return test_and_set_bit(flag, (unsigned long *)&ti->flags);
         |                ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
   make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1414: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/is_power_of_2 +106 include/linux/math64.h

f910381a55cdaa0 Sasha Levin  2012-03-15  102  
2418f4f28f8467b Roman Zippel 2008-05-01  103  #ifndef div_u64_rem
2418f4f28f8467b Roman Zippel 2008-05-01  104  static inline u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
2418f4f28f8467b Roman Zippel 2008-05-01  105  {
2418f4f28f8467b Roman Zippel 2008-05-01 @106  	*remainder = do_div(dividend, divisor);
2418f4f28f8467b Roman Zippel 2008-05-01  107  	return dividend;
2418f4f28f8467b Roman Zippel 2008-05-01  108  }
2418f4f28f8467b Roman Zippel 2008-05-01  109  #endif
2418f4f28f8467b Roman Zippel 2008-05-01  110  

:::::: The code at line 106 was first introduced by commit
:::::: 2418f4f28f8467b92a6177af32d05737ebf6206c introduce explicit signed/unsigned 64bit divide

:::::: TO: Roman Zippel <zippel@linux-m68k.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
