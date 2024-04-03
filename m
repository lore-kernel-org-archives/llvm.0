Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849AE2BB02;
	Wed,  3 Apr 2024 21:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712178857; cv=none; b=i14Wdx4UVbRZcLNZ1j/V+HrFWd3ANJ3IaFsv54g3m/ckLWhhKAm9QLPcEIiaE97bO1+VaVJQSJtr0ClZC62kgp0N6uruvHnAugegR41E0QHes22tUbuoxc/aNEDVjv9V/YN55GZDGtl9VsSTDeCPLSxEzsv074sUMszU7GQ/e4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712178857; c=relaxed/simple;
	bh=7U4GiAot20x+hk7iK7iK9G0gRNDJmXo0/gZEDdyKTLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oPC1eNGDPLVtzy3S1lzRPo29J9ot+eXgraqZPGdnLonmp1QOyUa3zPCciYWCSo4hxD+pJTwgtcdhPnXRmyKNYjD71DUkQyNZOZoJ/pIRjCtGgA2/ORcVd8VFrRA9aghgn+OTj+bjFgzvkOQrAJzKOxxuax56zgdy7g1viHPsiGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHELJtXd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHELJtXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712178856; x=1743714856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7U4GiAot20x+hk7iK7iK9G0gRNDJmXo0/gZEDdyKTLA=;
  b=kHELJtXdUJ51Qj4RozMXGbTdnTvRiwciOTw2T9ntYQ6G26A+Hp6zm1JK
   EgLiSvEsAgTVPcfc7iUYLGFzKfTwvdQW58JQX1Z+94xE67Cc2J7342V5b
   G+JHiVX4LALk+Ca4C5GBcVeyhIKPQCG9XsLmA13OSpC58JK2L4IUAKiIV
   B/D2kMa+PICPq9lPacGkq66mrG3UMXqpomAuaSoAYuyam3GLk89Rv49Lm
   M677o+CcsoM6ZeDkwA6fyIvJLRrfNO/M3TiU5+4ipK9IgzSr+Wd381WtQ
   n9ARdw4cFQr4pqIse92O51VRZlUjkAbiw6ow/B2OC93jzoQOkOfbxgcME
   A==;
X-CSE-ConnectionGUID: 8BvJm0QFQt+NbbWMTF+stA==
X-CSE-MsgGUID: Z6yIJWXsSwG9BGlakCkj3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="10405497"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="10405497"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 14:14:14 -0700
X-CSE-ConnectionGUID: t0sq+c2ZQquPfwd6L+m96Q==
X-CSE-MsgGUID: O+f5/54JQzWHXm9g2T28DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="23061760"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Apr 2024 14:14:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs7vu-0000F0-2q;
	Wed, 03 Apr 2024 21:14:10 +0000
Date: Thu, 4 Apr 2024 05:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2524/3504] kernel/locking/rtmutex.c:218:9: error:
 incompatible pointer to integer conversion passing 'typeof
 (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type
 'uintptr_t' (aka 'unsigned long')
Message-ID: <202404040526.GVzaL2io-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
commit: df35ee400e06b23ecd44fdb66451a5343932f834 [2524/3504] riscv: Emulate one-byte and two-byte cmpxchg
config: riscv-nommu_virt_defconfig (https://download.01.org/0day-ci/archive/20240404/202404040526.GVzaL2io-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040526.GVzaL2io-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040526.GVzaL2io-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/locking/rtmutex_api.c:9:
>> kernel/locking/rtmutex.c:218:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
     218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
    4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
     210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
      65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
     264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     265 |                                         _o_, _n_, sizeof(*(ptr)));      \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:225:48: note: expanded from macro '__cmpxchg_acquire'
     225 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                              ^~~~~
   include/linux/cmpxchg-emu.h:13:52: note: passing argument to parameter 'old' here
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                                    ^
   In file included from kernel/locking/rtmutex_api.c:9:
>> kernel/locking/rtmutex.c:218:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
     218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
    4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
     210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
      65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
     264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     265 |                                         _o_, _n_, sizeof(*(ptr)));      \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:225:55: note: expanded from macro '__cmpxchg_acquire'
     225 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                                     ^~~~~
   include/linux/cmpxchg-emu.h:13:67: note: passing argument to parameter 'new' here
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                                                   ^
   In file included from kernel/locking/rtmutex_api.c:9:
>> kernel/locking/rtmutex.c:218:9: error: incompatible integer to pointer conversion assigning to 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') from 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
     218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
    4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
     210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
      65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
     264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     265 |                                         _o_, _n_, sizeof(*(ptr)));      \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:225:9: note: expanded from macro '__cmpxchg_acquire'
     225 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/locking/rtmutex_api.c:9:
>> kernel/locking/rtmutex.c:218:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
     218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
    4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
     210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
      65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
     264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     265 |                                         _o_, _n_, sizeof(*(ptr)));      \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:229:50: note: expanded from macro '__cmpxchg_acquire'
     229 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                ^~~~~
   include/linux/cmpxchg-emu.h:14:54: note: passing argument to parameter 'old' here
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                                      ^
   In file included from kernel/locking/rtmutex_api.c:9:
