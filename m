Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A22F28
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660212580; x=1691748580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQJ0ihMHOcIFj3gQha1qaEQVsXUjw0GJBj/xpNMOpCk=;
  b=F38XBv3dn41lD9WWNuuHupYi0M6QEULEguuIhPq4gcbImTpo8zoKWFZG
   3OqzJMAL4IKSDcGVgAQWTbahdy7rIy6CRAMTNpAG640qSFHG/PU1JwNiB
   0Id17YkY+mFuMMq7mu4ahX3+X4q923TTC5jfFKZN3MRlXssYfcTR+0Pyh
   awo+Qqf1PLDReZVgOWLxEv0i7pvtWuZRksDy8dk8fzHCZ023kN04m11I0
   AHP1uA/9p0y5rnpS0ie0P67Sd7DxwZgpNnEgMeQOm1gkDxSfu8z5G1aCr
   upF6aNAODvviCRv9fTGYWYryCs8TgJwTtopX5bvPGeqvP7bpLcSDWYJgb
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="288878935"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="288878935"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 03:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="634167506"
Received: from lkp-server02.sh.intel.com (HELO cfab306db114) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 11 Aug 2022 03:09:38 -0700
Received: from kbuild by cfab306db114 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oM58D-00004R-1r;
	Thu, 11 Aug 2022 10:09:37 +0000
Date: Thu, 11 Aug 2022 18:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext 2/19] arch/arm64/mm/kasan_init.c:250:3: error: call to
 __compiletime_assert_373 declared with 'error' attribute: BUILD_BUG_ON
 failed: VMALLOC_START != MODULES_END
