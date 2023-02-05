Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0CD535;
	Sun,  5 Feb 2023 18:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675623028; x=1707159028;
  h=date:from:cc:subject:message-id:mime-version;
  bh=DPDt1pbOqSmPW00w6DpuQ/sMhypFmkqbes5I6Sb77xU=;
  b=X0spS/2SEAutHX/qnz6k6KpFpUgjHHS4nHVCN7PjhxmZBe/bUtCQg3HM
   q5GP+MBgXkXT2gGzAeRORmSDskzYJHHrGtSc3UFywjVYW/bmOUqYCChLi
   ZjsBO6QfIAf28VskXb7G6g15TwiZMDah4WZIAESXF8odPaqth2Q9u9IFo
   ZA0NBiF/h3stefF53AD8rnPTVTwNUsWIC4z0DzKh/7xt4Nrcd/lON/XKL
   druIqEWjli0FqIi3TYIoLBFODs39LL0vq3XXCsyYEA/HucSCYEetgOxtu
   lQ8lVBUdRW7dDo39JWuEv3TrYdqlnOZujPaJEtw+WEUUNuVQQoMyerhI2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="317082687"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="317082687"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 10:50:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="840160011"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="840160011"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Feb 2023 10:50:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOk5q-00029s-24;
	Sun, 05 Feb 2023 18:50:26 +0000
Date: Mon, 6 Feb 2023 02:49:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_sym_address: .text+0x1c): relocation R_RISCV_PCREL_HI20 out of
 range: -524541 is not in [-524288, 524287]; references
 kallsyms_relative_base
Message-ID: <202302060204.h7HchMBz-lkp@intel.com>
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
commit: 30f3bb09778de64ef9f23fb4bb5f868c4728a071 kallsyms: Add self-test facility
date:   3 months ago
config: riscv-randconfig-r004-20230204 (https://download.01.org/0day-ci/archive/20230206/202302060204.h7HchMBz-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=30f3bb09778de64ef9f23fb4bb5f868c4728a071
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 30f3bb09778de64ef9f23fb4bb5f868c4728a071
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_sym_address: .text+0x1c): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_sym_address: .text+0x28): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
