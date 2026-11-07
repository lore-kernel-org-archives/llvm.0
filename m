Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794031877;
	b=TMn+k5Jspuu8FAUThUlO3ry1eqVPVjs3m6JmdUl9+iX8QBLZOyI1v2Vui5iwNmrVbLMq
	 41lWo6UXfSI7PHGP/JofDltmFn8usidu6pISEKAjWdOSqv1dxCmEw5jHQdiWY2XchWYJt
	 a1lqlxhZoN4zvKkKYmRxyhEY25vMlIz0VJcG6Tl3TJFZfRfpdhPA2hff5qWpo9P7dWg/C
	 S8tlFu3W0toJhniMIFwqtVsHjgxNt0jH30jEncd3+LSPxJo9jE8jLIlvo/j2hvFf5tieB
	 6IpzKHI1ZfVDkHzktzw0TdQm4Us+4c9y832Uq+4tfTpsMaT93tYdwzexAfAziodxSJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794031877;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9Qf1bxlJh2yR8FYAdykJlSKZ7c2wlaxQ2/wdlH/NO+M=;
	b=GiJ0OeWWLlUD9ozag3MmDmSKZ7Fn6SGnNIskbCB0woQSVyS667/POG4gECyDosJDiRBP
	 rgpvIb/SuOvETdxRkQNBGsWJEOAVn9f3ZjWv4dsNhU6UNfK6OVK68ceQGwj7tYtOuGcVy
	 wf5zi7pNKrZuBki8TCY9YDh5HRI44ughFUBbVEXEl92HCFz5OXq2h0Dj81Tw7lwra5N5I
	 KVjNudVK31BGRX3O9WJdKk0E1dIQ+h1GeuspICxGjz0RD2KNLRY6PywfhOF6PTl2SxLbj
	 P51J+ao9BT9lUMuIZFyCLkmHHvP2jCj2o6MNoqq5Sbb6wdN2U/CJkBFj0S0BhS+/hUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CVKyoQaI;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA11B606A326;
	Sat,  7 Nov 2026 06:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA11B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CVKyoQaI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794031876; x=1825567876;
  h=date:from:to:cc:subject:message-id;
  bh=Dnzi/OYZGsP9/fNjeq/k8Zqu+Z356PQDNnPgTACVjtI=;
  b=CVKyoQaIs5NwgdN4+sefQmTKfileXQcLCgfXQJzNddCpsdgyZ6y4Y82p
   UeLl+o+LJSfxX65JT8EU0eDKcg8o2fjs2XK87la1I7YGe0ct8oDmhndb9
   8gWQWC4b1iC+gjBrpBbr4HRR6rKVlMSz6itds+glWRNMDFnExYcQFMa08
   2FDJQtkPUk4sRSVM7sREexni1DPxDAQ/KxImD9LVUECcZYekS6HNqXF//
   uDi4q8T3866rIh1jX1Cplf1RUVrbQAJmAz0icdUqsh1IoPGgU6V7g5HlN
   zP/hmzD2eKpMbcEErae0D2vpopd7eYQJLvmAk9V3HLWW3JYKk9idY1bKk
   g==;
X-CSE-ConnectionGUID: NhuJB8sKRweDKp/+TsKcrg==
X-CSE-MsgGUID: xJUrU2OTSQCGRw5lhjOPmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2725907"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2725907"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 22:11:15 -0800
X-CSE-ConnectionGUID: l2zi7AI5QmOnogDFIe7VRA==
X-CSE-MsgGUID: WRoUjUAgS3KvM+QAXO5SZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7313686"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2026 22:11:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPZdt-00000000qWN-3oKh;
	Sat, 07 Nov 2026 06:11:09 +0000
Date: Sat, 07 Nov 2026 14:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Hildenbrand <david@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 mm-commits@vger.kernel.org, Abhishek Bapat <abhishekbapat@google.com>
Subject: [akpm-mm:mm-unstable 225/232]
 include/linux/alloc_tag.h:159:24: error: duplicate 'inline' declaration
 specifier
