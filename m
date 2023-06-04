Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311D223A5;
	Sun,  4 Jun 2023 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685898789; x=1717434789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NmPXmCME2KnTFk1lfHckpe4FSW0HVErwpchsu8i6lH4=;
  b=LsiRby8T4L+9nlZrXgMHVpdpW9kIUFDelCgoDGzHwNfO6Eg5pVidA/qY
   S9/7eJ1/f9S7XEs8imthc29g3ydmvee5BNvWVCzEoBFN84GXa6Oj0xtnn
   WjeroFrN0PHcYmYPcc3HomiQQl9kY4VcRFax6ttl8Cmni3P95Z4zoDsFb
   TdajedkbkZ9cgDkOZa0pQdhxv0vki+FAPLNza2syrfK3WJqdqZa0wD7cR
   XQL3fq10wc2Rpi9/9rGEuNCBR1rFnEMQYJAP2oWo5rZuLLguPBBJ0Zz/j
   KpWZJiRFIWjkIf1ck+JTFpDULeNY8y0PD238nkZSlJIP6Hc6ZT+txfyqM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="358655031"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="358655031"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 10:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="685874942"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="685874942"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Jun 2023 10:13:05 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5rHs-0003EX-2P;
	Sun, 04 Jun 2023 17:13:04 +0000
Date: Mon, 5 Jun 2023 01:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 4/4]
 arch/arm64/kernel/cpufeature_impdef.c:12:6: warning: no previous prototype
 for function 'has_apple_feature'
Message-ID: <202306050128.UF4gkCm6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   38015ad2af19088e66e0c81f7efd5a8b51814026
commit: 38015ad2af19088e66e0c81f7efd5a8b51814026 [4/4] arm64: Implement Apple IMPDEF TSO memory model control
config: arm64-randconfig-r011-20230604 (https://download.01.org/0day-ci/archive/20230605/202306050128.UF4gkCm6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/38015ad2af19088e66e0c81f7efd5a8b51814026
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/220-tso
        git checkout 38015ad2af19088e66e0c81f7efd5a8b51814026
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306050128.UF4gkCm6-lkp@intel.com/

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
