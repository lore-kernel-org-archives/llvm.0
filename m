Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0792F2C9D
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 18:54:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237468918"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="237468918"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 10:54:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="502719229"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 07 Dec 2021 10:54:11 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mufbO-000MsR-UU; Tue, 07 Dec 2021 18:54:10 +0000
Date: Wed, 8 Dec 2021 02:53:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.15.y 14/1649] ld.lld: error:
 init/built-in.a(main.o):(function trace_event_raw_event_initcall_level:
 .text+0x190): relocation R_RISCV_HI20 out of range: 528284 is not in
 [-524288, 524287]; references __stack_chk_guard
Message-ID: <202112080235.qWx8fmbC-lkp@intel.com>
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
TO: Paolo Bonzini <pbonzini@redhat.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   47c02c404f4a01320618263ee704576959e3de43
commit: 26ac7dec7ff00704e31e91d35d5ebf4a8a7cc1e9 [14/1649] KVM: x86: avoid warning with -Wbitwise-instead-of-logical
config: riscv-buildonly-randconfig-r005-20211207 (https://download.01.org/0day-ci/archive/20211208/202112080235.qWx8fmbC-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=26ac7dec7ff00704e31e91d35d5ebf4a8a7cc1e9
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout 26ac7dec7ff00704e31e91d35d5ebf4a8a7cc1e9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(main.o):(function trace_event_raw_event_initcall_level: .text+0x190): relocation R_RISCV_HI20 out of range: 528284 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by main.c
   >>> defined in arch/riscv/built-in.a(kernel/process.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function perf_trace_initcall_level: .text+0x314): relocation R_RISCV_HI20 out of range: 528284 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by main.c
   >>> defined in arch/riscv/built-in.a(kernel/process.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
