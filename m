Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8E32F21
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643806799; x=1675342799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LynCLwbF9EN+rG44qGo/iOIXMcrHg+bxH1lDBLUd5Qc=;
  b=b2LmpNVhP9ZM3dQFFtTpWcZWGAvCp64kqJ0dFSTwUX2DgVWEFJDfqPkC
   FgQEgOxWsayXQmgKpUDkTtHAHiU71q4VkXHsERrz1oxyXfmZIEx6xfJBD
   DJIj7U4g8NIEF49hC4qVmO6tlyAa25/YTcaMq3hbM710zD5riilRAv/6n
   ZXiXLmVx9gVBappFu9z1KheCGY46U+qaUyPnjA9ZelWZMipukdfMvTXhb
   lQRIDiBvbCWIYm3LwiIswJ5VEjt8+EatFeZ6WMux5MFyANaYbnRbg581y
   g/5hTu0uJ7nA4rjWBuq2X9cRd43/1w5kW0cc3QZ9Ogi6VTE/APYbHwXIy
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="272392984"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; 
   d="scan'208";a="272392984"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 04:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; 
   d="scan'208";a="482817767"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Feb 2022 04:59:57 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFFEq-000Ubi-Rt; Wed, 02 Feb 2022 12:59:56 +0000
Date: Wed, 2 Feb 2022 20:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 4/4] [RFC] risc/kasan: Use kasan_pXX_table()
Message-ID: <202202022027.EbVWEX5c-lkp@intel.com>
References: <1f88cb32e438f9f29f45ae56849ac3fd94ec8a54.1643791473.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f88cb32e438f9f29f45ae56849ac3fd94ec8a54.1643791473.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Christophe,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v5.17-rc2]
[cannot apply to hnaz-mm/master next-20220202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/mm-kasan-Add-CONFIG_KASAN_SOFTWARE/20220202-164612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git ec2444530612a886b406e2830d7f314d1a07d4bb
config: riscv-randconfig-r023-20220131 (https://download.01.org/0day-ci/archive/20220202/202202022027.EbVWEX5c-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/bd60b87aa4be730854fcb270aba3d72b8ce32745
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/mm-kasan-Add-CONFIG_KASAN_SOFTWARE/20220202-164612
        git checkout bd60b87aa4be730854fcb270aba3d72b8ce32745
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/mm/kasan_init.c:112:23: error: passing 'pgd_t' to parameter of incompatible type 'p4d_t'
                   if (kasan_pud_table(*pgd))
                                       ^~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   include/linux/kasan.h:97:42: note: passing argument to parameter 'p4d' here
   static inline bool kasan_pud_table(p4d_t p4d)
                                            ^
>> arch/riscv/mm/kasan_init.c:112:23: error: passing 'pgd_t' to parameter of incompatible type 'p4d_t'
                   if (kasan_pud_table(*pgd))
                                       ^~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
   include/linux/kasan.h:97:42: note: passing argument to parameter 'p4d' here
   static inline bool kasan_pud_table(p4d_t p4d)
                                            ^
>> arch/riscv/mm/kasan_init.c:112:23: error: passing 'pgd_t' to parameter of incompatible type 'p4d_t'
                   if (kasan_pud_table(*pgd))
                                       ^~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   include/linux/kasan.h:97:42: note: passing argument to parameter 'p4d' here
   static inline bool kasan_pud_table(p4d_t p4d)
                                            ^
   3 errors generated.


vim +112 arch/riscv/mm/kasan_init.c

    93	
    94	static void __init kasan_populate_pud(pgd_t *pgd,
    95					      unsigned long vaddr, unsigned long end,
    96					      bool early)
    97	{
    98		phys_addr_t phys_addr;
    99		pud_t *pudp, *base_pud;
   100		unsigned long next;
   101	
   102		if (early) {
   103			/*
   104			 * We can't use pgd_page_vaddr here as it would return a linear
   105			 * mapping address but it is not mapped yet, but when populating
   106			 * early_pg_dir, we need the physical address and when populating
   107			 * swapper_pg_dir, we need the kernel virtual address so use
   108			 * pt_ops facility.
   109			 */
   110			base_pud = pt_ops.get_pud_virt(pfn_to_phys(_pgd_pfn(*pgd)));
   111		} else {
 > 112			if (kasan_pud_table(*pgd))
   113				base_pud = memblock_alloc(PTRS_PER_PUD * sizeof(pud_t), PAGE_SIZE);
   114			else
   115				base_pud = (pud_t *)pgd_page_vaddr(*pgd);
   116		}
   117	
   118		pudp = base_pud + pud_index(vaddr);
   119	
   120		do {
   121			next = pud_addr_end(vaddr, end);
   122	
   123			if (pud_none(*pudp) && IS_ALIGNED(vaddr, PUD_SIZE) && (next - vaddr) >= PUD_SIZE) {
   124				if (early) {
   125					phys_addr = __pa(((uintptr_t)kasan_early_shadow_pmd));
   126					set_pud(pudp, pfn_pud(PFN_DOWN(phys_addr), PAGE_TABLE));
   127					continue;
   128				} else {
   129					phys_addr = memblock_phys_alloc(PUD_SIZE, PUD_SIZE);
   130					if (phys_addr) {
   131						set_pud(pudp, pfn_pud(PFN_DOWN(phys_addr), PAGE_KERNEL));
   132						continue;
   133					}
   134				}
   135			}
   136	
   137			kasan_populate_pmd(pudp, vaddr, next);
   138		} while (pudp++, vaddr = next, vaddr != end);
   139	
   140		/*
   141		 * Wait for the whole PGD to be populated before setting the PGD in
   142		 * the page table, otherwise, if we did set the PGD before populating
   143		 * it entirely, memblock could allocate a page at a physical address
   144		 * where KASAN is not populated yet and then we'd get a page fault.
   145		 */
   146		if (!early)
   147			set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(base_pud)), PAGE_TABLE));
   148	}
   149	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
