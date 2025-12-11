Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A0119E82A;
	Thu, 11 Dec 2025 23:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765497120; cv=none; b=uE/EWB8teZhJK62SlSM8TztWwKe3kYI2ZehJBuZXyXR0FM7dn00mOguc+6mOVSTjyK/vx04sasb1waQ9KCdKNioh3H0qnmPMbwF+UHrUGRtT7fi1odXQ/ef9WBYPXKaLlMVabEsEGYvodxLgThT2h+1WbdZxt98MVTk/p/w5r4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765497120; c=relaxed/simple;
	bh=VCFwbRUCDvRokIw2WOL55OQOgm3jxsYRa4kC9k1fAOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ih6z0c8EMaCFfgJLXESsRiOvmola8AKk3xOljEBJt5kq9RbsZAdNWMbil7Tg5E/zjXfWbo+0zaWMt8v4qebCxxCJmQWTEfrCpCBgcrPQ523HZqx/TKnMPJ+x86FTKHbuRv2cwT73E0k/aMECkvoo4Vu+NwADxomRadS/0p/L0NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvf8Nxsf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvf8Nxsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765497119; x=1797033119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VCFwbRUCDvRokIw2WOL55OQOgm3jxsYRa4kC9k1fAOU=;
  b=bvf8NxsfK2Edu10jrLXfCauugJ+XLdlleG6V8j4TvfYQR2P3k3M+op6Q
   foz5gWW26CYTCP/qLOLG52dKNac0VuHJxk5hZ4MpgJ5XT2HR5YQX8kz8O
   FPYMaO9+TGePLCegoYuMHK1pGCg31Zv3OVHDMVoDdmUDtvNowrngJqIes
   L/Vo0xecJepFoL+uQu6a6g1ncwzna95A1YxNoNYlPOs1FiXVm6fHBOP0t
   OE0UgRaPe2Hat4GiHT4fuh4H066LHFtpcgz68tTmfzyhVDqy+buUjqX7m
   pZ+AL0GmY7fK/cFNh1n2rvJzcaZ3e812I3H36B4q8EvCKEqgo/Ssd2o6N
   w==;
X-CSE-ConnectionGUID: Qu8B9mBMQu2h/g7KY1F2kw==
X-CSE-MsgGUID: R7MJjnwySZKDjiOu0Zg6pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67536568"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67536568"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:51:57 -0800
X-CSE-ConnectionGUID: gQEkktIBToqzGLqCV8zQRw==
X-CSE-MsgGUID: CEy00cUERgaGqWeLrFsxhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196983570"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2025 15:51:56 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqRs-000000005Cx-2gYr;
	Thu, 11 Dec 2025 23:51:52 +0000
