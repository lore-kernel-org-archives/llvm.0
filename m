Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0911E2613;
	Sat, 19 Apr 2025 19:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745089809; cv=none; b=f7coNWM50DaDRx72vnLddM5SO3x0F+lAze1vjLgpgLRZ4F/oA029uxbsM8KaogeLJgOyMHy8AR9IllhL+jtr/XrmDX4BcbPXH413dfzkGXFSRT1wRnkIGpJJZBvGNaf4EHBNxOL8NeuQWSBJbM1DI+ipa3OcdoQ9X48C6Bk7pWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745089809; c=relaxed/simple;
	bh=8UPWzFXBHsWqYSwWvnDu64xC4j0XzFfJvLfpoL6jhk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TsTX7IwHtShBvczK1tO9OYjdVtC1HwzRBF/3BScfG0TYhr5DQQ4Bs9VXq7acc2FRk/an+Gh9OHSlBT94NyAihHD9mKmfe5SzPLATyx5wshWL14R1c5XQ7ksQxMpPr+fJFU76WkWTbknodejyRx6hNA9Uj79JSMl7b9qaasWVL60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6MxrDyp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6MxrDyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745089806; x=1776625806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8UPWzFXBHsWqYSwWvnDu64xC4j0XzFfJvLfpoL6jhk0=;
  b=R6MxrDypTSpwKqRX9rc4NZz5et7ezuxwhx1aB8Hy+ruslAwifoEqVuRa
   byO1OTCl221CoukH8rh1Mj/5vQOG5no6D6cNJpRwy9ZMvFYZDM+WeHeWa
   7cMuDqsa2yNxL+T4cq0I6ICZmm7Di+CCbpUy5VFt3SzdE/4fzzrHjHplU
   x6wo+kLRzEykFfN9pILO14svZLsUIdeiP13ms35voLCATQZ7atHtnEEtU
   9SEu2C+XkfPjdOkYLWzRqBB65rqziepITz4onu3X8iC+aK8IYHRMTSSel
   fuZWVEu90hZI3t41suV/Y5Hjxsr7puMvGvyfrvvMGSThAnBayDYeL1sZJ
   w==;
X-CSE-ConnectionGUID: hfdzDnzMSsCSExYsGByoyA==
X-CSE-MsgGUID: lVDa0+R+SJSiK+BK1zKXUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="64089594"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="64089594"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 12:10:05 -0700
X-CSE-ConnectionGUID: FD/fEZvCR3OFSnALqIeqWg==
X-CSE-MsgGUID: QHy1nX+dRIyPf8SDC9CcgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131346881"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Apr 2025 12:10:04 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6DZh-000473-0A;
	Sat, 19 Apr 2025 19:10:01 +0000
Date: Sun, 20 Apr 2025 03:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 193/216] include/linux/srcutree.h:69:8: error:
 redefinition of 'srcu_usage'
