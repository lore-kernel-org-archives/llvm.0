Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C9017FF;
	Sat, 25 Feb 2023 07:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677309984; x=1708845984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BRjTA9V6iuE2Exwt9BG55QU65YfQyo7MMt/3FzLiHhQ=;
  b=dCEaLzYXUPC4P4MI7yP4mIUjc3jPPL+49qo7vhwrUPm2Uj34rxah+jaV
   gsk5PXna+WWLZqF/NmVt0u34bGuPL4AyYmDCkgc3LVdNyfACENOluut0D
   kODRgWBSYHQT6C2KoxfioK1xCyvJ+iKAyt5uShuBN7kJj3RqurYv0hy44
   w6U5vW8E/k2BXClpCDV5PovzDg6vYaDozjepHWcz9Xkee7Uw95BtI+6jp
   zCqWZ2zHnPnvtPRsUaDxQtZ8s4/sDw5/RiEf51ivLkeD9lXKMiKDOEq5x
   pHnpPDG9OmwF8/6iYCcANLXotBBBTPZmFnHKXnB6mmPy3qJsP5EQwP0k7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="332330513"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="332330513"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 23:26:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="796980998"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="796980998"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Feb 2023 23:26:22 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVown-00031X-1N;
	Sat, 25 Feb 2023 07:26:21 +0000
Date: Sat, 25 Feb 2023 15:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.02.22a 85/86]
 arch/powerpc/kernel/smp.c:1768:1: error: function declared 'noreturn' should
 not return
Message-ID: <202302251550.OSl3zbgK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.02.22a
head:   edc9d419ee8c22821ffd664466a5cf19208c3f02
commit: a680938f32b0e2006c3d88bce7eba21636f957e8 [85/86] objtool: Fix for unreachable instruction warning
config: powerpc-buildonly-randconfig-r004-20230222 (https://download.01.org/0day-ci/archive/20230225/202302251550.OSl3zbgK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/a680938f32b0e2006c3d88bce7eba21636f957e8
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2023.02.22a
        git checkout a680938f32b0e2006c3d88bce7eba21636f957e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251550.OSl3zbgK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/smp.c:1768:1: error: function declared 'noreturn' should not return [-Werror,-Winvalid-noreturn]
   }
   ^
   1 error generated.


vim +/noreturn +1768 arch/powerpc/kernel/smp.c

d0174c721900ff Nathan Fontenot        2010-01-14  1754  
1ea21ba231f248 Michael Ellerman       2020-08-19  1755  void arch_cpu_idle_dead(void)
1ea21ba231f248 Michael Ellerman       2020-08-19  1756  {
424ef0160f439f Naveen N. Rao          2018-04-19  1757  	/*
424ef0160f439f Naveen N. Rao          2018-04-19  1758  	 * Disable on the down path. This will be re-enabled by
424ef0160f439f Naveen N. Rao          2018-04-19  1759  	 * start_secondary() via start_secondary_resume() below
424ef0160f439f Naveen N. Rao          2018-04-19  1760  	 */
424ef0160f439f Naveen N. Rao          2018-04-19  1761  	this_cpu_disable_ftrace();
424ef0160f439f Naveen N. Rao          2018-04-19  1762  
39f87561454dc3 Michael Ellerman       2020-08-19  1763  	if (smp_ops->cpu_offline_self)
39f87561454dc3 Michael Ellerman       2020-08-19  1764  		smp_ops->cpu_offline_self();
fa3f82c8bb7acb Benjamin Herrenschmidt 2011-02-10  1765  
fa3f82c8bb7acb Benjamin Herrenschmidt 2011-02-10  1766  	/* If we return, we re-enter start_secondary */
fa3f82c8bb7acb Benjamin Herrenschmidt 2011-02-10  1767  	start_secondary_resume();
abb17f9c3a92c5 Milton Miller          2010-05-19 @1768  }
fa3f82c8bb7acb Benjamin Herrenschmidt 2011-02-10  1769  

:::::: The code at line 1768 was first introduced by commit
:::::: abb17f9c3a92c5acf30e749efdf0419b7f50a5b8 powerpc: Use common cpu_die (fixes SMP+SUSPEND build)

:::::: TO: Milton Miller <miltonm@bga.com>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
