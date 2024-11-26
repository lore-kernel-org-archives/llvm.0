Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEEE1DE894;
	Tue, 26 Nov 2024 19:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732649387; cv=none; b=TJ9gU4H2CiKfgHHfYDazTUkmlP8vtTUKquRk9HfT+pw3FEx5rrW01hUEo76Gt5EZ5Un6yQ70blmvcfEdLKc8+tYlNWV1ywxXLsundQg5BVNapZDwSt2LLVd008J2GfN3L27uMLDmKifCbsZ+XcXSe/bl08W9VMCe/CPeotUNSFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732649387; c=relaxed/simple;
	bh=iRfLY4lQ7EG0kajauYKWbAxv026Ho6VIbW5GRynekUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sQDcLu0W2rfJMle6H89olFFQ9IR4Kq5eZbgmRarBqi1bW6jw7NVV0vok/qmZoIUlAoonJ8crVwTm8ch2OHzYYaHCrIpI81QE58bBYAme0UWyxZxhJC63K2PhXodiiMOE7egPI20B77SLqWQdclNFmMy9W/ham5DOOcl0RcJb6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffXH/D7w; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffXH/D7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732649386; x=1764185386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iRfLY4lQ7EG0kajauYKWbAxv026Ho6VIbW5GRynekUQ=;
  b=ffXH/D7wAtS3EHkjtdIBpjdMog/3EBLqPz4/SBqPNxhFXi+zFrJmRCjQ
   KvSg51GV5Pa8oaB8WhqUUqz7r0mcL35ZeEA1iWb8jHBEECJc4jlJLuwOz
   L1Nn47fXdpo4LTetDqE7zD5CoE5zqusOGd7Ix8cVRpivEW2WgKenfe5f8
   Uy/lflK27tjhiipVwTUc0LUOVEjTN65NbxUdMZb/K0kTgnZ0igCO9dS15
   R/b5tpK+BtCGXL7mmYfROHPyD9V7CpqlOB4gQiJhvYfnDohAbrWrnZvW1
   sXCXU81KIwQMDbNq4ZH/TmvsrrYA9hQEI12wGd93TswJ+AoxKukdHWe1d
   A==;
X-CSE-ConnectionGUID: G/qzr3grSKmoDzIrXnQfDw==
X-CSE-MsgGUID: 1JgXDfEcSjuHgDDphxHtEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32203814"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="32203814"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 11:29:45 -0800
X-CSE-ConnectionGUID: vFcxbEokTmSFQwmw21hlFw==
X-CSE-MsgGUID: aWgogsRXRfuQajX7eTD+Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="91657982"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2024 11:29:43 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG1Fk-0007VL-1T;
	Tue, 26 Nov 2024 19:29:40 +0000
Date: Wed, 27 Nov 2024 03:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/core 15/16] include/linux/srcu.h:335:2: error:
 expected ')'
