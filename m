Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A8E2C9D
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 20:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640033846; x=1671569846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GXiEAIkvpM54nRM5gXc5wo8WacmND3thLJnZc0dy4XY=;
  b=b90V2SsOqGBaXUbs28bJaR9jb2mzZMgW+z379ADuTuzGIkwijZNytHLf
   IF9x+FF0U9U9Lae7lFARd5wLSXrdouCqth8xnxPAnSC/hAthPnZzD4l7B
   tMfNMpPIdBAB8YGqiRWbEOwf5eNi63T37BZE8VVFVTmQhwAVaJq3rgzkJ
   FN3nmQGQSYLhZ7vRK3CiFabZxAByhPLyjcFshSKVuuo++nHiHhCSAhNCK
   A5hlvGbcLLL8h2Bz6FfdIkQUWavPzVCwR14I4ILgcnBokbu+Y1SV5HdMf
   arLkrGzaCQfs7SHWUHY4qIdUpKkt88K52VILCTl09Q0qCw29dpB0WIRSx
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="227122101"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="227122101"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 12:57:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="467540826"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Dec 2021 12:57:22 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzPik-0008El-5d; Mon, 20 Dec 2021 20:57:22 +0000
Date: Tue, 21 Dec 2021 04:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [axboe-block:nvme-passthru-wip.2 4/10] fs/io_uring.c:11271:2: error:
 call to __compiletime_assert_764 declared with 'error' attribute:
 BUILD_BUG_ON failed: offsetof(struct io_uring_cmd_sqe, user_data) !=
 sqe_offsets[1].user_data
Message-ID: <202112210447.xuPrVLM2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git nvme-passthru-wip.2
head:   edab2611e228dc05e995d3e2e4d25cb9e0989c75
commit: 278755c32b7fd62a8e82a1229c819ed2fcd85730 [4/10] io_uring: add infrastructure around io_uring_cmd_sqe
config: mips-buildonly-randconfig-r001-20211220 (https://download.01.org/0day-ci/archive/20211221/202112210447.xuPrVLM2-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=278755c32b7fd62a8e82a1229c819ed2fcd85730
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block nvme-passthru-wip.2
        git checkout 278755c32b7fd62a8e82a1229c819ed2fcd85730
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/io_uring.c:11271:2: error: call to __compiletime_assert_764 declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct io_uring_cmd_sqe, user_data) != sqe_offsets[1].user_data
           BUILD_BUG_SQEC_ELEM(sqe_offsets[1].user_data,   __u64,  user_data);
           ^
   fs/io_uring.c:11268:2: note: expanded from macro 'BUILD_BUG_SQEC_ELEM'
           __BUILD_BUG_VERIFY_ELEMENT(struct io_uring_cmd_sqe, eoffset, etype, ename)
           ^
   fs/io_uring.c:11228:2: note: expanded from macro '__BUILD_BUG_VERIFY_ELEMENT'
           BUILD_BUG_ON(offsetof(stype, ename) != eoffset); \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:316:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:13:1: note: expanded from here
   __compiletime_assert_764
   ^
>> fs/io_uring.c:11272:2: error: call to __compiletime_assert_766 declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct io_uring_cmd_sqe, personality) != sqe_offsets[1].personality
           BUILD_BUG_SQEC_ELEM(sqe_offsets[1].personality, __u16,  personality);
           ^
   fs/io_uring.c:11268:2: note: expanded from macro 'BUILD_BUG_SQEC_ELEM'
           __BUILD_BUG_VERIFY_ELEMENT(struct io_uring_cmd_sqe, eoffset, etype, ename)
           ^
   fs/io_uring.c:11228:2: note: expanded from macro '__BUILD_BUG_VERIFY_ELEMENT'
           BUILD_BUG_ON(offsetof(stype, ename) != eoffset); \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:316:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:21:1: note: expanded from here
   __compiletime_assert_766
   ^
   2 errors generated.


