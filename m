Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C27C
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 22:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648506393; x=1680042393;
  h=date:from:cc:subject:message-id:mime-version;
  bh=eoZASWtwFG9UmTEvN6I46WyMlTUK9wqVGJctj9qaURM=;
  b=R+XaFmsEUa/6I9DQ9Km8QYs16IymeqHCsW5GY9jEpLGVFVfAV5Di+Puz
   d4aNBPn7Zvwn90hywkTGPOPZHkqlrF+h/7jUmRCXx7dsF/wmFkTBr6/U5
   0YlIhp+wIsJuBvtgetGG00dgIyYwHpMl8e39+xkQinEBHTOI5QMyAgYRl
   UCxvafiGxa1O6NWmbMIz9/VlinwcVnjgIhdoet68CiXRE70s2e0y0mXeA
   +L9CGY+X8321TNWHqbtHOX0MC5tZMnNcKI6qzMR9stBnPwD4aBfIdQ9Xa
   6k0P0+4OtmCuJh4fFwHAbHjMzZ87Ntn9gkwc0ZduCEpyOZP/Nuw7jV2jS
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="284007123"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; 
   d="scan'208";a="284007123"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2022 15:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; 
   d="scan'208";a="546136170"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 28 Mar 2022 15:26:31 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYxok-0002Mj-O3; Mon, 28 Mar 2022 22:26:30 +0000
Date: Tue, 29 Mar 2022 06:25:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: clang-15: error: linker command failed with exit code 1 (use -v to
 see invocation)
Message-ID: <202203290634.QGzqGiaj-lkp@intel.com>
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
TO: Daniel Axtens <dja@axtens.net>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Alexey Kardashevskiy <aik@ozlabs.ru>

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: f5140cab448e4819ca6f158cb4130352f73c92e4 powerpc: check for support for -Wa,-m{power4,any}
date:   3 months ago
config: powerpc64-randconfig-r035-20220327 (https://download.01.org/0day-ci/archive/20220329/202203290634.QGzqGiaj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f5140cab448e4819ca6f158cb4130352f73c92e4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f5140cab448e4819ca6f158cb4130352f73c92e4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   <stdin>:1559:2: warning: syscall futex_waitv not implemented [-W#warnings]
   #warning syscall futex_waitv not implemented
    ^
   1 warning generated.
   /usr/bin/ld: unrecognised emulation mode: elf64ppc
   Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu elf_l1om elf_k1om i386pep i386pe
>> clang-15: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [arch/powerpc/kernel/vdso64/Makefile:44: arch/powerpc/kernel/vdso64/vdso64.so.dbg] Error 1
   make[2]: Target 'include/generated/vdso64-offsets.h' not remade because of errors.
   make[1]: *** [arch/powerpc/Makefile:424: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