Message-ID: <202504200319.m4MOE4ai-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   8b3d0c53ca9dae9831cfbc6cc54c0af534d5332c
commit: 01398800c5cad0e33788428a18085f6e237b1753 [193/216] lib/test_vmalloc.c: replace RWSEM to SRCU for setup
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250420/202504200319.m4MOE4ai-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200319.m4MOE4ai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200319.m4MOE4ai-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:69:8: error: redefinition of 'srcu_usage'
      69 | struct srcu_usage {
         |        ^
   include/linux/srcutiny.h:52:8: note: previous definition is here
      52 | struct srcu_usage { };
         |        ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:102:8: error: redefinition of 'srcu_struct'
     102 | struct srcu_struct {
         |        ^
   include/linux/srcutiny.h:16:8: note: previous definition is here
      16 | struct srcu_struct {
         |        ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:149:9: warning: '__SRCU_USAGE_INIT' macro redefined [-Wmacro-redefined]
     149 | #define __SRCU_USAGE_INIT(name)                                                                 \
         |         ^
   include/linux/srcutiny.h:53:9: note: previous definition is here
      53 | #define __SRCU_USAGE_INIT(name) { }
         |         ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:167:9: warning: '__SRCU_STRUCT_INIT' macro redefined [-Wmacro-redefined]
     167 | #define __SRCU_STRUCT_INIT(name, usage_name, pcpu_name)                                         \
         |         ^
   include/linux/srcutiny.h:34:9: note: previous definition is here
      34 | #define __SRCU_STRUCT_INIT(name, __ignored, ___ignored)                 \
         |         ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:207:9: warning: 'DEFINE_SRCU' macro redefined [-Wmacro-redefined]
     207 | #define DEFINE_SRCU(name)               __DEFINE_SRCU(name, /* not static */)
         |         ^
   include/linux/srcutiny.h:46:9: note: previous definition is here
      46 | #define DEFINE_SRCU(name) \
         |         ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:208:9: warning: 'DEFINE_STATIC_SRCU' macro redefined [-Wmacro-redefined]
     208 | #define DEFINE_STATIC_SRCU(name)        __DEFINE_SRCU(name, static)
         |         ^
   include/linux/srcutiny.h:48:9: note: previous definition is here
      48 | #define DEFINE_STATIC_SRCU(name) \
         |         ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:217:20: error: redefinition of '__srcu_ptr_to_ctr'
     217 | static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct srcu_ctr __percpu *scpp)
         |                    ^
   include/linux/srcutiny.h:76:20: note: previous definition is here
      76 | static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct srcu_ctr __percpu *scpp)
         |                    ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:219:22: error: no member named 'sda' in 'struct srcu_struct'
     219 |         return scpp - &ssp->sda->srcu_ctrs[0];
         |                        ~~~  ^
>> include/linux/srcutree.h:224:41: error: redefinition of '__srcu_ctr_to_ptr'
     224 | static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ssp, int idx)
         |                                         ^
   include/linux/srcutiny.h:81:41: note: previous definition is here
      81 | static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ssp, int idx)
         |                                         ^
   In file included from lib/test_vmalloc.c:18:
   include/linux/srcutree.h:226:15: error: no member named 'sda' in 'struct srcu_struct'
     226 |         return &ssp->sda->srcu_ctrs[idx];
         |                 ~~~  ^
