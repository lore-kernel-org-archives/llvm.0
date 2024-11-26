Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70F61B87C2;
	Tue, 26 Nov 2024 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732628356; cv=none; b=LLcca9yhVgbjsGxIitv4x10cLehSQ6TGpwekZ3AV2ACcmuWUbf7DNWB+MZeZiVwnZ4SzWy02ZJ08kPtjhG4lwhpDJxnqAPGIJUSU7uLHMNlz8n3PxrrAPAldV4pnUnY/M6+iUa7SvvyBpaoZC39b6K/D3kV4d4/FIwExL7jDRoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732628356; c=relaxed/simple;
	bh=XOQF0SQza+qfIkM+y+ceC9wzyV8uNlxxsKSK7RKJy5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YtrfGSIelFUiFVVq16CwPqF/BhK1QHrIPtYl4+/fHBddoHTvvHWowfqwR7utCA/aWX24IImvBCuanMOwWO1fKYCtaLb0W43J6qBYcC8AG0VLFrA+3/hEI+lkZGk0o/1tWzZK4hUZ7KajcvgCMGm7p7DYa9hnkUupIIpg5hQfXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQgN64J0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQgN64J0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732628355; x=1764164355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XOQF0SQza+qfIkM+y+ceC9wzyV8uNlxxsKSK7RKJy5c=;
  b=aQgN64J0jeABovC4v8N52swJ6pnGQb+p50ODgzxhiddogkrUHTKT3LMg
   UP/esvrMlHGxpMhO3NJt5kucrSNcmb/vnRqg14vEXbut6Y+QkUOQgVwbb
   tpJlpd0fnl23a/nzx6dMghQBIrcM0qsrT2G+bj8HkkWRH7h1BqoVx6+S1
   7xpLjG9TnQQghyp0f3f3OBTXBZCh2zwOLu42NcTif1sGErt5OKp5QHVGK
   p3Iznt0uvjEQ7XI/FQuBw2c8oDMLktOGv54nhjTv8KbH1A7HCCW+3QZ1S
   jbDfjKTyDb0052GPMSGPLGK2toO4XswR7xifnZc5oLrruRqinCXfkei5j
   g==;
X-CSE-ConnectionGUID: VyBEugPUTWOrkyliJMPI2g==
X-CSE-MsgGUID: HhAO+drZSUaQAUkEyMFVDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36451038"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="36451038"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 05:39:09 -0800
X-CSE-ConnectionGUID: T5pMbCXNS/23eJsxeAPypg==
X-CSE-MsgGUID: rZ21nDiXTNS15Ji3aLPPzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="92022500"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Nov 2024 05:39:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFvmS-0007JR-1P;
	Tue, 26 Nov 2024 13:39:04 +0000
Date: Tue, 26 Nov 2024 21:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guest_cpufeatures 56/60] arch/x86/kvm/cpuid.c:842:3:
 error: use of undeclared identifier 'X86_FEATURE_7'
