Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F87F22DFAA;
	Fri,  2 May 2025 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178610; cv=none; b=qflV1sOEgy8KCTT5QyHUfDVtT0o3JhvDIffL4fvXbWQUV+Ab262AKNK2pf4d3vGgZNUJ2K2jAo/N5GG6muUkC+mL7jtHDLbv67snDIxv5W8IKwaRvFjwyRj/14Pof5+2ZP+RoarkMT49hCouaxKFpenDeMg8Wijncwo6LB7wNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178610; c=relaxed/simple;
	bh=dFwP72r6h+RsLqMz4USe+hHLZczG8GtKTf3seIKFPUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JnmHnsHihu26rm1n3MA1qwicfKU2RIIbVC/lDOjn/KVANhUzFPMK4Fi6YktCmjud+57mKr3K3rQn39g2JEmv2KQJFDfoDx7kdEB1hvEHYdKaFFjb66nxkD0+W4DwBZVzJpGzpFyFfWusT+uoaSbOnEUEhjxLGGP/mzJvLh5aheg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxxBFAdo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxxBFAdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746178608; x=1777714608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dFwP72r6h+RsLqMz4USe+hHLZczG8GtKTf3seIKFPUQ=;
  b=XxxBFAdoK+F/uTTFXi7Zx6hmf4vumEUYe9/Oa+rp1qxsUAnrZbc4XAme
   DvQtqum9/CMbVkSBj2hswBPaLLiJxoZ3WlhotOuLDYwBsCtBm1+v+P/Bu
   Qb5/ifL7ZKFoSRqOBM9+ZIUS6CO4FGwW0DQT7GbszpLUzYWoal3lR8+CX
   AoXZDWxxJ01WtVWeB5TBIEBND1J/eK8SYXJSpWbAPbUdpikKo2xmRBdhw
   li86pynMJ0OZGSEY3//CY9Owlsrvmt88u2IKkfL1wqxibmHUFAEgMPM6m
   Iuuq77MGjacIOj9d41+AXzEaXOziKvUjtmXTju7TDZNwV2PaXQMhWoRdT
   Q==;
X-CSE-ConnectionGUID: M0TZhDBfQVCbgWl0qoY6mw==
X-CSE-MsgGUID: +nqUV+odRgWWmzntRWSqWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="59221025"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="59221025"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:36:47 -0700
X-CSE-ConnectionGUID: 8Ue8JXcHRtW+gu55gfl6ow==
X-CSE-MsgGUID: zFB/D+xTSjSXTLkljNSpGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134497644"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 May 2025 02:36:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAmp0-0004ex-1N;
	Fri, 02 May 2025 09:36:42 +0000
Date: Fri, 2 May 2025 17:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mel Gorman <mgorman@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kees Cook <kees@kernel.org>
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 3270/4324] include/linux/jump_label.h:262:9: error: call to undeclared
 function 'raw_atomic_read'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202505021733.1mT6KFhT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   da2f3a9f5091c2c6ee04ce79f7031338e6decac3
commit: b2c87200aae5db99ba86065d020ac14a22d22a03 [3270/4324] mm: security: Check early if HARDENED_USERCOPY is enabled
config: powerpc-randconfig-003-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021733.1mT6KFhT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021733.1mT6KFhT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021733.1mT6KFhT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/scftorture.c:11:
   In file included from include/linux/atomic.h:7:
   In file included from arch/powerpc/include/asm/atomic.h:11:
   In file included from arch/powerpc/include/asm/cmpxchg.h:755:
   In file included from include/asm-generic/cmpxchg-local.h:6:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/powerpc/include/asm/irqflags.h:12:
   In file included from arch/powerpc/include/asm/hw_irq.h:12:
   In file included from arch/powerpc/include/asm/ptrace.h:342:
   In file included from include/linux/thread_info.h:221:
>> include/linux/jump_label.h:262:9: error: call to undeclared function 'raw_atomic_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     262 |         return raw_atomic_read(&key->enabled);
         |                ^
>> include/linux/jump_label.h:295:6: error: call to undeclared function 'atomic_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     295 |         v = atomic_read(&key->enabled);
         |             ^
>> include/linux/jump_label.h:299:19: error: call to undeclared function 'atomic_try_cmpxchg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     299 |         } while (!likely(atomic_try_cmpxchg(&key->enabled, &v, v + 1)));
         |                          ^
