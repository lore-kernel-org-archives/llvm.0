Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7483D38D;
	Fri, 22 Mar 2024 11:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711106606; cv=none; b=gz51QM6Ro8n96Ij4d3IX6s55wbE3y1RqCABJIJd2dQqPdzcsnPRfC/pYG1OwonHRfzcWh++nWON+JUNWyJjflHqupFGS2EM7TM3CMUFfL9CBxr22gta9UbRhX11GN1/JjQbFD2XVDXqp6DFx3VZv9RRShfmvFkMeued3lfy1xnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711106606; c=relaxed/simple;
	bh=PKjd7K3X/ni2Iu5ro+RMvG2cLW/VHSLmtHU3plLmQKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F8bNos98FXBpLoMui5o3qpJWPs/pDdKIyl/VN+fuxFB+wgC0WIWzAig9nHWphjlmQm9R6ETiGFz7B9SB+PyUHdRLeJxxvLZKZlM3X7vrvxnF2PFeI8U3C2WehqAJR7X30a4K6T/hm9DAV4kLeLVGoLV0INLa/299ievjvxPS8YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb/yrWq4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb/yrWq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711106603; x=1742642603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PKjd7K3X/ni2Iu5ro+RMvG2cLW/VHSLmtHU3plLmQKk=;
  b=Lb/yrWq4g/kXZqerdfHPXN12CDQgsV5QZPGsEz9UN8bX9+1YMmIeIqYu
   Fjl6dbnlJkd1XtnDRXLdjKpfPzRZRxkPsijsrrIXMwyuVHX65m1uaEm0g
   WrQzrfVMce8fTTWMlGqo3l2Uv1VKtPH1IWOgdWfNs5FTtKSmvU+KoNdvf
   lPW1kFiKYRK4rldk5n2TV7JXthcAH5gfGk971U5smu0Nf6XNDuXAso5R5
   BNvCUUiFGbDY1zb6cU15Fb7IG46ZToA1y32v7RekKTYJ5b50KLtAtgb9n
   E75sF4EidjwJWBM3xi3eJxdnqfJh04X4e6ohjrfsl9BzMd+Lfz5nWNlGy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5976929"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="5976929"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="19580593"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Mar 2024 04:23:20 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnczW-000KGN-0S;
	Fri, 22 Mar 2024 11:23:18 +0000
Date: Fri, 22 Mar 2024 19:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/kvm_mpam_fix/v3 2/6]
 arch/arm64/kernel/cpufeature.c:2934:2: error: expected '}'
