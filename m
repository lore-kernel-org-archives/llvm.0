Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F995CA6
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 19:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662665194; x=1694201194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTj9SBpYzJorDU7QK3tJRUZTBD9KgElW2k03MJULT9E=;
  b=TM9sd5N8PE5JvFqcZbQuo+GDBKgW92X3N+nFsGd6VC8HK1qtznvybF6X
   3xWWCZcY+63T80/yDBEH/yUZ+jbApUVoNpsMdUCMU/+ibxegqNoupJapN
   LHklIXtzUOLX4RHX6lU2954sMPdewAabckc1QR2w/3MkqgiTDfrD7scow
   mVjsV1DD27ADDa8g+Z65NiL8FGFT7LsuFo9CYAdqlBwuDt2d4gFAPFSk2
   em+SM5Jmbn7l+Wnyfpr2e2vyg80aRIQ2Rggp4v7CH9F+V3ScRP/8XkuLF
   1zr+aW3mt1oWBx2wElJWiG2wDaeGJI9lwk1Z1bMC3WqCYbJxDjD6TYlUF
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298640943"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="298640943"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 12:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="943486044"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 08 Sep 2022 12:26:27 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWNAR-0000GF-0P;
	Thu, 08 Sep 2022 19:26:27 +0000
Date: Fri, 9 Sep 2022 03:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arm-integrator:virt-to-pfn-v6.0-rc1 10/24]
 arch/arm/include/asm/memory.h:294:36: error: use of undeclared identifier
 'PAGE_SHIFT'
Message-ID: <202209090357.Xn4iOALy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.0-rc1
head:   bc69ecf9b2a3d1f9699edab614580d6a6e090407
commit: dbf81f3235aaece643b3fef4b5568d79caf6db0e [10/24] ARM: mm: Make virt_to_pfn() a static inline
config: arm-spitz_defconfig (https://download.01.org/0day-ci/archive/20220909/202209090357.Xn4iOALy-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=dbf81f3235aaece643b3fef4b5568d79caf6db0e
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.0-rc1
        git checkout dbf81f3235aaece643b3fef4b5568d79caf6db0e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/io.c:4:
   In file included from include/linux/io.h:13:
   In file included from arch/arm/include/asm/io.h:26:
>> arch/arm/include/asm/memory.h:294:36: error: use of undeclared identifier 'PAGE_SHIFT'
           return (((kaddr - PAGE_OFFSET) >> PAGE_SHIFT) +
                                             ^
   1 error generated.
--
   In file included from mm/early_ioremap.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/arm/include/asm/io.h:26:
>> arch/arm/include/asm/memory.h:294:36: error: use of undeclared identifier 'PAGE_SHIFT'
           return (((kaddr - PAGE_OFFSET) >> PAGE_SHIFT) +
                                             ^
   In file included from mm/early_ioremap.c:16:
   In file included from include/linux/mm.h:703:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/early_ioremap.c:16:
   In file included from include/linux/mm.h:703:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/early_ioremap.c:16:
   In file included from include/linux/mm.h:703:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/early_ioremap.c:16:
   In file included from include/linux/mm.h:703:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/early_ioremap.c:16:
   In file included from include/linux/mm.h:703:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/early_ioremap.c:16:
   In file included from include/linux/mm.h:703:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/early_ioremap.c:16:
   In file included from include/linux/mm.h:703:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \
                        ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from mm/early_ioremap.c:16:
   In file included from include/linux/mm.h:703:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:


vim +/PAGE_SHIFT +294 arch/arm/include/asm/memory.h

   290	
   291	static inline unsigned long virt_to_pfn(const void *p)
   292	{
   293		unsigned long kaddr = (unsigned long)p;
 > 294		return (((kaddr - PAGE_OFFSET) >> PAGE_SHIFT) +
   295			PHYS_PFN_OFFSET);
   296	}
   297	#define __pa_symbol_nodebug(x)	__virt_to_phys_nodebug((x))
   298	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