>> kernel/locking/rtmutex.c:218:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
     218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
    4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
     210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
      65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
     264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     265 |                                         _o_, _n_, sizeof(*(ptr)));      \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:229:57: note: expanded from macro '__cmpxchg_acquire'
     229 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                       ^~~~~
   include/linux/cmpxchg-emu.h:14:69: note: passing argument to parameter 'new' here
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                                                     ^
   In file included from kernel/locking/rtmutex_api.c:9:
>> kernel/locking/rtmutex.c:218:9: error: incompatible integer to pointer conversion assigning to 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') from 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
     218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
    4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
     210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
      65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
     264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     265 |                                         _o_, _n_, sizeof(*(ptr)));      \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:229:9: note: expanded from macro '__cmpxchg_acquire'
     229 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/locking/rtmutex_api.c:9:
   kernel/locking/rtmutex.c:230:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
     230 |         return try_cmpxchg_release(&lock->owner, &old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4899:2: note: expanded from macro 'try_cmpxchg_release'
    4899 |         raw_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:228:9: note: expanded from macro 'raw_try_cmpxchg_release'
     228 |         ___r = raw_cmpxchg_release((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:316:23: note: expanded from macro 'arch_cmpxchg_release'
     316 |         (__typeof__(*(ptr))) __cmpxchg_release((ptr),                   \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                                         _o_, _n_, sizeof(*(ptr)));      \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:277:48: note: expanded from macro '__cmpxchg_release'
     277 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                              ^~~~~
   include/linux/cmpxchg-emu.h:13:52: note: passing argument to parameter 'old' here
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                                    ^
   In file included from kernel/locking/rtmutex_api.c:9:
   kernel/locking/rtmutex.c:230:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
     230 |         return try_cmpxchg_release(&lock->owner, &old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4899:2: note: expanded from macro 'try_cmpxchg_release'
    4899 |         raw_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:228:9: note: expanded from macro 'raw_try_cmpxchg_release'
     228 |         ___r = raw_cmpxchg_release((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:316:23: note: expanded from macro 'arch_cmpxchg_release'
     316 |         (__typeof__(*(ptr))) __cmpxchg_release((ptr),                   \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                                         _o_, _n_, sizeof(*(ptr)));      \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:277:55: note: expanded from macro '__cmpxchg_release'
     277 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                                     ^~~~~
   include/linux/cmpxchg-emu.h:13:67: note: passing argument to parameter 'new' here
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                                                   ^
   In file included from kernel/locking/rtmutex_api.c:9:
   kernel/locking/rtmutex.c:230:9: error: incompatible integer to pointer conversion assigning to 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') from 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
     230 |         return try_cmpxchg_release(&lock->owner, &old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4899:2: note: expanded from macro 'try_cmpxchg_release'
    4899 |         raw_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:228:9: note: expanded from macro 'raw_try_cmpxchg_release'
     228 |         ___r = raw_cmpxchg_release((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:316:23: note: expanded from macro 'arch_cmpxchg_release'
     316 |         (__typeof__(*(ptr))) __cmpxchg_release((ptr),                   \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                                         _o_, _n_, sizeof(*(ptr)));      \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:277:9: note: expanded from macro '__cmpxchg_release'
     277 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/locking/rtmutex_api.c:9:
   kernel/locking/rtmutex.c:230:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
     230 |         return try_cmpxchg_release(&lock->owner, &old, new);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4899:2: note: expanded from macro 'try_cmpxchg_release'
    4899 |         raw_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:228:9: note: expanded from macro 'raw_try_cmpxchg_release'
     228 |         ___r = raw_cmpxchg_release((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release


vim +218 kernel/locking/rtmutex.c

23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  208  
bd197234b0a616 kernel/rtmutex.c         Thomas Gleixner           2007-06-17  209  /*
cede88418b385b kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2015-02-25  210   * We can speed up the acquire/release, if there's no debugging state to be
cede88418b385b kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2015-02-25  211   * set up.
bd197234b0a616 kernel/rtmutex.c         Thomas Gleixner           2007-06-17  212   */
cede88418b385b kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2015-02-25  213  #ifndef CONFIG_DEBUG_RT_MUTEXES
830e6acc8a1caf kernel/locking/rtmutex.c Peter Zijlstra            2021-08-15  214  static __always_inline bool rt_mutex_cmpxchg_acquire(struct rt_mutex_base *lock,
785159301bedea kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2021-08-15  215  						     struct task_struct *old,
785159301bedea kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2021-08-15  216  						     struct task_struct *new)
785159301bedea kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2021-08-15  217  {
709e0b62869f62 kernel/locking/rtmutex.c Thomas Gleixner           2021-08-15 @218  	return try_cmpxchg_acquire(&lock->owner, &old, new);
785159301bedea kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2021-08-15  219  }
785159301bedea kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2021-08-15  220  

:::::: The code at line 218 was first introduced by commit
:::::: 709e0b62869f625afd18edd79f190c38cb39dfb2 locking/rtmutex: Switch to from cmpxchg_*() to try_cmpxchg_*()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
