Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2A42F12C6;
	Wed,  6 May 2026 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057249; cv=none; b=EtAX50pj35FkorprkWtQYgPaSCkn6wrbtOEEzPI2j2QHK5pKuOPMtbW6GMzaELeERfUYSnct0G9Ub9GYXp/ie+HPhp9NlS9X2pSuR9GT+mXP9aeAdcIwfd78oBuGyLet3rDE//DMNbrBBqzgaOs9dkXKSn3lClbxyhKz96CxQMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057249; c=relaxed/simple;
	bh=MFmaIMbnFEXwGB3PPJF9pDgE/AOZrA/3B9LkdnhKQWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XvamhTVP6TwAXJgbd+RuTmGYxbl4TGWQew/cssqpR69SHBwyIo0Lxz3H6rmj6Gm1wyS96scXhpuZUWVucIIQtohpZUNHjs/06xx/QGs2KDZDK7V7MDYN1yi5Zwgv6KoFKIZnG9iUO0mGwxqoNVoiiUxYMeI9e7QGxAZVzL0SIss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JS3HwStA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JS3HwStA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778057247; x=1809593247;
  h=date:from:to:cc:subject:message-id;
  bh=MFmaIMbnFEXwGB3PPJF9pDgE/AOZrA/3B9LkdnhKQWU=;
  b=JS3HwStARf0oeK19lwHUKAoizdWEGC3YcIMM1L7vEu4ETAv89w8wreFn
   oG0f7E9q/KOY+rUyDWvJ6MgntvW85+d/rZfaJOZmJv+1HHYPdnsO51wwC
   8sCsO4x0pBma4NhzyRQHSKDtV90Uam8nTTjT/LMNcMITjh/rKAE0v6DnJ
   aQN5NKHRCAv9kSi54XJXxBYDHhAwjLaBab7qBNzWU95PTQw7WNi1s/25F
   x/BTICRUqhHzJV1CtBBBb2fLrGvcZt6Yztt3ygUf/a40w9ywtETKHbSM1
   J6DPaNcEgEgVse4z4OondNGfskUnA0EnRZmtN6KlljENopKyM0dIv4hy/
   A==;
X-CSE-ConnectionGUID: GyKhCgEoRFG1JwBnnkwsYA==
X-CSE-MsgGUID: c9AQufnsQAOpru6t+GRVfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89681405"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="89681405"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:47:26 -0700
X-CSE-ConnectionGUID: I+bfruxcTjir4jBfjmu4tQ==
X-CSE-MsgGUID: QLr7vR4aQnifBr2ufYH83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="274208919"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 May 2026 01:47:24 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKXuc-000000000pf-0Kft;
	Wed, 06 May 2026 08:47:22 +0000
Date: Wed, 06 May 2026 16:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 33/37] include/linux/smp.h:72:48:
 error: use of undeclared identifier 'cpu_online_mask'
Message-ID: <202605061620.lTIwySVT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   53bcd35f2ff331adc7277b797333287028c91655
commit: 3e8fdfa964516dc41fe2573974f779b15dead630 [33/37] riscv: Select ARCH_HAS_RANDOM_ENTROPY
config: riscv-randconfig-002-20260506 (https://download.01.org/0day-ci/archive/20260506/202605061620.lTIwySVT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061620.lTIwySVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061620.lTIwySVT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:846:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     846 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insw'
     109 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:11:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     854 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
     110 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:11:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     863 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
     122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:11:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     872 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
     123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:11:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     881 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
     124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:11:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   7 warnings generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:8:
   In file included from include/linux/prandom.h:13:
   In file included from include/linux/percpu.h:5:
   In file included from include/linux/alloc_tag.h:13:
   In file included from include/linux/cpumask.h:15:
   In file included from include/linux/numa.h:6:
   In file included from include/linux/nodemask.h:94:
   In file included from include/linux/random.h:154:
   In file included from arch/riscv/include/asm/random.h:5:
   In file included from arch/riscv/include/asm/timex.h:13:
   In file included from arch/riscv/include/asm/clint.h:10:
   In file included from arch/riscv/include/asm/mmio.h:16:
   In file included from arch/riscv/include/asm/mmiowb.h:12:
>> include/linux/smp.h:72:48: error: use of undeclared identifier 'cpu_online_mask'
      72 |         on_each_cpu_cond_mask(NULL, func, info, wait, cpu_online_mask);
         |                                                       ^~~~~~~~~~~~~~~
   include/linux/smp.h:106:53: error: use of undeclared identifier 'cpu_online_mask'
     106 |         on_each_cpu_cond_mask(cond_func, func, info, wait, cpu_online_mask);
         |                                                            ^~~~~~~~~~~~~~~
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:8: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)


vim +/cpu_online_mask +72 include/linux/smp.h

6f1f942cd5fbbe He Ying     2021-05-06  66  
bff2dc42bcafdd David Daney 2013-09-11  67  /*
bff2dc42bcafdd David Daney 2013-09-11  68   * Call a function on all processors
bff2dc42bcafdd David Daney 2013-09-11  69   */
a5aa5ce3005972 Nadav Amit  2021-02-20  70  static inline void on_each_cpu(smp_call_func_t func, void *info, int wait)
a5aa5ce3005972 Nadav Amit  2021-02-20  71  {
a5aa5ce3005972 Nadav Amit  2021-02-20 @72  	on_each_cpu_cond_mask(NULL, func, info, wait, cpu_online_mask);
a5aa5ce3005972 Nadav Amit  2021-02-20  73  }
a5aa5ce3005972 Nadav Amit  2021-02-20  74  

:::::: The code at line 72 was first introduced by commit
:::::: a5aa5ce300597224ec76dacc8e63ba3ad7a18bbd smp: Inline on_each_cpu_cond() and on_each_cpu()

:::::: TO: Nadav Amit <namit@vmware.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
