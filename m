Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBCDDDA8;
	Fri,  9 Jun 2023 11:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686308954; x=1717844954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wVr1kLbtriASKspXcRj+ZyuEM7xKec0xrsttnTYTUqQ=;
  b=FE3iSz7Nq2oO9QnSZmnBd23tO0t1iGt7FiYKprpYc/pbQA8nIM09STkD
   +aOndeEKtRSsptPDlx5fYSSZp0tWseV0Die5gcJ+cXNK9NLicyuAiUTuD
   T5dWZ9roNryC2eeaEZWh5xp9M5PYyZwfAYZK5RGzg5DwfrFVC/VhVDSZ/
   +QXJpsSDdFoMFwyF25BYJkhjwG5YfjCQaJy5SvnlScdk3qcxOoJMPHUIC
   y8yrMJb+KrsrmFe4op1nZ/1a/urKeUD4i8E6taH9qNOH5YiclfQWly9we
   fxOnesldzsplA7X9vuoYmnwhVwVxYILb3FJQ7E9sv2buLtOk+9AEMWMbJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="443942916"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="443942916"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 04:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713477018"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="713477018"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Jun 2023 04:09:07 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7ZzP-0008x1-0f;
	Fri, 09 Jun 2023 11:09:07 +0000
Date: Fri, 9 Jun 2023 19:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol
 '.L.str'; recompile with -fPIC
Message-ID: <202306091810.x8zmn8Qv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33f2b5785a2b6b0ed1948aafee60d3abb12f1e3a
commit: 8dc2a7e8027fbeca0c7df81d4c82e735a59b5741 riscv: Fix relocatable kernels with early alternatives using -fno-pie
date:   9 days ago
config: riscv-randconfig-r001-20230609 (https://download.01.org/0day-ci/archive/20230609/202306091810.x8zmn8Qv-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8dc2a7e8027fbeca0c7df81d4c82e735a59b5741
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8dc2a7e8027fbeca0c7df81d4c82e735a59b5741
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091810.x8zmn8Qv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '.L.str'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:0 (arch/riscv/errata/sifive/errata.c:0)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '.L.str'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:0 (arch/riscv/errata/sifive/errata.c:0)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '.L__unnamed_4'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:66 (arch/riscv/errata/sifive/errata.c:66)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '.L__unnamed_4'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:66 (arch/riscv/errata/sifive/errata.c:66)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '.L__unnamed_5'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:66 (arch/riscv/errata/sifive/errata.c:66)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '.L__unnamed_5'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:66 (arch/riscv/errata/sifive/errata.c:66)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '.L__unnamed_6'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:66 (arch/riscv/errata/sifive/errata.c:66)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '.L__unnamed_6'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:66 (arch/riscv/errata/sifive/errata.c:66)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '.L__unnamed_7'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:66 (arch/riscv/errata/sifive/errata.c:66)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '.L__unnamed_7'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:66 (arch/riscv/errata/sifive/errata.c:66)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '.L__unnamed_8'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:66 (arch/riscv/errata/sifive/errata.c:66)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
