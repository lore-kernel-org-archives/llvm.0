Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E152D301000;
	Tue, 30 Dec 2025 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085198; cv=none; b=oMJzVTrZmHccjgKQ4n8aDpizKvODNdL1BExmj2kdoyMNMH3kzX8Ut3YUCt8oy2It6lORFdaRNCcszgxx8iYynzqtuC3rxSakrcwr0/dW5ipooE5PH64YcxnKaG6AtEHjhfRNegOtQTaSy7nIaPuJiqgEbH7Kpg8AXbp3yxWmHIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085198; c=relaxed/simple;
	bh=vMAX2H19ZJ3r1QTStGN5av3Vfzb+aG9bvsZ3lbvCwgQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jTysgWhmWMROF+Jlji6W9DPEK8UFLYDSEX9WwjrTn8VLiIxQtfLtZXW+9gdY2m2I95GLWy9HepXAC57LTg+T19Bej60jI+jHAytk2XJ70cQgMMMWzXejEEfn3/EEkW9Yau5SDEX3IMRO0EEtDI3xDfMyXs+dTkfZnvnKu/Mrbng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUw7DO0u; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUw7DO0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767085196; x=1798621196;
  h=date:from:to:cc:subject:message-id;
  bh=vMAX2H19ZJ3r1QTStGN5av3Vfzb+aG9bvsZ3lbvCwgQ=;
  b=VUw7DO0u3zLLIZIdW/hgR86UZRoSyIhT96tZABZQsTWsmaHI4nltSFz0
   jX6TkwgesOL3wN9YDI3SzYiF/gHu1nV/k/PaPQK981bjPOH22m7ah968J
   Vmjn5iV+pD+xPbY/DSa6irEHKafxW/TwF/XLCpsahPkRZdqSlyxWWnFQv
   DnPSl85qtyahoCePN0ODxPB7jFxyTycn2+WEqrl+W103SW9hxQwoSCnjZ
   thBNcKI75bMuHAwXlx4YhnhDFwSnIDZXyUrGuaFik56Lyi0RDgn9rKVpc
   fTidVlvzdR/QgSJtcoXEoBBOJEjOrr+QjJliQH9DA/yz0bp/dLGNG5nKp
   Q==;
X-CSE-ConnectionGUID: hVEWhS9cT0GIdmP2PAQsyQ==
X-CSE-MsgGUID: /qc3axUnQDSvhqTdUx2WUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79795842"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79795842"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 00:59:53 -0800
X-CSE-ConnectionGUID: Wt7+fjDxStm7I1BbfMBtWA==
X-CSE-MsgGUID: bZZ3Jnu7Q0Oc3X2s7NptsQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Dec 2025 00:59:49 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaVZz-000000000G3-0IOR;
	Tue, 30 Dec 2025 08:59:47 +0000
Date: Tue, 30 Dec 2025 16:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Rathor <mrathor@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>
Subject: arch/x86/hyperv/hv_crash.c:282:6: warning: variable 'status'
 set but not used
