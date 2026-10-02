Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD6447D948;
	Fri,  2 Oct 2026 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935869; cv=none; b=TxPJF506j+yFczEWvRMrBHcwRBtLtgCgo4G8ADi7DRsFZN0tUCTEf1FBGPHgtxUzoRoeG0h2zVUvrd/26c6PFUWcGt23JGwNAiqEFonxxXUljrogh0p+qYcQKU3nmDFvylrMbIRtEYDqj8EhrhkMY1YvtImspBxbmX8OJCPEBFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935869; c=relaxed/simple;
	bh=hJkeqIHSJ1u99vcU8TlhGfjVmL3pyVE322pZB+Z7peI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jqzNwwvQSYisIeFb35cR5+c3DEOmq2jJyfg0IhVXtty89k9hgpnC+AclH3fBExWh190hxc5QOR5mhlEzCqU/m5cjiunYa10ZnfqA/1QIwdq91qRgAu5aRlyRRh6CVI0AdlM8NyWoNVM/t12R6hIuGdaOyCtVYJegZR5VPSFvqik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYist2f7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYist2f7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790935862; x=1822471862;
  h=date:from:to:cc:subject:message-id;
  bh=hJkeqIHSJ1u99vcU8TlhGfjVmL3pyVE322pZB+Z7peI=;
  b=CYist2f7gkqR54HlCuMr5xFlCQmoPVTXmgY71CKCSvKqbI6WNKz+fSwd
   Tv7SYN6a8NGABSsoT4vX9sztpsJJDdV+akMamAbHH5i6woSeMZxEsAHeq
   B5SlplaYg/0GATzRqlm2DUbH/t5MJHzUzpRfFF3Cp2+gBJocJkCn484vb
   /4SBlosf/15XeLZ9RB/2X58aEn9BODIaF/mSgjAv44eUdFuLzXiOy8nM8
   OZil8gzkttmsbyPkcpz4EySVvpA5eg9kXs2m4GarRSA2ObxX2Nsp5yHLy
   ySOiMu+a/g+zzOqM6ZUn0SD4z2yXf++gbcSAnaMh0k0xkeCbrXcSgsALc
   Q==;
X-CSE-ConnectionGUID: B3XujIbUQFmlPOxGnr27+A==
X-CSE-MsgGUID: nRw7bEe+RbiRf7RQN4u0YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102375637"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102375637"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 03:10:57 -0700
X-CSE-ConnectionGUID: 0rZFlKWsTteWPDzzqVIVIw==
X-CSE-MsgGUID: jEmaHWqLSimb235zdZmUAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275770703"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2026 03:10:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCaE8-00000000SvI-3R0y;
	Fri, 02 Oct 2026 10:10:52 +0000
Date: Fri, 02 Oct 2026 18:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 76/79]
 include/linux/perf_event.h:1580:2: error: no member named 'ip' in 'struct
 pt_regs'
