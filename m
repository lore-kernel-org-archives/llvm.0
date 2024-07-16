Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58A01E498;
	Tue, 16 Jul 2024 12:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721133971; cv=none; b=QsrNMPSB1pYYoU8lsOd6eBe+L/OCfGpshsKqUuK6Lt43WXlq8y+M0NWjDjztM55giSuUmkxlPsdHGQFEzIcqdtKmpaP1vV31ytn6vjImr15bxs5xyS3TM6gcPpLrUthJ7FDKwzM1LUrBbj5IMpVdbashCYH/S948MFEfAKoS4ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721133971; c=relaxed/simple;
	bh=UaW80XjdxyTaYoTuMeCQ/FBqDlnT80EdSphwChvjpjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XVqTRMYpUWjF15HexssoKPRQKyuk0r2xOipR9r9ClVtTpWanpmXbse23ny4I50pR0wCAqjkVKml8z8s35Ki9rPjw1r3eOBzM7CZUgNT1AnwZYHFcs/WjRrUlBiJNQpQDaz+99f3ERQ604SaWAhNdze0phNy3v9EXJgU4qtSf/ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBsrOdJr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBsrOdJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721133969; x=1752669969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UaW80XjdxyTaYoTuMeCQ/FBqDlnT80EdSphwChvjpjA=;
  b=FBsrOdJr4fYvPccBIhm3H8UxsMdBLNIcwQ6R9xJ5vJOSrAwkwMLxOdRX
   5gS0V/ZwhIzUE8YDL/iYce5pM4A/P4je3l6/xYlx1QtX4LlXB0smVV82k
   581RoWiJwQ16AvcYj9JugviHPwEptJuY/wNnxO996O9kl0Hl2ye5ri4NO
   E+I7AfHW8eQGMtGMQpgdhG1N/qjAghZO+iI8hELr6l24J2/vGermErQWa
   X38kQGUCveG5d46BgaY2AGVvI4EVCOK2/gRDZCo9zspPw5g/Ce/KNvwcK
   KAlSbfYiEDH/fqxoo5k4O25tys3fr/fK3S9CeE0bXy3EnvVn+2KrdjaFn
   A==;
X-CSE-ConnectionGUID: UlxrEJweSQyIeKJI/S8jHA==
X-CSE-MsgGUID: Db7Yk6gAR1Sfv5yJ1HetXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="22330254"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="22330254"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 05:45:55 -0700
X-CSE-ConnectionGUID: 2nw7+WKYSqasEl/3kbjUlw==
X-CSE-MsgGUID: oGHHpydRTSO1eOpAx6P1jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49928275"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jul 2024 05:45:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sThZ1-000fDu-0B;
	Tue, 16 Jul 2024 12:45:51 +0000
Date: Tue, 16 Jul 2024 20:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 8/8] arch/x86/include/asm/smp.h:83:2: error:
 expected ')'
Message-ID: <202407162049.EEInf5SQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   bc3cdfe89249cdc982760e0fb48820b399935d43
commit: bc3cdfe89249cdc982760e0fb48820b399935d43 [8/8] working with klp-test.patch
config: i386-buildonly-randconfig-006-20240716 (https://download.01.org/0day-ci/archive/20240716/202407162049.EEInf5SQ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407162049.EEInf5SQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407162049.EEInf5SQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
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
>> arch/x86/include/asm/smp.h:83:2: error: expected ')'
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


vim +83 arch/x86/include/asm/smp.h

93be71b672f167 include/asm-x86/smp.h      Alex Nixon     2008-08-22  79  
eab89405b6b599 arch/x86/include/asm/smp.h Josh Poimboeuf 2023-02-13  80  static inline void __noreturn play_dead(void)
93be71b672f167 include/asm-x86/smp.h      Alex Nixon     2008-08-22  81  {
93be71b672f167 include/asm-x86/smp.h      Alex Nixon     2008-08-22  82  	smp_ops.play_dead();
a02f50b573b3c9 arch/x86/include/asm/smp.h Josh Poimboeuf 2023-02-13 @83  	BUG();
93be71b672f167 include/asm-x86/smp.h      Alex Nixon     2008-08-22  84  }
93be71b672f167 include/asm-x86/smp.h      Alex Nixon     2008-08-22  85  

:::::: The code at line 83 was first introduced by commit
:::::: a02f50b573b3c90a3633a5ab67435fe4c0de144d x86/cpu: Make sure play_dead() doesn't return

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
