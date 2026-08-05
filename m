Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E9223DD4;
	Wed,  5 Aug 2026 00:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785890212; cv=none; b=hdJHFjTTPgbZxt7GdF2GAqm9QhXihg5y0Bn73mHXh8y7I2XoE6G8w4w7hf8cGEaXrMST64U9y12uJSSfwH4OtBrL86oEKGEB32NgB/Kx7/8upD4c21Eoab6GsFjQPJo2YOj8xomyKL/SetG5pj+QZPH33L/sJ/Vwvv+KlYmGqQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785890212; c=relaxed/simple;
	bh=cgZKY886rFqEDogRSMisiJ9kBtk3UNliCZNFpF+shl0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iR7RqM/rDQq4G96O1dXfbe90adFfmsnpfU3GtJoD6GlCgtQV5ocR1rrJOKIbn2HKKjb9ZhmFy/SgbPtZYrBJuPwHLLSWvfnmHobKSQhxNrpWbmFI9aV4b+pV4rmZVqDQ6+pCDF0hVsEUTQOHU9bkZdtrSZ9B1zAYgXJM8a3Xn4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAmjN3un; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAmjN3un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785890210; x=1817426210;
  h=date:from:to:cc:subject:message-id;
  bh=cgZKY886rFqEDogRSMisiJ9kBtk3UNliCZNFpF+shl0=;
  b=bAmjN3unVDur3xdN0tQxIDWEh6jblf1bBnfSWYCRE2xn0NWhFKKAubTD
   b71sQCZ8uWjDgcGjnj+obU6VY1raN3zc3G75GevLY6U5Ur4+xTD+of+5W
   W7BIUhB3knD8IwKBmuUj/0zdIgKazTilIcguOzFm2VHB0yxdfwWjA1wRu
   VrXDPK5cbo3tfjZNxjJ5TQM+4QmypQRunVQl76lG9Z4kXrH4KRObx+A4A
   VQLc/a5urGJ7sJU7SEK58gSSOq/7fHSadU1ZI06YVK4OqKvUtCW461DMP
   DLsfowZha3ygksSMGxfIW8P4nH2LCdfj/uP1SvJNd2xcKgTeNg9vi7Ghp
   Q==;
X-CSE-ConnectionGUID: 7PeZTIsGSIm/7yx7OMy4fQ==
X-CSE-MsgGUID: jPqX8YFQROmrEyHX4vNUqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90265910"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="90265910"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 17:36:47 -0700
X-CSE-ConnectionGUID: cdfK2eQQSz6Ya2Zet2ojSw==
X-CSE-MsgGUID: edkEqOHqQxaLPAoIzD/Tew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="261717217"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Aug 2026 17:36:45 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrPch-000000004JE-38nB;
	Wed, 05 Aug 2026 00:36:43 +0000
Date: Wed, 05 Aug 2026 02:35:57 +0200
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [peterz-queue:locking/core 17/21]
 tools/arch/x86/include/asm/cpufeatures.h:228:68: error: '/*' within block
 comment
Message-ID: <202608050236.U2vlcV6b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   098a858bcdad1b6327e23274626c9fb36c5932fc
commit: 6cbc4e025e8c31cdc861ad9f2f53dc0eb290d586 [17/21] x86/paravirt: Use static_call() for the paravirt spinlock ops
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260805/202608050236.U2vlcV6b-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050236.U2vlcV6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050236.U2vlcV6b-lkp@intel.com/

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
   1 warning generated.
   In file included from arch/x86/special.c:7:
>> tools/arch/x86/include/asm/cpufeatures.h:228:68: error: '/*' within block comment [-Werror,-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
         |                                                                    ^
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/objtool/arch/x86/special.o] Error 1
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
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [tools/build/Makefile.build:158: arch/x86] Error 2
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