>> include/linux/jump_label.h:307:2: error: call to undeclared function 'atomic_dec'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |         atomic_dec(&key->enabled);
         |         ^
   include/linux/jump_label.h:325:6: error: call to undeclared function 'atomic_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     325 |         if (atomic_read(&key->enabled) != 0) {
         |             ^
>> include/linux/jump_label.h:329:2: error: call to undeclared function 'atomic_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     329 |         atomic_set(&key->enabled, 1);
         |         ^
   include/linux/jump_label.h:336:6: error: call to undeclared function 'atomic_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     336 |         if (atomic_read(&key->enabled) != 1) {
         |             ^
   include/linux/jump_label.h:340:2: error: call to undeclared function 'atomic_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     340 |         atomic_set(&key->enabled, 0);
         |         ^
   In file included from kernel/scftorture.c:11:
   In file included from include/linux/atomic.h:80:
>> include/linux/atomic/atomic-arch-fallback.h:455:1: error: static declaration of 'raw_atomic_read' follows non-static declaration
     455 | raw_atomic_read(const atomic_t *v)
         | ^
   include/linux/jump_label.h:262:9: note: previous implicit declaration is here
     262 |         return raw_atomic_read(&key->enabled);
         |                ^
   In file included from kernel/scftorture.c:11:
   In file included from include/linux/atomic.h:82:
>> include/linux/atomic/atomic-instrumented.h:30:1: error: static declaration of 'atomic_read' follows non-static declaration
      30 | atomic_read(const atomic_t *v)
         | ^
   include/linux/jump_label.h:295:6: note: previous implicit declaration is here
     295 |         v = atomic_read(&key->enabled);
         |             ^
   In file included from kernel/scftorture.c:11:
   In file included from include/linux/atomic.h:82:
>> include/linux/atomic/atomic-instrumented.h:65:1: error: static declaration of 'atomic_set' follows non-static declaration
      65 | atomic_set(atomic_t *v, int i)
         | ^
   include/linux/jump_label.h:329:2: note: previous implicit declaration is here
     329 |         atomic_set(&key->enabled, 1);
         |         ^
   In file included from kernel/scftorture.c:11:
   In file included from include/linux/atomic.h:82:
>> include/linux/atomic/atomic-instrumented.h:590:1: error: static declaration of 'atomic_dec' follows non-static declaration
     590 | atomic_dec(atomic_t *v)
         | ^
   include/linux/jump_label.h:307:2: note: previous implicit declaration is here
     307 |         atomic_dec(&key->enabled);
         |         ^
   In file included from kernel/scftorture.c:11:
   In file included from include/linux/atomic.h:82:
>> include/linux/atomic/atomic-instrumented.h:1275:1: error: static declaration of 'atomic_try_cmpxchg' follows non-static declaration
    1275 | atomic_try_cmpxchg(atomic_t *v, int *old, int new)
         | ^
   include/linux/jump_label.h:299:19: note: previous implicit declaration is here
     299 |         } while (!likely(atomic_try_cmpxchg(&key->enabled, &v, v + 1)));
         |                          ^
   In file included from kernel/scftorture.c:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scftorture.c:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scftorture.c:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scftorture.c:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/scftorture.c:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
--
   In file included from kernel/ucount.c:4:
   In file included from include/linux/sysctl.h:26:
   In file included from include/linux/rcupdate.h:25:
   In file included from include/linux/atomic.h:7:
   In file included from arch/powerpc/include/asm/atomic.h:11:
   In file included from arch/powerpc/include/asm/cmpxchg.h:755:
   In file included from include/asm-generic/cmpxchg-local.h:6:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/powerpc/include/asm/irqflags.h:12:
   In file included from arch/powerpc/include/asm/hw_irq.h:12:
   In file included from arch/powerpc/include/asm/ptrace.h:342:
   In file included from include/linux/thread_info.h:221:
>> include/linux/jump_label.h:262:9: error: call to undeclared function 'raw_atomic_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     262 |         return raw_atomic_read(&key->enabled);
         |                ^
>> include/linux/jump_label.h:295:6: error: call to undeclared function 'atomic_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     295 |         v = atomic_read(&key->enabled);
         |             ^
