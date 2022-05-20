Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034B415A2
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 00:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653006050; x=1684542050;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5diTvz+kKD/az/nO1rmCrCQZWJdS5S6es1coMOObzms=;
  b=UZDjM4Nx/Jh3fIWUolE7ax+0wo75WB36b9GRLUa9m4iWqDz1V6w+V4/c
   KF2XDsjOch/MVK9nmGEt75bQLM6m6oQQZmcJIe3/qiXewmlC4vGv0gw0D
   wZs0nok/DyH0QrDLnyVYKIx5UKOAw5OepFtfNOfwrKqyHnbm7gsd8tv8t
   UaeJYr9NsDzIXRxVAyBOyM1n/+JZ5/wnHuVTdg+mGSACpFMc3024G7ur4
   ntM2C5aZJNZ1i4cP/mrvJFj9/ntw44fDKOxRxkN+k11Bq83+CVcBtfoEB
   bqmR91BjS2hMMvhuHSBnk9hThkHEzA/fAr/7ma0zyHvWo7Kf41dHlHDHW
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="272557906"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="272557906"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 17:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="627881880"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 19 May 2022 17:20:48 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrqNs-000453-1E;
	Fri, 20 May 2022 00:20:48 +0000
Date: Fri, 20 May 2022 08:20:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: clang-15: error: linker command failed with exit code 1 (use -v to
 see invocation)
Message-ID: <202205200859.EVJYI18Y-lkp@intel.com>
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
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b015dcd62b86d298829990f8261d5d154b8d7af5
commit: 12318163737cd8808d13faa6e2393774191a6182 powerpc/32: Remove remaining .stabs annotations
date:   3 months ago
config: powerpc-skiroot_defconfig (https://download.01.org/0day-ci/archive/20220520/202205200859.EVJYI18Y-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=12318163737cd8808d13faa6e2393774191a6182
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 12318163737cd8808d13faa6e2393774191a6182
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

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
