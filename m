Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D190EA2D;
	Thu,  4 May 2023 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683195385; x=1714731385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EnVwmbutFKiPklxgJrhOzJkmouvnKx/lrrbvgBZN/2A=;
  b=fFSrEFH5S4nk3TTIoe+byHw0n3H0XY4TZJUPPRKVHzF4+Xabl+1mb2ZF
   3680zDeAaV4wAMgtPnSaMbE/IKCogLauBLKua8iY8gYgu9VOwAH6Yxp2C
   q7NYHhRJUAtF6BrDpMRLWgTeD2dWCu6F7p2yATBvhEGnCBQ4n+Zx+EET2
   sIkBlMghirihvhtnY2xSKMlO91Wwo+fPz6kKNU9ykL42jQqw0CCpbeFyo
   RjvTP4yYoimL6iW7TXc4qVobef55TjXKNbRppSFroDt852myIrBlHMq1O
   S5W5rb/qfhbtl2nCI24DaF7YMqFbyriLCImF0l39ReTeFtRM498z5RLMy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="350985093"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="350985093"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 03:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="691061706"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="691061706"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 May 2023 03:16:21 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puW0b-0002qH-05;
	Thu, 04 May 2023 10:16:21 +0000
Date: Thu, 4 May 2023 18:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efistub-cleanup 9/12]
 arch/x86/boot/compressed/pgtable_64.c:212:1: error: expected statement
Message-ID: <202305041840.yntDMMut-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-cleanup
head:   b5c6e7e9fc7da4ab714f4d1e399b84d7e3f66f88
commit: 67dd00f48bd9e38b1bbf430b3708ec63e88361d1 [9/12] x86: decompressor: Merge trampoline cleanup with switching code
config: x86_64-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230504/202305041840.yntDMMut-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=67dd00f48bd9e38b1bbf430b3708ec63e88361d1
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-efistub-cleanup
        git checkout 67dd00f48bd9e38b1bbf430b3708ec63e88361d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041840.yntDMMut-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/boot/compressed/pgtable_64.c:212:1: error: expected statement
   }
   ^
   1 error generated.


vim +212 arch/x86/boot/compressed/pgtable_64.c

