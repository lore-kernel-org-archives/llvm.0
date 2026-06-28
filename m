Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D3940D598;
	Sun, 28 Jun 2026 07:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782632933; cv=none; b=Mp8GWxUGiKjEQzc06b2DR7ahFPep+V//p61qbMRyn9OWpcBL5tjWTaCuD79aLQKkpG7HwecfJZHdeYpv7WUt1f8WCy7q22hSdX5RRSnBWtkMlBrgNFyiDZiDXgKLO2zCC1hp4Yi3wtRxh6qTMQ69uKT5Y/QtUt14h8U/Ly4htJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782632933; c=relaxed/simple;
	bh=1v6zG3j5sC6BUKoGL1Kxhc+gCD14DIvror7EdF54tFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rNiRIrP0eRC4P/voyrcJWOh9je9424paaKX8KZtnFJo7kEtU2eLvb1RaCj4g7uTT9Le1vZtLnkL2hg5S4R1QtCQdbYXC6qZ1/nYGhgohS4dZemIJfvMaGqYsVazZciQ5JOotS8Pk3czLMXNM+OuLB2/YURkZR0atLci0LDykSCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGCxoj+3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGCxoj+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782632931; x=1814168931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1v6zG3j5sC6BUKoGL1Kxhc+gCD14DIvror7EdF54tFg=;
  b=hGCxoj+3cztbZRtkZZ1cQBo5rLN7fb+ql04dOuIi27CkY8USusxkgJWU
   T+FcblQDh/VEJAqehTfbBIBaXj62b5Afh2WnyG0VDhwHrZn+qhkkoYb3H
   hrkuZb/okKjr3ibNCDdS5FchQH5POx2ReEVLzuk8dwUBSg5qz1ySlgbQ7
   EUmELeSJzRpRdZRajrASHLLN/TDordSo4nXFSZUu35jxj3cfiXSmFLAZO
   4VkKhJ1E8kTIYJFS6RXmiSlx+ZeQMO3zKWPsFsoONCQK8aOGeVMY4ZE7B
   kQ3jNsJRw7/UEGODsiAXDgckDsfr0EU4jKfcqjI228sy3xEZRj4Pd3vRA
   g==;
X-CSE-ConnectionGUID: BwXtglOMSHq8xCC2hYls4g==
X-CSE-MsgGUID: 63/2zPm5Qh69y6/Wh8++GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="82460999"
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="82460999"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 00:48:50 -0700
X-CSE-ConnectionGUID: Mguh8y3uSemQrckfjAeFYQ==
X-CSE-MsgGUID: dZ3+tGWpQjWeh/jN84plAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="255291076"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Jun 2026 00:48:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdkFx-000000006FB-3I23;
	Sun, 28 Jun 2026 07:48:45 +0000
Date: Sun, 28 Jun 2026 15:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-header-dependencies 5/5]
 arch/x86/include/asm/nospec-branch.h:536:23: error: type specifier missing,
 defaults to 'int'; ISO C99 and later do not support implicit int
Message-ID: <202606281514.ho7S5SzS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-header-dependencies
head:   03d5a8129cbb0bdada3b8d5556c2458a6a397bab
commit: 03d5a8129cbb0bdada3b8d5556c2458a6a397bab [5/5] hrtimer: Remove inclusion of hrtimer_bases.h remove from hrtimer.h
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260628/202606281514.ho7S5SzS-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606281514.ho7S5SzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606281514.ho7S5SzS-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5680: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5909: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from arch/x86/include/asm/preempt.h:6:
   In file included from arch/x86/include/asm/percpu.h:593:
   In file included from include/asm-generic/percpu.h:8:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:9:
>> arch/x86/include/asm/nospec-branch.h:536:23: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     536 | DECLARE_PER_CPU(bool, x86_ibpb_exit_to_user);
         |                       ^
         |                       int
   arch/x86/include/asm/nospec-branch.h:536:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     536 | DECLARE_PER_CPU(bool, x86_ibpb_exit_to_user);
         | ^
         | int
   arch/x86/include/asm/nospec-branch.h:547:22: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     547 | DECLARE_PER_CPU(u64, x86_spec_ctrl_current);
         |                      ^
         |                      int
   arch/x86/include/asm/nospec-branch.h:547:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     547 | DECLARE_PER_CPU(u64, x86_spec_ctrl_current);
         | ^
         | int
>> arch/x86/include/asm/nospec-branch.h:547:1: error: conflicting types for 'DECLARE_PER_CPU'
   arch/x86/include/asm/nospec-branch.h:536:1: note: previous declaration is here
     536 | DECLARE_PER_CPU(bool, x86_ibpb_exit_to_user);
         | ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]


vim +/int +536 arch/x86/include/asm/nospec-branch.h

dd84441a797150d David Woodhouse   2018-02-19  535  
2f8f173413f1cbf Pawan Gupta       2025-08-14 @536  DECLARE_PER_CPU(bool, x86_ibpb_exit_to_user);
2f8f173413f1cbf Pawan Gupta       2025-08-14  537  
20ffa1caecca4db David Woodhouse   2018-01-25  538  static inline void indirect_branch_prediction_barrier(void)
20ffa1caecca4db David Woodhouse   2018-01-25  539  {
b1b19cfcf4656c7 Josh Poimboeuf    2025-04-08  540  	asm_inline volatile(ALTERNATIVE("", "call write_ibpb", X86_FEATURE_IBPB)
b1b19cfcf4656c7 Josh Poimboeuf    2025-04-08  541  			    : ASM_CALL_CONSTRAINT
b1b19cfcf4656c7 Josh Poimboeuf    2025-04-08  542  			    :: "rax", "rcx", "rdx", "memory");
20ffa1caecca4db David Woodhouse   2018-01-25  543  }
20ffa1caecca4db David Woodhouse   2018-01-25  544  
fa8ac4988249c38 Thomas Gleixner   2018-05-12  545  /* The Intel SPEC CTRL MSR base value cache */
fa8ac4988249c38 Thomas Gleixner   2018-05-12  546  extern u64 x86_spec_ctrl_base;
db886979683a836 Nathan Chancellor 2022-07-13 @547  DECLARE_PER_CPU(u64, x86_spec_ctrl_current);
66065157420c5b9 Pawan Gupta       2022-11-30  548  extern void update_spec_ctrl_cond(u64 val);
bf5835bcdb9635c Peter Zijlstra    2022-06-14  549  extern u64 spec_ctrl_current(void);
fa8ac4988249c38 Thomas Gleixner   2018-05-12  550  

:::::: The code at line 536 was first introduced by commit
:::::: 2f8f173413f1cbf52660d04df92d0069c4306d25 x86/vmscape: Add conditional IBPB mitigation

:::::: TO: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
