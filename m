Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20792F2E
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646843420; x=1678379420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0mhJZxu3qOrqONHFGjz4knvkPkOaSmPWHhE9ahCLLtc=;
  b=K0XE3RYGfc3XxR6tRxfaSwmheIiwRKi0EIlVE2aAZLqEzdCeMKNHsaGx
   R+SV3G+Z3bh6v9kPpHJYe5IUB3yE14/OyWSXyplQPvq4clrYB3dStVl+7
   kQSuDMGpiNUwYPp6RxJT8K2EipK9OC1l0s3Z6usE5pAa13rIk3AnWUJO9
   j1w0WcOl4OVKQVbPZQu/uj7dqV3ovEAPsnWuUmao1dRBZlkavQqpSzQ+J
   5oxd5cGQm2LLFRplFm7PCruo5q6h1tiRyn6n4BiVE9JOOWA4NyAxlAymR
   l2k2et7rbGw5ihXJ16JEIdUCM/jAKrf2j40rTBt83y6GNyUd/jhJpSEaO
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="235621760"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="235621760"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 08:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="510539478"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2022 08:30:16 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRzCa-0003Xk-16; Wed, 09 Mar 2022 16:30:16 +0000
Date: Thu, 10 Mar 2022 00:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Vijay Balakrishna <vijayb@linux.microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [linux-next:master 11113/11713] arch/arm64/mm/init.c:90:19: error:
 redefinition of 'arm64_dma_phys_limit' with a different type: 'const
 phys_addr_t' (aka 'const unsigned long long') vs 'phys_addr_t' (aka
 'unsigned long long')
Message-ID: <202203100052.aZByW83b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4e7a74a6856f8613dab9794da4b5cfb8fd54fb8c
commit: 031495635b4668f94e964e037ca93d0d38bfde58 [11113/11713] arm64: Do not defer reserve_crashkernel() for platforms with no DMA memory zones
config: arm64-randconfig-r012-20220309 (https://download.01.org/0day-ci/archive/20220310/202203100052.aZByW83b-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=031495635b4668f94e964e037ca93d0d38bfde58
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 031495635b4668f94e964e037ca93d0d38bfde58
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/mm/init.c:90:19: error: redefinition of 'arm64_dma_phys_limit' with a different type: 'const phys_addr_t' (aka 'const unsigned long long') vs 'phys_addr_t' (aka 'unsigned long long')
   const phys_addr_t arm64_dma_phys_limit = PHYS_MASK + 1;
                     ^
   arch/arm64/include/asm/processor.h:102:20: note: previous declaration is here
   extern phys_addr_t arm64_dma_phys_limit;
                      ^
   1 error generated.


vim +90 arch/arm64/mm/init.c

    57	
    58	/*
    59	 * If the corresponding config options are enabled, we create both ZONE_DMA
    60	 * and ZONE_DMA32. By default ZONE_DMA covers the 32-bit addressable memory
    61	 * unless restricted on specific platforms (e.g. 30-bit on Raspberry Pi 4).
    62	 * In such case, ZONE_DMA32 covers the rest of the 32-bit addressable memory,
    63	 * otherwise it is empty.
    64	 *
    65	 * Memory reservation for crash kernel either done early or deferred
    66	 * depending on DMA memory zones configs (ZONE_DMA) --
    67	 *
    68	 * In absence of ZONE_DMA configs arm64_dma_phys_limit initialized
    69	 * here instead of max_zone_phys().  This lets early reservation of
    70	 * crash kernel memory which has a dependency on arm64_dma_phys_limit.
    71	 * Reserving memory early for crash kernel allows linear creation of block
    72	 * mappings (greater than page-granularity) for all the memory bank rangs.
    73	 * In this scheme a comparatively quicker boot is observed.
    74	 *
    75	 * If ZONE_DMA configs are defined, crash kernel memory reservation
    76	 * is delayed until DMA zone memory range size initilazation performed in
    77	 * zone_sizes_init().  The defer is necessary to steer clear of DMA zone
    78	 * memory range to avoid overlap allocation.  So crash kernel memory boundaries
    79	 * are not known when mapping all bank memory ranges, which otherwise means
    80	 * not possible to exclude crash kernel range from creating block mappings
    81	 * so page-granularity mappings are created for the entire memory range.
    82	 * Hence a slightly slower boot is observed.
    83	 *
    84	 * Note: Page-granularity mapppings are necessary for crash kernel memory
    85	 * range for shrinking its size via /sys/kernel/kexec_crash_size interface.
    86	 */
    87	#if IS_ENABLED(CONFIG_ZONE_DMA) || IS_ENABLED(CONFIG_ZONE_DMA32)
    88	phys_addr_t __ro_after_init arm64_dma_phys_limit;
    89	#else
  > 90	const phys_addr_t arm64_dma_phys_limit = PHYS_MASK + 1;
    91	#endif
    92	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
