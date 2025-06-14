Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230D20B22;
	Sat, 14 Jun 2025 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749907975; cv=none; b=gKoCzy0rTng5M1eX5bN9BnMtgxpHBQc5K4KfvjS4hDXBcrYPSSpXN6QGt96uJ1IClx329V8smlcgNphBsrciylRC2JvazjYz/QFkMNGTguSRHkFG5zBAXDBqT6DOujg/XW8pa5j2zbyt3CoeOLKY6YUCK4GhkcvGK8PYpzt5hEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749907975; c=relaxed/simple;
	bh=CPWCbKfPbuFhOTlWTtCu5mCvmNC+U+P4rPLQ4gAM0QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VATizDOBwF4IEtipW0HcBbhp7aT0bWda51I7cTwT1wqaUKx5SeyIMn+EU6Pn8MXF6X5p11NNsw4pVzY35mFD22NB/VsWzOy+IfrlyP7vm7FhfLhq9UyxQROOawo+dkWHDA+JQuyjXEfflvcCLQfr0bk7HFzii9Vaq0XwpzGPsDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PogxF8fg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PogxF8fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749907974; x=1781443974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CPWCbKfPbuFhOTlWTtCu5mCvmNC+U+P4rPLQ4gAM0QQ=;
  b=PogxF8fg0uPXCEkOjj0Y/hsU7GOZ8PFKZXfB2dQb9J9UzdFXV+G0Kd07
   /C03A9X8nlAXw+NPdt56C8RBPz8vCeoe0BerDL9LtDh1+XyQ16QiaiLyP
   YTFWMhrQ7OWPJJJmdNViaP5iGHeUpfdwLwlNkXRv5uGALD9HMbnBiOH8C
   ArnwsTSdduGlQf6qBzKANH9FWwRC7dlJfMeVbu5AKDaSWIxaLcJ6tIcsn
   VzjfQvcGxuJH6Q9lM/m2c7Dxouv85wx84AvoU1ak+SWW/eDhc81v7U9pZ
   2V0bpLGeTN/TepvGs1nC1oJyvVkrnh8ALgeiQ10xomhbglcmJ0AL0zxik
   g==;
X-CSE-ConnectionGUID: pxARAxy2Qlumzalo3sU9kA==
X-CSE-MsgGUID: dgd9v65wTH2XoX5yUe8e3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="55785539"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="55785539"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 06:32:53 -0700
X-CSE-ConnectionGUID: CZWP8ODASE2eqemodLtCyg==
X-CSE-MsgGUID: xsVGujYpRtiHWzPLakg/2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="171255022"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2025 06:32:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQR05-000DXO-1B;
	Sat, 14 Jun 2025 13:32:49 +0000
Date: Sat, 14 Jun 2025 21:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC Patch v2 3/4] x86/Hyper-V: Not use auto-eoi when Secure
 AVIC is available
Message-ID: <202506142143.mZm3MmgZ-lkp@intel.com>
References: <20250613110829.122371-4-ltykernel@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613110829.122371-4-ltykernel@gmail.com>