Message-ID: <202411270302.FBjOk156-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   cd9921a0bc2a79a77a7e1f03f84491760d88b6a8
commit: 0b040f5f0c969993bee6cbebb5a7617aaed0d742 [15/16] objtool: 'Fix' ANNOTATE_REACHABLE to be a normal annotation
config: i386-buildonly-randconfig-006-20241127 (https://download.01.org/0day-ci/archive/20241127/202411270302.FBjOk156-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411270302.FBjOk156-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270302.FBjOk156-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                 ^
   arch/x86/include/asm/bug.h:95:31: note: expanded from macro '__WARN_FLAGS'
      95 |         _BUG_FLAGS(ASM_UD2, __flags, __ANNOTATE_REACHABLE(__ASM_BREF(1)));      \
         |                                      ^
   include/linux/objtool.h:177:34: note: expanded from macro '__ANNOTATE_REACHABLE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:12:
   include/linux/maple_tree.h:839:3: error: expected ')'
     839 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^
   include/asm-generic/bug.h:125:3: note: expanded from macro 'WARN_ON'
     125 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:103:19: note: expanded from macro '__WARN'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   arch/x86/include/asm/bug.h:95:31: note: expanded from macro '__WARN_FLAGS'
      95 |         _BUG_FLAGS(ASM_UD2, __flags, __ANNOTATE_REACHABLE(__ASM_BREF(1)));      \
         |                                      ^
   include/linux/objtool.h:177:34: note: expanded from macro '__ANNOTATE_REACHABLE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:12:
   include/linux/maple_tree.h:858:3: error: expected ')'
     858 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^
   include/asm-generic/bug.h:125:3: note: expanded from macro 'WARN_ON'
     125 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:103:19: note: expanded from macro '__WARN'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   arch/x86/include/asm/bug.h:95:31: note: expanded from macro '__WARN_FLAGS'
      95 |         _BUG_FLAGS(ASM_UD2, __flags, __ANNOTATE_REACHABLE(__ASM_BREF(1)));      \
         |                                      ^
   include/linux/objtool.h:177:34: note: expanded from macro '__ANNOTATE_REACHABLE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:13:
   include/linux/rwsem.h:80:2: error: expected ')'
      80 |         WARN_ON(atomic_long_read(&sem->count) == RWSEM_UNLOCKED_VALUE);
         |         ^
   include/asm-generic/bug.h:125:3: note: expanded from macro 'WARN_ON'
     125 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:103:19: note: expanded from macro '__WARN'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   arch/x86/include/asm/bug.h:95:31: note: expanded from macro '__WARN_FLAGS'
      95 |         _BUG_FLAGS(ASM_UD2, __flags, __ANNOTATE_REACHABLE(__ASM_BREF(1)));      \
         |                                      ^
   include/linux/objtool.h:177:34: note: expanded from macro '__ANNOTATE_REACHABLE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:13:
   include/linux/rwsem.h:85:2: error: expected ')'
      85 |         WARN_ON(!(atomic_long_read(&sem->count) & RWSEM_WRITER_LOCKED));
         |         ^
   include/asm-generic/bug.h:125:3: note: expanded from macro 'WARN_ON'
     125 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:103:19: note: expanded from macro '__WARN'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   arch/x86/include/asm/bug.h:95:31: note: expanded from macro '__WARN_FLAGS'
      95 |         _BUG_FLAGS(ASM_UD2, __flags, __ANNOTATE_REACHABLE(__ASM_BREF(1)));      \
         |                                      ^
   include/linux/objtool.h:177:34: note: expanded from macro '__ANNOTATE_REACHABLE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:62:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
>> include/linux/srcu.h:335:2: error: expected ')'
     335 |         WARN_ON_ONCE(in_nmi());
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:95:31: note: expanded from macro '__WARN_FLAGS'
      95 |         _BUG_FLAGS(ASM_UD2, __flags, __ANNOTATE_REACHABLE(__ASM_BREF(1)));      \
         |                                      ^
   include/linux/objtool.h:177:34: note: expanded from macro '__ANNOTATE_REACHABLE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:62:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:350:2: error: expected ')'
     350 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:95:31: note: expanded from macro '__WARN_FLAGS'
      95 |         _BUG_FLAGS(ASM_UD2, __flags, __ANNOTATE_REACHABLE(__ASM_BREF(1)));      \
         |                                      ^
   include/linux/objtool.h:177:34: note: expanded from macro '__ANNOTATE_REACHABLE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:62:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:366:2: error: expected ')'
     366 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:95:31: note: expanded from macro '__WARN_FLAGS'
      95 |         _BUG_FLAGS(ASM_UD2, __flags, __ANNOTATE_REACHABLE(__ASM_BREF(1)));      \
         |                                      ^
   include/linux/objtool.h:177:34: note: expanded from macro '__ANNOTATE_REACHABLE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:62:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:382:2: error: expected ')'
     382 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:95:31: note: expanded from macro '__WARN_FLAGS'
      95 |         _BUG_FLAGS(ASM_UD2, __flags, __ANNOTATE_REACHABLE(__ASM_BREF(1)));      \
         |                                      ^
   include/linux/objtool.h:177:34: note: expanded from macro '__ANNOTATE_REACHABLE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:62:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:407:2: error: expected ')'
     407 |         WARN_ON_ONCE(idx & ~0x1);
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:95:31: note: expanded from macro '__WARN_FLAGS'
      95 |         _BUG_FLAGS(ASM_UD2, __flags, __ANNOTATE_REACHABLE(__ASM_BREF(1)));      \
         |                                      ^
   include/linux/objtool.h:177:34: note: expanded from macro '__ANNOTATE_REACHABLE'
     177 | #define __ANNOTATE_REACHABLE(s)         __ASM_ANNOTATE(s, ANNOTYPE_REACHABLE)
         |                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:


vim +335 include/linux/srcu.h

1f45a4db3657c5 Paul E. McKenney 2018-06-28  311  
0b1182bde303dc Paul E. McKenney 2022-11-23  312  /**
0b1182bde303dc Paul E. McKenney 2022-11-23  313   * srcu_down_read - register a new reader for an SRCU-protected structure.
0b1182bde303dc Paul E. McKenney 2022-11-23  314   * @ssp: srcu_struct in which to register the new reader.
0b1182bde303dc Paul E. McKenney 2022-11-23  315   *
0b1182bde303dc Paul E. McKenney 2022-11-23  316   * Enter a semaphore-like SRCU read-side critical section.  Note that
0b1182bde303dc Paul E. McKenney 2022-11-23  317   * SRCU read-side critical sections may be nested.  However, it is
0b1182bde303dc Paul E. McKenney 2022-11-23  318   * illegal to call anything that waits on an SRCU grace period for the
0b1182bde303dc Paul E. McKenney 2022-11-23  319   * same srcu_struct, whether directly or indirectly.  Please note that
0b1182bde303dc Paul E. McKenney 2022-11-23  320   * one way to indirectly wait on an SRCU grace period is to acquire
0b1182bde303dc Paul E. McKenney 2022-11-23  321   * a mutex that is held elsewhere while calling synchronize_srcu() or
0b1182bde303dc Paul E. McKenney 2022-11-23  322   * synchronize_srcu_expedited().  But if you want lockdep to help you
0b1182bde303dc Paul E. McKenney 2022-11-23  323   * keep this stuff straight, you should instead use srcu_read_lock().
0b1182bde303dc Paul E. McKenney 2022-11-23  324   *
0b1182bde303dc Paul E. McKenney 2022-11-23  325   * The semaphore-like nature of srcu_down_read() means that the matching
0b1182bde303dc Paul E. McKenney 2022-11-23  326   * srcu_up_read() can be invoked from some other context, for example,
0b1182bde303dc Paul E. McKenney 2022-11-23  327   * from some other task or from an irq handler.  However, neither
0b1182bde303dc Paul E. McKenney 2022-11-23  328   * srcu_down_read() nor srcu_up_read() may be invoked from an NMI handler.
0b1182bde303dc Paul E. McKenney 2022-11-23  329   *
0b1182bde303dc Paul E. McKenney 2022-11-23  330   * Calls to srcu_down_read() may be nested, similar to the manner in
0b1182bde303dc Paul E. McKenney 2022-11-23  331   * which calls to down_read() may be nested.
0b1182bde303dc Paul E. McKenney 2022-11-23  332   */
0b1182bde303dc Paul E. McKenney 2022-11-23  333  static inline int srcu_down_read(struct srcu_struct *ssp) __acquires(ssp)
0b1182bde303dc Paul E. McKenney 2022-11-23  334  {
0b1182bde303dc Paul E. McKenney 2022-11-23 @335  	WARN_ON_ONCE(in_nmi());
05829be27fe6f6 Paul E. McKenney 2024-10-15  336  	srcu_check_read_flavor(ssp, SRCU_READ_FLAVOR_NORMAL);
0b1182bde303dc Paul E. McKenney 2022-11-23  337  	return __srcu_read_lock(ssp);
0b1182bde303dc Paul E. McKenney 2022-11-23  338  }
0b1182bde303dc Paul E. McKenney 2022-11-23  339  

:::::: The code at line 335 was first introduced by commit
:::::: 0b1182bde303dc476ea9712c2c816be2e4f0cf81 rcu: Add srcu_down_read() and srcu_up_read()

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
