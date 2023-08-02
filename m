Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F963C0;
	Wed,  2 Aug 2023 11:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690976284; x=1722512284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KzHpMYa2YX+7JCRMaapa2OxiUUc49nQWGd7iOGULhGk=;
  b=U+GpNp8QKNbedArNSpL/1kP/B0BDHcxfft+YSwom15+sFbmSvmiRFFQ0
   fpL58+x2gvKCB2PCSqpQCtiAQB8v/cG0bVkcEGmChe5rWTtSmxMXK99zK
   HY7b0MXFbKI0tkFqRoZ6x/ygHUid0bHpoGq2iqC95VlUr/oqeRFb8iPn/
   2YBJBURP/xeP7d8/rvk+RTTMAn6C+Hbjk0kLlfXRAa2uuWqfAm+Tn39Th
   CPYqK8HuWEVmfTl1BrSWWdfqyzHJks9/mjOHRb9D2qkbSH1MjjFi5i1tR
   m1CkVS7+OkY3Hgml5jI9g9MoZDCUpyZaut5FZv9z+WyqMOjXISMExqVZl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359597318"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="359597318"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 04:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="729076643"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="729076643"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Aug 2023 04:38:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRAAz-0001Bd-2R;
	Wed, 02 Aug 2023 11:38:01 +0000
Date: Wed, 2 Aug 2023 19:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:ktext-current 3/19] arch/arm64/mm/kasan_init.c:248:2:
 error: call to '__compiletime_assert_415' declared with 'error' attribute:
 BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
