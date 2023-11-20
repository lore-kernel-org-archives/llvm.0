Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6DFED8;
	Mon, 20 Nov 2023 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjAX1Zwn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700484308; x=1732020308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eb+ZOfbeIo4oNALZHoP3RSs4JQUSqU9+Xesd9kmD1Ho=;
  b=gjAX1Zwn4QIeolvALHaTHOoPqzNKr8+38KrjfdTnu02RpE5kyHqZIKOZ
   vUUn5ssCvdE7AIpftCVwhNPVap2krsPGIwgsvbu7JMLG+RILLdm3AIszW
   nYpXbg+5b75DC90lsqsNuT5Rj+pLkNN1MbWvXO+lFKzLoqBO9jJFm95VU
   Zdh2ENaaCBorzO68R0/1KSLYTR4vRWOLaa2xHjlr4qAt+khHpwTVn+H30
   ESwdocV2EOhR9Ak+HKp0dvCPpo4lrayf9Mj5Px31sJhnlTsCWMvwv3ODf
   OLo+nnoBHbDRRRZlDGNqzovUyC4nQBq34ZOhFrzvOSGgoGvF04t37DApR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="390470004"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="390470004"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 04:45:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="889908623"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="889908623"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Nov 2023 04:45:05 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r53eA-0006Sz-1g;
	Mon, 20 Nov 2023 12:45:02 +0000
Date: Mon, 20 Nov 2023 20:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 4/4]
 arch/arm64/kernel/cpufeature_impdef.c:12:6: warning: no previous prototype
 for function 'has_apple_feature'
Message-ID: <202311202018.ECg9m9He-lkp@intel.com>
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
commit: 308062b9b17efd95c1c98c7c2cf667f620492fce [4/4] arm64: Implement Apple IMPDEF TSO memory model control
config: arm64-randconfig-002-20231120 (https://download.01.org/0day-ci/archive/20231120/202311202018.ECg9m9He-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311202018.ECg9m9He-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311202018.ECg9m9He-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature_impdef.c:12:6: warning: no previous prototype for function 'has_apple_feature' [-Wmissing-prototypes]
      12 | bool has_apple_feature(const struct arm64_cpu_capabilities *entry, int scope)
         |      ^
   arch/arm64/kernel/cpufeature_impdef.c:12:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      12 | bool has_apple_feature(const struct arm64_cpu_capabilities *entry, int scope)
         | ^
         | static 
   arch/arm64/kernel/cpufeature_impdef.c:24:6: warning: no previous prototype for function 'has_tso_fixed' [-Wmissing-prototypes]
      24 | bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
         |      ^
   arch/arm64/kernel/cpufeature_impdef.c:24:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      24 | bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
         | ^
         | static 
   arch/arm64/kernel/cpufeature_impdef.c:59:13: warning: no previous prototype for function 'init_cpucap_indirect_list_impdef' [-Wmissing-prototypes]
      59 | void __init init_cpucap_indirect_list_impdef(void)
         |             ^
   arch/arm64/kernel/cpufeature_impdef.c:59:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      59 | void __init init_cpucap_indirect_list_impdef(void)
         | ^
         | static 
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
