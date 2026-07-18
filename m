Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4458B3DE45D;
	Sat, 18 Jul 2026 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784389937; cv=none; b=TQ/siQ0/Rmtx5IPk3LjMSr6A4ShA5IPwDNMOShJFoXKMU5WyeqJXMxFxtDrYVHe3vX+VK/rwj/HZkpE2leDl1gV/6EyDXDpqSFk35dzs8WKFC9yIwznmiWjwKPm7ssgDsCmJYpmsUE2sQgQvevgF1vndZvPaNb8ZT0XWoIv10PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784389937; c=relaxed/simple;
	bh=XgMcIFKAsf0OR6EX7YQLLGyQmHL/gMLGAAjxc7QCq9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mTmse3nTpFEPEmZYlFKbfpRPNlooOLRFXxFcqrrcLYXXe6OyVOwZvPzl4vcmMxF1gm9ltGyKMTC7lrBfuyREpRf/eFkf0zNCYCl655U/rO7Mc5CXDXbMeSBD91Istoi16iVibN2kZtBlu3Z530kPzxxu4HIGA/LVqRSv3+3Uol0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsohVk40; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsohVk40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784389928; x=1815925928;
  h=date:from:to:cc:subject:message-id;
  bh=XgMcIFKAsf0OR6EX7YQLLGyQmHL/gMLGAAjxc7QCq9A=;
  b=gsohVk40QKB9D/6dxXUqYlAz3Zo9Sx6J5Lx2uy1LF+sKyMjH9e81W3So
   9ntcQJQiV+Tg+0jKeY/YA+jg9Eh0UNNIqmUMHv+Upwp8RzdFbBDLkwz63
   bApEJH+aiYpwwCseOstfsHqJ0jW9hLjPiLMVmeDlNZvoGn3uvLJEGYjLR
   6DqmcWfGDWvqJ+ZjumQzbCqNnrVVNQdP0YuWe/TTFMAx5PgYed7UtU9Km
   TsAixrPjpOOWeidi5Ow/pHdmh4cgfNR2pvp5qrrAZxoGLwonrwE5w/ukl
   Ryns4/13vFg1k4h3AEayH4SyJ64R1lUzQd3Jr6nkjd0/OV2IG4oX9FPFw
   g==;
X-CSE-ConnectionGUID: dHlaNwb5RU6ycy6SEHd6oQ==
X-CSE-MsgGUID: lucGnzxqTp+P/zwON0zgnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="84016032"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="84016032"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 08:51:57 -0700
X-CSE-ConnectionGUID: OmpOVNNcRISyiGLt3prWeg==
X-CSE-MsgGUID: AWe0nQXBSF+VK3FPUOPLTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="253632574"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Jul 2026 08:51:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl7KS-00000000UrK-3vrh;
	Sat, 18 Jul 2026 15:51:52 +0000
Date: Sat, 18 Jul 2026 23:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 61/73] arch/hexagon/mm/init.c:200:23:
 error: use of undeclared identifier 'initial_boot_params'
