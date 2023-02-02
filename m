Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3057FF;
	Thu,  2 Feb 2023 01:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675301107; x=1706837107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3RSkqrrFO8fpnYnRP5yAD/BYgc0GsnpjuHsgp1sSgc=;
  b=UU20daUgPKkOx8gbm1cBhRYA6RbM1Xemhc7dT4toCbHspqlUoPq56d3u
   /h3+wQNuQ8VCS/gYqhJCILsrnKCrVkmAs1m3/a0duX3Xtvb6ODm0CdJL2
   /gXf3hWE9y48zzWNL2j1gEHUXmLEwaL1np19GgZ9CoAhtSCBIxNuISjE+
   wD22BmCw17GfpYC4P8uIHN/07GrE7YTnYSz6G7ZzdFxXZmx4QcoJJzCTu
   wl5h8y2/XdQ7T2U7i3LYcfj7dZs8rZSYQZZQ27ZkGJ5JSaYRc5ckqZ+YH
   hyEvz+a3NrSGe4AIgG/zsAM5ZzdfpqSYl3DO6+kodnBDJnkMCe4NRke5d
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="328334751"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="328334751"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 17:25:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695579226"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="695579226"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Feb 2023 17:25:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNOLU-0005yq-0m;
	Thu, 02 Feb 2023 01:25:00 +0000
Date: Thu, 2 Feb 2023 09:24:30 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3 18/25]
 arch/riscv/mm/physaddr.c:15:13: error: expected identifier or '('
Message-ID: <202302020914.8eHPVPCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3
head:   ac3cfb78163256f2febd47ebd017d9f5b75820dd
commit: d047dc9f56633d427434d6593fce94cf1190abe8 [18/25] riscv: Make virt_to_pfn() a real function
config: riscv-randconfig-r042-20230129 (https://download.01.org/0day-ci/archive/20230202/202302020914.8eHPVPCn-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=d047dc9f56633d427434d6593fce94cf1190abe8
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3
        git checkout d047dc9f56633d427434d6593fce94cf1190abe8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/mm/physaddr.c:15:13: error: expected identifier or '('
   phys_addr_t __phys_addr_symbol(unsigned long x)
               ^
   arch/riscv/include/asm/page.h:154:31: note: expanded from macro '__phys_addr_symbol'
   #define __phys_addr_symbol(x)   __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:142:32: note: expanded from macro '__va_to_pa_nodebug'
   #define __va_to_pa_nodebug(x)   ({                                              \
                                    ^
>> arch/riscv/mm/physaddr.c:15:13: error: expected ')'
   arch/riscv/include/asm/page.h:154:31: note: expanded from macro '__phys_addr_symbol'
   #define __phys_addr_symbol(x)   __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:142:32: note: expanded from macro '__va_to_pa_nodebug'
   #define __va_to_pa_nodebug(x)   ({                                              \
                                    ^
   arch/riscv/mm/physaddr.c:15:13: note: to match this '('
   arch/riscv/include/asm/page.h:154:31: note: expanded from macro '__phys_addr_symbol'
   #define __phys_addr_symbol(x)   __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:142:31: note: expanded from macro '__va_to_pa_nodebug'
   #define __va_to_pa_nodebug(x)   ({                                              \
                                   ^
   2 errors generated.


vim +15 arch/riscv/mm/physaddr.c

6435f773d81f021 Zong Li 2020-01-02  14  
6435f773d81f021 Zong Li 2020-01-02 @15  phys_addr_t __phys_addr_symbol(unsigned long x)

:::::: The code at line 15 was first introduced by commit
:::::: 6435f773d81f02193228685a7e3fe65c983c5de0 riscv: mm: add support for CONFIG_DEBUG_VIRTUAL

:::::: TO: Zong Li <zong.li@sifive.com>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
