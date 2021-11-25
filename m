Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652D72
	for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 11:57:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="296307660"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="296307660"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 03:57:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="607551267"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Nov 2021 03:57:35 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqDNe-0006J8-7i; Thu, 25 Nov 2021 11:57:34 +0000
Date: Thu, 25 Nov 2021 19:57:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [android-common:android-4.19-stable 1/23] crypto/blake2b_generic.o:
 warning: objtool: gelf_getehdr: invalid `Elf' handle
Message-ID: <202111251907.brTWxUOr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   e9f2289a4bf1ec79a40d9f77e5acb882f2e871fa
commit: e4c224108bce80f42b55f000c41841aa2fa8f963 [1/23] BACKPORT: crypto: blake2b - add blake2b generic implementation
config: x86_64-randconfig-a012-20211102 (https://download.01.org/0day-ci/archive/20211125/202111251907.brTWxUOr-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 264d3b6d4e08401c5b50a85bd76e80b3461d77e6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout e4c224108bce80f42b55f000c41841aa2fa8f963
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> crypto/blake2b_generic.o: warning: objtool: gelf_getehdr: invalid `Elf' handle

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for STACK_VALIDATION
   Depends on HAVE_STACK_VALIDATION
   Selected by
   - UNWINDER_ORC && <choice> && X86_64

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
