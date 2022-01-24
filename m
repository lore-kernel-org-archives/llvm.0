Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083F8168
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643026481; x=1674562481;
  h=date:from:cc:subject:message-id:mime-version;
  bh=D4aICVl001gkt/+D0opZI+0AkHaGEVRvePJttIThtvU=;
  b=UdKf4yU/Sg2EIMZrnyFUfzNbooq451DgXEg0dTl1wQ/bCHsSajhA5rYz
   BFqK1IFPoHhXUpU4IR01O1DoCoeNCOjLVxudhRjEitOI3RQSS6lzTFBUS
   jh3vESzAqLm2cnxuFz64rsEKEQVYo5y1uR4Xk2vYjU7vWGgxw3U+YlcOd
   J7qoGwZp0COFD7yTZNQnH9ozfmIXKAbc0zgv5MuuKe++nt1q5jNfDdWB+
   Wp0/X2eIsPyLezmEwxZa4XcBDSdM++ervoWmd7kgjlDqCb5RZRss5vfA/
   Q0rZ6Nuyp6ApMfNeXNq1Zfv+HLpfjmkF+amp70fa1xvTosXdujutGXDv/
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="226702679"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="226702679"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 04:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="673608058"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2022 04:14:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nByF5-000II7-46; Mon, 24 Jan 2022 12:14:39 +0000
Date: Mon, 24 Jan 2022 20:14:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [jgunthorpe:for-yishai 9/18] ld.lld: error:
 arch/riscv/built-in.a(kernel/stacktrace.o):(function dump_backtrace:
 .text+0x11c): relocation R_RISCV_HI20 out of range: 524293 is not in
 [-524288, 524287]; references print_trace_address
Message-ID: <202201242051.ZgqCkbdK-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Yishai Hadas <yishaih@nvidia.com>

tree:   https://github.com/jgunthorpe/linux for-yishai
head:   6173eda3f1f5508010706943c0bef99dfaf1dcd6
commit: 96734f6e53ef22b459d3ba12b8d22b4309a4cd15 [9/18] vfio: Define device migration protocol v2
config: riscv-randconfig-r002-20220123 (https://download.01.org/0day-ci/archive/20220124/202201242051.ZgqCkbdK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/jgunthorpe/linux/commit/96734f6e53ef22b459d3ba12b8d22b4309a4cd15
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe for-yishai
        git checkout 96734f6e53ef22b459d3ba12b8d22b4309a4cd15
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/stacktrace.o):(function dump_backtrace: .text+0x11c): relocation R_RISCV_HI20 out of range: 524293 is not in [-524288, 524287]; references print_trace_address
   >>> referenced by stacktrace.c
   >>> defined in arch/riscv/built-in.a(kernel/stacktrace.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/stacktrace.o):(function print_trace_address: .text+0x178): relocation R_RISCV_HI20 out of range: 534116 is not in [-524288, 524287]; references .L.str.4
   >>> referenced by stacktrace.c
   >>> defined in arch/riscv/built-in.a(kernel/stacktrace.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
