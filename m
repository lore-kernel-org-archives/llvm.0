Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198E7173
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 19:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639510104; x=1671046104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hnMalQnj2NaFVd4xW9/X0H56XQiM/o5zsUGnaOAP68E=;
  b=IIojoEDtmCwtJSz0xTcZDbkDermhjmL+E3L10SvNL2kf7hBhL7zHOKFC
   vgcSuCEBHG7xgw9rP9gtW5T/ihUNBExuh79awYKeEDse5GxSgXJewZqZn
   p68jwIW1pvGMmfD20gl/b7Jcxk+q9tbuLCT3UmVOO+bTgmj5u+UlwF5/O
   ukN24iZA7jNgec30ODy7DLBNwO2EKP8LdFCvtT7Z4NZIuUUCb4R94nSp8
   IlpLsODbbz+RLKpiJp0P/TPhLKTe/KdkEcYHHtqpY9kAA3vTkIqywQ0fy
   9/XglHOsGTiB0Zx2fz2WQ0nX6vITVXWixkVUHBL2EfTkngKWkPOTSEIGQ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="239290842"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="239290842"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 11:28:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="505492787"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2021 11:28:22 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxDTJ-0000g2-FG; Tue, 14 Dec 2021 19:28:21 +0000
Date: Wed, 15 Dec 2021 03:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ardb:for-kernelci 2/2] <instantiation>:4:12: error: operand must be
 a register in range [r0, r14]
Message-ID: <202112150319.rZuO4LiO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   e87ef81a2a09f584487c502ff4dfe618b298000f
commit: e87ef81a2a09f584487c502ff4dfe618b298000f [2/2] fixup! ARM: assembler: use explicit relocation for ADR with a function symbol
config: arm-randconfig-r031-20211214 (https://download.01.org/0day-ci/archive/20211215/202112150319.rZuO4LiO-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=e87ef81a2a09f584487c502ff4dfe618b298000f
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout e87ef81a2a09f584487c502ff4dfe618b298000f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> <instantiation>:4:12: error: operand must be a register in range [r0, r14]
    sub.w r9, pc, #4
              ^
   arch/arm/kernel/entry-armv.S:490:2: note: while in macro instantiation
    badr r9, ret_from_exception
    ^
>> <instantiation>:4:12: error: operand must be a register in range [r0, r14]
    sub.w lr, pc, #4
              ^
   arch/arm/kernel/entry-armv.S:509:2: note: while in macro instantiation
    badr lr, __und_usr_fault_32
    ^
>> <instantiation>:4:12: error: operand must be a register in range [r0, r14]
    sub.w lr, pc, #4
              ^
   arch/arm/kernel/entry-armv.S:727:2: note: while in macro instantiation
    badr lr, ret_from_exception
    ^
--
>> <instantiation>:4:12: error: operand must be a register in range [r0, r14]
    sub.w lr, pc, #4
              ^
   <instantiation>:6:2: note: while in macro instantiation
    badr lr, __ret_fast_syscall @ return address
    ^
   arch/arm/kernel/entry-common.S:255:2: note: while in macro instantiation
    invoke_syscall tbl, scno, r10, __ret_fast_syscall
    ^
>> <instantiation>:4:12: error: operand must be a register in range [r0, r14]
    sub.w lr, pc, #4
              ^
   <instantiation>:6:2: note: while in macro instantiation
    badr lr, __sys_trace_return @ return address
    ^
   arch/arm/kernel/entry-common.S:289:2: note: while in macro instantiation
    invoke_syscall tbl, scno, r10, __sys_trace_return, reload=1
    ^
--
>> <instantiation>:4:12: error: operand must be a register in range [r0, r14]
    sub.w lr, pc, #4
              ^
   arch/arm/kernel/sleep.S:92:2: note: while in macro instantiation
    badr lr, cpu_suspend_abort
    ^

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
