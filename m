Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAE912B87;
	Mon, 28 Aug 2023 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693238229; x=1724774229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QW3BkRYyDL/GETloI3TLUeyLY4P+wUl5KVJsBAzKuDg=;
  b=PA/u9Qa2kVc1CeruTDL/Arb8dskaJVRfmhXk3sNq3d/W2pwbYeEQJzn8
   uNCELnnTAcxXUIFs6slOIEfge8BRXuvTTplwtEjRC49iMFiQNKq+lBPI/
   nD20koiliTmLZnuKwUth79iLN0dnFG46nRqT0OzynI4R9Zh7G296pispD
   7R3P6/m+xZjvSl0jTaYRNLO0DD6sPf+7woIWpo8VeBmi6b6X+NnZa7z33
   9ezJ1LciJ7lXqvrTmHDsAz7dNdON4YMRwMWMQ8E5CUhd9NC2+NijXxtZK
   NWlOH4KOP5/rxNBr7g9VY9qOUiLY25+vBQn7XUTHUpFeevl7qodjEAbNk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="365340072"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="365340072"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 08:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881977407"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2023 08:56:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaebd-0007zr-0U;
	Mon, 28 Aug 2023 15:56:45 +0000
Date: Mon, 28 Aug 2023 23:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: arch/x86/include/asm/pgtable_32.h:68:5: warning: 'PTRS_PER_PMD' is
 not defined, evaluates to 0
Message-ID: <202308282335.fH9YoGYl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2dde18cd1d8fac735875f2e4987f11817cc0bc2c
commit: 80b6093b55e31c2c40ff082fb32523d4e852954f kbuild: add -Wundef to KBUILD_CPPFLAGS for W=1 builds
date:   9 months ago
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20230828/202308282335.fH9YoGYl-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230828/202308282335.fH9YoGYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308282335.fH9YoGYl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/head_32.S:29:
>> arch/x86/include/asm/pgtable_32.h:68:5: warning: 'PTRS_PER_PMD' is not defined, evaluates to 0 [-Wundef]
   #if PTRS_PER_PMD > 1
       ^
   1 warning generated.


vim +/PTRS_PER_PMD +68 arch/x86/include/asm/pgtable_32.h

^1da177e4c3f41 include/asm-i386/pgtable.h        Linus Torvalds  2005-04-16  58  
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  59  /*
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  60   * This is used to calculate the .brk reservation for initial pagetables.
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  61   * Enough space is reserved to allocate pagetables sufficient to cover all
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  62   * of LOWMEM_PAGES, which is an upper bound on the size of the direct map of
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  63   * lowmem.
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  64   *
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  65   * With PAE paging (PTRS_PER_PMD > 1), we allocate PTRS_PER_PGD == 4 pages for
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  66   * the PMD's in addition to the pages required for the last level pagetables.
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  67   */
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08 @68  #if PTRS_PER_PMD > 1
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  69  #define PAGE_TABLE_SIZE(pages) (((pages) / PTRS_PER_PMD) + PTRS_PER_PGD)
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  70  #else
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  71  #define PAGE_TABLE_SIZE(pages) ((pages) / PTRS_PER_PGD)
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  72  #endif
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  73  

:::::: The code at line 68 was first introduced by commit
:::::: 1e620f9b23e598ab936ece12233e98e97930b692 x86/boot/32: Convert the 32-bit pgtable setup code from assembly to C

:::::: TO: Boris Ostrovsky <boris.ostrovsky@oracle.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
