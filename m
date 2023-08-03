Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7147C18B0D;
	Thu,  3 Aug 2023 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691075503; x=1722611503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LXJvcbqP2tBiA8nLVwjQ+OuwJ5Mj2DCGeqgDySWDpB8=;
  b=DEoxNBs8xOAuMhCeZiVvboycjEHdwZddNozMZ7EcM8GfvcRDzhcJgqr/
   V5IIxm7vrgAylKs7U8JQdQySXq/x779kfueMCyoG4VlOQTkMHHQut5ZPB
   x2/OBB2GEFcW9LFHm7AtOQVfHl3LA4pZ8B2hqpfkcOzNx7BwjZxD1M+YE
   a2WLmMoePrLaYu2+H966YJNFkZshMGpnCNBEj9grSandwa05alSVg0oCm
   U/ehk531nHOt8kWz/Uz8s1BzpzzJMGxp2qUbzd4xAxZfBuhII1B2tWy/u
   bc3tMSrIEfmYWP79Wr4AYc6I6GFlaZn0jU/SMzatV+cl/c6SnvYi4CORL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="433750491"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="433750491"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 08:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="795007355"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="795007355"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2023 08:11:41 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRZzI-0002BT-1K;
	Thu, 03 Aug 2023 15:11:40 +0000
Date: Thu, 3 Aug 2023 23:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 4/4]
 arch/arm64/kernel/cpufeature_impdef.c:12:6: warning: no previous prototype
 for function 'has_apple_feature'
Message-ID: <202308032332.aHuS74oR-lkp@intel.com>
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
commit: 6a8bd3529f0e9a26ebabd614ab6582cda3337142 [4/4] arm64: Implement Apple IMPDEF TSO memory model control
config: arm64-randconfig-r021-20230731 (https://download.01.org/0day-ci/archive/20230803/202308032332.aHuS74oR-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308032332.aHuS74oR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308032332.aHuS74oR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature_impdef.c:12:6: warning: no previous prototype for function 'has_apple_feature' [-Wmissing-prototypes]
   bool has_apple_feature(const struct arm64_cpu_capabilities *entry, int scope)
        ^
   arch/arm64/kernel/cpufeature_impdef.c:12:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool has_apple_feature(const struct arm64_cpu_capabilities *entry, int scope)
   ^
   static 
   arch/arm64/kernel/cpufeature_impdef.c:24:6: warning: no previous prototype for function 'has_tso_fixed' [-Wmissing-prototypes]
   bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
        ^
   arch/arm64/kernel/cpufeature_impdef.c:24:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
   ^
   static 
   arch/arm64/kernel/cpufeature_impdef.c:59:13: warning: no previous prototype for function 'init_cpu_hwcaps_indirect_list_impdef' [-Wmissing-prototypes]
   void __init init_cpu_hwcaps_indirect_list_impdef(void)
               ^
   arch/arm64/kernel/cpufeature_impdef.c:59:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init init_cpu_hwcaps_indirect_list_impdef(void)
   ^
   static 
   3 warnings generated.


vim +/has_apple_feature +12 arch/arm64/kernel/cpufeature_impdef.c

    11	
  > 12	bool has_apple_feature(const struct arm64_cpu_capabilities *entry, int scope)
    13	{
    14		u64 val;
    15		WARN_ON(scope != SCOPE_SYSTEM);
    16	
    17		if (read_cpuid_implementor() != ARM_CPU_IMP_APPLE)
    18			return false;
    19	
    20		val = read_sysreg(aidr_el1);
    21		return feature_matches(val, entry);
    22	}
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