Message-ID: <202611071330.7rHbLZ6C-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   a3d27154a205f6b32000e7e2734b2a6a4d22c65b
commit: cb335644ac2611749ab17d3eb6f29c8f77450fa6 [225/232] alloc_tag-introduce-ioctls-to-toggle-allocation-tracepoints-fix-fix
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261107/202611071330.7rHbLZ6C-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071330.7rHbLZ6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071330.7rHbLZ6C-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:13:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
>> include/linux/alloc_tag.h:159:24: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     159 | static __always_inline inline bool alloc_tag_is_traced(const struct alloc_tag *tag)
         |                        ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   1 warning generated.
--
   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:22:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:16:
   In file included from include/linux/percpu.h:5:
>> include/linux/alloc_tag.h:159:24: error: duplicate 'inline' declaration specifier [-Werror,-Wduplicate-decl-specifier]
     159 | static __always_inline inline bool alloc_tag_is_traced(const struct alloc_tag *tag)
         |                        ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   1 error generated.
--
   In file included from drivers/accessibility/speakup/synth.c:4:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
>> include/linux/alloc_tag.h:159:24: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     159 | static __always_inline inline bool alloc_tag_is_traced(const struct alloc_tag *tag)
         |                        ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   drivers/accessibility/speakup/synth.c:24:12: warning: variable 'module_status' set but not used [-Wunused-but-set-global]
      24 | static int module_status;
         |            ^
   2 warnings generated.
--
   In file included from drivers/accessibility/speakup/main.c:14:
   In file included from include/linux/tty.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
>> include/linux/alloc_tag.h:159:24: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     159 | static __always_inline inline bool alloc_tag_is_traced(const struct alloc_tag *tag)
         |                        ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   drivers/accessibility/speakup/main.c:236:32: warning: variable 'keymap_flags' set but not used [-Wunused-but-set-global]
     236 | static u_char spk_close_press, keymap_flags;
         |                                ^
   drivers/accessibility/speakup/main.c:1389:15: warning: variable 'old_cursor_pos' set but not used [-Wunused-but-set-global]
    1389 | static u_long old_cursor_pos, old_cursor_x, old_cursor_y;
         |               ^
   drivers/accessibility/speakup/main.c:1389:31: warning: variable 'old_cursor_x' set but not used [-Wunused-but-set-global]
    1389 | static u_long old_cursor_pos, old_cursor_x, old_cursor_y;
         |                               ^
   drivers/accessibility/speakup/main.c:1389:45: warning: variable 'old_cursor_y' set but not used [-Wunused-but-set-global]
    1389 | static u_long old_cursor_pos, old_cursor_x, old_cursor_y;
         |                                             ^
   5 warnings generated.
--
   In file included from lib/tests/stackinit_kunit.c:14:
   In file included from include/kunit/test.h:24:
   In file included from include/linux/module.h:22:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:16:
   In file included from include/linux/percpu.h:5:
