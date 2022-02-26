Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127E138FF
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 20:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645908430; x=1677444430;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JWKvddXH7PHJ6I1cDFN+327GEU7qfKGjice0dvYPcH4=;
  b=YtSfb6owrQC8lhdkRW+bSZH40upaQgC7A7EhXlarOKDU7qPmMsLJNbmK
   RvJwRf4Khc2KY1bZdjUXD2RUIq7aWVlQKbccKwJ56TZigaaqx7nxhAXJI
   KtB4Wv0h4OMIQ34iOp+WDmoEpleinpsc0nc6HbX+GcRF9Qh4Ma3MiI8lh
   5pKdh5uQHVrYWhm6ZDmkAejOw8y8v5hhnS+yHBY5InDmhmvMEDiGxblSl
   ZpFXONLTjOOum4b+20iLAZtyIbLBTuLxNzM3aTvDbjOnu1a0iCrBsOGCY
   GGYuMT3adVQCZNUmWp0x0EWWgVgIFsMR0SdAiLpNCQ+XU7z+bHsE8jI4O
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10270"; a="252875347"
X-IronPort-AV: E=Sophos;i="5.90,140,1643702400"; 
   d="scan'208";a="252875347"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2022 12:47:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,140,1643702400"; 
   d="scan'208";a="533974873"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Feb 2022 12:47:08 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nO3y7-0005wz-Ko; Sat, 26 Feb 2022 20:47:07 +0000
Date: Sun, 27 Feb 2022 04:46:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [jic23-iio:fixes-togreg 1/1] ld.lld: error:
 arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_processor_hartid:
 .text+0x50): relocation R_RISCV_HI20 out of range: 539915 is not in
 [-524288, 524287]; references riscv_of_processor_hartid.__if_trace.0
Message-ID: <202202270426.5r9H8Whr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Haibo Chen <haibo.chen@nxp.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git fixes-togreg
head:   4b1062ee1e8d6808631b6088b45baba6fc8ba34d
commit: 4b1062ee1e8d6808631b6088b45baba6fc8ba34d [1/1] iio: imu: st_lsm6dsx: use dev_to_iio_dev() to get iio_dev struct
config: riscv-buildonly-randconfig-r003-20220227 (https://download.01.org/0day-ci/archive/20220227/202202270426.5r9H8Whr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=4b1062ee1e8d6808631b6088b45baba6fc8ba34d
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
        git fetch --no-tags jic23-iio fixes-togreg
        git checkout 4b1062ee1e8d6808631b6088b45baba6fc8ba34d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_processor_hartid: .text+0x50): relocation R_RISCV_HI20 out of range: 539915 is not in [-524288, 524287]; references riscv_of_processor_hartid.__if_trace.0
   >>> referenced by cpu.c
   >>> defined in arch/riscv/built-in.a(kernel/cpu.o)
--
>> ld.lld: error: kernel/built-in.a(softirq.o):(function __traceiter_irq_handler_entry: .text+0x24): relocation R_RISCV_HI20 out of range: 539918 is not in [-524288, 524287]; references __traceiter_irq_handler_entry.__if_trace.1
   >>> referenced by softirq.c
   >>> defined in kernel/built-in.a(softirq.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/process.o):(function __show_regs: .text+0x7c): relocation R_RISCV_HI20 out of range: 539915 is not in [-524288, 524287]; references __show_regs.__if_trace.0
   >>> referenced by process.c
   >>> defined in arch/riscv/built-in.a(kernel/process.o)
--
>> ld.lld: error: kernel/built-in.a(exec_domain.o):(function __se_sys_personality: .text+0x4c): relocation R_RISCV_HI20 out of range: 539917 is not in [-524288, 524287]; references __do_sys_personality.__if_trace.1
   >>> referenced by exec_domain.c
   >>> defined in kernel/built-in.a(exec_domain.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