Message-ID: <202411262124.0It9Nce6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/guest_cpufeatures
head:   1bc43ac6e3ebb05bb7cf78e0da5ea9009c9d963f
commit: 5a0b230804678a2841b6ce4a072651976a7b7c7f [56/60] KVM: x86: Explicitly track feature flags that require vendor enabling
config: i386-buildonly-randconfig-005-20241126 (https://download.01.org/0day-ci/archive/20241126/202411262124.0It9Nce6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411262124.0It9Nce6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411262124.0It9Nce6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/cpuid.c:13:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/kvm/cpuid.c:842:3: error: use of undeclared identifier 'X86_FEATURE_7'
     842 |                 VENDOR_F(DS) |
         |                 ^
   arch/x86/kvm/cpuid.c:767:2: note: expanded from macro 'VENDOR_F'
     767 |         KVM_VALIDATE_CPU_CAP_USAGE(name);                       \
         |         ^
   arch/x86/kvm/cpuid.c:691:30: note: expanded from macro 'KVM_VALIDATE_CPU_CAP_USAGE'
     691 |         u32 __leaf = __feature_leaf(X86_FEATURE_##name);                \
         |                                     ^
   <scratch space>:61:1: note: expanded from here
      61 | X86_FEATURE_7
         | ^
   1 warning and 1 error generated.


vim +/X86_FEATURE_7 +842 arch/x86/kvm/cpuid.c

   776	
   777	void kvm_set_cpu_caps(void)
   778	{
   779		memset(kvm_cpu_caps, 0, sizeof(kvm_cpu_caps));
   780	
   781		BUILD_BUG_ON(sizeof(kvm_cpu_caps) - (NKVMCAPINTS * sizeof(*kvm_cpu_caps)) >
   782			     sizeof(boot_cpu_data.x86_capability));
   783	
   784		kvm_cpu_cap_init(CPUID_1_ECX,
   785			F(XMM3) |
   786			F(PCLMULQDQ) |
   787			VENDOR_F(DTES64) |
   788			/*
   789			 * NOTE: MONITOR (and MWAIT) are emulated as NOP, but *not*
   790			 * advertised to guests via CPUID!
   791			 */
   792			0 /* MONITOR */ |
   793			VENDOR_F(VMX) |
   794			0 /* DS-CPL, SMX, EST */ |
   795			0 /* TM2 */ |
   796			F(SSSE3) |
   797			0 /* CNXT-ID */ |
   798			0 /* Reserved */ |
   799			F(FMA) |
   800			F(CX16) |
   801			0 /* xTPR Update */ |
   802			F(PDCM) |
   803			F(PCID) |
   804			0 /* Reserved, DCA */ |
   805			F(XMM4_1) |
   806			F(XMM4_2) |
   807			EMULATED_F(X2APIC) |
   808			F(MOVBE) |
   809			F(POPCNT) |
   810			EMULATED_F(TSC_DEADLINE_TIMER) |
   811			F(AES) |
   812			F(XSAVE) |
   813			0 /* OSXSAVE */ |
   814			F(AVX) |
   815			F(F16C) |
   816			F(RDRAND) |
   817			EMULATED_F(HYPERVISOR)
   818		);
   819	
   820		kvm_cpu_cap_init(CPUID_1_EDX,
   821			F(FPU) |
   822			F(VME) |
   823			F(DE) |
   824			F(PSE) |
   825			F(TSC) |
   826			F(MSR) |
   827			F(PAE) |
   828			F(MCE) |
   829			F(CX8) |
   830			F(APIC) |
   831			0 /* Reserved */ |
   832			F(SEP) |
   833			F(MTRR) |
   834			F(PGE) |
   835			F(MCA) |
   836			F(CMOV) |
   837			F(PAT) |
   838			F(PSE36) |
   839			0 /* PSN */ |
   840			F(CLFLUSH) |
   841			0 /* Reserved */ |
 > 842			VENDOR_F(DS) |
   843			0 /* ACPI */ |
   844			F(MMX) |
   845			F(FXSR) |
   846			F(XMM) |
   847			F(XMM2) |
   848			F(SELFSNOOP) |
   849			0 /* HTT, TM, Reserved, PBE */
   850		);
   851	
   852		kvm_cpu_cap_init(CPUID_7_0_EBX,
   853			F(FSGSBASE) |
   854			EMULATED_F(TSC_ADJUST) |
   855			F(SGX) |
   856			F(BMI1) |
   857			F(HLE) |
   858			F(AVX2) |
   859			F(FDP_EXCPTN_ONLY) |
   860			F(SMEP) |
   861			F(BMI2) |
   862			F(ERMS) |
   863			F(INVPCID) |
   864			F(RTM) |
   865			F(ZERO_FCS_FDS) |
   866			VENDOR_F(MPX) |
   867			F(AVX512F) |
   868			F(AVX512DQ) |
   869			F(RDSEED) |
   870			F(ADX) |
   871			F(SMAP) |
   872			F(AVX512IFMA) |
   873			F(CLFLUSHOPT) |
   874			F(CLWB) |
   875			VENDOR_F(INTEL_PT) |
   876			F(AVX512PF) |
   877			F(AVX512ER) |
   878			F(AVX512CD) |
   879			F(SHA_NI) |
   880			F(AVX512BW) |
   881			F(AVX512VL));
   882	
   883		kvm_cpu_cap_init(CPUID_7_ECX,
   884			F(AVX512VBMI) |
   885			PASSTHROUGH_F(LA57) |
   886			F(PKU) |
   887			0 /*OSPKE*/ |
   888			F(RDPID) |
   889			F(AVX512_VPOPCNTDQ) |
   890			F(UMIP) |
   891			F(AVX512_VBMI2) |
   892			F(GFNI) |
   893			F(VAES) |
   894			F(VPCLMULQDQ) |
   895			F(AVX512_VNNI) |
   896			F(AVX512_BITALG) |
   897			F(CLDEMOTE) |
   898			F(MOVDIRI) |
   899			F(MOVDIR64B) |
   900			VENDOR_F(WAITPKG) |
   901			F(SGX_LC) |
   902			F(BUS_LOCK_DETECT)
   903		);
   904	
   905		/*
   906		 * PKU not yet implemented for shadow paging and requires OSPKE
   907		 * to be set on the host. Clear it if that is not the case
   908		 */
   909		if (!tdp_enabled || !boot_cpu_has(X86_FEATURE_OSPKE))
   910			kvm_cpu_cap_clear(X86_FEATURE_PKU);
   911	
   912		kvm_cpu_cap_init(CPUID_7_EDX,
   913			F(AVX512_4VNNIW) |
   914			F(AVX512_4FMAPS) |
   915			F(SPEC_CTRL) |
   916			F(SPEC_CTRL_SSBD) |
   917			EMULATED_F(ARCH_CAPABILITIES) |
   918			F(INTEL_STIBP) |
   919			F(MD_CLEAR) |
   920			F(AVX512_VP2INTERSECT) |
   921			F(FSRM) |
   922			F(SERIALIZE) |
   923			F(TSXLDTRK) |
   924			F(AVX512_FP16) |
   925			F(AMX_TILE) |
   926			F(AMX_INT8) |
   927			F(AMX_BF16) |
   928			F(FLUSH_L1D)
   929		);
   930	
   931		if (boot_cpu_has(X86_FEATURE_AMD_IBPB_RET) &&
   932		    boot_cpu_has(X86_FEATURE_AMD_IBPB) &&
   933		    boot_cpu_has(X86_FEATURE_AMD_IBRS))
   934			kvm_cpu_cap_set(X86_FEATURE_SPEC_CTRL);
   935		if (boot_cpu_has(X86_FEATURE_STIBP))
   936			kvm_cpu_cap_set(X86_FEATURE_INTEL_STIBP);
   937		if (boot_cpu_has(X86_FEATURE_AMD_SSBD))
   938			kvm_cpu_cap_set(X86_FEATURE_SPEC_CTRL_SSBD);
   939	
   940		kvm_cpu_cap_init(CPUID_7_1_EAX,
   941			F(SHA512) |
   942			F(SM3) |
   943			F(SM4) |
   944			F(AVX_VNNI) |
   945			F(AVX512_BF16) |
   946			F(CMPCCXADD) |
   947			F(FZRM) |
   948			F(FSRS) |
   949			F(FSRC) |
   950			F(AMX_FP16) |
   951			F(AVX_IFMA) |
   952			F(LAM)
   953		);
   954	
   955		kvm_cpu_cap_init(CPUID_7_1_EDX,
   956			F(AVX_VNNI_INT8) |
   957			F(AVX_NE_CONVERT) |
   958			F(AMX_COMPLEX) |
   959			F(AVX_VNNI_INT16) |
   960			F(PREFETCHITI) |
   961			F(AVX10)
   962		);
   963	
   964		kvm_cpu_cap_init(CPUID_7_2_EDX,
   965			F(INTEL_PSFD) |
   966			F(IPRED_CTRL) |
   967			F(RRSBA_CTRL) |
   968			F(DDPD_U) |
   969			F(BHI_CTRL) |
   970			F(MCDT_NO)
   971		);
   972	
   973		kvm_cpu_cap_init(CPUID_D_1_EAX,
   974			F(XSAVEOPT) |
   975			F(XSAVEC) |
   976			F(XGETBV1) |
   977			F(XSAVES) |
   978			X86_64_F(XFD)
   979		);
   980	
   981		kvm_cpu_cap_init(CPUID_12_EAX,
   982			SCATTERED_F(SGX1) |
   983			SCATTERED_F(SGX2) |
   984			SCATTERED_F(SGX_EDECCSSA)
   985		);
   986	
   987		kvm_cpu_cap_init(CPUID_24_0_EBX,
   988			F(AVX10_128) |
   989			F(AVX10_256) |
   990			F(AVX10_512)
   991		);
   992	
   993		kvm_cpu_cap_init(CPUID_8000_0001_ECX,
   994			F(LAHF_LM) |
   995			F(CMP_LEGACY) |
   996			VENDOR_F(SVM) |
   997			0 /* ExtApicSpace */ |
   998			F(CR8_LEGACY) |
   999			F(ABM) |
  1000			F(SSE4A) |
  1001			F(MISALIGNSSE) |
  1002			F(3DNOWPREFETCH) |
  1003			F(OSVW) |
  1004			0 /* IBS */ |
  1005			F(XOP) |
  1006			0 /* SKINIT, WDT, LWP */ |
  1007			F(FMA4) |
  1008			F(TBM) |
  1009			F(TOPOEXT) |
  1010			VENDOR_F(PERFCTR_CORE)
  1011		);
  1012	
  1013		kvm_cpu_cap_init(CPUID_8000_0001_EDX,
  1014			ALIASED_1_EDX_F(FPU) |
  1015			ALIASED_1_EDX_F(VME) |
  1016			ALIASED_1_EDX_F(DE) |
  1017			ALIASED_1_EDX_F(PSE) |
  1018			ALIASED_1_EDX_F(TSC) |
  1019			ALIASED_1_EDX_F(MSR) |
  1020			ALIASED_1_EDX_F(PAE) |
  1021			ALIASED_1_EDX_F(MCE) |
  1022			ALIASED_1_EDX_F(CX8) |
  1023			ALIASED_1_EDX_F(APIC) |
  1024			0 /* Reserved */ |
  1025			F(SYSCALL) |
  1026			ALIASED_1_EDX_F(MTRR) |
  1027			ALIASED_1_EDX_F(PGE) |
  1028			ALIASED_1_EDX_F(MCA) |
  1029			ALIASED_1_EDX_F(CMOV) |
  1030			ALIASED_1_EDX_F(PAT) |
  1031			ALIASED_1_EDX_F(PSE36) |
  1032			0 /* Reserved */ |
  1033			F(NX) |
  1034			0 /* Reserved */ |
  1035			F(MMXEXT) |
  1036			ALIASED_1_EDX_F(MMX) |
  1037			ALIASED_1_EDX_F(FXSR) |
  1038			F(FXSR_OPT) |
  1039			X86_64_F(GBPAGES) |
  1040			F(RDTSCP) |
  1041			0 /* Reserved */ |
  1042			X86_64_F(LM) |
  1043			F(3DNOWEXT) |
  1044			F(3DNOW)
  1045		);
  1046	
  1047		if (!tdp_enabled && IS_ENABLED(CONFIG_X86_64))
  1048			kvm_cpu_cap_set(X86_FEATURE_GBPAGES);
  1049	
  1050		kvm_cpu_cap_init(CPUID_8000_0007_EDX,
  1051			SCATTERED_F(CONSTANT_TSC)
  1052		);
  1053	
  1054		kvm_cpu_cap_init(CPUID_8000_0008_EBX,
  1055			F(CLZERO) |
  1056			F(XSAVEERPTR) |
  1057			F(WBNOINVD) |
  1058			F(AMD_IBPB) |
  1059			F(AMD_IBRS) |
  1060			F(AMD_SSBD) |
  1061			F(VIRT_SSBD) |
  1062			F(AMD_SSB_NO) |
  1063			F(AMD_STIBP) |
  1064			F(AMD_STIBP_ALWAYS_ON) |
  1065			F(AMD_PSFD) |
  1066			F(AMD_IBPB_RET)
  1067		);
  1068	
  1069		/*
  1070		 * AMD has separate bits for each SPEC_CTRL bit.
  1071		 * arch/x86/kernel/cpu/bugs.c is kind enough to
  1072		 * record that in cpufeatures so use them.
  1073		 */
  1074		if (boot_cpu_has(X86_FEATURE_IBPB)) {
  1075			kvm_cpu_cap_set(X86_FEATURE_AMD_IBPB);
  1076			if (boot_cpu_has(X86_FEATURE_SPEC_CTRL) &&
  1077			    !boot_cpu_has_bug(X86_BUG_EIBRS_PBRSB))
  1078				kvm_cpu_cap_set(X86_FEATURE_AMD_IBPB_RET);
  1079		}
  1080		if (boot_cpu_has(X86_FEATURE_IBRS))
  1081			kvm_cpu_cap_set(X86_FEATURE_AMD_IBRS);
  1082		if (boot_cpu_has(X86_FEATURE_STIBP))
  1083			kvm_cpu_cap_set(X86_FEATURE_AMD_STIBP);
  1084		if (boot_cpu_has(X86_FEATURE_SPEC_CTRL_SSBD))
  1085			kvm_cpu_cap_set(X86_FEATURE_AMD_SSBD);
  1086		if (!boot_cpu_has_bug(X86_BUG_SPEC_STORE_BYPASS))
  1087			kvm_cpu_cap_set(X86_FEATURE_AMD_SSB_NO);
  1088		/*
  1089		 * The preference is to use SPEC CTRL MSR instead of the
  1090		 * VIRT_SPEC MSR.
  1091		 */
  1092		if (boot_cpu_has(X86_FEATURE_LS_CFG_SSBD) &&
  1093		    !boot_cpu_has(X86_FEATURE_AMD_SSBD))
  1094			kvm_cpu_cap_set(X86_FEATURE_VIRT_SSBD);
  1095	
  1096		/* All SVM features required additional vendor module enabling. */
  1097		kvm_cpu_cap_init(CPUID_8000_000A_EDX,
  1098			VENDOR_F(NPT) |
  1099			VENDOR_F(VMCBCLEAN) |
  1100			VENDOR_F(FLUSHBYASID) |
  1101			VENDOR_F(NRIPS) |
  1102			VENDOR_F(TSCRATEMSR) |
  1103			VENDOR_F(V_VMSAVE_VMLOAD) |
  1104			VENDOR_F(LBRV) |
  1105			VENDOR_F(PAUSEFILTER) |
  1106			VENDOR_F(PFTHRESHOLD) |
  1107			VENDOR_F(VGIF) |
  1108			VENDOR_F(VNMI) |
  1109			VENDOR_F(SVME_ADDR_CHK)
  1110		);
  1111	
  1112		kvm_cpu_cap_init(CPUID_8000_001F_EAX,
  1113			VENDOR_F(SME) |
  1114			VENDOR_F(SEV) |
  1115			0 /* VM_PAGE_FLUSH */ |
  1116			VENDOR_F(SEV_ES) |
  1117			F(SME_COHERENT)
  1118		);
  1119	
  1120		kvm_cpu_cap_init(CPUID_8000_0021_EAX,
  1121			F(NO_NESTED_DATA_BP) |
  1122			/*
  1123			 * Synthesize "LFENCE is serializing" into the AMD-defined entry
  1124			 * in KVM's supported CPUID, i.e. if the feature is reported as
  1125			 * supported by the kernel.  LFENCE_RDTSC was a Linux-defined
  1126			 * synthetic feature long before AMD joined the bandwagon, e.g.
  1127			 * LFENCE is serializing on most CPUs that support SSE2.  On
  1128			 * CPUs that don't support AMD's leaf, ANDing with the raw host
  1129			 * CPUID will drop the flags, and reporting support in AMD's
  1130			 * leaf can make it easier for userspace to detect the feature.
  1131			 */
  1132			SYNTHESIZED_F(LFENCE_RDTSC) |
  1133			0 /* SmmPgCfgLock */ |
  1134			F(NULL_SEL_CLR_BASE) |
  1135			F(AUTOIBRS) |
  1136			EMULATED_F(NO_SMM_CTL_MSR) |
  1137			0 /* PrefetchCtlMsr */ |
  1138			F(WRMSR_XX_BASE_NS) |
  1139			SYNTHESIZED_F(SBPB) |
  1140			SYNTHESIZED_F(IBPB_BRTYPE) |
  1141			SYNTHESIZED_F(SRSO_NO)
  1142		);
  1143	
  1144		kvm_cpu_cap_init(CPUID_8000_0022_EAX,
  1145			F(PERFMON_V2)
  1146		);
  1147	
  1148		if (!static_cpu_has_bug(X86_BUG_NULL_SEG))
  1149			kvm_cpu_cap_set(X86_FEATURE_NULL_SEL_CLR_BASE);
  1150	
  1151		kvm_cpu_cap_init(CPUID_C000_0001_EDX,
  1152			F(XSTORE) |
  1153			F(XSTORE_EN) |
  1154			F(XCRYPT) |
  1155			F(XCRYPT_EN) |
  1156			F(ACE2) |
  1157			F(ACE2_EN) |
  1158			F(PHE) |
  1159			F(PHE_EN) |
  1160			F(PMM) |
  1161			F(PMM_EN)
  1162		);
  1163	
  1164		/*
  1165		 * Hide RDTSCP and RDPID if either feature is reported as supported but
  1166		 * probing MSR_TSC_AUX failed.  This is purely a sanity check and
  1167		 * should never happen, but the guest will likely crash if RDTSCP or
  1168		 * RDPID is misreported, and KVM has botched MSR_TSC_AUX emulation in
  1169		 * the past.  For example, the sanity check may fire if this instance of
  1170		 * KVM is running as L1 on top of an older, broken KVM.
  1171		 */
  1172		if (WARN_ON((kvm_cpu_cap_has(X86_FEATURE_RDTSCP) ||
  1173			     kvm_cpu_cap_has(X86_FEATURE_RDPID)) &&
  1174			     !kvm_is_supported_user_return_msr(MSR_TSC_AUX))) {
  1175			kvm_cpu_cap_clear(X86_FEATURE_RDTSCP);
  1176			kvm_cpu_cap_clear(X86_FEATURE_RDPID);
  1177		}
  1178	}
  1179	EXPORT_SYMBOL_GPL(kvm_set_cpu_caps);
  1180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
