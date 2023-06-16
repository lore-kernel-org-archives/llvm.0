Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB9018C11;
	Fri, 16 Jun 2023 14:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686924512; x=1718460512;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YhLJmrat1rKC5Mk/FqLd7iLy7Ny9xkmqCloi625tITg=;
  b=Q+XnWPRvQd5Yrsx89LxGYQ378yMa/rmC1zwYcqe/dMgCfs8oZotDhtu1
   HFxwiXJRta9eXUP3HbfzbjbGcWewYFhEPpkX5WaHdDI0X7mXE+nHUzJpy
   Yg1iUEuItZZIa31B3kIsUTqrSq+2Yg0/HhMLUh4Be91d35ulvdp0eytz+
   KKr/XE6tASYR9DXp9J3FJ+GIG7UNIY5mhw/8TKLNNNFYF2HgwKfodiWZS
   qvH/7W7aLfQl8BkSqbecdGjHMtdVmegpsGIiZN5xBzCkuhz6bfxQD0gmS
   zU1l/pgHd4dMyaAmgI2ZG9qdluaqmm3O7GTl4o9Kw4z/tcloU2sWta+k5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="425156283"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="425156283"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 07:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="802841769"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="802841769"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2023 07:08:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAA7p-0001J6-2W;
	Fri, 16 Jun 2023 14:08:29 +0000
Date: Fri, 16 Jun 2023 22:08:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-6.1.y 4267/6769] error: unknown target CPU '8540'
Message-ID: <202306162205.sHQDwlgi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   ca87e77a2ef8b298aa9f69658d5898e72ee450fe
commit: da0beae2449376326086e9f57468fd2b64736d2a [4267/6769] powerpc/64: Set default CPU in Kconfig
config: powerpc-xes_mpc85xx_defconfig (https://download.01.org/0day-ci/archive/20230616/202306162205.sHQDwlgi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306162205.sHQDwlgi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306162205.sHQDwlgi-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   clang: error: unsupported argument '-me500' to option '-Wa,'
   make[2]: *** [scripts/Makefile.build:250: scripts/mod/empty.o] Error 1
>> error: unknown target CPU '8540'
   note: valid target CPU values are: generic, 440, 450, 601, 602, 603, 603e, 603ev, 604, 604e, 620, 630, g3, 7400, g4, 7450, g4+, 750, 8548, 970, g5, a2, e500, e500mc, e5500, power3, pwr3, power4, pwr4, power5, pwr5, power5x, pwr5x, power6, pwr6, power6x, pwr6x, power7, pwr7, power8, pwr8, power9, pwr9, power10, pwr10, powerpc, ppc, ppc32, powerpc64, ppc64, powerpc64le, ppc64le, future
   make[2]: *** [scripts/Makefile.build:118: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1288: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:238: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
