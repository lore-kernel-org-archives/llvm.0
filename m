Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5351651;
	Mon,  1 May 2023 05:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682920563; x=1714456563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oHreV9BnEac56thMWKGwLht07JRDGcd4161NCa7gf+I=;
  b=dNr5rrz3kq3PwdldaMXprCT9bMHYF4YUhoIHcjCVytIQ2GLV1Q+q/Gqp
   GHole6+rXJAI1Ixn7nz0JWBwt8f9EpFfqV/Zc5wHTkRTyXxOjvXbwXUYB
   NluZ496wZyDamqkTQ4B7aY/2LnW1f1XNFyiep8qEAV2IRuCq8oGEqiUvh
   8gtcTdFAp7qJfwGifq4mbE1Y+PAcKSchSh6l2xtYyOVMok0VEghW/tJyA
   hP0WX2pph6OAkWO/z0tqK7KHMN6K+P6IB+M4MWAO9j+LDGnCSTe2/NYwJ
   Mr3CeMQd6EotWG+ainoB5XBVFgBAzRuFP7tXDuWHn9R5aUFPXZRH7E7YE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346898578"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="346898578"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 22:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="785158353"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="785158353"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2023 22:56:00 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptMVz-0000K5-2O;
	Mon, 01 May 2023 05:55:59 +0000
Date: Mon, 1 May 2023 13:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [stable:linux-5.15.y 9996/9999] arch/riscv/mm/init.c:755:16:
 warning: mixing declarations and code is a C99 extension
Message-ID: <202305011357.ce0X8xkG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   8a7f2a5c5aa1648edb4f2029c6ec33870afb7a95
commit: bbf94b04215517c681b3df7c7a8ab48cbb2540a1 [9996/9999] riscv: Move early dtb mapping into the fixmap region
config: riscv-randconfig-r042-20230430 (https://download.01.org/0day-ci/archive/20230501/202305011357.ce0X8xkG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=bbf94b04215517c681b3df7c7a8ab48cbb2540a1
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout bbf94b04215517c681b3df7c7a8ab48cbb2540a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011357.ce0X8xkG-lkp@intel.com/

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
