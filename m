Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB801578
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644939663; x=1676475663;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2oO8/10MFcMCOYqNAD9cvhK5NMUVcVkLqj3qdOkyTT8=;
  b=KwdzmqTy64Gg6jXAH4jdFGcQBAO66YHjqDv6CQjIrz0h0aXlmyg39rVX
   UBtX80FwdRXTQFCLYas0LtZy3/pglBR2U5PXlYqY5b6cQ2C4DgM0oe++3
   EJQ6uKUa/VZFCxL+43myEttC/qhpXZNAF1b2pP/m0ca/b3j+KzR+rjXwo
   FpNcRrRJYO2on3aUQdhtEr1rHKKbIcIaTw3mfn+rUP4jAna8JlAmkT7+c
   3GoevJEYtidq+Nl1OpF4fApnPoo/CAXiA+tT6LobLtcdvD61leES/ng1Q
   JgOYFyWYfB8BcA0jWO4FNL+zY0x8SeOSz8ksR1HFkb73eqA9EIbZh+UGS
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250320828"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="250320828"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 07:40:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="497244038"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 Feb 2022 07:40:53 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJzwi-0009nv-TC; Tue, 15 Feb 2022 15:40:52 +0000
Date: Tue, 15 Feb 2022 23:39:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [intel-tdx:guest-rebased 128/133] arch/x86/kernel/head_64.o:
 warning: objtool: verify_cpu()+0x4d: unreachable instruction
Message-ID: <202202152337.dgk9Lm8b-lkp@intel.com>
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
TO: Andi Kleen <ak@linux.intel.com>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-rebased
head:   36c91f6d572820e8556972fd7644bd96798e85d6
commit: fc9eb9756100201dbc23d220d3441115866085c8 [128/133] [REVERTME] x86/tdx: Add CONFIG option for KVM SDV workarounds
config: x86_64-randconfig-a002-20220214 (https://download.01.org/0day-ci/archive/20220215/202202152337.dgk9Lm8b-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/fc9eb9756100201dbc23d220d3441115866085c8
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-rebased
        git checkout fc9eb9756100201dbc23d220d3441115866085c8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: verify_cpu()+0x4d: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
