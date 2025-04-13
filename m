Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C9A291E;
	Sun, 13 Apr 2025 04:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744517502; cv=none; b=SYJRroMbmGHi1A96LTal87MeTpzLadXD98A5jStVYGvC4f3YQRQtyqze2GxsJwOEQfBnnmwmXkv1ZkahjmdQ5OowuZ83EnAZsbDhMll8Kb2ORudS8cLV0NRXfulMh5yCSOkusRgiS+b8dVkX/DdJtLiR/va/fX39RZF3MCG7CqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744517502; c=relaxed/simple;
	bh=9aYUZHXQabQp0Wk/rqmqw5hZWuT5EnBGfZoBpuZ+85M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d7CYUDj7uUEUGfPGvIgEdXYZ6VbgF20FiNb9gTYwtt+OXmR6RfPy8zTGjfWZA3fpz5MPAVLzYUGfRld1XHIGjgG6gSquFWoZ+ZaDTE2E+C5fNDr93ivvfNWZJ7pC3dWs67sQWlhKHZ1Xf2TcWpgx6J9BTieWa/autmQkH2cZoug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrh4xCFY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrh4xCFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744517500; x=1776053500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9aYUZHXQabQp0Wk/rqmqw5hZWuT5EnBGfZoBpuZ+85M=;
  b=jrh4xCFYXksl6wIoyv8htYx1UQSRyeJseZAzcC2JNAkXsOnV7QuvbgT5
   ZknUAV1Z3WS2eKO0zZz893DWSw4QnAdufRPh1RYvP/9yZfDWrJoz7kDG9
   ZWSJTinXZr5rNOom2wRptmgt4xZEw4M9U/KIn+qs5fGxNNSZv3iWRwkD8
   tlbSN3NHAHsq6X9Qu7koSnVSxwPNiSHd7Iykh5S9gudUobwb8XyzltP9l
   IiPEmXoBVs/vcRmw6b38Sn8bddQUD9sbNYjARG1sQd825vTDKq0HVEiu3
   o+K9njimw/WI4z+98c89LMYrJv5VAWUyL/vMANNozLubRKxxyEzBmkjjK
   Q==;
X-CSE-ConnectionGUID: j6S0MEZPS9CTEvbaf/6s0A==
X-CSE-MsgGUID: Uxz3KjdVTCKn1II3oLQ5Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46152982"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="46152982"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 21:11:39 -0700
X-CSE-ConnectionGUID: B1wz9UC8Qi+A8hUNKxAd5w==
X-CSE-MsgGUID: 2G7dv9DDT8CckZu3l9Uykg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="129861070"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Apr 2025 21:11:38 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3ogx-000CMg-2f;
	Sun, 13 Apr 2025 04:11:35 +0000
Date: Sun, 13 Apr 2025 12:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 4/6] arch/x86/kernel/cpu/mshyperv.c:431:34:
 error: use of undeclared identifier 'hv_pg_hypercall'; did you mean
 'hv_do_hypercall'?
