Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E017A943;
	Fri,  9 Jun 2023 23:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686354720; x=1717890720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1YG4Ql6OUeQuDlm8568xTSV64aSQEgRGFQ6GA35ZneE=;
  b=Bp7MeG7Y/FEmh7hDGtLLKezzUU7QACy3WgmEe+8P0xfPnU1XDF/qDCJb
   RkN5ayyA94k7ruqk2gFV0LEgME/PfeqKhD/sO+dV8S423sG/DiPRTbmjz
   ObsML5cBf+Vs5PAh1Ur15q4dVk5OZiL+vBu9hcLetpgPssh/6N+hEyUdJ
   2CqPWsndOeY1wu9x1ys0iHPI/XVPngTM98Yw9Z7W39EVPe/Ozg/PsZveC
   bpmnfFKucKqChqZD6hkJSQZ8O/XNnfiRpHfSmamq8xZnGJrDEMKbkmBiG
   2HLZ24ZqCX+2zilzWcmEiinz5uAt32klE1qts+z+jX9SDSQT4Uf7QPIrB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="421300313"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="421300313"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 16:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="743644199"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="743644199"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Jun 2023 16:51:57 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7ltd-0009Vg-0h;
	Fri, 09 Jun 2023 23:51:57 +0000
Date: Sat, 10 Jun 2023 07:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-futex 24/25] io_uring/futex.h:18:1: error:
 expected identifier or '('
Message-ID: <202306100758.dMGu90VY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-futex
head:   08c3f53180099f7a5188bea9e117f1e3fe591e13
commit: 5fe488baac7abe30d21e45ffc57473f185712e11 [24/25] io_uring: add support for futex wake and wait
config: hexagon-randconfig-r041-20230609 (https://download.01.org/0day-ci/archive/20230610/202306100758.dMGu90VY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=5fe488baac7abe30d21e45ffc57473f185712e11
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block io_uring-futex
        git checkout 5fe488baac7abe30d21e45ffc57473f185712e11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100758.dMGu90VY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/cancel.c:14:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from io_uring/cancel.c:14:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from io_uring/cancel.c:14:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from io_uring/cancel.c:18:
>> io_uring/futex.h:18:1: error: expected identifier or '('
      18 | {
         | ^
   6 warnings and 1 error generated.


vim +18 io_uring/futex.h

     8	
     9	#if defined(CONFIG_FUTEX)
    10	int io_futex_cancel(struct io_ring_ctx *ctx, struct io_cancel_data *cd,
    11			    unsigned int issue_flags);
    12	bool io_futex_remove_all(struct io_ring_ctx *ctx, struct task_struct *task,
    13				 bool cancel_all);
    14	#else
    15	static inline int io_futex_cancel(struct io_ring_ctx *ctx,
    16					  struct io_cancel_data *cd,
    17					  unsigned int issue_flags);
  > 18	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
