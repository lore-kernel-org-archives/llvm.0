Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4699E10E9;
	Tue, 21 Mar 2023 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679402670; x=1710938670;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yjeCQ5uuBRZ2I5a9pP66A9TQRhcHFw/6DfmmP+VXyzE=;
  b=U9wf8WBCQiEvDfZKlFkOB5Ec+dfrXOdI4wgniITtwQQBLiH3VTfP709Q
   K4OZxKXGcR+rAXtChwIFVnPXpvHuO3M1kHO3xGkG1YZCbmO2NVXMmLYNX
   tu6sToxMid3oAMiFxfk5cyvEIc8Z+CRyaSEfsm7kGWcC3RIGy+2lC/P72
   Q3CFIJuEtSh+rMcNC5zii3+z0igp0aSck3Swt34mTAu9MFNhzfKDcKIlV
   a/mda/I7x2Lx7pHPJjoNiPlq5vlaYc8VODB7AHQpmIwo3EAFiCQdpSiIM
   P3GL8bMu1JjnLLOBENlOGQtUWCSWvGV5M8u5iWpfPh2dhO9td+cgquBmq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403803549"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="403803549"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 05:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="927381914"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="927381914"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Mar 2023 05:44:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pebLn-000BvC-37;
	Tue, 21 Mar 2023 12:44:27 +0000
Date: Tue, 21 Mar 2023 20:43:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_lookup_name: .text+0x94): relocation R_RISCV_PCREL_HI20 out of
 range: -524489 is not in [-524288, 524287]; references
 kallsyms_seqs_of_names
Message-ID: <202303212032.CO1xWeBX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Zhen Lei <thunder.leizhen@huawei.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

Hi Zhen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17214b70a159c6547df9ae204a6275d983146f6b
commit: 60443c88f3a89fd303a9e8c0e84895910675c316 kallsyms: Improve the performance of kallsyms_lookup_name()
date:   4 months ago
config: riscv-randconfig-r025-20230321 (https://download.01.org/0day-ci/archive/20230321/202303212032.CO1xWeBX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60443c88f3a89fd303a9e8c0e84895910675c316
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 60443c88f3a89fd303a9e8c0e84895910675c316
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303212032.CO1xWeBX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_name: .text+0x94): relocation R_RISCV_PCREL_HI20 out of range: -524489 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