>> include/linux/srcutree.h:243:41: error: redefinition of '__srcu_read_lock_fast'
     243 | static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
         |                                         ^
   include/linux/srcutiny.h:86:41: note: previous definition is here
      86 | static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
         |                                         ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:245:49: error: no member named 'srcu_ctrp' in 'struct srcu_struct'; did you mean 'srcu_work'?
     245 |         struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
         |                                                        ^~~~~~~~~
         |                                                        srcu_work
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:524:10: note: expanded from macro '__native_word'
     524 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^
   include/linux/srcutiny.h:26:21: note: 'srcu_work' declared here
      26 |         struct work_struct srcu_work;   /* For driving grace periods. */
         |                            ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:245:49: error: no member named 'srcu_ctrp' in 'struct srcu_struct'; did you mean 'srcu_work'?
     245 |         struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
         |                                                        ^~~~~~~~~
         |                                                        srcu_work
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:524:39: note: expanded from macro '__native_word'
     524 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^
   include/linux/srcutiny.h:26:21: note: 'srcu_work' declared here
      26 |         struct work_struct srcu_work;   /* For driving grace periods. */
         |                            ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:245:49: error: no member named 'srcu_ctrp' in 'struct srcu_struct'; did you mean 'srcu_work'?
     245 |         struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
         |                                                        ^~~~~~~~~
         |                                                        srcu_work
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:525:10: note: expanded from macro '__native_word'
     525 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^
   include/linux/srcutiny.h:26:21: note: 'srcu_work' declared here
      26 |         struct work_struct srcu_work;   /* For driving grace periods. */
         |                            ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:245:49: error: no member named 'srcu_ctrp' in 'struct srcu_struct'; did you mean 'srcu_work'?
     245 |         struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
         |                                                        ^~~~~~~~~
         |                                                        srcu_work
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:525:38: note: expanded from macro '__native_word'
     525 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^
   include/linux/srcutiny.h:26:21: note: 'srcu_work' declared here
      26 |         struct work_struct srcu_work;   /* For driving grace periods. */
         |                            ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:245:49: error: no member named 'srcu_ctrp' in 'struct srcu_struct'; did you mean 'srcu_work'?
     245 |         struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
         |                                                        ^~~~~~~~~
         |                                                        srcu_work
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:557:22: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:545:23: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:537:9: note: expanded from macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^
   include/linux/srcutiny.h:26:21: note: 'srcu_work' declared here
      26 |         struct work_struct srcu_work;   /* For driving grace periods. */
         |                            ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:245:49: error: no member named 'srcu_ctrp' in 'struct srcu_struct'; did you mean 'srcu_work'?
     245 |         struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
         |                                                        ^~~~~~~~~
         |                                                        srcu_work
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:513:13: note: expanded from macro '__unqual_scalar_typeof'
     513 |                 _Generic((x),                                           \
         |                           ^
   include/linux/srcutiny.h:26:21: note: 'srcu_work' declared here
      26 |         struct work_struct srcu_work;   /* For driving grace periods. */
         |                            ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:245:49: error: no member named 'srcu_ctrp' in 'struct srcu_struct'; did you mean 'srcu_work'?
     245 |         struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
         |                                                        ^~~~~~~~~
         |                                                        srcu_work
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:520:15: note: expanded from macro '__unqual_scalar_typeof'
     520 |                          default: (x)))
         |                                    ^
   include/linux/srcutiny.h:26:21: note: 'srcu_work' declared here
      26 |         struct work_struct srcu_work;   /* For driving grace periods. */
         |                            ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:245:49: error: no member named 'srcu_ctrp' in 'struct srcu_struct'; did you mean 'srcu_work'?
     245 |         struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
         |                                                        ^~~~~~~~~
         |                                                        srcu_work
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/srcutiny.h:26:21: note: 'srcu_work' declared here
      26 |         struct work_struct srcu_work;   /* For driving grace periods. */
         |                            ^
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:245:28: error: initializing 'struct srcu_ctr *' with an expression of incompatible type 'typeof (_Generic((ssp->srcu_work), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, short: (short)0, unsigned int: (unsigned int)0, int: (int)0, unsigned long: (unsigned long)0, long: (long)0, unsigned long long: (unsigned long long)0, long long: (long long)0, default: (ssp->srcu_work)))' (aka 'struct work_struct')
     245 |         struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
         |                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/srcutree.h:249:3: error: indirection requires pointer operand ('void' invalid)
     249 |                 this_cpu_inc(scp->srcu_locks.counter); /* Y */
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:510:28: note: expanded from macro 'this_cpu_inc'
     510 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:33: note: expanded from macro 'this_cpu_add'
     500 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:11: note: expanded from macro '__pcpu_size_call'
     368 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:414:34: note: expanded from macro 'this_cpu_add_1'
     414 | #define this_cpu_add_1(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:169:2: note: expanded from macro 'this_cpu_generic_to_op'
     169 |         raw_cpu_generic_to_op(pcp, val, op);                            \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:85:2: note: expanded from macro 'raw_cpu_generic_to_op'
      85 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
   include/linux/srcutree.h:249:3: error: indirection requires pointer operand ('void' invalid)
     249 |                 this_cpu_inc(scp->srcu_locks.counter); /* Y */
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:510:28: note: expanded from macro 'this_cpu_inc'
     510 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:33: note: expanded from macro 'this_cpu_add'
     500 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:369:11: note: expanded from macro '__pcpu_size_call'
     369 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:417:34: note: expanded from macro 'this_cpu_add_2'
     417 | #define this_cpu_add_2(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:169:2: note: expanded from macro 'this_cpu_generic_to_op'
     169 |         raw_cpu_generic_to_op(pcp, val, op);                            \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:85:2: note: expanded from macro 'raw_cpu_generic_to_op'
      85 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
   include/linux/srcutree.h:249:3: error: indirection requires pointer operand ('void' invalid)
     249 |                 this_cpu_inc(scp->srcu_locks.counter); /* Y */
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:510:28: note: expanded from macro 'this_cpu_inc'
     510 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:33: note: expanded from macro 'this_cpu_add'
     500 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:370:11: note: expanded from macro '__pcpu_size_call'
     370 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:420:34: note: expanded from macro 'this_cpu_add_4'
     420 | #define this_cpu_add_4(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:169:2: note: expanded from macro 'this_cpu_generic_to_op'
     169 |         raw_cpu_generic_to_op(pcp, val, op);                            \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:85:2: note: expanded from macro 'raw_cpu_generic_to_op'
      85 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |         ^~~~~~~~~~~~~~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   4 warnings and 20 errors generated.


vim +/srcu_usage +69 include/linux/srcutree.h

