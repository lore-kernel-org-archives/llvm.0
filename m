Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66285CA8
	for <llvm@lists.linux.dev>; Sun, 20 Feb 2022 11:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645358380; x=1676894380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gkh/Fm/JdPiXSYvQ/h8G+gEBnhiqCo/G2YHhv5hjl04=;
  b=K+kElnXm310ZNTszFnfaZIpXWe3NN6oxGGRAfCNOz/E4BgBnPQf982Fo
   HIvfKIrSY9UceeuHN3dnx3saer0/WqPtDNPpte7H2AHj/mG2xFA7BhHdL
   dh4NdH+9quOur/QUH9OmRzjwhpCYjksQF/JSv3e8vglAbfuyKe5NwgxpH
   M6+wxcv3ImSyEArvbP6kjZxZwze+hnnT9lt2e7zEucZVsIUiw0PBq0+ik
   T+tpuz1wqvharnrS8YjQ3dyu5bSncKpP9JxW3/zQPxAppdDOUwRYfX30T
   Vs0agoEgx9f+x/HElxBWU54p2TXS31pyB6/dEXQKpmb62iVxox8+6LHLu
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10263"; a="238778201"
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="238778201"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 03:59:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="682933606"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2022 03:59:38 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nLksL-0000JO-Gq; Sun, 20 Feb 2022 11:59:37 +0000
Date: Sun, 20 Feb 2022 19:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/alchemy/board-gpr.c:78:13: warning: no previous prototype
 for function 'board_setup'
Message-ID: <202202201926.pBXsd3i7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4f12b742eb2b3a850ac8be7dc4ed52976fc6cb0b
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
date:   1 year, 5 months ago
config: mips-randconfig-r016-20220220 (https://download.01.org/0day-ci/archive/20220220/202202201926.pBXsd3i7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c434b9f80b0923e6460031b0fd964f8b0bf3c6a6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c434b9f80b0923e6460031b0fd964f8b0bf3c6a6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/alchemy/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/mips/alchemy/board-gpr.c:78:13: warning: no previous prototype for function 'board_setup' [-Wmissing-prototypes]
   void __init board_setup(void)
               ^
   arch/mips/alchemy/board-gpr.c:78:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init board_setup(void)
   ^
   static 
   1 warning generated.


vim +/board_setup +78 arch/mips/alchemy/board-gpr.c

8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  77  
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10 @78  void __init board_setup(void)
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  79  {
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  80  	printk(KERN_INFO "Trapeze ITS GPR board\n");
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  81  
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  82  	pm_power_off = gpr_power_off;
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  83  	_machine_halt = gpr_power_off;
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  84  	_machine_restart = gpr_reset;
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  85  
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  86  	/* Enable UART1/3 */
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  87  	alchemy_uart_enable(AU1000_UART3_PHYS_ADDR);
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  88  	alchemy_uart_enable(AU1000_UART1_PHYS_ADDR);
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  89  
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  90  	/* Take away Reset of UMTS-card */
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  91  	alchemy_gpio_direction_output(215, 1);
8e026910fcd46c3 arch/mips/alchemy/board-gpr.c    Manuel Lauss        2011-11-10  92  }
cb8f55b9207df96 arch/mips/alchemy/gpr/platform.c Wolfgang Grandegger 2010-07-15  93  

:::::: The code at line 78 was first introduced by commit
:::::: 8e026910fcd46c3cfcdf5cff7ebba013bb8ec85c MIPS: Alchemy: merge GPR/MTX-1/XXS1500 board code into single files

:::::: TO: Manuel Lauss <manuel.lauss@googlemail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
