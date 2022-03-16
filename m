Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794E44687
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 04:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647405419; x=1678941419;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qGTcmZewtpFB/wihUaoLX+vvnOk6wMsser0w1QTbUCE=;
  b=dSIj0W0d5XuIv+Pnat9UC5ji+K7s/YfrH1LjhqetkbvXqH4oKgbArQvA
   tA772vHuKdcWLTYtsVux3jigtKF8wfHIJBn5IN+eBhF/VYD7csBxKBedf
   /UGADiyefZDkSiCDprBwk653DzQ/5qrveyE/9CS9klhwA214MqbCqqs4v
   smnmKbOTlgvLANU3DBZk3hDIHdY5FkDTK6f2MORbfGTZ1tfaxZTK8zLf2
   pW98hQUcWl83nxSfjght56+7Fr9C6RfZTv7HP2j6LvQmy839pN5yjRvPP
   8727k6zAohLi/0ddt+fCWOk0PCpz7H7xgKWEevuE+Xbk6Zol87mrxt2B6
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="255321210"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; 
   d="scan'208";a="255321210"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 21:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; 
   d="scan'208";a="498296492"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2022 21:36:57 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nULP6-000Bxs-Sv; Wed, 16 Mar 2022 04:36:56 +0000
Date: Wed, 16 Mar 2022 12:35:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: clang-15: error: linker command failed with exit code 1 (use -v to
 see invocation)
Message-ID: <202203161237.pnJESX8e-lkp@intel.com>
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
head:   56e337f2cf1326323844927a04e9dbce9a244835
commit: f5140cab448e4819ca6f158cb4130352f73c92e4 powerpc: check for support for -Wa,-m{power4,any}
date:   3 months ago
config: powerpc64-randconfig-r021-20220316 (https://download.01.org/0day-ci/archive/20220316/202203161237.pnJESX8e-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
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

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
