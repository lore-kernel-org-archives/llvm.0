Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A07E
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 05:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658641843; x=1690177843;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PlQ7gVZFBZEgVrn37gS/bBB8s2ImEhBSVWBCzP/XtBY=;
  b=DOfRxbCYjxm2zSvYE/NrhSFkx9x2P/KlXmYt3VvNJca6WIWu3fpdAWQE
   +9o5+eNflkmHhe+o5HTyYYTZVR4bQ0DxXtXYcPif9OjTzM9emewOyqrn3
   8Oy9EXFXlJ8HPluwKh4+jqIbz9FAH12tlfD7JgRics4Mq9ACtu7WqP2+Z
   WilQAsywaF65e+YHwRpvSxiY4cVGSED0ScrBK52VWG6mWgI14Z+/x8xFJ
   UypZMzO8UXlZSy6tBF5L543TV1GN2bRvCvwoBGK8eaaU2qwNfJU9tAmpy
   CT+hfnqnGxnfIwkIjOwD2HomrXlyx6p9eb6KgpaTC1TKystggxCG2Lc1i
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10417"; a="351512065"
X-IronPort-AV: E=Sophos;i="5.93,189,1654585200"; 
   d="scan'208";a="351512065"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2022 22:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,189,1654585200"; 
   d="scan'208";a="657721077"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jul 2022 22:50:41 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFUVl-0003c5-0q;
	Sun, 24 Jul 2022 05:50:41 +0000
Date: Sun, 24 Jul 2022 13:50:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
Message-ID: <202207241307.h8S5rqpj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>

Hi Tiezhu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   515f71412bb73ebd7f41f90e1684fc80b8730789
commit: 048cc2378c2494519d940597629465b3ea44a96f MIPS: SGI-IP22: Remove unnecessary check of GCC option
date:   7 months ago
config: mips-ip28_defconfig (https://download.01.org/0day-ci/archive/20220724/202207241307.h8S5rqpj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dd5635541cd7bbd62cd59b6694dfb759b6e9a0d8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=048cc2378c2494519d940597629465b3ea44a96f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 048cc2378c2494519d940597629465b3ea44a96f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
   make[2]: *** [scripts/Makefile.build:121: kernel/bounds.s] Error 1
   make[2]: Target 'missing-syscalls' not remade because of errors.
   make[1]: *** [arch/mips/Makefile:415: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
