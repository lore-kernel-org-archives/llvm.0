Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747501;
	b=pRRgBDoevhtdEEQ0wndvOmIKqbLh56Xuff4GfTS9Ns4+CmIZu1V5o0WcKYI/4r9/Lrt5
	 hqmlzk68W7ZyYlBjMu2OqrLtO24m5Q6zLi5hkyXe+wIwyXObcPR3uvfLIcQeUsqGi9djm
	 Me8gzUrfgE9Y1df4HDGCrvuJaaJeiwAhi1RfUtXuyvolXvaIqdVTMlLhGgFZxu67eKLIr
	 nIrViiFEy4zLNrUMEY1fTHxMyGwOLZqtUSB7Bt3ZHXvOk5dpDFWN3yHM78nEMZS6sbiTW
	 OTjGfdSYlqQY9wXjP9D+KcBnT85AoW6pd8kF99bGeyj3cqMYI8XMDd2ZYVp0K9sbHWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747501;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KkOek+jIwVTFz/cVMk+e3XvPs4ztIGst63xXWEZIwlY=;
	b=dhlq+v5sYD9S0bT1Vjr1bcHG2ddLvlVbv+QVU7YdXX/Yq/OV4o7qhxSuTo7PU2hEQ/Z+
	 XJzov8B9tzHa9faiJxfp3V+GM9s7agzPjf5zPXExe3rHi5Lcelm2wvFzr5xHHKKkOLzV6
	 moIG7GllL67Sm3NtHyTzvpmS6D9kbQ39qEa/776vo2xdECTRwDRuwjQTbc+SSBPYmR0Q5
	 SndQdqHpYzwSHJwGlnuEqxoeM8rIUhcOiIqvmBHAHpaYO1IoPFB8ZLNyo6QrWQKnBfyW7
	 qUtQ9AcTqpZm4LLXknQebun6mrI1EbISbnGvLUSlwvoAYjDJnx1USspUZhuyG6Vkjlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g5CtpzXI;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351FD606A32A;
	Fri, 23 Oct 2026 09:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 351FD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g5CtpzXI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792747500; x=1824283500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s50A6kxieB2FONiZaEf7DGq9MY8h7LHzfO7wRv+fhok=;
  b=g5CtpzXI+ZZ7s7Tapd/5DoknSAQ401vjzN8ysOL4AGM6f5WXSosA/VQJ
   VYOEoKi9tJSYh75GJCu/jSyhTY8HId09TGObzeH+fgu5h2KMyaq23/ZR2
   nyd+OeP6p/zW/rBwqU8ZtyKpGP51k73+kz9IKvznewpxd1RnVZfVZRfAk
   RZEG74omWHn89vJ6RCJAuS36dCgEdfN/x69qZsEYOgW+qs5i8PooQxeqT
   ta9g+9lmQcX1nQZKZN7HzBvYx3XXbkGkvdDc960h9ZdqhiGL8jHRM3SkQ
   wjIVZdjRy/mjl/TPS8MqWpI4eSo4MWJ+WQACkOEJ475wQ6GLNXVTQOcKC
   w==;
X-CSE-ConnectionGUID: X8uUMgqITneTvyBHeS13OQ==
X-CSE-MsgGUID: oJNxLzMmRIGqT7vRQaPJzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1400980"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1400980"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 02:24:59 -0700
X-CSE-ConnectionGUID: bk0eesT1S0KkVSN81a98mg==
X-CSE-MsgGUID: eeCpDwcuRZWITNjvVBGY8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3707973"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Oct 2026 02:24:57 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKBWA-00000000STQ-3KIH;
	Fri, 23 Oct 2026 09:24:54 +0000
Date: Fri, 23 Oct 2026 17:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Aurelien DESBRIERES <aurelien@hackers.camp>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 17/18] beamfs: add Kconfig and Makefile
Message-ID: <202610231740.6V6mPxsn-lkp@intel.com>
References: <20261019041728.327785-18-aurelien@hackers.camp>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019041728.327785-18-aurelien@hackers.camp>

