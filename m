Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DAA1843
	for <llvm@lists.linux.dev>; Sun, 10 Apr 2022 22:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649631214; x=1681167214;
  h=date:from:cc:subject:message-id:mime-version;
  bh=O8t8NBm5g/PCdD4t0srsqk2jc0slf8BtZeXNBlw4OZk=;
  b=ZIownpa/qbBoFAVCVLbLr36X5vxQkQ+tt3XCWD+lilfHe09zV+zOUsiF
   MNTh7xhBpLA7/KRptDHrbgM1pQ0tVCVolmxYqQfH5P/xZMHhT/8dxSliX
   JIblYm8YgselKgZpDRPQoriDTcnh+QZhVOcK/dZ5DcUdAbaRsBsyFhcp+
   H4KFCQfhXsk4iLAxiKTkb4sE1BcR9V8JSWJc0gtKlk4SAzpeeSN0zjIFT
   cGaBYZ0s+5kn03bgOBT3B9U8BDJuNxM056llBxKwRQdcRBhd/NThZAiXr
   8r6nS/c2ss+XRdqG4pDhU6JxGDMZNW05W2tgX1yDlgViFT2uUqjXw3JPM
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="262181356"
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="262181356"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2022 15:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="506881066"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Apr 2022 15:53:33 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndgR2-0001AI-Kh;
	Sun, 10 Apr 2022 22:53:32 +0000
Date: Mon, 11 Apr 2022 06:53:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ogabbay:habanalabs-next 23/28] ld.lld: error:
 arch/riscv/built-in.a(kernel/process.o):(function __show_regs: .text+0x38):
 relocation R_RISCV_HI20 out of range: 534715 is not in [-524288, 524287];
 references .L.str
Message-ID: <202204110619.rY81PMIm-lkp@intel.com>
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
TO: Dafna Hirschfeld <dhirschfeld@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git habanalabs-next
head:   7346c0c6a3e0127c1d50473df90d201aeaaaa0bc
commit: 85dffad021521ff2851a7800ff3f66c40309870a [23/28] habanalabs: unify code for memory access from debugfs
config: riscv-buildonly-randconfig-r004-20220410 (https://download.01.org/0day-ci/archive/20220411/202204110619.rY81PMIm-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 256c6b0ba14e8a7ab6373b61b7193ea8c0a3651c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git/commit/?id=85dffad021521ff2851a7800ff3f66c40309870a
        git remote add ogabbay https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git
        git fetch --no-tags ogabbay habanalabs-next
        git checkout 85dffad021521ff2851a7800ff3f66c40309870a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/process.o):(function __show_regs: .text+0x38): relocation R_RISCV_HI20 out of range: 534715 is not in [-524288, 524287]; references .L.str
   >>> referenced by process.c
   >>> defined in arch/riscv/built-in.a(kernel/process.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
