Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9489133E35B;
	Wed, 20 May 2026 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259327; cv=none; b=Ycr4QgBg5578YWpELRqrngAEwgSsOUwLHNpwJgYyanMwdtmmoyoGLWsIfIOhJ6EpMBOElqKmLHjFg9/nbZzWZ2kJy5nRws/CTmfpn/lYSbvYT8KZFkQUnqPxemm23j+KCM6ak4TQNMHpmOxK2oXUa3m0GVgRCOjbYRkXbR5Y2fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259327; c=relaxed/simple;
	bh=ID/U+6v5WnI6rVl/Q3QR+J/OplNHmpAV9aP7cRIUFQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ADHCvsGaKqCIMS7dhtsa2ktiQCv7vwhg5PcregZZ/X3zyRPpg88zseCpJpqLO7D1M8wjSa7joJko0rJirv0BD3ciezOAgTxQ45dKIlCiYs217viLyQVoYX1x5El4ucrj+9GnA37Ew9Ma7UjEEclWFf6OWfXqr9nMaQUSsxwpl5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tzxjnf2X; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tzxjnf2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779259323; x=1810795323;
  h=date:from:to:cc:subject:message-id;
  bh=ID/U+6v5WnI6rVl/Q3QR+J/OplNHmpAV9aP7cRIUFQs=;
  b=Tzxjnf2XPRx2YYtyBtGLR13ewH4i+c8fstUKr6mtQkDaF2vCHIaIRzxb
   hUUfTX2F8JRvgVZDnOpO3qfxe3pwlqR8nD8L+cNbrrxcw8nqTRnwf+wm2
   tdsjFgW7hL9CKv2AZQSRqA79Lq7hROL4Sm8zQARvXFkTPwVg/EXlCyflh
   1ZXmGWX5YqrLsUxz2fAX+Eap7K6OQ2yvwJtSzboNoKhzqR0mtlLSoe2Bv
   1pAj9cpAGzm2OnlSARA3QUFLukkUbqqjFsMi+Qh9ibbZf2MnMt9gWg8c/
   wENJuro1FqfJ+kk1GbYoACeEtP62M6Q5zXoGa2VEC27oI6G3R1szv/MSK
   Q==;
X-CSE-ConnectionGUID: 9Sr0kHXOSyO3e79Us17T+w==
X-CSE-MsgGUID: EiCb6LNBTs6rK42yoDnPjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80052823"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80052823"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:41:49 -0700
X-CSE-ConnectionGUID: 7FXzUrRvQjKHCUJ4BVc75w==
X-CSE-MsgGUID: RpO7VhMISNWvM7Q4mwzaGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="240304534"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 May 2026 23:41:48 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPacj-000000002ez-1es9;
	Wed, 20 May 2026 06:41:45 +0000
Date: Wed, 20 May 2026 14:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena_slab 63/63] kernel/bpf/arena.c:963:8: error:
 no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
Message-ID: <202605201413.XvzwsT4I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena_slab
head:   cb83f972bd005841d18f7bbff6e50d9bcbf0adf8
commit: cb83f972bd005841d18f7bbff6e50d9bcbf0adf8 [63/63] bpf,slab: Add slub-backed allocator for bpf_arena
config: loongarch-randconfig-002-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201413.XvzwsT4I-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201413.XvzwsT4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201413.XvzwsT4I-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/arena.c:963:8: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     963 |         slab->obj_exts = (unsigned long)uaddr32 | BIT_ULL(63);
         |               ^~~~~~~~
         |               objects
   kernel/bpf/../../mm/slab.h:49:15: note: 'objects' declared here
      49 |                                         unsigned objects:15;
         |                                                  ^
   kernel/bpf/arena.c:974:40: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
         |                                               objects
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:660:10: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^
   kernel/bpf/../../mm/slab.h:49:15: note: 'objects' declared here
      49 |                                         unsigned objects:15;
         |                                                  ^
>> kernel/bpf/arena.c:974:24: error: invalid application of 'sizeof' to bit-field
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^
   include/linux/compiler_types.h:660:9: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                ^
   kernel/bpf/arena.c:974:40: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
         |                                               objects
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:660:39: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^
   kernel/bpf/../../mm/slab.h:49:15: note: 'objects' declared here
      49 |                                         unsigned objects:15;
         |                                                  ^
>> kernel/bpf/arena.c:974:24: error: invalid application of 'sizeof' to bit-field
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^
   include/linux/compiler_types.h:660:38: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                             ^
   kernel/bpf/arena.c:974:40: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
         |                                               objects
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:661:10: note: expanded from macro '__native_word'
     661 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^
   kernel/bpf/../../mm/slab.h:49:15: note: 'objects' declared here
      49 |                                         unsigned objects:15;
         |                                                  ^
>> kernel/bpf/arena.c:974:24: error: invalid application of 'sizeof' to bit-field
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^
   include/linux/compiler_types.h:661:9: note: expanded from macro '__native_word'
     661 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                ^
   kernel/bpf/arena.c:974:40: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
         |                                               objects
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:661:38: note: expanded from macro '__native_word'
     661 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^
   kernel/bpf/../../mm/slab.h:49:15: note: 'objects' declared here
      49 |                                         unsigned objects:15;
         |                                                  ^
>> kernel/bpf/arena.c:974:24: error: invalid application of 'sizeof' to bit-field
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^
   include/linux/compiler_types.h:661:37: note: expanded from macro '__native_word'
     661 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                            ^
   kernel/bpf/arena.c:974:40: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
         |                                               objects
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^
   kernel/bpf/../../mm/slab.h:49:15: note: 'objects' declared here
      49 |                                         unsigned objects:15;
         |                                                  ^
