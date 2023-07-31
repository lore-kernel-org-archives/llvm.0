Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075DF62D;
	Mon, 31 Jul 2023 03:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690775839; x=1722311839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YdTa927pxNiekVVILvmjD2ho5UjOjenDnP3CDC2vxf4=;
  b=ZN+nyKYD6lJMrZSlV+QsBDpHLfgbmuT+tOLnR8CaMhnbYqEY99HYyHrD
   m2ObtwKeKHFqniWH3a1z/RRp+jXjJVcay36e6p003CTKdAPC7Pc+m0ATY
   PYWcmGSV0b0PJSWjCZBRUjV45to7HyPWVT2deisHQTbK+zTXoIGfd+E4q
   R80+fduJTZMQVZzoyPnrDky11EraGPan7oUerrqtqn7ha4hvA/D+8fvzI
   Dz42Vjg/6eOmUc222bo3h6RZ9nR3IKjb5ueRRwUf1ohGyJq3rgzk7wXLR
   J7nejRA14kfGTP8omc7sJH0xCXxTCCD6O2rUizdxDamHnlPrLeANacUj0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="371624102"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="371624102"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 20:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="721916538"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="721916538"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Jul 2023 20:57:15 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQK1z-0004vD-01;
	Mon, 31 Jul 2023 03:57:15 +0000
Date: Mon, 31 Jul 2023 11:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [stable:linux-4.19.y 2317/9999] lib/mpi/generic_mpih-mul2.c:49:24:
 error: invalid use of a cast in a inline asm context requiring an lvalue:
 remove the cast or build with -fheinous-gnu-extensions
Message-ID: <202307311111.jPEdYIJR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fangrui,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   767049cead76cf699707290d5aeefb3e4d0d5b43
commit: 69c122751164c3c343eea205fd5c3e1d5132f967 [2317/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
config: mips-randconfig-r036-20230731 (https://download.01.org/0day-ci/archive/20230731/202307311111.jPEdYIJR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311111.jPEdYIJR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311111.jPEdYIJR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/netdevsim/netdev.c:167:35: warning: unused variable 'nsim_switchdev_ops' [-Wunused-const-variable]
     167 | static const struct switchdev_ops nsim_switchdev_ops = {
         |                                   ^
   1 warning generated.
--
>> lib/mpi/generic_mpih-mul2.c:49:24: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
      49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
     652 |         : "=l" ((USItype)(w0)), \
         |                 ~~~~~~~~~~^~~
>> lib/mpi/generic_mpih-mul2.c:49:3: error: invalid output constraint '=h' in asm
      49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ^
   lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
     653 |              "=h" ((USItype)(w1)) \
         |              ^
   2 errors generated.
--
   lib/mpi/generic_mpih-mul3.c:49:24: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
      49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
     652 |         : "=l" ((USItype)(w0)), \
         |                 ~~~~~~~~~~^~~
>> lib/mpi/generic_mpih-mul3.c:49:3: error: invalid output constraint '=h' in asm
      49 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ^
   lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
     653 |              "=h" ((USItype)(w1)) \
         |              ^
   2 errors generated.
--
>> lib/mpi/mpih-div.c:142:20: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
     142 |                                         umul_ppmm(n1, n0, d0, q);
         |                                         ~~~~~~~~~~~~~~^~~~~~~~~~
   lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
     652 |         : "=l" ((USItype)(w0)), \
         |                 ~~~~~~~~~~^~~
>> lib/mpi/mpih-div.c:142:6: error: invalid output constraint '=h' in asm
     142 |                                         umul_ppmm(n1, n0, d0, q);
         |                                         ^
   lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
     653 |              "=h" ((USItype)(w1)) \
         |              ^
   lib/mpi/mpih-div.c:205:20: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
     205 |                                         umul_ppmm(n1, n0, d1, q);
         |                                         ~~~~~~~~~~~~~~^~~~~~~~~~
   lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
     652 |         : "=l" ((USItype)(w0)), \
         |                 ~~~~~~~~~~^~~
   lib/mpi/mpih-div.c:205:6: error: invalid output constraint '=h' in asm
     205 |                                         umul_ppmm(n1, n0, d1, q);
         |                                         ^
   lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
     653 |              "=h" ((USItype)(w1)) \
         |              ^
   4 errors generated.
--
>> lib/mpi/generic_mpih-mul1.c:50:24: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
      50 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
     652 |         : "=l" ((USItype)(w0)), \
         |                 ~~~~~~~~~~^~~
>> lib/mpi/generic_mpih-mul1.c:50:3: error: invalid output constraint '=h' in asm
      50 |                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
         |                 ^
   lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
     653 |              "=h" ((USItype)(w1)) \
         |              ^
   2 errors generated.


vim +49 lib/mpi/generic_mpih-mul2.c

cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  31  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  32  mpi_limb_t
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  33  mpihelp_addmul_1(mpi_ptr_t res_ptr, mpi_ptr_t s1_ptr,
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  34  		 mpi_size_t s1_size, mpi_limb_t s2_limb)
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  35  {
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  36  	mpi_limb_t cy_limb;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  37  	mpi_size_t j;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  38  	mpi_limb_t prod_high, prod_low;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  39  	mpi_limb_t x;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  40  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  41  	/* The loop counter and index J goes from -SIZE to -1.  This way
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  42  	 * the loop becomes faster.  */
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  43  	j = -s1_size;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  44  	res_ptr -= j;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  45  	s1_ptr -= j;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  46  
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  47  	cy_limb = 0;
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31  48  	do {
cdec9cb5167ab1 Dmitry Kasatkin 2011-08-31 @49  		umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);

:::::: The code at line 49 was first introduced by commit
:::::: cdec9cb5167ab1113ba9c58e395f664d9d3f9acb crypto: GnuPG based MPI lib - source files (part 1)

:::::: TO: Dmitry Kasatkin <dmitry.kasatkin@intel.com>
:::::: CC: Dmitry Kasatkin <dmitry.kasatkin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
