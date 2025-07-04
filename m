Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877F32853F2;
	Fri,  4 Jul 2025 07:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615607; cv=none; b=qxjm2fMUHrGDBj17qD495HHZ2XtJmoRYvfcByZ4AfDJ3PxARGo5QScg/C+NGA7yoBpbhbJOKyAiqRhj2JeiXmwFokn6yRvaYk7ygpuaiO8wdSQ9JjLCZSaH32HiZatOddVT5SNUZjr1jUDEcHj5zHTVF/aMBhYjA/h3BQn4gus8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615607; c=relaxed/simple;
	bh=Zc5cn4D/AdMd9x6fWOmSjwJzMQIT2Iaqnn1xtkdwD+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LsHUXmQ2U7fgwoWh/JpnxQNQTil5n5x/kL+g7IemLJpQQhGYCjq7pKg6ww90OSTJm5i/0J6r29Mt1p0ntPyLUSLnOC+ArKpdbs+H2sEhxw+04oIH0ySmNCrD/WkSNEberIkMLs2lkjoWMo4F3zsTo9FXCwz/gsQMOCBEjhzUETM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EF2dJxOy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EF2dJxOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615605; x=1783151605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zc5cn4D/AdMd9x6fWOmSjwJzMQIT2Iaqnn1xtkdwD+4=;
  b=EF2dJxOycpjaClLbSLKep1RfPgrkrTxSx5Q+Y/2JbiXVqMpFeQ0PjRjg
   XZ7Yl1NOUj9D5A4e5d9ShrFFnqFt10oygLM1lAE4sWePKDsbxtN8QMI+e
   Gqgvslx/Siz3neYDFznZTl1KYsrjkof4oP5lMj/j5GJT8NRed0gez2s0g
   i4wx7mCy0gfKokpC6J1re/MSOG2+JVOYbt3BmDy44yHU4+77+r5zTavQZ
   Ve1taK2YI3E+rX3wW5tL8q2uYPa3uIhQ2Bv8J0f2d3NMB6ljERxjm/n/X
   SImcwAT4npPIUQbbir7ZF6g7QoMGLo+9M4uT/7Z3CJqXBuqb7RDnHWJUm
   Q==;
X-CSE-ConnectionGUID: /y439SPjSyOkd+1FBL1VTg==
X-CSE-MsgGUID: dbwz/dVfTSKh+bNCrlFz5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53170618"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53170618"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:53:24 -0700
X-CSE-ConnectionGUID: zELJtb01SB2if/HhrYpb4w==
X-CSE-MsgGUID: sv/3hhAnRpq504APjaIcqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154001562"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jul 2025 00:53:24 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXbEW-0003Sr-2w;
	Fri, 04 Jul 2025 07:53:20 +0000
Date: Fri, 4 Jul 2025 15:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/irq-exit-v2 7/7] kernel/rcu/tree.c:770:53: error: invalid
 operands to binary expression ('void' and 'int')
Message-ID: <202507041547.GoYephdf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/irq-exit-v2
head:   19450082dae4c12bdd2b7cee28961eb27227a8fd
commit: 19450082dae4c12bdd2b7cee28961eb27227a8fd [7/7] rcu: Wire up irq_work state machine
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250704/202507041547.GoYephdf-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041547.GoYephdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041547.GoYephdf-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     770 |         if (value && READ_ONCE(t->rcu_defer_qs_iw_pending) == DEFER_QS_IDLE)
         |                                ~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:530:10: note: expanded from macro '__native_word'
     530 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     770 |         if (value && READ_ONCE(t->rcu_defer_qs_iw_pending) == DEFER_QS_IDLE)
         |                                ~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:530:38: note: expanded from macro '__native_word'
     530 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     770 |         if (value && READ_ONCE(t->rcu_defer_qs_iw_pending) == DEFER_QS_IDLE)
         |                                ~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     770 |         if (value && READ_ONCE(t->rcu_defer_qs_iw_pending) == DEFER_QS_IDLE)
         |                                ~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:518:13: note: expanded from macro '__unqual_scalar_typeof'
     518 |                 _Generic((x),                                           \
         |                           ^
   kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     770 |         if (value && READ_ONCE(t->rcu_defer_qs_iw_pending) == DEFER_QS_IDLE)
         |                                ~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:525:15: note: expanded from macro '__unqual_scalar_typeof'
     525 |                          default: (x)))
         |                                    ^
   kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     770 |         if (value && READ_ONCE(t->rcu_defer_qs_iw_pending) == DEFER_QS_IDLE)
         |                                ~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
>> kernel/rcu/tree.c:770:53: error: invalid operands to binary expression ('void' and 'int')
     770 |         if (value && READ_ONCE(t->rcu_defer_qs_iw_pending) == DEFER_QS_IDLE)
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~
   kernel/rcu/tree.c:771:17: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     771 |                 WRITE_ONCE(t->rcu_defer_qs_iw_pending, DEFER_QS_REQUIRED);
         |                            ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:529:10: note: expanded from macro '__native_word'
     529 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:771:17: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     771 |                 WRITE_ONCE(t->rcu_defer_qs_iw_pending, DEFER_QS_REQUIRED);
         |                            ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:529:39: note: expanded from macro '__native_word'
     529 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:771:17: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     771 |                 WRITE_ONCE(t->rcu_defer_qs_iw_pending, DEFER_QS_REQUIRED);
         |                            ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:530:10: note: expanded from macro '__native_word'
     530 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:771:17: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     771 |                 WRITE_ONCE(t->rcu_defer_qs_iw_pending, DEFER_QS_REQUIRED);
         |                            ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:530:38: note: expanded from macro '__native_word'
     530 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   kernel/rcu/tree.c:771:17: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     771 |                 WRITE_ONCE(t->rcu_defer_qs_iw_pending, DEFER_QS_REQUIRED);
         |                            ~  ^
   include/asm-generic/rwonce.h:60:33: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)


vim +770 kernel/rcu/tree.c

   764	
   765	/**
   766	 * rcu_set_blocked - Set blocked flag in task's rcu_special union
   767	 */
   768	void rcu_set_blocked(struct task_struct *t, bool value)
   769	{
 > 770		if (value && READ_ONCE(t->rcu_defer_qs_iw_pending) == DEFER_QS_IDLE)
   771			WRITE_ONCE(t->rcu_defer_qs_iw_pending, DEFER_QS_REQUIRED);
   772	
   773		WRITE_ONCE(t->rcu_read_unlock_special.b.blocked, value);
   774	}
   775	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
