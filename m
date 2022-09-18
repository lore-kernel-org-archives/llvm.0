Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC10648
	for <llvm@lists.linux.dev>; Sun, 18 Sep 2022 05:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663478000; x=1695014000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mToxFr5x1uRRdAs63WyzwxBvBM6oK2e2Md/COo97weo=;
  b=nPNve3ZhCbInr9z4F4TZjhetYfHJa8XKS3EiWItI2B5U4hj1P3qFk1qH
   cD3gwa3ezj0d+85uwmmM25bWkkdme2ytGtC6sR8QTVMKeX0l6SJ7/zOCj
   TqEygIk/wRvhf08xAIxU/nlhXGNPg/a4e1myoKKDBV76fggBdw7x18c2D
   Prra/X/9iS/DM/tDwI1zGUnvRsXEMAeTKeqR60Vab3WNi/jMcwxr1fpJz
   dMVvQAjD/k6A6HTYZj0ZYs9TJX3JAwZ2FAY+kDx7UywonVbLCUoce5ZpM
   zZF+TinrYW/lx3ZpvYZlNUjSjPxFOjVy9ttF1CHV0CPwUC4wzxdZacjBG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="363162802"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="363162802"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 22:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="946810456"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Sep 2022 22:13:18 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZmcH-0000uR-2F;
	Sun, 18 Sep 2022 05:13:17 +0000
Date: Sun, 18 Sep 2022 13:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [linux-next:master 4356/7639] arch/powerpc/math-emu/fcmpu.c:14:2:
 warning: variable 'B_c' set but not used
Message-ID: <202209181318.8gJoexZe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d5538ab91d3a9a237805be6f8c6c272af2987995
commit: 7245fc5bb7a966852d5bd7779d1f5855530b461a [4356/7639] powerpc/math-emu: Remove -w build flag and fix warnings
config: powerpc-randconfig-r026-20220918 (https://download.01.org/0day-ci/archive/20220918/202209181318.8gJoexZe-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7245fc5bb7a966852d5bd7779d1f5855530b461a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7245fc5bb7a966852d5bd7779d1f5855530b461a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/math-emu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/powerpc/math-emu/fcmpu.c:14:2: warning: variable 'B_c' set but not used [-Wunused-but-set-variable]
           FP_DECL_D(B);
           ^
   include/math-emu/double.h:73:23: note: expanded from macro 'FP_DECL_D'
   #define FP_DECL_D(X)            _FP_DECL(2,X)
                                   ^
   include/math-emu/op-common.h:28:14: note: expanded from macro '_FP_DECL'
     _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
                ^
   <scratch space>:126:1: note: expanded from here
   B_c
   ^
>> arch/powerpc/math-emu/fcmpu.c:15:2: warning: variable '_fex' set but not used [-Wunused-but-set-variable]
           FP_DECL_EX;
           ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
   #define FP_DECL_EX int _fex = 0
                          ^
>> arch/powerpc/math-emu/fcmpu.c:13:2: warning: variable 'A_c' set but not used [-Wunused-but-set-variable]
           FP_DECL_D(A);
           ^
   include/math-emu/double.h:73:23: note: expanded from macro 'FP_DECL_D'
   #define FP_DECL_D(X)            _FP_DECL(2,X)
                                   ^
   include/math-emu/op-common.h:28:14: note: expanded from macro '_FP_DECL'
     _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
                ^
   <scratch space>:120:1: note: expanded from here
   A_c
   ^
   arch/powerpc/math-emu/fcmpu.c:11:1: warning: no previous prototype for function 'fcmpu' [-Wmissing-prototypes]
   fcmpu(u32 *ccr, int crfD, void *frA, void *frB)
   ^
   arch/powerpc/math-emu/fcmpu.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   4 warnings generated.
--
>> arch/powerpc/math-emu/fctiw.c:14:2: warning: variable '_fex' set but not used [-Wunused-but-set-variable]
           FP_DECL_EX;
           ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
   #define FP_DECL_EX int _fex = 0
                          ^
   arch/powerpc/math-emu/fctiw.c:11:1: warning: no previous prototype for function 'fctiw' [-Wmissing-prototypes]
   fctiw(u32 *frD, void *frB)
   ^
   arch/powerpc/math-emu/fctiw.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   2 warnings generated.
--
>> arch/powerpc/math-emu/fctiwz.c:14:2: warning: variable '_fex' set but not used [-Wunused-but-set-variable]
           FP_DECL_EX;
           ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
   #define FP_DECL_EX int _fex = 0
                          ^
   arch/powerpc/math-emu/fctiwz.c:11:1: warning: no previous prototype for function 'fctiwz' [-Wmissing-prototypes]
   fctiwz(u32 *frD, void *frB)
   ^
   arch/powerpc/math-emu/fctiwz.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   2 warnings generated.
--
>> arch/powerpc/math-emu/fsel.c:14:2: warning: variable '_fex' set but not used [-Wunused-but-set-variable]
           FP_DECL_EX;
           ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
   #define FP_DECL_EX int _fex = 0
                          ^
   arch/powerpc/math-emu/fsel.c:11:1: warning: no previous prototype for function 'fsel' [-Wmissing-prototypes]
   fsel(u32 *frD, void *frA, u32 *frB, u32 *frC)
   ^
   arch/powerpc/math-emu/fsel.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   2 warnings generated.


vim +/B_c +14 arch/powerpc/math-emu/fcmpu.c

^1da177e4c3f41 arch/ppc/math-emu/fcmpu.c     Linus Torvalds 2005-04-16   9  
^1da177e4c3f41 arch/ppc/math-emu/fcmpu.c     Linus Torvalds 2005-04-16  10  int
^1da177e4c3f41 arch/ppc/math-emu/fcmpu.c     Linus Torvalds 2005-04-16  11  fcmpu(u32 *ccr, int crfD, void *frA, void *frB)
^1da177e4c3f41 arch/ppc/math-emu/fcmpu.c     Linus Torvalds 2005-04-16  12  {
^1da177e4c3f41 arch/ppc/math-emu/fcmpu.c     Linus Torvalds 2005-04-16 @13  	FP_DECL_D(A);
^1da177e4c3f41 arch/ppc/math-emu/fcmpu.c     Linus Torvalds 2005-04-16 @14  	FP_DECL_D(B);
d2b194ed820880 arch/powerpc/math-emu/fcmpu.c Kumar Gala     2008-06-04 @15  	FP_DECL_EX;
^1da177e4c3f41 arch/ppc/math-emu/fcmpu.c     Linus Torvalds 2005-04-16  16  	int code[4] = { (1 << 3), (1 << 1), (1 << 2), (1 << 0) };
^1da177e4c3f41 arch/ppc/math-emu/fcmpu.c     Linus Torvalds 2005-04-16  17  	long cmp;
^1da177e4c3f41 arch/ppc/math-emu/fcmpu.c     Linus Torvalds 2005-04-16  18  

:::::: The code at line 14 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
