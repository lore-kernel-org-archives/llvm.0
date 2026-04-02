Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6971E3C6616;
	Thu,  2 Apr 2026 11:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130573; cv=none; b=H0Cdbq/XSeabQjZTFSFshER4XH/iLqfig4z+bdyhO0mCy7cGHWBOidY5dSPDAonEL55kn/CNQLv2xx1DQfpfwuir4U59NR+nTkg8KmSCqsFH9+p7tGtnY7ZzGVu4lTLAjc5+hn/Wv5SssxqXrlZDnPYgetakaUs712AMg8G6hCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130573; c=relaxed/simple;
	bh=CViUaGXqBzO9IDq+XmKAUho55AZwmoW26H8wGK9LrOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bqXLMb/A7mTeSe7qu0jbO107fQp9wrIWCID3u6rAa1RHPifmwvpof2byzyCE+Sv+Te/sNZCIPs2P9Uq1x6cuc3rYTjpwXa/0aCsJtrIzsFPVcaJfaXUlI36MZxb4PDKxmPjydu/x5pk8SlT7LQ/lJj82Ff9/z7tmlWbVnI1+AQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdeNdFKB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdeNdFKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775130563; x=1806666563;
  h=date:from:to:cc:subject:message-id;
  bh=CViUaGXqBzO9IDq+XmKAUho55AZwmoW26H8wGK9LrOI=;
  b=fdeNdFKB+x3D/+c0cDYUb8JqP2kgheMAQqB4ZgJrqoOZ3ow5WmTMcoep
   ImvcyyzMp47mGX9Hsbz/+KHD5ld1+RHSEpoo5D7x5CmcO7Op4k4/9Avi7
   JQiRcVAR2ZA+kpmZsK8oSecMGD4kjN0mLwrXt74T6/Y0i3a4hQxFW3Dgn
   FPy/+aZn0JZRDnm+btUHsiA2a7GSFCh8pPMvmJoCxjSlzMAYX95r9meyK
   dFva3crO6t6LszuCvZE2cl1pLYj3jS1r72HNrjpnZW7eiRXsbR0Fzz2Zt
   2kM0lJ+vXTVSbsOI5Ke5h0Xqc5Sd9oHwPRxERVfyqgR8oFyyJZFpa0RUd
   Q==;
X-CSE-ConnectionGUID: Ih5Yau34TT6sEKkt3FepBA==
X-CSE-MsgGUID: A4xpWEzNS7iM1ajQX4iFiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76074749"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="76074749"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 04:49:21 -0700
X-CSE-ConnectionGUID: 56nZAPHcTK+fGOPM+dVadQ==
X-CSE-MsgGUID: +uhD+oArTCGyIeT7hjEAxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="220303995"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2026 04:49:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8GY1-0000000092T-2FEz;
	Thu, 02 Apr 2026 11:49:17 +0000
Date: Thu, 02 Apr 2026 13:48:28 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/entry/rework 2/11]
 include/linux/entry-common.h:324:2: error: call to undeclared function
 'local_irq_disable_exit_to_user'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202604021323.WS9SEJPr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/entry/rework
head:   1e10c666f8f7ec4524fd226186a6ae0ad495aad5
commit: be5c2d5a23beab5211c64f1237c238a1df622c47 [2/11] entry: Remove local_irq_{enable,disable}_exit_to_user()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260402/202604021323.WS9SEJPr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604021323.WS9SEJPr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604021323.WS9SEJPr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/entry/syscall_64.c:8:
>> include/linux/entry-common.h:324:2: error: call to undeclared function 'local_irq_disable_exit_to_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     324 |         local_irq_disable_exit_to_user();
         |         ^
   1 error generated.


vim +/local_irq_disable_exit_to_user +324 include/linux/entry-common.h

