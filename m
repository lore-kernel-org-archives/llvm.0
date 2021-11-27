Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A5572
	for <llvm@lists.linux.dev>; Sat, 27 Nov 2021 06:48:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="222973186"
X-IronPort-AV: E=Sophos;i="5.87,268,1631602800"; 
   d="scan'208";a="222973186"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 22:48:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,268,1631602800"; 
   d="scan'208";a="510916817"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 26 Nov 2021 22:48:43 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqrVq-0009Bs-Eo; Sat, 27 Nov 2021 06:48:42 +0000
Date: Sat, 27 Nov 2021 14:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoming Ni <nixiaoming@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:20211124-sysctl-cleanups-v2 41/41]
 kernel/kprobes.c:2605:2: error: implicit declaration of function
 'kprobe_sysctls_init'
Message-ID: <202111271451.VDtFz59Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20211124-sysctl-cleanups-v2
head:   c66aee3b7120f4a5f1d40cc9109dcf684643cc17
commit: c66aee3b7120f4a5f1d40cc9109dcf684643cc17 [41/41] kprobe: move sysctl_kprobes_optimization to kprobes.c
config: arm64-randconfig-r006-20211126 (https://download.01.org/0day-ci/archive/20211127/202111271451.VDtFz59Q-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b558d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=c66aee3b7120f4a5f1d40cc9109dcf684643cc17
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next 20211124-sysctl-cleanups-v2
        git checkout c66aee3b7120f4a5f1d40cc9109dcf684643cc17
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/kprobes.c:2605:2: error: implicit declaration of function 'kprobe_sysctls_init' [-Werror,-Wimplicit-function-declaration]
           kprobe_sysctls_init();
           ^
   1 error generated.


vim +/kprobe_sysctls_init +2605 kernel/kprobes.c

  2597	
  2598		err = arch_init_kprobes();
  2599		if (!err)
  2600			err = register_die_notifier(&kprobe_exceptions_nb);
  2601		if (!err)
  2602			err = register_module_notifier(&kprobe_module_nb);
  2603	
  2604		kprobes_initialized = (err == 0);
> 2605		kprobe_sysctls_init();
  2606		return err;
  2607	}
  2608	early_initcall(init_kprobes);
  2609	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
