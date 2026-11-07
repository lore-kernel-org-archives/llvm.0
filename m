Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794015676;
	b=NE+QOmWeW8ZBM3ELavIGqdk/d2r/Ec+F6ZmZJKynMTIKuoOZYkd4xsg0YG8ir0VFUp/u
	 jfW96JoJGF4dVHsIpeXhYr4OzDdj1jCZry/l8TRq8jZ06rHL1sv3DqVXUFzHAuwfDLMrB
	 R+nMr4P3nJS9nBZtu9JX8Qn3gg540VpQjXsDOLkSySoPF6sYEwvqh+GOzsonqsMd3hhBd
	 7ihhO3WjlFK86Q3z/pgfAA13CEgdLiww0l2nWqXzNV2Oe9n6G0TrLYLepRKnfe1Lh+CJH
	 A4dMXfGuzIOlic9ve9XH44GQ3LhBAwCYvOBIOK7dGlj+HWnScnxZP2SQFJDHeabDXDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794015676;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lbyGC7nA73pUh7TjmjuuNPaVYbK+A9mHJCPy/Ni7H2c=;
	b=trHe9KaCu7HZpCCMnBdEjxeNFdjR55mUwOJRY1y38ZgrKF7QmNNWkcP4lvCsdJkER/Ai
	 0tJvyCCztEwuEghe70Vw3Ik1GPgbtFCxOqgAZ9pdx1U8aA1lEEqlJpVza/1pfZYxbSuhg
	 rMTuv8qpp/4HjrVaV13KuHn4OvH7/GH1skZa0FKmkO8MG8HEpA+4r7GaM0EBRYC5F8YSL
	 isVX4IOldvtsrCgMP4ox6a/MxsjWNLuTE6h2+eWpRj9MwrvGugHS6AbV1g2DNCy+o5LcT
	 U4EGIrcLygQEwgqF92AmkJQ2u5sZnSCPthHNizyiwJjgA5IYrkXwlJ0OmR2frmVk18g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n4hsHIXp;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA41606A326;
	Sat,  7 Nov 2026 01:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA41606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n4hsHIXp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794015674; x=1825551674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aTkvPzAbJN4jNBu0r57eQZHavSgwUMEEjEAJtxIPKcM=;
  b=n4hsHIXpuxxnc17MxVpmvNkYh+8CET1HOlYdEW9uBN5kwchIUnitQVU/
   HuhWAXwrkxtdB44ktMAgoWy4LXJSeeJnHL7zK07SdmXJ1xb4EElVl4OP9
   SNgVP+be+s8rXQ+JgsbNg4VN1B+dchw/3znaM7z7aYm45Y1QCXEIuLbhL
   J4FV/pIpVJaR+hGZyZC+wBOw685HW7/b+aAa+VT+X/BUxcI5QApodC5Ej
   fB5XJhy0naHNwU91G+sz/auSVAJum50mhT95f5C9Ko1AxH9U+gjzRuu6R
   OKoJWa2IfloGU1G3ZkcPA7zmGq7Yb9guGl//xBb3i57PzbGue2/WXrbuN
   A==;
X-CSE-ConnectionGUID: VzCioLVWSKGX2ktRwzXLJg==
X-CSE-MsgGUID: kYebCy3wTWS6qTH7TUtVtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2751743"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2751743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 17:41:13 -0800
X-CSE-ConnectionGUID: S7ZRecPUTOGgMLkqtEZAag==
X-CSE-MsgGUID: 4WSfGiz3TyO7e25/Mxp73g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7567877"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2026 17:41:06 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPVQV-00000000qCZ-0KhF;
	Sat, 07 Nov 2026 01:41:03 +0000
Date: Sat, 7 Nov 2026 09:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2 10/15] lib/lz4: switch the compressor to the vendored
 sources
Message-ID: <202611070943.EDg3udaH-lkp@intel.com>
References: <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>
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
In-Reply-To: <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on 93f51579e7df248780214094418f205253383cc5]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/lib-decompress_unlz4-use-LZ4_decompress_safe_partial-before-boot/20261106-154241
base:   93f51579e7df248780214094418f205253383cc5
patch link:    https://lore.kernel.org/r/20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc%40samsung.com
patch subject: [PATCH v2 10/15] lib/lz4: switch the compressor to the vendored sources
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20261107/202611070943.EDg3udaH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070943.EDg3udaH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070943.EDg3udaH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rcupdate.h:27,
                    from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from lib/lz4/lz4_compress.c:29:
   include/linux/sched.h: In function 'is_percpu_thread':
