Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D43649
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650985377; x=1682521377;
  h=date:from:cc:subject:message-id:mime-version;
  bh=SZZpSxW+93KhelYIC2Il7XrqmFLzKz39iHJdb/Uztus=;
  b=f1I/Hm3Iw3BnrbuzOdkr8uJwcPQtFGfUJV7oQj+ZmXfUJvg7SRHKlvfU
   75XBmv08d0Wvnhr+1aekoO1VmzzDBL0yc42jvJ4up8ixbHF7hF/heQRrW
   JKQYICi5Un3ZnjkkQw+/1/poqdI0zeqHp4f3vVZ3bTMLQw5ebZ0DXXzfc
   1etjgH7EQpZE0ueBCgeTvO5tNfwNrAhb6UbbOAqiv/SQN0co3FfBPiYZQ
   7XiwkP01BpzLnOnu4e8e019B6pPhZgbfgojbWd4zCEsyLzzSLcUr14XLz
   wj8RDfbpADxdyis0hWMiUT12oJEDs3fvFMRX/qaQkm8ypExgLufdQfZ2d
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="328545842"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; 
   d="scan'208";a="328545842"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 08:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; 
   d="scan'208";a="678974634"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Apr 2022 08:02:41 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njMi8-0003jq-Dl;
	Tue, 26 Apr 2022 15:02:40 +0000
Date: Tue, 26 Apr 2022 23:02:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function
 riscv_of_processor_hartid: .text+0x1c): relocation R_RISCV_HI20 out of
 range: 534965 is not in [-524288, 524287]; references __stack_chk_guard
Message-ID: <202204262302.LrvJJKnH-lkp@intel.com>
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
TO: Bartosz Golaszewski <brgl@bgdev.pl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d615b5416f8a1afeb82d13b238f8152c572d59c0
commit: 56e337f2cf1326323844927a04e9dbce9a244835 Revert "gpio: Revert regression in sysfs-gpio (gpiolib.c)"
date:   6 weeks ago
config: riscv-randconfig-r002-20220425 (https://download.01.org/0day-ci/archive/20220426/202204262302.LrvJJKnH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=56e337f2cf1326323844927a04e9dbce9a244835
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 56e337f2cf1326323844927a04e9dbce9a244835
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_processor_hartid: .text+0x1c): relocation R_RISCV_HI20 out of range: 534965 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by cpu.c
   >>> defined in arch/riscv/built-in.a(kernel/process.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
