Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516732CA2
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 19:54:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="217734110"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="217734110"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 11:54:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="746809997"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 03 Dec 2021 11:54:20 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtEdP-000HzB-UE; Fri, 03 Dec 2021 19:54:19 +0000
Date: Sat, 4 Dec 2021 03:54:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:x86/wip.extable 7/23] ld.lld: error: <inline
 asm>:25:2: macro 'extable_type_reg' is already defined
Message-ID: <202112040357.XMRvR7lC-lkp@intel.com>
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
head:   a6523800c05b6fcef2dc3629416b17a3924daef8
commit: e387d7349e3ea957ddc5315e4ae5dfbbe1c8af92 [7/23] x86/extable: Extend extable functionality
config: i386-randconfig-a015-20211203 (https://download.01.org/0day-ci/archive/20211204/202112040357.XMRvR7lC-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1e328b06c15273edf4a40a27ca24931b5efb3a87)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=e387d7349e3ea957ddc5315e4ae5dfbbe1c8af92
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.extable
        git checkout e387d7349e3ea957ddc5315e4ae5dfbbe1c8af92
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