>> include/linux/sched.h:1860:17: error: 'current' undeclared (first use in this function)
    1860 |         return (current->flags & PF_NO_SETAFFINITY) &&
         |                 ^~~~~~~
   include/linux/sched.h:1860:17: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/sched.h: In function 'current_restore_flags':
   include/linux/sched.h:1918:9: error: 'current' undeclared (first use in this function)
    1918 |         current->flags &= ~flags;
         |         ^~~~~~~
   include/linux/sched.h: In function 'set_need_resched_current':
   include/linux/sched.h:2127:30: error: 'current' undeclared (first use in this function)
    2127 |         set_tsk_need_resched(current);
         |                              ^~~~~~~
   In file included from include/asm-generic/bug.h:7,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from lib/lz4/lz4_compress.c:27:
   include/linux/sched.h: In function '__set_task_blocked_on':
   include/linux/sched.h:2231:27: error: 'current' undeclared (first use in this function)
    2231 |         WARN_ON_ONCE(p != current);
         |                           ^~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/sched.h:2231:9: note: in expansion of macro 'WARN_ON_ONCE'
    2231 |         WARN_ON_ONCE(p != current);
         |         ^~~~~~~~~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8:
   include/linux/sched.h: In function 'alloc_tag_save':
   include/linux/sched.h:2361:14: error: 'current' undeclared (first use in this function)
    2361 |         swap(current->alloc_tag, tag);
         |              ^~~~~~~
   include/linux/minmax.h:308:21: note: in definition of macro 'swap'
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                     ^
>> include/linux/minmax.h:308:52: error: assignment to 'struct alloc_tag *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                                    ^
   include/linux/sched.h:2361:9: note: in expansion of macro 'swap'
    2361 |         swap(current->alloc_tag, tag);
         |         ^~~~
   include/linux/sched.h: In function 'alloc_tag_restore':
   include/linux/sched.h:2368:14: error: 'current' undeclared (first use in this function)
    2368 |         WARN(current->alloc_tag != tag, "current->alloc_tag was changed:\n");
         |              ^~~~~~~
   include/asm-generic/bug.h:164:32: note: in definition of macro 'WARN'
     164 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   In file included from <command-line>:
   include/linux/rcupdate.h: In function 'cond_resched_tasks_rcu_qs':
>> include/linux/rcupdate.h:226:22: error: 'current' undeclared (first use in this function)
     226 |         rcu_tasks_qs(current, false);
         |                      ^~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:185:35: note: in expansion of macro 'READ_ONCE'
     185 |                 if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))    \
         |                                   ^~~~~~~~~
   include/linux/rcupdate.h:197:34: note: in expansion of macro 'rcu_tasks_classic_qs'
     197 | #define rcu_tasks_qs(t, preempt) rcu_tasks_classic_qs((t), (preempt))
         |                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:226:9: note: in expansion of macro 'rcu_tasks_qs'
     226 |         rcu_tasks_qs(current, false);
         |         ^~~~~~~~~~~~
   In file included from include/linux/local_lock.h:5,
                    from include/linux/mmzone.h:24:
   include/linux/local_lock_internal.h: In function 'local_lock_acquire':