Message-ID: <202403221932.Ss3YgPzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/kvm_mpam_fix/v3
head:   efef6777cd47f54b38b9f5c02a0d891eb54ce198
commit: 66e08b376a3230bc60f56dd9b7127a65d70fe32c [2/6] arm64: cpufeature: discover CPU support for MPAM
config: arm64-randconfig-004-20240322 (https://download.01.org/0day-ci/archive/20240322/202403221932.Ss3YgPzc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403221932.Ss3YgPzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403221932.Ss3YgPzc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature.c:2934:2: error: expected '}'
    2934 | };
         |  ^
   arch/arm64/kernel/cpufeature.c:2421:63: note: to match this '{'
    2421 | static const struct arm64_cpu_capabilities arm64_features[] = {
         |                                                               ^
>> arch/arm64/kernel/cpufeature.c:2421:44: warning: tentative array definition assumed to have one element
    2421 | static const struct arm64_cpu_capabilities arm64_features[] = {
         |                                            ^
   1 warning and 1 error generated.


vim +2934 arch/arm64/kernel/cpufeature.c

66e08b376a3230 James Morse         2018-07-02  2420  
359b706473b47d Marc Zyngier        2015-03-27  2421  static const struct arm64_cpu_capabilities arm64_features[] = {
4c0bd995d73ed8 Mark Rutland        2022-09-12  2422  	{
4c0bd995d73ed8 Mark Rutland        2022-09-12  2423  		.capability = ARM64_ALWAYS_BOOT,
4c0bd995d73ed8 Mark Rutland        2022-09-12  2424  		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
4c0bd995d73ed8 Mark Rutland        2022-09-12  2425  		.matches = has_always,
4c0bd995d73ed8 Mark Rutland        2022-09-12  2426  	},
4c0bd995d73ed8 Mark Rutland        2022-09-12  2427  	{
4c0bd995d73ed8 Mark Rutland        2022-09-12  2428  		.capability = ARM64_ALWAYS_SYSTEM,
4c0bd995d73ed8 Mark Rutland        2022-09-12  2429  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
4c0bd995d73ed8 Mark Rutland        2022-09-12  2430  		.matches = has_always,
4c0bd995d73ed8 Mark Rutland        2022-09-12  2431  	},
94a9e04aa16abd Marc Zyngier        2015-06-12  2432  	{
94a9e04aa16abd Marc Zyngier        2015-06-12  2433  		.desc = "GIC system register CPU interface",
0e62ccb9598dae Mark Rutland        2023-01-30  2434  		.capability = ARM64_HAS_GIC_CPUIF_SYSREGS,
c9bfdf734d4c0e Julien Thierry      2019-01-31  2435  		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
963fcd40958711 Marc Zyngier        2015-09-30  2436  		.matches = has_useable_gicv3_cpuif,
863da0bdb17b5c Mark Brown          2023-04-12  2437  		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, GIC, IMP)
94a9e04aa16abd Marc Zyngier        2015-06-12  2438  	},
fdf865988b5a40 Marc Zyngier        2021-10-17  2439  	{
fdf865988b5a40 Marc Zyngier        2021-10-17  2440  		.desc = "Enhanced Counter Virtualization",
fdf865988b5a40 Marc Zyngier        2021-10-17  2441  		.capability = ARM64_HAS_ECV,
fdf865988b5a40 Marc Zyngier        2021-10-17  2442  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
fdf865988b5a40 Marc Zyngier        2021-10-17  2443  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2444  		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, ECV, IMP)
fdf865988b5a40 Marc Zyngier        2021-10-17  2445  	},
326349943ed181 Marc Zyngier        2023-03-30  2446  	{
326349943ed181 Marc Zyngier        2023-03-30  2447  		.desc = "Enhanced Counter Virtualization (CNTPOFF)",
326349943ed181 Marc Zyngier        2023-03-30  2448  		.capability = ARM64_HAS_ECV_CNTPOFF,
326349943ed181 Marc Zyngier        2023-03-30  2449  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
326349943ed181 Marc Zyngier        2023-03-30  2450  		.matches = has_cpuid_feature,
e34f78b970ea51 Mark Brown          2023-05-23  2451  		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, ECV, CNTPOFF)
326349943ed181 Marc Zyngier        2023-03-30  2452  	},
338d4f49d6f711 James Morse         2015-07-22  2453  #ifdef CONFIG_ARM64_PAN
338d4f49d6f711 James Morse         2015-07-22  2454  	{
338d4f49d6f711 James Morse         2015-07-22  2455  		.desc = "Privileged Access Never",
338d4f49d6f711 James Morse         2015-07-22  2456  		.capability = ARM64_HAS_PAN,
5b4747c5dce7a8 Suzuki K Poulose    2018-03-26  2457  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
da8d02d19ffdd2 Suzuki K. Poulose   2015-10-19  2458  		.matches = has_cpuid_feature,
c0cda3b8ee6b4b Dave Martin         2018-03-26  2459  		.cpu_enable = cpu_enable_pan,
863da0bdb17b5c Mark Brown          2023-04-12  2460  		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, PAN, IMP)
338d4f49d6f711 James Morse         2015-07-22  2461  	},
338d4f49d6f711 James Morse         2015-07-22  2462  #endif /* CONFIG_ARM64_PAN */
18107f8a2df6bf Vladimir Murzin     2021-03-12  2463  #ifdef CONFIG_ARM64_EPAN
18107f8a2df6bf Vladimir Murzin     2021-03-12  2464  	{
18107f8a2df6bf Vladimir Murzin     2021-03-12  2465  		.desc = "Enhanced Privileged Access Never",
18107f8a2df6bf Vladimir Murzin     2021-03-12  2466  		.capability = ARM64_HAS_EPAN,
18107f8a2df6bf Vladimir Murzin     2021-03-12  2467  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
18107f8a2df6bf Vladimir Murzin     2021-03-12  2468  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2469  		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, PAN, PAN3)
18107f8a2df6bf Vladimir Murzin     2021-03-12  2470  	},
18107f8a2df6bf Vladimir Murzin     2021-03-12  2471  #endif /* CONFIG_ARM64_EPAN */
395af861377d14 Catalin Marinas     2020-01-15  2472  #ifdef CONFIG_ARM64_LSE_ATOMICS
2e94da13790336 Will Deacon         2015-07-27  2473  	{
2e94da13790336 Will Deacon         2015-07-27  2474  		.desc = "LSE atomic instructions",
2e94da13790336 Will Deacon         2015-07-27  2475  		.capability = ARM64_HAS_LSE_ATOMICS,
5b4747c5dce7a8 Suzuki K Poulose    2018-03-26  2476  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
da8d02d19ffdd2 Suzuki K. Poulose   2015-10-19  2477  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2478  		ARM64_CPUID_FIELDS(ID_AA64ISAR0_EL1, ATOMIC, IMP)
2e94da13790336 Will Deacon         2015-07-27  2479  	},
395af861377d14 Catalin Marinas     2020-01-15  2480  #endif /* CONFIG_ARM64_LSE_ATOMICS */
d88701bea3664c Marc Zyngier        2015-01-29  2481  	{
d88701bea3664c Marc Zyngier        2015-01-29  2482  		.desc = "Virtualization Host Extensions",
d88701bea3664c Marc Zyngier        2015-01-29  2483  		.capability = ARM64_HAS_VIRT_HOST_EXTN,
830dcc9f9a7cd2 Suzuki K Poulose    2018-03-26  2484  		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
d88701bea3664c Marc Zyngier        2015-01-29  2485  		.matches = runs_at_el2,
c0cda3b8ee6b4b Dave Martin         2018-03-26  2486  		.cpu_enable = cpu_copy_el2regs,
d88701bea3664c Marc Zyngier        2015-01-29  2487  	},
675cabc8990073 Jintack Lim         2023-02-09  2488  	{
675cabc8990073 Jintack Lim         2023-02-09  2489  		.desc = "Nested Virtualization Support",
675cabc8990073 Jintack Lim         2023-02-09  2490  		.capability = ARM64_HAS_NESTED_VIRT,
675cabc8990073 Jintack Lim         2023-02-09  2491  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
675cabc8990073 Jintack Lim         2023-02-09  2492  		.matches = has_nested_virt_support,
2bfc654b89c4dd Marc Zyngier        2023-11-09  2493  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, NV, NV2)
675cabc8990073 Jintack Lim         2023-02-09  2494  	},
042446a31e3803 Suzuki K Poulose    2016-04-18  2495  	{
2122a833316f2f Will Deacon         2021-06-08  2496  		.capability = ARM64_HAS_32BIT_EL0_DO_NOT_USE,
5b4747c5dce7a8 Suzuki K Poulose    2018-03-26  2497  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
2122a833316f2f Will Deacon         2021-06-08  2498  		.matches = has_32bit_el0,
863da0bdb17b5c Mark Brown          2023-04-12  2499  		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, EL0, AARCH32)
042446a31e3803 Suzuki K Poulose    2016-04-18  2500  	},
540f76d12c662d Will Deacon         2020-04-21  2501  #ifdef CONFIG_KVM
540f76d12c662d Will Deacon         2020-04-21  2502  	{
540f76d12c662d Will Deacon         2020-04-21  2503  		.desc = "32-bit EL1 Support",
540f76d12c662d Will Deacon         2020-04-21  2504  		.capability = ARM64_HAS_32BIT_EL1,
540f76d12c662d Will Deacon         2020-04-21  2505  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
540f76d12c662d Will Deacon         2020-04-21  2506  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2507  		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, EL1, AARCH32)
540f76d12c662d Will Deacon         2020-04-21  2508  	},
3eb681fba2bf8b David Brazdil       2020-12-02  2509  	{
3eb681fba2bf8b David Brazdil       2020-12-02  2510  		.desc = "Protected KVM",
3eb681fba2bf8b David Brazdil       2020-12-02  2511  		.capability = ARM64_KVM_PROTECTED_MODE,
3eb681fba2bf8b David Brazdil       2020-12-02  2512  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
3eb681fba2bf8b David Brazdil       2020-12-02  2513  		.matches = is_kvm_protected_mode,
3eb681fba2bf8b David Brazdil       2020-12-02  2514  	},
b0c756fe996ac9 Kristina Martsenko  2023-05-09  2515  	{
b0c756fe996ac9 Kristina Martsenko  2023-05-09  2516  		.desc = "HCRX_EL2 register",
b0c756fe996ac9 Kristina Martsenko  2023-05-09  2517  		.capability = ARM64_HAS_HCX,
b0c756fe996ac9 Kristina Martsenko  2023-05-09  2518  		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
b0c756fe996ac9 Kristina Martsenko  2023-05-09  2519  		.matches = has_cpuid_feature,
b0c756fe996ac9 Kristina Martsenko  2023-05-09  2520  		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HCX, IMP)
b0c756fe996ac9 Kristina Martsenko  2023-05-09  2521  	},
540f76d12c662d Will Deacon         2020-04-21  2522  #endif
ea1e3de85e94d7 Will Deacon         2017-11-14  2523  	{
179a56f6f9fbda Will Deacon         2017-11-27  2524  		.desc = "Kernel page table isolation (KPTI)",
ea1e3de85e94d7 Will Deacon         2017-11-14  2525  		.capability = ARM64_UNMAP_KERNEL_AT_EL0,
d3aec8a28be3b8 Suzuki K Poulose    2018-03-26  2526  		.type = ARM64_CPUCAP_BOOT_RESTRICTED_CPU_LOCAL_FEATURE,
42c5a3b04bf672 Mark Rutland        2023-10-16  2527  		.cpu_enable = cpu_enable_kpti,
863da0bdb17b5c Mark Brown          2023-04-12  2528  		.matches = unmap_kernel_at_el0,
d3aec8a28be3b8 Suzuki K Poulose    2018-03-26  2529  		/*
d3aec8a28be3b8 Suzuki K Poulose    2018-03-26  2530  		 * The ID feature fields below are used to indicate that
d3aec8a28be3b8 Suzuki K Poulose    2018-03-26  2531  		 * the CPU doesn't need KPTI. See unmap_kernel_at_el0 for
d3aec8a28be3b8 Suzuki K Poulose    2018-03-26  2532  		 * more details.
d3aec8a28be3b8 Suzuki K Poulose    2018-03-26  2533  		 */
863da0bdb17b5c Mark Brown          2023-04-12  2534  		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, CSV3, IMP)
ea1e3de85e94d7 Will Deacon         2017-11-14  2535  	},
82e0191a1aa11a Suzuki K Poulose    2016-11-08  2536  	{
34f66c4c4d5518 Mark Rutland        2023-10-16  2537  		.capability = ARM64_HAS_FPSIMD,
34f66c4c4d5518 Mark Rutland        2023-10-16  2538  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
34f66c4c4d5518 Mark Rutland        2023-10-16  2539  		.matches = has_cpuid_feature,
34f66c4c4d5518 Mark Rutland        2023-10-16  2540  		.cpu_enable = cpu_enable_fpsimd,
34f66c4c4d5518 Mark Rutland        2023-10-16  2541  		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, FP, IMP)
82e0191a1aa11a Suzuki K Poulose    2016-11-08  2542  	},
d50e071fdaa33c Robin Murphy        2017-07-25  2543  #ifdef CONFIG_ARM64_PMEM
d50e071fdaa33c Robin Murphy        2017-07-25  2544  	{
d50e071fdaa33c Robin Murphy        2017-07-25  2545  		.desc = "Data cache clean to Point of Persistence",
d50e071fdaa33c Robin Murphy        2017-07-25  2546  		.capability = ARM64_HAS_DCPOP,
5b4747c5dce7a8 Suzuki K Poulose    2018-03-26  2547  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
d50e071fdaa33c Robin Murphy        2017-07-25  2548  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2549  		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, DPB, IMP)
d50e071fdaa33c Robin Murphy        2017-07-25  2550  	},
b9585f53bcf1ad Andrew Murray       2019-04-09  2551  	{
b9585f53bcf1ad Andrew Murray       2019-04-09  2552  		.desc = "Data cache clean to Point of Deep Persistence",
b9585f53bcf1ad Andrew Murray       2019-04-09  2553  		.capability = ARM64_HAS_DCPODP,
b9585f53bcf1ad Andrew Murray       2019-04-09  2554  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
b9585f53bcf1ad Andrew Murray       2019-04-09  2555  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2556  		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, DPB, DPB2)
b9585f53bcf1ad Andrew Murray       2019-04-09  2557  	},
d50e071fdaa33c Robin Murphy        2017-07-25  2558  #endif
43994d824e8443 Dave Martin         2017-10-31  2559  #ifdef CONFIG_ARM64_SVE
43994d824e8443 Dave Martin         2017-10-31  2560  	{
43994d824e8443 Dave Martin         2017-10-31  2561  		.desc = "Scalable Vector Extension",
5b4747c5dce7a8 Suzuki K Poulose    2018-03-26  2562  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
43994d824e8443 Dave Martin         2017-10-31  2563  		.capability = ARM64_SVE,
14567ba42c5747 Mark Rutland        2023-10-16  2564  		.cpu_enable = cpu_enable_sve,
863da0bdb17b5c Mark Brown          2023-04-12  2565  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2566  		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, SVE, IMP)
43994d824e8443 Dave Martin         2017-10-31  2567  	},
43994d824e8443 Dave Martin         2017-10-31  2568  #endif /* CONFIG_ARM64_SVE */
64c02720ea3598 Xie XiuQi           2018-01-15  2569  #ifdef CONFIG_ARM64_RAS_EXTN
64c02720ea3598 Xie XiuQi           2018-01-15  2570  	{
64c02720ea3598 Xie XiuQi           2018-01-15  2571  		.desc = "RAS Extension Support",
64c02720ea3598 Xie XiuQi           2018-01-15  2572  		.capability = ARM64_HAS_RAS_EXTN,
5b4747c5dce7a8 Suzuki K Poulose    2018-03-26  2573  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
64c02720ea3598 Xie XiuQi           2018-01-15  2574  		.matches = has_cpuid_feature,
c0cda3b8ee6b4b Dave Martin         2018-03-26  2575  		.cpu_enable = cpu_clear_disr,
863da0bdb17b5c Mark Brown          2023-04-12  2576  		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, RAS, IMP)
64c02720ea3598 Xie XiuQi           2018-01-15  2577  	},
64c02720ea3598 Xie XiuQi           2018-01-15  2578  #endif /* CONFIG_ARM64_RAS_EXTN */
2c9d45b43c39e2 Ionela Voinescu     2020-03-05  2579  #ifdef CONFIG_ARM64_AMU_EXTN
2c9d45b43c39e2 Ionela Voinescu     2020-03-05  2580  	{
23b727dc2092d4 Jeremy Linton       2023-10-17  2581  		.desc = "Activity Monitors Unit (AMU)",
2c9d45b43c39e2 Ionela Voinescu     2020-03-05  2582  		.capability = ARM64_HAS_AMU_EXTN,
2c9d45b43c39e2 Ionela Voinescu     2020-03-05  2583  		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
2c9d45b43c39e2 Ionela Voinescu     2020-03-05  2584  		.matches = has_amu,
2c9d45b43c39e2 Ionela Voinescu     2020-03-05  2585  		.cpu_enable = cpu_amu_enable,
23b727dc2092d4 Jeremy Linton       2023-10-17  2586  		.cpus = &amu_cpus,
863da0bdb17b5c Mark Brown          2023-04-12  2587  		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, AMU, IMP)
2c9d45b43c39e2 Ionela Voinescu     2020-03-05  2588  	},
2c9d45b43c39e2 Ionela Voinescu     2020-03-05  2589  #endif /* CONFIG_ARM64_AMU_EXTN */
6ae4b6e0578886 Shanker Donthineni  2018-03-07  2590  	{
6ae4b6e0578886 Shanker Donthineni  2018-03-07  2591  		.desc = "Data cache clean to the PoU not required for I/D coherence",
6ae4b6e0578886 Shanker Donthineni  2018-03-07  2592  		.capability = ARM64_HAS_CACHE_IDC,
5b4747c5dce7a8 Suzuki K Poulose    2018-03-26  2593  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
6ae4b6e0578886 Shanker Donthineni  2018-03-07  2594  		.matches = has_cache_idc,
1602df02f33f61 Suzuki K Poulose    2018-10-09  2595  		.cpu_enable = cpu_emulate_effective_ctr,
6ae4b6e0578886 Shanker Donthineni  2018-03-07  2596  	},
6ae4b6e0578886 Shanker Donthineni  2018-03-07  2597  	{
6ae4b6e0578886 Shanker Donthineni  2018-03-07  2598  		.desc = "Instruction cache invalidation not required for I/D coherence",
6ae4b6e0578886 Shanker Donthineni  2018-03-07  2599  		.capability = ARM64_HAS_CACHE_DIC,
5b4747c5dce7a8 Suzuki K Poulose    2018-03-26  2600  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
6ae4b6e0578886 Shanker Donthineni  2018-03-07  2601  		.matches = has_cache_dic,
6ae4b6e0578886 Shanker Donthineni  2018-03-07  2602  	},
e48d53a91f6e90 Marc Zyngier        2018-04-06  2603  	{
e48d53a91f6e90 Marc Zyngier        2018-04-06  2604  		.desc = "Stage-2 Force Write-Back",
e48d53a91f6e90 Marc Zyngier        2018-04-06  2605  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
e48d53a91f6e90 Marc Zyngier        2018-04-06  2606  		.capability = ARM64_HAS_STAGE2_FWB,
e48d53a91f6e90 Marc Zyngier        2018-04-06  2607  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2608  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, FWB, IMP)
e48d53a91f6e90 Marc Zyngier        2018-04-06  2609  	},
552ae76face558 Marc Zyngier        2018-12-22  2610  	{
552ae76face558 Marc Zyngier        2018-12-22  2611  		.desc = "ARMv8.4 Translation Table Level",
552ae76face558 Marc Zyngier        2018-12-22  2612  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
552ae76face558 Marc Zyngier        2018-12-22  2613  		.capability = ARM64_HAS_ARMv8_4_TTL,
552ae76face558 Marc Zyngier        2018-12-22  2614  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2615  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, TTL, IMP)
552ae76face558 Marc Zyngier        2018-12-22  2616  	},
b620ba54547cd0 Zhenyu Ye           2020-07-15  2617  	{
b620ba54547cd0 Zhenyu Ye           2020-07-15  2618  		.desc = "TLB range maintenance instructions",
b620ba54547cd0 Zhenyu Ye           2020-07-15  2619  		.capability = ARM64_HAS_TLB_RANGE,
b620ba54547cd0 Zhenyu Ye           2020-07-15  2620  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
b620ba54547cd0 Zhenyu Ye           2020-07-15  2621  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2622  		ARM64_CPUID_FIELDS(ID_AA64ISAR0_EL1, TLB, RANGE)
b620ba54547cd0 Zhenyu Ye           2020-07-15  2623  	},
05abb595bbaccc Suzuki K Poulose    2018-03-26  2624  #ifdef CONFIG_ARM64_HW_AFDBM
05abb595bbaccc Suzuki K Poulose    2018-03-26  2625  	{
04d402a453c37f Jeremy Linton       2023-10-17  2626  		.desc = "Hardware dirty bit management",
05abb595bbaccc Suzuki K Poulose    2018-03-26  2627  		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
05abb595bbaccc Suzuki K Poulose    2018-03-26  2628  		.capability = ARM64_HW_DBM,
05abb595bbaccc Suzuki K Poulose    2018-03-26  2629  		.matches = has_hw_dbm,
05abb595bbaccc Suzuki K Poulose    2018-03-26  2630  		.cpu_enable = cpu_enable_hw_dbm,
04d402a453c37f Jeremy Linton       2023-10-17  2631  		.cpus = &dbm_cpus,
863da0bdb17b5c Mark Brown          2023-04-12  2632  		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, DBM)
05abb595bbaccc Suzuki K Poulose    2018-03-26  2633  	},
05abb595bbaccc Suzuki K Poulose    2018-03-26  2634  #endif
86d0dd34eafffb Ard Biesheuvel      2018-08-27  2635  	{
86d0dd34eafffb Ard Biesheuvel      2018-08-27  2636  		.desc = "CRC32 instructions",
86d0dd34eafffb Ard Biesheuvel      2018-08-27  2637  		.capability = ARM64_HAS_CRC32,
86d0dd34eafffb Ard Biesheuvel      2018-08-27  2638  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
86d0dd34eafffb Ard Biesheuvel      2018-08-27  2639  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2640  		ARM64_CPUID_FIELDS(ID_AA64ISAR0_EL1, CRC32, IMP)
86d0dd34eafffb Ard Biesheuvel      2018-08-27  2641  	},
d71be2b6c0e191 Will Deacon         2018-06-15  2642  	{
d71be2b6c0e191 Will Deacon         2018-06-15  2643  		.desc = "Speculative Store Bypassing Safe (SSBS)",
d71be2b6c0e191 Will Deacon         2018-06-15  2644  		.capability = ARM64_SSBS,
532d581583f25d Will Deacon         2020-09-15  2645  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
d71be2b6c0e191 Will Deacon         2018-06-15  2646  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2647  		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, SSBS, IMP)
d71be2b6c0e191 Will Deacon         2018-06-15  2648  	},
5ffdfaedfa0aba Vladimir Murzin     2018-07-31  2649  #ifdef CONFIG_ARM64_CNP
5ffdfaedfa0aba Vladimir Murzin     2018-07-31  2650  	{
5ffdfaedfa0aba Vladimir Murzin     2018-07-31  2651  		.desc = "Common not Private translations",
5ffdfaedfa0aba Vladimir Murzin     2018-07-31  2652  		.capability = ARM64_HAS_CNP,
5ffdfaedfa0aba Vladimir Murzin     2018-07-31  2653  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
5ffdfaedfa0aba Vladimir Murzin     2018-07-31  2654  		.matches = has_useable_cnp,
5ffdfaedfa0aba Vladimir Murzin     2018-07-31  2655  		.cpu_enable = cpu_enable_cnp,
863da0bdb17b5c Mark Brown          2023-04-12  2656  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, CnP, IMP)
5ffdfaedfa0aba Vladimir Murzin     2018-07-31  2657  	},
8f04e8e6e29c93 Will Deacon         2018-08-07  2658  #endif
bd4fb6d270bc42 Will Deacon         2018-06-14  2659  	{
bd4fb6d270bc42 Will Deacon         2018-06-14  2660  		.desc = "Speculation barrier (SB)",
bd4fb6d270bc42 Will Deacon         2018-06-14  2661  		.capability = ARM64_HAS_SB,
bd4fb6d270bc42 Will Deacon         2018-06-14  2662  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
bd4fb6d270bc42 Will Deacon         2018-06-14  2663  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2664  		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, SB, IMP)
bd4fb6d270bc42 Will Deacon         2018-06-14  2665  	},
6984eb47d5c1a7 Mark Rutland        2018-12-07  2666  #ifdef CONFIG_ARM64_PTR_AUTH
6984eb47d5c1a7 Mark Rutland        2018-12-07  2667  	{
be3256a086afb4 Vladimir Murzin     2022-02-24  2668  		.desc = "Address authentication (architected QARMA5 algorithm)",
be3256a086afb4 Vladimir Murzin     2022-02-24  2669  		.capability = ARM64_HAS_ADDRESS_AUTH_ARCH_QARMA5,
6982934e19f8eb Kristina Martsenko  2020-03-13  2670  		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
ba9d1d3e3e7c34 Amit Daniel Kachhap 2020-09-14  2671  		.matches = has_address_auth_cpucap,
863da0bdb17b5c Mark Brown          2023-04-12  2672  		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, APA, PAuth)
6984eb47d5c1a7 Mark Rutland        2018-12-07  2673  	},
def8c222f054d1 Vladimir Murzin     2022-02-24  2674  	{
def8c222f054d1 Vladimir Murzin     2022-02-24  2675  		.desc = "Address authentication (architected QARMA3 algorithm)",
def8c222f054d1 Vladimir Murzin     2022-02-24  2676  		.capability = ARM64_HAS_ADDRESS_AUTH_ARCH_QARMA3,
def8c222f054d1 Vladimir Murzin     2022-02-24  2677  		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
def8c222f054d1 Vladimir Murzin     2022-02-24  2678  		.matches = has_address_auth_cpucap,
863da0bdb17b5c Mark Brown          2023-04-12  2679  		ARM64_CPUID_FIELDS(ID_AA64ISAR2_EL1, APA3, PAuth)
def8c222f054d1 Vladimir Murzin     2022-02-24  2680  	},
6984eb47d5c1a7 Mark Rutland        2018-12-07  2681  	{
6984eb47d5c1a7 Mark Rutland        2018-12-07  2682  		.desc = "Address authentication (IMP DEF algorithm)",
6984eb47d5c1a7 Mark Rutland        2018-12-07  2683  		.capability = ARM64_HAS_ADDRESS_AUTH_IMP_DEF,
6982934e19f8eb Kristina Martsenko  2020-03-13  2684  		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
ba9d1d3e3e7c34 Amit Daniel Kachhap 2020-09-14  2685  		.matches = has_address_auth_cpucap,
863da0bdb17b5c Mark Brown          2023-04-12  2686  		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, API, PAuth)
cfef06bd0686a5 Kristina Martsenko  2020-03-13  2687  	},
cfef06bd0686a5 Kristina Martsenko  2020-03-13  2688  	{
cfef06bd0686a5 Kristina Martsenko  2020-03-13  2689  		.capability = ARM64_HAS_ADDRESS_AUTH,
6982934e19f8eb Kristina Martsenko  2020-03-13  2690  		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
ba9d1d3e3e7c34 Amit Daniel Kachhap 2020-09-14  2691  		.matches = has_address_auth_metacap,
6984eb47d5c1a7 Mark Rutland        2018-12-07  2692  	},
6984eb47d5c1a7 Mark Rutland        2018-12-07  2693  	{
be3256a086afb4 Vladimir Murzin     2022-02-24  2694  		.desc = "Generic authentication (architected QARMA5 algorithm)",
be3256a086afb4 Vladimir Murzin     2022-02-24  2695  		.capability = ARM64_HAS_GENERIC_AUTH_ARCH_QARMA5,
6984eb47d5c1a7 Mark Rutland        2018-12-07  2696  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
6984eb47d5c1a7 Mark Rutland        2018-12-07  2697  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2698  		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, GPA, IMP)
6984eb47d5c1a7 Mark Rutland        2018-12-07  2699  	},
def8c222f054d1 Vladimir Murzin     2022-02-24  2700  	{
def8c222f054d1 Vladimir Murzin     2022-02-24  2701  		.desc = "Generic authentication (architected QARMA3 algorithm)",
def8c222f054d1 Vladimir Murzin     2022-02-24  2702  		.capability = ARM64_HAS_GENERIC_AUTH_ARCH_QARMA3,
def8c222f054d1 Vladimir Murzin     2022-02-24  2703  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
def8c222f054d1 Vladimir Murzin     2022-02-24  2704  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2705  		ARM64_CPUID_FIELDS(ID_AA64ISAR2_EL1, GPA3, IMP)
def8c222f054d1 Vladimir Murzin     2022-02-24  2706  	},
6984eb47d5c1a7 Mark Rutland        2018-12-07  2707  	{
6984eb47d5c1a7 Mark Rutland        2018-12-07  2708  		.desc = "Generic authentication (IMP DEF algorithm)",
6984eb47d5c1a7 Mark Rutland        2018-12-07  2709  		.capability = ARM64_HAS_GENERIC_AUTH_IMP_DEF,
6984eb47d5c1a7 Mark Rutland        2018-12-07  2710  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
6984eb47d5c1a7 Mark Rutland        2018-12-07  2711  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2712  		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, GPI, IMP)
6984eb47d5c1a7 Mark Rutland        2018-12-07  2713  	},
cfef06bd0686a5 Kristina Martsenko  2020-03-13  2714  	{
cfef06bd0686a5 Kristina Martsenko  2020-03-13  2715  		.capability = ARM64_HAS_GENERIC_AUTH,
cfef06bd0686a5 Kristina Martsenko  2020-03-13  2716  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
cfef06bd0686a5 Kristina Martsenko  2020-03-13  2717  		.matches = has_generic_auth,
cfef06bd0686a5 Kristina Martsenko  2020-03-13  2718  	},
6984eb47d5c1a7 Mark Rutland        2018-12-07  2719  #endif /* CONFIG_ARM64_PTR_AUTH */
b90d2b22afdc7c Julien Thierry      2019-01-31  2720  #ifdef CONFIG_ARM64_PSEUDO_NMI
b90d2b22afdc7c Julien Thierry      2019-01-31  2721  	{
b90d2b22afdc7c Julien Thierry      2019-01-31  2722  		/*
b90d2b22afdc7c Julien Thierry      2019-01-31  2723  		 * Depends on having GICv3
b90d2b22afdc7c Julien Thierry      2019-01-31  2724  		 */
b90d2b22afdc7c Julien Thierry      2019-01-31  2725  		.desc = "IRQ priority masking",
c888b7bd916c4d Mark Rutland        2023-01-30  2726  		.capability = ARM64_HAS_GIC_PRIO_MASKING,
b90d2b22afdc7c Julien Thierry      2019-01-31  2727  		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
b90d2b22afdc7c Julien Thierry      2019-01-31  2728  		.matches = can_use_gic_priorities,
b90d2b22afdc7c Julien Thierry      2019-01-31  2729  	},
8bf0a8048b155e Mark Rutland        2023-01-30  2730  	{
8bf0a8048b155e Mark Rutland        2023-01-30  2731  		/*
8bf0a8048b155e Mark Rutland        2023-01-30  2732  		 * Depends on ARM64_HAS_GIC_PRIO_MASKING
8bf0a8048b155e Mark Rutland        2023-01-30  2733  		 */
8bf0a8048b155e Mark Rutland        2023-01-30  2734  		.capability = ARM64_HAS_GIC_PRIO_RELAXED_SYNC,
8bf0a8048b155e Mark Rutland        2023-01-30  2735  		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
8bf0a8048b155e Mark Rutland        2023-01-30  2736  		.matches = has_gic_prio_relaxed_sync,
b90d2b22afdc7c Julien Thierry      2019-01-31  2737  	},
3e6c69a058deaa Mark Brown          2019-12-09  2738  #endif
3e6c69a058deaa Mark Brown          2019-12-09  2739  #ifdef CONFIG_ARM64_E0PD
3e6c69a058deaa Mark Brown          2019-12-09  2740  	{
3e6c69a058deaa Mark Brown          2019-12-09  2741  		.desc = "E0PD",
3e6c69a058deaa Mark Brown          2019-12-09  2742  		.capability = ARM64_HAS_E0PD,
3e6c69a058deaa Mark Brown          2019-12-09  2743  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
3e6c69a058deaa Mark Brown          2019-12-09  2744  		.cpu_enable = cpu_enable_e0pd,
863da0bdb17b5c Mark Brown          2023-04-12  2745  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2746  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, E0PD, IMP)
3e6c69a058deaa Mark Brown          2019-12-09  2747  	},
bc206065944e2d Will Deacon         2020-01-22  2748  #endif
1a50ec0b3b2e9a Richard Henderson   2020-01-21  2749  	{
1a50ec0b3b2e9a Richard Henderson   2020-01-21  2750  		.desc = "Random Number Generator",
1a50ec0b3b2e9a Richard Henderson   2020-01-21  2751  		.capability = ARM64_HAS_RNG,
1a50ec0b3b2e9a Richard Henderson   2020-01-21  2752  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
1a50ec0b3b2e9a Richard Henderson   2020-01-21  2753  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2754  		ARM64_CPUID_FIELDS(ID_AA64ISAR0_EL1, RNDR, IMP)
1a50ec0b3b2e9a Richard Henderson   2020-01-21  2755  	},
8ef8f360cf30be Dave Martin         2020-03-16  2756  #ifdef CONFIG_ARM64_BTI
8ef8f360cf30be Dave Martin         2020-03-16  2757  	{
8ef8f360cf30be Dave Martin         2020-03-16  2758  		.desc = "Branch Target Identification",
8ef8f360cf30be Dave Martin         2020-03-16  2759  		.capability = ARM64_BTI,
c8027285e3660e Mark Brown          2020-05-06  2760  #ifdef CONFIG_ARM64_BTI_KERNEL
c8027285e3660e Mark Brown          2020-05-06  2761  		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
c8027285e3660e Mark Brown          2020-05-06  2762  #else
8ef8f360cf30be Dave Martin         2020-03-16  2763  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
c8027285e3660e Mark Brown          2020-05-06  2764  #endif
8ef8f360cf30be Dave Martin         2020-03-16  2765  		.matches = has_cpuid_feature,
8ef8f360cf30be Dave Martin         2020-03-16  2766  		.cpu_enable = bti_enable,
863da0bdb17b5c Mark Brown          2023-04-12  2767  		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, BT, IMP)
8ef8f360cf30be Dave Martin         2020-03-16  2768  	},
b90d2b22afdc7c Julien Thierry      2019-01-31  2769  #endif
3b714d24ef173f Vincenzo Frascino   2019-09-06  2770  #ifdef CONFIG_ARM64_MTE
3b714d24ef173f Vincenzo Frascino   2019-09-06  2771  	{
3b714d24ef173f Vincenzo Frascino   2019-09-06  2772  		.desc = "Memory Tagging Extension",
3b714d24ef173f Vincenzo Frascino   2019-09-06  2773  		.capability = ARM64_MTE,
3b714d24ef173f Vincenzo Frascino   2019-09-06  2774  		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
3b714d24ef173f Vincenzo Frascino   2019-09-06  2775  		.matches = has_cpuid_feature,
34bfeea4a9e9cd Catalin Marinas     2020-05-04  2776  		.cpu_enable = cpu_enable_mte,
863da0bdb17b5c Mark Brown          2023-04-12  2777  		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, MTE, MTE2)
3b714d24ef173f Vincenzo Frascino   2019-09-06  2778  	},
d73c162e073376 Vincenzo Frascino   2021-10-06  2779  	{
d73c162e073376 Vincenzo Frascino   2021-10-06  2780  		.desc = "Asymmetric MTE Tag Check Fault",
d73c162e073376 Vincenzo Frascino   2021-10-06  2781  		.capability = ARM64_MTE_ASYMM,
d73c162e073376 Vincenzo Frascino   2021-10-06  2782  		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
d73c162e073376 Vincenzo Frascino   2021-10-06  2783  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2784  		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, MTE, MTE3)
d73c162e073376 Vincenzo Frascino   2021-10-06  2785  	},
3b714d24ef173f Vincenzo Frascino   2019-09-06  2786  #endif /* CONFIG_ARM64_MTE */
364a5a8ae8dc2d Will Deacon         2020-06-30  2787  	{
364a5a8ae8dc2d Will Deacon         2020-06-30  2788  		.desc = "RCpc load-acquire (LDAPR)",
364a5a8ae8dc2d Will Deacon         2020-06-30  2789  		.capability = ARM64_HAS_LDAPR,
364a5a8ae8dc2d Will Deacon         2020-06-30  2790  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
364a5a8ae8dc2d Will Deacon         2020-06-30  2791  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2792  		ARM64_CPUID_FIELDS(ID_AA64ISAR1_EL1, LRCPC, IMP)
364a5a8ae8dc2d Will Deacon         2020-06-30  2793  	},
b206a708cbfb35 Mark Brown          2023-08-15  2794  	{
b206a708cbfb35 Mark Brown          2023-08-15  2795  		.desc = "Fine Grained Traps",
b206a708cbfb35 Mark Brown          2023-08-15  2796  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
b206a708cbfb35 Mark Brown          2023-08-15  2797  		.capability = ARM64_HAS_FGT,
b206a708cbfb35 Mark Brown          2023-08-15  2798  		.matches = has_cpuid_feature,
b206a708cbfb35 Mark Brown          2023-08-15  2799  		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, IMP)
b206a708cbfb35 Mark Brown          2023-08-15  2800  	},
5e64b862c4823a Mark Brown          2022-04-19  2801  #ifdef CONFIG_ARM64_SME
5e64b862c4823a Mark Brown          2022-04-19  2802  	{
5e64b862c4823a Mark Brown          2022-04-19  2803  		.desc = "Scalable Matrix Extension",
5e64b862c4823a Mark Brown          2022-04-19  2804  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
5e64b862c4823a Mark Brown          2022-04-19  2805  		.capability = ARM64_SME,
5e64b862c4823a Mark Brown          2022-04-19  2806  		.matches = has_cpuid_feature,
14567ba42c5747 Mark Rutland        2023-10-16  2807  		.cpu_enable = cpu_enable_sme,
863da0bdb17b5c Mark Brown          2023-04-12  2808  		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, SME, IMP)
5e64b862c4823a Mark Brown          2022-04-19  2809  	},
5e64b862c4823a Mark Brown          2022-04-19  2810  	/* FA64 should be sorted after the base SME capability */
5e64b862c4823a Mark Brown          2022-04-19  2811  	{
5e64b862c4823a Mark Brown          2022-04-19  2812  		.desc = "FA64",
5e64b862c4823a Mark Brown          2022-04-19  2813  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
5e64b862c4823a Mark Brown          2022-04-19  2814  		.capability = ARM64_SME_FA64,
5e64b862c4823a Mark Brown          2022-04-19  2815  		.matches = has_cpuid_feature,
14567ba42c5747 Mark Rutland        2023-10-16  2816  		.cpu_enable = cpu_enable_fa64,
863da0bdb17b5c Mark Brown          2023-04-12  2817  		ARM64_CPUID_FIELDS(ID_AA64SMFR0_EL1, FA64, IMP)
5e64b862c4823a Mark Brown          2022-04-19  2818  	},
d4913eee152d3f Mark Brown          2023-01-16  2819  	{
d4913eee152d3f Mark Brown          2023-01-16  2820  		.desc = "SME2",
d4913eee152d3f Mark Brown          2023-01-16  2821  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
d4913eee152d3f Mark Brown          2023-01-16  2822  		.capability = ARM64_SME2,
d4913eee152d3f Mark Brown          2023-01-16  2823  		.matches = has_cpuid_feature,
14567ba42c5747 Mark Rutland        2023-10-16  2824  		.cpu_enable = cpu_enable_sme2,
863da0bdb17b5c Mark Brown          2023-04-12  2825  		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, SME, SME2)
d4913eee152d3f Mark Brown          2023-01-16  2826  	},
5e64b862c4823a Mark Brown          2022-04-19  2827  #endif /* CONFIG_ARM64_SME */
06e0b802583d7b Marc Zyngier        2022-04-19  2828  	{
06e0b802583d7b Marc Zyngier        2022-04-19  2829  		.desc = "WFx with timeout",
06e0b802583d7b Marc Zyngier        2022-04-19  2830  		.capability = ARM64_HAS_WFXT,
06e0b802583d7b Marc Zyngier        2022-04-19  2831  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
06e0b802583d7b Marc Zyngier        2022-04-19  2832  		.matches = has_cpuid_feature,
863da0bdb17b5c Mark Brown          2023-04-12  2833  		ARM64_CPUID_FIELDS(ID_AA64ISAR2_EL1, WFxT, IMP)
06e0b802583d7b Marc Zyngier        2022-04-19  2834  	},
3a46b352a3e672 Kristina Martsenko  2022-06-22  2835  	{
3a46b352a3e672 Kristina Martsenko  2022-06-22  2836  		.desc = "Trap EL0 IMPLEMENTATION DEFINED functionality",
3a46b352a3e672 Kristina Martsenko  2022-06-22  2837  		.capability = ARM64_HAS_TIDCP1,
3a46b352a3e672 Kristina Martsenko  2022-06-22  2838  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
3a46b352a3e672 Kristina Martsenko  2022-06-22  2839  		.matches = has_cpuid_feature,
3a46b352a3e672 Kristina Martsenko  2022-06-22  2840  		.cpu_enable = cpu_trap_el0_impdef,
863da0bdb17b5c Mark Brown          2023-04-12  2841  		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, TIDCP1, IMP)
3a46b352a3e672 Kristina Martsenko  2022-06-22  2842  	},
01ab991fc0ee50 Ard Biesheuvel      2022-11-07  2843  	{
01ab991fc0ee50 Ard Biesheuvel      2022-11-07  2844  		.desc = "Data independent timing control (DIT)",
01ab991fc0ee50 Ard Biesheuvel      2022-11-07  2845  		.capability = ARM64_HAS_DIT,
01ab991fc0ee50 Ard Biesheuvel      2022-11-07  2846  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
01ab991fc0ee50 Ard Biesheuvel      2022-11-07  2847  		.matches = has_cpuid_feature,
01ab991fc0ee50 Ard Biesheuvel      2022-11-07  2848  		.cpu_enable = cpu_enable_dit,
863da0bdb17b5c Mark Brown          2023-04-12  2849  		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, DIT, IMP)
01ab991fc0ee50 Ard Biesheuvel      2022-11-07  2850  	},
b7564127ffcb1a Kristina Martsenko  2023-05-09  2851  	{
b7564127ffcb1a Kristina Martsenko  2023-05-09  2852  		.desc = "Memory Copy and Memory Set instructions",
b7564127ffcb1a Kristina Martsenko  2023-05-09  2853  		.capability = ARM64_HAS_MOPS,
b7564127ffcb1a Kristina Martsenko  2023-05-09  2854  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
b7564127ffcb1a Kristina Martsenko  2023-05-09  2855  		.matches = has_cpuid_feature,
b7564127ffcb1a Kristina Martsenko  2023-05-09  2856  		.cpu_enable = cpu_enable_mops,
b7564127ffcb1a Kristina Martsenko  2023-05-09  2857  		ARM64_CPUID_FIELDS(ID_AA64ISAR2_EL1, MOPS, IMP)
b7564127ffcb1a Kristina Martsenko  2023-05-09  2858  	},
2b760046a2d3d6 Joey Gouly          2023-06-06  2859  	{
2b760046a2d3d6 Joey Gouly          2023-06-06  2860  		.capability = ARM64_HAS_TCR2,
2b760046a2d3d6 Joey Gouly          2023-06-06  2861  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
2b760046a2d3d6 Joey Gouly          2023-06-06  2862  		.matches = has_cpuid_feature,
2b760046a2d3d6 Joey Gouly          2023-06-06  2863  		ARM64_CPUID_FIELDS(ID_AA64MMFR3_EL1, TCRX, IMP)
2b760046a2d3d6 Joey Gouly          2023-06-06  2864  	},
e43454c4423264 Joey Gouly          2023-06-06  2865  	{
e43454c4423264 Joey Gouly          2023-06-06  2866  		.desc = "Stage-1 Permission Indirection Extension (S1PIE)",
e43454c4423264 Joey Gouly          2023-06-06  2867  		.capability = ARM64_HAS_S1PIE,
e43454c4423264 Joey Gouly          2023-06-06  2868  		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
e43454c4423264 Joey Gouly          2023-06-06  2869  		.matches = has_cpuid_feature,
e43454c4423264 Joey Gouly          2023-06-06  2870  		ARM64_CPUID_FIELDS(ID_AA64MMFR3_EL1, S1PIE, IMP)
e43454c4423264 Joey Gouly          2023-06-06  2871  	},
e2d6c906f0ac69 Marc Zyngier        2023-06-09  2872  	{
e2d6c906f0ac69 Marc Zyngier        2023-06-09  2873  		.desc = "VHE for hypervisor only",
e2d6c906f0ac69 Marc Zyngier        2023-06-09  2874  		.capability = ARM64_KVM_HVHE,
e2d6c906f0ac69 Marc Zyngier        2023-06-09  2875  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
e2d6c906f0ac69 Marc Zyngier        2023-06-09  2876  		.matches = hvhe_possible,
e2d6c906f0ac69 Marc Zyngier        2023-06-09  2877  	},
c876c3f182a5cc Marc Zyngier        2023-05-15  2878  	{
c876c3f182a5cc Marc Zyngier        2023-05-15  2879  		.desc = "Enhanced Virtualization Traps",
c876c3f182a5cc Marc Zyngier        2023-05-15  2880  		.capability = ARM64_HAS_EVT,
c876c3f182a5cc Marc Zyngier        2023-05-15  2881  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
c876c3f182a5cc Marc Zyngier        2023-05-15  2882  		.matches = has_cpuid_feature,
ce33cea5d833c2 Mark Brown          2023-07-18  2883  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
c876c3f182a5cc Marc Zyngier        2023-05-15  2884  	},
b1366d21daaebb Ryan Roberts        2023-11-27  2885  	{
b1366d21daaebb Ryan Roberts        2023-11-27  2886  		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
b1366d21daaebb Ryan Roberts        2023-11-27  2887  		.capability = ARM64_HAS_LPA2,
b1366d21daaebb Ryan Roberts        2023-11-27  2888  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
b1366d21daaebb Ryan Roberts        2023-11-27  2889  		.matches = has_lpa2,
b1366d21daaebb Ryan Roberts        2023-11-27  2890  	},
203f2b95a882dc Mark Brown          2024-03-06  2891  	{
203f2b95a882dc Mark Brown          2024-03-06  2892  		.desc = "FPMR",
203f2b95a882dc Mark Brown          2024-03-06  2893  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
203f2b95a882dc Mark Brown          2024-03-06  2894  		.capability = ARM64_HAS_FPMR,
203f2b95a882dc Mark Brown          2024-03-06  2895  		.matches = has_cpuid_feature,
203f2b95a882dc Mark Brown          2024-03-06  2896  		.cpu_enable = cpu_enable_fpmr,
203f2b95a882dc Mark Brown          2024-03-06  2897  		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, FPMR, IMP)
203f2b95a882dc Mark Brown          2024-03-06  2898  	},
9cce9c6c2c3b7d Ard Biesheuvel      2024-02-14  2899  #ifdef CONFIG_ARM64_VA_BITS_52
9cce9c6c2c3b7d Ard Biesheuvel      2024-02-14  2900  	{
9cce9c6c2c3b7d Ard Biesheuvel      2024-02-14  2901  		.capability = ARM64_HAS_VA52,
9cce9c6c2c3b7d Ard Biesheuvel      2024-02-14  2902  		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
352b0395b5053f Ard Biesheuvel      2024-02-14  2903  		.matches = has_cpuid_feature,
352b0395b5053f Ard Biesheuvel      2024-02-14  2904  #ifdef CONFIG_ARM64_64K_PAGES
352b0395b5053f Ard Biesheuvel      2024-02-14  2905  		.desc = "52-bit Virtual Addressing (LVA)",
2aea7b77aabc70 Marc Zyngier        2024-02-19  2906  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, VARange, 52)
352b0395b5053f Ard Biesheuvel      2024-02-14  2907  #else
352b0395b5053f Ard Biesheuvel      2024-02-14  2908  		.desc = "52-bit Virtual Addressing (LPA2)",
352b0395b5053f Ard Biesheuvel      2024-02-14  2909  #ifdef CONFIG_ARM64_4K_PAGES
2aea7b77aabc70 Marc Zyngier        2024-02-19  2910  		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, TGRAN4, 52_BIT)
352b0395b5053f Ard Biesheuvel      2024-02-14  2911  #else
2aea7b77aabc70 Marc Zyngier        2024-02-19  2912  		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, TGRAN16, 52_BIT)
352b0395b5053f Ard Biesheuvel      2024-02-14  2913  #endif
352b0395b5053f Ard Biesheuvel      2024-02-14  2914  #endif
66e08b376a3230 James Morse         2018-07-02  2915  #endif
66e08b376a3230 James Morse         2018-07-02  2916  #ifdef CONFIG_ARM64_MPAM
66e08b376a3230 James Morse         2018-07-02  2917  	{
66e08b376a3230 James Morse         2018-07-02  2918  		.desc = "Memory Partitioning And Monitoring",
66e08b376a3230 James Morse         2018-07-02  2919  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
66e08b376a3230 James Morse         2018-07-02  2920  		.capability = ARM64_MPAM,
66e08b376a3230 James Morse         2018-07-02  2921  		.matches = test_has_mpam,
66e08b376a3230 James Morse         2018-07-02  2922  		.cpu_enable = cpu_enable_mpam,
66e08b376a3230 James Morse         2018-07-02  2923  		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, MPAM, 1)
9cce9c6c2c3b7d Ard Biesheuvel      2024-02-14  2924  	},
9cce9c6c2c3b7d Ard Biesheuvel      2024-02-14  2925  #endif
da9af5071b25cb Marc Zyngier        2024-01-22  2926  	{
da9af5071b25cb Marc Zyngier        2024-01-22  2927  		.desc = "NV1",
da9af5071b25cb Marc Zyngier        2024-01-22  2928  		.capability = ARM64_HAS_HCR_NV1,
da9af5071b25cb Marc Zyngier        2024-01-22  2929  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
da9af5071b25cb Marc Zyngier        2024-01-22  2930  		.matches = has_nv1,
da9af5071b25cb Marc Zyngier        2024-01-22  2931  		ARM64_CPUID_FIELDS_NEG(ID_AA64MMFR4_EL1, E2H0, NI_NV1)
da9af5071b25cb Marc Zyngier        2024-01-22  2932  	},
359b706473b47d Marc Zyngier        2015-03-27  2933  	{},
359b706473b47d Marc Zyngier        2015-03-27 @2934  };
359b706473b47d Marc Zyngier        2015-03-27  2935  

:::::: The code at line 2934 was first introduced by commit
:::::: 359b706473b47da3c93bd99fd10d798fe411ab67 arm64: Extract feature parsing code from cpu_errata.c

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