Message-ID: <202512301641.FC6OAbGM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Mukesh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8640b74557fc8b4c300030f6ccb8cd078f665ec8
commit: 77c860d2dbb72d1f3c6a2e882a07d19eca399db5 x86/hyperv: Enable build of hypervisor crashdump collection files
date:   6 weeks ago
config: x86_64-randconfig-014-20251230 (https://download.01.org/0day-ci/archive/20251230/202512301641.FC6OAbGM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512301641.FC6OAbGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512301641.FC6OAbGM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/hyperv/hv_crash.c:282:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     282 |         u64 status;
         |             ^
   arch/x86/hyperv/hv_crash.c:631:2: error: must use 'struct' tag to refer to type 'smp_ops'
     631 |         smp_ops.crash_stop_other_cpus = hv_crash_stop_other_cpus;
         |         ^
         |         struct 
   arch/x86/hyperv/hv_crash.c:631:9: error: expected identifier or '('
     631 |         smp_ops.crash_stop_other_cpus = hv_crash_stop_other_cpus;
         |                ^
   1 warning and 2 errors generated.


vim +/status +282 arch/x86/hyperv/hv_crash.c

94212d34618c26 Mukesh Rathor 2025-10-06  258  
94212d34618c26 Mukesh Rathor 2025-10-06  259  /*
94212d34618c26 Mukesh Rathor 2025-10-06  260   * Common function for all cpus before devirtualization.
94212d34618c26 Mukesh Rathor 2025-10-06  261   *
94212d34618c26 Mukesh Rathor 2025-10-06  262   * Hypervisor crash: all cpus get here in NMI context.
94212d34618c26 Mukesh Rathor 2025-10-06  263   * Linux crash: the panicing cpu gets here at base level, all others in NMI
94212d34618c26 Mukesh Rathor 2025-10-06  264   *		context. Note, panicing cpu may not be the BSP.
94212d34618c26 Mukesh Rathor 2025-10-06  265   *
94212d34618c26 Mukesh Rathor 2025-10-06  266   * The function is not inlined so it will show on the stack. It is named so
94212d34618c26 Mukesh Rathor 2025-10-06  267   * because the crash cmd looks for certain well known function names on the
94212d34618c26 Mukesh Rathor 2025-10-06  268   * stack before looking into the cpu saved note in the elf section, and
94212d34618c26 Mukesh Rathor 2025-10-06  269   * that work is currently incomplete.
94212d34618c26 Mukesh Rathor 2025-10-06  270   *
94212d34618c26 Mukesh Rathor 2025-10-06  271   * Notes:
94212d34618c26 Mukesh Rathor 2025-10-06  272   *  Hypervisor crash:
94212d34618c26 Mukesh Rathor 2025-10-06  273   *    - the hypervisor is in a very restrictive mode at this point and any
94212d34618c26 Mukesh Rathor 2025-10-06  274   *	vmexit it cannot handle would result in reboot. So, no mumbo jumbo,
94212d34618c26 Mukesh Rathor 2025-10-06  275   *	just get to kexec as quickly as possible.
94212d34618c26 Mukesh Rathor 2025-10-06  276   *
94212d34618c26 Mukesh Rathor 2025-10-06  277   *  Devirtualization is supported from the BSP only at present.
94212d34618c26 Mukesh Rathor 2025-10-06  278   */
94212d34618c26 Mukesh Rathor 2025-10-06  279  static noinline __noclone void crash_nmi_callback(struct pt_regs *regs)
94212d34618c26 Mukesh Rathor 2025-10-06  280  {
94212d34618c26 Mukesh Rathor 2025-10-06  281  	struct hv_input_disable_hyp_ex *input;
94212d34618c26 Mukesh Rathor 2025-10-06 @282  	u64 status;
94212d34618c26 Mukesh Rathor 2025-10-06  283  	int msecs = 1000, ccpu = smp_processor_id();
94212d34618c26 Mukesh Rathor 2025-10-06  284  
94212d34618c26 Mukesh Rathor 2025-10-06  285  	if (ccpu == 0) {
94212d34618c26 Mukesh Rathor 2025-10-06  286  		/* crash_save_cpu() will be done in the kexec path */
94212d34618c26 Mukesh Rathor 2025-10-06  287  		cpu_emergency_stop_pt();	/* disable performance trace */
94212d34618c26 Mukesh Rathor 2025-10-06  288  		atomic_inc(&crash_cpus_wait);
94212d34618c26 Mukesh Rathor 2025-10-06  289  	} else {
94212d34618c26 Mukesh Rathor 2025-10-06  290  		crash_save_cpu(regs, ccpu);
94212d34618c26 Mukesh Rathor 2025-10-06  291  		cpu_emergency_stop_pt();	/* disable performance trace */
94212d34618c26 Mukesh Rathor 2025-10-06  292  		atomic_inc(&crash_cpus_wait);
94212d34618c26 Mukesh Rathor 2025-10-06  293  		for (;;)
94212d34618c26 Mukesh Rathor 2025-10-06  294  			cpu_relax();
94212d34618c26 Mukesh Rathor 2025-10-06  295  	}
94212d34618c26 Mukesh Rathor 2025-10-06  296  
94212d34618c26 Mukesh Rathor 2025-10-06  297  	while (atomic_read(&crash_cpus_wait) < num_online_cpus() && msecs--)
94212d34618c26 Mukesh Rathor 2025-10-06  298  		mdelay(1);
94212d34618c26 Mukesh Rathor 2025-10-06  299  
94212d34618c26 Mukesh Rathor 2025-10-06  300  	stop_nmi();
94212d34618c26 Mukesh Rathor 2025-10-06  301  	if (!hv_has_crashed)
94212d34618c26 Mukesh Rathor 2025-10-06  302  		hv_notify_prepare_hyp();
94212d34618c26 Mukesh Rathor 2025-10-06  303  
94212d34618c26 Mukesh Rathor 2025-10-06  304  	if (crashing_cpu == -1)
94212d34618c26 Mukesh Rathor 2025-10-06  305  		crashing_cpu = ccpu;		/* crash cmd uses this */
94212d34618c26 Mukesh Rathor 2025-10-06  306  
94212d34618c26 Mukesh Rathor 2025-10-06  307  	hv_hvcrash_ctxt_save();
94212d34618c26 Mukesh Rathor 2025-10-06  308  	hv_mark_tss_not_busy();
94212d34618c26 Mukesh Rathor 2025-10-06  309  	hv_crash_fixup_kernpt();
94212d34618c26 Mukesh Rathor 2025-10-06  310  
94212d34618c26 Mukesh Rathor 2025-10-06  311  	input = *this_cpu_ptr(hyperv_pcpu_input_arg);
94212d34618c26 Mukesh Rathor 2025-10-06  312  	memset(input, 0, sizeof(*input));
94212d34618c26 Mukesh Rathor 2025-10-06  313  	input->rip = trampoline_pa;
94212d34618c26 Mukesh Rathor 2025-10-06  314  	input->arg = devirt_arg;
94212d34618c26 Mukesh Rathor 2025-10-06  315  
94212d34618c26 Mukesh Rathor 2025-10-06  316  	status = hv_do_hypercall(HVCALL_DISABLE_HYP_EX, input, NULL);
94212d34618c26 Mukesh Rathor 2025-10-06  317  
94212d34618c26 Mukesh Rathor 2025-10-06  318  	hv_panic_timeout_reboot();
94212d34618c26 Mukesh Rathor 2025-10-06  319  }
94212d34618c26 Mukesh Rathor 2025-10-06  320  

:::::: The code at line 282 was first introduced by commit
:::::: 94212d34618c2608758128da32ddac2ad834cb9f x86/hyperv: Implement hypervisor RAM collection into vmcore

:::::: TO: Mukesh Rathor <mrathor@linux.microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