Hi Tianyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/x86-Hyper-V-Not-use-hv-apic-driver-when-Secure-AVIC-is-available/20250613-191041
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250613110829.122371-4-ltykernel%40gmail.com
patch subject: [RFC Patch v2 3/4] x86/Hyper-V: Not use auto-eoi when Secure AVIC is available
config: i386-buildonly-randconfig-003-20250614 (https://download.01.org/0day-ci/archive/20250614/202506142143.mZm3MmgZ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506142143.mZm3MmgZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506142143.mZm3MmgZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mshyperv.c:466:22: error: use of undeclared identifier 'CC_ATTR_SNP_SECURE_AVIC'
     466 |         if (cc_platform_has(CC_ATTR_SNP_SECURE_AVIC))
         |                             ^
   1 error generated.


vim +/CC_ATTR_SNP_SECURE_AVIC +466 arch/x86/kernel/cpu/mshyperv.c

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
 > 466		if (cc_platform_has(CC_ATTR_SNP_SECURE_AVIC))
   467			ms_hyperv.hints |= HV_DEPRECATING_AEOI_RECOMMENDED;
   468	
   469		if (ms_hyperv.hints & HV_X64_HYPERV_NESTED) {
   470			hv_nested = true;
   471			pr_info("Hyper-V: running on a nested hypervisor\n");
   472		}
   473	
   474		if (ms_hyperv.features & HV_ACCESS_FREQUENCY_MSRS &&
   475		    ms_hyperv.misc_features & HV_FEATURE_FREQUENCY_MSRS_AVAILABLE) {
   476			x86_platform.calibrate_tsc = hv_get_tsc_khz;
   477			x86_platform.calibrate_cpu = hv_get_tsc_khz;
   478			setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
   479		}
   480	
   481		if (ms_hyperv.priv_high & HV_ISOLATION) {
   482			ms_hyperv.isolation_config_a = cpuid_eax(HYPERV_CPUID_ISOLATION_CONFIG);
   483			ms_hyperv.isolation_config_b = cpuid_ebx(HYPERV_CPUID_ISOLATION_CONFIG);
   484	
   485			if (ms_hyperv.shared_gpa_boundary_active)
   486				ms_hyperv.shared_gpa_boundary =
   487					BIT_ULL(ms_hyperv.shared_gpa_boundary_bits);
   488	
   489			hyperv_paravisor_present = !!ms_hyperv.paravisor_present;
   490	
   491			pr_info("Hyper-V: Isolation Config: Group A 0x%x, Group B 0x%x\n",
   492				ms_hyperv.isolation_config_a, ms_hyperv.isolation_config_b);
   493	
   494	
   495			if (hv_get_isolation_type() == HV_ISOLATION_TYPE_SNP) {
   496				static_branch_enable(&isolation_type_snp);
   497			} else if (hv_get_isolation_type() == HV_ISOLATION_TYPE_TDX) {
   498				static_branch_enable(&isolation_type_tdx);
   499	
   500				/* A TDX VM must use x2APIC and doesn't use lazy EOI. */
   501				ms_hyperv.hints &= ~HV_X64_APIC_ACCESS_RECOMMENDED;
   502	
   503				if (!ms_hyperv.paravisor_present) {
   504					/*
   505					 * Mark the Hyper-V TSC page feature as disabled
   506					 * in a TDX VM without paravisor so that the
   507					 * Invariant TSC, which is a better clocksource
   508					 * anyway, is used instead.
   509					 */
   510					ms_hyperv.features &= ~HV_MSR_REFERENCE_TSC_AVAILABLE;
   511	
   512					/*
   513					 * The Invariant TSC is expected to be available
   514					 * in a TDX VM without paravisor, but if not,
   515					 * print a warning message. The slower Hyper-V MSR-based
   516					 * Ref Counter should end up being the clocksource.
   517					 */
   518					if (!(ms_hyperv.features & HV_ACCESS_TSC_INVARIANT))
   519						pr_warn("Hyper-V: Invariant TSC is unavailable\n");
   520	
   521					/* HV_MSR_CRASH_CTL is unsupported. */
   522					ms_hyperv.misc_features &= ~HV_FEATURE_GUEST_CRASH_MSR_AVAILABLE;
   523	
   524					/* Don't trust Hyper-V's TLB-flushing hypercalls. */
   525					ms_hyperv.hints &= ~HV_X64_REMOTE_TLB_FLUSH_RECOMMENDED;
   526	
   527					x86_init.acpi.reduced_hw_early_init = reduced_hw_init;
   528				}
   529			}
   530		}
   531	
   532		if (hv_max_functions_eax >= HYPERV_CPUID_NESTED_FEATURES) {
   533			ms_hyperv.nested_features =
   534				cpuid_eax(HYPERV_CPUID_NESTED_FEATURES);
   535			pr_info("Hyper-V: Nested features: 0x%x\n",
   536				ms_hyperv.nested_features);
   537		}
   538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