Message-ID: <202208111846.fJKatlNW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   6f969d4aee6bbafad356a7bae6e37d9e2dce9e08
commit: c05f74c98a295407b27a64d7b54e57e8b9822127 [2/19] arm64: place kernel in its own L0 page table entry
config: arm64-buildonly-randconfig-r006-20220810 (https://download.01.org/0day-ci/archive/20220811/202208111846.fJKatlNW-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm ktext
        git checkout c05f74c98a295407b27a64d7b54e57e8b9822127
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/mm/kasan_init.c:250:3: error: call to __compiletime_assert_373 declared with 'error' attribute: BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
                   BUILD_BUG_ON(VMALLOC_START != MODULES_END);
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:354:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:342:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:335:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:105:1: note: expanded from here
   __compiletime_assert_373
   ^
   1 error generated.


vim +/error +250 arch/arm64/mm/kasan_init.c

39d114ddc68223 Andrey Ryabinin  2015-10-12  213  
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  214  static void __init kasan_init_shadow(void)
39d114ddc68223 Andrey Ryabinin  2015-10-12  215  {
f9040773b7bbbd Ard Biesheuvel   2016-02-16  216  	u64 kimg_shadow_start, kimg_shadow_end;
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  217  	u64 mod_shadow_start, mod_shadow_end;
9a0732efa77418 Lecopzer Chen    2021-03-24  218  	u64 vmalloc_shadow_end;
b10d6bca87204c Mike Rapoport    2020-10-13  219  	phys_addr_t pa_start, pa_end;
b10d6bca87204c Mike Rapoport    2020-10-13  220  	u64 i;
39d114ddc68223 Andrey Ryabinin  2015-10-12  221  
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  222  	kimg_shadow_start = (u64)kasan_mem_to_shadow(KERNEL_START) & PAGE_MASK;
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  223  	kimg_shadow_end = PAGE_ALIGN((u64)kasan_mem_to_shadow(KERNEL_END));
f9040773b7bbbd Ard Biesheuvel   2016-02-16  224  
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  225  	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  226  	mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  227  
9a0732efa77418 Lecopzer Chen    2021-03-24  228  	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
9a0732efa77418 Lecopzer Chen    2021-03-24  229  
39d114ddc68223 Andrey Ryabinin  2015-10-12  230  	/*
39d114ddc68223 Andrey Ryabinin  2015-10-12  231  	 * We are going to perform proper setup of shadow memory.
0293c8ba807c86 Kyrylo Tkachov   2018-10-04  232  	 * At first we should unmap early shadow (clear_pgds() call below).
39d114ddc68223 Andrey Ryabinin  2015-10-12  233  	 * However, instrumented code couldn't execute without shadow memory.
39d114ddc68223 Andrey Ryabinin  2015-10-12  234  	 * tmp_pg_dir used to keep early shadow mapped until full shadow
39d114ddc68223 Andrey Ryabinin  2015-10-12  235  	 * setup will be finished.
39d114ddc68223 Andrey Ryabinin  2015-10-12  236  	 */
39d114ddc68223 Andrey Ryabinin  2015-10-12  237  	memcpy(tmp_pg_dir, swapper_pg_dir, sizeof(tmp_pg_dir));
c1a88e9124a499 Mark Rutland     2016-01-25  238  	dsb(ishst);
2077be6783b593 Laura Abbott     2017-01-10  239  	cpu_replace_ttbr1(lm_alias(tmp_pg_dir));
39d114ddc68223 Andrey Ryabinin  2015-10-12  240  
39d114ddc68223 Andrey Ryabinin  2015-10-12  241  	clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
39d114ddc68223 Andrey Ryabinin  2015-10-12  242  
e17d8025f07e4f Will Deacon      2017-11-15  243  	kasan_map_populate(kimg_shadow_start, kimg_shadow_end,
7d7b88ff5f8fd7 Lecopzer Chen    2021-03-24  244  			   early_pfn_to_nid(virt_to_pfn(lm_alias(KERNEL_START))));
f9040773b7bbbd Ard Biesheuvel   2016-02-16  245  
77ad4ce69321ab Mark Rutland     2019-08-14  246  	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  247  				   (void *)mod_shadow_start);
9a0732efa77418 Lecopzer Chen    2021-03-24  248  
9a0732efa77418 Lecopzer Chen    2021-03-24  249  	if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
9a0732efa77418 Lecopzer Chen    2021-03-24 @250  		BUILD_BUG_ON(VMALLOC_START != MODULES_END);
9a0732efa77418 Lecopzer Chen    2021-03-24  251  		kasan_populate_early_shadow((void *)vmalloc_shadow_end,
9a0732efa77418 Lecopzer Chen    2021-03-24  252  					    (void *)KASAN_SHADOW_END);
9a0732efa77418 Lecopzer Chen    2021-03-24  253  	} else {
9577dd74864877 Andrey Konovalov 2018-12-28  254  		kasan_populate_early_shadow((void *)kimg_shadow_end,
14c127c957c1c6 Steve Capper     2019-08-07  255  					    (void *)KASAN_SHADOW_END);
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  256  		if (kimg_shadow_start > mod_shadow_end)
9577dd74864877 Andrey Konovalov 2018-12-28  257  			kasan_populate_early_shadow((void *)mod_shadow_end,
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  258  						    (void *)kimg_shadow_start);
9a0732efa77418 Lecopzer Chen    2021-03-24  259  	}
f80fb3a3d50843 Ard Biesheuvel   2016-01-26  260  
b10d6bca87204c Mike Rapoport    2020-10-13  261  	for_each_mem_range(i, &pa_start, &pa_end) {
b10d6bca87204c Mike Rapoport    2020-10-13  262  		void *start = (void *)__phys_to_virt(pa_start);
b10d6bca87204c Mike Rapoport    2020-10-13  263  		void *end = (void *)__phys_to_virt(pa_end);
39d114ddc68223 Andrey Ryabinin  2015-10-12  264  
39d114ddc68223 Andrey Ryabinin  2015-10-12  265  		if (start >= end)
39d114ddc68223 Andrey Ryabinin  2015-10-12  266  			break;
39d114ddc68223 Andrey Ryabinin  2015-10-12  267  
e17d8025f07e4f Will Deacon      2017-11-15  268  		kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
3f9ec80f7b22ec Andrey Ryabinin  2017-07-10  269  				   (unsigned long)kasan_mem_to_shadow(end),
800cb2e553d445 Mark Rutland     2018-04-16  270  				   early_pfn_to_nid(virt_to_pfn(start)));
39d114ddc68223 Andrey Ryabinin  2015-10-12  271  	}
39d114ddc68223 Andrey Ryabinin  2015-10-12  272  
7b1af9795773d7 Ard Biesheuvel   2016-01-11  273  	/*
9577dd74864877 Andrey Konovalov 2018-12-28  274  	 * KAsan may reuse the contents of kasan_early_shadow_pte directly,
9577dd74864877 Andrey Konovalov 2018-12-28  275  	 * so we should make sure that it maps the zero page read-only.
7b1af9795773d7 Ard Biesheuvel   2016-01-11  276  	 */
7b1af9795773d7 Ard Biesheuvel   2016-01-11  277  	for (i = 0; i < PTRS_PER_PTE; i++)
9577dd74864877 Andrey Konovalov 2018-12-28  278  		set_pte(&kasan_early_shadow_pte[i],
9577dd74864877 Andrey Konovalov 2018-12-28  279  			pfn_pte(sym_to_pfn(kasan_early_shadow_page),
9577dd74864877 Andrey Konovalov 2018-12-28  280  				PAGE_KERNEL_RO));
7b1af9795773d7 Ard Biesheuvel   2016-01-11  281  
080eb83f54cf5b Andrey Konovalov 2018-12-28  282  	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
2077be6783b593 Laura Abbott     2017-01-10  283  	cpu_replace_ttbr1(lm_alias(swapper_pg_dir));
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  284  }
afe6ef80dcecf2 Andrey Konovalov 2020-12-22  285  

:::::: The code at line 250 was first introduced by commit
:::::: 9a0732efa77418fc85b1bdc5ddee619e62f59545 arm64: kasan: don't populate vmalloc area for CONFIG_KASAN_VMALLOC

:::::: TO: Lecopzer Chen <lecopzer.chen@mediatek.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
