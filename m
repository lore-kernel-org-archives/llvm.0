Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1AB2417FB;
	Tue, 11 Nov 2025 23:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762905461; cv=none; b=EzJ62Xdi3s8cvEtjR5HIguBBFceTFhoK5erGhR4Q3HKAcmQsODv2pS+rFpm+kPGggZbFFms9b45OdRJHBWBtNBqmJXcGfLSCdNPs0gEIK6hLph18Da4HSchdl6phY2iUF/7a03jycwnn8NblMOutYM42AtudvAYzNu1zTH5wSy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762905461; c=relaxed/simple;
	bh=5z9tA7K/0d1txT/8PMIAmAecl9pQd/ZityN8iLjARrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A0kvJq3p/X3S4XO0dl2w0HQLsvLxh+kC4zGqLPSmXFK/ULjlSe9/pp5r9T2H934RH/H331dZMSXqVve+mo85K6lz8us5FN8oqrXVG36nzNwMAFuXvIYudbtRAVOdPM4Qc/oFpULzzC1CaR8AXE6MXVs7mKSq24/jTQEVPnPD/Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8y+Hwxb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8y+Hwxb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762905459; x=1794441459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5z9tA7K/0d1txT/8PMIAmAecl9pQd/ZityN8iLjARrg=;
  b=P8y+HwxbboOJ8bcKvvndAq9Z1Z5hRba8NGRs/WkQVuH/MnJuRkQOOUG9
   RvaIKnsI9HXa0Dz859lTwlcxfCsMIj+vbL/39QJs7ZlQFn7zs5e0atrzX
   56d6exJdkho4PN3JtbDP1UXBknUvlKd5jk6lhzBjZVDVRvRF8+F2O8h6v
   7pM6qOgbL3D0j0ahDPmJk12l7bkWXLaJdgrj/Pu4p1Ka08DKAXW75Xac7
   WNLCtqK4ERB3y9GMDiY98F0WMp6oCm/BEPj9EVs+W2HtjEuBWexF/XMq2
   iKxXEbu9TGa1qrARpDnITmH3zp9MoN0TThp6zbqV8J5cvdRGqN9IhOK2B
   Q==;
X-CSE-ConnectionGUID: HYWcZyNoQvmw+6FfrHukMw==
X-CSE-MsgGUID: 7+/gXMGORySZeHhdWOvgLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68829584"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="68829584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 15:57:39 -0800
X-CSE-ConnectionGUID: ++WSC1zOSGGK4pZZ0PcZxQ==
X-CSE-MsgGUID: IuFzUWg1R4qe2bauQL42KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="189041904"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Nov 2025 15:57:37 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIyEw-0003gJ-2s;
	Tue, 11 Nov 2025 23:57:34 +0000
Date: Wed, 12 Nov 2025 07:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrea Righi <arighi@nvidia.com>
Subject: [tj-sched-ext:scx-bypass-scalability-v2 33/37]
 kernel/watchdog.c:206:7: error: call to undeclared function
 'scx_hardlockup'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202511120732.yXirARWn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-bypass-scalability-v2
head:   27ab0bfd9e10121f25b6dd1b5500c7b627c5d215
commit: 2b9c2213630da8f6f2a256005f9ce9070e39847f [33/37] sched_ext: Hook up hardlockup detector
config: i386-randconfig-013-20251112 (https://download.01.org/0day-ci/archive/20251112/202511120732.yXirARWn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120732.yXirARWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120732.yXirARWn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/watchdog.c:206:7: error: call to undeclared function 'scx_hardlockup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     206 |                 if (scx_hardlockup())
         |                     ^
   kernel/watchdog.c:206:7: note: did you mean 'is_hardlockup'?
   kernel/watchdog.c:154:13: note: 'is_hardlockup' declared here
     154 | static bool is_hardlockup(unsigned int cpu)
         |             ^
   1 error generated.


vim +/scx_hardlockup +206 kernel/watchdog.c

   178	
   179	void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
   180	{
   181		if (per_cpu(watchdog_hardlockup_touched, cpu)) {
   182			per_cpu(watchdog_hardlockup_touched, cpu) = false;
   183			return;
   184		}
   185	
   186		/*
   187		 * Check for a hardlockup by making sure the CPU's timer
   188		 * interrupt is incrementing. The timer interrupt should have
   189		 * fired multiple times before we overflow'd. If it hasn't
   190		 * then this is a good indication the cpu is stuck
   191		 */
   192		if (is_hardlockup(cpu)) {
   193			unsigned int this_cpu = smp_processor_id();
   194			unsigned long flags;
   195	
   196	#ifdef CONFIG_SYSFS
   197			++hardlockup_count;
   198	#endif
   199			/*
   200			 * A poorly behaving BPF scheduler can trigger hard lockup by
   201			 * e.g. putting numerous affinitized tasks in a single queue and
   202			 * directing all CPUs at it. The following call can return true
   203			 * only once when sched_ext is enabled and will immediately
   204			 * abort the BPF scheduler and print out a warning message.
   205			 */
 > 206			if (scx_hardlockup())
   207				return;
   208	
   209			/* Only print hardlockups once. */
   210			if (per_cpu(watchdog_hardlockup_warned, cpu))
   211				return;
   212	
   213			/*
   214			 * Prevent multiple hard-lockup reports if one cpu is already
   215			 * engaged in dumping all cpu back traces.
   216			 */
   217			if (sysctl_hardlockup_all_cpu_backtrace) {
   218				if (test_and_set_bit_lock(0, &hard_lockup_nmi_warn))
   219					return;
   220			}
   221	
   222			/*
   223			 * NOTE: we call printk_cpu_sync_get_irqsave() after printing
   224			 * the lockup message. While it would be nice to serialize
   225			 * that printout, we really want to make sure that if some
   226			 * other CPU somehow locked up while holding the lock associated
   227			 * with printk_cpu_sync_get_irqsave() that we can still at least
   228			 * get the message about the lockup out.
   229			 */
   230			pr_emerg("CPU%u: Watchdog detected hard LOCKUP on cpu %u\n", this_cpu, cpu);
   231			printk_cpu_sync_get_irqsave(flags);
   232	
   233			print_modules();
   234			print_irqtrace_events(current);
   235			if (cpu == this_cpu) {
   236				if (regs)
   237					show_regs(regs);
   238				else
   239					dump_stack();
   240				printk_cpu_sync_put_irqrestore(flags);
   241			} else {
   242				printk_cpu_sync_put_irqrestore(flags);
   243				trigger_single_cpu_backtrace(cpu);
   244			}
   245	
   246			if (sysctl_hardlockup_all_cpu_backtrace) {
   247				trigger_allbutcpu_cpu_backtrace(cpu);
   248				if (!hardlockup_panic)
   249					clear_bit_unlock(0, &hard_lockup_nmi_warn);
   250			}
   251	
   252			if (hardlockup_panic)
   253				nmi_panic(regs, "Hard LOCKUP");
   254	
   255			per_cpu(watchdog_hardlockup_warned, cpu) = true;
   256		} else {
   257			per_cpu(watchdog_hardlockup_warned, cpu) = false;
   258		}
   259	}
   260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
