Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737F51864;
	Fri, 29 Sep 2023 12:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695989107; x=1727525107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=42GyzSR8W+aADKwaSxy3QS1f4ulSkvdTJ9ModGlGfZU=;
  b=UsSSntCgX/D22i4tJpcy8vEqgL+n+KjEqFhfJtrRK2SKUmqmmXqriyDG
   yYvl7slXfDTBuYfsH4Zzn3Nsu61FCP/nwlvaaT9Wlp0fV/fnvjAq/X2M5
   x+vm3RCf1O945x4nHmgMwb9+cbxVTwIbrWyCZLBSBEJSdSf1ZnyfHsqmU
   5TIZh8zeT1Ck+W670tng+SSMu5GDdEN1Q2BeSd+narpBkbCiPPW40tho2
   e1M0bgiDi2Ex7ySem6ONmjmsr/akf+EkLw8dnXHKRO+q9y+VwqS448O2F
   qMy6MlWqZypzNKOJxFoDJ4b8pei5Y7EGKKPBGjMULgCtnA1U8IbEjSjip
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="385099103"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="385099103"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 05:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="820192782"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="820192782"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Sep 2023 05:05:05 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmCEx-0002pz-0g;
	Fri, 29 Sep 2023 12:05:03 +0000
Date: Fri, 29 Sep 2023 20:04:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 28/30]
 arch/x86/kernel/cpu/microcode/core.c:488:3: error: call to undeclared
 function '__ucode_load_primary'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202309291918.X2pHUkHJ-lkp@intel.com>
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
commit: 66cf86b60b5de0045433ed664dbe887486285b76 [28/30] x86/microcode: Handle "offline" CPUs correctly
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230929/202309291918.X2pHUkHJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291918.X2pHUkHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291918.X2pHUkHJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c:390:7: error: call to undeclared function 'ucode_load_secondary_wait'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!ucode_load_secondary_wait(ctrl_cpu)) {
                ^
   arch/x86/kernel/cpu/microcode/core.c:390:7: note: did you mean 'ucode_load_secondary'?
   arch/x86/kernel/cpu/microcode/core.c:385:21: note: 'ucode_load_secondary' declared here
   static noinstr void ucode_load_secondary(unsigned int cpu)
                       ^
>> arch/x86/kernel/cpu/microcode/core.c:488:3: error: call to undeclared function '__ucode_load_primary'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   __ucode_load_primary(cpu);
                   ^
   arch/x86/kernel/cpu/microcode/core.c:488:3: note: did you mean 'ucode_load_primary'?
   arch/x86/kernel/cpu/microcode/core.c:477:13: note: 'ucode_load_primary' declared here
   static void ucode_load_primary(unsigned int cpu)
               ^
>> arch/x86/kernel/cpu/microcode/core.c:516:3: error: call to undeclared function 'load_primary'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   load_primary(cpu);
                   ^
   arch/x86/kernel/cpu/microcode/core.c:516:3: note: did you mean '__load_primary'?
   arch/x86/kernel/cpu/microcode/core.c:414:13: note: '__load_primary' declared here
   static void __load_primary(unsigned int cpu)
               ^
   arch/x86/kernel/cpu/microcode/core.c:519:3: error: call to undeclared function 'load_secondary'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   load_secondary(cpu);
                   ^
   arch/x86/kernel/cpu/microcode/core.c:585:26: error: use of undeclared identifier 'load_cpus_stopped'
           stop_machine_cpuslocked(load_cpus_stopped, NULL, cpu_online_mask);
                                   ^
   5 errors generated.


vim +/__ucode_load_primary +488 arch/x86/kernel/cpu/microcode/core.c

   476	
   477	static void ucode_load_primary(unsigned int cpu)
   478	{
   479		unsigned int nr_offl = cpumask_weight(&cpu_offline_mask);
   480		bool proceed = true;
   481	
   482		/* Kick soft-offlined SMT siblings if required */
   483		if (!cpu && nr_offl)
   484			proceed = ucode_kick_offline_cpus(nr_offl);
   485	
   486		/* If the soft-offlined CPUs did not respond, abort */
   487		if (proceed)
 > 488			__ucode_load_primary(cpu);
   489	
   490		/* Unconditionally release soft-offlined SMT siblings if required */
   491		if (!cpu && nr_offl)
   492			ucode_release_offline_cpus();
   493	}
   494	
   495	/*
   496	 * Minimal stub rendevouz handler for soft-offlined CPUs which participate
   497	 * in the NMI rendevouz to protect against a concurrent NMI on affected
   498	 * CPUs.
   499	 */
   500	void noinstr microcode_offline_nmi_handler(void)
   501	{
   502		if (!raw_cpu_read(ucode_ctrl.nmi_enabled))
   503			return;
   504		raw_cpu_write(ucode_ctrl.nmi_enabled, false);
   505		raw_cpu_write(ucode_ctrl.result, UCODE_OFFLINE);
   506		raw_atomic_inc(&offline_in_nmi);
   507		wait_for_ctrl();
   508	}
   509	
   510	static noinstr bool microcode_update_handler(void)
   511	{
   512		unsigned int cpu = raw_smp_processor_id();
   513	
   514		if (raw_cpu_read(ucode_ctrl.ctrl_cpu) == cpu) {
   515			instrumentation_begin();
 > 516			load_primary(cpu);
   517			instrumentation_end();
   518		} else {
   519			load_secondary(cpu);
   520		}
   521	
   522		instrumentation_begin();
   523		touch_nmi_watchdog();
   524		instrumentation_end();
   525		return true;
   526	}
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
