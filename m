Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732C4411;
	Sat, 27 Jul 2024 10:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722076709; cv=none; b=fAv0C4pqr4KCvy9XMeKgEgBM+pfA0NitgKym4Un6KZ15p2GRrlsCdAyoMGtAB2P44fTyhQckfpWA70GDTr29ed9/5D/z2tYfgn9mls6SNjSZXdicWrw90wFjViUkTQ1aeVIBw5z+5D+eXEKd5r7LtSA0y+pFtzkcrPfXJFQoWPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722076709; c=relaxed/simple;
	bh=NO7rRPY71xO3ExBsYR0jDKC733Qt4ldM5FHo+U2LwFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eqt96loSlbw2Lb3CXJu0YKESL1W1s+8gZ6o7hUOzkq2FUj0haYEhRW7BplzGnxSuXysOG7NqipfGdq4hkF9SrqlBaC4VuKOXeEpRfPIThrH26ba/foI83blJuH1flUBOAHKoZxX7aYgRbD0wkg5ZSituEJeelQppnvJ0DCa0Rkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b17gO5pQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b17gO5pQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722076707; x=1753612707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NO7rRPY71xO3ExBsYR0jDKC733Qt4ldM5FHo+U2LwFk=;
  b=b17gO5pQdQv95xX4VZ7kRbBMRCJOU7vmafAfR0azzm7Jt/Pa05ho+/Iv
   8pqmA4doPTQNnn/V5kg8iMneG8cpjNiGub1jT6UPKyTD8acViorboOBAp
   HSVHwT0egUl3RZyG7ijcYbcA+BjAvlhzKfQy39YfVdwJUj6bWP8Pyprwy
   uK+dgl38kevLGIKXyX6n9/YS1mR82piZmvI9x8HnbTh0EJpRUiFsuNUPl
   2TSkpOoYzCOOg7+Mnl9ld8Kr5H+ftxfOSqjt1cUZiwRBUdOd57BdrKZ3G
   CX7PasDXvuOa6lvCEhmmC/iq9jNyziZUi9k42MKMWLyGuaHQ1pQauw6JO
   Q==;
X-CSE-ConnectionGUID: dx6ZUbawRtmA7cmOVMEPeA==
X-CSE-MsgGUID: 770kgLeaSU2oF2ruxs/jiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="37378655"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="37378655"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 03:38:25 -0700
X-CSE-ConnectionGUID: bqmZoziKTVSz+n/Sx2xNjA==
X-CSE-MsgGUID: uWK6EzWBSEy7DgV2vPKR2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="53577927"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jul 2024 03:38:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXeog-000ps4-07;
	Sat, 27 Jul 2024 10:38:22 +0000
Date: Sat, 27 Jul 2024 18:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 7/7]
 arch/x86/include/asm/special_insns.h:68:8: error: expected ')'
Message-ID: <202407271801.w7KxP4cn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   caecd138f3c820b6e24d9fa9eb0ee20d755cd5c0
commit: caecd138f3c820b6e24d9fa9eb0ee20d755cd5c0 [7/7] todo
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240727/202407271801.w7KxP4cn-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407271801.w7KxP4cn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407271801.w7KxP4cn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:9:
   In file included from arch/x86/include/asm/nospec-branch.h:6:
   In file included from include/linux/static_key.h:1:
   In file included from include/linux/jump_label.h:112:
   arch/x86/include/asm/jump_label.h:44:3: error: expected ':'
      44 |                 JUMP_TABLE_ENTRY
         |                 ^
   arch/x86/include/asm/jump_label.h:18:2: note: expanded from macro 'JUMP_TABLE_ENTRY'
      18 |         FAKE_SYMBOL(__jump_table_, 16)                  \
         |         ^
   arch/x86/include/asm/jump_label.h:58:3: error: expected ':'
      58 |                 JUMP_TABLE_ENTRY
         |                 ^
   arch/x86/include/asm/jump_label.h:18:2: note: expanded from macro 'JUMP_TABLE_ENTRY'
      18 |         FAKE_SYMBOL(__jump_table_, 16)                  \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:25:
