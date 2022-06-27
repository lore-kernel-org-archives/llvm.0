Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D31D28FA
	for <llvm@lists.linux.dev>; Mon, 27 Jun 2022 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656328065; x=1687864065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6rwdHFF52k+xabp3OLMNBI3sQL2uGp9TydT3JzKwxq4=;
  b=R11tNq9Xm8MIu3glfWtggevGaTgqgXYajH9FZIDP6tLjnPOpVZfbM4ab
   r72C2DdBkB1glldbVvpV6kAfQTOIr4BjRfLu7j0lY4EhpuFNFzEycZLmK
   P8Qc92lC5LNoBb8IVgC7V26kdcWSUoI+7L6NUZn0ZSsGET0lU5ZtbngzH
   3SgjPBYG7anuAwcM3KXpAsYuD5tmxRY8deHNRAI3PuEEaq1hSXLybixUl
   zpMIq6SHXTVjH/tENW1tdc8b/zx8/sBMs8VG+TZGkrRT347a9p08V8fRh
   wgoagJm7xhSxg9N5oQiZhgup/6JZf8basosVVRI9rYWrK7xm4FYFF44iE
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="282158189"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="282158189"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 04:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="646385258"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jun 2022 04:07:43 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5mak-0008Sp-JA;
	Mon, 27 Jun 2022 11:07:42 +0000
Date: Mon, 27 Jun 2022 19:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: arch/arm/mach-versatile/versatile.c:56:14: warning: no previous
 prototype for function 'mmc_status'
Message-ID: <202206271917.3F0ogBzt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   03c765b0e3b4cb5063276b086c76f7a612856a9a
commit: d7445676e86900f8dc363825033ff62416c216e0 ARM: versatile: move integrator/realview/vexpress to versatile
date:   3 months ago
config: arm-multi_v5_defconfig (https://download.01.org/0day-ci/archive/20220627/202206271917.3F0ogBzt-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 016342e319fd31e41cf5ed16a6140a8ea2de74dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d7445676e86900f8dc363825033ff62416c216e0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d7445676e86900f8dc363825033ff62416c216e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-versatile/versatile.c:56:14: warning: no previous prototype for function 'mmc_status' [-Wmissing-prototypes]
   unsigned int mmc_status(struct device *dev)
                ^
   arch/arm/mach-versatile/versatile.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int mmc_status(struct device *dev)
   ^
   static 
   1 warning generated.


vim +/mmc_status +56 arch/arm/mach-versatile/versatile.c

a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  55  
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08 @56  unsigned int mmc_status(struct device *dev)
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  57  {
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  58  	struct amba_device *adev = container_of(dev, struct amba_device, dev);
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  59  	u32 mask;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  60  
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  61  	if (adev->res.start == VERSATILE_MMCI0_BASE)
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  62  		mask = 1;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  63  	else
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  64  		mask = 2;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  65  
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  66  	return readl(versatile_sys_base + VERSATILE_SYS_MCI_OFFSET) & mask;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  67  }
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  68  

:::::: The code at line 56 was first introduced by commit
:::::: a70967892111934e292485ce84f1bab38cc55380 ARM: versatile: merge mach code into a single file

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
