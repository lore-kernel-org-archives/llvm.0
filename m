Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885301C26;
	Mon, 13 Feb 2023 05:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676264889; x=1707800889;
  h=date:from:cc:subject:message-id:mime-version;
  bh=F6gLyuE3sb3APQsPvdUOmaqP/Q58dr8zUCLn1gHokb0=;
  b=HFnOix0F+zM3CLcWBK5ZqWK4lyQ+Yk5lXHWlPE3dx64e0/Dy2w8pM9MW
   Urcme/jswqCV8R28CiLKZiQuz0J6j+Fufy6uvn5ozWB5dnujfQA9A/qxg
   2cFMga/UVa0LFumLGLjoWP+saPDJM0kUh+FAsZ0DuVeOjWHsS50K8IC/T
   9966Wu4Rb2e9SeQhvnL1lXERbLWHO0VP6GTzP4Xxi/hov8z9Bqi1i/smh
   dZTRki//bZPKWU4tIMvTgQm1Ek9hQ8fAeqxOD+Q6Z8dNPB/WyreeEYrZm
   0U1joEtGQaTQ0MDiK7BPvVk+y09oaXyEW7nraHVnaD5ckEQWjDHknfWB6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332948834"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="332948834"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 21:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="737381012"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="737381012"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Feb 2023 21:08:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRR4Q-0007Zf-2w;
	Mon, 13 Feb 2023 05:08:06 +0000
Date: Mon, 13 Feb 2023 13:07:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [powerpc:next-test 4/100] error: unknown target CPU '8540'
Message-ID: <202302131303.BcWLpyNQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linuxppc-dev@lists.ozlabs.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   2b42c8057a19768a3f203feee8fe16965ff119b5
commit: 45f7091aac3546ef8112bf62836650ca0bbf0b79 [4/100] powerpc/64: Set default CPU in Kconfig
config: powerpc-ge_imp3a_defconfig (https://download.01.org/0day-ci/archive/20230213/202302131303.BcWLpyNQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=45f7091aac3546ef8112bf62836650ca0bbf0b79
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout 45f7091aac3546ef8112bf62836650ca0bbf0b79
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131303.BcWLpyNQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang-17: error: unsupported argument '-me500' to option '-Wa,'
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
>> error: unknown target CPU '8540'
   note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1285: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
