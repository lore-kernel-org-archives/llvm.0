Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5A200BD;
	Thu,  3 Aug 2023 14:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691071771; x=1722607771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oEWKjkJ6HVvpZ65l3Le2wL6xq336wjjshWphPPiyjF8=;
  b=DvDQ/ZBd5ehACSM9B48znhxvTv80erwlkt38WfpsU2H7vG2sRi85oRGE
   Y1J1RdOpT2No4ntanLQCSz5Dk+2a9pHNGJNPAKvRJV4zTfw+IsfLAWDRT
   +G0PFuBEw09jFuldtCl/Yco6m2oMNsNJjrlmPaZs1yjNWy3WTsiDR5QLS
   dZsa49umez1AZhlpV3/QOZWh8ZdpxDmorro5vnmYF2QCeJzbKBddRsRFT
   P4nOIBGYvv82+5Ejdix3+BI2UudS3RRIphpodYUueDUNfiWgsJMzSL2cr
   8QWSVWR10YyhLwWNpWARnvwtl+X6p8WCKq7Di2QzygrJGO5Bmpk+w9HIN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="367341643"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="367341643"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 07:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="799567599"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="799567599"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Aug 2023 07:09:29 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRZ16-00028x-0v;
	Thu, 03 Aug 2023 14:09:28 +0000
Date: Thu, 3 Aug 2023 22:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 3/4]
 arch/arm64/kernel/cpufeature_impdef.c:11:6: warning: no previous prototype
 for function 'has_tso_fixed'
Message-ID: <202308032238.YGGL6y3j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   6a8bd3529f0e9a26ebabd614ab6582cda3337142
commit: 2a13d04cf14b7cb9432177840c840fb42fb411a6 [3/4] arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs
config: arm64-randconfig-r021-20230731 (https://download.01.org/0day-ci/archive/20230803/202308032238.YGGL6y3j-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308032238.YGGL6y3j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308032238.YGGL6y3j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature_impdef.c:11:6: warning: no previous prototype for function 'has_tso_fixed' [-Wmissing-prototypes]
   bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
        ^
   arch/arm64/kernel/cpufeature_impdef.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
   ^
   static 
>> arch/arm64/kernel/cpufeature_impdef.c:36:13: warning: no previous prototype for function 'init_cpu_hwcaps_indirect_list_impdef' [-Wmissing-prototypes]
   void __init init_cpu_hwcaps_indirect_list_impdef(void)
               ^
   arch/arm64/kernel/cpufeature_impdef.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init init_cpu_hwcaps_indirect_list_impdef(void)
   ^
   static 
   2 warnings generated.
--
>> arch/arm64/kernel/cpufeature.c:959:1: warning: no previous prototype for function 'init_cpu_hwcaps_indirect_list_from_array' [-Wmissing-prototypes]
   init_cpu_hwcaps_indirect_list_from_array(const struct arm64_cpu_capabilities *caps)
   ^
   arch/arm64/kernel/cpufeature.c:958:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init
   ^
   static 
>> arch/arm64/kernel/cpufeature.c:1428:1: warning: no previous prototype for function 'feature_matches' [-Wmissing-prototypes]
   feature_matches(u64 reg, const struct arm64_cpu_capabilities *entry)
   ^
   arch/arm64/kernel/cpufeature.c:1427:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool
   ^
   static 
   2 warnings generated.


vim +/has_tso_fixed +11 arch/arm64/kernel/cpufeature_impdef.c

    10	
  > 11	bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
    12	{
    13		/* List of CPUs that always use the TSO memory model */
    14		static const struct midr_range fixed_tso_list[] = {
    15			MIDR_ALL_VERSIONS(MIDR_NVIDIA_DENVER),
    16			MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
    17			MIDR_ALL_VERSIONS(MIDR_FUJITSU_A64FX),
    18			{ /* sentinel */ }
    19		};
    20	
    21		return is_midr_in_range_list(read_cpuid_id(), fixed_tso_list);
    22	}
    23	
    24	static const struct arm64_cpu_capabilities arm64_impdef_features[] = {
    25	#ifdef CONFIG_ARM64_MEMORY_MODEL_CONTROL
    26		{
    27			.desc = "TSO memory model (Fixed)",
    28			.capability = ARM64_HAS_TSO_FIXED,
    29			.type = ARM64_CPUCAP_SYSTEM_FEATURE,
    30			.matches = has_tso_fixed,
    31		},
    32	#endif
    33		{},
    34	};
    35	
  > 36	void __init init_cpu_hwcaps_indirect_list_impdef(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
