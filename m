Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED812C82
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 05:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643003008; x=1674539008;
  h=date:from:cc:subject:message-id:mime-version;
  bh=o7Q/9aFb2kO/5Ta+b4t+cJGfL27WjQDqNC/T1fKrJxE=;
  b=IZoH2EJuWOsYf2RAJr4y1zk5xxWJmnuifxdw6eF79PcdfqFotAHM8Ygn
   lZY0X25MVaw6yOxtjyps7Vs+ZFsmz7Q2uimuljjTSBlxsSPYJYcPPHISr
   V7gTFUzWNqYL+ya1FnhRaNSbVXwzK8N+3p5mANnW/kiI46NNqcZAysPxp
   Q5KKh3YWnvGBWZUNj8TZRsqARwGHuOJzKxA6HndFfTgMWwSJjmPV8Xl3S
   9MkhGZpMpnPBsvMCX5I6Z7orVwTv8JbWvblDWBK+OGab4SVhY85SSnwde
   zRtgn6PucI6RPPn6J9D0kjQKTNPmWtvUIGlPgxci2faj5MxZrKQLslRyL
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="270402689"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="270402689"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2022 21:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="534078167"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2022 21:43:17 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBs8K-000Hp3-Q0; Mon, 24 Jan 2022 05:43:16 +0000
Date: Mon, 24 Jan 2022 13:43:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: init/built-in.a(main.o):(function
 __traceiter_initcall_level: .text+0x18): relocation R_RISCV_HI20 out of
 range: 528322 is not in [-524288, 524287]; references
 __tracepoint_initcall_level
Message-ID: <202201241321.73rz7g3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Cai Huoqing <caihuoqing@baidu.com>
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 470b52564cceef62e982283cafbada41ff47903b EDAC/al_mc: Make use of the helper function devm_add_action_or_reset()
date:   4 months ago
config: riscv-buildonly-randconfig-r001-20220124 (https://download.01.org/0day-ci/archive/20220124/202201241321.73rz7g3Z-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=470b52564cceef62e982283cafbada41ff47903b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 470b52564cceef62e982283cafbada41ff47903b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(main.o):(function __traceiter_initcall_level: .text+0x18): relocation R_RISCV_HI20 out of range: 528322 is not in [-524288, 524287]; references __tracepoint_initcall_level
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function __traceiter_initcall_start: .text+0x98): relocation R_RISCV_HI20 out of range: 528322 is not in [-524288, 524287]; references __tracepoint_initcall_start
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function __traceiter_initcall_finish: .text+0x11c): relocation R_RISCV_HI20 out of range: 528322 is not in [-524288, 524287]; references __tracepoint_initcall_finish
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/patch.o):(function patch_text: .text+0x19c): relocation R_RISCV_HI20 out of range: 524294 is not in [-524288, 524287]; references patch_text_cb
   >>> referenced by patch.c
   >>> defined in arch/riscv/built-in.a(kernel/patch.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/patch.o):(function patch_text: .text+0x1a4): relocation R_RISCV_HI20 out of range: 528338 is not in [-524288, 524287]; references __cpu_online_mask
   >>> referenced by patch.c
   >>> defined in kernel/built-in.a(cpu.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/patch.o):(function patch_text_cb: .text+0xf0): relocation R_RISCV_HI20 out of range: 528338 is not in [-524288, 524287]; references __num_online_cpus
   >>> referenced by patch.c
   >>> defined in kernel/built-in.a(cpu.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
