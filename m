Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56EE1D2EE;
	Wed,  9 Aug 2023 17:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691602760; x=1723138760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gc9GM2g+hTVrpVOrDv+wSdR5HRFIRL1Wyo1G1BKTwwE=;
  b=Ild+OMas+1xGeMaqZ3RIJK6ss76OqGwWIT43DKaMuY8yE5ZsPmInXy5d
   ITHUD0UM4tNy/mRuKOr/rgITY7RjeJ9+zTcqrJQNQSNKSGop3fOhea13k
   iSQfa7KlTin9Ro7tsEQrcUneWVjxqSrzTT1yUCH0oLY1VgvSm03trK28o
   igoaX62VTRdz+DLT9UfBfCee3Y9gpF8+T1IJ6wnFCGeYe/45xnCWb2vTm
   FlH0A0vX7kGzbP0r+6A+W2ApQ6h8+S4nn9sKV/mVsfFiSl8oqrTCQNcBZ
   SaNYW/B0ibpmFe9l3Ar7RdKtZTNanXYO/WZs34ayhJtMci+qSTGczTue+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361317836"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="361317836"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 10:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905745719"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="905745719"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Aug 2023 10:38:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTn8q-0006IK-0p;
	Wed, 09 Aug 2023 17:38:40 +0000
Date: Thu, 10 Aug 2023 01:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.5-rc1 9/12] ld.lld: error:
 arch/powerpc/kernel/vdso/vdso32.lds:236: unknown directive: static
Message-ID: <202308100119.lpBVqG5O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.5-rc1
head:   b6a25d37eca4850c246b94d73bd2e3c75860d265
commit: 4d8e8621e8b067862e6b7a0f5545022931bc0823 [9/12] powerpc: Make virt_to_pfn() a static inline
config: powerpc-randconfig-r025-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100119.lpBVqG5O-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100119.lpBVqG5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100119.lpBVqG5O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/powerpc/kernel/vdso/vdso32.lds:236: unknown directive: static
   >>> static inline unsigned long virt_to_pfn(const volatile void *kaddr)
   >>> ^
   clang: error: linker command failed with exit code 1 (use -v to see invocation)
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:78: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1 shuffle=1213181954
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:372: vdso_prepare] Error 2 shuffle=1213181954
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1213181954
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1213181954
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
