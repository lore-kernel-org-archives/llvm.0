Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A0536B05E;
	Fri, 26 Jun 2026 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782501275; cv=none; b=eHkXbNeX8bKN8vQ4UNfsxof2AOnWhJWa8HMcRoX3d1OTvYXuQ2LY724aPuibcVdAP+kZIhaEtn9bK6P3ABp6ySACxgNU+OKIjLQ3LinDvWg2h+OGyu4wyM3CZYd5fgRotJ8cdP78Q2Xyc6gYrK1PHeBrkejumn/3gA15qpNhMR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782501275; c=relaxed/simple;
	bh=Uvj9han53ZGOnMq1huycOBv+PLMV6ktMEjvXTW+OIOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U10/k3bCU1s6j0bkGxxKTk4uoXIoFswTTZDqyrTwbKLM+KiW8OC6759akLEYh0VKL//nB5eavRnjFqVE9XdqeRKhmaDz7ykJcu6iz03eFOid/oV92qBLmKKPVush13YZNEExylU3+EENlO74nC/a3pJot4xirU0NtFy2FTJDiJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krWTUJeC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krWTUJeC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782501274; x=1814037274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uvj9han53ZGOnMq1huycOBv+PLMV6ktMEjvXTW+OIOI=;
  b=krWTUJeCDOy7hxwJL5USjVapNLrE9LB3ueXGpE7o2btV/rUNIVza3fJw
   1LYiMCEOyDV4F4iOsuyaH0iFYwIBwxeQaVpCwhqrMYr386R4+e5d6dd9M
   IMZ4tIqsikfLw9Zsp4l46uIX2XITjKw3SNTwPQDEvA56laFjjwYsPmWLG
   eDgSMqa1oksQDhtpZMCsy3Ttvb/Dn6jP4ZMoC8IsAokmvDo07jJeIT/g4
   WI9PjQECBSfKMrCYUYoXNIf+iXPGQ4hYoMgces6VVEKW0rNi3DfeGiMAg
   G9PZrjM/NWxvNxa221vS69JCmFh/O+aj2xuam1YcetY2YMdQ1W6uMDDjX
   Q==;
X-CSE-ConnectionGUID: y1EQ0itTR9qxb9UhW3SscA==
X-CSE-MsgGUID: 0dIRZR2lQgyROSftjhy8cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="100846056"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="100846056"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 12:14:33 -0700
X-CSE-ConnectionGUID: lZeKuejRStSDcyygLfjw3g==
X-CSE-MsgGUID: PjwAcs+SSMOc3yclWm1SDA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jun 2026 12:14:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdC0T-000000005Mz-0BYx;
	Fri, 26 Jun 2026 19:14:29 +0000
Date: Sat, 27 Jun 2026 03:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-header-dependencies 5/5]
 include/linux/hrtimer_rearm.h:80:97: error: use of undeclared identifier
 'false'; did you mean 'else'?
Message-ID: <202606270343.XYWq4Kgr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-header-dependencies
head:   0fffc8fb3ee52eaf84481a67834faa5bb8b482b0
commit: 0fffc8fb3ee52eaf84481a67834faa5bb8b482b0 [5/5] hrtimer: Remove inclusion of hrtimer_bases.h remove from hrtimer.h
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260627/202606270343.XYWq4Kgr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270343.XYWq4Kgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270343.XYWq4Kgr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/time/vsyscall.c:10:
   In file included from include/linux/hrtimer.h:15:
   include/linux/hrtimer_rearm.h:79:24: error: unknown type name 'bool'
      79 | static __always_inline bool
         |                        ^
>> include/linux/hrtimer_rearm.h:80:97: error: use of undeclared identifier 'false'; did you mean 'else'?
      80 | hrtimer_rearm_deferred_user_irq(unsigned long *tif_work, const unsigned long tif_mask) { return false; }
         |                                                                                                 ^~~~~
         |                                                                                                 else
>> include/linux/hrtimer_rearm.h:80:97: error: expected expression
   include/linux/hrtimer_rearm.h:81:24: error: unknown type name 'bool'
      81 | static __always_inline bool hrtimer_test_and_clear_rearm_deferred(void) { return false; }
         |                        ^
   include/linux/hrtimer_rearm.h:81:82: error: use of undeclared identifier 'false'; did you mean 'else'?
      81 | static __always_inline bool hrtimer_test_and_clear_rearm_deferred(void) { return false; }
         |                                                                                  ^~~~~
         |                                                                                  else
   include/linux/hrtimer_rearm.h:81:82: error: expected expression
   In file included from kernel/time/vsyscall.c:12:
   In file included from include/vdso/datapage.h:25:
   In file included from arch/loongarch/include/asm/vdso/arch_data.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/time/vsyscall.c:12:
   In file included from include/vdso/datapage.h:25:
   In file included from arch/loongarch/include/asm/vdso/arch_data.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/time/vsyscall.c:12:
   In file included from include/vdso/datapage.h:25:
   In file included from arch/loongarch/include/asm/vdso/arch_data.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/time/vsyscall.c:12:
   In file included from include/vdso/datapage.h:25:
   In file included from arch/loongarch/include/asm/vdso/arch_data.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/time/vsyscall.c:12:
   In file included from include/vdso/datapage.h:25:
   In file included from arch/loongarch/include/asm/vdso/arch_data.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/time/vsyscall.c:12:
   In file included from include/vdso/datapage.h:25:
   In file included from arch/loongarch/include/asm/vdso/arch_data.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/time/vsyscall.c:12:
   In file included from include/vdso/datapage.h:25:
   In file included from arch/loongarch/include/asm/vdso/arch_data.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/time/vsyscall.c:12:


vim +80 include/linux/hrtimer_rearm.h

15dd3a9488557d Peter Zijlstra 2026-02-24  74  
a43b4856bc0396 Peter Zijlstra 2026-02-24  75  #else  /* CONFIG_HRTIMER_REARM_DEFERRED */
a43b4856bc0396 Peter Zijlstra 2026-02-24  76  static __always_inline void __hrtimer_rearm_deferred(void) { }
a43b4856bc0396 Peter Zijlstra 2026-02-24  77  static __always_inline void hrtimer_rearm_deferred(void) { }
a43b4856bc0396 Peter Zijlstra 2026-02-24  78  static __always_inline void hrtimer_rearm_deferred_tif(unsigned long tif_work) { }
a43b4856bc0396 Peter Zijlstra 2026-02-24  79  static __always_inline bool
a43b4856bc0396 Peter Zijlstra 2026-02-24 @80  hrtimer_rearm_deferred_user_irq(unsigned long *tif_work, const unsigned long tif_mask) { return false; }
a43b4856bc0396 Peter Zijlstra 2026-02-24  81  static __always_inline bool hrtimer_test_and_clear_rearm_deferred(void) { return false; }
a43b4856bc0396 Peter Zijlstra 2026-02-24  82  #endif  /* !CONFIG_HRTIMER_REARM_DEFERRED */
a43b4856bc0396 Peter Zijlstra 2026-02-24  83  

:::::: The code at line 80 was first introduced by commit
:::::: a43b4856bc039675165a50d9ef5f41b28520f0f4 hrtimer: Prepare stubs for deferred rearming

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
