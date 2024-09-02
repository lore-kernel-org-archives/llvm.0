Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58E41E87B;
	Mon,  2 Sep 2024 11:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725275756; cv=none; b=QC19zEbZGhaEFI70IdSm3cRjdsi6gSbMIGCgS4boBo9ae6Zby57WwK6ry6RHw64BH6iQUXYR81zEHfYXuq0SJNdDe5fRDVL5wJ+q86hs423jmLxUykPC8asG/wXHfxt66b7erRYTVhpSDATDNANfJQAw3oi/G1UZ9wptE0S9WKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725275756; c=relaxed/simple;
	bh=Kqm161jZYuuJve2Riypjw92apiBk5TY59cuXXHaDKr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W9VtjsXaR+6Rb+1Sr2r4NasQAeWEzC1l4hNJ9P5ogVt/33CtmqYHtvJrNiPLCHcrw+A06HBXOfL1Lkd5ZU0iI81VBO56Y0ei79L+p+lU2pbccC9x5baVaxoN0YsvrXr4ERRGMUHn2QD8P42APXVsoAk88THH/7vlmA2xi4kKTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKbtmY/o; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKbtmY/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725275754; x=1756811754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kqm161jZYuuJve2Riypjw92apiBk5TY59cuXXHaDKr4=;
  b=KKbtmY/oSJlHamU1I2G2gQtoQn4dUTJLZ6JDA173d0ImLhYqOL7BMotQ
   sgew5lg9pye68Dwz8v/Wuo2J8dqnkrDxQB1FZR6LqBjSGtp29+HQsMSiM
   MboFTD8jYB4ge4Ly+iGhXKyPfyUupXo7KQqIuSHfaNYTBlV5u/jZ3+niH
   Wp9mspvcS1s1DciKdlq7u8K/hGI3jF3B7VUXnlDAve7bG24P9oFevMUlD
   Cqtqw8D/1nNGV9Nx6NcgT/4MTBxYxY7oZZRQ0R7Sa/DhqQ1Ldl+U5Wwi7
   0dzm+Ck11aLfUoLQ7KuKmqHdua8HaoHb8vXvCE0HV8ouDMW583DqmS8sQ
   g==;
X-CSE-ConnectionGUID: 4Zv+5aMoQ8CbC7Ghhxw/lA==
X-CSE-MsgGUID: qnTsyazOS5KNEH2Iw32KCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="26753936"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="26753936"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:15:53 -0700
X-CSE-ConnectionGUID: vxCH9A0fS36qdw2gmiw31w==
X-CSE-MsgGUID: BgbN0eiLRA2m4Q0ZqlkZ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64214624"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2024 04:15:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl52D-0005NC-2W;
	Mon, 02 Sep 2024 11:15:49 +0000
Date: Mon, 2 Sep 2024 19:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 5/13]
 arch/x86/include/asm/cmpxchg_32.h:106:9: error: expected ')'
