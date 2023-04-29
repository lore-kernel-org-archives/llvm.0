Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636263229;
	Sat, 29 Apr 2023 20:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682801835; x=1714337835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GCpS8Md9HBlN5esDuVnjzs96fcxvDfOrl6RLc+7G9ao=;
  b=K1LrdkoRNafDvUoe+hHGelgV8XVfEv9+LJJs73bg1uur6lIn99sAlOwA
   gqf4gPfpjSK9BdVpgiEuP2k6lw8ijdfgaJcezvCVBXmgMzflgo1imaWYG
   i35mEiq5iVU9YVbTBg33mgUd5COVaqNFmRk04qO3TnxczN4cARgROqfF+
   Ct+6fDN7IG+Wy0pXzF3mM7FmR/F2K2cFe+biXdjIkHJjWlWGgSF2gKJSE
   +YN8YV5ZDX3Xy6r6QGyOW1GNDxV1MjSTOdBiVUpRrNZ8df+3FO17hXJCK
   y2yLqC4HkITewtRyQzsRBN210zrXgOE5qMXAL4jnM4+BnykJy9CiJAs/f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="332302408"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="332302408"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 13:57:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="764780633"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="764780633"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Apr 2023 13:57:12 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psrd2-0001LZ-0N;
	Sat, 29 Apr 2023 20:57:12 +0000
Date: Sun, 30 Apr 2023 04:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [linux-stable-rc:linux-5.15.y 9996/9999]
 arch/riscv/mm/init.c:755:16: warning: mixing declarations and code is a C99
 extension
Message-ID: <202304300429.SXZOA5up-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   64fb7ad7e758c85ebeb0c8c500e4175c65bf5778
commit: 067df57aea8ea9d1d84c53d9925d58759ac90824 [9996/9999] riscv: Move early dtb mapping into the fixmap region
config: riscv-randconfig-r026-20230430 (https://download.01.org/0day-ci/archive/20230430/202304300429.SXZOA5up-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=067df57aea8ea9d1d84c53d9925d58759ac90824
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout 067df57aea8ea9d1d84c53d9925d58759ac90824
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304300429.SXZOA5up-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/mm/init.c:755:16: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
           unsigned long idx = pgd_index(__fix_to_virt(FIX_FDT));
                         ^
   1 warning generated.


vim +755 arch/riscv/mm/init.c

   731	
   732	static void __init setup_vm_final(void)
   733	{
   734		uintptr_t va, map_size;
   735		phys_addr_t pa, start, end;
   736		u64 i;
   737	
   738		/**
   739		 * MMU is enabled at this point. But page table setup is not complete yet.
   740		 * fixmap page table alloc functions should be used at this point
   741		 */
   742		pt_ops.alloc_pte = alloc_pte_fixmap;
   743		pt_ops.get_pte_virt = get_pte_virt_fixmap;
   744	#ifndef __PAGETABLE_PMD_FOLDED
   745		pt_ops.alloc_pmd = alloc_pmd_fixmap;
   746		pt_ops.get_pmd_virt = get_pmd_virt_fixmap;
   747	#endif
   748		/* Setup swapper PGD for fixmap */
   749	#if !defined(CONFIG_64BIT)
   750		/*
   751		 * In 32-bit, the device tree lies in a pgd entry, so it must be copied
   752		 * directly in swapper_pg_dir in addition to the pgd entry that points
   753		 * to fixmap_pte.
   754		 */
 > 755		unsigned long idx = pgd_index(__fix_to_virt(FIX_FDT));
   756	
   757		set_pgd(&swapper_pg_dir[idx], early_pg_dir[idx]);
   758	#endif
   759		create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
   760				   __pa_symbol(fixmap_pgd_next),
   761				   PGDIR_SIZE, PAGE_TABLE);
   762	
   763		/* Map all memory banks in the linear mapping */
   764		for_each_mem_range(i, &start, &end) {
   765			if (start >= end)
   766				break;
   767			if (start <= __pa(PAGE_OFFSET) &&
   768			    __pa(PAGE_OFFSET) < end)
   769				start = __pa(PAGE_OFFSET);
   770			if (end >= __pa(PAGE_OFFSET) + memory_limit)
   771				end = __pa(PAGE_OFFSET) + memory_limit;
   772	
   773			map_size = best_map_size(start, end - start);
   774			for (pa = start; pa < end; pa += map_size) {
   775				va = (uintptr_t)__va(pa);
   776	
   777				create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
   778						   pgprot_from_va(va));
   779			}
   780		}
   781	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
