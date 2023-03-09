Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0E944D;
	Thu,  9 Mar 2023 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678364212; x=1709900212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWWdoEyc8Wby2+OzPIecWdq1GsQh68K4LLasDSEz8GY=;
  b=LzFTaEqA5e0qVMttVo03p5Xvk+7n4VkHgz+alht1qSHsQzNPY+oHyJJb
   KYyd5E66EBA/Rgf97s/exvX9qPuU3G3adryXuy6YMCUaj8mJygoP7DKEP
   V1pWMa/Qr2tFDFxVc545zbzrjbo+0CKADzowRvwixGKKsAzEUbdWw+XC8
   fCp0O/X6Hy6cVuXaMT+griWxRXbY+jFhz0nV8KTCPD7Qq0gZbAU1Iqz7/
   KnKjucuS+dgR6SJbKm60baWKYhVR20UVejq/lPqdA1GlBBuQZq6eXEFQI
   qn1olxn5CCIDxkWKr1wLWsgAREE8g4xYNe/qZMFLkpgSMsLzWBYaQx9cz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316825487"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="316825487"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:16:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="670701797"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="670701797"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Mar 2023 04:16:24 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paFC3-0002wD-1W;
	Thu, 09 Mar 2023 12:16:23 +0000
Date: Thu, 9 Mar 2023 20:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.03.06b 109/115]
 arch/powerpc/kernel/smp.c:1768:1: error: function declared 'noreturn' should
 not return
Message-ID: <202303092034.9F2rdy6x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.03.06b
head:   30ccfed62f5c0ac683aaa6fa4f573c112094fcc3
commit: 18e861a83a1b183551436f12bd3512c9eb42c369 [109/115] objtool: Fix for unreachable instruction warning
config: powerpc-randconfig-r026-20230308 (https://download.01.org/0day-ci/archive/20230309/202303092034.9F2rdy6x-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/18e861a83a1b183551436f12bd3512c9eb42c369
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2023.03.06b
        git checkout 18e861a83a1b183551436f12bd3512c9eb42c369
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303092034.9F2rdy6x-lkp@intel.com/

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
