Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97D86AD9;
	Thu,  9 Mar 2023 11:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678359864; x=1709895864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5wM1O4ikIA5yw9zA5agdRC5u05e0s6lJ6GGz8wjHjw8=;
  b=Zwid4XK09rmjGXos4Ain2nSYRv2WAIYTgJ+hfgvVO+RbNysSk8N9U66S
   r1j0I3xwKKWOWQxjTmgDHuCTLNnF2MJTWv6UBca5lLVnuRdSc5F2uE3fc
   xJsBlIUXIV6MRycylTjhoVreBTlu49qxPGc31QKxsUsN+YXNe90Ps6kCW
   ACZuLN9UzEOP7YsJkCWmysl8f1CHOl47BuSsPYn2GPGReBMGFthb4z5FN
   Fis8iuxFvg8BU0wcomUSElzKI8yUdJdZ150txs2BJ0HMWs52oxfPEt1X9
   i8IOt1E+q/oKiHldWsXCQOYvmnTXm43EszE1nuC+/Qp2ofMuvhQS1s2Ct
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398994798"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="398994798"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 03:04:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="851475931"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="851475931"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Mar 2023 03:04:22 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paE4L-0002tt-2i;
	Thu, 09 Mar 2023 11:04:21 +0000
Date: Thu, 9 Mar 2023 19:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: Evgeniy Baskov <baskov@ispras.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:for-kernelci 5/23] arch/x86/mm/ident_map.c:19:8: warning: no
 previous prototype for function 'ident_split_large_pmd'
Message-ID: <202303091844.CayYEf0H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   307a19a22eea94622a082f1bce0959cfb6f7d9f7
commit: e5a05147bd0061090db95126181ff8096645fad6 [5/23] x86/boot: Support 4KB pages for identity mapping
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230309/202303091844.CayYEf0H-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=e5a05147bd0061090db95126181ff8096645fad6
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout e5a05147bd0061090db95126181ff8096645fad6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091844.CayYEf0H-lkp@intel.com/

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
