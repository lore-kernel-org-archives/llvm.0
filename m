Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515178;
	b=l6n44pTZKXPlqxqXB9yAERekKLq1Gf5wnXg23uDfT+6MiasoeXeUNoQcLeP5ZFUa1Txy
	 bhZta/PAFj5MAXN5xJcJfa8YWnpNDkshTgSUOfcwaxkUIQ2Ch41Wpjj5DvtOTXiEz6Fie
	 sKm1imxg0frRZ+OfJacdBoV8gL7Wm4zgHlnUZuNMczqB4EwGOgtFzDaCaj2Hj5v8u2JDp
	 RQs6Q0L1vLGXZNc6KBhNznLHD6q0bHXP6yRBP7je55pcx2g3x/zhDSFZFjqhqrS1bLxLX
	 +WPqLKutRdbtIVhr8TaYQ+Eaf7TT/K9OAa5Srwi/wyqOGxlv8pane0SbS2OS6B+GHCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=V2bvuNl35tQkqTZ69qXlBPrWWe2wCsDlSJiMQswZ+5Y=;
	b=1dggD6uP3mH9kPCQ+vJvBhQRdSvAK10PoKvCx3tHEy9WZ7IPmJJVyUQ0GsSR0DpgTE5n
	 KxDZ5U0Au5jlTMitahlvtLbi87P5fKwzKO3GE1PXPeSewjIrlSHUz0OSpRzt0GAaX09Bg
	 O/b7/yxy0foAZ0wRAt0qN2KrHMV6cGWmvO6udXyvdnFb8CddUoSWokiWWOZ5x86NssGk9
	 cCd+XClkt81t6awdALvawZRErnlTAYnD7TTfFWnl95yAXQsz0uTslvrHZydOl8E3XvUy9
	 hsspa+UGV8mrGrkcI0euznwgqI2hscq617ZL79yLk56/eI4uAZqD87k5+ew4+/8HFLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L1roVlnR;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658EC60A2616;
	Tue, 20 Oct 2026 16:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 658EC60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L1roVlnR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792515176; x=1824051176;
  h=date:from:to:cc:subject:message-id;
  bh=uCcA3cShPd6FnU2FUJpCwQJqgRrJEcGxrVxMMIygozQ=;
  b=L1roVlnRP/9vDOammQ+juZtgsaxw/0eMK7Te6cJDuxpUne/h3GF5gx2c
   Sjhzrg5wvFg8C9ebGV4PmVkQlL0WilHcDYKw7TYWXEGNV4eS4xFgp1vDl
   VJ0CLpepErRYpBDYutIutUEeB1ORxigvlbeQpz9W6wPRRoaCtjPvqSaaN
   LuynyefqMCJv1GUYYcznTjfDNgDBUBe3KcwOylR0sLWPNUtIwdG8mh7ef
   6xZBmqGy+p8M61k4XD4dr0rcJ8UGtzAD+Ja/E8CvvPXK9ZZ4XgyDlSy6w
   KQtNAkMqfJUumyK9tb42YdqRn20omlAUEsPcwlKAaYOG3HHVEWC5/ZF9B
   A==;
X-CSE-ConnectionGUID: pQMI2z7XTj+7e6zB7Xbt3Q==
X-CSE-MsgGUID: tRj6gMUmQSCJsUOz4ZD1/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1234454"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1234454"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 09:52:56 -0700
X-CSE-ConnectionGUID: coFdsEMJT9i+oAM71OHcbA==
X-CSE-MsgGUID: GojNYGPMT/uGEsd1wTB2qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3266158"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 Oct 2026 09:52:55 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJD52-000000006Nn-0Ar8;
	Tue, 20 Oct 2026 16:52:52 +0000
Date: Tue, 20 Oct 2026 18:52:39 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss-2026-10-19 16/24]
 include/linux/thread_info.h:237:20: error: redefinition of
 'arch_kernel_shstk_enabled'
