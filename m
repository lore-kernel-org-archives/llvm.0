Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404733B8D43;
	Sat,  6 Dec 2025 10:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765017116; cv=none; b=rR8uE2lbPbcHKBVqjButog1g4gMb85fOwI2PKKQAk5f4AJ5C/st2qEgHtrfpJryOYYC6YBBNkpHGgDslRjTyojWSC8DjuJibrGVhYPTPig9K5FjGNKvoYGY9b+nI/s/gr7y2UQiA/mGEZokC5U5HGNE73ha7SDr9L2sYOLAR1k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765017116; c=relaxed/simple;
	bh=96jtql0IyhQqrpPk2QzTSjo6t7boHnF/ijazIVoA0Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OgUvV9hXcWUnrVNRjiNwgXuOB9nH9u/gsEzZTh3Ae1KscSIQnKHa/yjpN5hjOlByYmit7XIUT/gVeUgMA8H/fB/a1lOXZcL5qNFVkVmlrPhPmLki/+5yJjF4STaf4sLhWPJfEzndtBIlfwcPM813lUE2d8owE6TkOOpPe/997X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMUR5rxH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMUR5rxH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765017115; x=1796553115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=96jtql0IyhQqrpPk2QzTSjo6t7boHnF/ijazIVoA0Fk=;
  b=bMUR5rxHJXQh70Ll1DML6Rj+fBmcALKmHSlmc2CQ5Q0DcEbCpZrjeZO5
   oxkk793IpvhaIgDnfn92b4DjGLsHq96p3EVTv68XOyURvOrcBxeuWKRZO
   hwQZI2zw6n1+Ewz66SCgJzvXWsFx3WXQPnYxN16QMm9rr+RjcQN8Z5G2R
   hPnhBmp0U2yunAF9t27uw81swXPBL0F7tnGkHBoEy3kQgb5dkLG9Kk0aM
   bvg7sOAaguYiusJgWaL9D3uzyiLdhSM+xzx/TyHxqmM9Xq8zng2siB057
   YY7iyPkkDWLnknZOLUdTSAA5CVosBAWTmO4V4bvxo9/w7pNhj+N7HcCzq
   g==;
X-CSE-ConnectionGUID: 1jy6sxQORAq0MyXWQ28lvg==
X-CSE-MsgGUID: u5H+DdOQQSmK84GeiufZPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67199892"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="67199892"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 02:31:54 -0800
X-CSE-ConnectionGUID: mGncExoiSbK5+Y5AHh3s4g==
X-CSE-MsgGUID: IlNlDdAORXedSffhWyYNnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195577425"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Dec 2025 02:31:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRpZu-00000000G5d-0Ias;
	Sat, 06 Dec 2025 10:31:50 +0000
Date: Sat, 6 Dec 2025 18:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:lockless-random-v2 4/5] drivers/char/random.c:570:1: error:
 instruction requires the following: RV64I Base Instruction Set
