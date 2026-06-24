Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD6731F98E;
	Wed, 24 Jun 2026 18:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782326558; cv=none; b=WtN2yEHxz50oaGc+QBtfWG97pyI9ewVHA5ievFagXjNok7v009XRCNs9ipF8VG83TE4+8L0my72OOFeBbi8HpTR1UfAx7x+pmD0XZaJxCooOuXmOB681riScvX1mLE3Gu/MTM8vommb+KdLEnssy0VfpTWCFhetsvRu5Qd/sQb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782326558; c=relaxed/simple;
	bh=A4WCB5AL7OuBKnE7aYZTJX/nxXzSeC/W9F/KWmnOpTk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UBVbJhKyN8CwiKM422Fwo4zI7fVxErmwvXRRoAozTfsXz2XYP1SGipAl8waJ6OeF8RMn2Hn8axEoiFgIfCDMLAKSbOuA0HUg3fpYP2oShVBf2BxrG858bqiOhtGIGk9w+kg7OiiwLJRpMvpI2/+dqelMmrWtWS+hrfnLOabbGbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HN9qn8zd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HN9qn8zd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782326555; x=1813862555;
  h=date:from:to:cc:subject:message-id;
  bh=A4WCB5AL7OuBKnE7aYZTJX/nxXzSeC/W9F/KWmnOpTk=;
  b=HN9qn8zdQH0S8le0mI4dtXbVMKFNEc0cBknMUBQwfzOHcIHuHR4gbBgQ
   JgkNDvan5++stO4R2xQTH/MhP5XV5I9jo5U6szjk2bH78UVmXOxNWoKfp
   TZ91n0ZTruH5UmrC2RlyAoBRxfdfDS9RAHyrIYziTN10JBWinA+CTlJbv
   9ObOC8cAKBpZI1yJp5QcxGwMSPVr1E+dPiQYdUZ54X9LZy6gYy+XUoOZU
   w/zDAJciSQiK63bomMXzyRHkNAMUeH4P5bDl5VGLObuAtdY6Mwn2gQ7BE
   rhoY1yxhR1q+m7J8dsQBwugkqHmjw5Q7DnxFxkEJTi3gsxrcM+kcyGxYd
   g==;
X-CSE-ConnectionGUID: GdRi1bDQREqcmdf87zjScA==
X-CSE-MsgGUID: D0pg851ITuyuQTslx0QOJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="108645860"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="108645860"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 11:42:34 -0700
X-CSE-ConnectionGUID: vcyMUtlWRfCqrcFkLjonpw==
X-CSE-MsgGUID: LoGcG5heQmqmGlHuD2k3iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="288106986"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Jun 2026 11:42:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcSYN-000000003c1-29vO;
	Wed, 24 Jun 2026 18:42:28 +0000
Date: Thu, 25 Jun 2026 02:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Huacai Chen <chenhuacai@kernel.org>
Subject: [linux-next:master 14669/15099]
 include/linux/irqflags.h:44:22: error: type specifier missing, defaults to
 'int'; ISO C99 and later do not support implicit int
Message-ID: <202606250227.zPFkQKDm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4e5dfb7c84012007c3c7061126491bbc92d71bf1
commit: e8738f15a4cb67db74b2cd642327423ef336bb26 [14669/15099] LoongArch: Add THREAD_INFO_IN_TASK implementation
config: loongarch-randconfig-002-20260625 (https://download.01.org/0day-ci/archive/20260625/202606250227.zPFkQKDm-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250227.zPFkQKDm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250227.zPFkQKDm-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5680: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5909: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:12:
   In file included from arch/loongarch/include/asm/current.h:9:
   In file included from arch/loongarch/include/asm/percpu.h:8:
   In file included from arch/loongarch/include/asm/cmpxchg.h:299:
   In file included from include/asm-generic/cmpxchg-local.h:6:
>> include/linux/irqflags.h:44:22: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      44 | DECLARE_PER_CPU(int, hardirqs_enabled);
         |                      ^
         |                      int 
   include/linux/irqflags.h:44:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      44 | DECLARE_PER_CPU(int, hardirqs_enabled);
         | ^
         | int 
   include/linux/irqflags.h:45:22: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      45 | DECLARE_PER_CPU(int, hardirq_context);
         |                      ^
         |                      int 
   include/linux/irqflags.h:45:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      45 | DECLARE_PER_CPU(int, hardirq_context);
         | ^
         | int 
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];


vim +/int +44 include/linux/irqflags.h

a21ee6055c30ce Peter Zijlstra 2020-05-25  43  
a21ee6055c30ce Peter Zijlstra 2020-05-25 @44  DECLARE_PER_CPU(int, hardirqs_enabled);
a21ee6055c30ce Peter Zijlstra 2020-05-25  45  DECLARE_PER_CPU(int, hardirq_context);
a21ee6055c30ce Peter Zijlstra 2020-05-25  46  

:::::: The code at line 44 was first introduced by commit
:::::: a21ee6055c30ce68c4e201c6496f0ed2a1936230 lockdep: Change hardirq{s_enabled,_context} to per-cpu variables

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
