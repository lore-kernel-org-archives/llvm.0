Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017355CA6
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 19:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662665852; x=1694201852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rznazf26ML4QoE3V0dodvHkodJfXcQbh8hyeQBZCcvQ=;
  b=l/unuxM4r0qSMzfcEAi+WO/HwC2EuxejLhBY4T2LtGlNm6bOozYNZd7p
   ckWv5GAUqjCTxLM3NedFSX+t46PjbqdhI4ScCKZHDgr8CCZiSNbmfwSdx
   g9ksDZJuMpE80bjIxvMXKB4ZfXJeSDQeH5c8xhl+Oz00HBtWEkFLn/H7X
   PLzrFm1H93wSWokQJVzNJaH/EXAuZEisx4F5Vh4m/y219URCkrG2+ngtO
   lSXw4fBuAtV2D2+D886DYwPqhGj3cMVqum/TPibE6bjbi+dGF/7W7K9EU
   JUxnVhG3wlOQWS3n1Znyzl+swRmphAs4AEGMPR3+H/HckKobmTecwYAr0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="277692968"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="277692968"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 12:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="566077023"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Sep 2022 12:37:28 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWNL5-0000Gj-16;
	Thu, 08 Sep 2022 19:37:27 +0000
Date: Fri, 9 Sep 2022 03:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [linux-next:master 4574/6188] arch/powerpc/math-emu/fre.c:6:5:
 warning: no previous prototype for function 'fre'
Message-ID: <202209090343.JPAFJt74-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47c191411b68a771261be3dc0bd6f68394cef358
commit: 7245fc5bb7a966852d5bd7779d1f5855530b461a [4574/6188] powerpc/math-emu: Remove -w build flag and fix warnings
config: powerpc-randconfig-r021-20220907 (https://download.01.org/0day-ci/archive/20220909/202209090343.JPAFJt74-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
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

>> arch/powerpc/math-emu/fre.c:6:5: warning: no previous prototype for function 'fre' [-Wmissing-prototypes]
   int fre(void *frD, void *frB)
       ^
   arch/powerpc/math-emu/fre.c:6:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fre(void *frD, void *frB)
   ^
   static 
   1 warning generated.
--
>> arch/powerpc/math-emu/fsqrt.c:11:1: warning: no previous prototype for function 'fsqrt' [-Wmissing-prototypes]
   fsqrt(void *frD, void *frB)
   ^
   arch/powerpc/math-emu/fsqrt.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 warning generated.
--
>> arch/powerpc/math-emu/fsqrts.c:12:1: warning: no previous prototype for function 'fsqrts' [-Wmissing-prototypes]
   fsqrts(void *frD, void *frB)
   ^
   arch/powerpc/math-emu/fsqrts.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 warning generated.
--
>> arch/powerpc/math-emu/frsqrtes.c:6:5: warning: no previous prototype for function 'frsqrtes' [-Wmissing-prototypes]
   int frsqrtes(void *frD, void *frB)
       ^
   arch/powerpc/math-emu/frsqrtes.c:6:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int frsqrtes(void *frD, void *frB)
   ^
   static 
   1 warning generated.
--
>> arch/powerpc/math-emu/mtfsf.c:10:1: warning: no previous prototype for function 'mtfsf' [-Wmissing-prototypes]
   mtfsf(unsigned int FM, u32 *frB)
   ^
   arch/powerpc/math-emu/mtfsf.c:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 warning generated.
--
>> arch/powerpc/math-emu/mtfsfi.c:10:1: warning: no previous prototype for function 'mtfsfi' [-Wmissing-prototypes]
   mtfsfi(unsigned int crfD, unsigned int IMM)
   ^
   arch/powerpc/math-emu/mtfsfi.c:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 warning generated.


vim +/fre +6 arch/powerpc/math-emu/fre.c

04ae9001719c3f Benjamin Herrenschmidt 2013-06-09  5  
04ae9001719c3f Benjamin Herrenschmidt 2013-06-09 @6  int fre(void *frD, void *frB)

:::::: The code at line 6 was first introduced by commit
:::::: 04ae9001719c3f0012d239a7c5aa4136f6b6541d powerpc/math-emu: Fix decoding of some instructions

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