Date: Fri, 12 Dec 2025 07:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:lockless-random-v2 6/7] drivers/char/random.c:570:1: error:
 indirection requires pointer operand ('typeof (next)' (aka 'unsigned long
 long') invalid)
Message-ID: <202512120716.8CQlCuxY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git lockless-random-v2
head:   629b369505e73286d416f91816305d3e16d5c3cf
commit: c638e24f6766140b08604e0f43615ca7d636138d [6/7] random: Use a lockless fast path for get_random_uXX()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251212/202512120716.8CQlCuxY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120716.8CQlCuxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120716.8CQlCuxY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/random.c:570:1: error: indirection requires pointer operand ('typeof (next)' (aka 'unsigned long long') invalid)
     570 | DEFINE_BATCHED_ENTROPY(u8)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:7: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:42: note: expanded from macro 'try_cmpxchg64_local'
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                                                 ^~~~~~~~~~
>> drivers/char/random.c:570:1: error: incompatible integer to pointer conversion passing 'typeof (next)' (aka 'unsigned long long') to parameter of type 'const volatile void *' [-Wint-conversion]
     570 | DEFINE_BATCHED_ENTROPY(u8)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:7: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:24: note: expanded from macro 'try_cmpxchg64_local'
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                               ^~~~~~~~~
   include/linux/instrumented.h:52:72: note: passing argument to parameter 'v' here
      52 | static __always_inline void instrument_read_write(const volatile void *v, size_t size)
         |                                                                        ^
>> drivers/char/random.c:570:1: error: incompatible integer to pointer conversion initializing 'typeof (*(__ai_ptr)) *' (aka 'unsigned long long *') with an expression of type 'typeof (next)' (aka 'unsigned long long'); take the address with & [-Wint-conversion]
     570 | DEFINE_BATCHED_ENTROPY(u8)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:7: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5031:2: note: expanded from macro 'try_cmpxchg64_local'
    5031 |         raw_try_cmpxchg64_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:406:19: note: expanded from macro 'raw_try_cmpxchg64_local'
     406 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                          ^       ~~~~~~~
   drivers/char/random.c:571:1: error: indirection requires pointer operand ('typeof (next)' (aka 'unsigned long long') invalid)
     571 | DEFINE_BATCHED_ENTROPY(u16)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:7: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:42: note: expanded from macro 'try_cmpxchg64_local'
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                                                 ^~~~~~~~~~
   drivers/char/random.c:571:1: error: incompatible integer to pointer conversion passing 'typeof (next)' (aka 'unsigned long long') to parameter of type 'const volatile void *' [-Wint-conversion]
     571 | DEFINE_BATCHED_ENTROPY(u16)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:7: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:24: note: expanded from macro 'try_cmpxchg64_local'
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                               ^~~~~~~~~
   include/linux/instrumented.h:52:72: note: passing argument to parameter 'v' here
      52 | static __always_inline void instrument_read_write(const volatile void *v, size_t size)
         |                                                                        ^
   drivers/char/random.c:571:1: error: incompatible integer to pointer conversion initializing 'typeof (*(__ai_ptr)) *' (aka 'unsigned long long *') with an expression of type 'typeof (next)' (aka 'unsigned long long'); take the address with & [-Wint-conversion]
     571 | DEFINE_BATCHED_ENTROPY(u16)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:7: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5031:2: note: expanded from macro 'try_cmpxchg64_local'
    5031 |         raw_try_cmpxchg64_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:406:19: note: expanded from macro 'raw_try_cmpxchg64_local'
     406 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                          ^       ~~~~~~~
   drivers/char/random.c:572:1: error: indirection requires pointer operand ('typeof (next)' (aka 'unsigned long long') invalid)
     572 | DEFINE_BATCHED_ENTROPY(u32)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:7: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:42: note: expanded from macro 'try_cmpxchg64_local'
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                                                 ^~~~~~~~~~
   drivers/char/random.c:572:1: error: incompatible integer to pointer conversion passing 'typeof (next)' (aka 'unsigned long long') to parameter of type 'const volatile void *' [-Wint-conversion]
     572 | DEFINE_BATCHED_ENTROPY(u32)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:7: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:24: note: expanded from macro 'try_cmpxchg64_local'
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                               ^~~~~~~~~
   include/linux/instrumented.h:52:72: note: passing argument to parameter 'v' here
      52 | static __always_inline void instrument_read_write(const volatile void *v, size_t size)
         |                                                                        ^
   drivers/char/random.c:572:1: error: incompatible integer to pointer conversion initializing 'typeof (*(__ai_ptr)) *' (aka 'unsigned long long *') with an expression of type 'typeof (next)' (aka 'unsigned long long'); take the address with & [-Wint-conversion]
     572 | DEFINE_BATCHED_ENTROPY(u32)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:7: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5031:2: note: expanded from macro 'try_cmpxchg64_local'
    5031 |         raw_try_cmpxchg64_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:406:19: note: expanded from macro 'raw_try_cmpxchg64_local'
     406 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                          ^       ~~~~~~~
   drivers/char/random.c:573:1: error: indirection requires pointer operand ('typeof (next)' (aka 'unsigned long long') invalid)
     573 | DEFINE_BATCHED_ENTROPY(u64)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:7: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:42: note: expanded from macro 'try_cmpxchg64_local'
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                                                 ^~~~~~~~~~
   drivers/char/random.c:573:1: error: incompatible integer to pointer conversion passing 'typeof (next)' (aka 'unsigned long long') to parameter of type 'const volatile void *' [-Wint-conversion]
     573 | DEFINE_BATCHED_ENTROPY(u64)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:552:7: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (!try_cmpxchg64_local(&batch->posgen, next, next + 1)) {             \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5030:24: note: expanded from macro 'try_cmpxchg64_local'
    5030 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                               ^~~~~~~~~
   include/linux/instrumented.h:52:72: note: passing argument to parameter 'v' here
      52 | static __always_inline void instrument_read_write(const volatile void *v, size_t size)
         |                                                                        ^
   drivers/char/random.c:573:1: error: incompatible integer to pointer conversion initializing 'typeof (*(__ai_ptr)) *' (aka 'unsigned long long *') with an expression of type 'typeof (next)' (aka 'unsigned long long'); take the address with & [-Wint-conversion]
     573 | DEFINE_BATCHED_ENTROPY(u64)


vim +570 drivers/char/random.c

3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  569  
585cd5fe9f7378 Jason A. Donenfeld 2022-09-28 @570  DEFINE_BATCHED_ENTROPY(u8)
a890d1c657ecba Jason A. Donenfeld 2022-10-05  571  DEFINE_BATCHED_ENTROPY(u16)
a890d1c657ecba Jason A. Donenfeld 2022-10-05  572  DEFINE_BATCHED_ENTROPY(u32)
a890d1c657ecba Jason A. Donenfeld 2022-10-05  573  DEFINE_BATCHED_ENTROPY(u64)
3655adc7089da4 Jason A. Donenfeld 2022-02-11  574  

:::::: The code at line 570 was first introduced by commit
:::::: 585cd5fe9f7378601b1d4915ad6e9088333b5e5e random: add 8-bit and 16-bit batches

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
