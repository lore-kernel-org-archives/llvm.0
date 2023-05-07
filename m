Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BAD2567;
	Sun,  7 May 2023 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683466955; x=1715002955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GFLE7/SNwE0kC63zMR9xkRIUNL3mcjIAUW1O2kpLcx4=;
  b=U4dwxOEQbfY96PkqaX+eFp+akFmW3m6ABBIfLUoGAVL4SaKpVk5d31ln
   /dSWQzDDGbw8osfblGuabroo/l6cN8GzSCS+rrddjehGM+ULmAi0Gh6h9
   4xjJWwqvb0jURpVEKISzcGaekfjSpXAq2Ar842DcpL6+KUWI3hBSgrJXR
   Pew86ZUBUN/Ru8fWgtgtKnT8wXSjXtFTMFv7PGFFWgkiCYMPKIXTFxddb
   XXwVZXYKp3IrmxZ3UGRZqx7DnO+L0Srg7oa82AvTc4N49qRFOLe+xHjd4
   Ab5bjyJbQ5Q34tePXTHEHL6C3x2jWZ4qH2MS0El3JDE34wTx7tGqLDofZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="333916551"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="333916551"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 06:42:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="767760470"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="767760470"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 May 2023 06:42:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pveen-0000lF-0W;
	Sun, 07 May 2023 13:42:33 +0000
Date: Sun, 7 May 2023 21:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-pfn-v6-4-rc1 10/12]
 arch/arm/include/asm/memory.h:384:9: warning: 'ARCH_PFN_OFFSET' macro
 redefined
Message-ID: <202305072129.TRXmOJgq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-pfn-v6-4-rc1
head:   042946296cd2b01e67500f6ca02c750fbd5d0046
commit: d2a5bf80564791da3b26d022633713c6e5838159 [10/12] ARM: mm: Make virt_to_pfn() a static inline
config: arm-s5pv210_defconfig (https://download.01.org/0day-ci/archive/20230507/202305072129.TRXmOJgq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=d2a5bf80564791da3b26d022633713c6e5838159
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator b4/virt-to-pfn-v6-4-rc1
        git checkout d2a5bf80564791da3b26d022633713c6e5838159
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/ lib/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305072129.TRXmOJgq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/iomap_copy.c:7:
   In file included from include/linux/io.h:13:
   In file included from arch/arm/include/asm/io.h:26:
>> arch/arm/include/asm/memory.h:384:9: warning: 'ARCH_PFN_OFFSET' macro redefined [-Wmacro-redefined]
   #define ARCH_PFN_OFFSET         PHYS_PFN_OFFSET
           ^
   include/asm-generic/memory_model.h:15:9: note: previous definition is here
   #define ARCH_PFN_OFFSET         (0UL)
           ^
   1 warning generated.


vim +/ARCH_PFN_OFFSET +384 arch/arm/include/asm/memory.h

4dc9a81715973c arch/arm/include/asm/memory.h Santosh Shilimkar 2013-07-31  374  
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  375  /*
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  376   * Conversion between a struct page and a physical address.
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  377   *
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  378   *  page_to_pfn(page)	convert a struct page * to a PFN number
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  379   *  pfn_to_page(pfn)	convert a _valid_ PFN number to struct page *
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  380   *
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  381   *  virt_to_page(k)	convert a _valid_ virtual address to struct page *
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  382   *  virt_addr_valid(k)	indicates whether a virtual address is valid
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  383   */
7d12963757b917 include/asm-arm/memory.h      Russell King      2006-04-04 @384  #define ARCH_PFN_OFFSET		PHYS_PFN_OFFSET
05944d74bc28ff include/asm-arm/memory.h      Russell King      2006-11-30  385  

:::::: The code at line 384 was first introduced by commit
:::::: 7d12963757b9170f162f317b7461353c5fb574e8 [ARM] Remove unnecessary extra parens in include/asm-arm/memory.h

:::::: TO: Russell King <rmk@dyn-67.arm.linux.org.uk>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
