Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D62151989;
	Sat,  8 Feb 2025 16:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739031326; cv=none; b=TMjlrscVQVRjmB7/ysPCJmELXLBUWXlrQRCH1+/DnIGQrkuMzQ5SPbz0I+IUxqJRlM6WA/tcCQCwRbCxsSTJSTLYjDJOxT2UKThPFdQpX3MlGC9DimP6jolFqS5PyyLK3zaCRdR2Gd8Z2oF53BvpTztan/Z2ZrpwvX9noAKL/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739031326; c=relaxed/simple;
	bh=7Uz7dBZkJW5ycnmXhxqW5caV251mue0syTFpXjHSDAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LmNpZZmkR8KwgTGJDLo/dhlVoIW61PB75OsWA8okNBWvFytQ23zeNGCKFYvmdOOl0t3FGwt4vNBAVRFBNAvPjx5TbQHLQRh716k+QKhI7Clqg6f3UmErXtz9dAnD/rPlEqDmOw0J3zm6T9qdUrCLaouCjihKH/+iTHjtrussd5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hm5rsgsw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hm5rsgsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739031325; x=1770567325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Uz7dBZkJW5ycnmXhxqW5caV251mue0syTFpXjHSDAw=;
  b=Hm5rsgswplrJRDWqsI19Lff/0VODxZ+Ib1NUsBhPRcyVNZ56Me280x5n
   8SYzZJ+44bSNoOJRIROQaFF5Ec1mopp42XApM6QgZcpk5pOow3AOcePGK
   wf0009bi33E72qlzJL5zkroMh5T9SFDLxd47BxVkQYG1w7DL68l+8ha9j
   HFdS3K8wdHH+duTaGkBbBzng0b0UiQVNhTJZOBX3gctVA6mfRNpCh7zpD
   7zOj9tP2ERkJD5ZbnPlytsH/8iPecNnQHxfuGF9qSaGlY61LcseMK5w1U
   eTlDyX/optJuyd0LndwVmUhv5B/q3nA7EcZ7vMV46ArQhLnn4woi2/chY
   g==;
X-CSE-ConnectionGUID: M0K97BtLRBOK5+JHuG+Keg==
X-CSE-MsgGUID: cXIWm0EiSWmhSSxLSI9NTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="27266050"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="27266050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:15:24 -0800
X-CSE-ConnectionGUID: ED9Hr5SaQdepIdN1K8MxKQ==
X-CSE-MsgGUID: unEMyzNuQkuf4ME4mzvRsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="116805240"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Feb 2025 08:15:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgnUF-0010J5-22;
	Sat, 08 Feb 2025 16:15:19 +0000
Date: Sun, 9 Feb 2025 00:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 38/38] arch/x86/kernel/smpboot.c:281:2:
 error: call to undeclared function 'paravirt_sched_clock_start_secondary';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202502090005.YlbsWQ8o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   4234e8b9df9e1902968f836d9306c026adf43347
commit: 4234e8b9df9e1902968f836d9306c026adf43347 [38/38] x86/paravirt: kvmclock: Setup kvmclock early iff it's sched_clock
config: i386-buildonly-randconfig-004-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090005.YlbsWQ8o-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090005.YlbsWQ8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090005.YlbsWQ8o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/smpboot.c:281:2: error: call to undeclared function 'paravirt_sched_clock_start_secondary'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     281 |         paravirt_sched_clock_start_secondary();
         |         ^
   1 error generated.


vim +/paravirt_sched_clock_start_secondary +281 arch/x86/kernel/smpboot.c

   228	
   229	/*
   230	 * Activate a secondary processor.
   231	 */
   232	static void notrace start_secondary(void *unused)
   233	{
   234		/*
   235		 * Don't put *anything* except direct CPU state initialization
   236		 * before cpu_init(), SMP booting is too fragile that we want to
   237		 * limit the things done here to the most necessary things.
   238		 */
   239		cr4_init();
   240	
   241		/*
   242		 * 32-bit specific. 64-bit reaches this code with the correct page
   243		 * table established. Yet another historical divergence.
   244		 */
   245		if (IS_ENABLED(CONFIG_X86_32)) {
   246			/* switch away from the initial page table */
   247			load_cr3(swapper_pg_dir);
   248			__flush_tlb_all();
   249		}
   250	
   251		cpu_init_exception_handling(false);
   252	
   253		/*
   254		 * Load the microcode before reaching the AP alive synchronization
   255		 * point below so it is not part of the full per CPU serialized
   256		 * bringup part when "parallel" bringup is enabled.
   257		 *
   258		 * That's even safe when hyperthreading is enabled in the CPU as
   259		 * the core code starts the primary threads first and leaves the
   260		 * secondary threads waiting for SIPI. Loading microcode on
   261		 * physical cores concurrently is a safe operation.
   262		 *
   263		 * This covers both the Intel specific issue that concurrent
   264		 * microcode loading on SMT siblings must be prohibited and the
   265		 * vendor independent issue`that microcode loading which changes
   266		 * CPUID, MSRs etc. must be strictly serialized to maintain
   267		 * software state correctness.
   268		 */
   269		load_ucode_ap();
   270	
   271		/*
   272		 * Synchronization point with the hotplug core. Sets this CPUs
   273		 * synchronization state to ALIVE and spin-waits for the control CPU to
   274		 * release this CPU for further bringup.
   275		 */
   276		cpuhp_ap_sync_alive();
   277	
   278		cpu_init();
   279		fpu__init_cpu();
   280		rcutree_report_cpu_starting(raw_smp_processor_id());
 > 281		paravirt_sched_clock_start_secondary();
   282	
   283		ap_starting();
   284	
   285		/* Check TSC synchronization with the control CPU. */
   286		check_tsc_sync_target();
   287	
   288		/*
   289		 * Calibrate the delay loop after the TSC synchronization check.
   290		 * This allows to skip the calibration when TSC is synchronized
   291		 * across sockets.
   292		 */
   293		ap_calibrate_delay();
   294	
   295		speculative_store_bypass_ht_init();
   296	
   297		/*
   298		 * Lock vector_lock, set CPU online and bring the vector
   299		 * allocator online. Online must be set with vector_lock held
   300		 * to prevent a concurrent irq setup/teardown from seeing a
   301		 * half valid vector space.
   302		 */
   303		lock_vector_lock();
   304		set_cpu_online(smp_processor_id(), true);
   305		lapic_online();
   306		unlock_vector_lock();
   307		x86_platform.nmi_init();
   308	
   309		/* enable local interrupts */
   310		local_irq_enable();
   311	
   312		x86_cpuinit.setup_percpu_clockev();
   313	
   314		wmb();
   315		cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
   316	}
   317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
