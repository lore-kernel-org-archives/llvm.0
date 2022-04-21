Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC857A
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650546737; x=1682082737;
  h=date:from:cc:subject:message-id:mime-version;
  bh=O5QI/3Eq8dmrKt18v3w9QcSKIQgXPmi1foc7rqW8w9Q=;
  b=TLS203uy3yYYJO+p12bgyBQXvrz5TzXI0l5yO69U1ENnpwSxBg/e+BsN
   VgmD4pI1pIe82E38HshiDfKnqr6thH07E7B9L/vN+MtzXOeu6l63zwVpA
   j7MuA3JD2anQZZzWuWQBOBBvK7QeVPXr5jcHPI+UOiPcs1J2DCp1+gtfK
   5aEIuULDvxV728bywMfSpiw3/7GVi4m9uDC/D/tCbPNl+C6n8oq7K9NF+
   KEhhcwbE7WEVOYIQOgLQFGlJtXZt7X5W2H/z0BoLBG11IbpZnFGBYFfPp
   w0PXx1b6Rj2db19do6ETx0zGDHqVjP6cn0oMMG+iDW4r8pq7nGPif0o8/
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="264114221"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="264114221"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 06:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="626510254"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2022 06:12:15 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhWbX-0008Qb-5w;
	Thu, 21 Apr 2022 13:12:15 +0000
Date: Thu, 21 Apr 2022 21:11:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 1568/5346] ld.lld: error:
 arch/riscv/built-in.a(kernel/stacktrace.o):(function walk_stackframe:
 .text+0x32): relocation R_RISCV_HI20 out of range: 536065 is not in
 [-524288, 524287]; references walk_stackframe.__if_trace.1
Message-ID: <202204212150.kJ9VdVJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   65eb92e4c9f0a962656f131521f4fbc0d24c9d4c
commit: 0be0b70df6611205ac392d0e21f7e077f3230ee6 [1568/5346] pinctrl: alderlake: Fix register offsets for ADL-N variant
config: riscv-randconfig-r026-20220420 (https://download.01.org/0day-ci/archive/20220421/202204212150.kJ9VdVJ9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0be0b70df6611205ac392d0e21f7e077f3230ee6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0be0b70df6611205ac392d0e21f7e077f3230ee6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 65eb92e4c9f0a962656f131521f4fbc0d24c9d4c builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/stacktrace.o):(function walk_stackframe: .text+0x32): relocation R_RISCV_HI20 out of range: 536065 is not in [-524288, 524287]; references walk_stackframe.__if_trace.1
   >>> referenced by stacktrace.c
   >>> defined in arch/riscv/built-in.a(kernel/stacktrace.o)
--
>> ld.lld: error: init/built-in.a(calibrate.o):(function calibrate_delay: .text+0x42): relocation R_RISCV_HI20 out of range: 536823 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by calibrate.c
   >>> defined in arch/riscv/built-in.a(kernel/process.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/signal.o):(function sys_rt_sigreturn: .text+0xc): relocation R_RISCV_HI20 out of range: 536823 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by signal.c
   >>> defined in arch/riscv/built-in.a(kernel/process.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
