Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A4820EA
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 03:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652413775; x=1683949775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ME2ZL+mt1++5f9tX35mZwFH8UAz9iqrQXWcV9I2K9ug=;
  b=eqNL7ZMtz9twPBRTedz5jRhwDjbNBGsUakgoxCVyw6KoYta6acNAmE0u
   WRpQbavNKl423fPoi8eShj6kpa2Nd4Hw85bGAtMv3TVWf+vo0dhdyM8QS
   3WW4rMyLxLWLYSqiT+SOzMH80ohjqDtCKgZVKph0ptoZ3p8Vi/yvIRGJO
   MX/aFB+LUOsAJ3gqQKSg1QPQPVUbS0sFsygPyY9/dh5ak+Zd2HeSrW2Ic
   a2yAoF4HNVkMEfaIfjFrLdhG1kDAYQkxEVeoVe0go17tCEpSwbfj2HAIm
   9/vGDUER6JDPGQ1UftrLNG6gKZEF9uyInHW0pCCzErmS1Lqo+0IT5lexr
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="257751097"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="257751097"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 20:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="603672871"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 May 2022 20:49:33 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npMJ2-000LGu-VN;
	Fri, 13 May 2022 03:49:32 +0000
Date: Fri, 13 May 2022 11:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Minchan Kim <minchan@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5] mm: fix is_pinnable_page against on cma page
Message-ID: <202205131147.ag7UchTr-lkp@intel.com>
References: <20220512204143.3961150-1-minchan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512204143.3961150-1-minchan@kernel.org>

Hi Minchan,

I love your patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on linus/master v5.18-rc6]
[cannot apply to akpm-mm/mm-everything next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Minchan-Kim/mm-fix-is_pinnable_page-against-on-cma-page/20220513-044258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 0ac824f379fba2c2b17b75fd5ada69cd68c66348
config: mips-randconfig-c004-20220512 (https://download.01.org/0day-ci/archive/20220513/202205131147.ag7UchTr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519dacab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/cde6db32b52d5224e61443e12ccbc4c11fc583b0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Minchan-Kim/mm-fix-is_pinnable_page-against-on-cma-page/20220513-044258
        git checkout cde6db32b52d5224e61443e12ccbc4c11fc583b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:15:
>> include/linux/mm.h:1603:23: error: use of undeclared identifier '__mt'
           int mt = __READ_ONCE(__mt);
                                ^
>> include/linux/mm.h:1603:23: error: use of undeclared identifier '__mt'
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for function 'output_ptreg_defines' [-Wmissing-prototypes]
   void output_ptreg_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_ptreg_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for function 'output_task_defines' [-Wmissing-prototypes]
   void output_task_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:78:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_task_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:92:6: warning: no previous prototype for function 'output_thread_info_defines' [-Wmissing-prototypes]
   void output_thread_info_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_thread_info_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:108:6: warning: no previous prototype for function 'output_thread_defines' [-Wmissing-prototypes]
   void output_thread_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_thread_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for function 'output_mm_defines' [-Wmissing-prototypes]
   void output_mm_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_mm_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:218:6: warning: no previous prototype for function 'output_sc_defines' [-Wmissing-prototypes]
   void output_sc_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:218:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_sc_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:253:6: warning: no previous prototype for function 'output_signal_defined' [-Wmissing-prototypes]
   void output_signal_defined(void)
        ^
   arch/mips/kernel/asm-offsets.c:253:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_signal_defined(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:332:6: warning: no previous prototype for function 'output_pm_defines' [-Wmissing-prototypes]
   void output_pm_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:332:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_pm_defines(void)
   ^
   static 
   8 warnings and 2 errors generated.
   make[2]: *** [scripts/Makefile.build:120: arch/mips/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1194: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/__mt +1603 include/linux/mm.h

  1591	
  1592	/* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
  1593	#ifdef CONFIG_MIGRATION
  1594	static inline bool is_pinnable_page(struct page *page)
  1595	{
  1596	#ifdef CONFIG_CMA
  1597		/*
  1598		 * Defend against future compiler LTO features, or code refactoring
  1599		 * that inlines the above function, by forcing a single read. Because,
  1600		 * this routine races with set_pageblock_migratetype(), and we want to
  1601		 * avoid reading zero, when actually one or the other flags was set.
  1602		 */
> 1603		int mt = __READ_ONCE(__mt);
  1604	
  1605		if (mt & (MIGRATE_CMA | MIGRATE_ISOLATE))
  1606			return false;
  1607	#endif
  1608	
  1609		return !(is_zone_movable_page(page) || is_zero_pfn(page_to_pfn(page)));
  1610	}
  1611	#else
  1612	static inline bool is_pinnable_page(struct page *page)
  1613	{
  1614		return true;
  1615	}
  1616	#endif
  1617	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
