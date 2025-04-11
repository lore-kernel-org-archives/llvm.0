Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FA627E1CC;
	Fri, 11 Apr 2025 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360611; cv=none; b=nTQj0pAi/6NVSj9WV/g2DFwNOId4NEJQpwMtQLXeoff1fxJ5PPscxmmmHUHo5lh+iMQ/1HfF3s+fTk3boRWO+QcnwogqEyvWgoImYkhk3+Oo1GscAzZfIQqHA/cjuhuWQszqWG0dRzxLgRg0rDLdVpIgVB9yAN43rFsOrvQc3dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360611; c=relaxed/simple;
	bh=xFrcQG4eYlVzIiwK+d/2tAiGN/m10dTAczhbH5e7k4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n7Xg3iBKRgtonoYEjpOyTK8FNxSyOWFmu2bnsue429iOKL3w8W9VA1e0CrRGduSdOm33YDWe+85kH/ycF4Y9Syuhis66VhNeSQq8GZBcnMRT5k5fJrtdG2PYokMGNeREH2tdWSC3sf0iBWDgCKy4/4mhCi2L02py2w+/Xlzx2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVULLRZz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVULLRZz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744360609; x=1775896609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xFrcQG4eYlVzIiwK+d/2tAiGN/m10dTAczhbH5e7k4o=;
  b=hVULLRZz0/x+QG2TrXUHENsGYyAlvOqkd4mGpqH3lp/EP73a59tY4Txl
   bFWt4UfheUxof7l/zwbpgG0cENojMTqPMRAwPzwXK84JN2V2O7FgOx81C
   YJKDelw5tJK3hl1qYYNP+/8HsbH/MAZYdLYzBprDKzI8iTZkJbvWddTWY
   qP+pbpOVoXYGg9rS/kS7h8L2KwSsDfP0pf7sO43vgcO0xThBXEc9rfm52
   oXOIDYk95IGyS7qAbYEyhWdbzeewvA93504kmWUkvJKRQcSdcBaUSq1Td
   F5uWI14MbPkFPYj/lirDKB5rRYWEXdq4REBSeLjC0bQEX8Ept3ufnjGjG
   Q==;
X-CSE-ConnectionGUID: pHS5bsGcTwCYqZFweHxEVw==
X-CSE-MsgGUID: 8WLmawMUTsSvCJdd5vaO6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57280218"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="57280218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 01:36:49 -0700
X-CSE-ConnectionGUID: mr9xXqjnT9S7BbWEdyWcnw==
X-CSE-MsgGUID: ndPCrdsrRoa9B3DQbAczEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134246821"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2025 01:36:47 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u39sS-000Ayg-2w;
	Fri, 11 Apr 2025 08:36:44 +0000
Date: Fri, 11 Apr 2025 16:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:trylock 7/7] mm/slub.c:4430:40: error: no member named
 'cpu_slab' in 'struct kmem_cache'