>> include/linux/local_lock_internal.h:48:20: error: 'current' undeclared (first use in this function)
      48 |         l->owner = current;
         |                    ^~~~~~~
   include/linux/local_lock_internal.h: In function 'local_trylock_acquire':
   include/linux/local_lock_internal.h:55:20: error: 'current' undeclared (first use in this function)
      55 |         l->owner = current;
         |                    ^~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from lib/lz4/lz4_deps.h:18,
                    from lib/lz4/lz4_compress.c:16:
   include/linux/local_lock_internal.h: In function 'local_lock_release':
   include/linux/local_lock_internal.h:60:41: error: 'current' undeclared (first use in this function)
      60 |         DEBUG_LOCKS_WARN_ON(l->owner != current);
         |                                         ^~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/local_lock_internal.h:60:9: note: in expansion of macro 'DEBUG_LOCKS_WARN_ON'
      60 |         DEBUG_LOCKS_WARN_ON(l->owner != current);
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h: In function 'current_gfp_context':
>> include/linux/sched/mm.h:250:41: error: 'current' undeclared (first use in this function)
     250 |         unsigned int pflags = READ_ONCE(current->flags);
         |                                         ^~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:250:31: note: in expansion of macro 'READ_ONCE'
     250 |         unsigned int pflags = READ_ONCE(current->flags);
         |                               ^~~~~~~~~
   include/linux/sched/mm.h: In function 'memalloc_retry_wait':
   include/linux/sched.h:170:17: error: 'current' undeclared (first use in this function)
     170 |                 current->task_state_change = _THIS_IP_;                 \
         |                 ^~~~~~~
   include/linux/sched.h:242:17: note: in expansion of macro 'debug_normal_state_change'
     242 |                 debug_normal_state_change((state_value));               \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:293:9: note: in expansion of macro '__set_current_state'
     293 |         __set_current_state(TASK_UNINTERRUPTIBLE);
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/xarray.h:21,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/module.h:22:
   include/linux/sched/mm.h: In function 'might_alloc':
   include/linux/sched/mm.h:319:13: error: 'current' undeclared (first use in this function)
     319 |         if (current->flags & PF_MEMALLOC)
         |             ^~~~~~~
   include/linux/sched/mm.h: In function 'memalloc_flags_save':
   include/linux/sched/mm.h:334:30: error: 'current' undeclared (first use in this function)
     334 |         unsigned oldflags = ~current->flags & flags;
         |                              ^~~~~~~
   include/linux/sched/mm.h: In function 'memalloc_flags_restore':
   include/linux/sched/mm.h:341:9: error: 'current' undeclared (first use in this function)
     341 |         current->flags &= ~flags;
         |         ^~~~~~~
   include/linux/sched/mm.h: In function 'set_active_memcg':
   include/linux/sched/mm.h:499:23: error: 'current' undeclared (first use in this function)
     499 |                 old = current->active_memcg;
         |                       ^~~~~~~
   include/linux/sched/mm.h: In function 'membarrier_mm_sync_core_before_usermode':
   include/linux/sched/mm.h:543:13: error: 'current' undeclared (first use in this function)
     543 |         if (current->mm != mm)
         |             ^~~~~~~


vim +308 include/linux/minmax.h

f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  285) 
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  286) /**
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  287)  * in_range - Determine if a value lies within a range.
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  288)  * @val: Value to test.
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  289)  * @start: First value in range.
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  290)  * @len: Number of values in range.
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  291)  *
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  292)  * This is more efficient than "if (start <= val && val < (start + len))".
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  293)  * It also gives a different answer if @start + @len overflows the size of
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  294)  * the type by a sufficient amount to encompass @val.  Decide for yourself
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  295)  * which behaviour you want, or prove that start + len never overflow.
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  296)  * Do not blindly replace one form with the other.
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  297)  */
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  298) #define in_range(val, start, len)					\
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  299) 	((sizeof(start) | sizeof(len) | sizeof(val)) <= sizeof(u32) ?	\
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  300) 		in_range32(val, start, len) : in_range64(val, start, len))
f9bff0e31881d03 Matthew Wilcox (Oracle  2023-08-02  301) 
b296a6d53339a79 Andy Shevchenko         2020-10-15  302  /**
b296a6d53339a79 Andy Shevchenko         2020-10-15  303   * swap - swap values of @a and @b
b296a6d53339a79 Andy Shevchenko         2020-10-15  304   * @a: first value
b296a6d53339a79 Andy Shevchenko         2020-10-15  305   * @b: second value
b296a6d53339a79 Andy Shevchenko         2020-10-15  306   */
b296a6d53339a79 Andy Shevchenko         2020-10-15  307  #define swap(a, b) \
b296a6d53339a79 Andy Shevchenko         2020-10-15 @308  	do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
b296a6d53339a79 Andy Shevchenko         2020-10-15  309  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
