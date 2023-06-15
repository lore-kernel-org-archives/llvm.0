Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80DCEAF0;
	Thu, 15 Jun 2023 19:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686859013; x=1718395013;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cWPQkrI1vH0GvJAOmIIymXog1dI5ezkrcJolaJcVPrA=;
  b=l5fK/ysEWApSeZyjhhDipXlRhofhTmNFcVPUvqPZQwoj5QL5OGIdSfEz
   xd+cknNxqbbgH+z0W2O252sB2QUFsMVYs5S3RJXmFamQX0fyuVsn5YeiJ
   gMfQQ60KZPZH3eulU7hbnO9f9DEB1OFNzPCz3jl2wIY8o2blM77ZJkphD
   wbUYxL/hICxB3me3Q2WJhzWi+BXHIskwM5BAhM83JURpUhLAYL34uHTGF
   MpYtJsdsIp2KxMd34ibboITt5sX8Raermh2TnK/Mt3kYz3BJjpw3GTk8M
   0v6S1l2VS7FgDZjWluqcL9+ZFYyC7qZGJIDhlD4ZMDa3elWFg0qo9SJ+3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362443447"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="362443447"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 12:56:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="782615946"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="782615946"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2023 12:56:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9t5M-0000L4-02;
	Thu, 15 Jun 2023 19:56:48 +0000
Date: Fri, 16 Jun 2023 03:56:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [powerpc:next-test 10/48] clang-15: error: unsupported option
 '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
Message-ID: <202306160335.cVKfCwNw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linuxppc-dev@lists.ozlabs.org
TO: Rohan McLure <rmclure@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi Rohan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   4adc95a3edc152ffc3b0c88117767a31c9c01a1e
commit: 95567f46b4d20c047750a5e3029461afcdc67697 [10/48] powerpc/{32,book3e}: kcsan: Extend KCSAN Support
config: powerpc-randconfig-r026-20230615 (https://download.01.org/0day-ci/archive/20230616/202306160335.cVKfCwNw-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=95567f46b4d20c047750a5e3029461afcdc67697
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout 95567f46b4d20c047750a5e3029461afcdc67697
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160335.cVKfCwNw-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> clang-15: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1 shuffle=1721340420
>> clang-15: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1721340420
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2 shuffle=1721340420
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2 shuffle=1721340420
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
