Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269255381
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 21:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657919747; x=1689455747;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rDlZ+Hfy21GKlKkY4eQp+J6oyCGvCt2qKkU8wEvbix4=;
  b=VfPHk5cens0Q40tz7kzEeFXgLbKF+0RQkuPlB63YPcQIRwcilvA7AJrH
   gK9q59fPll+kRGatAYeNOi7WHKc/G6yczSPJ7Ryr2Vkre7ONPtTSTMYjo
   UQ9qOo5Wsqkc/9KemEIAhuS84orxy2TOgaqDXoooXeJhOPlVry6duGtIL
   nthBK/FX46GECvfoxS+gRAdmhwHzFShXX3ejVxH/u4IrIiPQYfoPwpBCR
   en5UFPh5nQ57huuwdmBbuYK/qKtReQlzdl94PAbn7L5KtM/ob/O7Sh1UO
   8xyhmbkIoWfd4m0tAjUhNM345HWU+OS2Kc5PuDW+FUSj3volFCY2LOutS
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="372216159"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="372216159"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 14:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="546799538"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Jul 2022 14:15:45 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCSf3-0000lU-09;
	Fri, 15 Jul 2022 21:15:45 +0000
Date: Sat, 16 Jul 2022 05:14:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: error: unknown target CPU 'loongson2f'
Message-ID: <202207160556.SeVLUqW4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b59ec8d50a1f28747ceff9a4f39af5deba9540e
commit: 13ceb48bc19c563e05f407e663aaa4105fdfd408 MIPS: Loongson2ef: Remove unnecessary {as,cc}-option calls
date:   7 months ago
config: mips-lemote2f_defconfig (https://download.01.org/0day-ci/archive/20220716/202207160556.SeVLUqW4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=13ceb48bc19c563e05f407e663aaa4105fdfd408
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 13ceb48bc19c563e05f407e663aaa4105fdfd408
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   clang-15: warning: argument unused during compilation: '-mno-branch-likely' [-Wunused-command-line-argument]
>> error: unknown target CPU 'loongson2f'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> error: unknown target CPU 'loongson2f'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:121: kernel/bounds.s] Error 1
   make[2]: Target 'missing-syscalls' not remade because of errors.
   make[1]: *** [arch/mips/Makefile:415: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
