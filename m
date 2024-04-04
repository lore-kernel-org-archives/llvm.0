Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5A12CD9C;
	Thu,  4 Apr 2024 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712252689; cv=none; b=qtoMlQ7DWqwZ/8E1J6VCaU0bouPa/t6Aqzs73bHRuegvlp4fAClQ1QKXqAcW4k2Ne7qv08wmfZaqF7Q3QvvQ0j12WSJXExs9s4j73BcSW3sf2VAag6E6LxIU3SKZ7s/Pwwq0nXn7LHycyevYQg+YFUrAaCOYVGl722LaouxoZPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712252689; c=relaxed/simple;
	bh=SQzfOmQi0NdISwOHgs7DDT/pGQWd1G0jgvx1eXnXfiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N46ZGqzzuyulS/O4TVUT+5gLUC/wi09pcm+MVW8b9dToBEeE3MhNucnZyNoUe1zIVXggvoRCmWgIEuv0SQrjtF3aqBxZ/JMy4GwvlhXsPuQVM4FPQCsEIF+wDoNUPasDVKX6IIF5+D1ecqvcsaJBwYNfLnrDDm72pUNTYSXgJ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdhWssl3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdhWssl3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2C2C43390;
	Thu,  4 Apr 2024 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712252688;
	bh=SQzfOmQi0NdISwOHgs7DDT/pGQWd1G0jgvx1eXnXfiM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=YdhWssl3Ew927YxdjcytJH490W4bhv16ZDFvbYBNq0SbKRr2vmaSphAekaNFqhIB4
	 xJp4rLtoPDEsd9q3FNIf8PXmvghmzS24hJtz0rpaa5gcUjAhiMHIy7r741tvHu9jI4
	 3HN+ee+TheC/S4Fuc2ni0lSlxOpapFwK5WOOuRKp+w3vOOOeF4KpzbQmAXU3QFD1UW
	 7JSZSrN5xe6O4qihuTrim0GkCWpkzuZ8Xc5IlzDX/xvUEf67OsX5uozYnFV9GGMob9
	 mfe4INdRmQ19txHBk1s90Y+5Epky5wH9tlZZ1tHtB6ztXOZdMEvP428DPge/UGrcWU
	 Q9V7FYGsnAYnw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 341A5CE0D0C; Thu,  4 Apr 2024 10:44:48 -0700 (PDT)