vim +/error +11271 fs/io_uring.c

 11231	
 11232	#define BUILD_BUG_SQE_ELEM(eoffset, etype, ename) \
 11233		__BUILD_BUG_VERIFY_ELEMENT(struct io_uring_sqe, eoffset, etype, ename)
 11234		BUILD_BUG_ON(sizeof(struct io_uring_sqe) != 64);
 11235		BUILD_BUG_ON(sizeof(struct io_uring_cmd_sqe) != 64);
 11236		BUILD_BUG_SQE_ELEM(0,  __u8,   hdr.opcode);
 11237		BUILD_BUG_SQE_ELEM(1,  __u8,   hdr.flags);
 11238		BUILD_BUG_SQE_ELEM(2,  __u16,  hdr.ioprio);
 11239		BUILD_BUG_SQE_ELEM(4,  __s32,  hdr.fd);
 11240		BUILD_BUG_SQE_ELEM(8,  __u64,  off);
 11241		BUILD_BUG_SQE_ELEM(8,  __u64,  addr2);
 11242		BUILD_BUG_SQE_ELEM(16, __u64,  addr);
 11243		BUILD_BUG_SQE_ELEM(16, __u64,  splice_off_in);
 11244		BUILD_BUG_SQE_ELEM(24, __u32,  len);
 11245		BUILD_BUG_SQE_ELEM(28,     __kernel_rwf_t, rw_flags);
 11246		BUILD_BUG_SQE_ELEM(28, /* compat */   int, rw_flags);
 11247		BUILD_BUG_SQE_ELEM(28, /* compat */ __u32, rw_flags);
 11248		BUILD_BUG_SQE_ELEM(28, __u32,  fsync_flags);
 11249		BUILD_BUG_SQE_ELEM(28, /* compat */ __u16,  poll_events);
 11250		BUILD_BUG_SQE_ELEM(28, __u32,  poll32_events);
 11251		BUILD_BUG_SQE_ELEM(28, __u32,  sync_range_flags);
 11252		BUILD_BUG_SQE_ELEM(28, __u32,  msg_flags);
 11253		BUILD_BUG_SQE_ELEM(28, __u32,  timeout_flags);
 11254		BUILD_BUG_SQE_ELEM(28, __u32,  accept_flags);
 11255		BUILD_BUG_SQE_ELEM(28, __u32,  cancel_flags);
 11256		BUILD_BUG_SQE_ELEM(28, __u32,  open_flags);
 11257		BUILD_BUG_SQE_ELEM(28, __u32,  statx_flags);
 11258		BUILD_BUG_SQE_ELEM(28, __u32,  fadvise_advice);
 11259		BUILD_BUG_SQE_ELEM(28, __u32,  splice_flags);
 11260		BUILD_BUG_SQE_ELEM(32, __u64,  user_data);
 11261		BUILD_BUG_SQE_ELEM(40, __u16,  buf_index);
 11262		BUILD_BUG_SQE_ELEM(40, __u16,  buf_group);
 11263		BUILD_BUG_SQE_ELEM(42, __u16,  personality);
 11264		BUILD_BUG_SQE_ELEM(44, __s32,  splice_fd_in);
 11265		BUILD_BUG_SQE_ELEM(44, __u32,  file_index);
 11266	
 11267		#define BUILD_BUG_SQEC_ELEM(eoffset, etype, ename) \
 11268		__BUILD_BUG_VERIFY_ELEMENT(struct io_uring_cmd_sqe, eoffset, etype, ename)
 11269		BUILD_BUG_SQEC_ELEM(8,				__u64,	user_data);
 11270		BUILD_BUG_SQEC_ELEM(18,				__u16,	personality);
 11271		BUILD_BUG_SQEC_ELEM(sqe_offsets[1].user_data,	__u64,	user_data);
 11272		BUILD_BUG_SQEC_ELEM(sqe_offsets[1].personality,	__u16,	personality);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