Message-ID: <202610201825.xLWRqhn5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss-2026-10-19
head:   b28e7d03a8472efab137c77cbb5dd666fa08e9a7
commit: 967449663fb3eb7dcca67c4652293712530809c8 [16/24] arch-shadow-stacks-enabled
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261020/202610201825.xLWRqhn5-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201825.xLWRqhn5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201825.xLWRqhn5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:17:
   In file included from include/linux/smp.h:118:
   In file included from include/linux/thread_info.h:62:
>> arch/x86/include/asm/thread_info.h:237:6: warning: no previous prototype for function 'arch_kernel_shstk_enabled' [-Wmissing-prototypes]
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^
   arch/x86/include/asm/thread_info.h:237:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     237 | bool arch_kernel_shstk_enabled(void)
         | ^
         | static 
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:17:
   In file included from include/linux/smp.h:118:
>> include/linux/thread_info.h:237:8: warning: attribute declaration must precede definition [-Wignored-attributes]
     237 | static inline bool arch_kernel_shstk_enabled(void)
         |        ^
   include/linux/compiler_types.h:235:23: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                       ^
   include/linux/compiler_attributes.h:165:56: note: expanded from macro '__gnu_inline'
     165 | #define __gnu_inline                    __attribute__((__gnu_inline__))
         |                                                        ^
   arch/x86/include/asm/thread_info.h:237:6: note: previous definition is here
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:17:
   In file included from include/linux/smp.h:118:
>> include/linux/thread_info.h:237:8: warning: attribute declaration must precede definition [-Wignored-attributes]
     237 | static inline bool arch_kernel_shstk_enabled(void)
         |        ^
   include/linux/compiler_types.h:235:36: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                                    ^
   include/linux/compiler_types.h:257:31: note: expanded from macro '__inline_maybe_unused'
     257 | #define __inline_maybe_unused __maybe_unused
         |                               ^
   include/linux/compiler_attributes.h:352:56: note: expanded from macro '__maybe_unused'
     352 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   arch/x86/include/asm/thread_info.h:237:6: note: previous definition is here
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:17:
   In file included from include/linux/smp.h:118:
>> include/linux/thread_info.h:237:8: warning: attribute declaration must precede definition [-Wignored-attributes]
     237 | static inline bool arch_kernel_shstk_enabled(void)
         |        ^
   include/linux/compiler_types.h:235:58: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                                                          ^
   arch/x86/include/asm/linkage.h:9:32: note: expanded from macro 'notrace'
       9 | #define notrace __attribute__((no_instrument_function))
         |                                ^
   arch/x86/include/asm/thread_info.h:237:6: note: previous definition is here
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:17:
   In file included from include/linux/smp.h:118:
>> include/linux/thread_info.h:237:20: error: redefinition of 'arch_kernel_shstk_enabled'
     237 | static inline bool arch_kernel_shstk_enabled(void)
         |                    ^
   arch/x86/include/asm/thread_info.h:237:6: note: previous definition is here
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:


vim +/arch_kernel_shstk_enabled +237 include/linux/thread_info.h

e66101020b3651 Dave Hansen 2026-10-19  235  
5daba193b8cf42 Dave Hansen 2026-10-19  236  #ifndef arch_kernel_shstk_enabled
5daba193b8cf42 Dave Hansen 2026-10-19 @237  static inline bool arch_kernel_shstk_enabled(void)
5daba193b8cf42 Dave Hansen 2026-10-19  238  {
5daba193b8cf42 Dave Hansen 2026-10-19  239  	return false;
5daba193b8cf42 Dave Hansen 2026-10-19  240  }
5daba193b8cf42 Dave Hansen 2026-10-19  241  #endif
5daba193b8cf42 Dave Hansen 2026-10-19  242  

:::::: The code at line 237 was first introduced by commit
:::::: 5daba193b8cf422043348d59ff40fbda09a528d7 kernel/task: Add "runtime" check for shadow stack support

:::::: TO: Dave Hansen <dave.hansen@linux.intel.com>
:::::: CC: Dave Hansen <dave.hansen@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