1b3a62643660020 Kirill A. Shutemov 2018-08-01  103  
ccc1fb1f8cf153e Ard Biesheuvel     2023-05-03  104  asmlinkage void set_paging_levels(void *rmode)
4440977be1347d4 Kirill A. Shutemov 2018-02-09  105  {
67dd00f48bd9e38 Ard Biesheuvel     2023-05-03  106  	static u8 __section(".pgtable") __aligned(PAGE_SIZE) pgtable[PAGE_SIZE];
ccc1fb1f8cf153e Ard Biesheuvel     2023-05-03  107  	void (*toggle_la57)(void *trampoline, bool enable_5lvl);
67dd00f48bd9e38 Ard Biesheuvel     2023-05-03  108  	void *trampoline_pgtable;
cc303efcfd8c7a4 Ard Biesheuvel     2023-05-03  109  	bool l5_required;
08529078d8d9adf Kirill A. Shutemov 2017-12-04  110  
372fddf70904174 Kirill A. Shutemov 2018-05-18  111  	/* Initialize boot_params. Required for cmdline_find_option_bool(). */
372fddf70904174 Kirill A. Shutemov 2018-05-18  112  	boot_params = rmode;
372fddf70904174 Kirill A. Shutemov 2018-05-18  113  
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  114  	/*
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  115  	 * Check if LA57 is desired and supported.
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  116  	 *
372fddf70904174 Kirill A. Shutemov 2018-05-18  117  	 * There are several parts to the check:
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  118  	 *   - if the kernel supports 5-level paging: CONFIG_X86_5LEVEL=y
372fddf70904174 Kirill A. Shutemov 2018-05-18  119  	 *   - if user asked to disable 5-level paging: no5lvl in cmdline
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  120  	 *   - if the machine supports 5-level paging:
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  121  	 *     + CPUID leaf 7 is supported
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  122  	 *     + the leaf has the feature bit set
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  123  	 *
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  124  	 * That's substitute for boot_cpu_has() in early boot code.
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  125  	 */
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  126  	if (IS_ENABLED(CONFIG_X86_5LEVEL) &&
372fddf70904174 Kirill A. Shutemov 2018-05-18  127  			!cmdline_find_option_bool("no5lvl") &&
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  128  			native_cpuid_eax(0) >= 7 &&
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  129  			(native_cpuid_ecx(7) & (1 << (X86_FEATURE_LA57 & 31)))) {
cc303efcfd8c7a4 Ard Biesheuvel     2023-05-03  130  		l5_required = 1;
a403d798182f4f7 Kirill A. Shutemov 2018-02-26  131  	}
08529078d8d9adf Kirill A. Shutemov 2017-12-04  132  
cc303efcfd8c7a4 Ard Biesheuvel     2023-05-03  133  	/*
cc303efcfd8c7a4 Ard Biesheuvel     2023-05-03  134  	 * We are not going to use the trampoline if we
cc303efcfd8c7a4 Ard Biesheuvel     2023-05-03  135  	 * are already in the desired paging mode.
cc303efcfd8c7a4 Ard Biesheuvel     2023-05-03  136  	 */
cc303efcfd8c7a4 Ard Biesheuvel     2023-05-03  137  	if (l5_required == !!(native_read_cr4() & X86_CR4_LA57))
67dd00f48bd9e38 Ard Biesheuvel     2023-05-03  138  		goto out;
3548e131ec6a822 Kirill A. Shutemov 2018-02-26  139  
cc303efcfd8c7a4 Ard Biesheuvel     2023-05-03  140  	trampoline_32bit = (unsigned long *)find_trampoline_placement();
3548e131ec6a822 Kirill A. Shutemov 2018-02-26  141  
fb5268354d20b82 Kirill A. Shutemov 2018-02-26  142  	/* Preserve trampoline memory */
fb5268354d20b82 Kirill A. Shutemov 2018-02-26  143  	memcpy(trampoline_save, trampoline_32bit, TRAMPOLINE_32BIT_SIZE);
fb5268354d20b82 Kirill A. Shutemov 2018-02-26  144  
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  145  	/* Clear trampoline memory first */
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  146  	memset(trampoline_32bit, 0, TRAMPOLINE_32BIT_SIZE);
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  147  
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  148  	/* Copy trampoline code in place */
ccc1fb1f8cf153e Ard Biesheuvel     2023-05-03  149  	toggle_la57 = memcpy(trampoline_32bit +
86a7ad834a45ea9 Ard Biesheuvel     2023-05-03  150  			TRAMPOLINE_32BIT_CODE_OFFSET / sizeof(unsigned long),
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  151  			&trampoline_32bit_src, TRAMPOLINE_32BIT_CODE_SIZE);
32fcefa2bfc8961 Kirill A. Shutemov 2018-02-26  152  
86a7ad834a45ea9 Ard Biesheuvel     2023-05-03  153  	/*
86a7ad834a45ea9 Ard Biesheuvel     2023-05-03  154  	 * Avoid the need for a stack in the 32-bit trampoline code, by using
86a7ad834a45ea9 Ard Biesheuvel     2023-05-03  155  	 * LJMP rather than LRET to return back to long mode.  LJMP takes an
86a7ad834a45ea9 Ard Biesheuvel     2023-05-03  156  	 * immediate absolute address, so we have to adjust that based on the
86a7ad834a45ea9 Ard Biesheuvel     2023-05-03  157  	 * placement of the trampoline.
86a7ad834a45ea9 Ard Biesheuvel     2023-05-03  158  	 */
ccc1fb1f8cf153e Ard Biesheuvel     2023-05-03  159  	*(u32 *)((u8 *)toggle_la57 + trampoline_ljmp_imm_offset) +=
ccc1fb1f8cf153e Ard Biesheuvel     2023-05-03  160  						(unsigned long)toggle_la57;
86a7ad834a45ea9 Ard Biesheuvel     2023-05-03  161  
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  162  	/*
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  163  	 * The code below prepares page table in trampoline memory.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  164  	 *
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  165  	 * The new page table will be used by trampoline code for switching
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  166  	 * from 4- to 5-level paging or vice versa.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  167  	 */
67dd00f48bd9e38 Ard Biesheuvel     2023-05-03  168  	trampoline_pgtable = trampoline_32bit +
67dd00f48bd9e38 Ard Biesheuvel     2023-05-03  169  			     TRAMPOLINE_32BIT_PGTABLE_OFFSET / sizeof(unsigned long);
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  170  
cc303efcfd8c7a4 Ard Biesheuvel     2023-05-03  171  	if (l5_required) {
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  172  		/*
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  173  		 * For 4- to 5-level paging transition, set up current CR3 as
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  174  		 * the first and the only entry in a new top-level page table.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  175  		 */
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  176  		trampoline_32bit[TRAMPOLINE_32BIT_PGTABLE_OFFSET] = __native_read_cr3() | _PAGE_TABLE_NOENC;
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  177  	} else {
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  178  		unsigned long src;
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  179  
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  180  		/*
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  181  		 * For 5- to 4-level paging transition, copy page table pointed
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  182  		 * by first entry in the current top-level page table as our
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  183  		 * new top-level page table.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  184  		 *
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  185  		 * We cannot just point to the page table from trampoline as it
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  186  		 * may be above 4G.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  187  		 */
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  188  		src = *(unsigned long *)__native_read_cr3() & PAGE_MASK;
67dd00f48bd9e38 Ard Biesheuvel     2023-05-03  189  		memcpy(trampoline_pgtable, (void *)src, PAGE_SIZE);
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  190  	}
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  191  
cc303efcfd8c7a4 Ard Biesheuvel     2023-05-03  192  	toggle_la57(trampoline_32bit, l5_required);
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  193  
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  194  	/*
67dd00f48bd9e38 Ard Biesheuvel     2023-05-03  195  	 * Move the top level page table out of trampoline memory.
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  196  	 */
589bb62be316401 Kirill A. Shutemov 2018-05-16  197  	memcpy(pgtable, trampoline_pgtable, PAGE_SIZE);
589bb62be316401 Kirill A. Shutemov 2018-05-16  198  	native_write_cr3((unsigned long)pgtable);
e9d0e6330eb81ca Kirill A. Shutemov 2018-02-26  199  
fb5268354d20b82 Kirill A. Shutemov 2018-02-26  200  	/* Restore trampoline memory */
fb5268354d20b82 Kirill A. Shutemov 2018-02-26  201  	memcpy(trampoline_32bit, trampoline_save, TRAMPOLINE_32BIT_SIZE);
e5ceb9a02402b98 Arvind Sankar      2020-10-10  202  
67dd00f48bd9e38 Ard Biesheuvel     2023-05-03  203  out:
e5ceb9a02402b98 Arvind Sankar      2020-10-10  204  	/* Initialize variables for 5-level paging */
e5ceb9a02402b98 Arvind Sankar      2020-10-10  205  #ifdef CONFIG_X86_5LEVEL
e5ceb9a02402b98 Arvind Sankar      2020-10-10  206  	if (__read_cr4() & X86_CR4_LA57) {
e5ceb9a02402b98 Arvind Sankar      2020-10-10  207  		__pgtable_l5_enabled = 1;
e5ceb9a02402b98 Arvind Sankar      2020-10-10  208  		pgdir_shift = 48;
e5ceb9a02402b98 Arvind Sankar      2020-10-10  209  		ptrs_per_p4d = 512;
e5ceb9a02402b98 Arvind Sankar      2020-10-10  210  	}
e5ceb9a02402b98 Arvind Sankar      2020-10-10  211  #endif
fb5268354d20b82 Kirill A. Shutemov 2018-02-26 @212  }

:::::: The code at line 212 was first introduced by commit
:::::: fb5268354d20b82c12569e325b0d051c09f983f7 x86/boot/compressed/64: Save and restore trampoline memory

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
