Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB182F26
	for <llvm@lists.linux.dev>; Sat,  5 Feb 2022 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644049463; x=1675585463;
  h=date:from:cc:subject:message-id:mime-version;
  bh=mATHt/51mGqPE2hZXin3kI+JfGn2eEKHlsdPrNH9uLA=;
  b=eV609UpGhRMsjSrUHXxg80bY3mA4venvmaYVJvpicbiRafs8BGKQzg9C
   x2F9XfdDl9imoS/He8nRPcYzr1Gk+5+SyN49Ns5dOnbODKKYw3VqWwjba
   7QqpBKWmdcUQAJQ1tox4oMwGT5feG+XjfbL7DsMWD6JArdRbwXp0wvvsz
   SqDNX2wclMclzjZAcXlE4zQuLAZOFhS7bqWNOFJ/g20XShnhNJNx0pHqP
   80LuX/sVaNPpalI7GxZJ9SM3dk/3zzcfHeb+RwissfqrhSpxwpRAhPeJb
   dX+Tr6TzcBh6w7pfChgaam2+hLrl8Xb5ZuqWubBY9KXW7y3OYaXGNApd2
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="273006918"
X-IronPort-AV: E=Sophos;i="5.88,345,1635231600"; 
   d="scan'208";a="273006918"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2022 00:24:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,345,1635231600"; 
   d="scan'208";a="621075031"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Feb 2022 00:24:19 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nGGMk-000YnH-J1; Sat, 05 Feb 2022 08:24:18 +0000
Date: Sat, 5 Feb 2022 16:24:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: clang-15: error: linker command failed with exit code 1 (use -v to
 see invocation)
Message-ID: <202202051611.LE4aFKWX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Daniel Axtens <dja@axtens.net>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Alexey Kardashevskiy <aik@ozlabs.ru>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0457e5153e0e8420134f60921349099e907264ca
commit: f5140cab448e4819ca6f158cb4130352f73c92e4 powerpc: check for support for -Wa,-m{power4,any}
date:   6 weeks ago
config: powerpc64-randconfig-r022-20220204 (https://download.01.org/0day-ci/archive/20220205/202202051611.LE4aFKWX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 78c6b90000292eb37aac5dead6ab26611cd76f42)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64le-linux-gnu
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
   /usr/bin/ld: unrecognised emulation mode: elf64lppc
   Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu elf_l1om elf_k1om i386pep i386pe
>> clang-15: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [arch/powerpc/kernel/vdso64/Makefile:44: arch/powerpc/kernel/vdso64/vdso64.so.dbg] Error 1
   make[2]: Target 'include/generated/vdso64-offsets.h' not remade because of errors.
   make[1]: *** [arch/powerpc/Makefile:424: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
