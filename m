Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F57714D29B;
	Fri,  4 Jul 2025 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592051; cv=none; b=ZN62lSpdDyKu64zmdkwJzhejCBrVKTU9Cu+t+GCHY6OFhLJHo2BeviQKwPPmbydRVcAERfo8RhJNjFJ91V7586SSXLpHkf6JvYtXS4XvzcjJJusJQ1rpD5UJCkZabrTzbatP/n5ZAMoTHs5GYnSIQd0I8+l6//bFalbUCYSRUbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592051; c=relaxed/simple;
	bh=rAgyVhqmXjZC4YkLCZcO7uSyuaGp7drs2CDZ1WZRx0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gsCTVtyHdtFu/DhcA8xWCkHnsdlaI7sJU/ugzwEs/AJgN2nZw7ECliFjO3fUpS2DGxMDU2MagVbLAouL8kUtber5A2Oyrk+AJI/lFVs/7PU37Olw6xlVHmYlfKxa6qV9BHcQ3huPY4ePSQMZLVHSu5ZL/O0BKqlDmsADAGWfeVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzjqDRfy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzjqDRfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751592049; x=1783128049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAgyVhqmXjZC4YkLCZcO7uSyuaGp7drs2CDZ1WZRx0Y=;
  b=gzjqDRfydoG5s35ZqBwWR21bq0wr+g0DVFEmfknIjvI1aAvNU01A+VEG
   Q5vwsyTU1tVIBGVpFaCIek+zGKm+SYYeb4rbXoXbmbrUajuGyiSoSfEg0
   R2MsXa5dn9xrUJU8Xj+rygdXBj602wtN9O4rpZr/hO+meef/q/2KILG6+
   QtYq1bFk6qkvj/33ip+QvVaFVQYFVdRtG4mW6OaZTwtsEsqYP5UxK0Yt8
   iW6tOfmyV42jEDfk/gipxDrTrg2pV+SXlGjMruSyXjAfkIQwtKnwnetiY
   zKYwtCNqGdAiRFC5CfTFTuLJjW+m1e+kY3ADVIFuyy6B0WkqgYeNJnQLX
   g==;
X-CSE-ConnectionGUID: UKoGuFzOQ1OXHgERr8YtFQ==
X-CSE-MsgGUID: cRslr97WRHi5XT6nSiSbYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="71498227"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="71498227"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 18:20:48 -0700
X-CSE-ConnectionGUID: DRxY3PWqQ9+KwCJk2+FTIQ==
X-CSE-MsgGUID: UrBtDk1NTYuJacVF/HSayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154276423"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jul 2025 18:20:46 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXV6a-0003Br-20;
	Fri, 04 Jul 2025 01:20:44 +0000
Date: Fri, 4 Jul 2025 09:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/irq-exit-v2 7/7] kernel/rcu/tree.c:770:28: error: no
 member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
Message-ID: <202507040910.OYqi4Mjl-lkp@intel.com>
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
commit: 694abfc6d256d0bb3bbf659527a692224e000d68 [7/7] rcu: Wire up irq_work state machine
config: i386-buildonly-randconfig-002-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040910.OYqi4Mjl-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040910.OYqi4Mjl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040910.OYqi4Mjl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     770 |         if (value && READ_ONCE(t->rcu_defer_qs_iw_pending) == DEFER_QS_IDLE)
         |                                ~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
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
>> kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     770 |         if (value && READ_ONCE(t->rcu_defer_qs_iw_pending) == DEFER_QS_IDLE)
         |                                ~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
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
>> kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
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
>> kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
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
>> kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
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
>> kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
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
>> kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
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
>> kernel/rcu/tree.c:770:28: error: no member named 'rcu_defer_qs_iw_pending' in 'struct task_struct'
     770 |         if (value && READ_ONCE(t->rcu_defer_qs_iw_pending) == DEFER_QS_IDLE)
         |                                ~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
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
