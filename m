Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1829D68
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 17:48:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="217662937"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="217662937"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 09:32:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="542882153"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 07 Dec 2021 09:32:10 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mueK1-000MoW-Sh; Tue, 07 Dec 2021 17:32:09 +0000
Date: Wed, 8 Dec 2021 01:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@wdc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [avpatel:riscv_kvm_aia_v1 38/40]
 include/linux/irqchip/riscv-imsic.h:64:10: error: use of undeclared
 identifier 'ENODEV'
Message-ID: <202112080139.lb5Z5UZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/avpatel/linux.git riscv_kvm_aia_v1
head:   eb55ca3817a59020fc1e3d5a5de0a5adcebbedd0
commit: c72c5647e9ebb7176ee3862a1ca95bcd3bdfe71b [38/40] RISC-V: KVM: Implement device interface for AIA irqchip
config: riscv-randconfig-c006-20211207 (https://download.01.org/0day-ci/archive/20211208/202112080139.lb5Z5UZJ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/c72c5647e9ebb7176ee3862a1ca95bcd3bdfe71b
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_kvm_aia_v1
        git checkout c72c5647e9ebb7176ee3862a1ca95bcd3bdfe71b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kvm/aia_device.c:10:
>> include/linux/irqchip/riscv-imsic.h:64:10: error: use of undeclared identifier 'ENODEV'
           return -ENODEV;
                   ^
   1 error generated.


vim +/ENODEV +64 include/linux/irqchip/riscv-imsic.h

2ad4dc808c3e01 Anup Patel 2021-04-26  59  
2ad4dc808c3e01 Anup Patel 2021-04-26  60  static inline int imsic_cpu_page_phys(unsigned int cpu,
2ad4dc808c3e01 Anup Patel 2021-04-26  61  				      unsigned int guest_index,
2ad4dc808c3e01 Anup Patel 2021-04-26  62  				      phys_addr_t *out_msi_pa)
2ad4dc808c3e01 Anup Patel 2021-04-26  63  {
2ad4dc808c3e01 Anup Patel 2021-04-26 @64  	return -ENODEV;
2ad4dc808c3e01 Anup Patel 2021-04-26  65  }
2ad4dc808c3e01 Anup Patel 2021-04-26  66  

:::::: The code at line 64 was first introduced by commit
:::::: 2ad4dc808c3e0175e4975b41cecbb996ee217731 irqchip: Add incoming MSI controller driver

:::::: TO: Anup Patel <anup.patel@wdc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