Hi Aurelien,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 2c3ba1f1cb416b81d617b92a24a4bcaa48d574e3]

url:    https://github.com/intel-lab-lkp/linux/commits/Aurelien-DESBRIERES/beamfs-add-on-disk-format-definitions/20261019-061711
base:   2c3ba1f1cb416b81d617b92a24a4bcaa48d574e3
patch link:    https://lore.kernel.org/r/20261019041728.327785-18-aurelien%40hackers.camp
patch subject: [RFC PATCH 17/18] beamfs: add Kconfig and Makefile
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261023/202610231740.6V6mPxsn-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231740.6V6mPxsn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231740.6V6mPxsn-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: fs/beamfs/beamfs.ko: symbol '__hexagon_udivdi3' undefined!
--
In file included from fs/beamfs/treecheck.c:27:
In file included from include/linux/hashtable.h:14:
In file included from include/linux/rculist.h:11:
In file included from include/linux/rcupdate.h:27:
In file included from include/linux/sched.h:38:
In file included from include/linux/spinlock.h:60:
In file included from include/linux/interrupt_rc.h:17:
In file included from include/linux/smp.h:13:
In file included from include/linux/cpumask.h:15:
In file included from include/linux/numa.h:6:
>> include/linux/nodemask.h:261:9: warning: comparison of integers of different signs: 'int' and 'unsigned long' [-Wsign-compare]
261 |         return min(MAX_NUMNODES, find_first_bit(srcp->bits, MAX_NUMNODES));
|                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/minmax.h:105:19: note: expanded from macro 'min'
105 | #define min(x, y)       __careful_cmp(min, x, y)
|                         ^~~~~~~~~~~~~~~~~~~~~~~~
include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
|         ^                            ~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~
include/linux/minmax.h:95:2: note: expanded from macro '__careful_cmp_once'
95 |         __cmp(op, ux, uy); })
|         ^         ~~  ~~
include/linux/minmax.h:83:30: note: expanded from macro '__cmp'
83 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
|                           ~  ^              ~
<scratch space>:120:1: note: expanded from here
120 | __cmp_op_min
| ^
include/linux/minmax.h:80:22: note: expanded from macro '__cmp_op_min'
80 | #define __cmp_op_min <
|                      ^
In file included from fs/beamfs/treecheck.c:27:
In file included from include/linux/hashtable.h:14:
In file included from include/linux/rculist.h:11:
In file included from include/linux/rcupdate.h:27:
In file included from include/linux/sched.h:38:
In file included from include/linux/spinlock.h:60:
In file included from include/linux/interrupt_rc.h:17:
In file included from include/linux/smp.h:13:
In file included from include/linux/cpumask.h:15:
In file included from include/linux/numa.h:6:
include/linux/nodemask.h:267:9: warning: comparison of integers of different signs: 'int' and 'unsigned long' [-Wsign-compare]
267 |         return min(MAX_NUMNODES, find_next_bit(srcp->bits, MAX_NUMNODES, n+1));
|                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/minmax.h:105:19: note: expanded from macro 'min'
105 | #define min(x, y)       __careful_cmp(min, x, y)
|                         ^~~~~~~~~~~~~~~~~~~~~~~~
include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
|         ^                            ~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~
include/linux/minmax.h:95:2: note: expanded from macro '__careful_cmp_once'
95 |         __cmp(op, ux, uy); })
|         ^         ~~  ~~
include/linux/minmax.h:83:30: note: expanded from macro '__cmp'
83 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
|                           ~  ^              ~
<scratch space>:135:1: note: expanded from here
135 | __cmp_op_min
| ^
include/linux/minmax.h:80:22: note: expanded from macro '__cmp_op_min'
80 | #define __cmp_op_min <
|                      ^
In file included from fs/beamfs/treecheck.c:27:
In file included from include/linux/hashtable.h:14:
In file included from include/linux/rculist.h:11:
In file included from include/linux/rcupdate.h:27:
In file included from include/linux/sched.h:38:
In file included from include/linux/spinlock.h:60:
In file included from include/linux/interrupt_rc.h:17:
In file included from include/linux/smp.h:13:
In file included from include/linux/cpumask.h:15:
In file included from include/linux/numa.h:6:
include/linux/nodemask.h:304:9: warning: comparison of integers of different signs: 'int' and 'unsigned long' [-Wsign-compare]
304 |         return min(MAX_NUMNODES, find_first_zero_bit(maskp->bits, MAX_NUMNODES));
|                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/minmax.h:105:19: note: expanded from macro 'min'
105 | #define min(x, y)       __careful_cmp(min, x, y)
|                         ^~~~~~~~~~~~~~~~~~~~~~~~
include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
|         ^                            ~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~
include/linux/minmax.h:95:2: note: expanded from macro '__careful_cmp_once'
95 |         __cmp(op, ux, uy); })
|         ^         ~~  ~~
include/linux/minmax.h:83:30: note: expanded from macro '__cmp'
83 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
|                           ~  ^              ~
<scratch space>:150:1: note: expanded from here
150 | __cmp_op_min
| ^
include/linux/minmax.h:80:22: note: expanded from macro '__cmp_op_min'
80 | #define __cmp_op_min <
|                      ^
In file included from fs/beamfs/treecheck.c:27:
In file included from include/linux/hashtable.h:14:
In file included from include/linux/rculist.h:11:
In file included from include/linux/rcupdate.h:27:
In file included from include/linux/sched.h:38:
In file included from include/linux/spinlock.h:60:
In file included from include/linux/interrupt_rc.h:17:
In file included from include/linux/smp.h:13:
>> include/linux/cpumask.h:477:9: warning: comparison of integers of different signs: 'unsigned int' and 'int' [-Wsign-compare]
477 |                 if (i != cpu)
|                     ~ ^  ~~~
include/linux/cpumask.h:503:8: warning: comparison of integers of different signs: 'unsigned int' and 'int' [-Wsign-compare]
503 |         if (i != cpu)
|             ~ ^  ~~~
include/linux/cpumask.h:530:8: warning: comparison of integers of different signs: 'unsigned int' and 'int' [-Wsign-compare]
530 |         if (i != cpu)
|             ~ ^  ~~~
In file included from fs/beamfs/treecheck.c:27:
In file included from include/linux/hashtable.h:14:
In file included from include/linux/rculist.h:11:
In file included from include/linux/rcupdate.h:27:
In file included from include/linux/sched.h:38:
>> include/linux/spinlock.h:564:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
564 | DEFINE_LOCK_GUARD_1_COND(raw_spinlock, _try, raw_spin_trylock(_T->lock))
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:27:
In file included from include/linux/hashtable.h:14:
In file included from include/linux/rculist.h:11:
In file included from include/linux/rcupdate.h:27:
In file included from include/linux/sched.h:38:
include/linux/spinlock.h:580:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
580 | DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq(_T->lock))
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:27:
In file included from include/linux/hashtable.h:14:
In file included from include/linux/rculist.h:11:
In file included from include/linux/rcupdate.h:27:
In file included from include/linux/sched.h:38:
include/linux/spinlock.h:590:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
590 | DEFINE_LOCK_GUARD_1_COND(raw_spinlock_bh, _try, raw_spin_trylock_bh(_T->lock))
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:27:
In file included from include/linux/hashtable.h:14:
In file included from include/linux/rculist.h:11:
In file included from include/linux/rcupdate.h:27:
In file included from include/linux/sched.h:38:
include/linux/spinlock.h:601:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
601 | DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
602 |                          raw_spin_trylock_irqsave(_T->lock, _T->flags))
|                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
--
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:27:
In file included from include/linux/hashtable.h:14:
In file included from include/linux/rculist.h:11:
In file included from include/linux/rcupdate.h:27:
In file included from include/linux/sched.h:38:
include/linux/spinlock.h:626:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
626 | DEFINE_LOCK_GUARD_1_COND(spinlock_irq, _try,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
627 |                          spin_trylock_irq(_T->lock))
|                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:27:
In file included from include/linux/hashtable.h:14:
In file included from include/linux/rculist.h:11:
In file included from include/linux/rcupdate.h:27:
In file included from include/linux/sched.h:38:
include/linux/spinlock.h:637:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
637 | DEFINE_LOCK_GUARD_1_COND(spinlock_bh, _try,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
638 |                          spin_trylock_bh(_T->lock))
|                          ~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:27:
In file included from include/linux/hashtable.h:14:
In file included from include/linux/rculist.h:11:
In file included from include/linux/rcupdate.h:27:
In file included from include/linux/sched.h:38:
include/linux/spinlock.h:649:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
649 | DEFINE_LOCK_GUARD_1_COND(spinlock_irqsave, _try,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
650 |                          spin_trylock_irqsave(_T->lock, _T->flags))
|                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:28:
In file included from include/linux/slab.h:17:
In file included from include/linux/gfp.h:7:
In file included from include/linux/mmzone.h:17:
In file included from include/linux/seqlock.h:20:
>> include/linux/mutex.h:254:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
254 | DEFINE_LOCK_GUARD_1_COND(mutex, _try, mutex_trylock(_T->lock))
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:28:
In file included from include/linux/slab.h:17:
In file included from include/linux/gfp.h:7:
In file included from include/linux/mmzone.h:17:
In file included from include/linux/seqlock.h:20:
include/linux/mutex.h:255:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
255 | DEFINE_LOCK_GUARD_1_COND(mutex, _intr, mutex_lock_interruptible(_T->lock), _RET == 0)
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:28:
In file included from include/linux/slab.h:17:
In file included from include/linux/gfp.h:7:
In file included from include/linux/mmzone.h:17:
In file included from include/linux/seqlock.h:20:
include/linux/mutex.h:256:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
256 | DEFINE_LOCK_GUARD_1_COND(mutex, _kill, mutex_lock_killable(_T->lock), _RET == 0)
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:28:
In file included from include/linux/slab.h:17:
In file included from include/linux/gfp.h:7:
In file included from include/linux/mmzone.h:22:
In file included from include/linux/mm_types.h:13:
>> include/linux/rwsem.h:260:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
260 | DEFINE_LOCK_GUARD_1_COND(rwsem_read, _try, down_read_trylock(_T->lock))
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:28:
In file included from include/linux/slab.h:17:
In file included from include/linux/gfp.h:7:
In file included from include/linux/mmzone.h:22:
In file included from include/linux/mm_types.h:13:
include/linux/rwsem.h:261:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
261 | DEFINE_LOCK_GUARD_1_COND(rwsem_read, _intr, down_read_interruptible(_T->lock), _RET == 0)
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:28:
In file included from include/linux/slab.h:17:
In file included from include/linux/gfp.h:7:
In file included from include/linux/mmzone.h:22:
In file included from include/linux/mm_types.h:13:
include/linux/rwsem.h:271:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
271 | DEFINE_LOCK_GUARD_1_COND(rwsem_write, _try, down_write_trylock(_T->lock))
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:28:
In file included from include/linux/slab.h:17:
In file included from include/linux/gfp.h:7:
In file included from include/linux/mmzone.h:22:
In file included from include/linux/mm_types.h:13:
include/linux/rwsem.h:272:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
272 | DEFINE_LOCK_GUARD_1_COND(rwsem_write, _kill, down_write_killable(_T->lock), _RET == 0)
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:580:40: note: expanded from macro 'DEFINE_LOCK_GUARD_1_COND'
580 | #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
|                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:28:
In file included from include/linux/slab.h:17:
In file included from include/linux/gfp.h:7:
In file included from include/linux/mmzone.h:22:
In file included from include/linux/mm_types.h:19:
In file included from include/linux/workqueue.h:9:
>> include/linux/alloc_tag.h:145:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
145 |         for_each_possible_cpu(cpu) {
|         ^~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cpumask.h:1140:36: note: expanded from macro 'for_each_possible_cpu'
1140 | #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
|                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cpumask.h:381:2: note: expanded from macro 'for_each_cpu'
381 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/find.h:584:70: note: expanded from macro 'for_each_set_bit'
584 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
|                                                                        ~~~  ^  ~~~~
In file included from fs/beamfs/treecheck.c:28:
In file included from include/linux/slab.h:17:
In file included from include/linux/gfp.h:7:
In file included from include/linux/mmzone.h:23:
include/linux/page-flags.h:329:34: warning: comparison of integers of different signs: 'const unsigned long' and 'long' [-Wsign-compare]
329 |         return READ_ONCE(page->flags.f) == PAGE_POISON_PATTERN;
|                          ~~~~~~~~~~~~~  ^  ~~~~~~~~~~~~~~~~~~~
In file included from fs/beamfs/treecheck.c:28:
In file included from include/linux/slab.h:17:
In file included from include/linux/gfp.h:7:
In file included from include/linux/mmzone.h:1627:
In file included from include/linux/memory_hotplug.h:7:
In file included from include/linux/notifier.h:16:
In file included from include/linux/srcu.h:96:
>> include/linux/srcutree.h:390:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
390 |         for_each_possible_cpu(cpu) {
|         ^~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cpumask.h:1140:36: note: expanded from macro 'for_each_possible_cpu'
1140 | #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
|                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cpumask.h:381:2: note: expanded from macro 'for_each_cpu'
381 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/find.h:584:70: note: expanded from macro 'for_each_set_bit'
584 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
|                                                                        ~~~  ^  ~~~~
In file included from fs/beamfs/treecheck.c:28:
In file included from include/linux/slab.h:17:
In file included from include/linux/gfp.h:7:
include/linux/mmzone.h:1852:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
1852 |         if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
|                              ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
include/linux/compiler.h:76:40: note: expanded from macro 'likely'
76 | # define likely(x)      __builtin_expect(!!(x), 1)
|                                             ^
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:13:
In file included from include/linux/fs.h:5:
In file included from include/linux/fs/super.h:5:
In file included from include/linux/fs/super_types.h:13:
In file included from include/linux/percpu-rwsem.h:7:
In file included from include/linux/rcuwait.h:6:
In file included from include/linux/sched/signal.h:10:
In file included from include/linux/sched/task.h:13:
In file included from include/linux/uaccess.h:11:
>> include/linux/ucopysize.h:48:29: warning: comparison of integers of different signs: 'int' and 'size_t' (aka 'unsigned int') [-Wsign-compare]
48 |         if (unlikely(sz >= 0 && sz < bytes)) {
|                                 ~~ ^ ~~~~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:13:
In file included from include/linux/fs.h:5:
In file included from include/linux/fs/super.h:5:
In file included from include/linux/fs/super_types.h:13:
>> include/linux/percpu-rwsem.h:134:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
134 | DEFINE_GUARD_COND(percpu_read, _try, percpu_down_read_trylock(_T))
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:413:33: note: expanded from macro 'DEFINE_GUARD_COND'
413 | #define DEFINE_GUARD_COND(X...) CONCATENATE(DEFINE_GUARD_COND_, COUNT_ARGS(X))(X)
|                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:13:
>> include/linux/fs.h:949:33: warning: comparison of integers of different signs: '__size_t' (aka 'unsigned int') and 'int' [-Wsign-compare]
949 |         VFS_WARN_ON_INODE(strlen(link) != linklen, inode);
|                           ~~~~~~~~~~~~ ^  ~~~~~~~
include/linux/vfsdebug.h:26:22: note: expanded from macro 'VFS_WARN_ON_INODE'
26 |         int __ret_warn = !!(cond);                                      \
|                             ^~~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:14:
In file included from include/linux/fs_context.h:14:
In file included from include/linux/security.h:33:
In file included from include/linux/mm.h:18:
>> include/linux/mmap_lock.h:632:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
632 | DEFINE_GUARD_COND(mmap_read_lock, _try, mmap_read_trylock(_T))
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:413:33: note: expanded from macro 'DEFINE_GUARD_COND'
413 | #define DEFINE_GUARD_COND(X...) CONCATENATE(DEFINE_GUARD_COND_, COUNT_ARGS(X))(X)
|                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:14:
In file included from include/linux/fs_context.h:14:
In file included from include/linux/security.h:33:
In file included from include/linux/mm.h:31:
>> include/linux/pgtable.h:1714:16: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
1714 |         for (i = 0; i < nr; ++i, ++ptep, addr += PAGE_SIZE) {
|                     ~ ^ ~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:14:
In file included from include/linux/fs_context.h:14:
In file included from include/linux/security.h:33:
In file included from include/linux/mm.h:35:
>> include/linux/cacheinfo.h:129:16: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
129 |         for (i = 0; i < ci->num_leaves; i++) {
|                     ~ ^ ~~~~~~~~~~~~~~
>> include/linux/cacheinfo.h:130:30: warning: comparison of integers of different signs: 'unsigned int' and 'int' [-Wsign-compare]
130 |                 if (ci->info_list[i].level == level) {
|                     ~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:14:
In file included from include/linux/fs_context.h:14:
In file included from include/linux/security.h:33:
>> include/linux/mm.h:1130:16: warning: comparison of integers of different signs: 'int' and 'size_t' (aka 'unsigned int') [-Wsign-compare]
1130 |         for (i = 0; i < count; i++)
|                     ~ ^ ~~~~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:14:
In file included from include/linux/fs_context.h:14:
In file included from include/linux/security.h:33:
In file included from include/linux/mm.h:1826:
In file included from include/linux/huge_mm.h:8:
In file included from include/linux/kobject.h:20:
In file included from include/linux/sysfs.h:16:
In file included from include/linux/kernfs.h:12:
>> include/linux/idr.h:344:43: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
344 |         return ida_find_first_range(ida, id, id) == id;
|                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:14:
In file included from include/linux/fs_context.h:14:
In file included from include/linux/security.h:33:
In file included from include/linux/mm.h:3085:
include/linux/vmstat.h:240:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
240 |         for_each_online_cpu(cpu)
|         ^~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cpumask.h:1141:36: note: expanded from macro 'for_each_online_cpu'
1141 | #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
|                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cpumask.h:381:2: note: expanded from macro 'for_each_cpu'
381 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/find.h:584:70: note: expanded from macro 'for_each_set_bit'
584 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
|                                                                        ~~~  ^  ~~~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:14:
In file included from include/linux/fs_context.h:14:
In file included from include/linux/security.h:35:
In file included from include/linux/bpf.h:32:
In file included from include/linux/static_call.h:135:
In file included from include/linux/cpu.h:17:
In file included from include/linux/node.h:18:
>> include/linux/device.h:1123:1: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
1123 | DEFINE_GUARD_COND(device, _intr, device_lock_interruptible(_T), _RET == 0)
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/cleanup.h:413:33: note: expanded from macro 'DEFINE_GUARD_COND'
413 | #define DEFINE_GUARD_COND(X...) CONCATENATE(DEFINE_GUARD_COND_, COUNT_ARGS(X))(X)
|                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
26 | #define CONCATENATE(a, b) __CONCAT(a, b)
|                           ^
include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
25 | #define __CONCAT(a, b) a ## b
|                        ^
note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
include/linux/cleanup.h:360:22: note: expanded from macro '__GUARD_IS_ERR'
360 |                 unlikely((_rc - 1) >= -MAX_ERRNO - 1);             \
|                           ~~~~~~~  ^
include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
|                                             ^
include/linux/cleanup.h:289:7: note: expanded from macro 'EXTEND_CLASS_COND'
289 | { if (_cond) return; class_##_name##_destructor(_T); }                  \
|       ^~~~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:14:
In file included from include/linux/fs_context.h:14:
In file included from include/linux/security.h:35:
In file included from include/linux/bpf.h:33:
In file included from include/linux/memcontrol.h:23:
In file included from include/linux/writeback.h:202:
include/linux/bio.h:337:14: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
337 |         if (sectors >= bio_sectors(bio))
|             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:14:
In file included from include/linux/fs_context.h:14:
In file included from include/linux/security.h:35:
In file included from include/linux/bpf.h:37:
include/linux/ftrace.h:1180:9: warning: calling '__builtin_return_address' with a nonzero argument is unsafe [-Wframe-address]
1180 |         addr = CALLER_ADDR1;
|                ^~~~~~~~~~~~
include/linux/ftrace.h:1167:38: note: expanded from macro 'CALLER_ADDR1'
1167 | #define CALLER_ADDR1 ((unsigned long)ftrace_return_address(1))
|                                      ^~~~~~~~~~~~~~~~~~~~~~~~
include/linux/ftrace.h:1160:36: note: expanded from macro 'ftrace_return_address'
1160 | #  define ftrace_return_address(n) __builtin_return_address(n)
|                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/ftrace.h:1183:9: warning: calling '__builtin_return_address' with a nonzero argument is unsafe [-Wframe-address]
1183 |         return CALLER_ADDR2;
|                ^~~~~~~~~~~~
include/linux/ftrace.h:1168:38: note: expanded from macro 'CALLER_ADDR2'
1168 | #define CALLER_ADDR2 ((unsigned long)ftrace_return_address(2))
|                                      ^~~~~~~~~~~~~~~~~~~~~~~~
include/linux/ftrace.h:1160:36: note: expanded from macro 'ftrace_return_address'
1160 | #  define ftrace_return_address(n) __builtin_return_address(n)
|                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/beamfs/treecheck.c:31:
In file included from fs/beamfs/beamfs.h:14:
In file included from include/linux/fs_context.h:14:
In file included from include/linux/security.h:35:
>> include/linux/bpf.h:518:16: warning: comparison of integers of different signs: 'int' and 'const u32' (aka 'const unsigned int') [-Wsign-compare]
518 |         for (i = 0; i < rec->cnt; i++) {
|                     ~ ^ ~~~~~~~~
include/linux/bpf.h:531:16: warning: comparison of integers of different signs: 'int' and 'const u32' (aka 'const unsigned int') [-Wsign-compare]
531 |         for (i = 0; i < rec->cnt; i++)
|                     ~ ^ ~~~~~~~~
>> include/linux/bpf.h:579:16: warning: comparison of integers of different signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
579 |         for (i = 0; i < rec->cnt; i++) {
|                     ~ ^ ~~~~~~~~
include/linux/bpf.h:608:37: warning: comparison of integers of different signs: 'int' and 'const u32' (aka 'const unsigned int') [-Wsign-compare]
608 |         for (i = 0, field = rec->fields; i < rec->cnt; i++, field++) {
|                                          ~ ^ ~~~~~~~~
include/linux/bpf.h:628:16: warning: comparison of integers of different signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
628 |         for (i = 0; i < rec->cnt; i++) {
|                     ~ ^ ~~~~~~~~
>> include/linux/bpf.h:3167:21: warning: comparison of integers of different signs: 'int' and '__size_t' (aka 'unsigned int') [-Wsign-compare]
3167 |         if (off < 0 || off >= sizeof(__u64) * MAX_BPF_FUNC_ARGS)
|                        ~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
45 warnings generated.
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
