Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38C5168B9;
	Wed, 16 Aug 2023 18:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692209387; x=1723745387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QQh55dXAQhnU798Gceylkp53FVOkeS6Ogu7sr0aNLTA=;
  b=nOn93FV3AOtcnZ/0CP25deOpAKKMVPGQyT+P7MAzqDSMtdjiuwFLU7eM
   sGYrJDBNiVpeaHoFBoF9L3sxlhegOjjG7ZhD628r4gKMqwYW0pWCBr27a
   97HzzTk2YS5QAUlJ5z+hGWCje4F4ihjzIU7QCuPa/iQJ9NiFPohvzFWKk
   Mr3Szp4smgIoPytya70a0aMS3DsWwc3td2WyK+PaRW5b92qnOEfoteIX1
   6h1ckLI66BJuQWwU2SOa1TOA47eaoc/I/Zoq4QUxdImjuXWC7t7OV8YHi
   NqLjoCfsPJGyHXwse28jSJlUQPb8Z4BysSGIZyLZTmCfEYy73TUirWBcw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352190489"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="352190489"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 11:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1064939782"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="1064939782"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Aug 2023 11:09:45 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWKxk-0000UH-2r;
	Wed, 16 Aug 2023 18:09:44 +0000
Date: Thu, 17 Aug 2023 02:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 3/4]
 arch/arm64/kernel/cpufeature_impdef.c:11:6: warning: no previous prototype
 for function 'has_tso_fixed'
Message-ID: <202308170117.vXBT0Pwa-lkp@intel.com>
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
config: arm64-randconfig-r011-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170117.vXBT0Pwa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170117.vXBT0Pwa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170117.vXBT0Pwa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature_impdef.c:11:6: warning: no previous prototype for function 'has_tso_fixed' [-Wmissing-prototypes]
      11 | bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
         |      ^
   arch/arm64/kernel/cpufeature_impdef.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      11 | bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
         | ^
         | static 
>> arch/arm64/kernel/cpufeature_impdef.c:36:13: warning: no previous prototype for function 'init_cpu_hwcaps_indirect_list_impdef' [-Wmissing-prototypes]
      36 | void __init init_cpu_hwcaps_indirect_list_impdef(void)
         |             ^
   arch/arm64/kernel/cpufeature_impdef.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      36 | void __init init_cpu_hwcaps_indirect_list_impdef(void)
         | ^
         | static 
   2 warnings generated.
--
>> arch/arm64/kernel/cpufeature.c:959:1: warning: no previous prototype for function 'init_cpu_hwcaps_indirect_list_from_array' [-Wmissing-prototypes]
     959 | init_cpu_hwcaps_indirect_list_from_array(const struct arm64_cpu_capabilities *caps)
         | ^
   arch/arm64/kernel/cpufeature.c:958:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     958 | void __init
         | ^
         | static 
>> arch/arm64/kernel/cpufeature.c:1428:1: warning: no previous prototype for function 'feature_matches' [-Wmissing-prototypes]
    1428 | feature_matches(u64 reg, const struct arm64_cpu_capabilities *entry)
         | ^
   arch/arm64/kernel/cpufeature.c:1427:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1427 | bool
         | ^
         | static 
   2 warnings generated.
--
>> arch/arm64/kernel/process.c:544:5: warning: no previous prototype for function 'arch_prctl_mem_model_get' [-Wmissing-prototypes]
     544 | int arch_prctl_mem_model_get(struct task_struct *t)
         |     ^
   arch/arm64/kernel/process.c:544:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     544 | int arch_prctl_mem_model_get(struct task_struct *t)
         | ^
         | static 
>> arch/arm64/kernel/process.c:549:5: warning: no previous prototype for function 'arch_prctl_mem_model_set' [-Wmissing-prototypes]
     549 | int arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
         |     ^
   arch/arm64/kernel/process.c:549:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     549 | int arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
         | ^
         | static 
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