Message-ID: <202504131254.9Cornerg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   c08c01c51ede1b79b73fe142e4bc9f7bb9d0ea5e
commit: c8efbca9f0d4d811af848bcec92a9f9ba4b98301 [4/6] x86,hyperv: Clean up hv_do_hypercall()
config: x86_64-buildonly-randconfig-002-20250412 (https://download.01.org/0day-ci/archive/20250413/202504131254.9Cornerg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504131254.9Cornerg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504131254.9Cornerg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mshyperv.c:431:34: error: use of undeclared identifier 'hv_pg_hypercall'; did you mean 'hv_do_hypercall'?
     431 | DEFINE_STATIC_CALL(hv_hypercall, hv_pg_hypercall);
         |                                  ^~~~~~~~~~~~~~~
         |                                  hv_do_hypercall
   include/linux/static_call.h:188:28: note: expanded from macro 'DEFINE_STATIC_CALL'
     188 |         DECLARE_STATIC_CALL(name, _func);                               \
         |                                   ^
   include/linux/static_call_types.h:39:16: note: expanded from macro 'DECLARE_STATIC_CALL'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                       ^
   include/asm-generic/mshyperv.h:73:5: note: 'hv_do_hypercall' declared here
      73 | u64 hv_do_hypercall(u64 control, void *inputaddr, void *outputaddr);
         |     ^
>> arch/x86/kernel/cpu/mshyperv.c:431:34: error: use of undeclared identifier 'hv_pg_hypercall'; did you mean 'hv_do_hypercall'?
     431 | DEFINE_STATIC_CALL(hv_hypercall, hv_pg_hypercall);
         |                                  ^~~~~~~~~~~~~~~
         |                                  hv_do_hypercall
   include/linux/static_call.h:190:11: note: expanded from macro 'DEFINE_STATIC_CALL'
     190 |                 .func = _func,                                          \
         |                         ^
   include/asm-generic/mshyperv.h:73:5: note: 'hv_do_hypercall' declared here
      73 | u64 hv_do_hypercall(u64 control, void *inputaddr, void *outputaddr);
         |     ^
>> arch/x86/kernel/cpu/mshyperv.c:495:38: error: use of undeclared identifier 'hv_snp_hypercall'; did you mean 'hv_do_hypercall'?
     495 |                                 static_call_update(hv_hypercall, hv_snp_hypercall);
         |                                                                  ^~~~~~~~~~~~~~~~
         |                                                                  hv_do_hypercall
   include/linux/static_call.h:154:42: note: expanded from macro 'static_call_update'
     154 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                 ^
   include/asm-generic/mshyperv.h:73:5: note: 'hv_do_hypercall' declared here
      73 | u64 hv_do_hypercall(u64 control, void *inputaddr, void *outputaddr);
         |     ^
>> arch/x86/kernel/cpu/mshyperv.c:505:38: error: use of undeclared identifier 'hv_tdx_hypercall'
     505 |                                 static_call_update(hv_hypercall, hv_tdx_hypercall);
         |                                                                  ^
   4 errors generated.


vim +431 arch/x86/kernel/cpu/mshyperv.c

   429	
   430	#ifdef CONFIG_X86_64
 > 431	DEFINE_STATIC_CALL(hv_hypercall, hv_pg_hypercall);
   432	EXPORT_STATIC_CALL_TRAMP_GPL(hv_hypercall);
   433	#endif
   434	
   435	static void __init ms_hyperv_init_platform(void)
   436	{
   437		int hv_max_functions_eax;
   438	
   439	#ifdef CONFIG_PARAVIRT
   440		pv_info.name = "Hyper-V";
   441	#endif
   442	
   443		/*
   444		 * Extract the features and hints
   445		 */
   446		ms_hyperv.features = cpuid_eax(HYPERV_CPUID_FEATURES);
   447		ms_hyperv.priv_high = cpuid_ebx(HYPERV_CPUID_FEATURES);
   448		ms_hyperv.ext_features = cpuid_ecx(HYPERV_CPUID_FEATURES);
   449		ms_hyperv.misc_features = cpuid_edx(HYPERV_CPUID_FEATURES);
   450		ms_hyperv.hints    = cpuid_eax(HYPERV_CPUID_ENLIGHTMENT_INFO);
   451	
   452		hv_max_functions_eax = cpuid_eax(HYPERV_CPUID_VENDOR_AND_MAX_FUNCTIONS);
   453	
   454		pr_info("Hyper-V: privilege flags low %#x, high %#x, ext %#x, hints %#x, misc %#x\n",
   455			ms_hyperv.features, ms_hyperv.priv_high,
   456			ms_hyperv.ext_features, ms_hyperv.hints,
   457			ms_hyperv.misc_features);
   458	
   459		ms_hyperv.max_vp_index = cpuid_eax(HYPERV_CPUID_IMPLEMENT_LIMITS);
   460		ms_hyperv.max_lp_index = cpuid_ebx(HYPERV_CPUID_IMPLEMENT_LIMITS);
   461	
   462		pr_debug("Hyper-V: max %u virtual processors, %u logical processors\n",
   463			 ms_hyperv.max_vp_index, ms_hyperv.max_lp_index);
   464	
   465		hv_identify_partition_type();
   466	
   467		if (ms_hyperv.hints & HV_X64_HYPERV_NESTED) {
   468			hv_nested = true;
   469			pr_info("Hyper-V: running on a nested hypervisor\n");
   470		}
   471	
   472		if (ms_hyperv.features & HV_ACCESS_FREQUENCY_MSRS &&
   473		    ms_hyperv.misc_features & HV_FEATURE_FREQUENCY_MSRS_AVAILABLE) {
   474			x86_platform.calibrate_tsc = hv_get_tsc_khz;
   475			x86_platform.calibrate_cpu = hv_get_tsc_khz;
   476			setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
   477		}
   478	
   479		if (ms_hyperv.priv_high & HV_ISOLATION) {
   480			ms_hyperv.isolation_config_a = cpuid_eax(HYPERV_CPUID_ISOLATION_CONFIG);
   481			ms_hyperv.isolation_config_b = cpuid_ebx(HYPERV_CPUID_ISOLATION_CONFIG);
   482	
   483			if (ms_hyperv.shared_gpa_boundary_active)
   484				ms_hyperv.shared_gpa_boundary =
   485					BIT_ULL(ms_hyperv.shared_gpa_boundary_bits);
   486	
   487			pr_info("Hyper-V: Isolation Config: Group A 0x%x, Group B 0x%x\n",
   488				ms_hyperv.isolation_config_a, ms_hyperv.isolation_config_b);
   489	
   490	
   491			if (hv_get_isolation_type() == HV_ISOLATION_TYPE_SNP) {
   492				static_branch_enable(&isolation_type_snp);
   493	#ifdef CONFIG_X86_64
   494				if (!ms_hyperv.paravisor_present)
 > 495					static_call_update(hv_hypercall, hv_snp_hypercall);
   496	#endif
   497			} else if (hv_get_isolation_type() == HV_ISOLATION_TYPE_TDX) {
   498				static_branch_enable(&isolation_type_tdx);
   499	
   500				/* A TDX VM must use x2APIC and doesn't use lazy EOI. */
   501				ms_hyperv.hints &= ~HV_X64_APIC_ACCESS_RECOMMENDED;
   502	
   503				if (!ms_hyperv.paravisor_present) {
   504	#ifdef CONFIG_X86_64
 > 505					static_call_update(hv_hypercall, hv_tdx_hypercall);
   506	#endif
   507					/*
   508					 * Mark the Hyper-V TSC page feature as disabled
   509					 * in a TDX VM without paravisor so that the
   510					 * Invariant TSC, which is a better clocksource
   511					 * anyway, is used instead.
   512					 */
   513					ms_hyperv.features &= ~HV_MSR_REFERENCE_TSC_AVAILABLE;
   514	
   515					/*
   516					 * The Invariant TSC is expected to be available
   517					 * in a TDX VM without paravisor, but if not,
   518					 * print a warning message. The slower Hyper-V MSR-based
   519					 * Ref Counter should end up being the clocksource.
   520					 */
   521					if (!(ms_hyperv.features & HV_ACCESS_TSC_INVARIANT))
   522						pr_warn("Hyper-V: Invariant TSC is unavailable\n");
   523	
   524					/* HV_MSR_CRASH_CTL is unsupported. */
   525					ms_hyperv.misc_features &= ~HV_FEATURE_GUEST_CRASH_MSR_AVAILABLE;
   526	
   527					/* Don't trust Hyper-V's TLB-flushing hypercalls. */
   528					ms_hyperv.hints &= ~HV_X64_REMOTE_TLB_FLUSH_RECOMMENDED;
   529	
   530					x86_init.acpi.reduced_hw_early_init = reduced_hw_init;
   531				}
   532			}
   533		}
   534	
   535		if (hv_max_functions_eax >= HYPERV_CPUID_NESTED_FEATURES) {
   536			ms_hyperv.nested_features =
   537				cpuid_eax(HYPERV_CPUID_NESTED_FEATURES);
   538			pr_info("Hyper-V: Nested features: 0x%x\n",
   539				ms_hyperv.nested_features);
   540		}
   541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