>> include/linux/jump_label.h:299:19: error: call to undeclared function 'atomic_try_cmpxchg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     299 |         } while (!likely(atomic_try_cmpxchg(&key->enabled, &v, v + 1)));
         |                          ^
>> include/linux/jump_label.h:307:2: error: call to undeclared function 'atomic_dec'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |         atomic_dec(&key->enabled);
         |         ^
   include/linux/jump_label.h:325:6: error: call to undeclared function 'atomic_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     325 |         if (atomic_read(&key->enabled) != 0) {
         |             ^
>> include/linux/jump_label.h:329:2: error: call to undeclared function 'atomic_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     329 |         atomic_set(&key->enabled, 1);
         |         ^
   include/linux/jump_label.h:336:6: error: call to undeclared function 'atomic_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     336 |         if (atomic_read(&key->enabled) != 1) {
         |             ^
   include/linux/jump_label.h:340:2: error: call to undeclared function 'atomic_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     340 |         atomic_set(&key->enabled, 0);
         |         ^
   In file included from kernel/ucount.c:4:
   In file included from include/linux/sysctl.h:26:
   In file included from include/linux/rcupdate.h:25:
   In file included from include/linux/atomic.h:80:
>> include/linux/atomic/atomic-arch-fallback.h:455:1: error: static declaration of 'raw_atomic_read' follows non-static declaration
     455 | raw_atomic_read(const atomic_t *v)
         | ^
   include/linux/jump_label.h:262:9: note: previous implicit declaration is here
     262 |         return raw_atomic_read(&key->enabled);
         |                ^
   In file included from kernel/ucount.c:4:
   In file included from include/linux/sysctl.h:26:
   In file included from include/linux/rcupdate.h:25:
   In file included from include/linux/atomic.h:82:
>> include/linux/atomic/atomic-instrumented.h:30:1: error: static declaration of 'atomic_read' follows non-static declaration
      30 | atomic_read(const atomic_t *v)
         | ^
   include/linux/jump_label.h:295:6: note: previous implicit declaration is here
     295 |         v = atomic_read(&key->enabled);
         |             ^
   In file included from kernel/ucount.c:4:
   In file included from include/linux/sysctl.h:26:
   In file included from include/linux/rcupdate.h:25:
   In file included from include/linux/atomic.h:82:
>> include/linux/atomic/atomic-instrumented.h:65:1: error: static declaration of 'atomic_set' follows non-static declaration
      65 | atomic_set(atomic_t *v, int i)
         | ^
   include/linux/jump_label.h:329:2: note: previous implicit declaration is here
     329 |         atomic_set(&key->enabled, 1);
         |         ^
   In file included from kernel/ucount.c:4:
   In file included from include/linux/sysctl.h:26:
   In file included from include/linux/rcupdate.h:25:
   In file included from include/linux/atomic.h:82:
>> include/linux/atomic/atomic-instrumented.h:590:1: error: static declaration of 'atomic_dec' follows non-static declaration
     590 | atomic_dec(atomic_t *v)
         | ^
   include/linux/jump_label.h:307:2: note: previous implicit declaration is here
     307 |         atomic_dec(&key->enabled);
         |         ^
   In file included from kernel/ucount.c:4:
   In file included from include/linux/sysctl.h:26:
   In file included from include/linux/rcupdate.h:25:
   In file included from include/linux/atomic.h:82:
>> include/linux/atomic/atomic-instrumented.h:1275:1: error: static declaration of 'atomic_try_cmpxchg' follows non-static declaration
    1275 | atomic_try_cmpxchg(atomic_t *v, int *old, int new)
         | ^
   include/linux/jump_label.h:299:19: note: previous implicit declaration is here
     299 |         } while (!likely(atomic_try_cmpxchg(&key->enabled, &v, v + 1)));
         |                          ^
   13 errors generated.
--
   In file included from crypto/api.c:15:
   In file included from include/linux/jump_label.h:257:
   In file included from include/linux/atomic.h:7:
   In file included from arch/powerpc/include/asm/atomic.h:11:
   In file included from arch/powerpc/include/asm/cmpxchg.h:755:
   In file included from include/asm-generic/cmpxchg-local.h:6:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/powerpc/include/asm/irqflags.h:12:
   In file included from arch/powerpc/include/asm/hw_irq.h:12:
   In file included from arch/powerpc/include/asm/ptrace.h:342:
>> include/linux/thread_info.h:225:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     225 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         | ^
         | int
>> include/linux/thread_info.h:225:26: error: a parameter list without types is only allowed in a function definition
     225 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |                          ^
>> include/linux/thread_info.h:232:6: error: call to undeclared function 'static_branch_maybe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     232 |             static_branch_maybe(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |             ^
>> include/linux/thread_info.h:232:26: error: use of undeclared identifier 'CONFIG_HARDENED_USERCOPY_DEFAULT_ON'
     232 |             static_branch_maybe(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |                                 ^
>> include/linux/thread_info.h:233:6: error: use of undeclared identifier 'validate_usercopy_range'
     233 |                                 &validate_usercopy_range)) {
         |                                  ^
   In file included from crypto/api.c:20:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/api.c:20:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/api.c:20:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/api.c:20:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/api.c:20:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/api.c:20:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/api.c:20:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/api.c:20:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/api.c:20:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:8: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                      ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/api.c:20:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:24: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                                      ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/api.c:20:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:140:3: note: expanded from macro '_SIG_SET_BINOP'
..


vim +/raw_atomic_read +262 include/linux/jump_label.h

1f69bf9c613760 Jason Baron             2016-08-03  259  
656d054e0a15ec Peter Zijlstra          2022-05-02  260  static __always_inline int static_key_count(struct static_key *key)
4c5ea0a9cd02d6 Paolo Bonzini           2016-06-21  261  {
0f613bfa8268a8 Mark Rutland            2023-06-05 @262  	return raw_atomic_read(&key->enabled);
4c5ea0a9cd02d6 Paolo Bonzini           2016-06-21  263  }
4c5ea0a9cd02d6 Paolo Bonzini           2016-06-21  264  
97ce2c88f9ad42 Jeremy Fitzhardinge     2011-10-12  265  static __always_inline void jump_label_init(void)
97ce2c88f9ad42 Jeremy Fitzhardinge     2011-10-12  266  {
c4b2c0c5f647aa Hannes Frederic Sowa    2013-10-19  267  	static_key_initialized = true;
97ce2c88f9ad42 Jeremy Fitzhardinge     2011-10-12  268  }
97ce2c88f9ad42 Jeremy Fitzhardinge     2011-10-12  269  
91a1d97ef482c1 Peter Zijlstra          2024-03-13  270  static __always_inline void jump_label_init_ro(void) { }
91a1d97ef482c1 Peter Zijlstra          2024-03-13  271  
c5905afb0ee655 Ingo Molnar             2012-02-24  272  static __always_inline bool static_key_false(struct static_key *key)
c5905afb0ee655 Ingo Molnar             2012-02-24  273  {
2f0df49c89acaa Steven Rostedt (VMware  2020-12-11  274) 	if (unlikely_notrace(static_key_count(key) > 0))
c5905afb0ee655 Ingo Molnar             2012-02-24  275  		return true;
c5905afb0ee655 Ingo Molnar             2012-02-24  276  	return false;
c5905afb0ee655 Ingo Molnar             2012-02-24  277  }
c5905afb0ee655 Ingo Molnar             2012-02-24  278  
c5905afb0ee655 Ingo Molnar             2012-02-24  279  static __always_inline bool static_key_true(struct static_key *key)
d430d3d7e646eb Jason Baron             2011-03-16  280  {
2f0df49c89acaa Steven Rostedt (VMware  2020-12-11  281) 	if (likely_notrace(static_key_count(key) > 0))
d430d3d7e646eb Jason Baron             2011-03-16  282  		return true;
d430d3d7e646eb Jason Baron             2011-03-16  283  	return false;
d430d3d7e646eb Jason Baron             2011-03-16  284  }
bf5438fca2950b Jason Baron             2010-09-17  285  
eb8c507296f603 Dmitry Safonov          2022-11-23  286  static inline bool static_key_fast_inc_not_disabled(struct static_key *key)
d430d3d7e646eb Jason Baron             2011-03-16  287  {
eb8c507296f603 Dmitry Safonov          2022-11-23  288  	int v;
eb8c507296f603 Dmitry Safonov          2022-11-23  289  
5cdda5117e125e Borislav Petkov         2017-10-18  290  	STATIC_KEY_CHECK_USE(key);
eb8c507296f603 Dmitry Safonov          2022-11-23  291  	/*
eb8c507296f603 Dmitry Safonov          2022-11-23  292  	 * Prevent key->enabled getting negative to follow the same semantics
eb8c507296f603 Dmitry Safonov          2022-11-23  293  	 * as for CONFIG_JUMP_LABEL=y, see kernel/jump_label.c comment.
eb8c507296f603 Dmitry Safonov          2022-11-23  294  	 */
eb8c507296f603 Dmitry Safonov          2022-11-23 @295  	v = atomic_read(&key->enabled);
eb8c507296f603 Dmitry Safonov          2022-11-23  296  	do {
eb8c507296f603 Dmitry Safonov          2022-11-23  297  		if (v < 0 || (v + 1) < 0)
eb8c507296f603 Dmitry Safonov          2022-11-23  298  			return false;
eb8c507296f603 Dmitry Safonov          2022-11-23 @299  	} while (!likely(atomic_try_cmpxchg(&key->enabled, &v, v + 1)));
eb8c507296f603 Dmitry Safonov          2022-11-23  300  	return true;
d430d3d7e646eb Jason Baron             2011-03-16  301  }
eb8c507296f603 Dmitry Safonov          2022-11-23  302  #define static_key_slow_inc(key)	static_key_fast_inc_not_disabled(key)
bf5438fca2950b Jason Baron             2010-09-17  303  
c5905afb0ee655 Ingo Molnar             2012-02-24  304  static inline void static_key_slow_dec(struct static_key *key)
bf5438fca2950b Jason Baron             2010-09-17  305  {
5cdda5117e125e Borislav Petkov         2017-10-18  306  	STATIC_KEY_CHECK_USE(key);
d430d3d7e646eb Jason Baron             2011-03-16 @307  	atomic_dec(&key->enabled);
bf5438fca2950b Jason Baron             2010-09-17  308  }
bf5438fca2950b Jason Baron             2010-09-17  309  
ce48c146495a1a Peter Zijlstra          2018-01-22  310  #define static_key_slow_inc_cpuslocked(key) static_key_slow_inc(key)
ce48c146495a1a Peter Zijlstra          2018-01-22  311  #define static_key_slow_dec_cpuslocked(key) static_key_slow_dec(key)
ce48c146495a1a Peter Zijlstra          2018-01-22  312  
4c3ef6d79328c0 Jason Baron             2010-09-17  313  static inline int jump_label_text_reserved(void *start, void *end)
4c3ef6d79328c0 Jason Baron             2010-09-17  314  {
4c3ef6d79328c0 Jason Baron             2010-09-17  315  	return 0;
4c3ef6d79328c0 Jason Baron             2010-09-17  316  }
4c3ef6d79328c0 Jason Baron             2010-09-17  317  
91bad2f8d30574 Jason Baron             2010-10-01  318  static inline void jump_label_lock(void) {}
91bad2f8d30574 Jason Baron             2010-10-01  319  static inline void jump_label_unlock(void) {}
91bad2f8d30574 Jason Baron             2010-10-01  320  
e33886b38cc82a Peter Zijlstra          2015-07-24  321  static inline void static_key_enable(struct static_key *key)
e33886b38cc82a Peter Zijlstra          2015-07-24  322  {
5cdda5117e125e Borislav Petkov         2017-10-18  323  	STATIC_KEY_CHECK_USE(key);
e33886b38cc82a Peter Zijlstra          2015-07-24  324  
1dbb6704de91b1 Paolo Bonzini           2017-08-01  325  	if (atomic_read(&key->enabled) != 0) {
1dbb6704de91b1 Paolo Bonzini           2017-08-01  326  		WARN_ON_ONCE(atomic_read(&key->enabled) != 1);
1dbb6704de91b1 Paolo Bonzini           2017-08-01  327  		return;
1dbb6704de91b1 Paolo Bonzini           2017-08-01  328  	}
1dbb6704de91b1 Paolo Bonzini           2017-08-01 @329  	atomic_set(&key->enabled, 1);
e33886b38cc82a Peter Zijlstra          2015-07-24  330  }
e33886b38cc82a Peter Zijlstra          2015-07-24  331  

:::::: The code at line 262 was first introduced by commit
:::::: 0f613bfa8268a89be25f2b6b58fc6fe8ccd9a2ba locking/atomic: treewide: use raw_atomic*_<op>()

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
