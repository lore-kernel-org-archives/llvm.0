Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582762;
	b=vfVtLEIrjYEqqJ1syNo3bZq7BQje7Qz4TWNBH6HB3tTF2ZGQrBkZw+nMJJQyE1wPFUTN
	 GeoGORSqSIaeYRoycWxGYm1vOgulfDb0iGzTq7hsSi58/RF2XmiU2cZw9sxFLRszHejJS
	 p7FVriHEfXWjXsSrVkFnUu24jVxpqxWHYZKtnktF/LjXczqOnEdbFiJ/ZRmK4+8Hn6Kcz
	 ikEUzIisBCM/TjGf/ELpqvjwjj6U6y4fc5XEb5xJh64OdgN662+ihK0eIGEm/Y+Mtc6nd
	 BIz3r8heDPhxBAPrZ0FaohuTtExvuDtEdRSxPwuvFjnGbfrU0rdwULgKkph8UEYe+Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582762;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QPNcD/BUBiidjkyP2LOhZ/njSh25ZE3K0q39XJXXp7o=;
	b=Qsv15h9WYvwwio70mudFi6WbX7Ej4dOqF/zJR4xhNKo0C1INjYvgKR83Bwr8ywXdUlC1
	 tGZvf4kjFLFlEAwdS9/S9t7TFaVSIJVePru/2q8eKC+G3pDRx6F3+OF0CpafQ+y/VdEGO
	 5haEBXJj8JWAX4u4mN91z5UOZnclRCLjZefHdQOYcQFxLbr2cjFp+hpO8VR05JV6VXLmy
	 QCuaPNei4KJVqhrvEDOvrhW3LAvOJcMLtIk3THgANTv9tNGFStTE12wdGWWWu4qFzBmgj
	 rMTfdxXTUvFFu3cKmkcVFfxsqN8nomlxuazF8UQ2oLkpqjHANi8ltciBNh/2JLs+tcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XkW2kMdI;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B06606A32A;
	Wed, 21 Oct 2026 11:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B06606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XkW2kMdI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792582761; x=1824118761;
  h=date:from:to:cc:subject:message-id;
  bh=rhuBNfQzaloR/dco56J8IFqfKS8LZdPnrIgxOh+z66s=;
  b=XkW2kMdI/fz35n/hHPIgsHY7TbLoWOvR3Nrtgn70EKiRXO6QGMyrx5Z8
   iHtXXwgA7Yur5ljgfnF2qSMOKHh7XPyaw3cs+fh/GK7IifqmrgAGYL0Pl
   hz5G0fO2YMJbCgaKqafmJed/cH9UZeDT2oayx9EORHxoZ6bfnWSnJViZq
   zdgGiYIZtxXoNGzLoaFsu+TJu58rjHMYldNTcqBnj1CMqwER+upskg84Q
   RD8ceN6v6ked4WwAxo0XUDm1BydyL8Z/VogmLY9Sbip/0DsIKlPWTJa/R
   1VKDXiwuk8EEFqXyDinOSUl9brHgIQ4wr/+q4sFzR6dHTtqjqSlHcmCBf
   g==;
X-CSE-ConnectionGUID: Xgx6JHJxTqKCa8zcMcqqtw==
X-CSE-MsgGUID: /zlParlpT1eIYlaQfdG9JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1305992"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1305992"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:39:19 -0700
X-CSE-ConnectionGUID: RFwX2m/2R0CQLk4EazI00w==
X-CSE-MsgGUID: RNyOO3vJTdecD27C0/PRvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="2955044"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Oct 2026 04:39:18 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJUf5-00000000PQ0-3UyI;
	Wed, 21 Oct 2026 11:39:15 +0000
Date: Wed, 21 Oct 2026 19:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss-2026-10-19 16/24]
 include/linux/thread_info.h:237:20: error: redefinition of
 'arch_kernel_shstk_enabled'
Message-ID: <202610211957.fjqhvrV9-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261021/202610211957.fjqhvrV9-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610211957.fjqhvrV9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610211957.fjqhvrV9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:17:
   In file included from include/linux/smp.h:118:
   In file included from include/linux/thread_info.h:62:
   arch/x86/include/asm/thread_info.h:237:6: warning: no previous prototype for function 'arch_kernel_shstk_enabled' [-Wmissing-prototypes]
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
   include/linux/thread_info.h:237:8: warning: attribute declaration must precede definition [-Wignored-attributes]
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
   include/linux/thread_info.h:237:8: warning: attribute declaration must precede definition [-Wignored-attributes]
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
   include/linux/thread_info.h:237:8: warning: attribute declaration must precede definition [-Wignored-attributes]
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
