Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6658419BD9;
	Wed, 21 Jun 2023 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687384243; x=1718920243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bhaFYaMbuCU/fgptltxQVDExIqlPTB3QdadEnosF9kM=;
  b=L6g3IS6uPAIMf949HgsgLNr/hHXh0vpDO4XVCR0OpfEzWsk7pNJgDXw2
   /3qYmcoLs8Gch8JVq3RrR7sUn9I/IcNg4/7Eh/0kJPEiIxDMrPKI0v+ld
   qR338S5A8AtGXSlZB1MWtafFAPknUthI52ytav9N89uKRZVW9+OAV6M4W
   DoyKoW8AonTzMCIxoCGZqJbnu8fZ10Vy+00uZl9u7vlclkIS5ykYqBTC4
   gtj3c5ZKuxIOKF1EZrg/RyS75TfrEw/HugWzKc6lu/W3xbEI81i6J6EcL
   tUG17XIaqqPkmrhFeMHtVUCmZBpyNfmAAJiAvDOCBjX+H6B2bnvSYAdDq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="363734183"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="363734183"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 14:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="859163673"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="859163673"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2023 14:48:20 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC5gZ-00076t-1I;
	Wed, 21 Jun 2023 21:48:19 +0000
Date: Thu, 22 Jun 2023 05:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext 3/21] arch/arm64/mm/kasan_init.c:250:3: error: call to
 '__compiletime_assert_418' declared with 'error' attribute: BUILD_BUG_ON
 failed: VMALLOC_START != MODULES_END
