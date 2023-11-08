Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39141D30E;
	Wed,  8 Nov 2023 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLfgfwGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699430263; x=1730966263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vbezr68KpeONLaz8DzXPAnIGRqeATr8GmaME1Qn4FD4=;
  b=XLfgfwGFSPXCMimEbqoyKYF0SvRyI0AFocaI8awytg/slqxhkzN9DXAL
   DsJVOeyYdEo9sKA2O0dFvHGokbZ6/23wKyPrfAWcHcmI4Y3Bsg0hWftE3
   EKbgj2gj2swOMIkYPl8tNQLJ0Imx+thpxXOWXVSP/91iYDYU5OD5CbOp3
   PkWcd2irSwEN2xmGZ1T2YBnb0CFd1Jx26oJBCHSvf+eqecFHyvBIBVsDD
   AhD9D2E9g5DOWsrT6x67RRC7ji+P1OhR0OTVOaygmJFc7RPgFO4i0reZd
   POc+1OFVSC3GwW8kePyqF1zUg8ZC/yTC4IZTYj/uNkaA9G030DqlxaUJl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456208514"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="456208514"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 23:57:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="853655344"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="853655344"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Nov 2023 23:57:40 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0dRS-0007nT-2B;
	Wed, 08 Nov 2023 07:57:38 +0000
Date: Wed, 8 Nov 2023 15:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 17/19] kernel/sched/debug.c:929:4: error:
 no member named 'rt_throttled' in 'struct rt_rq'
