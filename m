Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CDF6D6CA;
	Tue,  9 Jan 2024 03:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZ6qasHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704769412; x=1736305412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cq4xmqR6BRRAcXIoxkr7jGo6hTibPrU4MeNCnVfXROM=;
  b=lZ6qasHCwup/Eek6OFW37ykkpstdQTcSd02edZVVMJhCt9if7frHjWfn
   Dxm4WsgrPHWiLK/tOMQ0BoQrUPT+4yXNPuU17kCHF2S5dMlw/fP42tvDO
   zqYGOFmCKOmBoDZ2iU8g6ACpriy8U7jXPgm0HT0YdzBxi3Rtjs0AhJ3Zd
   Zy2nwTDJ1JIdaW0vxlIMGpIkxm59+HpKgFeB72Yxf5wmtQ5YcDN7qmE3l
   OhJssdn8UWITmGeMUG8rTOWXmNLu2DXXKlFmT2hYATLDjjulMa/wJ4541
   06OoyeTc2sfM0XzFwTLZqaL6+r1t3wVzyOK6JUvM1hfcO5iAZlOtEC3x7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484247020"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="484247020"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 19:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="774698511"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="774698511"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 08 Jan 2024 19:03:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN2Ol-0005Ob-0s;
	Tue, 09 Jan 2024 03:03:27 +0000
Date: Tue, 9 Jan 2024 11:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:aarch64/ktext/v6.7 3/20] arch/arm64/mm/kasan_init.c:248:2:
 error: call to '__compiletime_assert_418' declared with 'error' attribute:
 BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
Message-ID: <202401091117.puL3dDd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git aarch64/ktext/v6.7
head:   a9c4aba29b5db8c32c2b2372516046b044f0620c
commit: fbc642e74b68243828e8190723e51298ee152ac1 [3/20] arm64: place kernel in its own L0 page table entry
config: arm64-randconfig-001-20240109 (https://download.01.org/0day-ci/archive/20240109/202401091117.puL3dDd8-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401091117.puL3dDd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401091117.puL3dDd8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/mm/kasan_init.c:248:2: error: call to '__compiletime_assert_418' declared with 'error' attribute: BUILD_BUG_ON failed: VMALLOC_START != MODULES_END
     248 |         BUILD_BUG_ON(VMALLOC_START != MODULES_END);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:34:1: note: expanded from here
      34 | __compiletime_assert_418
         | ^
   1 error generated.


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
