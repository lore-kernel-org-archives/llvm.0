Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8C1FA8;
	Mon, 13 Feb 2023 06:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676270412; x=1707806412;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fpTEh47MWrCnHTuYV/OuOJkZXMaN2JuZHzWyWpUgP3c=;
  b=I0MDPmNUQvyXWzA6tY2u0s9syUmT8rtKw+tUEU4rBjIb+USnMaNYTM3J
   3BQx/ZMqFj5wl0erhaCw1v0dBKbbejJDuy0nEB3S4snkTOUWhBWujRgDx
   RYpuZzJfqb30LDyawZcnSwsSFSxZbhik75zxu3qq5hwyl2GYqersGpCvw
   +VRHfJT1P4mO16qKDbQjnW1iJ4rEq1ZrS9oQAFP86ewZvNv7QuuyErzWK
   +mhzwxjBFN21z+4JDjjXPlxUC/3ZBM/7PpZknbNgwiVbMjs6hFACPK1cu
   vpHjHPe7D9oDf8rOQ1rfv9w/491KQhDCGOH08fVDMrVf0i6sSb36QZcTV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="328529281"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="328529281"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 22:40:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="701155056"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="701155056"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Feb 2023 22:40:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRSVV-0007b5-2e;
	Mon, 13 Feb 2023 06:40:09 +0000
Date: Mon, 13 Feb 2023 14:39:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 10834/12440] ld.lld: error:
 vmlinux.a(init/main.o):(function rcu_lock_acquire: .text+0x268): relocation
 R_RISCV_HI20 out of range: 524289 is not in [-524288, 524287]; references
 .Ltmp0
Message-ID: <202302131438.5tUJP2Sy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mustafa Ismail <mustafa.ismail@intel.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Shiraz Saleem <shiraz.saleem@intel.com>
CC: Sindhu Devale <sindhu.devale@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   09e41676e35ab06e4bce8870ea3bf1f191c3cb90
commit: 9cd9842c46996ef62173c36619c746f57416bcb0 [10834/12440] RDMA/irdma: Cap MSIX used to online CPUs + 1
config: riscv-randconfig-r036-20230213 (https://download.01.org/0day-ci/archive/20230213/202302131438.5tUJP2Sy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9cd9842c46996ef62173c36619c746f57416bcb0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9cd9842c46996ef62173c36619c746f57416bcb0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131438.5tUJP2Sy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function rcu_lock_acquire: .text+0x268): relocation R_RISCV_HI20 out of range: 524289 is not in [-524288, 524287]; references .Ltmp0
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function rcu_lock_release: .text+0x2b0): relocation R_RISCV_HI20 out of range: 524289 is not in [-524288, 524287]; references .Ltmp1
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