Message-ID: <202311081538.dVaCq636-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   4a97a4d025f6984a0ae7bb2c21ab09a52d4c1c6a
commit: 9a351a777960a04abb61fbaf95213ce67693b024 [17/19] sched/rt: Remove default bandwidth control
config: arm-orion5x_defconfig (https://download.01.org/0day-ci/archive/20231108/202311081538.dVaCq636-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081538.dVaCq636-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081538.dVaCq636-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:72:
   kernel/sched/debug.c:342:57: warning: overflow in expression; result is -100663296 with type 'long' [-Winteger-overflow]
     342 | static unsigned long fair_server_period_max = (1 << 22) * NSEC_PER_USEC; /* ~4 seconds */
         |                                                         ^
   kernel/sched/debug.c:529:40: warning: format specifies type 'long' but the argument has type 'unsigned int' [-Wformat]
     529 |                 snprintf(buf, sizeof(buf), "cpu%ld", cpu);
         |                                                ~~~   ^~~
         |                                                %u
>> kernel/sched/debug.c:929:4: error: no member named 'rt_throttled' in 'struct rt_rq'
     929 |         P(rt_throttled);
         |         ~~^~~~~~~~~~~~~
   kernel/sched/debug.c:922:58: note: expanded from macro 'P'
     922 |         SEQ_printf(m, "  .%-30s: %Ld\n", #x, (long long)(rt_rq->x))
         |                                                          ~~~~~  ^
   kernel/sched/debug.c:17:17: note: expanded from macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
>> kernel/sched/debug.c:929:4: error: no member named 'rt_throttled' in 'struct rt_rq'
     929 |         P(rt_throttled);
         |         ~~^~~~~~~~~~~~~
   kernel/sched/debug.c:922:58: note: expanded from macro 'P'
     922 |         SEQ_printf(m, "  .%-30s: %Ld\n", #x, (long long)(rt_rq->x))
         |                                                          ~~~~~  ^
   kernel/sched/debug.c:19:11: note: expanded from macro 'SEQ_printf'
      19 |                 pr_cont(x);                     \
         |                         ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:72:
>> kernel/sched/debug.c:930:5: error: no member named 'rt_time' in 'struct rt_rq'
     930 |         PN(rt_time);
         |         ~~~^~~~~~~~
   kernel/sched/debug.c:926:61: note: expanded from macro 'PN'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                             ~~~~~  ^
   kernel/sched/debug.c:45:31: note: expanded from macro 'SPLIT_NS'
      45 | #define SPLIT_NS(x) nsec_high(x), nsec_low(x)
         |                               ^
   kernel/sched/debug.c:17:17: note: expanded from macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
>> kernel/sched/debug.c:930:5: error: no member named 'rt_time' in 'struct rt_rq'
     930 |         PN(rt_time);
         |         ~~~^~~~~~~~
   kernel/sched/debug.c:926:61: note: expanded from macro 'PN'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                             ~~~~~  ^
   kernel/sched/debug.c:45:44: note: expanded from macro 'SPLIT_NS'
      45 | #define SPLIT_NS(x) nsec_high(x), nsec_low(x)
         |                                            ^
   kernel/sched/debug.c:17:17: note: expanded from macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
>> kernel/sched/debug.c:930:5: error: no member named 'rt_time' in 'struct rt_rq'
     930 |         PN(rt_time);
         |         ~~~^~~~~~~~
   kernel/sched/debug.c:926:61: note: expanded from macro 'PN'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                             ~~~~~  ^
   kernel/sched/debug.c:45:31: note: expanded from macro 'SPLIT_NS'
      45 | #define SPLIT_NS(x) nsec_high(x), nsec_low(x)
         |                               ^
   kernel/sched/debug.c:19:11: note: expanded from macro 'SEQ_printf'
      19 |                 pr_cont(x);                     \
         |                         ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:72:
>> kernel/sched/debug.c:930:5: error: no member named 'rt_time' in 'struct rt_rq'
     930 |         PN(rt_time);
         |         ~~~^~~~~~~~
   kernel/sched/debug.c:926:61: note: expanded from macro 'PN'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                             ~~~~~  ^
   kernel/sched/debug.c:45:44: note: expanded from macro 'SPLIT_NS'
      45 | #define SPLIT_NS(x) nsec_high(x), nsec_low(x)
         |                                            ^
   kernel/sched/debug.c:19:11: note: expanded from macro 'SEQ_printf'
      19 |                 pr_cont(x);                     \
         |                         ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:72:
>> kernel/sched/debug.c:931:5: error: no member named 'rt_runtime' in 'struct rt_rq'
     931 |         PN(rt_runtime);
         |         ~~~^~~~~~~~~~~
   kernel/sched/debug.c:926:61: note: expanded from macro 'PN'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                             ~~~~~  ^
   kernel/sched/debug.c:45:31: note: expanded from macro 'SPLIT_NS'
      45 | #define SPLIT_NS(x) nsec_high(x), nsec_low(x)
         |                               ^
   kernel/sched/debug.c:17:17: note: expanded from macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
>> kernel/sched/debug.c:931:5: error: no member named 'rt_runtime' in 'struct rt_rq'
     931 |         PN(rt_runtime);
         |         ~~~^~~~~~~~~~~
   kernel/sched/debug.c:926:61: note: expanded from macro 'PN'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                             ~~~~~  ^
   kernel/sched/debug.c:45:44: note: expanded from macro 'SPLIT_NS'
      45 | #define SPLIT_NS(x) nsec_high(x), nsec_low(x)
         |                                            ^
   kernel/sched/debug.c:17:17: note: expanded from macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
>> kernel/sched/debug.c:931:5: error: no member named 'rt_runtime' in 'struct rt_rq'
     931 |         PN(rt_runtime);
         |         ~~~^~~~~~~~~~~
   kernel/sched/debug.c:926:61: note: expanded from macro 'PN'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                             ~~~~~  ^
   kernel/sched/debug.c:45:31: note: expanded from macro 'SPLIT_NS'
      45 | #define SPLIT_NS(x) nsec_high(x), nsec_low(x)
         |                               ^
   kernel/sched/debug.c:19:11: note: expanded from macro 'SEQ_printf'
      19 |                 pr_cont(x);                     \
         |                         ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:72:
>> kernel/sched/debug.c:931:5: error: no member named 'rt_runtime' in 'struct rt_rq'
     931 |         PN(rt_runtime);
         |         ~~~^~~~~~~~~~~
   kernel/sched/debug.c:926:61: note: expanded from macro 'PN'
     926 |         SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
         |                                                             ~~~~~  ^
   kernel/sched/debug.c:45:44: note: expanded from macro 'SPLIT_NS'
      45 | #define SPLIT_NS(x) nsec_high(x), nsec_low(x)
         |                                            ^
   kernel/sched/debug.c:19:11: note: expanded from macro 'SEQ_printf'
      19 |                 pr_cont(x);                     \
         |                         ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   2 warnings and 10 errors generated.


vim +929 kernel/sched/debug.c

ada18de2eb7696 kernel/sched_debug.c Peter Zijlstra             2008-06-19  920  
ada18de2eb7696 kernel/sched_debug.c Peter Zijlstra             2008-06-19  921  #define P(x) \
ada18de2eb7696 kernel/sched_debug.c Peter Zijlstra             2008-06-19  922  	SEQ_printf(m, "  .%-30s: %Ld\n", #x, (long long)(rt_rq->x))
48365b38849fdb kernel/sched/debug.c Daniel Bristot de Oliveira 2017-06-26  923  #define PU(x) \
48365b38849fdb kernel/sched/debug.c Daniel Bristot de Oliveira 2017-06-26  924  	SEQ_printf(m, "  .%-30s: %lu\n", #x, (unsigned long)(rt_rq->x))
ada18de2eb7696 kernel/sched_debug.c Peter Zijlstra             2008-06-19  925  #define PN(x) \
ada18de2eb7696 kernel/sched_debug.c Peter Zijlstra             2008-06-19  926  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
ada18de2eb7696 kernel/sched_debug.c Peter Zijlstra             2008-06-19  927  
48365b38849fdb kernel/sched/debug.c Daniel Bristot de Oliveira 2017-06-26  928  	PU(rt_nr_running);
ada18de2eb7696 kernel/sched_debug.c Peter Zijlstra             2008-06-19 @929  	P(rt_throttled);
ada18de2eb7696 kernel/sched_debug.c Peter Zijlstra             2008-06-19 @930  	PN(rt_time);
ada18de2eb7696 kernel/sched_debug.c Peter Zijlstra             2008-06-19 @931  	PN(rt_runtime);
ada18de2eb7696 kernel/sched_debug.c Peter Zijlstra             2008-06-19  932  

:::::: The code at line 929 was first introduced by commit
:::::: ada18de2eb76961a4d4847f63291744c9e7beec4 sched: debug: add some rt debug output

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