Date: Thu, 4 Apr 2024 10:44:48 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2524/3504] kernel/locking/rtmutex.c:218:9:
 error: incompatible pointer to integer conversion passing 'typeof
 (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type
 'uintptr_t' (aka 'unsigned long')
Message-ID: <302e5ce2-5a65-4e07-8ca8-cced83e9af5b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202404040526.GVzaL2io-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404040526.GVzaL2io-lkp@intel.com>

On Thu, Apr 04, 2024 at 05:13:20AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
> commit: df35ee400e06b23ecd44fdb66451a5343932f834 [2524/3504] riscv: Emulate one-byte and two-byte cmpxchg
> config: riscv-nommu_virt_defconfig (https://download.01.org/0day-ci/archive/20240404/202404040526.GVzaL2io-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040526.GVzaL2io-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404040526.GVzaL2io-lkp@intel.com/

I believe that this is fixed by the following updated commit in -rcu:

27011e7159ef ("riscv: Emulate one-byte cmpxchg")

But please let me know if I am missing something.

							Thanx, Paul

> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/locking/rtmutex_api.c:9:
> >> kernel/locking/rtmutex.c:218:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
>      218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
>     4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
>      210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
>       65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
>          |                             ^
>    arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
>      264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      265 |                                         _o_, _n_, sizeof(*(ptr)));      \
>          |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:225:48: note: expanded from macro '__cmpxchg_acquire'
>      225 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                                                              ^~~~~
>    include/linux/cmpxchg-emu.h:13:52: note: passing argument to parameter 'old' here
>       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
>          |                                                    ^
>    In file included from kernel/locking/rtmutex_api.c:9:
> >> kernel/locking/rtmutex.c:218:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
>      218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
>     4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
>      210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
>       65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
>          |                             ^
>    arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
>      264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      265 |                                         _o_, _n_, sizeof(*(ptr)));      \
>          |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:225:55: note: expanded from macro '__cmpxchg_acquire'
>      225 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                                                                     ^~~~~
>    include/linux/cmpxchg-emu.h:13:67: note: passing argument to parameter 'new' here
>       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
>          |                                                                   ^
>    In file included from kernel/locking/rtmutex_api.c:9:
> >> kernel/locking/rtmutex.c:218:9: error: incompatible integer to pointer conversion assigning to 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') from 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
>      218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
>     4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
>      210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
>       65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
>          |                             ^
>    arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
>      264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      265 |                                         _o_, _n_, sizeof(*(ptr)));      \
>          |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:225:9: note: expanded from macro '__cmpxchg_acquire'
>      225 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from kernel/locking/rtmutex_api.c:9:
> >> kernel/locking/rtmutex.c:218:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
>      218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
>     4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
>      210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
>       65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
>          |                             ^
>    arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
>      264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      265 |                                         _o_, _n_, sizeof(*(ptr)));      \
>          |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:229:50: note: expanded from macro '__cmpxchg_acquire'
>      229 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>          |                                                                ^~~~~
>    include/linux/cmpxchg-emu.h:14:54: note: passing argument to parameter 'old' here
>       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
>          |                                                      ^
>    In file included from kernel/locking/rtmutex_api.c:9:
> >> kernel/locking/rtmutex.c:218:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
>      218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
>     4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
>      210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
>       65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
>          |                             ^
>    arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
>      264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      265 |                                         _o_, _n_, sizeof(*(ptr)));      \
>          |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:229:57: note: expanded from macro '__cmpxchg_acquire'
>      229 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>          |                                                                       ^~~~~
>    include/linux/cmpxchg-emu.h:14:69: note: passing argument to parameter 'new' here
>       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
>          |                                                                     ^
>    In file included from kernel/locking/rtmutex_api.c:9:
> >> kernel/locking/rtmutex.c:218:9: error: incompatible integer to pointer conversion assigning to 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') from 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
>      218 |         return try_cmpxchg_acquire(&lock->owner, &old, new);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4889:2: note: expanded from macro 'try_cmpxchg_acquire'
>     4889 |         raw_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:210:9: note: expanded from macro 'raw_try_cmpxchg_acquire'
>      210 |         ___r = raw_cmpxchg_acquire((_ptr), ___o, (_new)); \
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:65:29: note: expanded from macro 'raw_cmpxchg_acquire'
>       65 | #define raw_cmpxchg_acquire arch_cmpxchg_acquire
>          |                             ^
>    arch/riscv/include/asm/cmpxchg.h:264:23: note: expanded from macro 'arch_cmpxchg_acquire'
>      264 |         (__typeof__(*(ptr))) __cmpxchg_acquire((ptr),                   \
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      265 |                                         _o_, _n_, sizeof(*(ptr)));      \
>          |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:229:9: note: expanded from macro '__cmpxchg_acquire'
>      229 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>          |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from kernel/locking/rtmutex_api.c:9:
>    kernel/locking/rtmutex.c:230:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
>      230 |         return try_cmpxchg_release(&lock->owner, &old, new);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4899:2: note: expanded from macro 'try_cmpxchg_release'
>     4899 |         raw_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:228:9: note: expanded from macro 'raw_try_cmpxchg_release'
>      228 |         ___r = raw_cmpxchg_release((_ptr), ___o, (_new)); \
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
>       77 | #define raw_cmpxchg_release arch_cmpxchg_release
>          |                             ^
>    arch/riscv/include/asm/cmpxchg.h:316:23: note: expanded from macro 'arch_cmpxchg_release'
>      316 |         (__typeof__(*(ptr))) __cmpxchg_release((ptr),                   \
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      317 |                                         _o_, _n_, sizeof(*(ptr)));      \
>          |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:277:48: note: expanded from macro '__cmpxchg_release'
>      277 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                                                              ^~~~~
>    include/linux/cmpxchg-emu.h:13:52: note: passing argument to parameter 'old' here
>       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
>          |                                                    ^
>    In file included from kernel/locking/rtmutex_api.c:9:
>    kernel/locking/rtmutex.c:230:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
>      230 |         return try_cmpxchg_release(&lock->owner, &old, new);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4899:2: note: expanded from macro 'try_cmpxchg_release'
>     4899 |         raw_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:228:9: note: expanded from macro 'raw_try_cmpxchg_release'
>      228 |         ___r = raw_cmpxchg_release((_ptr), ___o, (_new)); \
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
>       77 | #define raw_cmpxchg_release arch_cmpxchg_release
>          |                             ^
>    arch/riscv/include/asm/cmpxchg.h:316:23: note: expanded from macro 'arch_cmpxchg_release'
>      316 |         (__typeof__(*(ptr))) __cmpxchg_release((ptr),                   \
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      317 |                                         _o_, _n_, sizeof(*(ptr)));      \
>          |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:277:55: note: expanded from macro '__cmpxchg_release'
>      277 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                                                                     ^~~~~
>    include/linux/cmpxchg-emu.h:13:67: note: passing argument to parameter 'new' here
>       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
>          |                                                                   ^
>    In file included from kernel/locking/rtmutex_api.c:9:
>    kernel/locking/rtmutex.c:230:9: error: incompatible integer to pointer conversion assigning to 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') from 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
>      230 |         return try_cmpxchg_release(&lock->owner, &old, new);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4899:2: note: expanded from macro 'try_cmpxchg_release'
>     4899 |         raw_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:228:9: note: expanded from macro 'raw_try_cmpxchg_release'
>      228 |         ___r = raw_cmpxchg_release((_ptr), ___o, (_new)); \
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
>       77 | #define raw_cmpxchg_release arch_cmpxchg_release
>          |                             ^
>    arch/riscv/include/asm/cmpxchg.h:316:23: note: expanded from macro 'arch_cmpxchg_release'
>      316 |         (__typeof__(*(ptr))) __cmpxchg_release((ptr),                   \
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      317 |                                         _o_, _n_, sizeof(*(ptr)));      \
>          |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:277:9: note: expanded from macro '__cmpxchg_release'
>      277 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from kernel/locking/rtmutex_api.c:9:
>    kernel/locking/rtmutex.c:230:9: error: incompatible pointer to integer conversion passing 'typeof (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
>      230 |         return try_cmpxchg_release(&lock->owner, &old, new);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4899:2: note: expanded from macro 'try_cmpxchg_release'
>     4899 |         raw_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:228:9: note: expanded from macro 'raw_try_cmpxchg_release'
>      228 |         ___r = raw_cmpxchg_release((_ptr), ___o, (_new)); \
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
>       77 | #define raw_cmpxchg_release arch_cmpxchg_release
> 
> 
> vim +218 kernel/locking/rtmutex.c
> 
> 23f78d4a03c53c kernel/rtmutex.c         Ingo Molnar               2006-06-27  208  
> bd197234b0a616 kernel/rtmutex.c         Thomas Gleixner           2007-06-17  209  /*
> cede88418b385b kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2015-02-25  210   * We can speed up the acquire/release, if there's no debugging state to be
> cede88418b385b kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2015-02-25  211   * set up.
> bd197234b0a616 kernel/rtmutex.c         Thomas Gleixner           2007-06-17  212   */
> cede88418b385b kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2015-02-25  213  #ifndef CONFIG_DEBUG_RT_MUTEXES
> 830e6acc8a1caf kernel/locking/rtmutex.c Peter Zijlstra            2021-08-15  214  static __always_inline bool rt_mutex_cmpxchg_acquire(struct rt_mutex_base *lock,
> 785159301bedea kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2021-08-15  215  						     struct task_struct *old,
> 785159301bedea kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2021-08-15  216  						     struct task_struct *new)
> 785159301bedea kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2021-08-15  217  {
> 709e0b62869f62 kernel/locking/rtmutex.c Thomas Gleixner           2021-08-15 @218  	return try_cmpxchg_acquire(&lock->owner, &old, new);
> 785159301bedea kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2021-08-15  219  }
> 785159301bedea kernel/locking/rtmutex.c Sebastian Andrzej Siewior 2021-08-15  220  
> 
> :::::: The code at line 218 was first introduced by commit
> :::::: 709e0b62869f625afd18edd79f190c38cb39dfb2 locking/rtmutex: Switch to from cmpxchg_*() to try_cmpxchg_*()
> 
> :::::: TO: Thomas Gleixner <tglx@linutronix.de>
> :::::: CC: Ingo Molnar <mingo@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