da915ad5cf25b5 Paul E. McKenney        2017-04-05   65  
da915ad5cf25b5 Paul E. McKenney        2017-04-05   66  /*
95433f7263011e Paul E. McKenney        2023-03-16   67   * Per-SRCU-domain structure, update-side data linked from srcu_struct.
da915ad5cf25b5 Paul E. McKenney        2017-04-05   68   */
95433f7263011e Paul E. McKenney        2023-03-16  @69  struct srcu_usage {
2ec303113d9789 Paul E. McKenney        2022-01-21   70  	struct srcu_node *node;			/* Combining tree. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   71  	struct srcu_node *level[RCU_NUM_LVLS + 1];
da915ad5cf25b5 Paul E. McKenney        2017-04-05   72  						/* First node at each level. */
994f706872e6ce Paul E. McKenney        2022-01-24   73  	int srcu_size_state;			/* Small-to-big transition state. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   74  	struct mutex srcu_cb_mutex;		/* Serialize CB preparation. */
994f706872e6ce Paul E. McKenney        2022-01-24   75  	spinlock_t __private lock;		/* Protect counters and size state. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   76  	struct mutex srcu_gp_mutex;		/* Serialize GP work. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   77  	unsigned long srcu_gp_seq;		/* Grace-period seq #. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   78  	unsigned long srcu_gp_seq_needed;	/* Latest gp_seq needed. */
1e9a038b7fe9a8 Paul E. McKenney        2017-04-24   79  	unsigned long srcu_gp_seq_needed_exp;	/* Furthest future exp GP. */
282d8998e9979c Paul E. McKenney        2022-03-08   80  	unsigned long srcu_gp_start;		/* Last GP start timestamp (jiffies) */
22607d66bbc3e8 Paul E. McKenney        2017-04-25   81  	unsigned long srcu_last_gp_end;		/* Last GP end timestamp (ns) */
9f2e91d94c9155 Paul E. McKenney        2022-01-27   82  	unsigned long srcu_size_jiffies;	/* Current contention-measurement interval. */
9f2e91d94c9155 Paul E. McKenney        2022-01-27   83  	unsigned long srcu_n_lock_retries;	/* Contention events in current interval. */
282d8998e9979c Paul E. McKenney        2022-03-08   84  	unsigned long srcu_n_exp_nodelay;	/* # expedited no-delays in current GP phase. */
46470cf85d2b61 Paul E. McKenney        2022-01-27   85  	bool sda_is_static;			/* May ->sda be passed to free_percpu()? */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   86  	unsigned long srcu_barrier_seq;		/* srcu_barrier seq #. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   87  	struct mutex srcu_barrier_mutex;	/* Serialize barrier ops. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   88  	struct completion srcu_barrier_completion;
da915ad5cf25b5 Paul E. McKenney        2017-04-05   89  						/* Awaken barrier rq at end. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   90  	atomic_t srcu_barrier_cpu_cnt;		/* # CPUs not yet posting a */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   91  						/*  callback for the barrier */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   92  						/*  operation. */
282d8998e9979c Paul E. McKenney        2022-03-08   93  	unsigned long reschedule_jiffies;
282d8998e9979c Paul E. McKenney        2022-03-08   94  	unsigned long reschedule_count;
d8be81735aa894 Paul E. McKenney        2017-03-25   95  	struct delayed_work work;
fd1b3f8e097b7f Paul E. McKenney        2023-03-17   96  	struct srcu_struct *srcu_ssp;
95433f7263011e Paul E. McKenney        2023-03-16   97  };
95433f7263011e Paul E. McKenney        2023-03-16   98  
da915ad5cf25b5 Paul E. McKenney        2017-04-05   99  /*
da915ad5cf25b5 Paul E. McKenney        2017-04-05  100   * Per-SRCU-domain structure, similar in function to rcu_state.
da915ad5cf25b5 Paul E. McKenney        2017-04-05  101   */
d8be81735aa894 Paul E. McKenney        2017-03-25 @102  struct srcu_struct {
795e7efec6ea7e Paul E. McKenney        2024-12-19  103  	struct srcu_ctr __percpu *srcu_ctrp;
da915ad5cf25b5 Paul E. McKenney        2017-04-05  104  	struct srcu_data __percpu *sda;		/* Per-CPU srcu_data array. */
d8be81735aa894 Paul E. McKenney        2017-03-25  105  	struct lockdep_map dep_map;
95433f7263011e Paul E. McKenney        2023-03-16  106  	struct srcu_usage *srcu_sup;		/* Update-side data. */
d8be81735aa894 Paul E. McKenney        2017-03-25  107  };
d8be81735aa894 Paul E. McKenney        2017-03-25  108  
e15a19306004b3 Pingfan Liu             2023-01-04  109  // Values for size state variable (->srcu_size_state).  Once the state
e15a19306004b3 Pingfan Liu             2023-01-04  110  // has been set to SRCU_SIZE_ALLOC, the grace-period code advances through
e15a19306004b3 Pingfan Liu             2023-01-04  111  // this state machine one step per grace period until the SRCU_SIZE_BIG state
e15a19306004b3 Pingfan Liu             2023-01-04  112  // is reached.  Otherwise, the state machine remains in the SRCU_SIZE_SMALL
e15a19306004b3 Pingfan Liu             2023-01-04  113  // state indefinitely.
e15a19306004b3 Pingfan Liu             2023-01-04  114  #define SRCU_SIZE_SMALL		0	// No srcu_node combining tree, ->node == NULL
e15a19306004b3 Pingfan Liu             2023-01-04  115  #define SRCU_SIZE_ALLOC		1	// An srcu_node tree is being allocated, initialized,
e15a19306004b3 Pingfan Liu             2023-01-04  116  					//  and then referenced by ->node.  It will not be used.
e15a19306004b3 Pingfan Liu             2023-01-04  117  #define SRCU_SIZE_WAIT_BARRIER	2	// The srcu_node tree starts being used by everything
e15a19306004b3 Pingfan Liu             2023-01-04  118  					//  except call_srcu(), especially by srcu_barrier().
e15a19306004b3 Pingfan Liu             2023-01-04  119  					//  By the end of this state, all CPUs and threads
e15a19306004b3 Pingfan Liu             2023-01-04  120  					//  are aware of this tree's existence.
e15a19306004b3 Pingfan Liu             2023-01-04  121  #define SRCU_SIZE_WAIT_CALL	3	// The srcu_node tree starts being used by call_srcu().
e15a19306004b3 Pingfan Liu             2023-01-04  122  					//  By the end of this state, all of the call_srcu()
e15a19306004b3 Pingfan Liu             2023-01-04  123  					//  invocations that were running on a non-boot CPU
e15a19306004b3 Pingfan Liu             2023-01-04  124  					//  and using the boot CPU's callback queue will have
e15a19306004b3 Pingfan Liu             2023-01-04  125  					//  completed.
e15a19306004b3 Pingfan Liu             2023-01-04  126  #define SRCU_SIZE_WAIT_CBS1	4	// Don't trust the ->srcu_have_cbs[] grace-period
e15a19306004b3 Pingfan Liu             2023-01-04  127  #define SRCU_SIZE_WAIT_CBS2	5	//  sequence elements or the ->srcu_data_have_cbs[]
e15a19306004b3 Pingfan Liu             2023-01-04  128  #define SRCU_SIZE_WAIT_CBS3	6	//  CPU-bitmask elements until all four elements of
e15a19306004b3 Pingfan Liu             2023-01-04  129  #define SRCU_SIZE_WAIT_CBS4	7	//  each array have been initialized.
e15a19306004b3 Pingfan Liu             2023-01-04  130  #define SRCU_SIZE_BIG		8	// The srcu_node combining tree is fully initialized
e15a19306004b3 Pingfan Liu             2023-01-04  131  					//  and all aspects of it are being put to use.
994f706872e6ce Paul E. McKenney        2022-01-24  132  
da915ad5cf25b5 Paul E. McKenney        2017-04-05  133  /* Values for state variable (bottom bits of ->srcu_gp_seq). */
d8be81735aa894 Paul E. McKenney        2017-03-25  134  #define SRCU_STATE_IDLE		0
d8be81735aa894 Paul E. McKenney        2017-03-25  135  #define SRCU_STATE_SCAN1	1
d8be81735aa894 Paul E. McKenney        2017-03-25  136  #define SRCU_STATE_SCAN2	2
d8be81735aa894 Paul E. McKenney        2017-03-25  137  
29bc83e4d90546 JP Kobryn               2024-07-15  138  /*
29bc83e4d90546 JP Kobryn               2024-07-15  139   * Values for initializing gp sequence fields. Higher values allow wrap arounds to
29bc83e4d90546 JP Kobryn               2024-07-15  140   * occur earlier.
29bc83e4d90546 JP Kobryn               2024-07-15  141   * The second value with state is useful in the case of static initialization of
29bc83e4d90546 JP Kobryn               2024-07-15  142   * srcu_usage where srcu_gp_seq_needed is expected to have some state value in its
29bc83e4d90546 JP Kobryn               2024-07-15  143   * lower bits (or else it will appear to be already initialized within
29bc83e4d90546 JP Kobryn               2024-07-15  144   * the call check_init_srcu_struct()).
29bc83e4d90546 JP Kobryn               2024-07-15  145   */
29bc83e4d90546 JP Kobryn               2024-07-15  146  #define SRCU_GP_SEQ_INITIAL_VAL ((0UL - 100UL) << RCU_SEQ_CTR_SHIFT)
29bc83e4d90546 JP Kobryn               2024-07-15  147  #define SRCU_GP_SEQ_INITIAL_VAL_WITH_STATE (SRCU_GP_SEQ_INITIAL_VAL - 1)
29bc83e4d90546 JP Kobryn               2024-07-15  148  
03200b5ca3b4d4 Paul E. McKenney        2023-03-17 @149  #define __SRCU_USAGE_INIT(name)									\
d8be81735aa894 Paul E. McKenney        2017-03-25  150  {												\
d633198088bd9e Paul E. McKenney        2017-10-10  151  	.lock = __SPIN_LOCK_UNLOCKED(name.lock),						\
29bc83e4d90546 JP Kobryn               2024-07-15  152  	.srcu_gp_seq = SRCU_GP_SEQ_INITIAL_VAL,							\
29bc83e4d90546 JP Kobryn               2024-07-15  153  	.srcu_gp_seq_needed = SRCU_GP_SEQ_INITIAL_VAL_WITH_STATE,				\
29bc83e4d90546 JP Kobryn               2024-07-15  154  	.srcu_gp_seq_needed_exp = SRCU_GP_SEQ_INITIAL_VAL,					\
4e6ea4ef56f942 Paul E. McKenney        2018-08-14  155  	.work = __DELAYED_WORK_INITIALIZER(name.work, NULL, 0),					\
03200b5ca3b4d4 Paul E. McKenney        2023-03-17  156  }
03200b5ca3b4d4 Paul E. McKenney        2023-03-17  157  
03200b5ca3b4d4 Paul E. McKenney        2023-03-17  158  #define __SRCU_STRUCT_INIT_COMMON(name, usage_name)						\
95433f7263011e Paul E. McKenney        2023-03-16  159  	.srcu_sup = &usage_name,								\
f4d01a259374ef Paul E. McKenney        2023-03-17  160  	__SRCU_DEP_MAP_INIT(name)
f4d01a259374ef Paul E. McKenney        2023-03-17  161  
95433f7263011e Paul E. McKenney        2023-03-16  162  #define __SRCU_STRUCT_INIT_MODULE(name, usage_name)						\
f4d01a259374ef Paul E. McKenney        2023-03-17  163  {												\
95433f7263011e Paul E. McKenney        2023-03-16  164  	__SRCU_STRUCT_INIT_COMMON(name, usage_name)						\
d8be81735aa894 Paul E. McKenney        2017-03-25  165  }
d8be81735aa894 Paul E. McKenney        2017-03-25  166  
95433f7263011e Paul E. McKenney        2023-03-16 @167  #define __SRCU_STRUCT_INIT(name, usage_name, pcpu_name)						\
f4d01a259374ef Paul E. McKenney        2023-03-17  168  {												\
f4d01a259374ef Paul E. McKenney        2023-03-17  169  	.sda = &pcpu_name,									\
795e7efec6ea7e Paul E. McKenney        2024-12-19  170  	.srcu_ctrp = &pcpu_name.srcu_ctrs[0],							\
95433f7263011e Paul E. McKenney        2023-03-16  171  	__SRCU_STRUCT_INIT_COMMON(name, usage_name)						\
d8be81735aa894 Paul E. McKenney        2017-03-25  172  }
d8be81735aa894 Paul E. McKenney        2017-03-25  173  
d8be81735aa894 Paul E. McKenney        2017-03-25  174  /*
d8be81735aa894 Paul E. McKenney        2017-03-25  175   * Define and initialize a srcu struct at build time.
d8be81735aa894 Paul E. McKenney        2017-03-25  176   * Do -not- call init_srcu_struct() nor cleanup_srcu_struct() on it.
d8be81735aa894 Paul E. McKenney        2017-03-25  177   *
d8be81735aa894 Paul E. McKenney        2017-03-25  178   * Note that although DEFINE_STATIC_SRCU() hides the name from other
d8be81735aa894 Paul E. McKenney        2017-03-25  179   * files, the per-CPU variable rules nevertheless require that the
d8be81735aa894 Paul E. McKenney        2017-03-25  180   * chosen name be globally unique.  These rules also prohibit use of
d8be81735aa894 Paul E. McKenney        2017-03-25  181   * DEFINE_STATIC_SRCU() within a function.  If these rules are too
d8be81735aa894 Paul E. McKenney        2017-03-25  182   * restrictive, declare the srcu_struct manually.  For example, in
d8be81735aa894 Paul E. McKenney        2017-03-25  183   * each file:
d8be81735aa894 Paul E. McKenney        2017-03-25  184   *
d8be81735aa894 Paul E. McKenney        2017-03-25  185   *	static struct srcu_struct my_srcu;
d8be81735aa894 Paul E. McKenney        2017-03-25  186   *
d8be81735aa894 Paul E. McKenney        2017-03-25  187   * Then, before the first use of each my_srcu, manually initialize it:
d8be81735aa894 Paul E. McKenney        2017-03-25  188   *
d8be81735aa894 Paul E. McKenney        2017-03-25  189   *	init_srcu_struct(&my_srcu);
d8be81735aa894 Paul E. McKenney        2017-03-25  190   *
d8be81735aa894 Paul E. McKenney        2017-03-25  191   * See include/linux/percpu-defs.h for the rules on per-CPU variables.
d8be81735aa894 Paul E. McKenney        2017-03-25  192   */
fe15b50cdeeebd Paul E. McKenney        2019-04-05  193  #ifdef MODULE
fe15b50cdeeebd Paul E. McKenney        2019-04-05  194  # define __DEFINE_SRCU(name, is_static)								\
03200b5ca3b4d4 Paul E. McKenney        2023-03-17  195  	static struct srcu_usage name##_srcu_usage = __SRCU_USAGE_INIT(name##_srcu_usage);	\
95433f7263011e Paul E. McKenney        2023-03-16  196  	is_static struct srcu_struct name = __SRCU_STRUCT_INIT_MODULE(name, name##_srcu_usage);	\
db8f1471c61336 Alexander Aring         2022-01-26  197  	extern struct srcu_struct * const __srcu_struct_##name;					\
056b89e7e69974 Joel Fernandes (Google  2019-04-11  198) 	struct srcu_struct * const __srcu_struct_##name						\
fe15b50cdeeebd Paul E. McKenney        2019-04-05  199  		__section("___srcu_struct_ptrs") = &name
fe15b50cdeeebd Paul E. McKenney        2019-04-05  200  #else
d8be81735aa894 Paul E. McKenney        2017-03-25  201  # define __DEFINE_SRCU(name, is_static)								\
da915ad5cf25b5 Paul E. McKenney        2017-04-05  202  	static DEFINE_PER_CPU(struct srcu_data, name##_srcu_data);				\
03200b5ca3b4d4 Paul E. McKenney        2023-03-17  203  	static struct srcu_usage name##_srcu_usage = __SRCU_USAGE_INIT(name##_srcu_usage);	\
fe15b50cdeeebd Paul E. McKenney        2019-04-05  204  	is_static struct srcu_struct name =							\
95433f7263011e Paul E. McKenney        2023-03-16  205  		__SRCU_STRUCT_INIT(name, name##_srcu_usage, name##_srcu_data)
fe15b50cdeeebd Paul E. McKenney        2019-04-05  206  #endif
d8be81735aa894 Paul E. McKenney        2017-03-25 @207  #define DEFINE_SRCU(name)		__DEFINE_SRCU(name, /* not static */)
d8be81735aa894 Paul E. McKenney        2017-03-25 @208  #define DEFINE_STATIC_SRCU(name)	__DEFINE_SRCU(name, static)
d8be81735aa894 Paul E. McKenney        2017-03-25  209  
443971156cebfc Paul E. McKenney        2025-01-13  210  int __srcu_read_lock(struct srcu_struct *ssp) __acquires(ssp);
aacb5d91ab1bfb Paul E. McKenney        2018-10-28  211  void synchronize_srcu_expedited(struct srcu_struct *ssp);
aacb5d91ab1bfb Paul E. McKenney        2018-10-28  212  void srcu_barrier(struct srcu_struct *ssp);
aacb5d91ab1bfb Paul E. McKenney        2018-10-28  213  void srcu_torture_stats_print(struct srcu_struct *ssp, char *tt, char *tf);
d8be81735aa894 Paul E. McKenney        2017-03-25  214  
f4bde41dd19db5 Paul E. McKenney        2025-01-08  215  // Converts a per-CPU pointer to an ->srcu_ctrs[] array element to that
f4bde41dd19db5 Paul E. McKenney        2025-01-08  216  // element's index.
f4bde41dd19db5 Paul E. McKenney        2025-01-08 @217  static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct srcu_ctr __percpu *scpp)
f4bde41dd19db5 Paul E. McKenney        2025-01-08  218  {
f4bde41dd19db5 Paul E. McKenney        2025-01-08 @219  	return scpp - &ssp->sda->srcu_ctrs[0];
f4bde41dd19db5 Paul E. McKenney        2025-01-08  220  }
f4bde41dd19db5 Paul E. McKenney        2025-01-08  221  
4937096b579a36 Paul E. McKenney        2025-01-08  222  // Converts an integer to a per-CPU pointer to the corresponding
4937096b579a36 Paul E. McKenney        2025-01-08  223  // ->srcu_ctrs[] array element.
4937096b579a36 Paul E. McKenney        2025-01-08 @224  static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ssp, int idx)
4937096b579a36 Paul E. McKenney        2025-01-08  225  {
4937096b579a36 Paul E. McKenney        2025-01-08 @226  	return &ssp->sda->srcu_ctrs[idx];
4937096b579a36 Paul E. McKenney        2025-01-08  227  }
4937096b579a36 Paul E. McKenney        2025-01-08  228  
c4020620528e4e Paul E. McKenney        2025-01-09  229  /*
c4020620528e4e Paul E. McKenney        2025-01-09  230   * Counts the new reader in the appropriate per-CPU element of the
c4020620528e4e Paul E. McKenney        2025-01-09  231   * srcu_struct.  Returns a pointer that must be passed to the matching
c4020620528e4e Paul E. McKenney        2025-01-09  232   * srcu_read_unlock_fast().
c4020620528e4e Paul E. McKenney        2025-01-09  233   *
3cec27453db49a Paul E. McKenney        2025-01-28  234   * Note that both this_cpu_inc() and atomic_long_inc() are RCU read-side
3cec27453db49a Paul E. McKenney        2025-01-28  235   * critical sections either because they disables interrupts, because they
3cec27453db49a Paul E. McKenney        2025-01-28  236   * are a single instruction, or because they are a read-modify-write atomic
3cec27453db49a Paul E. McKenney        2025-01-28  237   * operation, depending on the whims of the architecture.
3cec27453db49a Paul E. McKenney        2025-01-28  238   *
3cec27453db49a Paul E. McKenney        2025-01-28  239   * This means that __srcu_read_lock_fast() is not all that fast
3cec27453db49a Paul E. McKenney        2025-01-28  240   * on architectures that support NMIs but do not supply NMI-safe
3cec27453db49a Paul E. McKenney        2025-01-28  241   * implementations of this_cpu_inc().
c4020620528e4e Paul E. McKenney        2025-01-09  242   */
c4020620528e4e Paul E. McKenney        2025-01-09 @243  static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
c4020620528e4e Paul E. McKenney        2025-01-09  244  {
c4020620528e4e Paul E. McKenney        2025-01-09 @245  	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
c4020620528e4e Paul E. McKenney        2025-01-09  246  
c4020620528e4e Paul E. McKenney        2025-01-09  247  	RCU_LOCKDEP_WARN(!rcu_is_watching(), "RCU must be watching srcu_read_lock_fast().");
3cec27453db49a Paul E. McKenney        2025-01-28  248  	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
c4020620528e4e Paul E. McKenney        2025-01-09 @249  		this_cpu_inc(scp->srcu_locks.counter); /* Y */
3cec27453db49a Paul E. McKenney        2025-01-28  250  	else
3cec27453db49a Paul E. McKenney        2025-01-28  251  		atomic_long_inc(raw_cpu_ptr(&scp->srcu_locks));  /* Z */
c4020620528e4e Paul E. McKenney        2025-01-09  252  	barrier(); /* Avoid leaking the critical section. */
c4020620528e4e Paul E. McKenney        2025-01-09  253  	return scp;
c4020620528e4e Paul E. McKenney        2025-01-09  254  }
c4020620528e4e Paul E. McKenney        2025-01-09  255  

:::::: The code at line 69 was first introduced by commit
:::::: 95433f7263011e0e6e83caef85d98896dd99cab7 srcu: Begin offloading srcu_struct fields to srcu_update

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
