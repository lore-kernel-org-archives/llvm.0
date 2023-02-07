Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26313BD22;
	Tue,  7 Feb 2023 06:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675749642; x=1707285642;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Wiul6SKia+j3uyRc1t5ARE+DKno7plO+loHN8xNPDLw=;
  b=GbjACqY/4uw4ZjCTPem9FDUJ+uaTWOWBWe8dbZpLCH/UiTC0vWWAVJ3S
   7eaQ9GYamjmo7+5gRmMOpb/Sw6JAp9pVza9K/e5V+Ufq71ASLY08fqmRs
   fJb3j7f3fBO3wcIgTyXPmKNwATcVd4GYDCWIEibjmgqfA7lNm17HvgmK0
   hFLA//C8BrS2SJTmKnD/kH7ZndCxMURwKEjiwbqYt+vn63mmljTv8eIkv
   h1JdpG4vYhq0l701dmhH+DN4y/4Bl+U10FixnnGk2QqLfSeoNrO9GCbpy
   zKa2tRhRh0R7xGobxW6xVdx4hmbH6zvxj5IYAuswEjvBQiVAtt2WyyNRn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="331548468"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="331548468"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 22:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="840643667"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="840643667"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Feb 2023 22:00:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPH1y-00039T-2e;
	Tue, 07 Feb 2023 06:00:38 +0000
Date: Tue, 7 Feb 2023 14:00:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:axboe/linux-block/for-6.3/io_uring 49/49] ld.lld:
 error: vmlinux.a(fs/xfs/xfs_iomap.o):(function xfs_iomap_write_unwritten:
 .text+0x966): relocation R_RISCV_HI20 out of range: 536715 is not in
 [-524288, 524287]; references __tracepoint_xfs_unwritten_convert
Message-ID: <202302071337.BQ23DgeG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/for-6.3/io_uring
head:   2f2bb1ffc9983e227424d0787289da5483b0c74f
commit: 2f2bb1ffc9983e227424d0787289da5483b0c74f [49/49] io_uring: mark task TASK_RUNNING before handling resume/task work
config: riscv-randconfig-r003-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071337.BQ23DgeG-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/2f2bb1ffc9983e227424d0787289da5483b0c74f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block axboe/linux-block/for-6.3/io_uring
        git checkout 2f2bb1ffc9983e227424d0787289da5483b0c74f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/xfs/xfs_iomap.o):(function xfs_iomap_write_unwritten: .text+0x966): relocation R_RISCV_HI20 out of range: 536715 is not in [-524288, 524287]; references __tracepoint_xfs_unwritten_convert
   >>> referenced by xfs_iomap.c:100 (fs/xfs/xfs_iomap.c:100)
   >>> defined in vmlinux.a(fs/xfs/xfs_trace.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