Message-ID: <202308021957.HNRIsqLw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm ktext-current
head:   f62358852613b0387dc8941896a2ac63ac520c9b
commit: a976a51f5a679dc2e4ee0239859ed09ea5fdfef7 [3/19] arm64: place kernel in its own L0 page table entry
config: arm64-randconfig-r014-20230731 (https://download.01.org/0day-ci/archive/20230802/202308021957.HNRIsqLw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021957.HNRIsqLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021957.HNRIsqLw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/mm/kasan_init.c:10:
   In file included from include/linux/kasan.h:20:
   In file included from arch/arm64/include/asm/kasan.h:8:
   arch/arm64/include/asm/memory.h:56:6: warning: 'CONFIG_ARM64_4K_PAGES' is not defined, evaluates to 0 [-Wundef]
      56 | #if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
         |      ^
   arch/arm64/include/asm/memory.h:57:6: warning: 'CONFIG_ARM64_16K_PAGES' is not defined, evaluates to 0 [-Wundef]
      57 |     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
         |      ^
>> arch/arm64/mm/kasan_init.c:248:2: error: call to '__compiletime_assert_415' declared with 'error' attribute: BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
     248 |         BUILD_BUG_ON(VMALLOC_START != MODULES_END);
         |         ^
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
   <scratch space>:176:1: note: expanded from here
     176 | __compiletime_assert_415
         | ^
   2 warnings and 1 error generated.


vim +248 arch/arm64/mm/kasan_init.c

39d114ddc68223 Andrey Ryabinin  2015-10-12  213  
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  214  static void __init kasan_init_shadow(void)
39d114ddc68223 Andrey Ryabinin  2015-10-12  215  {
f9040773b7bbbd Ard Biesheuvel   2016-02-16  216  	u64 kimg_shadow_start, kimg_shadow_end;
55123afffe931a Mark Rutland     2023-05-30  217  	u64 mod_shadow_start;
9a0732efa77418 Lecopzer Chen    2021-03-24  218  	u64 vmalloc_shadow_end;
b10d6bca87204c Mike Rapoport    2020-10-13  219  	phys_addr_t pa_start, pa_end;
b10d6bca87204c Mike Rapoport    2020-10-13  220  	u64 i;
39d114ddc68223 Andrey Ryabinin  2015-10-12  221  
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  222  	kimg_shadow_start = (u64)kasan_mem_to_shadow(KERNEL_START) & PAGE_MASK;
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  223  	kimg_shadow_end = PAGE_ALIGN((u64)kasan_mem_to_shadow(KERNEL_END));
f9040773b7bbbd Ard Biesheuvel   2016-02-16  224  
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  225  	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  226  
9a0732efa77418 Lecopzer Chen    2021-03-24  227  	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
9a0732efa77418 Lecopzer Chen    2021-03-24  228  
39d114ddc68223 Andrey Ryabinin  2015-10-12  229  	/*
39d114ddc68223 Andrey Ryabinin  2015-10-12  230  	 * We are going to perform proper setup of shadow memory.
0293c8ba807c86 Kyrylo Tkachov   2018-10-04  231  	 * At first we should unmap early shadow (clear_pgds() call below).
39d114ddc68223 Andrey Ryabinin  2015-10-12  232  	 * However, instrumented code couldn't execute without shadow memory.
39d114ddc68223 Andrey Ryabinin  2015-10-12  233  	 * tmp_pg_dir used to keep early shadow mapped until full shadow
39d114ddc68223 Andrey Ryabinin  2015-10-12  234  	 * setup will be finished.
39d114ddc68223 Andrey Ryabinin  2015-10-12  235  	 */
39d114ddc68223 Andrey Ryabinin  2015-10-12  236  	memcpy(tmp_pg_dir, swapper_pg_dir, sizeof(tmp_pg_dir));
c1a88e9124a499 Mark Rutland     2016-01-25  237  	dsb(ishst);
1682c45b920643 Ard Biesheuvel   2022-06-24  238  	cpu_replace_ttbr1(lm_alias(tmp_pg_dir), idmap_pg_dir);
39d114ddc68223 Andrey Ryabinin  2015-10-12  239  
39d114ddc68223 Andrey Ryabinin  2015-10-12  240  	clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
39d114ddc68223 Andrey Ryabinin  2015-10-12  241  
e17d8025f07e4f Will Deacon      2017-11-15  242  	kasan_map_populate(kimg_shadow_start, kimg_shadow_end,
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  243  			   early_pfn_to_nid(virt_to_pfn(lm_alias(KERNEL_START))));
f9040773b7bbbd Ard Biesheuvel   2016-02-16  244  
77ad4ce69321ab Mark Rutland     2019-08-14  245  	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  246  				   (void *)mod_shadow_start);
9a0732efa77418 Lecopzer Chen    2021-03-24  247  
9a0732efa77418 Lecopzer Chen    2021-03-24 @248  	BUILD_BUG_ON(VMALLOC_START != MODULES_END);
9a0732efa77418 Lecopzer Chen    2021-03-24  249  	kasan_populate_early_shadow((void *)vmalloc_shadow_end,
9a0732efa77418 Lecopzer Chen    2021-03-24  250  				    (void *)KASAN_SHADOW_END);
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  251  
b10d6bca87204c Mike Rapoport    2020-10-13  252  	for_each_mem_range(i, &pa_start, &pa_end) {
b10d6bca87204c Mike Rapoport    2020-10-13  253  		void *start = (void *)__phys_to_virt(pa_start);
b10d6bca87204c Mike Rapoport    2020-10-13  254  		void *end = (void *)__phys_to_virt(pa_end);
39d114ddc68223 Andrey Ryabinin  2015-10-12  255  
39d114ddc68223 Andrey Ryabinin  2015-10-12  256  		if (start >= end)
39d114ddc68223 Andrey Ryabinin  2015-10-12  257  			break;
39d114ddc68223 Andrey Ryabinin  2015-10-12  258  
e17d8025f07e4f Will Deacon      2017-11-15  259  		kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
3f9ec80f7b22ec Andrey Ryabinin  2017-07-10  260  				   (unsigned long)kasan_mem_to_shadow(end),
800cb2e553d445 Mark Rutland     2018-04-16  261  				   early_pfn_to_nid(virt_to_pfn(start)));
39d114ddc68223 Andrey Ryabinin  2015-10-12  262  	}
39d114ddc68223 Andrey Ryabinin  2015-10-12  263  
7b1af9795773d7 Ard Biesheuvel   2016-01-11  264  	/*
9577dd74864877 Andrey Konovalov 2018-12-28  265  	 * KAsan may reuse the contents of kasan_early_shadow_pte directly,
9577dd74864877 Andrey Konovalov 2018-12-28  266  	 * so we should make sure that it maps the zero page read-only.
7b1af9795773d7 Ard Biesheuvel   2016-01-11  267  	 */
7b1af9795773d7 Ard Biesheuvel   2016-01-11  268  	for (i = 0; i < PTRS_PER_PTE; i++)
9577dd74864877 Andrey Konovalov 2018-12-28  269  		set_pte(&kasan_early_shadow_pte[i],
9577dd74864877 Andrey Konovalov 2018-12-28  270  			pfn_pte(sym_to_pfn(kasan_early_shadow_page),
9577dd74864877 Andrey Konovalov 2018-12-28  271  				PAGE_KERNEL_RO));
7b1af9795773d7 Ard Biesheuvel   2016-01-11  272  
080eb83f54cf5b Andrey Konovalov 2018-12-28  273  	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
1682c45b920643 Ard Biesheuvel   2022-06-24  274  	cpu_replace_ttbr1(lm_alias(swapper_pg_dir), idmap_pg_dir);
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  275  }
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  276  

:::::: The code at line 248 was first introduced by commit
:::::: 9a0732efa77418fc85b1bdc5ddee619e62f59545 arm64: kasan: don't populate vmalloc area for CONFIG_KASAN_VMALLOC

:::::: TO: Lecopzer Chen <lecopzer.chen@mediatek.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
