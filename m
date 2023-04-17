Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802C88832;
	Mon, 17 Apr 2023 19:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681758905; x=1713294905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WF6knhGuueSzZlctRE1cG3+Nq/0tkWLKvALsbix6KlI=;
  b=bgub6srRWMbQmH9WasTind+BAUdcnRBgly8frz4h/LQl6ntuzraUqyQs
   Ms670ZFla+hS3VNh3OWarpQ9G9+7HxtlD1G0Yk+y9FHsz7Xm/GWdrMoC/
   impqUzQg4lkk0ZD8Ri4RLoWURw8jR2Uj1BwmVuehH7bcq1KdOPXIxgr2J
   mKqjBioiDGyRuuiscfgWmcWsgFbnjcWEwMVu+1qheMm1BR++GrP0DFOys
   oQU2/4YpfXd1Bq6PezGKJNyCWixHQUW8tXKWOzgwL1XJQeqTLlHgNGTdS
   1ksERrtbZAX5k9fx60WQ4D5ky8LxlYgPOeGakuiLWj5JWnuX/yf7w5dzO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="407879512"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="407879512"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 12:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="814933018"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="814933018"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Apr 2023 12:15:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poUJa-000cdv-0p;
	Mon, 17 Apr 2023 19:15:02 +0000
Date: Tue, 18 Apr 2023 03:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Chancellor <nathan@kernel.org>
Subject: arch/powerpc/math-emu/fcmpu.c:13:2: error: variable 'A_c' set but
 not used
Message-ID: <202304180312.wHVhtwdk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a8f57ae2eb07ab39a6f0ccad60c760743051026
commit: 7245fc5bb7a966852d5bd7779d1f5855530b461a powerpc/math-emu: Remove -w build flag and fix warnings
date:   8 months ago
config: powerpc-mpc866_ads_defconfig (https://download.01.org/0day-ci/archive/20230418/202304180312.wHVhtwdk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7245fc5bb7a966852d5bd7779d1f5855530b461a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7245fc5bb7a966852d5bd7779d1f5855530b461a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/math-emu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180312.wHVhtwdk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/math-emu/fcmpu.c:13:2: error: variable 'A_c' set but not used [-Werror,-Wunused-but-set-variable]
           FP_DECL_D(A);
           ^
   include/math-emu/double.h:73:23: note: expanded from macro 'FP_DECL_D'
   #define FP_DECL_D(X)            _FP_DECL(2,X)
                                   ^
   include/math-emu/op-common.h:28:14: note: expanded from macro '_FP_DECL'
     _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
                ^
   <scratch space>:24:1: note: expanded from here
   A_c
   ^
>> arch/powerpc/math-emu/fcmpu.c:14:2: error: variable 'B_c' set but not used [-Werror,-Wunused-but-set-variable]
           FP_DECL_D(B);
           ^
   include/math-emu/double.h:73:23: note: expanded from macro 'FP_DECL_D'
   #define FP_DECL_D(X)            _FP_DECL(2,X)
                                   ^
   include/math-emu/op-common.h:28:14: note: expanded from macro '_FP_DECL'
     _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
                ^
   <scratch space>:30:1: note: expanded from here
   B_c
   ^
>> arch/powerpc/math-emu/fcmpu.c:15:2: error: variable '_fex' set but not used [-Werror,-Wunused-but-set-variable]
           FP_DECL_EX;
           ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
   #define FP_DECL_EX int _fex = 0
                          ^
   arch/powerpc/math-emu/fcmpu.c:11:1: error: no previous prototype for function 'fcmpu' [-Werror,-Wmissing-prototypes]
   fcmpu(u32 *ccr, int crfD, void *frA, void *frB)
   ^
   arch/powerpc/math-emu/fcmpu.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   4 errors generated.
--
>> arch/powerpc/math-emu/fctiw.c:14:2: error: variable '_fex' set but not used [-Werror,-Wunused-but-set-variable]
           FP_DECL_EX;
           ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
   #define FP_DECL_EX int _fex = 0
                          ^
   arch/powerpc/math-emu/fctiw.c:11:1: error: no previous prototype for function 'fctiw' [-Werror,-Wmissing-prototypes]
   fctiw(u32 *frD, void *frB)
   ^
   arch/powerpc/math-emu/fctiw.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   2 errors generated.
--
>> arch/powerpc/math-emu/fctiwz.c:14:2: error: variable '_fex' set but not used [-Werror,-Wunused-but-set-variable]
           FP_DECL_EX;
           ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
   #define FP_DECL_EX int _fex = 0
                          ^
   arch/powerpc/math-emu/fctiwz.c:11:1: error: no previous prototype for function 'fctiwz' [-Werror,-Wmissing-prototypes]
   fctiwz(u32 *frD, void *frB)
   ^
   arch/powerpc/math-emu/fctiwz.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   2 errors generated.
--
>> arch/powerpc/math-emu/fsel.c:14:2: error: variable '_fex' set but not used [-Werror,-Wunused-but-set-variable]
           FP_DECL_EX;
           ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
   #define FP_DECL_EX int _fex = 0
                          ^
   arch/powerpc/math-emu/fsel.c:11:1: error: no previous prototype for function 'fsel' [-Werror,-Wmissing-prototypes]
   fsel(u32 *frD, void *frA, u32 *frB, u32 *frC)
   ^
   arch/powerpc/math-emu/fsel.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   2 errors generated.


vim +/A_c +13 arch/powerpc/math-emu/fcmpu.c

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

:::::: The code at line 13 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