>> include/linux/alloc_tag.h:159:24: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     159 | static __always_inline inline bool alloc_tag_is_traced(const struct alloc_tag *tag)
         |                        ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   lib/tests/stackinit_kunit.c:448:1: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     448 | DEFINE_UNION_INITIALIZER_TESTS(static, INSTRUMENTED_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:428:3: note: expanded from macro 'DEFINE_UNION_INITIALIZER_TESTS'
     428 |                 DEFINE_UNION_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:431:3: note: expanded from macro 'DEFINE_UNION_TESTS'
     431 |                 DEFINE_UNION_TEST(same_sizes, init, xfail);     \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:410:3: note: expanded from macro 'DEFINE_UNION_TEST'
     410 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     411 |                             union test_ ## name, STRUCT, init,  \
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     412 |                             xfail)
         |                             ~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   <scratch space>:177:1: note: expanded from here
     177 | INIT_STRUCT_static_all
         | ^
   lib/tests/stackinit_kunit.c:137:8: note: expanded from macro 'INIT_STRUCT_static_all'
     137 |                                         = __static_all
         |                                           ^~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:118:8: note: expanded from macro '__static_all'
     118 |                                           .two = 0,                     \
         |                                           ^~~~~~~~
   lib/tests/stackinit_kunit.c:448:1: note: previous initialization is here
     448 | DEFINE_UNION_INITIALIZER_TESTS(static, INSTRUMENTED_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:428:3: note: expanded from macro 'DEFINE_UNION_INITIALIZER_TESTS'
     428 |                 DEFINE_UNION_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:431:3: note: expanded from macro 'DEFINE_UNION_TESTS'
     431 |                 DEFINE_UNION_TEST(same_sizes, init, xfail);     \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:410:3: note: expanded from macro 'DEFINE_UNION_TEST'
     410 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     411 |                             union test_ ## name, STRUCT, init,  \
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     412 |                             xfail)
         |                             ~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   <scratch space>:177:1: note: expanded from here
     177 | INIT_STRUCT_static_all
         | ^
   lib/tests/stackinit_kunit.c:137:8: note: expanded from macro 'INIT_STRUCT_static_all'
     137 |                                         = __static_all
         |                                           ^~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:117:33: note: expanded from macro '__static_all'
     117 | #define __static_all                    { .one = 0,                     \
         |                                                  ^
   lib/tests/stackinit_kunit.c:448:1: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     448 | DEFINE_UNION_INITIALIZER_TESTS(static, INSTRUMENTED_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:428:3: note: expanded from macro 'DEFINE_UNION_INITIALIZER_TESTS'
     428 |                 DEFINE_UNION_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:431:3: note: expanded from macro 'DEFINE_UNION_TESTS'
     431 |                 DEFINE_UNION_TEST(same_sizes, init, xfail);     \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:410:3: note: expanded from macro 'DEFINE_UNION_TEST'
     410 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     411 |                             union test_ ## name, STRUCT, init,  \
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     412 |                             xfail)
         |                             ~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   <scratch space>:177:1: note: expanded from here
     177 | INIT_STRUCT_static_all
         | ^
   lib/tests/stackinit_kunit.c:137:8: note: expanded from macro 'INIT_STRUCT_static_all'
     137 |                                         = __static_all
         |                                           ^~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:119:8: note: expanded from macro '__static_all'
     119 |                                           .three = 0,                   \
         |                                           ^~~~~~~~~~
   lib/tests/stackinit_kunit.c:448:1: note: previous initialization is here
     448 | DEFINE_UNION_INITIALIZER_TESTS(static, INSTRUMENTED_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:428:3: note: expanded from macro 'DEFINE_UNION_INITIALIZER_TESTS'
     428 |                 DEFINE_UNION_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:431:3: note: expanded from macro 'DEFINE_UNION_TESTS'
     431 |                 DEFINE_UNION_TEST(same_sizes, init, xfail);     \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stackinit_kunit.c:410:3: note: expanded from macro 'DEFINE_UNION_TEST'
     410 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     411 |                             union test_ ## name, STRUCT, init,  \
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     412 |                             xfail)
         |                             ~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
--
   In file included from main.c:14:
   In file included from include/linux/tty.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
>> include/linux/alloc_tag.h:159:24: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     159 | static __always_inline inline bool alloc_tag_is_traced(const struct alloc_tag *tag)
         |                        ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   main.c:236:32: warning: variable 'keymap_flags' set but not used [-Wunused-but-set-global]
     236 | static u_char spk_close_press, keymap_flags;
         |                                ^
   main.c:1389:15: warning: variable 'old_cursor_pos' set but not used [-Wunused-but-set-global]
    1389 | static u_long old_cursor_pos, old_cursor_x, old_cursor_y;
         |               ^
   main.c:1389:31: warning: variable 'old_cursor_x' set but not used [-Wunused-but-set-global]
    1389 | static u_long old_cursor_pos, old_cursor_x, old_cursor_y;
         |                               ^
   main.c:1389:45: warning: variable 'old_cursor_y' set but not used [-Wunused-but-set-global]
    1389 | static u_long old_cursor_pos, old_cursor_x, old_cursor_y;
         |                                             ^
   5 warnings generated.
--
   In file included from synth.c:4:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
>> include/linux/alloc_tag.h:159:24: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     159 | static __always_inline inline bool alloc_tag_is_traced(const struct alloc_tag *tag)
         |                        ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   synth.c:24:12: warning: variable 'module_status' set but not used [-Wunused-but-set-global]
      24 | static int module_status;
         |            ^
   2 warnings generated.
--
   In file included from tests/stackinit_kunit.c:14:
   In file included from include/kunit/test.h:24:
   In file included from include/linux/module.h:22:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:16:
   In file included from include/linux/percpu.h:5:
