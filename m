Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A7B23B4;
	Sun,  5 Feb 2023 09:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675589136; x=1707125136;
  h=date:from:cc:subject:message-id:mime-version;
  bh=T+t2lPWjZ6JDr+0Mr6Ed97R+98ua6Y+Y/PU5tFbagPE=;
  b=NBMzEpZv3NR+hnSgbE9urjwQ+uGNVxFZcbLUKsrnoq7P5wp20KwMpxy2
   UE9RclKLoNyoQqgnFiDYryx7vMMT4+MlRk4tz942rTRok9oRCUTEXIWf3
   ZsqSijbCVJDiwnk60kpKlX7krBQHCUKCFCYbqwEhIyHwPAGkhLtyTSi/O
   yIxgBWstVsqNasQhL/4BZdAB09Fw3Cwmx1u5RmCUy5IRNTpJfUdzi4ucQ
   1zfWACzsblqnXB9Yb91/xxI92pJEEXAUdBHVMem19dzTyItR8YEuXwk0X
   kdjQm4rFxjDH7Op0tPVBcwp5KnK8i11sOPM4l3eLB+N1jIlqN1LROSdFd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="329044772"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="329044772"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 01:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698556188"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="698556188"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 01:25:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pObGt-0001uH-0i;
	Sun, 05 Feb 2023 09:25:15 +0000
Date: Sun, 5 Feb 2023 17:24:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_on_each_match_symbol: .text+0x968): relocation R_RISCV_PCREL_HI20
 out of range: -524541 is not in [-524288, 524287]; references
 kallsyms_relative_base
Message-ID: <202302051709.TreBK7tf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Zhen Lei <thunder.leizhen@huawei.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

Hi Zhen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   837c07cf68fec9cad455d5fc86aab5350cc06c53
commit: 4dc533e0f2c04174e1ae4aa98e7cffc1c04b9998 kallsyms: Add helper kallsyms_on_each_match_symbol()
date:   3 months ago
config: riscv-randconfig-r004-20230204 (https://download.01.org/0day-ci/archive/20230205/202302051709.TreBK7tf-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4dc533e0f2c04174e1ae4aa98e7cffc1c04b9998
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4dc533e0f2c04174e1ae4aa98e7cffc1c04b9998
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x968): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x97c): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x984): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x138): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x160): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x168): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x170): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x178): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x27c): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
