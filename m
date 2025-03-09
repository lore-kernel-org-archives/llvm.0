Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A901AC133;
	Sun,  9 Mar 2025 05:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741498805; cv=none; b=Z6ST86cJWBG7+5UQxjSRJNi1mAioKHslg4Re5s4DWWhFDGmCw0nj7G65gYbAsupWgQTyitfLgKn9alz7E41c0JCN7mjZx7pJmcCXs1FCtAIb+rCnWsMTqkYaxWhXd+XMHzD0O6QuG8DSgo7VwqHvoNg39viLJdN8oDI2yt4qONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741498805; c=relaxed/simple;
	bh=SnT8ZIrTc6VZLNoHmsiw9JZ5LMzL0qo/Tkcb7iToQWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PgWxrEJA+9NQ+SUdtTPmp38pOnfLWBcPoqqXcW6WiGm36vhqNshrK4O17rBUaXpLUyiLMn293uSa3qKgRCkS/roS5XEcuiXVSzdNxxiPbZ+N4O1Mo8eqDCq3dJ/867EZS25ap5M8uqT/mAN5LtRZBU+KTnAAztCG+Oqs82jCww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNkyccwx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNkyccwx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741498804; x=1773034804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SnT8ZIrTc6VZLNoHmsiw9JZ5LMzL0qo/Tkcb7iToQWs=;
  b=VNkyccwx4RIM5BwjLhFKVxWoVXo2+db9gSu7e6lJmARTVC+74rjZB7V7
   5ZgI76wqeEtv447K5AHuB/wOalGKFi61Rmu0Ymo8DXil3AOFJ0EnK/XQS
   qXxTaMt5oc2QMsVWv1dA2zi5cYmCRdRxfflBFF2Eb3qmd56pTJqk2SR06
   R76XniDVNMCiJE5Vp6omqT7ibjnq+HU5ENI1sjoIgQit7aVLRYV7Q2Bas
   r1B28ZssQT3j3TnWnlwnO1Ue2V/URAPg5XJHA4PCJNTfq4x190Yg+Nt+h
   PXhYpbhWWL9lBJCP5491bkg7Ixqm6v/aUmtSsGrO1ahD8D94Eu3BdxEL0
   w==;
X-CSE-ConnectionGUID: cOBy1QQ5RfmPHb19OLzAPA==
X-CSE-MsgGUID: ixhmFZxCS9C82SyFveKcqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="53493247"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="53493247"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 21:40:03 -0800
X-CSE-ConnectionGUID: lC88LRsmR4mcRq5T4rODJw==
X-CSE-MsgGUID: NXVH2V9jS4e1j7iCUsdqVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156894228"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 08 Mar 2025 21:40:02 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr9OG-0002jQ-1j;
	Sun, 09 Mar 2025 05:39:57 +0000
Date: Sun, 9 Mar 2025 13:39:25 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:asm-call 24/42] arch/x86/include/asm/cmpxchg_32.h:134:9:
 error: expected ')'
