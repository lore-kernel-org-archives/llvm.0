Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0771377;
	Fri, 25 Aug 2023 07:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692947399; x=1724483399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HxtjP/eWI5irDDcXkwHLdeRMWrol5auXuwj5c4Fn374=;
  b=kPtD/8BvPDypZS0oUszr/OBr7sIKlm0XCsXKt2WX3nfT/JCv1uUfbo1w
   3g4NmB8Gp/0alcZCTlM2CA10OawLYZHZWMTJiMvBxUgtzlcjGIK+JulCJ
   Jk/4Xdsy7Bx4IiY/5yFLj+LvKc9GxB3o1oV/zJfdsAqAJmMpvh2YfCuoU
   CoRpRxw91DqucqyNn2B85sQyGafc7gsJrlFHXGKCtwVa0Nvo7iS3E5LNW
   MuuNWAtBEURl0NKRV5uxdSqUXkgcEkqfChXys9VlKGzEZdSow3qQarpxS
   K6EEygYM1h2SyHSvoVZO6QDe1xG1OVtc1D6ePKK8PUBzf0E0aa5XeVuRU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354179024"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354179024"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 00:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687203794"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="687203794"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Aug 2023 00:09:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZQx9-0003IK-1m;
	Fri, 25 Aug 2023 07:09:55 +0000
Date: Fri, 25 Aug 2023 15:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Reza Arbab <arbab@linux.ibm.com>
Subject: [powerpc:next 84/128] arch/powerpc/mm/init_64.c:477:38: error: use
 of undeclared identifier 'SECTION_SIZE_BITS'
Message-ID: <202308251532.k9PpWEAD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
head:   b9bbbf4979073d5536b7650decd37fcb901e6556
commit: 4d15721177d539d743fcf31d7bb376fb3b81aeb6 [84/128] powerpc/mm: Cleanup memory block size probing
config: powerpc64-randconfig-r005-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251532.k9PpWEAD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251532.k9PpWEAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251532.k9PpWEAD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/mm/init_64.c:477:38: error: use of undeclared identifier 'SECTION_SIZE_BITS'
     477 |         unsigned long section_size = 1UL << SECTION_SIZE_BITS;
         |                                             ^
   arch/powerpc/mm/init_64.c:510:18: error: use of undeclared identifier 'SECTION_SIZE_BITS'
     510 |                         *block_size = MIN_MEMORY_BLOCK_SIZE;
         |                                       ^
   include/linux/memory.h:23:43: note: expanded from macro 'MIN_MEMORY_BLOCK_SIZE'
      23 | #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
         |                                           ^
   2 errors generated.


vim +/SECTION_SIZE_BITS +477 arch/powerpc/mm/init_64.c

   474	
   475	static void update_memory_block_size(unsigned long *block_size, unsigned long mem_size)
   476	{
 > 477		unsigned long section_size = 1UL << SECTION_SIZE_BITS;
   478	
   479		for (; *block_size > section_size; *block_size >>= 2) {
   480	
   481			if ((mem_size & *block_size) == 0)
   482				break;
   483		}
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
