Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9F28E8
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 12:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659183005; x=1690719005;
  h=date:from:cc:subject:message-id:mime-version;
  bh=E4l7vzlYZWhGPnQ5ta8g0V6vrWjmqG4jWnT2rni86YQ=;
  b=AqAl9PHJienCnTjrHuEbQcyZVRm3ew8K5qIvfzzWk3dbKbzadTt6SYgt
   rxdHANpTkrG0TDNDfwZYHeJTvYx49W1QHrQiMSf1GCfJmzP45aE848XNd
   QmvpjAtdUeHM/6k/rf6KzuAjxIOsAOxsxUoIhd9ooaNsPC5m2G/igr3Es
   CaEglKVz5BiO6BQMAw+G/r8W35QsMKXYO0SER+IfbxZyUjHA5aqj0cwUQ
   ORMY4ON2V6y711bWxWc2wj9zl2o4Mm/liswvOmSXxDbKO+z2mRsIQyOrq
   J2jSVanmPbtldKHV6fTZP9NzaVaAXDXoRNN6UNeciZEIHfQpjVx6SS9hw
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="275803951"
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="275803951"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 05:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="577242659"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Jul 2022 05:10:04 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHlIB-000Co1-2J;
	Sat, 30 Jul 2022 12:10:03 +0000
Date: Sat, 30 Jul 2022 20:09:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [rt-devel:linux-5.19.y-rt-rebase 37/55] ld.lld: error:
 init/built-in.a(main.o):(function do_one_initcall: .text+0x230): relocation
 R_RISCV_HI20 out of range: 527731 is not in [-524288, 524287]; references
 initcall_calltime
Message-ID: <202207302021.Vt2CI7PV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-5.19.y-rt-rebase
head:   4730816e7a6aab17945765fc82d47cdc9a05b8fa
commit: 38e8fdf43acf2cc06cf9dcfaa32530ad33c4c0c4 [37/55] x86/entry: Use should_resched() in idtentry_exit_cond_resched()
config: riscv-buildonly-randconfig-r003-20220729 (https://download.01.org/0day-ci/archive/20220730/202207302021.Vt2CI7PV-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=38e8fdf43acf2cc06cf9dcfaa32530ad33c4c0c4
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-5.19.y-rt-rebase
        git checkout 38e8fdf43acf2cc06cf9dcfaa32530ad33c4c0c4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(main.o):(function do_one_initcall: .text+0x230): relocation R_RISCV_HI20 out of range: 527731 is not in [-524288, 524287]; references initcall_calltime
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function run_init_process: .text+0x328): relocation R_RISCV_HI20 out of range: 527454 is not in [-524288, 524287]; references argv_init
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function do_one_initcall: .text+0x13c): relocation R_RISCV_HI20 out of range: 527728 is not in [-524288, 524287]; references .LCPI28_2
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function do_one_initcall: .text+0x1b8): relocation R_RISCV_HI20 out of range: 527691 is not in [-524288, 524287]; references initcall_blacklisted.__UNIQUE_ID_ddebug345
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