>> include/linux/alloc_tag.h:159:24: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
     159 | static __always_inline inline bool alloc_tag_is_traced(const struct alloc_tag *tag)
         |                        ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   tests/stackinit_kunit.c:448:1: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     448 | DEFINE_UNION_INITIALIZER_TESTS(static, INSTRUMENTED_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:428:3: note: expanded from macro 'DEFINE_UNION_INITIALIZER_TESTS'
     428 |                 DEFINE_UNION_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:431:3: note: expanded from macro 'DEFINE_UNION_TESTS'
     431 |                 DEFINE_UNION_TEST(same_sizes, init, xfail);     \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:410:3: note: expanded from macro 'DEFINE_UNION_TEST'
     410 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     411 |                             union test_ ## name, STRUCT, init,  \
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     412 |                             xfail)
         |                             ~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   <scratch space>:128:1: note: expanded from here
     128 | INIT_STRUCT_static_all
         | ^
   tests/stackinit_kunit.c:137:8: note: expanded from macro 'INIT_STRUCT_static_all'
     137 |                                         = __static_all
         |                                           ^~~~~~~~~~~~
   tests/stackinit_kunit.c:118:8: note: expanded from macro '__static_all'
     118 |                                           .two = 0,                     \
         |                                           ^~~~~~~~
   tests/stackinit_kunit.c:448:1: note: previous initialization is here
     448 | DEFINE_UNION_INITIALIZER_TESTS(static, INSTRUMENTED_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:428:3: note: expanded from macro 'DEFINE_UNION_INITIALIZER_TESTS'
     428 |                 DEFINE_UNION_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:431:3: note: expanded from macro 'DEFINE_UNION_TESTS'
     431 |                 DEFINE_UNION_TEST(same_sizes, init, xfail);     \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:410:3: note: expanded from macro 'DEFINE_UNION_TEST'
     410 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     411 |                             union test_ ## name, STRUCT, init,  \
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     412 |                             xfail)
         |                             ~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   <scratch space>:128:1: note: expanded from here
     128 | INIT_STRUCT_static_all
         | ^
   tests/stackinit_kunit.c:137:8: note: expanded from macro 'INIT_STRUCT_static_all'
     137 |                                         = __static_all
         |                                           ^~~~~~~~~~~~
   tests/stackinit_kunit.c:117:33: note: expanded from macro '__static_all'
     117 | #define __static_all                    { .one = 0,                     \
         |                                                  ^
   tests/stackinit_kunit.c:448:1: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     448 | DEFINE_UNION_INITIALIZER_TESTS(static, INSTRUMENTED_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:428:3: note: expanded from macro 'DEFINE_UNION_INITIALIZER_TESTS'
     428 |                 DEFINE_UNION_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:431:3: note: expanded from macro 'DEFINE_UNION_TESTS'
     431 |                 DEFINE_UNION_TEST(same_sizes, init, xfail);     \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:410:3: note: expanded from macro 'DEFINE_UNION_TEST'
     410 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     411 |                             union test_ ## name, STRUCT, init,  \
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     412 |                             xfail)
         |                             ~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   <scratch space>:128:1: note: expanded from here
     128 | INIT_STRUCT_static_all
         | ^
   tests/stackinit_kunit.c:137:8: note: expanded from macro 'INIT_STRUCT_static_all'
     137 |                                         = __static_all
         |                                           ^~~~~~~~~~~~
   tests/stackinit_kunit.c:119:8: note: expanded from macro '__static_all'
     119 |                                           .three = 0,                   \
         |                                           ^~~~~~~~~~
   tests/stackinit_kunit.c:448:1: note: previous initialization is here
     448 | DEFINE_UNION_INITIALIZER_TESTS(static, INSTRUMENTED_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:428:3: note: expanded from macro 'DEFINE_UNION_INITIALIZER_TESTS'
     428 |                 DEFINE_UNION_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:431:3: note: expanded from macro 'DEFINE_UNION_TESTS'
     431 |                 DEFINE_UNION_TEST(same_sizes, init, xfail);     \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/stackinit_kunit.c:410:3: note: expanded from macro 'DEFINE_UNION_TEST'
     410 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     411 |                             union test_ ## name, STRUCT, init,  \
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     412 |                             xfail)
         |                             ~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
..


vim +/inline +159 include/linux/alloc_tag.h

   158	
 > 159	static __always_inline inline bool alloc_tag_is_traced(const struct alloc_tag *tag)
   160	{
   161		return !!(atomic_read(&tag->ct.flags) & CODETAG_FLAG_TRACE_ON);
   162	}
   163	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
