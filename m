Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B5611730;
	Fri, 29 Sep 2023 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695979560; x=1727515560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hoFtFYr8nVjfiP00lJ+CM55JUKIUy7NFIEdFCPoS/2w=;
  b=PoQcFFMJfUDjFwrG/UtfTX05zLQLK1G/rNjMEu6x4dNHLpO+uvNvYQ2g
   o+CJkjb4knB2Qh5alp9+k37r3OZWOAKmVLjtUmb36OmZa/fvwtf9fOkxL
   RhpgykktLNIepDDwdxcOkELxAqbtvR7G482zYRr0JxpSBnOP08GdO0k/x
   BB6+EQbmkvwXFSsM6HhJTIEt2krbaoU5pipIC0q0wK8OnVhG9f+vcfFNs
   4Gr4Sq0Y5CWJHhj6aZAjeXCMW2SLPcgoUp1nxDH6TMhtoJvuv+ZPrtC4W
   9UfbJA3hKltRWVQaOZPLQSHQu7TB7p/wCK9ZgnPMIWe72ZScQaPhKBNGk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386128638"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="386128638"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 02:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="743404471"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="743404471"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Sep 2023 02:25:50 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm9kp-0002hh-17;
	Fri, 29 Sep 2023 09:25:47 +0000
Date: Fri, 29 Sep 2023 17:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 26/30]
 arch/x86/kernel/cpu/microcode/core.c:389:7: error: call to undeclared
 function 'ucode_load_secondary_wait'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202309291747.IZt2BkKi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/microcode
head:   0168d5c24d9566114647bf6377e65c52c2325e3c
commit: 798516f5cbaf888e972679feab8f19653603d44a [26/30] x86/microcode: Protect against instrumentation
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230929/202309291747.IZt2BkKi-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291747.IZt2BkKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291747.IZt2BkKi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/microcode/core.c:389:7: error: call to undeclared function 'ucode_load_secondary_wait'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!ucode_load_secondary_wait(ctrl_cpu)) {
                ^
   arch/x86/kernel/cpu/microcode/core.c:389:7: note: did you mean 'ucode_load_secondary'?
   arch/x86/kernel/cpu/microcode/core.c:384:21: note: 'ucode_load_secondary' declared here
   static noinstr void ucode_load_secondary(unsigned int cpu)
                       ^
>> arch/x86/kernel/cpu/microcode/core.c:457:3: error: call to undeclared function 'load_secondary'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   load_secondary(cpu);
                   ^
   arch/x86/kernel/cpu/microcode/core.c:521:26: error: use of undeclared identifier 'load_cpus_stopped'
           stop_machine_cpuslocked(load_cpus_stopped, NULL, cpu_online_mask);
                                   ^
   3 errors generated.


vim +/ucode_load_secondary_wait +389 arch/x86/kernel/cpu/microcode/core.c

   379	
   380	/*
   381	 * Protected against instrumentation up to the point where the primary
   382	 * thread completed the update. See microcode_nmi_handler() for details.
   383	 */
   384	static noinstr void ucode_load_secondary(unsigned int cpu)
   385	{
   386		unsigned int ctrl_cpu = raw_cpu_read(ucode_ctrl.ctrl_cpu);
   387		enum ucode_state ret;
   388	
 > 389		if (!ucode_load_secondary_wait(ctrl_cpu)) {
   390			instrumentation_begin();
   391			pr_err_once("Microcode load: %d CPUs timed out\n",
   392				    atomic_read(&late_cpus_in) - 1);
   393			instrumentation_end();
   394			return;
   395		}
   396	
   397		/* Primary thread completed. Allow to invoke instrumentable code */
   398		instrumentation_begin();
   399		/*
   400		 * If the primary succeeded then invoke the apply() callback,
   401		 * otherwise copy the state from the primary thread.
   402		 */
   403		if (this_cpu_read(ucode_ctrl.ctrl) == SCTRL_APPLY)
   404			ret = microcode_ops->apply_microcode(cpu);
   405		else
   406			ret = per_cpu(ucode_ctrl.result, ctrl_cpu);
   407	
   408		this_cpu_write(ucode_ctrl.result, ret);
   409		this_cpu_write(ucode_ctrl.ctrl, SCTRL_DONE);
   410		instrumentation_end();
   411	}
   412	
   413	static void load_primary(unsigned int cpu)
   414	{
   415		struct cpumask *secondaries = topology_sibling_cpumask(cpu);
   416		enum sibling_ctrl ctrl;
   417		enum ucode_state ret;
   418		unsigned int sibling;
   419	
   420		/* Initial rendezvouz to ensure that all CPUs have arrived */
   421		if (!wait_for_cpus(&late_cpus_in)) {
   422			this_cpu_write(ucode_ctrl.result, UCODE_TIMEOUT);
   423			pr_err_once("load: %d CPUs timed out\n", atomic_read(&late_cpus_in) - 1);
   424			return;
   425		}
   426	
   427		ret = microcode_ops->apply_microcode(cpu);
   428		this_cpu_write(ucode_ctrl.result, ret);
   429		this_cpu_write(ucode_ctrl.ctrl, SCTRL_DONE);
   430	
   431		/*
   432		 * If the update was successful, let the siblings run the apply()
   433		 * callback. If not, tell them it's done. This also covers the
   434		 * case where the CPU has uniform loading at package or system
   435		 * scope implemented but does not advertise it.
   436		 */
   437		if (ret == UCODE_UPDATED || ret == UCODE_OK)
   438			ctrl = SCTRL_APPLY;
   439		else
   440			ctrl = SCTRL_DONE;
   441	
   442		for_each_cpu(sibling, secondaries) {
   443			if (sibling != cpu)
   444				per_cpu(ucode_ctrl.ctrl, sibling) = ctrl;
   445		}
   446	}
   447	
   448	static noinstr bool microcode_update_handler(void)
   449	{
   450		unsigned int cpu = raw_smp_processor_id();
   451	
   452		if (raw_cpu_read(ucode_ctrl.ctrl_cpu) == cpu) {
   453			instrumentation_begin();
   454			load_primary(cpu);
   455			instrumentation_end();
   456		} else {
 > 457			load_secondary(cpu);
   458		}
   459	
   460		instrumentation_begin();
   461		touch_nmi_watchdog();
   462		instrumentation_end();
   463		return true;
   464	}
   465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