Message-ID: <202504111613.XQvJSEqE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   28e3f03dae020bb273ab4d5dd660849e08e89bb9
commit: 28e3f03dae020bb273ab4d5dd660849e08e89bb9 [7/7] slab: Introduce try_kmalloc() and kfree_nolock().
config: arm-randconfig-002-20250411 (https://download.01.org/0day-ci/archive/20250411/202504111613.XQvJSEqE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111613.XQvJSEqE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111613.XQvJSEqE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:513:13: note: expanded from macro '__unqual_scalar_typeof'
     513 |                 _Generic((x),                                           \
         |                           ^
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:513:13: note: expanded from macro '__unqual_scalar_typeof'
     513 |                 _Generic((x),                                           \
         |                           ^
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:513:13: note: expanded from macro '__unqual_scalar_typeof'
     513 |                 _Generic((x),                                           \
         |                           ^
>> mm/slub.c:4430:40: error: no member named 'cpu_slab' in 'struct kmem_cache'
    4430 |         if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
         |                                            ~  ^
   include/linux/local_lock.h:69:50: note: expanded from macro 'local_lock_held'
      69 | #define local_lock_held(lock)           __local_lock_held(lock)
         |                                                           ^~~~
   include/linux/local_lock_internal.h:169:56: note: expanded from macro '__local_lock_held'
     169 | #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
         |                                                        ^~~~
   include/linux/percpu-defs.h:268:39: note: expanded from macro 'this_cpu_ptr'
     268 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                             ^~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:220:47: note: expanded from macro '__verify_pcpu_ptr'
     220 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +4430 mm/slub.c

  4394	
  4395	void *try_kmalloc_noprof(size_t size, gfp_t gfp_flags, int node)
  4396	{
  4397		gfp_t alloc_gfp = __GFP_NOWARN | __GFP_NOMEMALLOC | gfp_flags;
  4398		struct kmem_cache *s;
  4399		bool can_retry = true;
  4400		void *ret = ERR_PTR(-EBUSY);
  4401	
  4402		VM_WARN_ON_ONCE(gfp_flags & ~(__GFP_ACCOUNT | __GFP_ZERO));
  4403	
  4404		if (unlikely(size > KMALLOC_MAX_CACHE_SIZE))
  4405			return NULL;
  4406		if (unlikely(!size))
  4407			return ZERO_SIZE_PTR;
  4408	
  4409	retry:
  4410		s = kmalloc_slab(size, NULL, alloc_gfp, _RET_IP_);
  4411	
  4412		if (!USE_LOCKLESS_FAST_PATH() || !(s->flags & __CMPXCHG_DOUBLE))
  4413			/*
  4414			 * try_kmalloc() is not supported in PREEMPT_RT and
  4415			 * on architectures that don't implement cmpxchg16b.
  4416			 */
  4417			return NULL;
  4418	
  4419		/*
  4420		 * Do not call slab_alloc_node(), since trylock mode isn't
  4421		 * compatible with slab_pre_alloc_hook/should_failslab and
  4422		 * kfence_alloc.
  4423		 *
  4424		 * In !PREEMPT_RT ___slab_alloc() manipulates (freelist,tid) pair
  4425		 * in irq saved region. It assumes that the same cpu will not
  4426		 * __update_cpu_freelist_fast() into the same (freelist,tid) pair.
  4427		 * Therefore in_nmi() check whether particular bucket is in
  4428		 * irq protected.
  4429		 */
> 4430		if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
  4431			ret = __slab_alloc_node(s, alloc_gfp, node, _RET_IP_, size);
  4432	
  4433		if (PTR_ERR(ret) == -EBUSY) {
  4434			if (can_retry) {
  4435				/* pick the next kmalloc bucket */
  4436				size = s->object_size + 1;
  4437				/*
  4438				 * Another alternative is to
  4439				 * if (memcg) alloc_gfp &= ~__GFP_ACCOUNT;
  4440				 * else if (!memcg) alloc_gfp |= __GFP_ACCOUNT;
  4441				 * to retry from bucket of the same size.
  4442				 */
  4443				can_retry = false;
  4444				goto retry;
  4445			}
  4446			ret = NULL;
  4447		}
  4448	
  4449		maybe_wipe_obj_freeptr(s, ret);
  4450		/*
  4451		 * Make sure memcg_stock.stock_lock doesn't change cpu
  4452		 * when memcg layers access it.
  4453		 */
  4454		preempt_disable();
  4455		slab_post_alloc_hook(s, NULL, alloc_gfp, 1, &ret,
  4456				     slab_want_init_on_alloc(alloc_gfp, s), size);
  4457		preempt_enable();
  4458	
  4459		ret = kasan_kmalloc(s, ret, size, alloc_gfp);
  4460		return ret;
  4461	}
  4462	EXPORT_SYMBOL_GPL(try_kmalloc_noprof);
  4463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
