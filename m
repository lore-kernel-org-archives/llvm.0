Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D21FB8
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 01:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659145301; x=1690681301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ZFrWdT5w7fOlmSyxjoJaUmkPG4mqRS2WST55codl+Q=;
  b=f7zGyt6hVGBl3KDXy2dYBZZSz5GtrHt1ffseC8/f1H1fbGdv+04eNhG+
   KJFoPPHEAQHIxHalW74ltmjm+TqjCefBponv5nMo7PNp4ALJEx+5f5NPE
   HWBPD5H/UVDewjuyfs/dCFPjYg31NKT/oD0/HoFP5Eq3d+Gm094JRcbmd
   akXZvjntxp73YOzLGh5Z7G6Uv+zjdnWWrWonV3xn71Z2Gz/ffLj2d6CQo
   UErhJXN4TdLJi+uCKkTJrPZM0ZjV0UqVym/1sD4baYphrgcC5pu7uxXoP
   7KdPYaYqP+lBlDDZKS3dFkHWs1oY/hhq+WHRs83EwGIsUI2NdOO6rK2FG
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="289650272"
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; 
   d="scan'208";a="289650272"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 18:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; 
   d="scan'208";a="629581692"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Jul 2022 18:41:32 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHbTv-000CFh-1X;
	Sat, 30 Jul 2022 01:41:31 +0000
Date: Sat, 30 Jul 2022 09:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Atish Patra <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org
Subject: [atishp04:kvm_perf_rfc_snapshot 25/25]
 arch/riscv/kernel/vdso.c:22:8: error: redefinition of 'vdso_data'
Message-ID: <202207300903.wVzezhrh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_perf_rfc_snapshot
head:   42182a0a79a8768e22fd70232c3aca2bc1a26a43
commit: 42182a0a79a8768e22fd70232c3aca2bc1a26a43 [25/25] RISC-V: PoC for SBI PMU SNAPSHOT
config: riscv-randconfig-r042-20220729 (https://download.01.org/0day-ci/archive/20220730/202207300903.wVzezhrh-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/atishp04/linux/commit/42182a0a79a8768e22fd70232c3aca2bc1a26a43
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 kvm_perf_rfc_snapshot
        git checkout 42182a0a79a8768e22fd70232c3aca2bc1a26a43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/vdso.c:17:
   In file included from arch/riscv/include/asm/vdso/vsyscall.h:8:
   In file included from include/vdso/datapage.h:137:
   arch/riscv/include/asm/vdso/gettimeofday.h:21:31: error: use of undeclared identifier '__NR_gettimeofday'
           register long nr asm("a7") = __NR_gettimeofday;
                                        ^
   arch/riscv/include/asm/vdso/gettimeofday.h:37:31: error: use of undeclared identifier '__NR_clock_gettime'
           register long nr asm("a7") = __NR_clock_gettime;
                                        ^
   arch/riscv/include/asm/vdso/gettimeofday.h:53:31: error: use of undeclared identifier '__NR_clock_getres'
           register long nr asm("a7") = __NR_clock_getres;
                                        ^
>> arch/riscv/kernel/vdso.c:22:8: error: redefinition of 'vdso_data'
   struct vdso_data {
          ^
   include/vdso/datapage.h:90:8: note: previous definition is here
   struct vdso_data {
          ^
   4 errors generated.


vim +/vdso_data +22 arch/riscv/kernel/vdso.c

bb4a23c994aebc Tong Tiangen   2021-09-01  18  
0aa2ec8a475fb5 Guo Ren        2021-01-02  19  #ifdef CONFIG_GENERIC_TIME_VSYSCALL
ad5d1122b82fbd Vincent Chen   2020-06-09  20  #include <vdso/datapage.h>
ad5d1122b82fbd Vincent Chen   2020-06-09  21  #else
bb4a23c994aebc Tong Tiangen   2021-09-01 @22  struct vdso_data {
bb4a23c994aebc Tong Tiangen   2021-09-01  23  };
ad5d1122b82fbd Vincent Chen   2020-06-09  24  #endif
76d2a0493a17d4 Palmer Dabbelt 2017-07-10  25  

:::::: The code at line 22 was first introduced by commit
:::::: bb4a23c994aebcd96c567a0be8e964d516bd4a61 riscv/vdso: Refactor asm/vdso.h

:::::: TO: Tong Tiangen <tongtiangen@huawei.com>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