Message-ID: <202409021950.hMNvmXhD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   d63894f7f2633e98788b1a74a983e9dbea49d1b7
commit: 919add2736f64cbcbf2a7ec537e95ee652c9f8c3 [5/13] x86/alternative: Create symbols for special section entries
config: um-randconfig-001-20240902 (https://download.01.org/0day-ci/archive/20240902/202409021950.hMNvmXhD-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021950.hMNvmXhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021950.hMNvmXhD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:16:
   In file included from include/linux/cpumask.h:14:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:8:
   In file included from arch/x86/include/asm/cmpxchg.h:143:
>> arch/x86/include/asm/cmpxchg_32.h:106:9: error: expected ')'
     106 |         return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock; ");
         |                ^
   arch/x86/include/asm/cmpxchg_32.h:94:15: note: expanded from macro '__arch_cmpxchg64_emu'
      94 |         asm volatile(ALTERNATIVE(_lock_loc                              \
         |                      ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:16:
   In file included from include/linux/cpumask.h:14:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:8:
   In file included from arch/x86/include/asm/cmpxchg.h:143:
   arch/x86/include/asm/cmpxchg_32.h:112:9: error: expected ')'
     112 |         return __arch_cmpxchg64_emu(ptr, old, new, ,);
         |                ^
   arch/x86/include/asm/cmpxchg_32.h:94:15: note: expanded from macro '__arch_cmpxchg64_emu'
      94 |         asm volatile(ALTERNATIVE(_lock_loc                              \
         |                      ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:16:
   In file included from include/linux/cpumask.h:14:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:8:
   In file included from arch/x86/include/asm/cmpxchg.h:143:
   arch/x86/include/asm/cmpxchg_32.h:139:9: error: expected ')'
     139 |         return __arch_try_cmpxchg64_emu(ptr, oldp, new, LOCK_PREFIX_HERE, "lock; ");
         |                ^
   arch/x86/include/asm/cmpxchg_32.h:122:15: note: expanded from macro '__arch_try_cmpxchg64_emu'
     122 |         asm volatile(ALTERNATIVE(_lock_loc                              \
         |                      ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:16:
   In file included from include/linux/cpumask.h:14:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:8:
   In file included from arch/x86/include/asm/cmpxchg.h:143:
   arch/x86/include/asm/cmpxchg_32.h:145:9: error: expected ')'
     145 |         return __arch_try_cmpxchg64_emu(ptr, oldp, new, ,);
         |                ^
   arch/x86/include/asm/cmpxchg_32.h:122:15: note: expanded from macro '__arch_try_cmpxchg64_emu'
     122 |         asm volatile(ALTERNATIVE(_lock_loc                              \
         |                      ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:16:
   In file included from include/linux/cpumask.h:14:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:172:
   arch/x86/include/asm/atomic64_32.h:107:2: error: expected ')'
     107 |         alternative_atomic64(xchg, "=&A" (o),
         |         ^
   arch/x86/include/asm/atomic64_32.h:72:2: note: expanded from macro 'alternative_atomic64'
      72 |         __alternative_atomic64(f, f, ASM_OUTPUT2(out), ## in)
         |         ^
   arch/x86/include/asm/atomic64_32.h:59:2: note: expanded from macro '__alternative_atomic64'
      59 |         alternative_call(atomic64_##f##_386, atomic64_##g##_cx8, \
         |         ^
   arch/x86/include/asm/alternative.h:304:23: note: expanded from macro 'alternative_call'
     304 |         asm_inline volatile (ALTERNATIVE("call %c[old]", "call %c[new]", ft_flags) \
         |                              ^
   arch/x86/include/asm/alternative.h:228:2: note: expanded from macro 'ALTERNATIVE'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^
   arch/x86/include/asm/alternative.h:208:2: note: expanded from macro 'ALTINSTR_ENTRY'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:16:
   In file included from include/linux/cpumask.h:14:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:172:
   arch/x86/include/asm/atomic64_32.h:118:2: error: expected ')'
     118 |         alternative_atomic64(set, /* no output */,


vim +106 arch/x86/include/asm/cmpxchg_32.h

79e1dd05d1a22e Arjan van de Ven 2009-09-30  103  
7016cc5def44b9 Uros Bizjak      2024-04-08  104  static __always_inline u64 arch_cmpxchg64(volatile u64 *ptr, u64 old, u64 new)
7016cc5def44b9 Uros Bizjak      2024-04-08  105  {
33eb8ab4ec83cf Uros Bizjak      2024-04-17 @106  	return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock; ");
7016cc5def44b9 Uros Bizjak      2024-04-08  107  }
7016cc5def44b9 Uros Bizjak      2024-04-08  108  #define arch_cmpxchg64 arch_cmpxchg64
79e1dd05d1a22e Arjan van de Ven 2009-09-30  109  

:::::: The code at line 106 was first introduced by commit
:::::: 33eb8ab4ec83cf0975d0113966c7e71cd6be60b2 locking/atomic/x86: Merge __arch{,_try}_cmpxchg64_emu_local() with __arch{,_try}_cmpxchg64_emu()

:::::: TO: Uros Bizjak <ubizjak@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
