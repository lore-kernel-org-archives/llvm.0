Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9C88F60;
	Sat, 25 Nov 2023 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fr2/+oZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700898229; x=1732434229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yt9bbEYTnowa33Q1DzxBnJOXuyoDRd4nGLcJUFg9Pk8=;
  b=Fr2/+oZ4jrA2P/U5xbq/o8dXA3KAkoSfceHeFLceU7gH6jj/wEbY4OWl
   UijtOhUr2uM8434wlrng5QwoiMZEOGMuugmJ3kNsxiohASbqm4GDyRYgH
   NopcyrCNX2RYYsdHB88Rr4RCQ7L1Bi+mnO39QnxaJpMU46HgokF/CS/UZ
   6VC/IvZg2YrgVpsyInltInpR7PhGrxumWq/tmbDZ7WyUEasAvo1JHMDtr
   kvkRFuBC2llsWsysCH2tzsRfKr4qZ2/nCBgC7fO9n68loeL4WOVQ0OMaU
   QI9628MyIuKVAY4JKsp8F5XWDW1pJF8PJCxjo1Mc8AMaRoqityyjQMPtW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392266114"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="392266114"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911623526"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="911623526"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 23:43:40 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6nKE-0003kE-1q;
	Sat, 25 Nov 2023 07:43:38 +0000
Date: Sat, 25 Nov 2023 15:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 7/10] arch/x86/kernel/smpboot.c:338:5: error:
 expected string literal in 'asm'
Message-ID: <202311251405.w5BcBApc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   9ba52bc66d03d8fa986fb5a6d5a026702eb90747
commit: 3957c7e9f1b4bc3d2062c09d19f16e9bf8451bbc [7/10] x86/boot: Mark start_secondary() with __noendbr
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311251405.w5BcBApc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251405.w5BcBApc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251405.w5BcBApc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/smpboot.c:338:5: error: expected string literal in 'asm'
   asm(__ANNOTATE_NOENDBR(start_secondary));
       ^
   1 error generated.


vim +/asm +338 arch/x86/kernel/smpboot.c

   249	
   250	/*
   251	 * Activate a secondary processor.
   252	 */
   253	static void notrace __noendbr start_secondary(void *unused)
   254	{
   255		/*
   256		 * Don't put *anything* except direct CPU state initialization
   257		 * before cpu_init(), SMP booting is too fragile that we want to
   258		 * limit the things done here to the most necessary things.
   259		 */
   260		cr4_init();
   261	
   262		/*
   263		 * 32-bit specific. 64-bit reaches this code with the correct page
   264		 * table established. Yet another historical divergence.
   265		 */
   266		if (IS_ENABLED(CONFIG_X86_32)) {
   267			/* switch away from the initial page table */
   268			load_cr3(swapper_pg_dir);
   269			__flush_tlb_all();
   270		}
   271	
   272		cpu_init_exception_handling();
   273	
   274		/*
   275		 * Load the microcode before reaching the AP alive synchronization
   276		 * point below so it is not part of the full per CPU serialized
   277		 * bringup part when "parallel" bringup is enabled.
   278		 *
   279		 * That's even safe when hyperthreading is enabled in the CPU as
   280		 * the core code starts the primary threads first and leaves the
   281		 * secondary threads waiting for SIPI. Loading microcode on
   282		 * physical cores concurrently is a safe operation.
   283		 *
   284		 * This covers both the Intel specific issue that concurrent
   285		 * microcode loading on SMT siblings must be prohibited and the
   286		 * vendor independent issue`that microcode loading which changes
   287		 * CPUID, MSRs etc. must be strictly serialized to maintain
   288		 * software state correctness.
   289		 */
   290		load_ucode_ap();
   291	
   292		/*
   293		 * Synchronization point with the hotplug core. Sets this CPUs
   294		 * synchronization state to ALIVE and spin-waits for the control CPU to
   295		 * release this CPU for further bringup.
   296		 */
   297		cpuhp_ap_sync_alive();
   298	
   299		cpu_init();
   300		fpu__init_cpu();
   301		rcutree_report_cpu_starting(raw_smp_processor_id());
   302		x86_cpuinit.early_percpu_clock_init();
   303	
   304		ap_starting();
   305	
   306		/* Check TSC synchronization with the control CPU. */
   307		check_tsc_sync_target();
   308	
   309		/*
   310		 * Calibrate the delay loop after the TSC synchronization check.
   311		 * This allows to skip the calibration when TSC is synchronized
   312		 * across sockets.
   313		 */
   314		ap_calibrate_delay();
   315	
   316		speculative_store_bypass_ht_init();
   317	
   318		/*
   319		 * Lock vector_lock, set CPU online and bring the vector
   320		 * allocator online. Online must be set with vector_lock held
   321		 * to prevent a concurrent irq setup/teardown from seeing a
   322		 * half valid vector space.
   323		 */
   324		lock_vector_lock();
   325		set_cpu_online(smp_processor_id(), true);
   326		lapic_online();
   327		unlock_vector_lock();
   328		x86_platform.nmi_init();
   329	
   330		/* enable local interrupts */
   331		local_irq_enable();
   332	
   333		x86_cpuinit.setup_percpu_clockev();
   334	
   335		wmb();
   336		cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
   337	}
 > 338	asm(__ANNOTATE_NOENDBR(start_secondary));
   339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