>> arch/x86/include/asm/special_insns.h:68:8: error: expected ')'
      68 |                      _ASM_EXTABLE(1b, 2b)
         |                      ^
   arch/x86/include/asm/asm.h:232:2: note: expanded from macro '_ASM_EXTABLE'
     232 |         _ASM_EXTABLE_TYPE(from, to, EX_TYPE_DEFAULT)
         |         ^
   arch/x86/include/asm/asm.h:202:2: note: expanded from macro '_ASM_EXTABLE_TYPE'
     202 |         FAKE_SYMBOL(__ex_table_, 12)                            \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   include/linux/thread_info.h:249:6: error: expected ')'
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:119:
   arch/x86/include/asm/smp.h:83:2: error: expected ')'
      83 |         BUG();
         |         ^
   arch/x86/include/asm/bug.h:71:2: note: expanded from macro 'BUG'
      71 |         _BUG_FLAGS(ASM_UD2, 0, "");                             \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:11:
   In file included from include/linux/rbtree.h:24:
   include/linux/rcupdate.h:1085:2: error: expected ')'
    1085 |         WARN_ON_ONCE(func != (rcu_callback_t)~0L);
         |         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:12:
   include/linux/maple_tree.h:719:2: error: expected ')'
     719 |         MAS_WARN_ON(mas, mas_is_active(mas) &&
         |         ^
   include/linux/maple_tree.h:701:34: note: expanded from macro 'MAS_WARN_ON'
     701 | #define MAS_WARN_ON(__mas, __x)         WARN_ON(__x)
         |                                         ^
   include/asm-generic/bug.h:125:3: note: expanded from macro 'WARN_ON'
     125 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:103:19: note: expanded from macro '__WARN'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:12:
   include/linux/maple_tree.h:811:3: error: expected ')'
     811 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^
   include/asm-generic/bug.h:125:3: note: expanded from macro 'WARN_ON'
     125 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:103:19: note: expanded from macro '__WARN'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:12:
   include/linux/maple_tree.h:830:3: error: expected ')'
     830 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^
   include/asm-generic/bug.h:125:3: note: expanded from macro 'WARN_ON'
     125 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:103:19: note: expanded from macro '__WARN'
     103 | #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
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
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
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
   arch/x86/include/asm/bug.h:85:2: note: expanded from macro '__WARN_FLAGS'
      85 |         _BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);            \
         |         ^
   arch/x86/include/asm/bug.h:30:8: note: expanded from macro '_BUG_FLAGS'
      30 |                      FAKE_SYMBOL(__bug_table_, 12)                      \
         |                      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:49:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
>> arch/x86/include/asm/msr.h:88:8: error: expected ')'
      88 |                      _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_RDMSR)
         |                      ^
   arch/x86/include/asm/asm.h:202:2: note: expanded from macro '_ASM_EXTABLE_TYPE'
     202 |         FAKE_SYMBOL(__ex_table_, 12)                            \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:49:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:98:8: error: expected ')'
      98 |                      _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR)
         |                      ^
   arch/x86/include/asm/asm.h:202:2: note: expanded from macro '_ASM_EXTABLE_TYPE'
     202 |         FAKE_SYMBOL(__ex_table_, 12)                            \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:49:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:111:8: error: expected ')'
     111 |                      _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR)
         |                      ^
   arch/x86/include/asm/asm.h:202:2: note: expanded from macro '_ASM_EXTABLE_TYPE'
     202 |         FAKE_SYMBOL(__ex_table_, 12)                            \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:49:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:148:8: error: expected ')'
     148 |                      _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %[err])
         |                      ^
   arch/x86/include/asm/asm.h:211:2: note: expanded from macro '_ASM_EXTABLE_TYPE_REG'
     211 |         FAKE_SYMBOL(__ex_table_, 12)                                            \
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:49:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:174:8: error: expected ')'


vim +68 arch/x86/include/asm/special_insns.h

f05e798ad4c0925 David Howells   2012-03-28  56  
f05e798ad4c0925 David Howells   2012-03-28  57  static inline unsigned long native_read_cr4(void)
f05e798ad4c0925 David Howells   2012-03-28  58  {
f05e798ad4c0925 David Howells   2012-03-28  59  	unsigned long val;
f05e798ad4c0925 David Howells   2012-03-28  60  #ifdef CONFIG_X86_32
1ef55be16ed6953 Andy Lutomirski 2016-09-29  61  	/*
1ef55be16ed6953 Andy Lutomirski 2016-09-29  62  	 * This could fault if CR4 does not exist.  Non-existent CR4
1ef55be16ed6953 Andy Lutomirski 2016-09-29  63  	 * is functionally equivalent to CR4 == 0.  Keep it simple and pretend
1ef55be16ed6953 Andy Lutomirski 2016-09-29  64  	 * that CR4 == 0 on CPUs that don't have CR4.
1ef55be16ed6953 Andy Lutomirski 2016-09-29  65  	 */
f05e798ad4c0925 David Howells   2012-03-28  66  	asm volatile("1: mov %%cr4, %0\n"
f05e798ad4c0925 David Howells   2012-03-28  67  		     "2:\n"
f05e798ad4c0925 David Howells   2012-03-28 @68  		     _ASM_EXTABLE(1b, 2b)
aa5cacdc29d76a0 Arvind Sankar   2020-09-02  69  		     : "=r" (val) : "0" (0), __FORCE_ORDER);
f05e798ad4c0925 David Howells   2012-03-28  70  #else
1ef55be16ed6953 Andy Lutomirski 2016-09-29  71  	/* CR4 always exists on x86_64. */
aa5cacdc29d76a0 Arvind Sankar   2020-09-02  72  	asm volatile("mov %%cr4,%0\n\t" : "=r" (val) : __FORCE_ORDER);
f05e798ad4c0925 David Howells   2012-03-28  73  #endif
f05e798ad4c0925 David Howells   2012-03-28  74  	return val;
f05e798ad4c0925 David Howells   2012-03-28  75  }
f05e798ad4c0925 David Howells   2012-03-28  76  

:::::: The code at line 68 was first introduced by commit
:::::: f05e798ad4c09255f590f5b2c00a7ca6c172f983 Disintegrate asm/system.h for X86

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