c6156e1da633f2 Sven Schnelle     2020-12-01  288  
a9f3a74a29af09 Thomas Gleixner   2020-07-22  289  /**
a9f3a74a29af09 Thomas Gleixner   2020-07-22  290   * syscall_exit_to_user_mode - Handle work before returning to user mode
a9f3a74a29af09 Thomas Gleixner   2020-07-22  291   * @regs:	Pointer to currents pt_regs
a9f3a74a29af09 Thomas Gleixner   2020-07-22  292   *
e1647100c22eb7 Jinjie Ruan       2026-01-28  293   * Invoked with interrupts enabled and fully valid @regs. Returns with all
a9f3a74a29af09 Thomas Gleixner   2020-07-22  294   * work handled, interrupts disabled such that the caller can immediately
a9f3a74a29af09 Thomas Gleixner   2020-07-22  295   * switch to user mode. Called from architecture specific syscall and ret
a9f3a74a29af09 Thomas Gleixner   2020-07-22  296   * from fork code.
a9f3a74a29af09 Thomas Gleixner   2020-07-22  297   *
a9f3a74a29af09 Thomas Gleixner   2020-07-22  298   * The call order is:
a9f3a74a29af09 Thomas Gleixner   2020-07-22  299   *  1) One-time syscall exit work:
a9f3a74a29af09 Thomas Gleixner   2020-07-22  300   *	- rseq syscall exit
a9f3a74a29af09 Thomas Gleixner   2020-07-22  301   *      - audit
a9f3a74a29af09 Thomas Gleixner   2020-07-22  302   *	- syscall tracing
0cfcb2b9ef48bb Eric W. Biederman 2022-01-27  303   *	- ptrace (single stepping)
a9f3a74a29af09 Thomas Gleixner   2020-07-22  304   *
a9f3a74a29af09 Thomas Gleixner   2020-07-22  305   *  2) Preparatory work
e1647100c22eb7 Jinjie Ruan       2026-01-28  306   *	- Disable interrupts
a9f3a74a29af09 Thomas Gleixner   2020-07-22  307   *	- Exit to user mode loop (common TIF handling). Invokes
a9f3a74a29af09 Thomas Gleixner   2020-07-22  308   *	  arch_exit_to_user_mode_work() for architecture specific TIF work
a9f3a74a29af09 Thomas Gleixner   2020-07-22  309   *	- Architecture specific one time work arch_exit_to_user_mode_prepare()
a9f3a74a29af09 Thomas Gleixner   2020-07-22  310   *	- Address limit and lockdep checks
a9f3a74a29af09 Thomas Gleixner   2020-07-22  311   *
310de1a678b218 Sven Schnelle     2020-12-01  312   *  3) Final transition (lockdep, tracing, context tracking, RCU), i.e. the
310de1a678b218 Sven Schnelle     2020-12-01  313   *     functionality in exit_to_user_mode().
c6156e1da633f2 Sven Schnelle     2020-12-01  314   *
e1647100c22eb7 Jinjie Ruan       2026-01-28  315   * This is a combination of syscall_exit_to_user_mode_work() (1), disabling
e1647100c22eb7 Jinjie Ruan       2026-01-28  316   * interrupts followed by syscall_exit_to_user_mode_prepare() (2) and
e1647100c22eb7 Jinjie Ruan       2026-01-28  317   * exit_to_user_mode() (3). This function is preferred unless there is a
e1647100c22eb7 Jinjie Ruan       2026-01-28  318   * compelling architectural reason to invoke the functions separately.
a9f3a74a29af09 Thomas Gleixner   2020-07-22  319   */
e43b8bb56e537b Charlie Jenkins   2025-03-20  320  static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
e43b8bb56e537b Charlie Jenkins   2025-03-20  321  {
e43b8bb56e537b Charlie Jenkins   2025-03-20  322  	instrumentation_begin();
e43b8bb56e537b Charlie Jenkins   2025-03-20  323  	syscall_exit_to_user_mode_work(regs);
e1647100c22eb7 Jinjie Ruan       2026-01-28 @324  	local_irq_disable_exit_to_user();
e1647100c22eb7 Jinjie Ruan       2026-01-28  325  	syscall_exit_to_user_mode_prepare(regs);
e43b8bb56e537b Charlie Jenkins   2025-03-20  326  	instrumentation_end();
e43b8bb56e537b Charlie Jenkins   2025-03-20  327  	exit_to_user_mode();
e43b8bb56e537b Charlie Jenkins   2025-03-20  328  }
a9f3a74a29af09 Thomas Gleixner   2020-07-22  329  

:::::: The code at line 324 was first introduced by commit
:::::: e1647100c22eb718e9833211722cbb78e339047c entry: Rework syscall_exit_to_user_mode_work() for architecture reuse

:::::: TO: Jinjie Ruan <ruanjinjie@huawei.com>
:::::: CC: Thomas Gleixner <tglx@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
