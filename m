Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E975EA4
	for <llvm@lists.linux.dev>; Sun, 20 Feb 2022 17:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645379807; x=1676915807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=di0yTkPPGf0lg8Z1HNTy1Ro4KtR4fZtl+kW8meoe/go=;
  b=jhJjWjinXLYnnjLkEe/B0RP1e2rZSsSlm0t/bSqvbi4TvG8nb/HV0ACW
   GktVYNnfUxxlk+DJFTxkvvOs8xGN+ZW8ZwqZyGEfbbZBlP3acbh+Rkt9n
   A9jS89lLL6PFRPf+cjzXmt4foSrtSQzkFJioshB/4N2eB6eRBvkK39JUa
   2MMSj6VQbtHQInIyusDyWnktlfJvxFGVx3sAw85veL2CrEmudcBf8iCbM
   deBkDG7lUUZ0dyZgwreUhWF5DA7LnmAwQpnsVA+LOI1XaFyi7NDjvmolv
   FXqRCEDbOsi/CY8uSCh+3GLHBtE3V+K0REdTm2nIXXuyoGCMtmhOzwByT
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="314655235"
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="314655235"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 09:56:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="504565884"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Feb 2022 09:56:45 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nLqRx-0000Y4-6C; Sun, 20 Feb 2022 17:56:45 +0000
Date: Mon, 21 Feb 2022 01:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ardb:arm64-ro-page-tables-pkvm-v5.17 15/28]
 include/linux/pgtable.h:84:29: error: redefinition of 'p4d_index'
Message-ID: <202202210124.8WuKWr52-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-ro-page-tables-pkvm-v5.17
head:   1faeabde0ba3c81ad666ab924ab79ef64843d40d
commit: 8009c0d425d69c34521e0f8123ff62786f1ac8fa [15/28] mm: add default definition of p4d_index()
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220221/202202210124.8WuKWr52-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=8009c0d425d69c34521e0f8123ff62786f1ac8fa
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb arm64-ro-page-tables-pkvm-v5.17
        git checkout 8009c0d425d69c34521e0f8123ff62786f1ac8fa
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:13:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:33:
>> include/linux/pgtable.h:84:29: error: redefinition of 'p4d_index'
   static inline unsigned long p4d_index(unsigned long address)
                               ^
   arch/x86/include/asm/pgtable.h:904:29: note: previous definition is here
   static inline unsigned long p4d_index(unsigned long address)
                               ^
   1 error generated.
   make[2]: *** [scripts/Makefile.build:121: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1191: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/p4d_index +84 include/linux/pgtable.h

    82	
    83	#ifndef p4d_index
  > 84	static inline unsigned long p4d_index(unsigned long address)
    85	{
    86		return (address >> P4D_SHIFT) & (PTRS_PER_P4D - 1);
    87	}
    88	#define p4d_index p4d_index
    89	#endif
    90	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