Message-ID: <202503091314.YoYafIjT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git asm-call
head:   3688c8209c27cd871041b38371e3c44e219ed75a
commit: 9d370256c94ac8fae08150c247d35872dd4e270f [24/42] x86/locking: Use asm_call() in *_cmpxchg64_emu()
config: i386-buildonly-randconfig-002-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091314.YoYafIjT-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091314.YoYafIjT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091314.YoYafIjT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:9:
   In file included from arch/x86/include/asm/nospec-branch.h:6:
   In file included from include/linux/static_key.h:1:
   In file included from include/linux/jump_label.h:257:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:8:
   In file included from arch/x86/include/asm/cmpxchg.h:143:
   arch/x86/include/asm/cmpxchg_32.h:104:9: error: too few arguments provided to function-like macro invocation
     104 |         return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock ");
         |                ^
   arch/x86/include/asm/cmpxchg_32.h:97:17: note: expanded from macro '__arch_cmpxchg64_emu'
      97 |                  ARG("memory"));                                        \
         |                               ^
   arch/x86/include/asm/asm.h:246:9: note: macro 'asm_call' defined here
     246 | #define asm_call(vol, insns, output, input, clobbers...)                \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:9:
   In file included from arch/x86/include/asm/nospec-branch.h:6:
   In file included from include/linux/static_key.h:1:
   In file included from include/linux/jump_label.h:257:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:8:
   In file included from arch/x86/include/asm/cmpxchg.h:143:
   arch/x86/include/asm/cmpxchg_32.h:104:9: error: use of undeclared identifier 'asm_call'
     104 |         return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock ");
         |                ^
   arch/x86/include/asm/cmpxchg_32.h:93:2: note: expanded from macro '__arch_cmpxchg64_emu'
      93 |         asm_call(ALTERNATIVE(_lock_loc "call cmpxchg8b_emu",            \
         |         ^
   arch/x86/include/asm/cmpxchg_32.h:110:9: error: too few arguments provided to function-like macro invocation
     110 |         return __arch_cmpxchg64_emu(ptr, old, new, ,);
         |                ^
   arch/x86/include/asm/cmpxchg_32.h:97:17: note: expanded from macro '__arch_cmpxchg64_emu'
      97 |                  ARG("memory"));                                        \
         |                               ^
   arch/x86/include/asm/asm.h:246:9: note: macro 'asm_call' defined here
     246 | #define asm_call(vol, insns, output, input, clobbers...)                \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:9:
   In file included from arch/x86/include/asm/nospec-branch.h:6:
   In file included from include/linux/static_key.h:1:
   In file included from include/linux/jump_label.h:257:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:8:
   In file included from arch/x86/include/asm/cmpxchg.h:143:
   arch/x86/include/asm/cmpxchg_32.h:110:9: error: use of undeclared identifier 'asm_call'
     110 |         return __arch_cmpxchg64_emu(ptr, old, new, ,);
         |                ^
   arch/x86/include/asm/cmpxchg_32.h:93:2: note: expanded from macro '__arch_cmpxchg64_emu'
      93 |         asm_call(ALTERNATIVE(_lock_loc "call cmpxchg8b_emu",            \
         |         ^
>> arch/x86/include/asm/cmpxchg_32.h:134:9: error: expected ')'
     134 |         return __arch_try_cmpxchg64_emu(ptr, oldp, new, LOCK_PREFIX_HERE, "lock ");
         |                ^
   arch/x86/include/asm/cmpxchg_32.h:122:18: note: expanded from macro '__arch_try_cmpxchg64_emu'
     122 |                  ARG(CC_OUT(e) (ret), "+a" (o.low), "+d" (o.high)),     \
         |                                ^
   arch/x86/include/asm/cmpxchg_32.h:140:9: error: expected ')'
     140 |         return __arch_try_cmpxchg64_emu(ptr, oldp, new, ,);
         |                ^
   arch/x86/include/asm/cmpxchg_32.h:122:18: note: expanded from macro '__arch_try_cmpxchg64_emu'
     122 |                  ARG(CC_OUT(e) (ret), "+a" (o.low), "+d" (o.high)),     \
         |                                ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:9:
   In file included from arch/x86/include/asm/nospec-branch.h:6:
   In file included from include/linux/static_key.h:1:
   In file included from include/linux/jump_label.h:257:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:172:
   arch/x86/include/asm/atomic64_32.h:114:19: error: expected ')'
     114 |                              ARG("=&A" (o)),
         |                                        ^
   arch/x86/include/asm/atomic64_32.h:125:2: error: expected string literal in 'asm'
     125 |         alternative_atomic64(set,
         |         ^
   arch/x86/include/asm/atomic64_32.h:78:2: note: expanded from macro 'alternative_atomic64'
      78 |         __alternative_atomic64(f, f, ARG(out), ARG(in), ARG(clobbers))
         |         ^
   arch/x86/include/asm/atomic64_32.h:62:2: note: expanded from macro '__alternative_atomic64'
      62 |         alternative_call(atomic64_##f##_386,                            \
         |         ^
   arch/x86/include/asm/alternative.h:244:2: note: expanded from macro 'alternative_call'
     244 |         asm_call(ALTERNATIVE("call %c[old]",                                            \
         |         ^
   arch/x86/include/asm/asm.h:248:10: note: expanded from macro 'asm_call'
     248 |                        : ASM_CALL_OUTPUT(output)                        \
         |                        ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:9:
   In file included from arch/x86/include/asm/nospec-branch.h:6:
   In file included from include/linux/static_key.h:1:
   In file included from include/linux/jump_label.h:257:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:172:
   arch/x86/include/asm/atomic64_32.h:135:19: error: expected ')'
     135 |                              ARG("=&A" (r)),
         |                                        ^
   arch/x86/include/asm/atomic64_32.h:144:18: error: expected ')'
     144 |                              ARG("+A" (i), "+c" (v)),
         |                                       ^
   arch/x86/include/asm/atomic64_32.h:154:18: error: expected ')'
     154 |                              ARG("+A" (i), "+c" (v)),
         |                                       ^
   arch/x86/include/asm/atomic64_32.h:165:19: error: expected ')'
     165 |                              ARG("=&A" (a)),
         |                                        ^
   arch/x86/include/asm/atomic64_32.h:176:19: error: expected ')'
     176 |                              ARG("=&A" (a)),
         |                                        ^
   arch/x86/include/asm/atomic64_32.h:186:20: error: expected ')'
     186 |                                ARG("+A" (i), "+c" (v)),
         |                                         ^
   arch/x86/include/asm/atomic64_32.h:194:20: error: expected ')'
     194 |                                ARG("+A" (i), "+c" (v)),
         |                                         ^
   arch/x86/include/asm/atomic64_32.h:201:2: error: expected string literal in 'asm'
     201 |         __alternative_atomic64(inc, inc_return,
         |         ^
   arch/x86/include/asm/atomic64_32.h:62:2: note: expanded from macro '__alternative_atomic64'
      62 |         alternative_call(atomic64_##f##_386,                            \
         |         ^
   arch/x86/include/asm/alternative.h:244:2: note: expanded from macro 'alternative_call'
     244 |         asm_call(ALTERNATIVE("call %c[old]",                                            \
         |         ^
   arch/x86/include/asm/asm.h:248:10: note: expanded from macro 'asm_call'
     248 |                        : ASM_CALL_OUTPUT(output)                        \
         |                        ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:9:
   In file included from arch/x86/include/asm/nospec-branch.h:6:
   In file included from include/linux/static_key.h:1:
   In file included from include/linux/jump_label.h:257:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:172:
   arch/x86/include/asm/atomic64_32.h:210:2: error: expected string literal in 'asm'
     210 |         __alternative_atomic64(dec, dec_return,


vim +134 arch/x86/include/asm/cmpxchg_32.h

aef95dac9ce4f2 Uros Bizjak 2024-04-08  131  
aef95dac9ce4f2 Uros Bizjak 2024-04-08  132  static __always_inline bool arch_try_cmpxchg64(volatile u64 *ptr, u64 *oldp, u64 new)
aef95dac9ce4f2 Uros Bizjak 2024-04-08  133  {
023f3290b02552 Uros Bizjak 2025-02-28 @134  	return __arch_try_cmpxchg64_emu(ptr, oldp, new, LOCK_PREFIX_HERE, "lock ");
aef95dac9ce4f2 Uros Bizjak 2024-04-08  135  }
aef95dac9ce4f2 Uros Bizjak 2024-04-08  136  #define arch_try_cmpxchg64 arch_try_cmpxchg64
aef95dac9ce4f2 Uros Bizjak 2024-04-08  137  

:::::: The code at line 134 was first introduced by commit
:::::: 023f3290b02552ea006c1a2013e373750d2cbff6 x86/locking: Remove semicolon from "lock" prefix

:::::: TO: Uros Bizjak <ubizjak@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
