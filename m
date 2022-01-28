Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167EA29CA
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 07:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643356147; x=1674892147;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ThfrsNWKFZ9H56xmtEFTI/qr+TzEM4RK0b/obYQNGDY=;
  b=Ks606jL0yRg03MsWg0wQqYoAGrknJRPx2yo4Rc5yyyySTN0f2BcTklgC
   gtN1gQ33nRgR0cyU6w3O9uz4W7BkLd7M0UfD+EdVfxzaOyeVe8x1eVkxz
   c91S8qZn4dbARCQICyiEs60sylBWlRHWx3+PvA5sWB3hEIBmRQPCv2NEQ
   8KOUJegTuk69gKPNRkYi2PoA8rHfq3LTQMvpEYtNeab2XsIpItl+SDjCR
   aNmWOXXerODxt+s7aYGry9ZAudpcFrtjx3xcpaE+tSu1Bkwg5G1ZrkfgA
   s9OTIykX1JCHSjCHORdBJLdhH0++HTvh9dlVkO5mVj3z0fiRoYUbJkMdb
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="246845556"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; 
   d="scan'208";a="246845556"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 23:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; 
   d="scan'208";a="770038061"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jan 2022 23:49:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDM0G-000NdA-PS; Fri, 28 Jan 2022 07:49:04 +0000
Date: Fri, 28 Jan 2022 15:48:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:queue/5.10 4314/9999] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function kallsyms_open: .text+0x634):
 relocation R_RISCV_PCREL_HI20 out of range: -524475 is not in [-524288,
 524287]; references kallsyms_markers
Message-ID: <202201281531.m0NwIQPY-lkp@intel.com>
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
TO: Khem Raj <raj.khem@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Palmer Dabbelt <palmerdabbelt@google.com>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   b3f73a1a2d7d65e96543e6f59f65941452c04565
commit: bb73f2f789695028a4cc8baf9d6a8df03fb5ae14 [4314/9999] riscv: Use -mno-relax when using lld linker
config: riscv-randconfig-r001-20220127 (https://download.01.org/0day-ci/archive/20220128/202201281531.m0NwIQPY-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f32dccb9a43b02ce4e540d6ba5dbbdb188f2dc7d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=bb73f2f789695028a4cc8baf9d6a8df03fb5ae14
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout bb73f2f789695028a4cc8baf9d6a8df03fb5ae14
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_open: .text+0x634): relocation R_RISCV_PCREL_HI20 out of range: -524475 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by
   - LOCK_STAT && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
   - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