Message-ID: <202610021816.Itetzwq0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   699de4c95a417e4c81644a91131ceb23bf0519a6
commit: 17ed86e21fb97985103da6dd9f879843e828b643 [76/79] gtrace: Add perf driver for tracing using perf tool
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261002/202610021816.Itetzwq0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021816.Itetzwq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021816.Itetzwq0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:25:
>> arch/x86/include/asm/perf_event.h:710:47: warning: declaration of 'struct perf_event' will not be visible outside of this function [-Wvisibility]
     710 | static inline int forward_event_to_ibs(struct perf_event *event) { return -ENOENT; }
         |                                               ^
   arch/x86/include/asm/perf_event.h:770:40: warning: declaration of 'struct perf_event' will not be visible outside of this function [-Wvisibility]
     770 | extern int x86_perf_rdpmc_index(struct perf_event *event);
         |                                        ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1580:2: error: no member named 'ip' in 'struct pt_regs'
    1580 |         perf_arch_fetch_caller_regs(regs, CALLER_ADDR0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/perf_event.h:747:10: note: expanded from macro 'perf_arch_fetch_caller_regs'
     747 |         (regs)->ip = (__ip);                                    \
         |         ~~~~~~  ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1580:2: error: no member named 'sp' in 'struct pt_regs'
    1580 |         perf_arch_fetch_caller_regs(regs, CALLER_ADDR0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/perf_event.h:748:10: note: expanded from macro 'perf_arch_fetch_caller_regs'
     748 |         (regs)->sp = (unsigned long)__builtin_frame_address(0); \
         |         ~~~~~~  ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1580:2: error: no member named 'cs' in 'struct pt_regs'
    1580 |         perf_arch_fetch_caller_regs(regs, CALLER_ADDR0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/perf_event.h:749:10: note: expanded from macro 'perf_arch_fetch_caller_regs'
     749 |         (regs)->cs = __KERNEL_CS;                               \
         |         ~~~~~~  ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1580:2: error: use of undeclared identifier '__KERNEL_CS'
   arch/x86/include/asm/perf_event.h:749:15: note: expanded from macro 'perf_arch_fetch_caller_regs'
     749 |         (regs)->cs = __KERNEL_CS;                               \
         |                      ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:64:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1580:2: error: no member named 'flags' in 'struct pt_regs'
    1580 |         perf_arch_fetch_caller_regs(regs, CALLER_ADDR0);
         |         ^                           ~~~~
   arch/x86/include/asm/perf_event.h:750:8: note: expanded from macro 'perf_arch_fetch_caller_regs'
     750 |         regs->flags = 0;                                        \
         |         ~~~~  ^
   3 warnings and 5 errors generated.
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PERF_EVENTS
   Depends on [n]: HAVE_PERF_EVENTS [=n]
   Selected by [m]:
   - GTRACE [=m] && OF [=y]


vim +1580 include/linux/perf_event.h

5331d7b84613b8 Frederic Weisbecker 2010-03-04  1563  
5331d7b84613b8 Frederic Weisbecker 2010-03-04  1564  /*
d15d356887e770 Kairui Song         2019-04-23  1565   * When generating a perf sample in-line, instead of from an interrupt /
d15d356887e770 Kairui Song         2019-04-23  1566   * exception, we lack a pt_regs. This is typically used from software events
d15d356887e770 Kairui Song         2019-04-23  1567   * like: SW_CONTEXT_SWITCHES, SW_MIGRATIONS and the tie-in with tracepoints.
d15d356887e770 Kairui Song         2019-04-23  1568   *
d15d356887e770 Kairui Song         2019-04-23  1569   * We typically don't need a full set, but (for x86) do require:
5331d7b84613b8 Frederic Weisbecker 2010-03-04  1570   * - ip for PERF_SAMPLE_IP
5331d7b84613b8 Frederic Weisbecker 2010-03-04  1571   * - cs for user_mode() tests
d15d356887e770 Kairui Song         2019-04-23  1572   * - sp for PERF_SAMPLE_CALLCHAIN
d15d356887e770 Kairui Song         2019-04-23  1573   * - eflags for MISC bits and CALLCHAIN (see: perf_hw_regs())
d15d356887e770 Kairui Song         2019-04-23  1574   *
d15d356887e770 Kairui Song         2019-04-23  1575   * NOTE: assumes @regs is otherwise already 0 filled; this is important for
d15d356887e770 Kairui Song         2019-04-23  1576   * things like PERF_SAMPLE_REGS_INTR.
5331d7b84613b8 Frederic Weisbecker 2010-03-04  1577   */
b0f82b81fe6bbc Frederic Weisbecker 2010-05-20  1578  static inline void perf_fetch_caller_regs(struct pt_regs *regs)
5331d7b84613b8 Frederic Weisbecker 2010-03-04  1579  {
b0f82b81fe6bbc Frederic Weisbecker 2010-05-20 @1580  	perf_arch_fetch_caller_regs(regs, CALLER_ADDR0);
5331d7b84613b8 Frederic Weisbecker 2010-03-04  1581  }
5331d7b84613b8 Frederic Weisbecker 2010-03-04  1582  

:::::: The code at line 1580 was first introduced by commit
:::::: b0f82b81fe6bbcf78d478071f33e44554726bc81 perf: Drop the skip argument from perf_arch_fetch_regs_caller

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
