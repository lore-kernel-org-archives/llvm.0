Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539EA54652;
	Wed, 13 May 2026 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672966; cv=none; b=QwxIjF99V65hXB63qSz0f4QSLemR7rtsBswVf5ohqzL2/Ok87Oy3nAnX+CBJyMPAzjIJuKUhQGjr2ptP31vIOiFAA0ZTRQkqyTafk50Kc2PU0uLoLNe4CukvuGZTGztJx0V0AC9RjMG2pw6+OPh9itrIDaI2g9va1YTcEvYreV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672966; c=relaxed/simple;
	bh=1ApqgXVpPcYg4iAazO5rsunUMAaZBd6a1LNRuJJb/2s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jbg3Up0gBnFhzgZS/PVwP1yZtwraeAn3yIumPYAVUWo3B4oQ78gFgRaI6Vs+y+RRhRFiFKAkAATxmsmwT29lyAd1BoDu7B0nemC9f8XhIY3tpc1yi8zBQ9eNEEpeydxQB2keJMf3CHAGRzU0KQbqJgaX3i+5KxbCyiTyFmtugIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWzcorpt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWzcorpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778672965; x=1810208965;
  h=date:from:to:cc:subject:message-id;
  bh=1ApqgXVpPcYg4iAazO5rsunUMAaZBd6a1LNRuJJb/2s=;
  b=NWzcorptSjfhT9O0mevmiDV7D3gkjLthkiXnrnWYrvrJMSZUkrPLGdWs
   1thqHWSFybz0jdW3mmsVeCyPt6WyxQKLX4Uq0L8VcY24qEvUG6IzGhybJ
   fKEZPSV+8stWMUIc511Ub96fIE+GVIsfv32C4V0Q43wjy8uALpPl/iEDk
   anangvJ2w0DZVHLKC9wRlijtjgHV986EqmGRiRQb/Pm+3uxWjWQuk+Xfg
   1TBuoG138MySSvHlygzBySi6c7xXotck1TcT7HiXiaFgk+/8B5epH+qPu
   5pSGfuAnlslmQQ2Juj91Fo+4j1qpAlnuM8nAIGbRUt7fiUHZz5ayF1Bh7
   A==;
X-CSE-ConnectionGUID: NW1GT4QWSX26YJCAT7Ox5w==
X-CSE-MsgGUID: ukzb4QpZTyuT6U8nnvF/Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90176986"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="90176986"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 04:49:24 -0700
X-CSE-ConnectionGUID: VNbWhpKRTnmAHgYLjkiS/g==
X-CSE-MsgGUID: cNEptgJ0RqWz3uO/peA4bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="238309790"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 May 2026 04:49:21 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN85X-0000000041F-1h65;
	Wed, 13 May 2026 11:49:19 +0000
Date: Wed, 13 May 2026 19:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [harry:slab-allow-runtime-parameter-tuning-rfc-v1r1-wip 6/6]
 mm/slub.c:3173:2: error: member reference type 'void' is not a pointer
Message-ID: <202605131900.xMLYUDLG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git slab-allow-runtime-parameter-tuning-rfc-v1r1-wip
head:   10c188407341817c6baf9dad9c788928f8387800
commit: 10c188407341817c6baf9dad9c788928f8387800 [6/6] mm/slab: allow changing sheaf_capacity at runtime
config: arm64-randconfig-004-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131900.xMLYUDLG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131900.xMLYUDLG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131900.xMLYUDLG-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c:3173:44: error: no member named 'cache' in 'struct slab_sheaf'
    3173 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   include/linux/percpu-defs.h:252:20: note: expanded from macro 'this_cpu_ptr'
     252 |         __verify_pcpu_ptr(ptr);                                         \
         |                           ^~~
   include/linux/percpu-defs.h:221:47: note: expanded from macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/lockdep.h:285:38: note: expanded from macro 'lockdep_assert_held'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |                                             ^
   include/linux/lockdep.h:252:47: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                        ^~~~
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |                                       ^~~~
   include/asm-generic/bug.h:205:25: note: expanded from macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/slub.c:3173:44: error: no member named 'cache' in 'struct slab_sheaf'
    3173 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   include/linux/percpu-defs.h:253:19: note: expanded from macro 'this_cpu_ptr'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |                          ^~~
   include/linux/percpu-defs.h:235:24: note: expanded from macro 'SHIFT_PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                               ^~~
   include/linux/percpu-defs.h:226:19: note: expanded from macro 'PERCPU_PTR'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |                          ^~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/lockdep.h:252:47: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                        ^~~~
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |                                       ^~~~
   include/asm-generic/bug.h:205:25: note: expanded from macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/slub.c:3173:44: error: no member named 'cache' in 'struct slab_sheaf'
    3173 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   include/linux/percpu-defs.h:253:19: note: expanded from macro 'this_cpu_ptr'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |                          ^~~
   include/linux/percpu-defs.h:235:24: note: expanded from macro 'SHIFT_PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                               ^~~
   include/linux/percpu-defs.h:226:69: note: expanded from macro 'PERCPU_PTR'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |                                                                            ^~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/lockdep.h:252:47: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                        ^~~~
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |                                       ^~~~
   include/asm-generic/bug.h:205:25: note: expanded from macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
