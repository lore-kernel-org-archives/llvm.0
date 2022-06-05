Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD6910F2
	for <llvm@lists.linux.dev>; Sun,  5 Jun 2022 00:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654388000; x=1685924000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tjCLWlnDd1xOelaMV0Mv+df88jS7FOL8Fp/HZ2+wZzY=;
  b=mXZ3REecJnQHJeUPtavyvRwJPr8Zd5hkCqua7b1UZnmJTKCPWlTvPxmO
   OiUwdKyflbY/X2pUaKjhFiJW5fTypMm82OWE2IMdBgMFlvysJa4j4znmU
   D1BygJuTQkPf9jyZZC6tzMbhyQkF1NE8COopIx/1imjAxtUk0wU81Ep8N
   tvRKy4DK0AM5Ta0a5tVmZ800ewRHrL954aGq0CodK8Ln4UmrN7/KEI1Mx
   RgC5pEBFrTq45W0ePr6tBEnQoWjBz+cGd9284r48nYY/lMOxUybbF3JxD
   MS02C7GgNO0NZUINbPSz8bUuo0wZikHLTV5u9Gq7Y94H2wI0cQnLqtlB/
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10368"; a="339559444"
X-IronPort-AV: E=Sophos;i="5.91,278,1647327600"; 
   d="scan'208";a="339559444"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2022 17:13:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,278,1647327600"; 
   d="scan'208";a="906001734"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Jun 2022 17:13:18 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxdtN-000BIk-Es;
	Sun, 05 Jun 2022 00:13:17 +0000
Date: Sun, 5 Jun 2022 08:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: arch/arm/mach-omap2/board-generic.c:44:6: warning: no previous
 prototype for function 'tick_broadcast'
Message-ID: <202206050825.OuexWb2X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   032dcf09e2bf7c822be25b4abef7a6c913870d98
commit: 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8 ARM: dove: multiplatform support
date:   9 weeks ago
config: arm-randconfig-r002-20220605 (https://download.01.org/0day-ci/archive/20220605/202206050825.OuexWb2X-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b72c432d70aae035727ece4ba80ce820f381)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-omap2/board-generic.c:44:6: warning: no previous prototype for function 'tick_broadcast' [-Wmissing-prototypes]
   void tick_broadcast(const struct cpumask *mask)
        ^
   arch/arm/mach-omap2/board-generic.c:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tick_broadcast(const struct cpumask *mask)
   ^
   static 
   1 warning generated.


vim +/tick_broadcast +44 arch/arm/mach-omap2/board-generic.c

e69b4e1a7577c1 Tony Lindgren 2020-05-07  41  
d86ad463d6706d Tony Lindgren 2020-05-28  42  /* Used by am437x for ARM timer in non-SMP configurations */
d86ad463d6706d Tony Lindgren 2020-05-28  43  #if !defined(CONFIG_SMP) && defined(CONFIG_GENERIC_CLOCKEVENTS_BROADCAST)
d86ad463d6706d Tony Lindgren 2020-05-28 @44  void tick_broadcast(const struct cpumask *mask)
d86ad463d6706d Tony Lindgren 2020-05-28  45  {
d86ad463d6706d Tony Lindgren 2020-05-28  46  }
d86ad463d6706d Tony Lindgren 2020-05-28  47  #endif
d86ad463d6706d Tony Lindgren 2020-05-28  48  

:::::: The code at line 44 was first introduced by commit
:::::: d86ad463d6706d35167418660ae3293207ee9d1c ARM: OMAP2+: Fix regression for using local timer on non-SMP SoCs

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
