Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF6EBD0C;
	Sun, 29 Jan 2023 03:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674961208; x=1706497208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4rd0Y688x2CZRfpxyOym9qVoCl5/54M087hSkl1ZZqY=;
  b=Fgj+sQeR8Wa8zPWgxC9q0PJQGr50p+kVV4DbaZjB5AOkb001ZcrSmqhp
   c7fi9WPxHBNERQHKFqHNFiX+ozCP6RWZeuWe+JfRXbsS3YLP04Y6cUwul
   UUOOYE/YTD3De5aUFg328L39kMHW5mNhvyx6k0708vv+n3ThZBqXO67L5
   +RD6gkDAPlJ/Lje+WIa6WQr0GW3031VAFcAs+SKjrJXVH+2Jt7CV1NGXq
   ihuQxczG/Ozbxvt5RJT95t3R35enDcpc+VNCQHKokT93+Dwmx0zZJqsr1
   U+an9lNopPhT9uCHErWJx7OE9fEkA/y+3GOhkBy8AlDKRy6NZSWMhutH/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="354670209"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="354670209"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 19:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="665684728"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="665684728"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jan 2023 19:00:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLxvJ-0001Ni-1G;
	Sun, 29 Jan 2023 03:00:05 +0000
Date: Sun, 29 Jan 2023 10:59:53 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Price <steven.price@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 08/14] arm64: Make the PHYS_MASK_SHIFT dynamic
Message-ID: <202301291042.l9M0pcgi-lkp@intel.com>
References: <20230127112758.37891-9-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127112758.37891-9-steven.price@arm.com>

Hi Steven,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on kvmarm/next efi/next tip/irq/core arm/for-next arm/fixes soc/for-next linus/master v6.2-rc5 next-20230127]
[cannot apply to arnd-asm-generic/master xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Price/arm64-rsi-Add-RSI-definitions/20230128-113646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230127112758.37891-9-steven.price%40arm.com
patch subject: [RFC PATCH 08/14] arm64: Make the PHYS_MASK_SHIFT dynamic
config: arm64-randconfig-r011-20230129 (https://download.01.org/0day-ci/archive/20230129/202301291042.l9M0pcgi-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/31ee93a9816b99af56770eb97a8e1f97808fda01
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Steven-Price/arm64-rsi-Add-RSI-definitions/20230128-113646
        git checkout 31ee93a9816b99af56770eb97a8e1f97808fda01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/mm/init.c:91:52: error: initializer element is not a compile-time constant
   phys_addr_t __ro_after_init arm64_dma_phys_limit = PHYS_MASK + 1;
                                                      ^~~~~~~~~~~~~
   arch/arm64/include/asm/pgtable.h:41:20: note: expanded from macro 'PHYS_MASK'
   #define PHYS_MASK               ((1UL << PHYS_MASK_SHIFT) - 1)
                                   ^
   1 error generated.


vim +91 arch/arm64/mm/init.c

03ef055fd364e4 Mark Rutland           2018-12-07  58  
1a8e1cef7603e2 Nicolas Saenz Julienne 2019-09-11  59  /*
d78050ee35440d Catalin Marinas        2021-01-07  60   * If the corresponding config options are enabled, we create both ZONE_DMA
d78050ee35440d Catalin Marinas        2021-01-07  61   * and ZONE_DMA32. By default ZONE_DMA covers the 32-bit addressable memory
d78050ee35440d Catalin Marinas        2021-01-07  62   * unless restricted on specific platforms (e.g. 30-bit on Raspberry Pi 4).
d78050ee35440d Catalin Marinas        2021-01-07  63   * In such case, ZONE_DMA32 covers the rest of the 32-bit addressable memory,
d78050ee35440d Catalin Marinas        2021-01-07  64   * otherwise it is empty.
031495635b4668 Vijay Balakrishna      2022-03-02  65   *
031495635b4668 Vijay Balakrishna      2022-03-02  66   * Memory reservation for crash kernel either done early or deferred
031495635b4668 Vijay Balakrishna      2022-03-02  67   * depending on DMA memory zones configs (ZONE_DMA) --
031495635b4668 Vijay Balakrishna      2022-03-02  68   *
031495635b4668 Vijay Balakrishna      2022-03-02  69   * In absence of ZONE_DMA configs arm64_dma_phys_limit initialized
031495635b4668 Vijay Balakrishna      2022-03-02  70   * here instead of max_zone_phys().  This lets early reservation of
031495635b4668 Vijay Balakrishna      2022-03-02  71   * crash kernel memory which has a dependency on arm64_dma_phys_limit.
031495635b4668 Vijay Balakrishna      2022-03-02  72   * Reserving memory early for crash kernel allows linear creation of block
031495635b4668 Vijay Balakrishna      2022-03-02  73   * mappings (greater than page-granularity) for all the memory bank rangs.
031495635b4668 Vijay Balakrishna      2022-03-02  74   * In this scheme a comparatively quicker boot is observed.
031495635b4668 Vijay Balakrishna      2022-03-02  75   *
031495635b4668 Vijay Balakrishna      2022-03-02  76   * If ZONE_DMA configs are defined, crash kernel memory reservation
dd671f16b1cdb1 Julia Lawall           2022-03-18  77   * is delayed until DMA zone memory range size initialization performed in
031495635b4668 Vijay Balakrishna      2022-03-02  78   * zone_sizes_init().  The defer is necessary to steer clear of DMA zone
031495635b4668 Vijay Balakrishna      2022-03-02  79   * memory range to avoid overlap allocation.  So crash kernel memory boundaries
031495635b4668 Vijay Balakrishna      2022-03-02  80   * are not known when mapping all bank memory ranges, which otherwise means
031495635b4668 Vijay Balakrishna      2022-03-02  81   * not possible to exclude crash kernel range from creating block mappings
031495635b4668 Vijay Balakrishna      2022-03-02  82   * so page-granularity mappings are created for the entire memory range.
031495635b4668 Vijay Balakrishna      2022-03-02  83   * Hence a slightly slower boot is observed.
031495635b4668 Vijay Balakrishna      2022-03-02  84   *
dd671f16b1cdb1 Julia Lawall           2022-03-18  85   * Note: Page-granularity mappings are necessary for crash kernel memory
031495635b4668 Vijay Balakrishna      2022-03-02  86   * range for shrinking its size via /sys/kernel/kexec_crash_size interface.
1a8e1cef7603e2 Nicolas Saenz Julienne 2019-09-11  87   */
031495635b4668 Vijay Balakrishna      2022-03-02  88  #if IS_ENABLED(CONFIG_ZONE_DMA) || IS_ENABLED(CONFIG_ZONE_DMA32)
031495635b4668 Vijay Balakrishna      2022-03-02  89  phys_addr_t __ro_after_init arm64_dma_phys_limit;
031495635b4668 Vijay Balakrishna      2022-03-02  90  #else
770093459b9b33 Will Deacon            2022-03-09 @91  phys_addr_t __ro_after_init arm64_dma_phys_limit = PHYS_MASK + 1;
031495635b4668 Vijay Balakrishna      2022-03-02  92  #endif
c1cc1552616d0f Catalin Marinas        2012-03-05  93  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