Message-ID: <202607182319.4N2Dgvm9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   7196a17b7cc2f15ed74704ba70164832b84a1a42
commit: 00029c0cc1e12984035d2f6387de53addfacb922 [61/73] hexagon: harden adoption of a bootloader-provided DTB
config: hexagon-randconfig-001-20260717 (https://download.01.org/0day-ci/archive/20260718/202607182319.4N2Dgvm9-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607182319.4N2Dgvm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607182319.4N2Dgvm9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/hexagon/mm/init.c:200:23: error: use of undeclared identifier 'initial_boot_params'
     200 |         if (boot_dtb_phys && initial_boot_params)
         |                              ^~~~~~~~~~~~~~~~~~~
   arch/hexagon/mm/init.c:202:20: error: use of undeclared identifier 'initial_boot_params'
     202 |                                  fdt_totalsize(initial_boot_params));
         |                                                ^~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/initial_boot_params +200 arch/hexagon/mm/init.c

   188	
   189		memblock_add(PHYS_OFFSET,
   190			     (bootmem_lastpg - ARCH_PFN_OFFSET) << PAGE_SHIFT);
   191	
   192		/* Reserve kernel text/data/bss */
   193		memblock_reserve(PHYS_OFFSET,
   194				 (bootmem_startpg - ARCH_PFN_OFFSET) << PAGE_SHIFT);
   195	
   196		/*
   197		 * A bootloader-provided DTB sits in our RAM until it is
   198		 * unflattened; keep the allocator away from it.
   199		 */
 > 200		if (boot_dtb_phys && initial_boot_params)
   201			memblock_reserve(boot_dtb_phys,
   202					 fdt_totalsize(initial_boot_params));
   203		/*
   204		 * Reserve the top DMA_RESERVE bytes of RAM for DMA (uncached)
   205		 * memory allocation
   206		 */
   207		max_low_pfn = bootmem_lastpg - PFN_DOWN(DMA_RESERVED_BYTES);
   208		min_low_pfn = ARCH_PFN_OFFSET;
   209		memblock_reserve(PFN_PHYS(max_low_pfn), DMA_RESERVED_BYTES);
   210	
   211		printk(KERN_INFO "bootmem_startpg:  0x%08lx\n", bootmem_startpg);
   212		printk(KERN_INFO "bootmem_lastpg:  0x%08lx\n", bootmem_lastpg);
   213		printk(KERN_INFO "min_low_pfn:  0x%08lx\n", min_low_pfn);
   214		printk(KERN_INFO "max_low_pfn:  0x%08lx\n", max_low_pfn);
   215	
   216		/*
   217		 * The default VM page tables (will be) populated with
   218		 * VA=PA+PAGE_OFFSET mapping.  We go in and invalidate entries
   219		 * higher than what we have memory for.
   220		 */
   221	
   222		/*  this is pointer arithmetic; each entry covers 4MB  */
   223		segtable = segtable + (PAGE_OFFSET >> 22);
   224		//  probably should do something more graceful than this
   225	#ifdef CONFIG_HEXAGON_SPLIT_2GB
   226	#define KERNEL_BIGPAGES_GB (2)
   227	#else
   228	#define KERNEL_BIGPAGES_GB (1)
   229	#endif
   230	
   231		segtable_end = segtable + (KERNEL_BIGPAGES_GB<<(30-22));
   232	
   233		/*
   234		 * Move forward to the start of empty pages; take into account
   235		 * phys_offset shift.
   236		 */
   237	
   238		segtable += (bootmem_lastpg-ARCH_PFN_OFFSET)>>(22-PAGE_SHIFT);
   239		{
   240			int i;
   241			for (i = 1 ; i <= DMA_RESERVE ; i++)
   242				segtable[-i] = ((segtable[-i] & __HVM_PTE_PGMASK_4MB)
   243					| __HVM_PTE_R | __HVM_PTE_W | __HVM_PTE_X
   244					| __HEXAGON_C_UNC << 6
   245					| __HVM_PDE_S_4MB);
   246		}
   247	
   248		printk(KERN_INFO "clearing segtable from %p to %p\n", segtable,
   249			segtable_end);
   250		while (segtable < (segtable_end-8))
   251			*(segtable++) = __HVM_PDE_S_INVALID;
   252		/* stop the pointer at the device I/O 4MB page  */
   253	
   254		printk(KERN_INFO "segtable = %p (should be equal to _K_io_map; %p)\n",
   255			segtable, &_K_io_map);
   256	
   257		//  Should use set_pmd or whatever, but whatevs
   258		//  these are fixed 4k regardless of what the kernel is using for everything else
   259		*segtable = __pa(&_K_init_devicetable) | __HVM_PDE_S_4KB;
   260	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
