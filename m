Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7102C21FD;
	Thu, 20 Aug 2026 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208916; cv=none; b=pEx4115D7DV+jCHR7TwXkNfqD3tz1Iu8GgN8TbiWUe2hVUFZ3y3+0OQ57XedVlNvDJ78vyHaHd9L9Z8I968NGRZmtB5/NQDwrfY8wtjmkD2LVNvlVfiiYPrhppmMV6Me59TkZ6PsjZAHi70kPRZm5X5288SBq8woOYPOYDnRv3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208916; c=relaxed/simple;
	bh=utSokGxt+3fSEuTpympSX9BSn+GQNZCKZa3vtKKnUUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9cGywRsejCKxNxMwV1VPfwvVK+7dA3NDkr3Rruj75c1SDPpjC/9JvKc0PlYhRRhvjMeZL/h+kid5MowSIds6H1QdMNsCTSPJ6EbeL4qqltQlYOuVZYafjW7YeqjqtZr+T2P6qS1vN87mt7FgDP5XgjBa3p2uDwKH6TIq22eOX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3/tuSNu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3/tuSNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787208914; x=1818744914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=utSokGxt+3fSEuTpympSX9BSn+GQNZCKZa3vtKKnUUw=;
  b=A3/tuSNuxAbXHYRQISZCeclrZ+V3KUsLCO0EHARl1lCojhURokBmH4ma
   ndMO8hjqQfoDmDRyZ5SnidmiPs6weDxRzRu1LQ2/cCpBOsPoVNO9AWfxf
   U7W4z3+SqHr/qr27j4yYEJsm6Tpd7TpMHIAEUZH3rexRRxEAuVC0+agVG
   undbeJvWFl9ByO6jFKTXchnW0QJQ9Ie+L3hLMm0SDG83M2p5SDAGGYOj9
   WhkoTo8CQh7pZYhUbOPVEFEwUwTwvNVR6HpKvaMK1djnsOJCiS2SquJz8
   WPcW89CG9IYtx4OK5um/vKfvMFH7BS2X2B5jRtajp2eKBSkT4xKAcXEtw
   g==;
X-CSE-ConnectionGUID: Lib6nP+dTl+1u6QZVk4Mvg==
X-CSE-MsgGUID: mA3yoAZlTque/L5mS0Pssw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="110521103"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="110521103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:55:14 -0700
X-CSE-ConnectionGUID: phWQVRXaQeeqZMoPlqWR/g==
X-CSE-MsgGUID: lmKVdcoeSyCWDw6qJYc2gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="269379556"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Aug 2026 23:55:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwwg8-00000000i9l-3PRV;
	Thu, 20 Aug 2026 06:55:08 +0000
Date: Thu, 20 Aug 2026 14:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Kees Cook <kees@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Yiqi Sun <sunyiqixm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
Message-ID: <202608201418.4wnOzo3P-lkp@intel.com>
References: <20260714143600.23853-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714143600.23853-1-will@kernel.org>

Hi Will,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Yiqi-Sun/arm64-ptrace-use-live-x0-for-seccomp-and-audit-after-ptrace/20260815-210721]

url:    https://github.com/intel-lab-lkp/linux/commits/Will-Deacon/arm64-syscall-Ensure-saved-x0-is-kept-in-sync-with-tracer-updates/20260815-220235
base:   https://github.com/intel-lab-lkp/linux Yiqi-Sun/arm64-ptrace-use-live-x0-for-seccomp-and-audit-after-ptrace/20260815-210721
patch link:    https://lore.kernel.org/r/20260714143600.23853-1-will%40kernel.org
patch subject: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
config: arm64-randconfig-001-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201418.4wnOzo3P-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201418.4wnOzo3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201418.4wnOzo3P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/ptrace.c:2461:13: error: conflicting types for 'update_syscall_orig_x0_after_ptrace'
    2461 | static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
         |             ^
   arch/arm64/kernel/ptrace.c:563:13: note: previous definition is here
     563 | static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
         |             ^
>> arch/arm64/kernel/ptrace.c:2490:39: error: incompatible pointer types passing 'struct pt_regs *' to parameter of type 'struct task_struct *' [-Wincompatible-pointer-types]
    2490 |                 update_syscall_orig_x0_after_ptrace(regs);
         |                                                     ^~~~
   arch/arm64/kernel/ptrace.c:563:69: note: passing argument to parameter 'target' here
     563 | static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
         |                                                                     ^
   arch/arm64/kernel/ptrace.c:2498:38: error: incompatible pointer types passing 'struct pt_regs *' to parameter of type 'struct task_struct *' [-Wincompatible-pointer-types]
    2498 |         update_syscall_orig_x0_after_ptrace(regs);
         |                                             ^~~~
   arch/arm64/kernel/ptrace.c:563:69: note: passing argument to parameter 'target' here
     563 | static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
         |                                                                     ^
   3 errors generated.


vim +/update_syscall_orig_x0_after_ptrace +2461 arch/arm64/kernel/ptrace.c

  2460	
> 2461	static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
  2462	{
  2463		/*
  2464		 * Keep orig_x0 authoritative so that seccomp (via
  2465		 * syscall_get_arguments()), audit and the restart path all see the same
  2466		 * first argument the syscall is dispatched with, even if it has been
  2467		 * updated by a tracer. Skip this for NO_SYSCALL (set either by the user
  2468		 * or the tracer), as regs[0] holds the return value (see the comment in
  2469		 * el0_svc_common()) and can be unwound using syscall_rollback().
  2470		 * For compat tasks, orig_r0 is provided directly through GPR index 17.
  2471		 */
  2472		if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
  2473			regs->orig_x0 = regs->regs[0];
  2474	}
  2475	
  2476	int syscall_trace_enter(struct pt_regs *regs)
  2477	{
  2478		unsigned long flags = read_thread_flags();
  2479		int ret;
  2480	
  2481		if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
  2482			ret = report_syscall_entry(regs);
  2483			if (ret || (flags & _TIF_SYSCALL_EMU))
  2484				return NO_SYSCALL;
  2485	
  2486			/*
  2487			 * Ensure ptrace changes to x0 are visible to seccomp
  2488			 * ptrace exits (SECCOMP_RET_TRACE).
  2489			 */
> 2490			update_syscall_orig_x0_after_ptrace(regs);
  2491		}
  2492	
  2493		/* Do the secure computing after ptrace; failures should be fast. */
  2494		if (secure_computing() == -1)
  2495			return NO_SYSCALL;
  2496	
  2497		/* Ensure seccomp updates to x0 are visible to audit. */
  2498		update_syscall_orig_x0_after_ptrace(regs);
  2499	
  2500		if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
  2501			trace_sys_enter(regs, regs->syscallno);
  2502	
  2503		audit_syscall_entry(regs->syscallno, regs->regs[0], regs->regs[1],
  2504				    regs->regs[2], regs->regs[3]);
  2505	
  2506		return regs->syscallno;
  2507	}
  2508	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
