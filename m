Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4A91292D0;
	Thu,  9 May 2024 21:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715291200; cv=none; b=iztJxFLDF7dKpR0X2Clz9zt/4nW6VT9oka4Dj0I+401O0Wy6/ZS4cozwRGQBd3WEB6NG5fQmDDc8JF84ojgGeydKnoLlKpMVKPlPX6o4KfQQaY0E1dgEF9cn1xswAlEKLkssZ7Hxi11m57VK8d3dRInixdENIDcYXbw1rseSXec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715291200; c=relaxed/simple;
	bh=FiADPjugLftvR7Z3dqiqdhocrSgIcPMJnX5ULdUPiiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJ0m6z0KWeb8MDRipG2S6eDClh0sxCmg8KRxqyTiW0hPiNJCUUUr03QkXR/mCV8XoSAuOM3zVpRNgJwqlJKTKNAZneDmDb6dmFKXbGYESsFRQsMByrZBXY+S79wLsLXdCM6GHKXoTIEpMTQ2ZCQaaEsmOtaiLtrK+eaa6vEnQYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8dNBZpY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8dNBZpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715291197; x=1746827197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FiADPjugLftvR7Z3dqiqdhocrSgIcPMJnX5ULdUPiiU=;
  b=a8dNBZpYb7JuuWRCB45o9lrIKP0AeX3sWt902Bf5BpsyVe05DG4d/Wbc
   4+WqdfC0z2crDLllIRw/LGKjZwxJVnPBd2h03lnhD//1f/3DbTV2bG1i+
   R8poHXP5sR/OlIgVS+MZKLQSDVV+2O/Zo2Txmabu9/3lm5YzsVboXYDs1
   Y6HRGCpt+T8h58F1U12Uo7zDZNxVZGZ6X+sXKnUlPTmWhwMtuq0dtZeao
   ocT9XxHqHC7QiT07T8rwdMT23uiNcIarA6FGOas56v2tHXUUw+jBmLbSV
   xL7816+sEb207PqzjbQrkHbXFqp0l9787YakUQ876j+SE4K+Bndo/Gjo1
   w==;
X-CSE-ConnectionGUID: Xh62eAfVT1adyaVobqmw7g==
X-CSE-MsgGUID: 14pATar3QKulwof//fJM1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11411389"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="11411389"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 14:46:27 -0700
X-CSE-ConnectionGUID: DSwfYVmTR7Sef014F857gg==
X-CSE-MsgGUID: 920kDJHoTUq5Q/B5UdnI6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="29384136"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 May 2024 14:46:26 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Bap-0005Od-04;
	Thu, 09 May 2024 21:46:23 +0000
Date: Fri, 10 May 2024 05:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hongyan Xia <hongyan.xia2@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/6] sched/fair: Use util biases for utilization
 and frequency
Message-ID: <202405100546.GBPxpFZ0-lkp@intel.com>
References: <f0be5911214d2f6f7ea92c6c3eed37270215c590.1715082714.git.hongyan.xia2@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0be5911214d2f6f7ea92c6c3eed37270215c590.1715082714.git.hongyan.xia2@arm.com>

Hi Hongyan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master next-20240509]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge linus/master tip/auto-latest peterz-queue/sched/core v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongyan-Xia/Revert-sched-uclamp-Set-max_spare_cap_cpu-even-if-max_spare_cap-is-0/20240507-205300
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/f0be5911214d2f6f7ea92c6c3eed37270215c590.1715082714.git.hongyan.xia2%40arm.com
patch subject: [RFC PATCH v3 3/6] sched/fair: Use util biases for utilization and frequency
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240510/202405100546.GBPxpFZ0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100546.GBPxpFZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100546.GBPxpFZ0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:416:10: note: expanded from macro '__native_word'
     416 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:416:39: note: expanded from macro '__native_word'
     416 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:417:10: note: expanded from macro '__native_word'
     417 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:417:38: note: expanded from macro '__native_word'
     417 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:405:13: note: expanded from macro '__unqual_scalar_typeof'
     405 |                 _Generic((x),                                           \
         |                           ^
   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:412:15: note: expanded from macro '__unqual_scalar_typeof'
     412 |                          default: (x)))
         |                                    ^
   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:3121:9: error: returning 'void' from a function with incompatible result type 'unsigned long'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
      47 | #define READ_ONCE(x)                                                    \
         |                                                                         ^
      48 | ({                                                                      \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 | })
         | ~~
   1 warning and 9 errors generated.
--
   In file included from kernel/sched/fair.c:27:
   In file included from include/linux/mm_api.h:1:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/fair.c:54:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:416:10: note: expanded from macro '__native_word'
     416 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/fair.c:54:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:416:39: note: expanded from macro '__native_word'
     416 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/fair.c:54:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:417:10: note: expanded from macro '__native_word'
     417 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/fair.c:54:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:417:38: note: expanded from macro '__native_word'
     417 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/fair.c:54:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from kernel/sched/fair.c:54:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:405:13: note: expanded from macro '__unqual_scalar_typeof'
     405 |                 _Generic((x),                                           \
         |                           ^
   In file included from kernel/sched/fair.c:54:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:412:15: note: expanded from macro '__unqual_scalar_typeof'
     412 |                          default: (x)))
         |                                    ^
   In file included from kernel/sched/fair.c:54:
>> kernel/sched/sched.h:3121:27: error: no member named 'avg' in 'struct cfs_rq'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                          ~~~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   In file included from kernel/sched/fair.c:54:
>> kernel/sched/sched.h:3121:9: error: returning 'void' from a function with incompatible result type 'unsigned long'
    3121 |         return READ_ONCE(rq->cfs.avg.util_avg);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
      47 | #define READ_ONCE(x)                                                    \
         |                                                                         ^
      48 | ({                                                                      \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 | })
         | ~~
   kernel/sched/fair.c:6752:29: error: no member named 'avg' in 'struct cfs_rq'
    6752 |         util_bias_enqueue(&rq->cfs.avg, p);
         |                            ~~~~~~~ ^
   kernel/sched/fair.c:6846:29: error: no member named 'avg' in 'struct cfs_rq'
    6846 |         util_bias_dequeue(&rq->cfs.avg, p);
         |                            ~~~~~~~ ^
   1 warning and 11 errors generated.


vim +3121 kernel/sched/sched.h

  3118	
  3119	static inline unsigned long root_cfs_util_uclamp(struct rq *rq)
  3120	{
> 3121		return READ_ONCE(rq->cfs.avg.util_avg);
  3122	}
  3123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
