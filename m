Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441341775B;
	Fri,  7 Jul 2023 21:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688763854; x=1720299854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0lf4CsjZMU8LnsYZKbaFdjeTxKhkqzrAQoTvX3+RECU=;
  b=LHIq8nhCPvyYiA5JObgKAkbaDQipFiMOoMNs9mnHpuikNhnn/MB4cSUT
   2KlNY6aAw9k8S28sKc8nTFJH9vWAlyhxCp7zlvLBj8buqY5+Cp/MkU2DY
   xEmRwaSMBSKaTPEG2As6tWkrGrXsZK2H0OKcA1g9pMhfy18pfvJKmUtgV
   mHaRp0ZTquih3/+Sog4qfCnufy2wUPDFnifp3fuE3v3aMj3nXh5BFI9Oz
   std8THufgeW7KrbKUmxAta3cGB7f7IhV/gD/a+yTPmGQwiYiHW8VQsq7+
   cruyAu4WvoH6vmgg+rytUsEkbgSydXWFVHZkOhaPmtdSP/lKkv2vKuUh7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="353831012"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="353831012"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 14:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="670288208"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="670288208"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Jul 2023 14:04:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHscb-0002IG-2Z;
	Fri, 07 Jul 2023 21:04:09 +0000
Date: Sat, 8 Jul 2023 05:03:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Chancellor <nathan@kernel.org>
Subject: arch/powerpc/math-emu/fsel.c:14:2: warning: variable '_fex' set but
 not used
Message-ID: <202307080446.rpYEMqQ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4f6b6c2b2f86b7878a770736bf478d8a263ff0bc
commit: 7245fc5bb7a966852d5bd7779d1f5855530b461a powerpc/math-emu: Remove -w build flag and fix warnings
date:   10 months ago
config: powerpc-randconfig-r033-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080446.rpYEMqQ2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080446.rpYEMqQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080446.rpYEMqQ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/math-emu/fsel.c:14:2: warning: variable '_fex' set but not used [-Wunused-but-set-variable]
      14 |         FP_DECL_EX;
         |         ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
      94 | #define FP_DECL_EX int _fex = 0
         |                        ^
   arch/powerpc/math-emu/fsel.c:11:1: warning: no previous prototype for function 'fsel' [-Wmissing-prototypes]
      11 | fsel(u32 *frD, void *frA, u32 *frB, u32 *frC)
         | ^
   arch/powerpc/math-emu/fsel.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      10 | int
         | ^
         | static 
   2 warnings generated.
--
>> arch/powerpc/math-emu/fcmpu.c:13:2: warning: variable 'A_c' set but not used [-Wunused-but-set-variable]
      13 |         FP_DECL_D(A);
         |         ^
   include/math-emu/double.h:73:23: note: expanded from macro 'FP_DECL_D'
      73 | #define FP_DECL_D(X)            _FP_DECL(2,X)
         |                                 ^
   include/math-emu/op-common.h:28:14: note: expanded from macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |              ^
   <scratch space>:171:1: note: expanded from here
     171 | A_c
         | ^
>> arch/powerpc/math-emu/fcmpu.c:14:2: warning: variable 'B_c' set but not used [-Wunused-but-set-variable]
      14 |         FP_DECL_D(B);
         |         ^
   include/math-emu/double.h:73:23: note: expanded from macro 'FP_DECL_D'
      73 | #define FP_DECL_D(X)            _FP_DECL(2,X)
         |                                 ^
   include/math-emu/op-common.h:28:14: note: expanded from macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |              ^
   <scratch space>:177:1: note: expanded from here
     177 | B_c
         | ^
>> arch/powerpc/math-emu/fcmpu.c:15:2: warning: variable '_fex' set but not used [-Wunused-but-set-variable]
      15 |         FP_DECL_EX;
         |         ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
      94 | #define FP_DECL_EX int _fex = 0
         |                        ^
   arch/powerpc/math-emu/fcmpu.c:11:1: warning: no previous prototype for function 'fcmpu' [-Wmissing-prototypes]
      11 | fcmpu(u32 *ccr, int crfD, void *frA, void *frB)
         | ^
   arch/powerpc/math-emu/fcmpu.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      10 | int
         | ^
         | static 
   4 warnings generated.
--
>> arch/powerpc/math-emu/fctiwz.c:14:2: warning: variable '_fex' set but not used [-Wunused-but-set-variable]
      14 |         FP_DECL_EX;
         |         ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
      94 | #define FP_DECL_EX int _fex = 0
         |                        ^
   arch/powerpc/math-emu/fctiwz.c:11:1: warning: no previous prototype for function 'fctiwz' [-Wmissing-prototypes]
      11 | fctiwz(u32 *frD, void *frB)
         | ^
   arch/powerpc/math-emu/fctiwz.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      10 | int
         | ^
         | static 
   2 warnings generated.
--
>> arch/powerpc/math-emu/fctiw.c:14:2: warning: variable '_fex' set but not used [-Wunused-but-set-variable]
      14 |         FP_DECL_EX;
         |         ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
      94 | #define FP_DECL_EX int _fex = 0
         |                        ^
   arch/powerpc/math-emu/fctiw.c:11:1: warning: no previous prototype for function 'fctiw' [-Wmissing-prototypes]
      11 | fctiw(u32 *frD, void *frB)
         | ^
   arch/powerpc/math-emu/fctiw.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      10 | int
         | ^
         | static 
   2 warnings generated.


vim +/_fex +14 arch/powerpc/math-emu/fsel.c

^1da177e4c3f41 arch/ppc/math-emu/fsel.c     Linus Torvalds 2005-04-16   9  
^1da177e4c3f41 arch/ppc/math-emu/fsel.c     Linus Torvalds 2005-04-16  10  int
^1da177e4c3f41 arch/ppc/math-emu/fsel.c     Linus Torvalds 2005-04-16  11  fsel(u32 *frD, void *frA, u32 *frB, u32 *frC)
^1da177e4c3f41 arch/ppc/math-emu/fsel.c     Linus Torvalds 2005-04-16  12  {
^1da177e4c3f41 arch/ppc/math-emu/fsel.c     Linus Torvalds 2005-04-16  13  	FP_DECL_D(A);
d2b194ed820880 arch/powerpc/math-emu/fsel.c Kumar Gala     2008-06-04 @14  	FP_DECL_EX;
^1da177e4c3f41 arch/ppc/math-emu/fsel.c     Linus Torvalds 2005-04-16  15  

:::::: The code at line 14 was first introduced by commit
:::::: d2b194ed820880eb19c43b9c10d9f5f30026ee54 powerpc/math-emu: Use kernel generic math-emu code

:::::: TO: Kumar Gala <galak@kernel.crashing.org>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
