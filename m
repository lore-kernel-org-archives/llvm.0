Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71F747F;
	Wed,  8 Mar 2023 14:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678287115; x=1709823115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=82zHbdHA3LGTfEv2fShHor44/p6WhEM+7UrkyocdcPg=;
  b=dK+0oexdukfyioyDCnvs7xBsxWY8sm8MyenuVtWdJXn24xt5XpSiBLhT
   DWymhzbSVfRv7ofqMHxCHl56xaIkEcI/wUVLW19d/i9FZhoxIdhvUrZSg
   yNUYfSpph4u5p+R3FT7H7xF8LTITKafzLJuz33JP2VxYvIPTPAsRIajDz
   a7l8noqWeD1kN0V3Ney5rzkAc8Q9r1QQXYg0p8uWbNJru2p84DknQwT29
   RbgW7gZQlz0NrqFOM9Ov6zN98ic3icAoKjit2FmW3nWax/F9xcYITv2lW
   qMTG7Xh9o5lmbka+AGgOWdgJov+/FnBmPnU1gldg6idcgHZr84dF8CHhU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="363806093"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="363806093"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 06:51:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="766009451"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="766009451"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 06:51:47 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZv8t-0002Br-02;
	Wed, 08 Mar 2023 14:51:47 +0000
Date: Wed, 8 Mar 2023 22:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Evgeniy Baskov <baskov@ispras.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:efi-x86-nx 5/24] arch/x86/mm/ident_map.c:19:8: warning: no
 previous prototype for function 'ident_split_large_pmd'
Message-ID: <202303082219.1MyCkO2j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-x86-nx
head:   8171142f3e4c96f6be75a6195de59d1607f1bd4b
commit: 26f02800cb89d842e554a5e030a40560adc7221b [5/24] x86/boot: Support 4KB pages for identity mapping
config: x86_64-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230308/202303082219.1MyCkO2j-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=26f02800cb89d842e554a5e030a40560adc7221b
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-x86-nx
        git checkout 26f02800cb89d842e554a5e030a40560adc7221b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/mm/ kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082219.1MyCkO2j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/mm/init_64.c:61:
>> arch/x86/mm/ident_map.c:19:8: warning: no previous prototype for function 'ident_split_large_pmd' [-Wmissing-prototypes]
   pte_t *ident_split_large_pmd(struct x86_mapping_info *info,
          ^
   arch/x86/mm/ident_map.c:19:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   pte_t *ident_split_large_pmd(struct x86_mapping_info *info,
   ^
   static 
>> arch/x86/mm/ident_map.c:102:8: warning: no previous prototype for function 'ident_split_large_pud' [-Wmissing-prototypes]
   pmd_t *ident_split_large_pud(struct x86_mapping_info *info,
          ^
   arch/x86/mm/ident_map.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   pmd_t *ident_split_large_pud(struct x86_mapping_info *info,
   ^
   static 
   2 warnings generated.


vim +/ident_split_large_pmd +19 arch/x86/mm/ident_map.c

    18	
  > 19	pte_t *ident_split_large_pmd(struct x86_mapping_info *info,
    20				     pmd_t *pmdp, unsigned long page_addr)
    21	{
    22		unsigned long pmd_addr, page_flags;
    23		pte_t *pte;
    24	
    25		pte = (pte_t *)info->alloc_pgt_page(info->context);
    26		if (!pte)
    27			return NULL;
    28	
    29		pmd_addr = page_addr & PMD_MASK;
    30	
    31		/* Not a large page - clear PSE flag */
    32		page_flags = pmd_flags(*pmdp) & ~_PSE;
    33		ident_pte_init(info, pte, pmd_addr, pmd_addr + PMD_SIZE, page_flags);
    34	
    35		return pte;
    36	}
    37	
    38	static int ident_pmd_init(struct x86_mapping_info *info, pmd_t *pmd_page,
    39				  unsigned long addr, unsigned long end,
    40				  unsigned long flags)
    41	{
    42		unsigned long next;
    43		bool new_table = 0;
    44	
    45		for (; addr < end; addr = next) {
    46			pmd_t *pmd = pmd_page + pmd_index(addr);
    47			pte_t *pte;
    48	
    49			next = (addr & PMD_MASK) + PMD_SIZE;
    50			if (next > end)
    51				next = end;
    52	
    53			/*
    54			 * Use 2M pages if 4k pages are not allowed or
    55			 * we are not mapping extra, i.e. address and size are aligned.
    56			 */
    57	
    58			if (!info->allow_4kpages ||
    59			    (!(addr & ~PMD_MASK) && next == addr + PMD_SIZE)) {
    60	
    61				pmd_t pmdval;
    62	
    63				addr &= PMD_MASK;
    64				pmdval = __pmd((addr - info->offset) | flags | _PSE);
    65				set_pmd(pmd, pmdval);
    66				continue;
    67			}
    68	
    69			/*
    70			 * If currently mapped page is large, we need to split it.
    71			 * The case when we don't can remap 2M page to 2M page
    72			 * with different flags is already covered above.
    73			 *
    74			 * If there's nothing mapped to desired address,
    75			 * we need to allocate new page table.
    76			 */
    77	
    78			if (pmd_large(*pmd)) {
    79				pte = ident_split_large_pmd(info, pmd, addr);
    80				new_table = 1;
    81			} else if (!pmd_present(*pmd)) {
    82				pte = (pte_t *)info->alloc_pgt_page(info->context);
    83				new_table = 1;
    84			} else {
    85				pte = pte_offset_kernel(pmd, 0);
    86				new_table = 0;
    87			}
    88	
    89			if (!pte)
    90				return -ENOMEM;
    91	
    92			ident_pte_init(info, pte, addr, next, flags);
    93	
    94			if (new_table)
    95				set_pmd(pmd, __pmd(__pa(pte) | info->kernpg_flag));
    96		}
    97	
    98		return 0;
    99	}
   100	
   101	
 > 102	pmd_t *ident_split_large_pud(struct x86_mapping_info *info,
   103				     pud_t *pudp, unsigned long page_addr)
   104	{
   105		unsigned long pud_addr, page_flags;
   106		pmd_t *pmd;
   107	
   108		pmd = (pmd_t *)info->alloc_pgt_page(info->context);
   109		if (!pmd)
   110			return NULL;
   111	
   112		pud_addr = page_addr & PUD_MASK;
   113	
   114		/* Not a large page - clear PSE flag */
   115		page_flags = pud_flags(*pudp) & ~_PSE;
   116		ident_pmd_init(info, pmd, pud_addr, pud_addr + PUD_SIZE, page_flags);
   117	
   118		return pmd;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