>> kernel/bpf/arena.c:974:24: error: invalid application of 'sizeof' to bit-field
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:47: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                      ^
   kernel/bpf/arena.c:974:40: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
         |                                               objects
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:626:13: note: expanded from macro '__unqual_scalar_typeof'
     626 |                 _Generic((x),                                           \
         |                           ^
   kernel/bpf/../../mm/slab.h:49:15: note: 'objects' declared here
      49 |                                         unsigned objects:15;
         |                                                  ^
   kernel/bpf/arena.c:974:40: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
         |                                               objects
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:633:15: note: expanded from macro '__unqual_scalar_typeof'
     633 |                          default: (x)))
         |                                    ^
   kernel/bpf/../../mm/slab.h:49:15: note: 'objects' declared here
      49 |                                         unsigned objects:15;
         |                                                  ^
   kernel/bpf/arena.c:974:40: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                                               ^~~~~~~~
         |                                               objects
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/bpf/../../mm/slab.h:49:15: note: 'objects' declared here
      49 |                                         unsigned objects:15;
         |                                                  ^
>> kernel/bpf/arena.c:974:24: error: address of bit-field requested
     974 |         unsigned long stash = READ_ONCE(slab->obj_exts);
         |                               ^         ~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^           ~
   include/asm-generic/rwonce.h:44:70: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                       ^ ~
   kernel/bpf/arena.c:988:19: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |                          ^~~~~~~~
         |                          objects
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:660:10: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^
   kernel/bpf/../../mm/slab.h:49:15: note: 'objects' declared here
      49 |                                         unsigned objects:15;
         |                                                  ^
   kernel/bpf/arena.c:988:2: error: invalid application of 'sizeof' to bit-field
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |         ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^
   include/linux/compiler_types.h:660:9: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                ^
   kernel/bpf/arena.c:988:19: error: no member named 'obj_exts' in 'struct slab'; did you mean 'objects'?
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |                          ^~~~~~~~
         |                          objects
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:660:39: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:699:22: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:687:23: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:679:9: note: expanded from macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^
   kernel/bpf/../../mm/slab.h:49:15: note: 'objects' declared here
      49 |                                         unsigned objects:15;
         |                                                  ^
   kernel/bpf/arena.c:988:2: error: invalid application of 'sizeof' to bit-field
     988 |         WRITE_ONCE(slab->obj_exts, 0);
         |         ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^
   include/linux/compiler_types.h:660:38: note: expanded from macro '__native_word'
     660 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                             ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +963 kernel/bpf/arena.c

   917	
   918	/*
   919	 * SLAB_BPF_ARENA support: each arena owns a set of kmem_cache buckets that
   920	 * back kmalloc-style alloc/free for BPF programs. Slab pages are drawn from
   921	 * the arena's page pool, but slub treats them as ordinary direct-map kernel
   922	 * memory (slab_address/virt_to_slab/freepointers all use direct-map VAs).
   923	 * The arena's vmalloc mapping is what BPF programs see; bpf_arena_alloc/free
   924	 * translate between direct-map and arena offset in O(1) by reading the slab
   925	 * page's arena uaddr32 stashed in slab->obj_exts.
   926	 */
   927	
   928	static struct slab *arena_alloc_slab_page(void *arena_p, gfp_t flags, int node,
   929						  unsigned int order, bool allow_spin)
   930	{
   931		struct bpf_arena *arena = arena_p;
   932		long ret_user_va;
   933		u32 uaddr32;
   934		void *kva;
   935		struct page *page;
   936		struct slab *slab;
   937	
   938		if (order)
   939			return NULL;
   940	
   941		/* Propagate allow_spin to the arena page allocator; non-sleeping
   942		 * contexts (BPF NMI/irq-off) take the best-effort path.
   943		 */
   944		ret_user_va = arena_alloc_pages(arena, 0, 1, node, allow_spin);
   945		if (!ret_user_va)
   946			return NULL;
   947	
   948		uaddr32 = (u32)ret_user_va;
   949		kva = (void *)(bpf_arena_get_kern_vm_start(arena) + uaddr32);
   950	
   951		page = vmalloc_to_page(kva);
   952		if (WARN_ON_ONCE(!page))
   953			goto fail;
   954	
   955		__SetPageSlab(page);
   956		slab = page_slab(page);
   957		/*
   958		 * Stash this slab page's arena offset in obj_exts. allocate_slab()
   959		 * skips init_slab_obj_exts() for SLAB_BPF_ARENA caches, so this
   960		 * survives until __free_slab(). High bit set as a presence sentinel
   961		 * (uaddr32 < 4GB so bit 63 is always free).
   962		 */
 > 963		slab->obj_exts = (unsigned long)uaddr32 | BIT_ULL(63);
   964		WRITE_ONCE(arena->slab_pages[uaddr32 >> PAGE_SHIFT], page);
   965	
   966		return slab;
   967	fail:
   968		arena_free_pages(arena, uaddr32, 1, true);
   969		return NULL;
   970	}
   971	
   972	static u32 arena_slab_uaddr32(const struct slab *slab)
   973	{
 > 974		unsigned long stash = READ_ONCE(slab->obj_exts);
   975	
   976		if (WARN_ON_ONCE(!(stash & BIT_ULL(63))))
   977			return 0;
   978		return (u32)stash;
   979	}
   980	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
