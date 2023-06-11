Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD4180;
	Sun, 11 Jun 2023 00:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686442273; x=1717978273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NLEnkKYTvfD8Hk/fURnxd0K/bfOpBwUqsmlz/17e4gQ=;
  b=iGjGwCpJeXbiH1rYv2oWUX6hErJ64BI5Q9v2Ad5+k65/wLyg4vhL2/7h
   UGUe2jDRHHCp6STxO5YMuCHDkfrCTUhv6MoAi6N5UdJpCWkHJA39ZJ/5J
   G0TE8CO+o/ywf2aOA0ExpPTH50UKdT70wonsMI0EzWNBdSk/SP38CLf8M
   3oveUAstKheDabPpfur3oM+hmvOAwayq1voIGnmthmWu9QKMTtlledhnP
   IE5Dg5HyzV7AGmqHpZU/yd4RqbkjfNsQ9qu3aQ4OPup70w7tOrT1yHmOP
   ykbiN31jHgoG0Fiyg0tyTZNYyrxsLAZWB+BQe9WnwmsSk+GiWmqkA+xeE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="361177706"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="361177706"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 17:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="835031878"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="835031878"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Jun 2023 17:11:10 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q88fk-000AVY-12;
	Sun, 11 Jun 2023 00:11:08 +0000
Date: Sun, 11 Jun 2023 08:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol
 'misaligned_access_speed'; recompile with -fPIC
Message-ID: <202306110855.7TlBCIzI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   022ce8862dff83c859089cd14bc4dca0733e2f90
commit: 8dc2a7e8027fbeca0c7df81d4c82e735a59b5741 riscv: Fix relocatable kernels with early alternatives using -fno-pie
date:   10 days ago
config: riscv-randconfig-r022-20230611 (https://download.01.org/0day-ci/archive/20230611/202306110855.7TlBCIzI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
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
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110855.7TlBCIzI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'misaligned_access_speed'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/kernel/cpufeature.o)
   >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
   >>>               arch/riscv/errata/thead/errata.o:(thead_feature_probe_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'misaligned_access_speed'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/kernel/cpufeature.o)
   >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
   >>>               arch/riscv/errata/thead/errata.o:(thead_feature_probe_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'riscv_cbom_block_size'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/mm/cacheflush.o)
   >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_S cannot be used against symbol 'riscv_cbom_block_size'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/mm/cacheflush.o)
   >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '__per_cpu_offset'; recompile with -fPIC
   >>> defined in vmlinux.a(mm/percpu.o)
   >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
   >>>               arch/riscv/errata/thead/errata.o:(thead_feature_probe_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '__per_cpu_offset'; recompile with -fPIC
   >>> defined in vmlinux.a(mm/percpu.o)
   >>> referenced by errata.c:42 (arch/riscv/errata/thead/errata.c:42)
   >>>               arch/riscv/errata/thead/errata.o:(thead_feature_probe_func) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
