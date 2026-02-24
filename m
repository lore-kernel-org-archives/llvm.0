Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6D824E4AF;
	Tue, 24 Feb 2026 12:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936374; cv=none; b=KXXSPke3TPVAiYY852GfK7qYGgVLqVkay62I5KMVTZH4MQ3xIi93hjunv1lQjGBTf0xdJqNKByGCmm06P3skN1w+h3HWzPq7mcq9lbmSWphcRASrwDWkCR1yPPo/PZKQM+vdqZjBBPIsperDNFZDFwbK/PHvA8AAVltc3air3oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936374; c=relaxed/simple;
	bh=8/Tqe0+kwNlgOlxU5Ob5R93GhFSJjtdt+wprnMFkERw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TvLV7YAeagUxRbJYpb0hZ4irH55lyt2a3+6DXohsk5s4X2eUgfmnbEDf1ZSLEy21XfmzhSemzd+MtrRH6w8hBRiB/DrySVrg/SUf4mGbpokLhEIR7Qk4aTkUrY53yJdR9DgIOTANUz7pdedDTiTW8YTfFzypK9OGOsFcN5PBsMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muIg3vzX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muIg3vzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771936373; x=1803472373;
  h=date:from:to:cc:subject:message-id;
  bh=8/Tqe0+kwNlgOlxU5Ob5R93GhFSJjtdt+wprnMFkERw=;
  b=muIg3vzX1NVope7ThbS45jMYexkZhVaDf07ZBKzBreeUI45/JisT3v6i
   4s1CM3ohUWXuS7VFRFLagTIGEpj8KK8IxLAsbSoVsw5lxJuvkGyldkC8O
   /Prb7bW03ILJ8WYSXjDiZSmIUXZ8BduFibw04rirfEOV78ItQ3k8bdmXq
   v7y7Rs6Vpp+Ef9rg9t/nesoOocM7EPBKIbnPhIhAK57n3E4LrAU7gK7RC
   NzOsAFRQJESNkEqhY+tXO2K6mMSVcSUb4v8JRKCXyJITzu78V4xRvo724
   41eoRCgI6KVkAAQR03QsqyKYw5Mdep2pSuET2XdhGh8qXNPqyV4oGiwni
   g==;
X-CSE-ConnectionGUID: lu7svC5QTMuZ2kJtywQ2eg==
X-CSE-MsgGUID: y/3QiUhoSke4c4eWolElIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72859861"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72859861"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:32:52 -0800
X-CSE-ConnectionGUID: vDyUoE5vR0elH0iEr9F3tg==
X-CSE-MsgGUID: SWM7lA5aROGeR6ZQRgmByw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220882354"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Feb 2026 04:32:50 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vurag-000000001wQ-2DAo;
	Tue, 24 Feb 2026 12:32:40 +0000
Date: Tue, 24 Feb 2026 20:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas Gleixner <tglx@kernel.org>
Subject: [tglx-devel:sched/hrtick 35/48] kernel/entry/common.c:53:45:
 error: too many arguments to function call, expected single argument
 'work_pending', have 2 arguments
Message-ID: <202602242000.9jj69qhW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   27cd0d3a6b3db913813a2ead85957bf4dce21e04
commit: cfff40a7c0b95b3942ae221617bb5f4b09994f19 [35/48] entry: Prepare for deferred hrtimer rearming
config: arm64-randconfig-003-20260224 (https://download.01.org/0day-ci/archive/20260224/202602242000.9jj69qhW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602242000.9jj69qhW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602242000.9jj69qhW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/entry/common.c:53:45: error: too many arguments to function call, expected single argument 'work_pending', have 2 arguments
      53 |                         if (!rseq_grant_slice_extension(ti_work, TIF_SLICE_EXT_DENY))
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~          ^~~~~~~~~~~~~~~~~~
   kernel/entry/common.c:39:28: note: expanded from macro 'TIF_SLICE_EXT_DENY'
      39 | #define TIF_SLICE_EXT_DENY      (EXIT_TO_USER_MODE_WORK & ~TIF_SLICE_EXT_SCHED)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rseq_entry.h:791:20: note: 'rseq_grant_slice_extension' declared here
     791 | static inline bool rseq_grant_slice_extension(bool work_pending) { return false; }
         |                    ^                          ~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/work_pending +53 kernel/entry/common.c

    40	
    41	static __always_inline unsigned long __exit_to_user_mode_loop(struct pt_regs *regs,
    42								      unsigned long ti_work)
    43	{
    44		/*
    45		 * Before returning to user space ensure that all pending work
    46		 * items have been completed.
    47		 */
    48		while (ti_work & EXIT_TO_USER_MODE_WORK_LOOP) {
    49	
    50			local_irq_enable_exit_to_user(ti_work);
    51	
    52			if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
  > 53				if (!rseq_grant_slice_extension(ti_work, TIF_SLICE_EXT_DENY))
    54					schedule();
    55			}
    56	
    57			if (ti_work & _TIF_UPROBE)
    58				uprobe_notify_resume(regs);
    59	
    60			if (ti_work & _TIF_PATCH_PENDING)
    61				klp_update_patch_state(current);
    62	
    63			if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
    64				arch_do_signal_or_restart(regs);
    65	
    66			if (ti_work & _TIF_NOTIFY_RESUME)
    67				resume_user_mode_work(regs);
    68	
    69			/* Architecture specific TIF work */
    70			arch_exit_to_user_mode_work(regs, ti_work);
    71	
    72			/*
    73			 * Disable interrupts and reevaluate the work flags as they
    74			 * might have changed while interrupts and preemption was
    75			 * enabled above.
    76			 */
    77			local_irq_disable_exit_to_user();
    78	
    79			/* Check if any of the above work has queued a deferred wakeup */
    80			tick_nohz_user_enter_prepare();
    81	
    82			ti_work = read_thread_flags();
    83		}
    84	
    85		/* Return the latest work state for arch_exit_to_user_mode() */
    86		return ti_work;
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