>> mm/slub.c:3173:2: error: member reference type 'void' is not a pointer
    3173 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:22: note: expanded from macro 'lockdep_assert_held'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |              ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:54: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                               ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:205:25: note: expanded from macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/slub.c:3173:44: error: no member named 'cache' in 'struct slab_sheaf'
    3173 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   include/linux/percpu-defs.h:252:20: note: expanded from macro 'this_cpu_ptr'
     252 |         __verify_pcpu_ptr(ptr);                                         \
         |                           ^~~
   include/linux/percpu-defs.h:221:47: note: expanded from macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/lockdep.h:285:84: note: expanded from macro 'lockdep_assert_held'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |                                                                                           ^
   include/linux/compiler-context-analysis.h:172:47: note: expanded from macro '__assume_ctx_lock'
     172 | # define __assume_ctx_lock(var)                 do { (void)(var); } while (0)
         |                                                             ^~~
   mm/slub.c:3173:44: error: no member named 'cache' in 'struct slab_sheaf'
    3173 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   include/linux/percpu-defs.h:253:19: note: expanded from macro 'this_cpu_ptr'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |                          ^~~
   include/linux/percpu-defs.h:235:24: note: expanded from macro 'SHIFT_PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                               ^~~
   include/linux/percpu-defs.h:226:19: note: expanded from macro 'PERCPU_PTR'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |                          ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:152:40: note: expanded from macro 'RELOC_HIDE'
     152 | # define RELOC_HIDE(ptr, off) ((typeof(ptr))((unsigned long)(ptr) + (off)))
         |                                        ^~~
   include/linux/lockdep.h:285:84: note: expanded from macro 'lockdep_assert_held'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |                                                                                           ^
   include/linux/compiler-context-analysis.h:172:47: note: expanded from macro '__assume_ctx_lock'
     172 | # define __assume_ctx_lock(var)                 do { (void)(var); } while (0)
         |                                                             ^~~
   mm/slub.c:3173:44: error: no member named 'cache' in 'struct slab_sheaf'
    3173 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   include/linux/percpu-defs.h:253:19: note: expanded from macro 'this_cpu_ptr'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |                          ^~~
   include/linux/percpu-defs.h:235:24: note: expanded from macro 'SHIFT_PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                               ^~~
   include/linux/percpu-defs.h:226:69: note: expanded from macro 'PERCPU_PTR'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |                                                                            ^~~
   include/linux/compiler.h:152:40: note: expanded from macro 'RELOC_HIDE'
     152 | # define RELOC_HIDE(ptr, off) ((typeof(ptr))((unsigned long)(ptr) + (off)))
         |                                        ^~~
   include/linux/lockdep.h:285:84: note: expanded from macro 'lockdep_assert_held'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |                                                                                           ^
   include/linux/compiler-context-analysis.h:172:47: note: expanded from macro '__assume_ctx_lock'
     172 | # define __assume_ctx_lock(var)                 do { (void)(var); } while (0)
         |                                                             ^~~
   mm/slub.c:3187:44: error: no member named 'cache' in 'struct slab_sheaf'
    3187 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   include/linux/percpu-defs.h:252:20: note: expanded from macro 'this_cpu_ptr'
     252 |         __verify_pcpu_ptr(ptr);                                         \
         |                           ^~~
   include/linux/percpu-defs.h:221:47: note: expanded from macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/lockdep.h:285:38: note: expanded from macro 'lockdep_assert_held'
     285 |         do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
         |                                             ^
   include/linux/lockdep.h:252:47: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                        ^~~~
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |                                       ^~~~
   include/asm-generic/bug.h:205:25: note: expanded from macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/slub.c:3187:44: error: no member named 'cache' in 'struct slab_sheaf'
    3187 |         lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
         |                                            ~~~~~  ^
   include/linux/percpu-defs.h:253:19: note: expanded from macro 'this_cpu_ptr'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |                          ^~~
   include/linux/percpu-defs.h:235:24: note: expanded from macro 'SHIFT_PERCPU_PTR'


vim +/void +3173 mm/slub.c

  3162	
  3163	/*
  3164	 * The following two functions are used mainly in cases where we have to undo an
  3165	 * intended action due to a race or cpu migration. Thus they do not check the
  3166	 * empty or full sheaf limits for simplicity.
  3167	 */
  3168	
  3169	static void barn_put_empty_sheaf(struct node_barn *barn, struct slab_sheaf *sheaf)
  3170	{
  3171		unsigned long flags;
  3172	
> 3173		lockdep_assert_held(this_cpu_ptr(&(sheaf->cache)->cpu_sheaves->lock));
  3174	
  3175		spin_lock_irqsave(&barn->lock, flags);
  3176	
  3177		list_add(&sheaf->barn_list, &barn->sheaves_empty);
  3178		barn->nr_empty++;
  3179	
  3180		spin_unlock_irqrestore(&barn->lock, flags);
  3181	}
  3182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