Message-ID: <202306220554.Jm5uM3Di-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   c203c516d0467192ea874fb7eb958aec235130d4
commit: a6379ba80e13ea90194e9e074d821c32feaf4e1b [3/21] arm64: place kernel in its own L0 page table entry
config: arm64-randconfig-r005-20230622 (https://download.01.org/0day-ci/archive/20230622/202306220554.Jm5uM3Di-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220554.Jm5uM3Di-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220554.Jm5uM3Di-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/mm/kasan_init.c:250:3: error: call to '__compiletime_assert_418' declared with 'error' attribute: BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
     250 |                 BUILD_BUG_ON(VMALLOC_START != MODULES_END);
         |                 ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:49:1: note: expanded from here
      49 | __compiletime_assert_418
         | ^
   1 error generated.


vim +250 arch/arm64/mm/kasan_init.c

39d114ddc682230 Andrey Ryabinin  2015-10-12  213  
afe6ef80dcecf2c Andrey Konovalov 2020-12-22  214  static void __init kasan_init_shadow(void)
39d114ddc682230 Andrey Ryabinin  2015-10-12  215  {
f9040773b7bbbd9 Ard Biesheuvel   2016-02-16  216  	u64 kimg_shadow_start, kimg_shadow_end;
f80fb3a3d50843a Ard Biesheuvel   2016-01-26  217  	u64 mod_shadow_start, mod_shadow_end;
9a0732efa77418f Lecopzer Chen    2021-03-24  218  	u64 vmalloc_shadow_end;
b10d6bca87204cd Mike Rapoport    2020-10-13  219  	phys_addr_t pa_start, pa_end;
b10d6bca87204cd Mike Rapoport    2020-10-13  220  	u64 i;
39d114ddc682230 Andrey Ryabinin  2015-10-12  221  
7d7b88ff5f8fd79 Lecopzer Chen    2021-03-24  222  	kimg_shadow_start = (u64)kasan_mem_to_shadow(KERNEL_START) & PAGE_MASK;
7d7b88ff5f8fd79 Lecopzer Chen    2021-03-24  223  	kimg_shadow_end = PAGE_ALIGN((u64)kasan_mem_to_shadow(KERNEL_END));
f9040773b7bbbd9 Ard Biesheuvel   2016-02-16  224  
f80fb3a3d50843a Ard Biesheuvel   2016-01-26  225  	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
f80fb3a3d50843a Ard Biesheuvel   2016-01-26  226  	mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
f80fb3a3d50843a Ard Biesheuvel   2016-01-26  227  
9a0732efa77418f Lecopzer Chen    2021-03-24  228  	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
9a0732efa77418f Lecopzer Chen    2021-03-24  229  
39d114ddc682230 Andrey Ryabinin  2015-10-12  230  	/*
39d114ddc682230 Andrey Ryabinin  2015-10-12  231  	 * We are going to perform proper setup of shadow memory.
0293c8ba807c861 Kyrylo Tkachov   2018-10-04  232  	 * At first we should unmap early shadow (clear_pgds() call below).
39d114ddc682230 Andrey Ryabinin  2015-10-12  233  	 * However, instrumented code couldn't execute without shadow memory.
39d114ddc682230 Andrey Ryabinin  2015-10-12  234  	 * tmp_pg_dir used to keep early shadow mapped until full shadow
39d114ddc682230 Andrey Ryabinin  2015-10-12  235  	 * setup will be finished.
39d114ddc682230 Andrey Ryabinin  2015-10-12  236  	 */
39d114ddc682230 Andrey Ryabinin  2015-10-12  237  	memcpy(tmp_pg_dir, swapper_pg_dir, sizeof(tmp_pg_dir));
c1a88e9124a4999 Mark Rutland     2016-01-25  238  	dsb(ishst);
1682c45b920643c Ard Biesheuvel   2022-06-24  239  	cpu_replace_ttbr1(lm_alias(tmp_pg_dir), idmap_pg_dir);
39d114ddc682230 Andrey Ryabinin  2015-10-12  240  
39d114ddc682230 Andrey Ryabinin  2015-10-12  241  	clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
39d114ddc682230 Andrey Ryabinin  2015-10-12  242  
e17d8025f07e4fd Will Deacon      2017-11-15  243  	kasan_map_populate(kimg_shadow_start, kimg_shadow_end,
7d7b88ff5f8fd79 Lecopzer Chen    2021-03-24  244  			   early_pfn_to_nid(virt_to_pfn(lm_alias(KERNEL_START))));
f9040773b7bbbd9 Ard Biesheuvel   2016-02-16  245  
77ad4ce69321abb Mark Rutland     2019-08-14  246  	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
f80fb3a3d50843a Ard Biesheuvel   2016-01-26  247  				   (void *)mod_shadow_start);
9a0732efa77418f Lecopzer Chen    2021-03-24  248  
9a0732efa77418f Lecopzer Chen    2021-03-24  249  	if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
9a0732efa77418f Lecopzer Chen    2021-03-24 @250  		BUILD_BUG_ON(VMALLOC_START != MODULES_END);
9a0732efa77418f Lecopzer Chen    2021-03-24  251  		kasan_populate_early_shadow((void *)vmalloc_shadow_end,
9a0732efa77418f Lecopzer Chen    2021-03-24  252  					    (void *)KASAN_SHADOW_END);
9a0732efa77418f Lecopzer Chen    2021-03-24  253  	} else {
9577dd748648772 Andrey Konovalov 2018-12-28  254  		kasan_populate_early_shadow((void *)kimg_shadow_end,
14c127c957c1c60 Steve Capper     2019-08-07  255  					    (void *)KASAN_SHADOW_END);
f80fb3a3d50843a Ard Biesheuvel   2016-01-26  256  		if (kimg_shadow_start > mod_shadow_end)
9577dd748648772 Andrey Konovalov 2018-12-28  257  			kasan_populate_early_shadow((void *)mod_shadow_end,
f80fb3a3d50843a Ard Biesheuvel   2016-01-26  258  						    (void *)kimg_shadow_start);
9a0732efa77418f Lecopzer Chen    2021-03-24  259  	}
f80fb3a3d50843a Ard Biesheuvel   2016-01-26  260  
b10d6bca87204cd Mike Rapoport    2020-10-13  261  	for_each_mem_range(i, &pa_start, &pa_end) {
b10d6bca87204cd Mike Rapoport    2020-10-13  262  		void *start = (void *)__phys_to_virt(pa_start);
b10d6bca87204cd Mike Rapoport    2020-10-13  263  		void *end = (void *)__phys_to_virt(pa_end);
39d114ddc682230 Andrey Ryabinin  2015-10-12  264  
39d114ddc682230 Andrey Ryabinin  2015-10-12  265  		if (start >= end)
39d114ddc682230 Andrey Ryabinin  2015-10-12  266  			break;
39d114ddc682230 Andrey Ryabinin  2015-10-12  267  
e17d8025f07e4fd Will Deacon      2017-11-15  268  		kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
3f9ec80f7b22ec4 Andrey Ryabinin  2017-07-10  269  				   (unsigned long)kasan_mem_to_shadow(end),
800cb2e553d4454 Mark Rutland     2018-04-16  270  				   early_pfn_to_nid(virt_to_pfn(start)));
39d114ddc682230 Andrey Ryabinin  2015-10-12  271  	}
39d114ddc682230 Andrey Ryabinin  2015-10-12  272  
7b1af9795773d74 Ard Biesheuvel   2016-01-11  273  	/*
9577dd748648772 Andrey Konovalov 2018-12-28  274  	 * KAsan may reuse the contents of kasan_early_shadow_pte directly,
9577dd748648772 Andrey Konovalov 2018-12-28  275  	 * so we should make sure that it maps the zero page read-only.
7b1af9795773d74 Ard Biesheuvel   2016-01-11  276  	 */
7b1af9795773d74 Ard Biesheuvel   2016-01-11  277  	for (i = 0; i < PTRS_PER_PTE; i++)
9577dd748648772 Andrey Konovalov 2018-12-28  278  		set_pte(&kasan_early_shadow_pte[i],
9577dd748648772 Andrey Konovalov 2018-12-28  279  			pfn_pte(sym_to_pfn(kasan_early_shadow_page),
9577dd748648772 Andrey Konovalov 2018-12-28  280  				PAGE_KERNEL_RO));
7b1af9795773d74 Ard Biesheuvel   2016-01-11  281  
080eb83f54cf5b9 Andrey Konovalov 2018-12-28  282  	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
1682c45b920643c Ard Biesheuvel   2022-06-24  283  	cpu_replace_ttbr1(lm_alias(swapper_pg_dir), idmap_pg_dir);
afe6ef80dcecf2c Andrey Konovalov 2020-12-22  284  }
afe6ef80dcecf2c Andrey Konovalov 2020-12-22  285  

:::::: The code at line 250 was first introduced by commit
:::::: 9a0732efa77418fc85b1bdc5ddee619e62f59545 arm64: kasan: don't populate vmalloc area for CONFIG_KASAN_VMALLOC

:::::: TO: Lecopzer Chen <lecopzer.chen@mediatek.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