Message-ID: <202512061829.QOMtbpaE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git lockless-random-v2
head:   fb8e9bf37065a1be2dbea93f0325d087d5903226
commit: f9262c3f6085ab01d23f1bff483530df38d9ee42 [4/5] random: Use a lockless fast path for get_random_uXX()
config: riscv-randconfig-002-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061829.QOMtbpaE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061829.QOMtbpaE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061829.QOMtbpaE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/random.c:570:1: error: instruction requires the following: RV64I Base Instruction Set
     570 | DEFINE_BATCHED_ENTROPY(u8)
         | ^
   drivers/char/random.c:552:6: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (cmpxchg64_local(&batch->posgen, next - 1, next) != next - 1) {      \
         |             ^
   include/linux/atomic/atomic-instrumented.h:4998:2: note: expanded from macro 'cmpxchg64_local'
    4998 |         raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:399:29: note: expanded from macro 'raw_cmpxchg64_local'
     399 | #define raw_cmpxchg64_local arch_cmpxchg64_local
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:300:2: note: expanded from macro 'arch_cmpxchg64_local'
     300 |         arch_cmpxchg_relaxed((ptr), (o), (n));                          \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:267:20: note: expanded from macro 'arch_cmpxchg_relaxed'
     267 |                       SC_PREPEND(""), SC_APPEND(""),                    \
         |                                  ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         0:      lr.d a6, 0(a4)
         |                 ^
>> drivers/char/random.c:570:1: error: instruction requires the following: RV64I Base Instruction Set
     570 | DEFINE_BATCHED_ENTROPY(u8)
         | ^
   drivers/char/random.c:552:6: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (cmpxchg64_local(&batch->posgen, next - 1, next) != next - 1) {      \
         |             ^
   include/linux/atomic/atomic-instrumented.h:4998:2: note: expanded from macro 'cmpxchg64_local'
    4998 |         raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:399:29: note: expanded from macro 'raw_cmpxchg64_local'
     399 | #define raw_cmpxchg64_local arch_cmpxchg64_local
         |                             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_relaxed'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:242:3: note: expanded from macro '_arch_cmpxchg'
     242 |                 __arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,         \
         |                 ^
   arch/riscv/include/asm/cmpxchg.h:203:5: note: expanded from macro '__arch_cmpxchg'
     203 |                         "       sc" sc_sfx " %1, %z4, %2\n"             \
         |                          ^
   <inline asm>:3:2: note: instantiated into assembly here
       3 |         sc.d s1, a1, 0(a4)
         |         ^
   drivers/char/random.c:571:1: error: instruction requires the following: RV64I Base Instruction Set
     571 | DEFINE_BATCHED_ENTROPY(u16)
         | ^
   drivers/char/random.c:552:6: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (cmpxchg64_local(&batch->posgen, next - 1, next) != next - 1) {      \
         |             ^
   include/linux/atomic/atomic-instrumented.h:4998:2: note: expanded from macro 'cmpxchg64_local'
    4998 |         raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:399:29: note: expanded from macro 'raw_cmpxchg64_local'
     399 | #define raw_cmpxchg64_local arch_cmpxchg64_local
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:300:2: note: expanded from macro 'arch_cmpxchg64_local'
     300 |         arch_cmpxchg_relaxed((ptr), (o), (n));                          \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:267:20: note: expanded from macro 'arch_cmpxchg_relaxed'
     267 |                       SC_PREPEND(""), SC_APPEND(""),                    \
         |                                  ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         0:      lr.d a6, 0(a4)
         |                 ^
   drivers/char/random.c:571:1: error: instruction requires the following: RV64I Base Instruction Set
     571 | DEFINE_BATCHED_ENTROPY(u16)
         | ^
   drivers/char/random.c:552:6: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (cmpxchg64_local(&batch->posgen, next - 1, next) != next - 1) {      \
         |             ^
   include/linux/atomic/atomic-instrumented.h:4998:2: note: expanded from macro 'cmpxchg64_local'
    4998 |         raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:399:29: note: expanded from macro 'raw_cmpxchg64_local'
     399 | #define raw_cmpxchg64_local arch_cmpxchg64_local
         |                             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_relaxed'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:242:3: note: expanded from macro '_arch_cmpxchg'
     242 |                 __arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,         \
         |                 ^
   arch/riscv/include/asm/cmpxchg.h:203:5: note: expanded from macro '__arch_cmpxchg'
     203 |                         "       sc" sc_sfx " %1, %z4, %2\n"             \
         |                          ^
   <inline asm>:3:2: note: instantiated into assembly here
       3 |         sc.d s1, a1, 0(a4)
         |         ^
   drivers/char/random.c:572:1: error: instruction requires the following: RV64I Base Instruction Set
     572 | DEFINE_BATCHED_ENTROPY(u32)
         | ^
   drivers/char/random.c:552:6: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (cmpxchg64_local(&batch->posgen, next - 1, next) != next - 1) {      \
         |             ^
   include/linux/atomic/atomic-instrumented.h:4998:2: note: expanded from macro 'cmpxchg64_local'
    4998 |         raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:399:29: note: expanded from macro 'raw_cmpxchg64_local'
     399 | #define raw_cmpxchg64_local arch_cmpxchg64_local
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:300:2: note: expanded from macro 'arch_cmpxchg64_local'
     300 |         arch_cmpxchg_relaxed((ptr), (o), (n));                          \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:267:20: note: expanded from macro 'arch_cmpxchg_relaxed'
     267 |                       SC_PREPEND(""), SC_APPEND(""),                    \
         |                                  ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         0:      lr.d a6, 0(a4)
         |                 ^
   drivers/char/random.c:572:1: error: instruction requires the following: RV64I Base Instruction Set
     572 | DEFINE_BATCHED_ENTROPY(u32)
         | ^
   drivers/char/random.c:552:6: note: expanded from macro 'DEFINE_BATCHED_ENTROPY'
     552 |         if (cmpxchg64_local(&batch->posgen, next - 1, next) != next - 1) {      \
         |             ^
   include/linux/atomic/atomic-instrumented.h:4998:2: note: expanded from macro 'cmpxchg64_local'
    4998 |         raw_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
         |         ^


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
