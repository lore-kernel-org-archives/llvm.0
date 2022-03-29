Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37AB7C
	for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 10:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648550373; x=1680086373;
  h=date:from:cc:subject:message-id:mime-version;
  bh=76q5UM/XuK4nZJcvhUc9bRKEWO2ut3E6FwhD+m1RkwE=;
  b=hBRBQEtJ96MdNV8TzLtPBEq/8sLI/rjriQOE9zDwktnVT15KDtwkj/bh
   lCdDI3O9QSCZDexYtS3QTcrF7bcB932wgLe6pZ4ZMF8IUIxMgcyYMNMQd
   f+FuYpWaWziKlCwR4A1RRqi6yGk9cE27XL7ZO/0oh1YmLl2KjjPDnFf3A
   9dec94VGbQUssqHo6vpbYeMskQwIaAwTUCUxfDIqWPpfhh+B97x0hVK3r
   Z4XjPPjzwPR9vJAeSF6u6HesavVmEhsSvC27u4uqFhxufxJjNzYCMJAMJ
   xBDEgzkgSgjZcikadYY7UDsai+OQfRzGaoA2GK631ns79BxCmVeneTzyL
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="322402746"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="322402746"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 03:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="546337916"
Received: from lkp-server01.sh.intel.com (HELO 3965e2759b93) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Mar 2022 03:39:31 -0700
Received: from kbuild by 3965e2759b93 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nZ9G7-00007l-0C; Tue, 29 Mar 2022 10:39:31 +0000
Date: Tue, 29 Mar 2022 18:38:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: clang-15: error: linker command failed with exit code 1 (use -v to
 see invocation)
Message-ID: <202203291816.tZgWF63Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1930a6e739c4b4a654a69164dbe39e554d228915
commit: 12318163737cd8808d13faa6e2393774191a6182 powerpc/32: Remove remaining .stabs annotations
date:   7 weeks ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20220329/202203291816.tZgWF63Z-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=12318163737cd8808d13faa6e2393774191a6182
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 12318163737cd8808d13faa6e2393774191a6182
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   /usr/bin/ld: unrecognised emulation mode: elf32ppclinux
   Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu elf_l1om elf_k1om i386pep i386pe
>> clang-15: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [arch/powerpc/kernel/vdso32/Makefile:51: arch/powerpc/kernel/vdso32/vdso32.so.dbg] Error 1
   make[2]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[1]: *** [arch/powerpc/Makefile:423: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
