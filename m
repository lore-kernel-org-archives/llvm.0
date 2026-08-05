Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B791F09A5;
	Wed,  5 Aug 2026 03:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785900455; cv=none; b=Dpk3PetxfMZxXZEamykRKq6bdVrWITmWir+jblBaZFaLzH2q8B3ES4pgK3kKzaPxj6Hxp6Qc2/KX0PebdxHX6m3mXKHD0eWv8sXlBPBtvLvQZC6D+TDz+N+GGc7LmAbG7voYqLfaQDk46kBIzyXO7K+Vq85SYT6BSvCX5WiSlUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785900455; c=relaxed/simple;
	bh=TPgtGji3Yfk5KWZbFUA+Ink40cwno+l0kyU5LohWyB0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SOKARJSOH9V2OqJgJrM/qqBSN6Su9xFfJtPN7Blidrsd8HynRU625W3pwpdr5ZbGdBCjOLth5EsLJFI7CrhpvZGOHPAbcWzypdjhp6Jx2V8p+FdjG2Pq9QPG5WFPdvMz24uRC9ByeQsJomUKj8d+31pI9PKxBO2aNGG/fPS67WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEiUHtI4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEiUHtI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785900454; x=1817436454;
  h=date:from:to:cc:subject:message-id;
  bh=TPgtGji3Yfk5KWZbFUA+Ink40cwno+l0kyU5LohWyB0=;
  b=eEiUHtI4K8B2aK3bxL2oyYq4ps/PDXclMAAuoFrFblica7oo78C7bIxb
   uKPtOusFmdbv3U93HtBYmGWympcH0F+s6lQS6NJlIH+Cz0Bl5Q7ly+Crg
   DOoH3DY+0uRH/8R8hw+/4LUNTFa7y6Uq+O+2a0yDAgopvXXLOR3/6hmdA
   iAy9PpjXDZxASzEU/5ioI54tBsQCMjcXP7gYLh7agmtrUQFEJbLaoNzjY
   2PoasZbcRaiOGo0jFF1ewKDwBuVYrYFg7TyqwifXeK/T5Ma6ixAaFvnXY
   +hPFuFxIzVGFktPlKc7mYwbMP3J+wvhHPn9Nd40vgo1ise1ny/1Um3Hb6
   g==;
X-CSE-ConnectionGUID: eLcfWdTETf2LxyZ6l6vV0w==
X-CSE-MsgGUID: QCuB7mVMS5GrZmoBkqvDyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86343900"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86343900"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 20:27:33 -0700
X-CSE-ConnectionGUID: q8JdPL73QAS+fWi8WBwjIw==
X-CSE-MsgGUID: +p4YFi+hRQq6Rua+ENaSeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="286330807"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Aug 2026 20:27:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrSHx-00000000BNR-03CP;
	Wed, 05 Aug 2026 03:27:29 +0000
Date: Wed, 05 Aug 2026 11:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [peterz-queue:locking/core 17/21]
 tools/arch/x86/include/asm/cpufeatures.h:228:68: error: '/*' within block
 comment
Message-ID: <202608051137.jZyZwBfl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   098a858bcdad1b6327e23274626c9fb36c5932fc
commit: 6cbc4e025e8c31cdc861ad9f2f53dc0eb290d586 [17/21] x86/paravirt: Use static_call() for the paravirt spinlock ops
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260805/202608051137.jZyZwBfl-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051137.jZyZwBfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051137.jZyZwBfl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/bounds.c:14:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/x86/include/asm/bitops.h:419:
   In file included from arch/x86/include/asm/arch_hweight.h:5:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: '/*' within block comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
         |                                                                    ^
   1 warning generated.
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:9:
   In file included from arch/x86/include/asm/nospec-branch.h:11:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: '/*' within block comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
         |                                                                    ^
   In file included from arch/x86/special.c:7:
>> tools/arch/x86/include/asm/cpufeatures.h:228:68: error: '/*' within block comment [-Werror,-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
         |                                                                    ^
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/objtool/arch/x86/special.o] Error 1
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [tools/build/Makefile.build:158: arch/x86] Error 2
   1 warning generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/prandom.h:13:
   In file included from include/linux/percpu.h:5:
   In file included from include/linux/alloc_tag.h:13:
   In file included from include/linux/cpumask.h:10:
   In file included from include/linux/atomic.h:7:
   In file included from arch/x86/include/asm/atomic.h:8:
   In file included from arch/x86/include/asm/cmpxchg.h:6:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: '/*' within block comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
         |                                                                    ^
   1 warning generated.
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:123: tools/objtool/objtool-in.o] Error 2
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:74: objtool] Error 2
   make[2]: *** [Makefile:1587: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +228 tools/arch/x86/include/asm/cpufeatures.h

   222	
   223	#define X86_FEATURE_VMMCALL		( 8*32+15) /* "vmmcall" Prefer VMMCALL to VMCALL */
   224	#define X86_FEATURE_XENPV		( 8*32+16) /* Xen paravirtual guest */
   225	#define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
   226	#define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
   227	#define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
 > 228	/* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   229	#define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* PV vcpu_is_preempted function */
   230	#define X86_FEATURE_TDX_GUEST		( 8*32+22) /* "tdx_guest" Intel Trust Domain Extensions Guest */
   231	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
