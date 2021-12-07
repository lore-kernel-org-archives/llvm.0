Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEFE2C80
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 11:53:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237502060"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="237502060"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 03:53:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="515246946"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 07 Dec 2021 03:53:54 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1muZ2f-000MWc-Mn; Tue, 07 Dec 2021 11:53:53 +0000
Date: Tue, 7 Dec 2021 19:53:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:x86/wip.extable 7/23] ld.lld: error: <inline
 asm>:25:2: macro 'extable_type_reg' is already defined
Message-ID: <202112071910.YXubR9XE-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: Josh Poimboeuf <jpoimboe@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/wip.extable
head:   485bf89d41f9ff16ccd1c372999dfd760ba3b614
commit: 35f57a104f52859f42ab8c182c109136eb3c3d3f [7/23] x86/extable: Extend extable functionality
config: i386-randconfig-r023-20211207 (https://download.01.org/0day-ci/archive/20211207/202112071910.YXubR9XE-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=35f57a104f52859f42ab8c182c109136eb3c3d3f
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.extable
        git checkout 35f57a104f52859f42ab8c182c109136eb3c3d3f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: <inline asm>:25:2: macro 'extable_type_reg' is already defined
   .macro extable_type_reg type:req reg:req
   ^

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
