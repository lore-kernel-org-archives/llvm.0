Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD2611CBB;
	Mon, 20 Nov 2023 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MrGvcNI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700473665; x=1732009665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMrKS8+FFM86nOdFB4nNhFEe287TCdWqvY8TZUCQTbA=;
  b=MrGvcNI4oKHqBgDMjcXVIUAal+LKHaIgJRRmWBt4Yd7BenzPJGEpyYss
   N2BiASY7TwYlodCJcyDV2eZkZ6eQzlJJBamLyzjAtEZuSc633SjR6Rnqe
   ubczFsnT+a3LTiqIVLryEkTuVLlt+euIbEwhaqQzcA3AQtqsHdyVOOoOw
   625qRbf42ptLfZH8sjlRqm2l0XoaZHVEYNWvsmuiMkwMAr8GlUY+L/2L1
   upH9iR44Nros3ZASm7wv+2GZdlnCNq0helNehwkrrlpp8C4wlZv9FexPN
   8gwhGhX8pn9n00yuWmOlKjZBuv4f+TIsQTNJjQPW2P5v/joLRwddjdJtc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="388727236"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="388727236"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 01:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="939760775"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="939760775"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 01:47:37 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r50sR-0006IJ-1z;
	Mon, 20 Nov 2023 09:47:35 +0000
Date: Mon, 20 Nov 2023 17:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 3/4]
 arch/arm64/kernel/cpufeature_impdef.c:11:6: warning: no previous prototype
 for function 'has_tso_fixed'
Message-ID: <202311201740.DqieebCY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   308062b9b17efd95c1c98c7c2cf667f620492fce
commit: 358a9e2c2286df9864eff73ff2baeb4efe94c66e [3/4] arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs
config: arm64-randconfig-002-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201740.DqieebCY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201740.DqieebCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201740.DqieebCY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature_impdef.c:11:6: warning: no previous prototype for function 'has_tso_fixed' [-Wmissing-prototypes]
      11 | bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
         |      ^
   arch/arm64/kernel/cpufeature_impdef.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      11 | bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
         | ^
         | static 
>> arch/arm64/kernel/cpufeature_impdef.c:36:13: warning: no previous prototype for function 'init_cpucap_indirect_list_impdef' [-Wmissing-prototypes]
      36 | void __init init_cpucap_indirect_list_impdef(void)
         |             ^
   arch/arm64/kernel/cpufeature_impdef.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      36 | void __init init_cpucap_indirect_list_impdef(void)
         | ^
         | static 
   2 warnings generated.
--
>> arch/arm64/kernel/cpufeature.c:971:1: warning: no previous prototype for function 'init_cpucap_indirect_list_from_array' [-Wmissing-prototypes]
     971 | init_cpucap_indirect_list_from_array(const struct arm64_cpu_capabilities *caps)
         | ^
   arch/arm64/kernel/cpufeature.c:970:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     970 | void __init
         | ^
         | static 
>> arch/arm64/kernel/cpufeature.c:1444:1: warning: no previous prototype for function 'feature_matches' [-Wmissing-prototypes]
    1444 | feature_matches(u64 reg, const struct arm64_cpu_capabilities *entry)
         | ^
   arch/arm64/kernel/cpufeature.c:1443:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1443 | bool
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
  > 36	void __init init_cpucap_indirect_list_impdef(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
